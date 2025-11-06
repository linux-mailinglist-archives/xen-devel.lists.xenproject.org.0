Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA35C38C83
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 03:01:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156441.1485554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGpIX-0005cw-SK; Thu, 06 Nov 2025 02:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156441.1485554; Thu, 06 Nov 2025 02:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGpIX-0005bj-P3; Thu, 06 Nov 2025 02:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1156441;
 Thu, 06 Nov 2025 02:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMQi=5O=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vGpIW-0005bb-CJ
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 02:00:24 +0000
Received: from mail-yx1-xb132.google.com (mail-yx1-xb132.google.com
 [2607:f8b0:4864:20::b132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a2a575b-bab4-11f0-9d16-b5c5bf9af7f9;
 Thu, 06 Nov 2025 03:00:22 +0100 (CET)
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-63fd493ea10so787446d50.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Nov 2025 18:00:22 -0800 (PST)
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
X-Inumbo-ID: 5a2a575b-bab4-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762394421; x=1762999221; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KwQzZyj3RNkNdlKIim1QoQYo3qxiKTvpU0ADXklFVyQ=;
        b=hEYAzp8tSi7JWzOiQMDD/+SQcSImB7E15IqzDVNzjGlu7vdULtzy5pdrEzOmE7gEhq
         yawAwBag3TTwU8wpCm47L7xECiODdBDi4tDFeTx22TszTGEPmUeZicj2dYD2CHdJTru5
         3nzifRiKpMQJ94RDQLJP6KRvsT0+4i+Oxj4Zr8V2YZV3gHL0pEKCfMbLO61uDoQi7cYT
         1zHYXrbUQhXgV91S8hWAUzpOIvvmD8k3Jg8HK70bFJr9wg0zzX2BlV6ImyXOvWjKN+fD
         UON15WjzM2l8IJlW2wXfLl0PpLM/SneqrE9hJDj4D5qPhdqNSa6VziCAjtslZu3mcF4n
         GdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762394421; x=1762999221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwQzZyj3RNkNdlKIim1QoQYo3qxiKTvpU0ADXklFVyQ=;
        b=BH2Us+5jCdSP2xrw3Jii2kYn1yuFMX26GUTiWgBQ/UQeXXtT0MpzFy3KfJddsXddC1
         KBbpajF2RMvlTId2R23AbXHU+0z0x334f8iNyoTWoFuc+EB/jkGO+XKgQ56mkFMlyNgS
         kFn9dt0kfhHqkSSLqoLz83BuneSBSTyKp5LAYTfX8NaLBH5ezKt2dKue3MysNThKOjye
         M1vtY57Kgb3VWSVGvSjWI7lbAdnGzCYUOPpRHQGoZsaKvaT5OkpQid+L3WY5aDuhxha2
         ViS+tQAZ2hs5W9ouEeU6RQz8FkOxh9NGeGwsqq/mPxDxopSi6CbDqsJxG9ZtJtcpWdGV
         A7Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVPjz97fNvcl/VJ1R2U45hIciVxnV3svn1dzN+xlWwe6kUYCFApE4UqarveJro6D1Bve2V1GfGZ9YM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyooXJGe1ktSFwVd0KAaNHhVRgtnnqHMsLg8FG5l6bZVMBuQ280
	tyGNF+lqt5JEZPBx2YpWn1nrtlR+QVche0VL0WXa4/Mrq6tk1fkhRa8C8mvKlBDNo2HRBISFVdp
	/2BuUhBIAvIRltwshcIpzPXE6z5t/1ZY=
X-Gm-Gg: ASbGncs7WaJdVIPa+faoivPM+jOVibdpEYbFI985kmQS8DrsXAx5T7F1+q4pGd4q/Lb
	tQOgitVpOjABsV/LSMZEMapcdQE61vYlhJIXjtqFIEQNmqts61liobtjMmklvQ5C1sO3CIBmUDN
	Xbnr3y5tYNPyZtRKouosQ33OOoJ3QOzHsjgBkhvru5p+ZOLNdQkpeusFk0NaJFqloQDIMaBkjhm
	JQbRDEKpwZkQSFIxHTVKcMY27z2OTb2Zg9LZAy4Q79HqiutXgzxMDyOFWIK3QRsV/UGPAbm+BGt
	XMFBYQ==
X-Google-Smtp-Source: AGHT+IG+wGmoK60a58Gj1xEsEkeNlgY+Imd2e2WaCeHPk7B0Ks5bg6Y0lHlE31i5UTeYwQ43gCSxar+IMJpdJFAbG8k=
X-Received: by 2002:a05:690e:1c1b:b0:63f:ad41:ed32 with SMTP id
 956f58d0204a3-640b53f9fa9mr1467789d50.13.1762394421095; Wed, 05 Nov 2025
 18:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20251105153808.20278-1-frediano.ziglio@citrix.com> <fdc9fd41-2224-4672-911e-3e17b428d32a@gmail.com>
In-Reply-To: <fdc9fd41-2224-4672-911e-3e17b428d32a@gmail.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 6 Nov 2025 02:00:09 +0000
X-Gm-Features: AWmQ_bl20FBaVdGQ73vw3BLi0C6GeqXWY0j5un7i-UTcmGdpBPlBWpvB_UriT3U
Message-ID: <CAHt6W4eyH_7c4Q-KYaDjNJnSXjKSVNT1iSw0sNbLMXnK3iEHRg@mail.gmail.com>
Subject: Re: [PATCH v3] xen: Strip xen.efi by default
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Nov 2025 at 20:31, Demi Marie Obenour <demiobenour@gmail.com> wrote:
>
> On 11/5/25 10:38, Frediano Ziglio wrote:
> > From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >
> > For xen.gz file we strip all symbols and have an additional
> > xen-syms file version with all symbols.
> > Make xen.efi more coherent stripping all symbols too.
> > xen-syms.efi can be used for debugging.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> > Changes since v1:
> > - avoid leaving target if some command fails.
> >
> > Changes since v2:
> > - do not convert type but retain PE format;
> > = use xen-syms.efi for new file name, more consistent with ELF.
> > ---
> >  docs/misc/efi.pandoc  |  8 +-------
> >  xen/Kconfig.debug     |  9 ++-------
> >  xen/Makefile          | 19 -------------------
> >  xen/arch/x86/Makefile |  9 ++++++---
> >  4 files changed, 9 insertions(+), 36 deletions(-)
> >
> > diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> > index 11c1ac3346..c66b18a66b 100644
> > --- a/docs/misc/efi.pandoc
> > +++ b/docs/misc/efi.pandoc
> > @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
> >  Once built, `make install-xen` will place the resulting binary directly into
> >  the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
> >  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
> > -match your system). When built with debug info, the binary can be quite large.
> > -Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
> > -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
> > -to any combination of options suitable to pass to `strip`, in case the default
> > -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
> > -unless `EFI_DIR` is set in the environment to override this default. This
> > -binary will not be stripped in the process.
> > +match your system).
> >
> >  The binary itself will require a configuration file (names with the `.efi`
> >  extension of the binary's name replaced by `.cfg`, and - until an existing
> > diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> > index d900d926c5..58ee10ee3e 100644
> > --- a/xen/Kconfig.debug
> > +++ b/xen/Kconfig.debug
> > @@ -147,12 +147,7 @@ config DEBUG_INFO
> >         Say Y here if you want to build Xen with debug information. This
> >         information is needed e.g. for doing crash dump analysis of the
> >         hypervisor via the "crash" tool.
> > -       Saying Y will increase the size of the xen-syms and xen.efi
> > -       binaries. In case the space on the EFI boot partition is rather
> > -       limited, you may want to install a stripped variant of xen.efi in
> > -       the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> > -       docs/misc/efi.pandoc for more information - when not using
> > -       "make install-xen" for installing xen.efi, stripping needs to be
> > -       done outside the Xen build environment).
> > +       Saying Y will increase the size of the xen-syms and xen.efi.elf
> > +       binaries.
> >
> >  endmenu
> > diff --git a/xen/Makefile b/xen/Makefile
> > index ddcee8835c..605a26c181 100644
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -493,22 +493,6 @@ endif
> >  .PHONY: _build
> >  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
> >
> > -# Strip
> > -#
> > -# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
> > -# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) below
> > -# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
> > -# option(s) to the strip command.
> > -ifdef INSTALL_EFI_STRIP
> > -
> > -ifeq ($(INSTALL_EFI_STRIP),1)
> > -efi-strip-opt := --strip-debug --keep-file-symbols
> > -else
> > -efi-strip-opt := $(INSTALL_EFI_STRIP)
> > -endif
> > -
> > -endif
> > -
> >  .PHONY: _install
> >  _install: D=$(DESTDIR)
> >  _install: T=$(notdir $(TARGET))
> > @@ -535,9 +519,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
> >               ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
> >               ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
> >               if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
> > -                     $(if $(efi-strip-opt), \
> > -                          $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
> > -                          $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
> >                       $(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
> >               elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
> >                       echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \
> > diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> > index 407571c510..c118ab7b7d 100644
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -228,14 +228,17 @@ endif
> >       $(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
> >       $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
> >             $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> > -           $(note_file_option) -o $@
> > -     $(NM) -pa --format=sysv $@ \
> > +           $(note_file_option) -o $@.tmp
> > +     $(NM) -pa --format=sysv $@.tmp \
> >               | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> >               > $@.map
> >  ifeq ($(CONFIG_DEBUG_INFO),y)
> > -     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
> > +     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))cp -f \
> > +        $@.tmp $(TARGET)-syms.efi
> > +     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@.tmp
> >  endif
> >       rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> > +     mv -f $@.tmp $@
> >  ifeq ($(CONFIG_XEN_IBT),y)
> >       $(SHELL) $(srctree)/tools/check-endbr.sh $@
> >  endif
>
> Does this also strip the string table from xen.efi?  I'm concerned that
> signing xen.efi for secure boot won't work if there is a string table.
> In particular, it appears that EDK2 will miscalculate the file hash if
> the string table is before the signature.  Moving the string table after
> the signature invalidates the pointer to it.  The only exception is if
> the string table is itself in a section, but I don't know if that is the
> case.

I don't know if the string table is stripped but I can surely confirm
that signing xen.efi is working with secure boot.

Frediano

