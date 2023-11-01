Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A387DE496
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 17:29:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626531.976835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyE5W-00046c-D0; Wed, 01 Nov 2023 16:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626531.976835; Wed, 01 Nov 2023 16:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyE5W-00044J-8u; Wed, 01 Nov 2023 16:29:02 +0000
Received: by outflank-mailman (input) for mailman id 626531;
 Wed, 01 Nov 2023 16:29:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NXV=GO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qyE5U-00044D-PT
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 16:29:00 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c285de0c-78d3-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 17:28:59 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40850b244beso53882005e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Nov 2023 09:28:59 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c4b1600b0040303a9965asm228177wmp.40.2023.11.01.09.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 09:28:57 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c285de0c-78d3-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698856138; x=1699460938; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9bPV1lGgzrmV6Yr+MwSqchQHz7SQm0nDrDHBI+kvjhk=;
        b=ACItsfYIAECoPy9BFBYt0ZxwVXnGmwZPCxv7Jw747aqqrvk49VzQJeqgjxEQQKHWxi
         4CGHkMazEils7z1sIiR40WwCyRzk84lnqKFWHp8vd33c53EMD0fWlJ2Jk4VLv7n2AUg+
         4C1BmyT5pymr+XA96+yX2hZ5D3d5pL16O+bak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698856138; x=1699460938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9bPV1lGgzrmV6Yr+MwSqchQHz7SQm0nDrDHBI+kvjhk=;
        b=qocJ39r1e9y0sEegHgqlSP9P1v3aCuGXsuPU309eFExpk147sZkTihe1fQRS6YmaoZ
         zM8Nu2wum/IZDkxze3QEVgQzUFL8gwpsRc1Q7ois3ztEgtOV1D+sp0QZYmE2pBLGAI2S
         1LxIg0vf+aPAM5bmO1RyuNgQnXL8hk/TyuEhi53ANfpwckogVlfr5jItCkRFNffsDd8X
         QXMl93lhvZ/P+W2SMUo5j2UGG6MEvHDzXaZ5KrakOQriFP3/il4GzOWpug1u6ioBkB1h
         xe172iI9VE+qlD1rRSb99FDMCLfzc/0vGoUK65Pggqcg8AHQkPraKv+doWpPfzNBBGRf
         fG8g==
X-Gm-Message-State: AOJu0YyH/JA2RebeH9pUmokUrBD+lCGMXcYl2cyaGbfpOmigTPEDxjLy
	kDdoD5s0X+jLaUNc7n6EgGt06g==
X-Google-Smtp-Source: AGHT+IGJZ7uPGHzdIRRR5BtoIePv/AMxKPnDvwDES8ch0jUD/IP40Snqk28RqeUGWNAFacdQQcFDow==
X-Received: by 2002:a05:600c:45ca:b0:408:4f5d:eeb2 with SMTP id s10-20020a05600c45ca00b004084f5deeb2mr14286765wmo.20.1698856137661;
        Wed, 01 Nov 2023 09:28:57 -0700 (PDT)
Message-ID: <1b305c81-6f32-41d5-8757-f50c27e8a08d@citrix.com>
Date: Wed, 1 Nov 2023 16:28:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] stubdom: remove caml-stubdom
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Edwin Torok <edvin.torok@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Rob Hoes <Rob.Hoes@citrix.com>
References: <20231101160837.32241-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231101160837.32241-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/11/2023 4:08 pm, Juergen Gross wrote:
> In order to build caml-stubdom, it must be explicitly enabled via
> "configure --enable-caml-stubdom". The build process is failing due to
> stubdom/ocaml.patch failing to apply. Since the patched file has been
> modified in 2014 the last time, it seems nobody cares for caml-stubdom
> since at least then.
>
> Remove caml-stubdom from the build system.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

CC-ing some of the Ocaml folks just in case, but I expect that this
functionality has been entirely superseded by MirageOS and/or Solo5.

Also, hunk to the Removed section of CHANGELOG.md please (can be fixed
on commit if no other changes are needed.)

~Andrew

> ---
>  stubdom/Makefile         | 51 ------------------------------------
>  stubdom/caml/Makefile    | 24 -----------------
>  stubdom/caml/hello.ml    |  4 ---
>  stubdom/caml/main-caml.c | 42 ------------------------------
>  stubdom/caml/minios.cfg  |  0
>  stubdom/configure        | 56 ----------------------------------------
>  stubdom/configure.ac     |  2 --
>  stubdom/ocaml.patch      | 19 --------------
>  8 files changed, 198 deletions(-)
>  delete mode 100644 stubdom/caml/Makefile
>  delete mode 100644 stubdom/caml/hello.ml
>  delete mode 100644 stubdom/caml/main-caml.c
>  delete mode 100644 stubdom/caml/minios.cfg
>  delete mode 100644 stubdom/ocaml.patch
>
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 0ddfce1ba2..27a18a9e33 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -257,37 +257,6 @@ $(TPMEMU_STAMPFILE): tpm_emulator-$(XEN_TARGET_ARCH) $(GMP_STAMPFILE)
>  .PHONY: cross-tpmemu
>  cross-tpmemu: $(TPMEMU_STAMPFILE)
>  
> -#############
> -# Cross-ocaml
> -#############
> -
> -CAMLLIB = $(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf/lib/ocaml
> -OCAML_STAMPFILE=$(CAMLLIB)/.dirstamp
> -
> -ocaml-$(OCAML_VERSION).tar.gz:
> -	$(FETCHER) $@ $(OCAML_URL)/$@
> -
> -ocaml-$(XEN_TARGET_ARCH)/.dirstamp: ocaml-$(OCAML_VERSION).tar.gz ocaml.patch
> -	tar xzf $<
> -	cd ocaml-$(OCAML_VERSION) && patch -p0 < ../ocaml.patch
> -	rm -rf ocaml-$(XEN_TARGET_ARCH)
> -	mv ocaml-$(OCAML_VERSION) ocaml-$(XEN_TARGET_ARCH)
> -	touch $@
> -
> -MINIOS_HASNOT=IPV6 INET_ATON
> -
> -.PHONY: cross-ocaml
> -cross-ocaml: $(OCAML_STAMPFILE)
> -$(OCAML_STAMPFILE): ocaml-$(XEN_TARGET_ARCH)/.dirstamp
> -	cd ocaml-$(XEN_TARGET_ARCH) &&  ./configure -prefix $(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf \
> -		-no-pthread -no-shared-libs -no-tk -no-curses \
> -		-cc "$(CC) -U_FORTIFY_SOURCE -fno-stack-protector -mno-red-zone"
> -	$(foreach i,$(MINIOS_HASNOT),sed -i 's,^\(#define HAS_$(i)\),//\1,' ocaml-$(XEN_TARGET_ARCH)/config/s.h ; )
> -	$(MAKE) DESTDIR= -C ocaml-$(XEN_TARGET_ARCH) world
> -	$(MAKE) DESTDIR= -C ocaml-$(XEN_TARGET_ARCH) opt
> -	$(MAKE) -C ocaml-$(XEN_TARGET_ARCH) install
> -	touch $@
> -
>  #######
>  # Links
>  #######
> @@ -419,17 +388,6 @@ ioemu: cross-zlib cross-libpci libxenguest ioemu-minios-config.mk
>  	    $(QEMU_ROOT)/xen-setup-stubdom )
>  	$(MAKE) DESTDIR= -C ioemu -f $(QEMU_ROOT)/Makefile
>  
> -######
> -# caml
> -######
> -
> -caml-minios-config.mk: $(CURDIR)/caml/minios.cfg
> -	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
> -
> -.PHONY: caml
> -caml: $(CROSS_ROOT)
> -	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat caml-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C $@ LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) OCAMLC_CROSS_PREFIX=$(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf/bin/
> -
>  ###
>  # C
>  ###
> @@ -516,10 +474,6 @@ ioemu-stubdom: APP_OBJS=$(CURDIR)/ioemu/i386-stubdom/qemu.a $(CURDIR)/ioemu/i386
>  ioemu-stubdom: mini-os-$(XEN_TARGET_ARCH)-ioemu lwip-$(XEN_TARGET_ARCH) libxenguest ioemu
>  	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/ioemu-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS="$(APP_OBJS)"
>  
> -.PHONY: caml-stubdom
> -caml-stubdom: mini-os-$(XEN_TARGET_ARCH)-caml lwip-$(XEN_TARGET_ARCH) libxenguest cross-ocaml caml
> -	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/caml/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS="$(CURDIR)/caml/main-caml.o $(CURDIR)/caml/caml.o $(CAMLLIB)/libasmrun.a"
> -
>  .PHONY: c-stubdom
>  c-stubdom: mini-os-$(XEN_TARGET_ARCH)-c lwip-$(XEN_TARGET_ARCH) libxenguest c
>  	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/c/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS=$(CURDIR)/c/main.a
> @@ -580,8 +534,6 @@ endif
>  
>  install-c: c-stubdom
>  
> -install-caml: caml-stubdom
> -
>  install-xenstore: xenstore-stubdom
>  	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
>  	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-xenstore/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/xenstore-stubdom.gz"
> @@ -642,13 +594,11 @@ clean: $(foreach lib,$(STUB_LIBS),clean-libxen$(lib))
>  clean:
>  	rm -fr mini-os-$(XEN_TARGET_ARCH)-ioemu
>  	rm -fr mini-os-$(XEN_TARGET_ARCH)-c
> -	rm -fr mini-os-$(XEN_TARGET_ARCH)-caml
>  	rm -fr mini-os-$(XEN_TARGET_ARCH)-grub
>  	rm -fr mini-os-$(XEN_TARGET_ARCH)-xenstore
>  	rm -fr mini-os-$(XEN_TARGET_ARCH)-xenstorepvh
>  	rm -fr mini-os-$(XEN_TARGET_ARCH)-vtpm
>  	rm -fr mini-os-$(XEN_TARGET_ARCH)-vtpmmgr
> -	$(MAKE) DESTDIR= -C caml clean
>  	$(MAKE) DESTDIR= -C c clean
>  	$(MAKE) -C vtpm clean
>  	$(MAKE) -C vtpmmgr clean
> @@ -695,7 +645,6 @@ downloadclean: patchclean
>  	rm -f pciutils-$(LIBPCI_VERSION).tar.bz2
>  	rm -f grub-$(GRUB_VERSION).tar.gz
>  	rm -f lwip-$(LWIP_VERSION).tar.gz
> -	rm -f ocaml-$(OCAML_VERSION).tar.gz
>  	rm -f polarssl-$(POLARSSL_VERSION)-gpl.tgz
>  
>  .PHONY: distclean
> diff --git a/stubdom/caml/Makefile b/stubdom/caml/Makefile
> deleted file mode 100644
> index f550de1680..0000000000
> --- a/stubdom/caml/Makefile
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -XEN_ROOT = $(CURDIR)/../..
> -
> -ifeq (,$(findstring clean,$(MAKECMDGOALS)))
> -include $(XEN_ROOT)/Config.mk
> -endif
> -
> -CAMLLIB = $(shell $(OCAMLC_CROSS_PREFIX)ocamlc -where)
> -DEF_CPPFLAGS += -I$(CAMLLIB)
> -
> -OCAMLOPT=$(OCAMLC_CROSS_PREFIX)ocamlopt
> -
> -OBJS := hello.cmx
> -LIBS := 
> -
> -all: main-caml.o caml.o
> -
> -%.cmx: %.ml
> -	$(OCAMLOPT) -c $< -o $@
> -
> -caml.o: $(OBJS)
> -	$(OCAMLOPT) $(LIBS) $^ -output-obj -o $@
> -
> -clean:
> -	rm -f *.a *.o *.cmx *.cmi
> diff --git a/stubdom/caml/hello.ml b/stubdom/caml/hello.ml
> deleted file mode 100644
> index 3a7181134a..0000000000
> --- a/stubdom/caml/hello.ml
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -let main arg =
> -  Printf.printf "Hello, world!\n%!."
> -
> -let _ = Callback.register "main" main
> diff --git a/stubdom/caml/main-caml.c b/stubdom/caml/main-caml.c
> deleted file mode 100644
> index dd55aca38f..0000000000
> --- a/stubdom/caml/main-caml.c
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -/*
> - * Caml bootstrap
> - *
> - * Samuel Thibault <Samuel.Thibault@eu.citrix.net>, January 2008
> - */
> -
> -#include <stdio.h>
> -#include <errno.h>
> -
> -#include <caml/mlvalues.h>
> -#include <caml/callback.h>
> -#include <unistd.h>
> -
> -/* Ugly binary compatibility with Linux */
> -FILE *_stderr asm("stderr");
> -int *__errno_location;
> -/* Will probably break everything, probably need to fetch from glibc */
> -void *__ctype_b_loc;
> -
> -int main(int argc, char *argv[], char *envp[])
> -{
> -    value *val;
> -
> -    /* Get current thread's value */
> -    _stderr = stderr;
> -    __errno_location = &errno;
> -
> -    printf("starting caml\n");
> -
> -    /* Wait before things might hang up */
> -    sleep(1);
> -
> -    caml_startup(argv);
> -    val = caml_named_value("main");
> -    if (!val) {
> -        printf("Couldn't find Caml main");
> -        return 1;
> -    }
> -    caml_callback(*val, Val_int(0));
> -    printf("callback returned\n");
> -    return 0;
> -}
> diff --git a/stubdom/caml/minios.cfg b/stubdom/caml/minios.cfg
> deleted file mode 100644
> index e69de29bb2..0000000000
> diff --git a/stubdom/configure b/stubdom/configure
> index 9a2226c3b7..6d41be91b6 100755
> --- a/stubdom/configure
> +++ b/stubdom/configure
> @@ -600,8 +600,6 @@ POLARSSL_VERSION
>  POLARSSL_URL
>  GMP_VERSION
>  GMP_URL
> -OCAML_VERSION
> -OCAML_URL
>  GRUB_VERSION
>  GRUB_URL
>  LWIP_VERSION
> @@ -633,7 +631,6 @@ debug
>  xenstorepvh
>  xenstore
>  grub
> -caml
>  c
>  host_os
>  host_vendor
> @@ -687,7 +684,6 @@ ac_user_opts='
>  enable_option_checking
>  enable_ioemu_stubdom
>  enable_c_stubdom
> -enable_caml_stubdom
>  enable_pv_grub
>  enable_xenstore_stubdom
>  enable_xenstorepvh_stubdom
> @@ -711,7 +707,6 @@ LIBPCI_URL
>  NEWLIB_URL
>  LWIP_URL
>  GRUB_URL
> -OCAML_URL
>  GMP_URL
>  POLARSSL_URL
>  TPMEMU_URL'
> @@ -1341,7 +1336,6 @@ Optional Features:
>    --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
>    --enable-ioemu-stubdom  Build and install ioemu-stubdom
>    --enable-c-stubdom      Build and install c-stubdom (default is DISABLED)
> -  --enable-caml-stubdom   Build and install caml-stubdom (default is DISABLED)
>    --enable-pv-grub        Build and install pv-grub (default is DISABLED)
>    --disable-xenstore-stubdom
>                            Build and install xenstore-stubdom (default is
> @@ -1371,7 +1365,6 @@ Some influential environment variables:
>    NEWLIB_URL  Download url for newlib
>    LWIP_URL    Download url for lwip
>    GRUB_URL    Download url for grub
> -  OCAML_URL   Download url for ocaml
>    GMP_URL     Download url for libgmp
>    POLARSSL_URL
>                Download url for polarssl
> @@ -2061,44 +2054,6 @@ fi
>  
>  
>  
> -# Check whether --enable-caml-stubdom was given.
> -if test "${enable_caml_stubdom+set}" = set; then :
> -  enableval=$enable_caml_stubdom;
> -
> -if test "x$enableval" = "xyes"; then :
> -
> -
> -caml=y
> -STUBDOM_TARGETS="$STUBDOM_TARGETS caml"
> -STUBDOM_BUILD="$STUBDOM_BUILD caml-stubdom"
> -STUBDOM_INSTALL="$STUBDOM_INSTALL install-caml"
> -STUBDOM_UNINSTALL="$STUBDOM_UNINSTALL install-caml"
> -
> -
> -else
> -
> -if test "x$enableval" = "xno"; then :
> -
> -
> -caml=n
> -
> -
> -fi
> -
> -fi
> -
> -
> -else
> -
> -
> -caml=n
> -
> -
> -fi
> -
> -
> -
> -
>  # Check whether --enable-pv-grub was given.
>  if test "${enable_pv_grub+set}" = set; then :
>    enableval=$enable_pv_grub;
> @@ -3600,17 +3555,6 @@ GRUB_VERSION="0.97"
>  
>  
>  
> -if test "x$OCAML_URL" = "x"; then :
> -
> -	OCAML_URL="https://caml.inria.fr/pub/distrib/ocaml-4.02"
> -
> -fi
> -OCAML_VERSION="4.02.0"
> -
> -
> -
> -
> -
>  if test "x$GMP_URL" = "x"; then :
>  
>  	if test "x$extfiles" = "xy"; then :
> diff --git a/stubdom/configure.ac b/stubdom/configure.ac
> index 471e371e14..fc736c0387 100644
> --- a/stubdom/configure.ac
> +++ b/stubdom/configure.ac
> @@ -20,7 +20,6 @@ m4_include([../m4/fetcher.m4])
>  # Enable/disable stub domains
>  AX_STUBDOM_CONDITIONAL([ioemu-stubdom], [ioemu])
>  AX_STUBDOM_DEFAULT_DISABLE([c-stubdom], [c])
> -AX_STUBDOM_DEFAULT_DISABLE([caml-stubdom], [caml])
>  AX_STUBDOM_DEFAULT_DISABLE([pv-grub], [grub])
>  AX_STUBDOM_DEFAULT_ENABLE([xenstore-stubdom], [xenstore])
>  AX_STUBDOM_DEFAULT_ENABLE([xenstorepvh-stubdom], [xenstorepvh])
> @@ -60,7 +59,6 @@ AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [https://mirrors.edge.kernel.org/pub
>  AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [https://sourceware.org/ftp/newlib])
>  AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [https://download.savannah.gnu.org/releases/lwip])
>  AX_STUBDOM_LIB([GRUB], [grub], [0.97], [https://alpha.gnu.org/gnu/grub])
> -AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [https://caml.inria.fr/pub/distrib/ocaml-4.02])
>  AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [https://gmplib.org/download/gmp/archive])
>  AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4])
>  AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4])
> diff --git a/stubdom/ocaml.patch b/stubdom/ocaml.patch
> deleted file mode 100644
> index 50db4869dd..0000000000
> --- a/stubdom/ocaml.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> ---- byterun/Makefile.orig	2009-04-07 12:14:02.000000000 +0100
> -+++ byterun/Makefile	2009-04-07 12:13:50.000000000 +0100
> -@@ -22,14 +22,14 @@
> - DOBJS=$(OBJS:.o=.d.o) instrtrace.d.o
> - PICOBJS=$(OBJS:.o=.pic.o)
> - 
> --#ifeq ($(SUPPORTS_SHARED_LIBRARIES),true)
> -+ifeq ($(SUPPORTS_SHARED_LIBRARIES),true)
> - 
> - all:: libcamlrun_shared.so
> - 
> - install::
> - 	cp libcamlrun_shared.so $(LIBDIR)/libcamlrun_shared.so
> - 
> --#endif
> -+endif
> - 
> - ocamlrun$(EXE): libcamlrun.a prims.o
> - 	$(MKEXE) $(BYTECCLINKOPTS) -o ocamlrun$(EXE) \


