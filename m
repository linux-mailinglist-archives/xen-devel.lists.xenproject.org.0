Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4D9B1390A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061255.1426769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLBP-0002Gv-C8; Mon, 28 Jul 2025 10:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061255.1426769; Mon, 28 Jul 2025 10:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLBP-0002Ep-9X; Mon, 28 Jul 2025 10:34:15 +0000
Received: by outflank-mailman (input) for mailman id 1061255;
 Mon, 28 Jul 2025 10:34:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRgz=2J=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ugLBO-0002Ej-6O
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:34:14 +0000
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66e4af97-6b9e-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 12:34:13 +0200 (CEST)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-41b4ebb157eso2468789b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:34:13 -0700 (PDT)
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
X-Inumbo-ID: 66e4af97-6b9e-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753698851; x=1754303651; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIjm5MFtRXNUGUiVBasD2QqdNNT4T7jFOXGWXolyJqQ=;
        b=eg1mGErsTKFHFHlAaMlsBtovJy82OppE+x5cpIRf6c7mQOTKcHZnosImcx5GMXME4v
         DbTODxT3kr9CDaOX0h3VWd7wOd6O4ylHwFvHTDIVE8BaNhR3FWm3IQYPgb65uqO7X2k8
         1xKZElxZg6lrxGk9GJXR5EOrw6p0xKzgOYesc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753698851; x=1754303651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIjm5MFtRXNUGUiVBasD2QqdNNT4T7jFOXGWXolyJqQ=;
        b=mC0Ajhz6AqBdTjPuJ0/hh028CMxNL3td5ipUX6KbMC+4HzHwnSBGcQAr/P6dqHgSzc
         UtF9ceWG06zNGK+d5jCcYtW/LkVym5nM5IN1WgxLtaObVhIPp3aAKIjspoQHpj/bCdZN
         Jp32Tlztq1WXCME46NUqNPxqmDKONb/y1DqErPliQi+N2G/b3mjOQISi12jc0lb6Q98r
         n7EtkV+ZDN7oZC3qkQlZafFdHiv4hwikr0LeTQ2VGn3QApz+Y8X+F0BRHTnKyZH+IRNd
         GqWmrqH6oMK+KOO3iqE055ytJtD3JZzAuTadBDKOuyLDjUAGhln2EDuVvSn54L24O2w4
         r3Uw==
X-Gm-Message-State: AOJu0YxTGy/bIWJvXZoLQHo86wfOQ8nE/y8TIgFJh/ol7VIR4rPA0on0
	PwW2AGm6mVC5oOFugtscfvK6jV6LdjwUYfPCfIWOPt2UQ1yQLwQk4N/R8PHCBPQho3YXQKMnWf2
	F+LC4VNvev1Pm/qiBagXpYqtYU1EdihRvmihnFnu40WwcV5QQ024/x44=
X-Gm-Gg: ASbGncuRW7pxnujv2K6o/uDqlsGWrN4CJ94dC9GCrLJPBDQjcQUSRNjkcbh61hM+g4I
	LfDD22omuwkneXIH5vJGgsY/VcVMQ6UegbU02J2c1TeE8mfZQ7JytHB2/HEdsNShX8yxUl3THgt
	gUY0/AukfF9Yt6Og3UBHqFWxEAfFUWyOI/aAFBqXEok2CJSwqmEuaMnp4o/ngKayz+/VqFxsNY3
	yg6Rg==
X-Google-Smtp-Source: AGHT+IGi36OJiYQCdw8acjrEH1QLJnfJvgIGjQuOL/hp8kzDhzAieuteAChwW1P8EBn4m14m1Ejt/m8FBgO6/O9WCN8=
X-Received: by 2002:a05:6808:211b:b0:40b:a456:e742 with SMTP id
 5614622812f47-42bbb1a7ae2mr5615200b6e.37.1753698851504; Mon, 28 Jul 2025
 03:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250612100705.21988-1-frediano.ziglio@cloud.com> <CACHz=ZjeiTx5uktt8C=5CC+WzYywgV=e+w=nL++N+9cUbLUEiQ@mail.gmail.com>
In-Reply-To: <CACHz=ZjeiTx5uktt8C=5CC+WzYywgV=e+w=nL++N+9cUbLUEiQ@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 28 Jul 2025 11:34:00 +0100
X-Gm-Features: Ac12FXysMCm3R-h3HTk8dnWL6r-C425Zcp-zb19GLoDhgTKHw2F8CLcn9eGxqbM
Message-ID: <CACHz=ZiYePphaH6GMM9OA25bzM2pBxCHFH=OidU7CckO=T6oMg@mail.gmail.com>
Subject: Re: [PATCH v2] xen: Strip xen.efi by default
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Wed, Jun 25, 2025 at 12:49=E2=80=AFPM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> On Thu, Jun 12, 2025 at 11:07=E2=80=AFAM Frediano Ziglio
> <frediano.ziglio@cloud.com> wrote:
> >
> > For xen.gz file we strip all symbols and have an additional
> > xen-syms file version with all symbols.
> > Make xen.efi more coherent stripping all symbols too.
> > xen.efi.elf can be used for debugging.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> > Changes since v1:
> > - avoid leaving target if some command fails
> > ---
> >  docs/misc/efi.pandoc  |  8 +-------
> >  xen/Kconfig.debug     |  9 ++-------
> >  xen/Makefile          | 19 -------------------
> >  xen/arch/x86/Makefile |  8 +++++---
> >  4 files changed, 8 insertions(+), 36 deletions(-)
> >
> > diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> > index 11c1ac3346..c66b18a66b 100644
> > --- a/docs/misc/efi.pandoc
> > +++ b/docs/misc/efi.pandoc
> > @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot=
 modules are found.
> >  Once built, `make install-xen` will place the resulting binary directl=
y into
> >  the EFI boot partition, provided `EFI_VENDOR` is set in the environmen=
t (and
> >  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot=
/efi` not
> > -match your system). When built with debug info, the binary can be quit=
e large.
> > -Setting `INSTALL_EFI_STRIP=3D1` in the environment will cause it to be=
 stripped
> > -of debug info in the process of installing. `INSTALL_EFI_STRIP` can al=
so be set
> > -to any combination of options suitable to pass to `strip`, in case the=
 default
> > -ones don't do. The xen.efi binary will also be installed in `/usr/lib6=
4/efi/`,
> > -unless `EFI_DIR` is set in the environment to override this default. T=
his
> > -binary will not be stripped in the process.
> > +match your system).
> >
> >  The binary itself will require a configuration file (names with the `.=
efi`
> >  extension of the binary's name replaced by `.cfg`, and - until an exis=
ting
> > diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> > index d14093017e..cafbb1236c 100644
> > --- a/xen/Kconfig.debug
> > +++ b/xen/Kconfig.debug
> > @@ -147,12 +147,7 @@ config DEBUG_INFO
> >           Say Y here if you want to build Xen with debug information. T=
his
> >           information is needed e.g. for doing crash dump analysis of t=
he
> >           hypervisor via the "crash" tool.
> > -         Saying Y will increase the size of the xen-syms and xen.efi
> > -         binaries. In case the space on the EFI boot partition is rath=
er
> > -         limited, you may want to install a stripped variant of xen.ef=
i in
> > -         the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> > -         docs/misc/efi.pandoc for more information - when not using
> > -         "make install-xen" for installing xen.efi, stripping needs to=
 be
> > -         done outside the Xen build environment).
> > +         Saying Y will increase the size of the xen-syms and xen.efi.e=
lf
> > +         binaries.
> >
> >  endmenu
> > diff --git a/xen/Makefile b/xen/Makefile
> > index 8fc4e042ff..664c4ea7b8 100644
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -488,22 +488,6 @@ endif
> >  .PHONY: _build
> >  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
> >
> > -# Strip
> > -#
> > -# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped bef=
ore it
> > -# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s=
) below
> > -# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
> > -# option(s) to the strip command.
> > -ifdef INSTALL_EFI_STRIP
> > -
> > -ifeq ($(INSTALL_EFI_STRIP),1)
> > -efi-strip-opt :=3D --strip-debug --keep-file-symbols
> > -else
> > -efi-strip-opt :=3D $(INSTALL_EFI_STRIP)
> > -endif
> > -
> > -endif
> > -
> >  .PHONY: _install
> >  _install: D=3D$(DESTDIR)
> >  _install: T=3D$(notdir $(TARGET))
> > @@ -530,9 +514,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
> >                 ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-=
$(XEN_VERSION).efi; \
> >                 ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).=
efi; \
> >                 if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; th=
en \
> > -                       $(if $(efi-strip-opt), \
> > -                            $(STRIP) $(efi-strip-opt) -p -o $(TARGET).=
efi.stripped $(TARGET).efi && \
> > -                            $(INSTALL_DATA) $(TARGET).efi.stripped $(D=
)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
> >                         $(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPO=
INT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
> >                 elif [ "$(D)" =3D "$(patsubst $(shell cd $(XEN_ROOT) &&=
 pwd)/%,%,$(D))" ]; then \
> >                         echo 'EFI installation only partially done (EFI=
_VENDOR not set)' >&2; \
> > diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> > index ce724a9daa..e0ebc8c73e 100644
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -232,14 +232,16 @@ endif
> >         $(MAKE) $(build)=3D$(@D) .$(@F).1r.o .$(@F).1s.o
> >         $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
> >               $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y=
) \
> > -             $(note_file_option) -o $@
> > -       $(NM) -pa --format=3Dsysv $@ \
> > +             $(note_file_option) -o $@.tmp
> > +       $(NM) -pa --format=3Dsysv $@.tmp \
> >                 | $(objtree)/tools/symbols --all-symbols --xensyms --sy=
sv --sort \
> >                 > $@.map
> >  ifeq ($(CONFIG_DEBUG_INFO),y)
> > -       $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY=
) -O elf64-x86-64 $@ $@.elf
> > +       $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY=
) -O elf64-x86-64 $@.tmp $@.elf
> > +       $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) =
$@.tmp
> >  endif
> >         rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> > +       mv -f $@.tmp $@
> >  ifeq ($(CONFIG_XEN_IBT),y)
> >         $(SHELL) $(srctree)/tools/check-endbr.sh $@
> >  endif
>
> Any comments on this version?
>
> Frediano

