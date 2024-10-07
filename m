Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED79928C4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 12:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811837.1224512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxkdA-0004Ls-3Q; Mon, 07 Oct 2024 10:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811837.1224512; Mon, 07 Oct 2024 10:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxkdA-0004Js-0N; Mon, 07 Oct 2024 10:06:20 +0000
Received: by outflank-mailman (input) for mailman id 811837;
 Mon, 07 Oct 2024 10:06:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWQm=RD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sxkd8-0004Jm-OD
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 10:06:18 +0000
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [2607:f8b0:4864:20::c32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca3d580c-8493-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 12:06:16 +0200 (CEST)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5e1b35030aeso2383107eaf.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 03:06:16 -0700 (PDT)
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
X-Inumbo-ID: ca3d580c-8493-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728295575; x=1728900375; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QybiIe0c5NadOU57P94fpp2RVSmefrf1PWalMOJsmvo=;
        b=KtKR4eUPBCTwABYrlw8mT4pzOT02EPWL7Nn6hYA2Q6H7dJquP+HdlgOKQFM0gou2u1
         RYDtq6l63u+yUGEfyZyxHAmNeMk5qraKQbJOXlaT2xtGngySE6QK0c/YC+YIennMBvjt
         EZCVBbLaeBmJivS31CTaV60PUX4t5r1VCH3Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728295575; x=1728900375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QybiIe0c5NadOU57P94fpp2RVSmefrf1PWalMOJsmvo=;
        b=M5aeB8VlebZC8KYehIMDIPrjq2Of20zAB8PNlFIGHK07/K/zm8rmVHd4laGJ8mEYLa
         Qs0SxLSNQbKUAgHZgbz6U5pKYbeRnBpQD1ciE2MujD8a3aFW+00U6imzjB9Rg/3Y8ibq
         PcIzpimwaHkHHNV+W71C7AtraXlXTo3QojJF5erL6BbIWfr5dMkqFWH9Q2SXDUCLxPyR
         0gDs7NG9EmyKoIWCi9oALbFwtMbE5J9xnR+HyBTejQMF6A4TO4aOKSh8Zp5AwLS7A9qx
         vDZbX3BQj72Osg6CBeAYG5lkFrKi6EP7OVsYSNrbd7g9j10wC78XM8WHLD+9BHO1R1hR
         WDLg==
X-Gm-Message-State: AOJu0YxXb1Apikr/PxmHlJqHCr0E3IjnVC1wNap1Km+XqFEVhFdqjX92
	wo/gytM1rM7VuJ90L77PXYiF4ybesi1Rz0DnkK/ySxeypoAM9AiMArk1/cSctoYpbrQANFy9lHR
	JfBQp2P9NsyOA/hRVtuAZLq6dm9HH+5BVPmtjsQ==
X-Google-Smtp-Source: AGHT+IHj3zbIvg2kIKf2LKf5aPYjDSiltXsj6Ls/NCUxShteav3Bbh2v+sVUUaf7ZkDX2Bw0i2ZJZL9YH0iu3E1oto0=
X-Received: by 2002:a05:6871:109:b0:270:27e6:6f1a with SMTP id
 586e51a60fabf-287c22b5ae2mr5508641fac.41.1728295575415; Mon, 07 Oct 2024
 03:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
 <20241005080233.1248850-4-frediano.ziglio@cloud.com> <10890c99-f1ed-4e59-a86b-f79cb6065aa9@citrix.com>
In-Reply-To: <10890c99-f1ed-4e59-a86b-f79cb6065aa9@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 7 Oct 2024 11:06:04 +0100
Message-ID: <CACHz=Zj=Bf9cXML1XcHYpC3wXi0A-wvYvy3DTSAVn4xtmOii6w@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/boot: Use boot_vid_info and trampoline_phys
 variables directly from C code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 5, 2024 at 2:43=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 05/10/2024 9:02 am, Frediano Ziglio wrote:
> > diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> > index ade2c5c43d..dcda91cfda 100644
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -510,22 +510,10 @@ trampoline_setup:
> >          mov     %esi, sym_esi(xen_phys_start)
> >          mov     %esi, sym_esi(trampoline_xen_phys_start)
> >
> > -        /* Get bottom-most low-memory stack address. */
> > -        mov     sym_esi(trampoline_phys), %ecx
> > -        add     $TRAMPOLINE_SPACE,%ecx
> > -
> > -#ifdef CONFIG_VIDEO
> > -        lea     sym_esi(boot_vid_info), %edx
> > -#else
> > -        xor     %edx, %edx
> > -#endif
> > -
> >          /* Save Multiboot / PVH info struct (after relocation) for lat=
er use. */
> > -        push    %edx                /* Boot video info to be filled fr=
om MB2. */
> >          mov     %ebx, %edx          /* Multiboot / PVH information add=
ress. */
> > -        /*      reloc(magic/eax, info/edx, trampoline/ecx, video/stk) =
using fastcall. */
> > +        /*      reloc(magic/eax, info/edx) using fastcall. */
> >          call    reloc
> > -        add     $4, %esp
> >
>
> Please split this patch in two.  Just for testing sanity sake if nothing
> else.
>

Sorry, it's not clear how it should be split. What are the 2 parts ?

> Now, while I think the patch is a correct transform of the code, ...
>
> >  #ifdef CONFIG_PVH_GUEST
> >          cmpb    $0, sym_esi(pvh_boot)
> > diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> > index 94b078d7b1..8527fa8d01 100644
> > --- a/xen/arch/x86/boot/reloc.c
> > +++ b/xen/arch/x86/boot/reloc.c
> > @@ -185,7 +188,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in=
, uint32_t video_out, memctx
> >      memory_map_t *mmap_dst;
> >      multiboot_info_t *mbi_out;
> >  #ifdef CONFIG_VIDEO
> > -    struct boot_video_info *video =3D NULL;
> > +    struct boot_video_info *video =3D &boot_vid_info;
>
> ... doesn't this demonstrate that we're again writing into the
> trampoline in-Xen, prior to it placing it in low memory?
>

Yes, C is more readable to human beings.
There's nothing to demonstrate as far as I'm concerned. I pointed out
different times the assumption you can write into the trampoline to
set it up is spread in multiple places. This change just makes it more
clear just using a more readable language.

> > @@ -346,10 +347,10 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_=
in, uint32_t video_out, memctx
> >  }
> >
> >  /* SAF-1-safe */
> > -void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
> > -            uint32_t video_info)
> > +void *reloc(uint32_t magic, uint32_t in)
> >  {
> > -    memctx ctx =3D { trampoline };
> > +    /* Get bottom-most low-memory stack address. */
> > +    memctx ctx =3D { (uint32_t)((long)trampoline_phys + TRAMPOLINE_SPA=
CE) };
>
> Again, while this is a correct transformation (best as I can tell),
> wtf?  Doesn't this mean we're bump-allocating downwards into our own stac=
k?
>
> ~Andrew

Yes, that's how it works, no regressions here.

Frediano

