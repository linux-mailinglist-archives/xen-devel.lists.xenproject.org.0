Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DAA5A779A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 09:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395553.635305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTIHD-0007Yw-2i; Wed, 31 Aug 2022 07:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395553.635305; Wed, 31 Aug 2022 07:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTIHC-0007WB-U8; Wed, 31 Aug 2022 07:36:42 +0000
Received: by outflank-mailman (input) for mailman id 395553;
 Wed, 31 Aug 2022 07:36:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uX/h=ZD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oTIHB-0007W5-V9
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 07:36:42 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a63129dd-28ff-11ed-a60c-1f1ba7de4fb0;
 Wed, 31 Aug 2022 09:36:40 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 w88-20020a17090a6be100b001fbb0f0b013so14160145pjj.5
 for <xen-devel@lists.xenproject.org>; Wed, 31 Aug 2022 00:36:39 -0700 (PDT)
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
X-Inumbo-ID: a63129dd-28ff-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=DwjQUToKlNF4wGFvU0axzyqoPs1gr8FO/gCUWrBEMEM=;
        b=cYRS5YJKSDnPGKGmflAt5fKiYYiaPFLldKJjYc7692vuJMi2lfljb2/7TeNtQ3bKZT
         n90/aHeZY91gZTKjz4cC52DBHlZfi/P0Jj9lF1A6/iNrHnArSRNgPoJHUxqhjDrMuMmM
         AJObPhe4jrGcYvMTJ8fk3f3jMh1iYuk5EppXjbhpgP2hsrwZZYPi0yFUHcIUjozNCVlJ
         ZZOMLl/aIs+7ATXvyV99+vOLcxA2znOTIRxIYVDaGzhLKsA/LjGxVz5h9+kRPO3xtVF7
         Dz1/tyFSlye2/JMGoX5FsxqhEwH1TapiK7qIFlG7lb6tz/JIZBkl96T6aqFFvqmIStpo
         LE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=DwjQUToKlNF4wGFvU0axzyqoPs1gr8FO/gCUWrBEMEM=;
        b=H42jXxwby5qxeeA+ETNH1lIH/xczJyV8Nw2nc0vYVOlKz28GlNQy8LhaT89LaMxzPk
         bsf4X3Ey+kgF1951YdpY4NudHQBxPaxId/j2UB1ar2awxuFggQzCp75ojfmnz/1HYSTB
         Lj/fKzeAI19XkvwuFGNHtS5SxK8fh3n5DtP0PAoix0iCVkgaoBX8r3LUodnGkyHb/Lgg
         1Tzb/DTvkroYxRKx0fNhOB01lPBuaThaGzhjF6faD9Moz9AoDrg7Uh+koagFvUKJfE3u
         /I/u9DYmCj+CCrUHhK7SahEpTrBnLHg65MFqSyVrxM0EvlqVsLRrXkF0SnoC3ZKvg1vb
         BPxA==
X-Gm-Message-State: ACgBeo0NFxS+uas2unc8cOtiOAIm2xlzg9/0FLNc1ZB29MX85BKdMOWc
	QJp/pYnpnkwrsNffLTqR1C9MwaxAkFjQYbB1HvN4Hg==
X-Google-Smtp-Source: AA6agR7NoqXXgtrJV45vKc2dPcX8Q8L3boyS6LZpg5K8y202CpNPfHiKgqcVoVNduy+dYngHWyj1i/2wPuU4opsJ1Ao=
X-Received: by 2002:a17:902:c411:b0:170:91ff:884b with SMTP id
 k17-20020a170902c41100b0017091ff884bmr24863786plk.58.1661931398208; Wed, 31
 Aug 2022 00:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <24ba49bb-66b5-a1e4-cef4-e30b438b3c04@amd.com>
In-Reply-To: <24ba49bb-66b5-a1e4-cef4-e30b438b3c04@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 31 Aug 2022 09:36:27 +0200
Message-ID: <CAHUa44EdCbsiBK-M_P4Zay9hmyU6619N-YRFKb+9KqbvH3D4WQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] xen/arm: add a primitive FF-A mediator
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

On Wed, Aug 24, 2022 at 11:28 AM Michal Orzel <michal.orzel@amd.com> wrote:
>
> Hi Jens,
>
> On 18/08/2022 12:55, Jens Wiklander wrote:
> > Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
> > Partition in secure world.
> >
> > This commit brings in only the parts needed to negotiate FF-A version
> > number with guest and SPMC.
> >
> > A guest configuration variable "ffa_enabled" is used to indicate if a guest
> > is trusted to use FF-A.
> >
> > This is loosely based on the TEE mediator framework and the OP-TEE
> > mediator.
> >
> > [1] https://developer.arm.com/documentation/den0077/latest
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  SUPPORT.md                        |   7 +
> >  docs/man/xl.cfg.5.pod.in          |  15 ++
> >  tools/include/libxl.h             |   6 +
> >  tools/libs/light/libxl_arm.c      |   3 +
> >  tools/libs/light/libxl_types.idl  |   1 +
> >  tools/xl/xl_parse.c               |   3 +
> >  xen/arch/arm/Kconfig              |  11 +
> >  xen/arch/arm/Makefile             |   1 +
> >  xen/arch/arm/domain.c             |  10 +
> >  xen/arch/arm/domain_build.c       |   1 +
> >  xen/arch/arm/ffa.c                | 354 ++++++++++++++++++++++++++++++
> >  xen/arch/arm/include/asm/domain.h |   4 +
> >  xen/arch/arm/include/asm/ffa.h    |  71 ++++++
> >  xen/arch/arm/vsmc.c               |  17 +-
> >  xen/include/public/arch-arm.h     |   2 +
> >  15 files changed, 503 insertions(+), 3 deletions(-)
> >  create mode 100644 xen/arch/arm/ffa.c
> >  create mode 100644 xen/arch/arm/include/asm/ffa.h
> >
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index 70e98964cbc0..215bb3c9043b 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -785,6 +785,13 @@ that covers the DMA of the device to be passed through.
> >
> >  No support for QEMU backends in a 16K or 64K domain.
> >
> > +### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
> > +
> > +    Status, Arm64: Tech Preview
> > +
> > +There are still some code paths where a vCPU may hog a pCPU longer than
> > +necessary. The FF-A mediator is not yet implemented for Arm32.
> > +
> >  ### ARM: Guest Device Tree support
> >
> >      Status: Supported
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index b98d1613987e..234c036aecb1 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -1616,6 +1616,21 @@ This feature is a B<technology preview>.
> >
> >  =back
> >
> > +=item B<ffa_enabled=BOOLEAN>
> Looking at other config options, we usually have <feature>=BOOLEAN (without _enabled), so
> I would just stick to "ffa". This would require changes in other places accordingly.

OK, I'll update.

>
> > +
> > +B<Arm only.> Allow a guest to communicate via FF-A with Secure Partitions
> > +(SP), default false.
> > +
> > +Currently is only a small subset of the FF-A specification supported. Just
> Should be:
> "Currently only a small subset of the FF-A specification is supported"
>
> > +enough to communicate with OP-TEE. In general all the basic things and
> "basic things" sounds a bit ambiguous.

I'll rephrase.

>
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > index 2a42da2f7d78..bf4544bef399 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -646,6 +646,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
> Applying this patch results in a failure here so you need to rebase it on top of latest status.

OK, I'll rebase the next patchset.

>
> Also, FWICS (can be checked by the toolstack maintainers) you are missing the required
> changes in:
>  - tools/golang/xenlight/helpers.gen.go
>  - tools/golang/xenlight/types.gen.go
>  - tools/ocaml/libs/xc/xenctrl.ml
>  - tools/ocaml/libs/xc/xenctrl.mli

I'll update.

Thanks for the review.

Cheers,
Jens

