Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B26BD826CBC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663404.1033297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMno0-0006iX-T4; Mon, 08 Jan 2024 11:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663404.1033297; Mon, 08 Jan 2024 11:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMno0-0006gr-QA; Mon, 08 Jan 2024 11:28:32 +0000
Received: by outflank-mailman (input) for mailman id 663404;
 Mon, 08 Jan 2024 11:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvth=IS=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rMnnz-0006fv-SS
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:28:31 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cee88a9-ae19-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 12:28:31 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e835800adso1483928e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 03:28:31 -0800 (PST)
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
X-Inumbo-ID: 0cee88a9-ae19-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704713310; x=1705318110; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQDGnlU2euDtKu+TBX/qB/R9Wk4CqZoKyE3Up4ReVPM=;
        b=UAG+YsRPL2FN+TJo/7IZqaiNnurFLB97R5Ua/v05jAgM4kGHg+BwgrabqIFSmwAM53
         TEPtH6gJlSs1NHSKD73XQ/Y/tNruUe8MmY0ML2HXsOzFSxeQ95sKSxA01mUbjoiUiKbb
         2+qKYmq6qbKKJDIqW8odlKiFzyk/0ggpMuQKy5hswcJb5fnotTnTwvQlCANF39+H3Pp+
         kZGt+wkQo1HeEE4eZ9itxkcKSeO1oU7+4yPxSdjvxPGL5Qpe1/cCsIiME1dUkxnkUqo0
         PkvMQh/ZTf0F117ChztwhUA/R+gg2xtJftRPWAYrVGa40z1gHG+U+8A6RrEGvbkKI60W
         klVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704713310; x=1705318110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQDGnlU2euDtKu+TBX/qB/R9Wk4CqZoKyE3Up4ReVPM=;
        b=qmcD9oXico6XF24ZXnu+y3X1hKLFl58T8nKebcJtOraLbZU682AXSiJc5PNNuRrEeH
         nNLe9B6pqE/7Lwj8A4YCnJodDI8Ln/4XOBqf8dtHI6V5X595S0mTPLU+VOCJRs+l9u26
         fVvQw5tJhjnRxpF7CvCU7LnPMoBldwtektdSBtj65y6G41gEo+sS5w65D6KPMqTLdMcl
         DlKUgKpLZVEDffm3COXhJ2HNKRFj7+m5uqoDECzengYC3btWV74eJFrWO5IaR4+MbQ6f
         FA/HBVD8qL6Cv4s5vwnLSirf36+iBOvCgqHp+agFRPWsN13AChh/LePxFxJ/lCvKaSXM
         X6tQ==
X-Gm-Message-State: AOJu0YzgGS+kCRnr+eQG68hSk148b4Fxi23dezldjZeVkr2BYxVmiApY
	xb2vNQfcNhmeko/TOl8Jcrr5ub2CS+0c+4PxG1nWNN04W6OV+g==
X-Google-Smtp-Source: AGHT+IFk13PtNMe86SRsxSRbOdpzBPs3gc4jQJIxsjZD+lZQR7J6tkeR4QPfbsQndZ0lbkGrNlUlht/LphHmbu+A684=
X-Received: by 2002:a19:5e5e:0:b0:50e:3e1d:9bb9 with SMTP id
 z30-20020a195e5e000000b0050e3e1d9bb9mr767271lfi.80.1704713310552; Mon, 08 Jan
 2024 03:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-12-carlo.nonato@minervasys.tech> <05b6e12c-059d-47e7-8859-a291080c4dd4@xen.org>
In-Reply-To: <05b6e12c-059d-47e7-8859-a291080c4dd4@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 8 Jan 2024 12:28:19 +0100
Message-ID: <CAG+AhRWSTVoB5gx_epB3GaBoady8HtwOMyBut18YHguvSZnRow@mail.gmail.com>
Subject: Re: [PATCH v5 11/13] Revert "xen/arm: Remove unused BOOT_RELOC_VIRT_START"
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Fri, Jan 5, 2024 at 7:20=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi Carlo,
>
> On 02/01/2024 09:51, Carlo Nonato wrote:
> > This reverts commit 0c18fb76323bfb13615b6f13c98767face2d8097 (not clean=
).
> >
> > This is not a clean revert since the rework of the memory layout, but i=
t is
> > sufficiently similar to a clean one.
> > The only difference is that the BOOT_RELOC_VIRT_START must match the ne=
w
> > layout.
> >
> > Cache coloring support for Xen needs to relocate Xen code and data in a=
 new
> > colored physical space. The BOOT_RELOC_VIRT_START will be used as the v=
irtual
> > base address for a temporary mapping to this new space.
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > ---
> >   xen/arch/arm/include/asm/mmu/layout.h | 2 ++
> >   xen/arch/arm/mmu/setup.c              | 1 +
> >   2 files changed, 3 insertions(+)
> >
> > diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/inclu=
de/asm/mmu/layout.h
> > index eac7eef885..30031f74d9 100644
> > --- a/xen/arch/arm/include/asm/mmu/layout.h
> > +++ b/xen/arch/arm/include/asm/mmu/layout.h
> > @@ -74,6 +74,8 @@
> >   #define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE=
)
> >   #define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
> >
> > +#define BOOT_RELOC_VIRT_START   (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_S=
IZE)
>
> This new addition wants to be documented in the layout comment in a few
> lines above. Also, the area you are using is 2MB whereas Xen can now be
> up to 8MB.
>
> Secondly, you want to add a BOOTRELOC_VIRT_SIZE with a check in
> build_assertions() making sure that this is at least as big as
> XEN_VIRT_SIZE.
>
> Overall, I am not sure this is really a revert at this point. The idea
> is the same, but you are defining BOOT_FDT_VIRT_START differently.
>
> To me it feels like it belong to the first patch where you will use it.
> And that would be ok to mention in the commit message that the idea was
> borrowed from a previously reverted commit.

Ok, nice.

> > +
> >   #ifdef CONFIG_LIVEPATCH
> >   #define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_=
SIZE)
> >   #define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
> > diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> > index d5264e51bc..37b6d230ad 100644
> > --- a/xen/arch/arm/mmu/setup.c
> > +++ b/xen/arch/arm/mmu/setup.c
> > @@ -69,6 +69,7 @@ static void __init __maybe_unused build_assertions(vo=
id)
> >       /* 2MB aligned regions */
> >       BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
> >       BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
> > +    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
> >       /* 1GB aligned regions */
> >   #ifdef CONFIG_ARM_32
> >       BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
>
> --
> Julien Grall

Thanks.

