Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB9BC37BC5
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 21:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156380.1485535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGkAh-000110-Mg; Wed, 05 Nov 2025 20:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156380.1485535; Wed, 05 Nov 2025 20:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGkAh-0000yV-JU; Wed, 05 Nov 2025 20:31:59 +0000
Received: by outflank-mailman (input) for mailman id 1156380;
 Wed, 05 Nov 2025 20:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/Bd=5N=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1vGkAf-0000yP-QH
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 20:31:57 +0000
Received: from mail-yx1-xb130.google.com (mail-yx1-xb130.google.com
 [2607:f8b0:4864:20::b130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73b6e430-ba86-11f0-9d16-b5c5bf9af7f9;
 Wed, 05 Nov 2025 21:31:48 +0100 (CET)
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-63f95dc176fso292526d50.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Nov 2025 12:31:48 -0800 (PST)
Received: from [10.138.34.110]
 (h96-60-249-169.cncrtn.broadband.dynamic.tds.net. [96.60.249.169])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-787b13df6d5sm1917727b3.14.2025.11.05.12.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 12:31:46 -0800 (PST)
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
X-Inumbo-ID: 73b6e430-ba86-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762374707; x=1762979507; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n4tr9DoLumWG5/dMzw0gRv3GzahH9Yl6o6b5lFLR/nw=;
        b=WVHI3sV4v75o9b1VzcS/78mq2a7Q0W27Qd1OJb4M55ZQZpgzoAu1i02sBN+46NqV9+
         8aJsa9Hw4J6FBuZFAQo2RgASqN61rU1L4SZ911nYM0G5DDY5UWzGOEq9TvBE3co5YDbi
         fmuGGLLcsKb3Tk4O6Bhtbe0SEBMY2djw7I00oy6oMstNxKcuErHoIz2sOlQbViXwGtYJ
         SVWE0RTqIGDcQHjlh97QrYtDN8t8cmh7mwFKjoSmgeqEaP2HAzmjEwccd5Iec7WnYt7L
         OHgsakf2omL/1GvZY1uQuuvSR6EnWD36yHSNQKtcKIgrRsjjSLEE/PUHcoUk/UJfwXxX
         tQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762374707; x=1762979507;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4tr9DoLumWG5/dMzw0gRv3GzahH9Yl6o6b5lFLR/nw=;
        b=PFYDvzN9mltqiDP02Ov0JJEQALRnndM9jaD/PP4cJ0tvZ6DSMri6qGebsfyREpnqcv
         1Pr8pSNOPGDYZbhsqySkz5+Bw1hfthstG11qSJiw/mwunb6UBYct2DNBBrWx+A9L+nWx
         M0qmxH3kt1qXJWOPE3iA8WVvyjKkbFz0b1w9x4AtrCO+p2wv9kjnkpXpppZoQsy9lloX
         zGYFf6NgiYjQQKMCrz5GO3Y5vD1mnTl1Z12vAl0ubMIgTZgjm+Pzsp+d4FMROWDRySr8
         dc21fx0OohqTDhdTEGtNdXWKa+aHb6KSnfZennY3Nm0dZ9KzqUJlKtFZV/qWS9ouiluw
         wkYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQoIjKcIlRHu4DkNKtenqyZmfXcm6qQ9h8ePngJuGbNo4ONx5bXQ3PZb7F5BZAkOxsxys6PBZZDEU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiFQlEarQtHsOIKrLYlsTfjRmx4A1wWJXuqMbSNtSYnNiSG6qW
	tMSwVf1NbW876DrcmZ9fng/7qJXYnGTGuHLSfgTA+q7QvgZv4+EJQdre
X-Gm-Gg: ASbGncvvwz+3cL8/EWa/sXgxD20aQhRZtxTYmAkDYJeiYujob2WLH15Rcd0QlM/vAlR
	amBSEaAj3sRPY7I7PXf6Ul08gi8jtt8RqupuRXccIRDsMM8BYYUU82RSnggSwBqB4ORWC8BepQs
	NIlvbVGlO2o5tpZ9EtR+QGW5ZqEoUaFgbx2ovZlGrT2Dqwl6Pl0wWo7gsMAAhUA6OA21Hf8aYS0
	E6726thoGNCs0ooQcFoXZGASFbTURjpMIMNEWcbj7hdf5o8zj1peamNhXSG3sVGf5BzNJvZfVSM
	84mq0ClX0oQK9w26VS901YUTg7kz+jqXpoD1Wy7Q70+ElJ7fvZojRCwbEWtHHMZXvcxmVHcCIrC
	l1EhGM0k55scuNEY+GIitbIAKczT5/10ORRpkMAqBKej5Dv0vZ8O9mNeSZQKCEZsLnG+klnEOkH
	W3xR82bxFYe5p6hCLgkHBQr76f4qOp3tiO/EZ8Qbnih3+cx+wom+zUEDTSc1fqgqU5/F1I4XfYC
	EyAiZTnneSH6nZg
X-Google-Smtp-Source: AGHT+IGT6+6O3FI5MPTdbIaH839JubL4Qa5bc5hIASu7L+QaYTXF89rUfdIIFTEuc29+s8oivguFJw==
X-Received: by 2002:a05:690e:4182:b0:63f:bab4:fdcd with SMTP id 956f58d0204a3-63fd35a1ee0mr3178471d50.48.1762374706979;
        Wed, 05 Nov 2025 12:31:46 -0800 (PST)
Message-ID: <fdc9fd41-2224-4672-911e-3e17b428d32a@gmail.com>
Date: Wed, 5 Nov 2025 15:31:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>
References: <20251105153808.20278-1-frediano.ziglio@citrix.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20251105153808.20278-1-frediano.ziglio@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wR3uNGtKIpM00cl4EqK70PkG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wR3uNGtKIpM00cl4EqK70PkG
Content-Type: multipart/mixed; boundary="------------Laf3qgGfcASVhjDuzhGmlgxS";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: Frediano Ziglio <frediano.ziglio@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>
Message-ID: <fdc9fd41-2224-4672-911e-3e17b428d32a@gmail.com>
Subject: Re: [PATCH v3] xen: Strip xen.efi by default
References: <20251105153808.20278-1-frediano.ziglio@citrix.com>
In-Reply-To: <20251105153808.20278-1-frediano.ziglio@citrix.com>

--------------Laf3qgGfcASVhjDuzhGmlgxS
Content-Type: multipart/mixed; boundary="------------vcM0SfoOk10EZuEbrGl6yv6X"

--------------vcM0SfoOk10EZuEbrGl6yv6X
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/5/25 10:38, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>=20
> For xen.gz file we strip all symbols and have an additional
> xen-syms file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.
> xen-syms.efi can be used for debugging.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - avoid leaving target if some command fails.
>=20
> Changes since v2:
> - do not convert type but retain PE format;
> =3D use xen-syms.efi for new file name, more consistent with ELF.
> ---
>  docs/misc/efi.pandoc  |  8 +-------
>  xen/Kconfig.debug     |  9 ++-------
>  xen/Makefile          | 19 -------------------
>  xen/arch/x86/Makefile |  9 ++++++---
>  4 files changed, 9 insertions(+), 36 deletions(-)
>=20
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 11c1ac3346..c66b18a66b 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot=
 modules are found.
>  Once built, `make install-xen` will place the resulting binary directl=
y into
>  the EFI boot partition, provided `EFI_VENDOR` is set in the environmen=
t (and
>  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot=
/efi` not
> -match your system). When built with debug info, the binary can be quit=
e large.
> -Setting `INSTALL_EFI_STRIP=3D1` in the environment will cause it to be=
 stripped
> -of debug info in the process of installing. `INSTALL_EFI_STRIP` can al=
so be set
> -to any combination of options suitable to pass to `strip`, in case the=
 default
> -ones don't do. The xen.efi binary will also be installed in `/usr/lib6=
4/efi/`,
> -unless `EFI_DIR` is set in the environment to override this default. T=
his
> -binary will not be stripped in the process.
> +match your system).
> =20
>  The binary itself will require a configuration file (names with the `.=
efi`
>  extension of the binary's name replaced by `.cfg`, and - until an exis=
ting
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index d900d926c5..58ee10ee3e 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -147,12 +147,7 @@ config DEBUG_INFO
>  	  Say Y here if you want to build Xen with debug information. This
>  	  information is needed e.g. for doing crash dump analysis of the
>  	  hypervisor via the "crash" tool.
> -	  Saying Y will increase the size of the xen-syms and xen.efi
> -	  binaries. In case the space on the EFI boot partition is rather
> -	  limited, you may want to install a stripped variant of xen.efi in
> -	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> -	  docs/misc/efi.pandoc for more information - when not using
> -	  "make install-xen" for installing xen.efi, stripping needs to be
> -	  done outside the Xen build environment).
> +	  Saying Y will increase the size of the xen-syms and xen.efi.elf
> +	  binaries.
> =20
>  endmenu
> diff --git a/xen/Makefile b/xen/Makefile
> index ddcee8835c..605a26c181 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -493,22 +493,6 @@ endif
>  .PHONY: _build
>  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
> =20
> -# Strip
> -#
> -# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped bef=
ore it
> -# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s=
) below
> -# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the=

> -# option(s) to the strip command.
> -ifdef INSTALL_EFI_STRIP
> -
> -ifeq ($(INSTALL_EFI_STRIP),1)
> -efi-strip-opt :=3D --strip-debug --keep-file-symbols
> -else
> -efi-strip-opt :=3D $(INSTALL_EFI_STRIP)
> -endif
> -
> -endif
> -
>  .PHONY: _install
>  _install: D=3D$(DESTDIR)
>  _install: T=3D$(notdir $(TARGET))
> @@ -535,9 +519,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>  		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION=
).efi; \
>  		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
>  		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
> -			$(if $(efi-strip-opt), \
> -			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGE=
T).efi && \
> -			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/e=
fi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
>  			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDO=
R)/$(T)-$(XEN_FULLVERSION).efi; \
>  		elif [ "$(D)" =3D "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D=
))" ]; then \
>  			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&=
2; \
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 407571c510..c118ab7b7d 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -228,14 +228,17 @@ endif
>  	$(MAKE) $(build)=3D$(@D) .$(@F).1r.o .$(@F).1s.o
>  	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
>  	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> -	      $(note_file_option) -o $@
> -	$(NM) -pa --format=3Dsysv $@ \
> +	      $(note_file_option) -o $@.tmp
> +	$(NM) -pa --format=3Dsysv $@.tmp \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@.map
>  ifeq ($(CONFIG_DEBUG_INFO),y)
> -	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O e=
lf64-x86-64 $@ $@.elf
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))cp -f \
> +        $@.tmp $(TARGET)-syms.efi
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@.tmp=

>  endif
>  	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> +	mv -f $@.tmp $@
>  ifeq ($(CONFIG_XEN_IBT),y)
>  	$(SHELL) $(srctree)/tools/check-endbr.sh $@
>  endif

Does this also strip the string table from xen.efi?  I'm concerned that
signing xen.efi for secure boot won't work if there is a string table.
In particular, it appears that EDK2 will miscalculate the file hash if
the string table is before the signature.  Moving the string table after
the signature invalidates the pointer to it.  The only exception is if
the string table is itself in a section, but I don't know if that is the
case.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------vcM0SfoOk10EZuEbrGl6yv6X
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------vcM0SfoOk10EZuEbrGl6yv6X--

--------------Laf3qgGfcASVhjDuzhGmlgxS--

--------------wR3uNGtKIpM00cl4EqK70PkG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmkLtCIACgkQszaHOrMp
8lMagQ//YgNME5sj0oGNKhAzzrNVN+GTxNwRphY9N6uQBPoY6MISZ/Hd0BlbJIRb
X1k9mXJWuXBajKRLz6h6JFrvlQxjr/WB5CBcG1IkCcOJKFYw8EKUZnMVcNiYicQd
XzNL7YR5ybIti+dRuWR0EfSKEgFIsZBLCbUoV4xGUHJzjivIqGGjN6IqkG/nMmRp
gfJXSH2ENIyFKapOajHxJV0dXLW4kGVwguk1cwVK6nDMJfaq0vH6t8ZcXFABgSqa
vZnRCWgyegfTKjzwgqpjQ6jrBbLIcQdsObMVg4L2KChnNjqVwKul1L7uYUbLJaE6
Rq1VINgYQFCis+lhJ1O0k9YUoX4FCYA85HG0aU5G4VGp+te0nbUbZICqRBuJedIG
l+RK2uX8hh1Siz07n+9O5kXzSoIBl3koksjBli9dkW2IuxrTEOlT7XhvINmytdlh
pM9xFWy64ITRIr1ZmBBKkph1J2IXaI7s405iLUwxlyyazSlMGVmCtypOz6cWAYDq
QLWsa3yMkETWaX2IX4U1HlTSFrJYXS4ztIMMTVcqxw77Urbl06Hz0DXCjTj0zgBx
Kkihlj3THb2Amwv4epplzBQzt3ZifnFPJuqs/eLc5VFKrVb74ZxOjHJA83fnKvGE
UtRCfoLzidPhywlKfCFNMWhrxYbksThYbWgH0cf/TixwfXtqr1U=
=d4tF
-----END PGP SIGNATURE-----

--------------wR3uNGtKIpM00cl4EqK70PkG--

