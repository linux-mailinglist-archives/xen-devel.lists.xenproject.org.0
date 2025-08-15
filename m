Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFDBB27E4F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 12:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083266.1442906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrkl-0001hm-Fo; Fri, 15 Aug 2025 10:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083266.1442906; Fri, 15 Aug 2025 10:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrkl-0001fZ-Cb; Fri, 15 Aug 2025 10:33:43 +0000
Received: by outflank-mailman (input) for mailman id 1083266;
 Fri, 15 Aug 2025 10:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDBg=23=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1umrkk-000128-1I
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 10:33:42 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f825f53-79c3-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 12:33:41 +0200 (CEST)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-61bd4d9fe61so980735eaf.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 03:33:41 -0700 (PDT)
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
X-Inumbo-ID: 4f825f53-79c3-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755254020; x=1755858820; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPfGx67bHtSWcI3qHAZKZtXgMIn73goR5PnuAZZZSOU=;
        b=LZ3KEj2xMAP3OFlKfLXEbdeaEzMhtwqiU8Qg2DGPpf/MWW9D5bI3RRS/097nOqL/aP
         lkhKkcjHeWWmYi50ver9z3Dszcw+LtQSnnGtcjRLViEfd2BDQyd4v+61+3l53f7HJpMQ
         Vh4b2eujVV3pDouhEhe69JENNf7q/20w8zHuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755254020; x=1755858820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPfGx67bHtSWcI3qHAZKZtXgMIn73goR5PnuAZZZSOU=;
        b=wNZv0S2YFlp8rCRVZ6qMZhMNQ+dvzV1Lz0TbPoD4kK6j2QNH4YAywn135ng4cyRw2M
         R8bLmrU3SCzkDppg+NvVRAgQfHpEsZn/yiYiLLXTT6bazGOVUsMDntWRlGNSYCVzZ+ik
         8smHuJ8jr1kqh+Hxtjn4ppSBCsZdDVrtQ4hBNbVxRpPxA78vHEg7HhCGlFom7C7yv+s7
         CKqaMK+YfGxEPTQ/TYZkHm/bzuFrEA6QrPrFn9dL27YLfKHBMEomzAKssapziIwlIMai
         r8XsCztdzmcpcSq1rdx8siE855gGSl3JDl951CLrqjp92DYU/wbAtX0Xl7un0TKtiIow
         LJMQ==
X-Gm-Message-State: AOJu0YwXDSL+fa9b2M/LORy0XIogY8ZFOsSGfgcDHiFYyoqGPVNkOw4c
	JwWAjdlkVpb6WZa2LjABepSbvOvqnwiSeNtWcHyfNHqsX4rXNzaN3kvMSpQq+4AX6fgk+cJKNUQ
	+4SNO7Qxwu4tUC6n8OEo+EC/xG02hYZI7vYran2i4qgNmQinMhqZ+0Qk=
X-Gm-Gg: ASbGncuKwRAlWydmlzaUZh3BX/MkdElpcyXqRbAVUP3vcu+8lpkFLyJFU4xscB7cgHG
	hqPog8V8OUPObUOhSD48JCCmiUdSgDOv9O87lMx8uEpfgY4GqhVPDOOzbwVJCrzNNjCLjIGjoS0
	4epMUa7n/2HhsZ2fyKXs0ksNqiAeFO8NzMket+KUBUy0Fz97svgC6gFBrHCHw3daZDnBaXFYrw0
	RYYKA==
X-Google-Smtp-Source: AGHT+IHvgsW+72UH83evf2dolDF2WuE16sGExLlhRvkOSZXTnbR2Ma9/Bj59kOw5YHrBIB/9T2o/Tv7lOMX/2sBSMSg=
X-Received: by 2002:a05:6808:3092:b0:434:e9a5:b7f4 with SMTP id
 5614622812f47-435ec3eda1fmr643463b6e.21.1755254019915; Fri, 15 Aug 2025
 03:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250612100705.21988-1-frediano.ziglio@cloud.com>
 <CACHz=ZjeiTx5uktt8C=5CC+WzYywgV=e+w=nL++N+9cUbLUEiQ@mail.gmail.com> <CACHz=ZiYePphaH6GMM9OA25bzM2pBxCHFH=OidU7CckO=T6oMg@mail.gmail.com>
In-Reply-To: <CACHz=ZiYePphaH6GMM9OA25bzM2pBxCHFH=OidU7CckO=T6oMg@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 15 Aug 2025 11:33:29 +0100
X-Gm-Features: Ac12FXxvxDsJF0DChLCmtByMkRs4odZNNnK1SzI076bcUnsJ2HzutjfQlc7iLcU
Message-ID: <CACHz=ZhvbRuRQSNx9BZ_g+U7TvH=eyKD4-qJBNZomaiJnE4Xzw@mail.gmail.com>
Subject: Re: [PATCH v2] xen: Strip xen.efi by default
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Mon, Jul 28, 2025 at 11:34=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> ping
>
> On Wed, Jun 25, 2025 at 12:49=E2=80=AFPM Frediano Ziglio
> <frediano.ziglio@cloud.com> wrote:
> >
> > On Thu, Jun 12, 2025 at 11:07=E2=80=AFAM Frediano Ziglio
> > <frediano.ziglio@cloud.com> wrote:
> > >
> > > For xen.gz file we strip all symbols and have an additional
> > > xen-syms file version with all symbols.
> > > Make xen.efi more coherent stripping all symbols too.
> > > xen.efi.elf can be used for debugging.
> > >
> > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > ---
> > > Changes since v1:
> > > - avoid leaving target if some command fails
> > > ---
> > >  docs/misc/efi.pandoc  |  8 +-------
> > >  xen/Kconfig.debug     |  9 ++-------
> > >  xen/Makefile          | 19 -------------------
> > >  xen/arch/x86/Makefile |  8 +++++---
> > >  4 files changed, 8 insertions(+), 36 deletions(-)
> > >
> > > diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> > > index 11c1ac3346..c66b18a66b 100644
> > > --- a/docs/misc/efi.pandoc
> > > +++ b/docs/misc/efi.pandoc
> > > @@ -20,13 +20,7 @@ Xen to load the configuration file even if multibo=
ot modules are found.
> > >  Once built, `make install-xen` will place the resulting binary direc=
tly into
> > >  the EFI boot partition, provided `EFI_VENDOR` is set in the environm=
ent (and
> > >  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/bo=
ot/efi` not
> > > -match your system). When built with debug info, the binary can be qu=
ite large.
> > > -Setting `INSTALL_EFI_STRIP=3D1` in the environment will cause it to =
be stripped
> > > -of debug info in the process of installing. `INSTALL_EFI_STRIP` can =
also be set
> > > -to any combination of options suitable to pass to `strip`, in case t=
he default
> > > -ones don't do. The xen.efi binary will also be installed in `/usr/li=
b64/efi/`,
> > > -unless `EFI_DIR` is set in the environment to override this default.=
 This
> > > -binary will not be stripped in the process.
> > > +match your system).
> > >
> > >  The binary itself will require a configuration file (names with the =
`.efi`
> > >  extension of the binary's name replaced by `.cfg`, and - until an ex=
isting
> > > diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> > > index d14093017e..cafbb1236c 100644
> > > --- a/xen/Kconfig.debug
> > > +++ b/xen/Kconfig.debug
> > > @@ -147,12 +147,7 @@ config DEBUG_INFO
> > >           Say Y here if you want to build Xen with debug information.=
 This
> > >           information is needed e.g. for doing crash dump analysis of=
 the
> > >           hypervisor via the "crash" tool.
> > > -         Saying Y will increase the size of the xen-syms and xen.efi
> > > -         binaries. In case the space on the EFI boot partition is ra=
ther
> > > -         limited, you may want to install a stripped variant of xen.=
efi in
> > > -         the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> > > -         docs/misc/efi.pandoc for more information - when not using
> > > -         "make install-xen" for installing xen.efi, stripping needs =
to be
> > > -         done outside the Xen build environment).
> > > +         Saying Y will increase the size of the xen-syms and xen.efi=
.elf
> > > +         binaries.
> > >
> > >  endmenu
> > > diff --git a/xen/Makefile b/xen/Makefile
> > > index 8fc4e042ff..664c4ea7b8 100644
> > > --- a/xen/Makefile
> > > +++ b/xen/Makefile
> > > @@ -488,22 +488,6 @@ endif
> > >  .PHONY: _build
> > >  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
> > >
> > > -# Strip
> > > -#
> > > -# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped b=
efore it
> > > -# is installed. If INSTALL_EFI_STRIP is '1', then the default option=
(s) below
> > > -# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as t=
he
> > > -# option(s) to the strip command.
> > > -ifdef INSTALL_EFI_STRIP
> > > -
> > > -ifeq ($(INSTALL_EFI_STRIP),1)
> > > -efi-strip-opt :=3D --strip-debug --keep-file-symbols
> > > -else
> > > -efi-strip-opt :=3D $(INSTALL_EFI_STRIP)
> > > -endif
> > > -
> > > -endif
> > > -
> > >  .PHONY: _install
> > >  _install: D=3D$(DESTDIR)
> > >  _install: T=3D$(notdir $(TARGET))
> > > @@ -530,9 +514,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
> > >                 ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T=
)-$(XEN_VERSION).efi; \
> > >                 ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T=
).efi; \
> > >                 if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; =
then \
> > > -                       $(if $(efi-strip-opt), \
> > > -                            $(STRIP) $(efi-strip-opt) -p -o $(TARGET=
).efi.stripped $(TARGET).efi && \
> > > -                            $(INSTALL_DATA) $(TARGET).efi.stripped $=
(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
> > >                         $(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNT=
POINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
> > >                 elif [ "$(D)" =3D "$(patsubst $(shell cd $(XEN_ROOT) =
&& pwd)/%,%,$(D))" ]; then \
> > >                         echo 'EFI installation only partially done (E=
FI_VENDOR not set)' >&2; \
> > > diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> > > index ce724a9daa..e0ebc8c73e 100644
> > > --- a/xen/arch/x86/Makefile
> > > +++ b/xen/arch/x86/Makefile
> > > @@ -232,14 +232,16 @@ endif
> > >         $(MAKE) $(build)=3D$(@D) .$(@F).1r.o .$(@F).1s.o
> > >         $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
> > >               $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling=
-y) \
> > > -             $(note_file_option) -o $@
> > > -       $(NM) -pa --format=3Dsysv $@ \
> > > +             $(note_file_option) -o $@.tmp
> > > +       $(NM) -pa --format=3Dsysv $@.tmp \
> > >                 | $(objtree)/tools/symbols --all-symbols --xensyms --=
sysv --sort \
> > >                 > $@.map
> > >  ifeq ($(CONFIG_DEBUG_INFO),y)
> > > -       $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCO=
PY) -O elf64-x86-64 $@ $@.elf
> > > +       $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCO=
PY) -O elf64-x86-64 $@.tmp $@.elf
> > > +       $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP=
) $@.tmp
> > >  endif
> > >         rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> > > +       mv -f $@.tmp $@
> > >  ifeq ($(CONFIG_XEN_IBT),y)
> > >         $(SHELL) $(srctree)/tools/check-endbr.sh $@
> > >  endif
> >
> > Any comments on this version?
> >
> > Frediano

