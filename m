Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32509C4795F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 16:38:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158496.1486849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITyY-0003J4-SU; Mon, 10 Nov 2025 15:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158496.1486849; Mon, 10 Nov 2025 15:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITyY-0003Ha-NW; Mon, 10 Nov 2025 15:38:38 +0000
Received: by outflank-mailman (input) for mailman id 1158496;
 Mon, 10 Nov 2025 15:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thpE=5S=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vITyX-0003HS-37
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 15:38:37 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51e0d5e4-be4b-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 16:38:36 +0100 (CET)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-78677ff31c2so26906457b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 07:38:36 -0800 (PST)
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
X-Inumbo-ID: 51e0d5e4-be4b-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762789115; x=1763393915; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f8zd3fGJAuArDUHDL5NCKT0rGrwvyC4AhZ8coX0EP6Y=;
        b=I/6PIwHtI1M1qCLkqwKmmdFpeW8zFx4hC+8IzC/c4Ewfb+8fTZ9oxlIarrDScB9wHx
         /gDSRTpBqbne/5aS9ugeaSL2XrzBJBrcwz5u3EUXiIZo+VZlMn9P4u8pV8Hkut0cTX5k
         Vq+EMzIkdNIlb72QaIdR0lY6cdgdhLh15Mcx3J4yKcryMF+SFYrvaNrlEjV2hpMFoBy5
         JuD3PmKnC6Xo/O+LrCOE4O99ea+m38mkCSb0b78GfQAv9woAVxyTFfKHnAOxn1uk/tbx
         kjBC46vX0oMfcMkqa1PySwgwGcOKz+Y/KBCargYzoJoCJ/Xmvj7GshHTQHEf1HV8g6NE
         2iTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762789115; x=1763393915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8zd3fGJAuArDUHDL5NCKT0rGrwvyC4AhZ8coX0EP6Y=;
        b=SBWXaZAPlivOXjOMj4sTMm2r6KzeQi9Wt7xGd77v8KTHquaSF64Hr4e2yOkeayzLLO
         hs6UljTDOp+BuIMoAAgmxa6NSUv7Q9pkVItU4XW2o/QAJ9YcqnXWLuNfznaN/hMhNFPt
         +96vmeZwrBdsMZL6hq2g5LDYFqT6O2Vr+jExTeqUZkY36GeiMuhT5ZrtmqrfJGZsyRiw
         4zrWBkLZREdSUQKYURmbDTWZ8t6WshrnMnLomoYBf4s1vlzsafS4FyPFTFD5nUFN7QWP
         4y7K3n22JPA+eCAsmGfngv8a7/nB5mkiqiLvnw4eWKt3YLhPvKYhdDu/iX7ZGqfX50k/
         vbOw==
X-Gm-Message-State: AOJu0YxioHtEdzo8gsIkSXsEpzDkNrNzGpkpQsMHnYbaYSY5birL/JWr
	FHAxe0dI+Lrx+7wRvNSfYu8zHw9PNshDsupEBAyjwQ1V0BriWjmm2vHRet53HheUe7F+rz3uvzn
	8RY+LRnl/lpeSqB7A4Yk0Weq4ely5WbI=
X-Gm-Gg: ASbGncstonmFnuPvqxqrsNTZMAUsxouYbwl4+IwDuGf827ghjhASmG2beawe3EliND7
	3LN8dOB/pK/GaXJ9+Lm4J9t5Z5ZJzoLiL9b/2mPohQTLfiJP53dohxv1gkTuAXU/MW2rK/f1iAk
	ZSo/KigoUgnpQgD9kokv4W8tV3SYPk9HyS6j6lEqMs5n3MlCnfK+nBmQrV24ctQJ8Cjaajh2nXi
	hWy7P0ioNlxyKB7AoWN2GZsa+7o9TYhB5cmtnaI8Tz5qrpZ+Aa265qHcugv
X-Google-Smtp-Source: AGHT+IFsaCgzfwJjyilF4FaDx1pE7BWmXzMblBoyQ+DWgSsDWm6GyYsXKNJ/pJui+EXILvMI07iVHFad0eRBdm74fxY=
X-Received: by 2002:a05:690c:c00b:b0:784:f14d:6946 with SMTP id
 00721157ae682-787d5470dccmr59633587b3.55.1762789114719; Mon, 10 Nov 2025
 07:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20251110153551.84813-1-frediano.ziglio@citrix.com>
In-Reply-To: <20251110153551.84813-1-frediano.ziglio@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 10 Nov 2025 15:38:23 +0000
X-Gm-Features: AWmQ_bm_W_U9a2rhWaDUsw6H9UCR14UoBfP3Kg6Y5CmGxZpNhxa5ZMCNO7eMHYs
Message-ID: <CAHt6W4fkMT0YMjptxxpCyqVAU=VwF8HY2M=iOu=CKqx_A8VprA@mail.gmail.com>
Subject: Re: [PATCH v5] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

Sorry, I sent version again by mistake

Frediano

On Mon, 10 Nov 2025 at 15:35, Frediano Ziglio
<frediano.ziglio@citrix.com> wrote:
>
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> For xen.gz file we strip all symbols and have an additional
> xen-syms.efi file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.
> xen-syms.efi can be used for debugging.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - avoid leaving target if some command fails.
>
> Changes since v2:
> - do not convert type but retain PE format;
> - use xen-syms.efi for new file name, more consistent with ELF.
>
> Changes since v3:
> - update documentation;
> - do not remove xen.efi.elf;
> - check endbr instruction before generating final target.
>
> Changes since v4:
> - simplify condition check;
> - avoid reuse of $@.tmp file.
> ---
>  docs/misc/efi.pandoc  |  8 +-------
>  xen/Kconfig.debug     |  9 ++-------
>  xen/Makefile          | 19 -------------------
>  xen/arch/x86/Makefile | 16 ++++++++++------
>  4 files changed, 13 insertions(+), 39 deletions(-)
>
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 11c1ac3346..c66b18a66b 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
>  Once built, `make install-xen` will place the resulting binary directly into
>  the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
>  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
> -match your system). When built with debug info, the binary can be quite large.
> -Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
> -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
> -to any combination of options suitable to pass to `strip`, in case the default
> -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
> -unless `EFI_DIR` is set in the environment to override this default. This
> -binary will not be stripped in the process.
> +match your system).
>
>  The binary itself will require a configuration file (names with the `.efi`
>  extension of the binary's name replaced by `.cfg`, and - until an existing
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index d900d926c5..1a8e0c6ec3 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -147,12 +147,7 @@ config DEBUG_INFO
>           Say Y here if you want to build Xen with debug information. This
>           information is needed e.g. for doing crash dump analysis of the
>           hypervisor via the "crash" tool.
> -         Saying Y will increase the size of the xen-syms and xen.efi
> -         binaries. In case the space on the EFI boot partition is rather
> -         limited, you may want to install a stripped variant of xen.efi in
> -         the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> -         docs/misc/efi.pandoc for more information - when not using
> -         "make install-xen" for installing xen.efi, stripping needs to be
> -         done outside the Xen build environment).
> +         Saying Y will increase the size of the xen-syms, xen-syms.efi and
> +         xen.efi.elf binaries.
>
>  endmenu
> diff --git a/xen/Makefile b/xen/Makefile
> index ddcee8835c..605a26c181 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -493,22 +493,6 @@ endif
>  .PHONY: _build
>  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>
> -# Strip
> -#
> -# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
> -# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) below
> -# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
> -# option(s) to the strip command.
> -ifdef INSTALL_EFI_STRIP
> -
> -ifeq ($(INSTALL_EFI_STRIP),1)
> -efi-strip-opt := --strip-debug --keep-file-symbols
> -else
> -efi-strip-opt := $(INSTALL_EFI_STRIP)
> -endif
> -
> -endif
> -
>  .PHONY: _install
>  _install: D=$(DESTDIR)
>  _install: T=$(notdir $(TARGET))
> @@ -535,9 +519,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>                 ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
>                 ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
>                 if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
> -                       $(if $(efi-strip-opt), \
> -                            $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
> -                            $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
>                         $(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
>                 elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
>                         echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 407571c510..51d8084693 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -228,17 +228,21 @@ endif
>         $(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>         $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
>               $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> -             $(note_file_option) -o $@
> -       $(NM) -pa --format=sysv $@ \
> +             $(note_file_option) -o $(TARGET)-syms.efi
> +       $(NM) -pa --format=sysv $(TARGET)-syms.efi \
>                 | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>                 > $@.map
> -ifeq ($(CONFIG_DEBUG_INFO),y)
> -       $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
> +ifeq ($(CONFIG_DEBUG_INFO)_$(filter --strip-debug,$(EFI_LDFLAGS)),y_)
> +       $(OBJCOPY) -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
> +       $(STRIP) $(TARGET)-syms.efi -o $@.tmp
> +else
> +       mv -f $(TARGET)-syms.efi -o $@.tmp
>  endif
> -       rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>  ifeq ($(CONFIG_XEN_IBT),y)
> -       $(SHELL) $(srctree)/tools/check-endbr.sh $@
> +       $(SHELL) $(srctree)/tools/check-endbr.sh $@.tmp
>  endif
> +       mv -f $@.tmp $@
> +       rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>  else
>  $(TARGET).efi: FORCE
>         rm -f $@
> --
> 2.43.0
>

