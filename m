Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8171C3C7D9
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 17:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157154.1486051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2zN-0007ce-Nt; Thu, 06 Nov 2025 16:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157154.1486051; Thu, 06 Nov 2025 16:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2zN-0007aI-L2; Thu, 06 Nov 2025 16:37:33 +0000
Received: by outflank-mailman (input) for mailman id 1157154;
 Thu, 06 Nov 2025 16:37:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMQi=5O=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vH2zM-0007aC-M9
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 16:37:32 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e389d9fb-bb2e-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 17:37:31 +0100 (CET)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-7815092cd0bso10869367b3.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 08:37:31 -0800 (PST)
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
X-Inumbo-ID: e389d9fb-bb2e-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762447050; x=1763051850; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CHxpoOPq+j6tKZxyyZcbaeOzVWioghrMI0b88lv905Y=;
        b=JVhqxf8L6QaWAA/xjisvSR9dVbDfAc5o6UEEWSiR/q7sMVPnXt0a/iJUrQi+4/T4/t
         8A8ccoF/s2PpVWn7ZJsFtSy55KCcMPwDGMpxGbNAsb9JXJn7uVDsxF1fzNLXiAp4vzCM
         jEfbi6MArEl1utgTMXLMqCTmtia5m2EqfPhBoCdSu9teVSvqz+4piZisROLhBZPPh5AS
         XwpeGS0IW/gZ4ZiCycAuLEfy5hzY+2Vm6asUA2h2ZNLjFXZwzups/N4Jv6mjURwfyWjV
         b4msXhctG+u9kLKCHlKAluer6QoHZJUSQW8qBjDw9WtYF3vTH/7rbDKPgPGK1THBhUHP
         EzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762447050; x=1763051850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHxpoOPq+j6tKZxyyZcbaeOzVWioghrMI0b88lv905Y=;
        b=G6n7UM6VVgfShdqX4kcB32Glyrh5sAdxE8WVrY71UzhQZu2OhvsiRp8hKzy6kLvo9G
         XrGTm3qSmCKyYaIB6wmNaXVJvbJiGE81IvIm8fUYE0yWcwYRaH5pZ1Wl7YN2g0qTd9YN
         MQx9sz4V0l9dh462ZdDDB+VlZAsDbu+YO5jLAwKJTf/Y4oqlM8eBnrkwY5alGku1EbFv
         em80JYYxyUSerc0MYdIlsjakUd5l+iRfVfZOf8OXH/sHmeToaiRVqjYU7G6pdMNoLR5p
         59JKGthZ7MsxQih4n7r/y9U1hVmozC4mOAIUm+DWk8zBka1rK/yXbE1JWaVHMJOP7Ihu
         Ahtg==
X-Forwarded-Encrypted: i=1; AJvYcCXKvTwG4DxTCV0sFsGRsZs9dvTejR8RD4L6LoBXPMY3RiCzkOHiAouU9lNGwPV/K+lNpH71QitJ3GU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztR9Izpu2cjDTBFunDsaYEEtYUHOT0wIBKiuHWbAiTOHOIDs/u
	qZProV3ecAhfcdvdfPXDkVjK5bcf6n76TU7pr3j01enJyjNGeTukY0ZuakvPUE/ztM1c9wAs6zv
	ecLpjVZKMxotNpxt2HxxGJxn7TZmyw1w=
X-Gm-Gg: ASbGnctfK1XuX+VwAoxQ4P0YmkMa79mzY8kpKq6WeuPrzQ0dHnbF6v5CULg17vH2/u5
	ST+ndpbB4UO56jjlcohWIuJpndnoWuat8pQarFV5ce7gjWYH4AqlzCCYCL1sQ9GO18aIPQ6I/HO
	vK///SUNmXbaHnkR+cdX5LADOWzRJFEOx79WBxfJFD3WXMPybFjripDWRRtKE+d7gGeTMwZmaPx
	P3BFYFVP0I76OtT1TE9/LLKQ1v3ZPu4hqWFFGLCc7K2fQkTasKHhvdqRbE/SHcFyb+HnAA=
X-Google-Smtp-Source: AGHT+IGvSt5CfFItzBmTTGZrZUkKLgvTfURjlKb7woiaUTM8/jLwBMNJeH8w7oq+rwg+a6mTYE1lNqc/IQK6BJfwYEM=
X-Received: by 2002:a05:690c:9a81:b0:786:8f3e:b11b with SMTP id
 00721157ae682-786a41be00amr126183497b3.33.1762447050238; Thu, 06 Nov 2025
 08:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20251105153808.20278-1-frediano.ziglio@citrix.com> <97611b79-228c-40a6-9fb2-4571b2447258@suse.com>
In-Reply-To: <97611b79-228c-40a6-9fb2-4571b2447258@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 6 Nov 2025 16:37:17 +0000
X-Gm-Features: AWmQ_bkAtm91WHYPFi-ux2dVX_c4vTVxq9lqzhyi3qbSvPjl-BQWCUSrANUDw7Q
Message-ID: <CAHt6W4ce9cPwdaYXwgL4Unkprh4BQ2Qh_CSM0q9WjP2fdVf-Gg@mail.gmail.com>
Subject: Re: [PATCH v3] xen: Strip xen.efi by default
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Nov 2025 at 10:32, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 05.11.2025 16:38, Frediano Ziglio wrote:
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
>
> Why xen.efi.elf and not xen-syms.efi?
>

I forgot to update this part.
Now that I see the comment, was the suggestion about having an
additional xen-syms.efi file or having xen-syms.efi instead of
xen.efi.elf ?

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
> I see $@.tmp here, but no sign of xen-syms. Did you submit a stake patch? Am
> I missing something?
>

I don't know what a "stake patch" is.
xen-syms.efi (that is $(TARGET)-syms.efi in the Makefile) is not a
target of this rule so if the rule fails it will be generated again.

> I also think the mv should sit ahead of the cleaning-up rm.
>

Are you sure?
Usually you want it as the last command so any failure won't create
the target. For instance here if check-endbr.sh is failing the target
is still created and next make command will succeed.

> Jan
>
> Jan

Frediano

