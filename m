Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16192AE81EF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 13:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024791.1400615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUOcz-0005yV-KT; Wed, 25 Jun 2025 11:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024791.1400615; Wed, 25 Jun 2025 11:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUOcz-0005x4-GV; Wed, 25 Jun 2025 11:49:21 +0000
Received: by outflank-mailman (input) for mailman id 1024791;
 Wed, 25 Jun 2025 11:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=edXa=ZI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUOcy-0005wy-Ne
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 11:49:20 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d85d56e-51ba-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 13:49:20 +0200 (CEST)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2e95ab2704fso3783958fac.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 04:49:19 -0700 (PDT)
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
X-Inumbo-ID: 6d85d56e-51ba-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750852158; x=1751456958; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYMA41oHHLLHzp1mzf518OORY00VDkMnuZjpm9G9Xv4=;
        b=feuu1gDJzV9DVWdcvfGrBuN0Y0WTcSTpOfSYjRG1tEn6jXlGwZlAFFX4MLe9nomKjx
         O88ZYr9ele4nPKyLtQcByp+/Wr82bJZK+JWXnvap7euqD/R1q8156W5NTnU0GQYYWx34
         Kp/yYDwocrNK0o8fTBnYyIhzomNTf27nTZO9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852158; x=1751456958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYMA41oHHLLHzp1mzf518OORY00VDkMnuZjpm9G9Xv4=;
        b=TG6k8J5IiYHjd6AZCTD4bZ+IkZfJe/Lv0fXqkIhBMkgPLCrLcvKksJtjGDgl8dtYjG
         beOJDovLTK3/cm8WOx6xSS1K29LjLSEwqsFQWuPbiOQ9913apn8henGn2smRxE81k31n
         BGqwKPoYmTshBo92AZ5qpoPFU/8U8TD16JkM0hvb1xglMA+XH1n4BAPRHDyTAg3/PjZ4
         46WNV3KU4KjqXMdPvNuoxn9qDLiWMtqncFNcCMk/I3cT1XePla/yP9bsO8IANzuCSQJF
         jVaIKvNWlBJCYDGFuyTULzTQfTotTMjsCCFnZhfPVuaNZ/MJ1sCPOGrG0CevwOft3V20
         nxmQ==
X-Gm-Message-State: AOJu0Yy3Umyf8YRRVXKplS8wySAykRql/WrlF7GLfL62O5ufSoF0EtUH
	7+7h8wfRaUXgiIQLr5Sf/e/TcqY1wRwzFjE6E7IX1IpZnTPxjGRyU+jTVPKKnRQTEU2yFX8SrOe
	PuQW+pLpJy6Y3v59mVsuxie2Ghk7sRyOIRpqVGvWhhF4FtMWl51oAw1M=
X-Gm-Gg: ASbGncvdDPGHZAOmpYhxGekF3MrzheAHpTmbkA8P6Yp97czYMHWvpmMzQ/i2kFi/V7z
	mcULDq+oWJwWwvt99XFiwjgGDS2sJQ5C1DAUEe1+LrbuuWw0ML3ImO3uj1rVsEzWRXO5CvHNrBs
	CBDQ1Wy8Y419Sa5Mb0k0qmcwJ42rdLGec+Jk9x3fm6
X-Google-Smtp-Source: AGHT+IF3pjNyTk164eSFqmO3VlPiQNa2wCEy+2+B1gaXgDFCTNhuRasdwAf/D1U9e/PKlA8zDydrOphwQ38DYlJ25sg=
X-Received: by 2002:a05:6870:14d2:b0:29e:74a0:e03f with SMTP id
 586e51a60fabf-2efb28cff1amr1823269fac.24.1750852158402; Wed, 25 Jun 2025
 04:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250612100705.21988-1-frediano.ziglio@cloud.com>
In-Reply-To: <20250612100705.21988-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 25 Jun 2025 12:49:01 +0100
X-Gm-Features: Ac12FXyJh4-bas7fncV97c2_81NKJPd53UgTnW0spIoZk9LVmfMSQV6_kHr8yP8
Message-ID: <CACHz=ZjeiTx5uktt8C=5CC+WzYywgV=e+w=nL++N+9cUbLUEiQ@mail.gmail.com>
Subject: Re: [PATCH v2] xen: Strip xen.efi by default
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 11:07=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> For xen.gz file we strip all symbols and have an additional
> xen-syms file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.
> xen.efi.elf can be used for debugging.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - avoid leaving target if some command fails
> ---
>  docs/misc/efi.pandoc  |  8 +-------
>  xen/Kconfig.debug     |  9 ++-------
>  xen/Makefile          | 19 -------------------
>  xen/arch/x86/Makefile |  8 +++++---
>  4 files changed, 8 insertions(+), 36 deletions(-)
>
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 11c1ac3346..c66b18a66b 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot m=
odules are found.
>  Once built, `make install-xen` will place the resulting binary directly =
into
>  the EFI boot partition, provided `EFI_VENDOR` is set in the environment =
(and
>  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/e=
fi` not
> -match your system). When built with debug info, the binary can be quite =
large.
> -Setting `INSTALL_EFI_STRIP=3D1` in the environment will cause it to be s=
tripped
> -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also=
 be set
> -to any combination of options suitable to pass to `strip`, in case the d=
efault
> -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/=
efi/`,
> -unless `EFI_DIR` is set in the environment to override this default. Thi=
s
> -binary will not be stripped in the process.
> +match your system).
>
>  The binary itself will require a configuration file (names with the `.ef=
i`
>  extension of the binary's name replaced by `.cfg`, and - until an existi=
ng
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index d14093017e..cafbb1236c 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -147,12 +147,7 @@ config DEBUG_INFO
>           Say Y here if you want to build Xen with debug information. Thi=
s
>           information is needed e.g. for doing crash dump analysis of the
>           hypervisor via the "crash" tool.
> -         Saying Y will increase the size of the xen-syms and xen.efi
> -         binaries. In case the space on the EFI boot partition is rather
> -         limited, you may want to install a stripped variant of xen.efi =
in
> -         the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> -         docs/misc/efi.pandoc for more information - when not using
> -         "make install-xen" for installing xen.efi, stripping needs to b=
e
> -         done outside the Xen build environment).
> +         Saying Y will increase the size of the xen-syms and xen.efi.elf
> +         binaries.
>
>  endmenu
> diff --git a/xen/Makefile b/xen/Makefile
> index 8fc4e042ff..664c4ea7b8 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -488,22 +488,6 @@ endif
>  .PHONY: _build
>  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>
> -# Strip
> -#
> -# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped befor=
e it
> -# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) =
below
> -# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
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
> @@ -530,9 +514,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>                 ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(=
XEN_VERSION).efi; \
>                 ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).ef=
i; \
>                 if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then=
 \
> -                       $(if $(efi-strip-opt), \
> -                            $(STRIP) $(efi-strip-opt) -p -o $(TARGET).ef=
i.stripped $(TARGET).efi && \
> -                            $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$=
(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
>                         $(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOIN=
T)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
>                 elif [ "$(D)" =3D "$(patsubst $(shell cd $(XEN_ROOT) && p=
wd)/%,%,$(D))" ]; then \
>                         echo 'EFI installation only partially done (EFI_V=
ENDOR not set)' >&2; \
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index ce724a9daa..e0ebc8c73e 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -232,14 +232,16 @@ endif
>         $(MAKE) $(build)=3D$(@D) .$(@F).1r.o .$(@F).1s.o
>         $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
>               $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) =
\
> -             $(note_file_option) -o $@
> -       $(NM) -pa --format=3Dsysv $@ \
> +             $(note_file_option) -o $@.tmp
> +       $(NM) -pa --format=3Dsysv $@.tmp \
>                 | $(objtree)/tools/symbols --all-symbols --xensyms --sysv=
 --sort \
>                 > $@.map
>  ifeq ($(CONFIG_DEBUG_INFO),y)
> -       $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) =
-O elf64-x86-64 $@ $@.elf
> +       $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) =
-O elf64-x86-64 $@.tmp $@.elf
> +       $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@=
.tmp
>  endif
>         rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> +       mv -f $@.tmp $@
>  ifeq ($(CONFIG_XEN_IBT),y)
>         $(SHELL) $(srctree)/tools/check-endbr.sh $@
>  endif

Any comments on this version?

Frediano

