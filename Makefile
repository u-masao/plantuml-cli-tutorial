
PNGDIR := build
UMLDIR := docs
UMLS := $(wildcard $(UMLDIR)/*.uml)
PNGS := $(addprefix $(PNGDIR)/,$(patsubst %.uml,%.png,$(subst $(UMLDIR)/,,$(UMLS))))


.PHONY: all
all: $(PNGS)

$(PNGDIR)/%.png:$(UMLDIR)/%.uml
	@if [ ! -e `dirname $@` ]; then mkdir -p `dirname $@`; fi
	java -jar jar/plantuml.jar -tpng -o ../build -c $<

environment:
	@if [ ! -e jar ]; then mkdir -p jar; fi
	wget https://sourceforge.net/projects/plantuml/files/plantuml.jar/download \
        -O jar/plantuml.jar 

clean:
	rm -f $(PNGDIR)/*.png
