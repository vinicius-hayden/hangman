require 'io/console'

loop do 
  palavra = 'impossivel'
  forca = Array.new(palavra.chars.length)
  tentativas_restantes = 6
  dados_digitados = []

  for i in 0..(forca.length-1)
    forca[i] = '_'
  end
  letra_informada = nil
  letra_ja_digitada = false
  encontrou_letra = false
  primeira_tentativa = true
  while tentativas_restantes > 0 and forca != palavra.chars
    puts "\e[H\e[2J"
    puts ("\nTENTATIVAS RESTANTES: #{tentativas_restantes}")
    
    for i in 0..(forca.length-1)
      print("#{forca[i]} ")
    end
    puts ("")
    puts ("")
    if letra_ja_digitada
      puts ("Letra já informada anteriormente.")
    end
    
    if not primeira_tentativa
      if not encontrou_letra 
        puts ("A palavra não possui essa letra.")
      elsif encontrou_letra
        puts ("Letra encontrada!")
      end
    else
      primeira_tentativa = false
    end
    puts ("Você informou: #{letra_informada}") if letra_informada 
    puts ("Letras já informadas: #{dados_digitados.sort}")
    puts ("")
    print("Digite aqui a letra desejada: ")
    letra_informada = STDIN.getch
    puts ("")
    letra_ja_digitada = false
    if dados_digitados.include?(letra_informada) == true
      letra_ja_digitada = true
    else
      dados_digitados << letra_informada
      encontrou_letra = false
      for i in 0..(palavra.chars.length-1)
        if letra_informada == palavra.chars[i]
          posicao = i 
          forca[posicao] = letra_informada
          encontrou_letra = true
        end
      end

      if not encontrou_letra 
        tentativas_restantes = tentativas_restantes - 1
      end
    end

  end
  
  puts ("Fim de Jogo")
  if tentativas_restantes > 0
    print ("Você ganhou! ")
  else 
    print ("Você perdeu! A palavra era: #{palavra}")
  end

  puts ("\nDeseja refazer denovo? (s/n)")
  continuidade = STDIN.getch
  if continuidade == 'n'
    break
  end
  
end




