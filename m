Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A4B998719
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 15:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816135.1230323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sysr0-0004vy-IV; Thu, 10 Oct 2024 13:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816135.1230323; Thu, 10 Oct 2024 13:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sysr0-0004tt-F9; Thu, 10 Oct 2024 13:05:18 +0000
Received: by outflank-mailman (input) for mailman id 816135;
 Thu, 10 Oct 2024 13:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5QbA=RG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sysqy-0004tl-HX
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 13:05:16 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49bf2c54-8708-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 15:05:14 +0200 (CEST)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3e4d624ac28so584353b6e.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 06:05:14 -0700 (PDT)
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
X-Inumbo-ID: 49bf2c54-8708-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728565513; x=1729170313; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYsL2RBidWuogQe1LgUGGqv998IRLRLo33BmImMgceE=;
        b=UsEsY9igly9g8IZiOi5SQF91LMs2NOpsy4I6sCw0UuZpF97qVOpcd2FlFsQ/r9pFTE
         UQThc2YaUt8wWxX+zb2ibm4jKZPW1sh+s7oQkeuFWGgOnQ3l/EbViXyM8omhO/FvAo8o
         W8Gc94SLUYxjvg3jkYPN70alosaxQYp+bKZuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565513; x=1729170313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYsL2RBidWuogQe1LgUGGqv998IRLRLo33BmImMgceE=;
        b=TT3oFumREwOBblxrvC9RJU40MSJd/OtICMTbrPkKIG/gphAaWFAijiYNaDZO/5Jcy2
         oOWlskdcN1e8cvTjyk8xFnzXXyMyTPLB5p2iRZVPEU3ycLInYn8SVHr2dEOhIjSJsXHP
         wVbjoTVR683FmpxAezvd8/19uqc71QnlEBFidnYv6DddA/gJeX5aCVdOWYBpEauh1LR9
         vsyN6MTlVE0l5RU4PvXGuCDhQraPC9hwHE1uh4b8JiH1vdoTohf+DOuSUrEBmQaX9qOI
         3oEZTl3YbDifljEtXyMUG2FggOf3Uj1c4fpmLYnRpbmdCvQZnIkKXgcf5XPvc9MkN3cC
         +gAQ==
X-Gm-Message-State: AOJu0YwBEG+yTIpjCFSeEpvz8f91I8+rguzIOrVjwSRyu+1O9KUHVEDt
	5uB7VwUkqitDEYOUWyNQLeoFNY2mChoMtGgo5jrQFz4GKqapnDuQs1Qu7U3KdMcNDlVAGdVC9XP
	ItOR7p6Z2a9yDZMe4y8WlnUEsz8ItKTb7B3fs0A==
X-Google-Smtp-Source: AGHT+IEzxWBDiFbeg2aN+UhUgvd+hvFam2bnYQORq3j9ILq6H30h8rWmKh3UMDmemQjmnkbSAqpF5vJIy3cKc8SWadI=
X-Received: by 2002:a05:6870:8926:b0:278:234e:6e42 with SMTP id
 586e51a60fabf-288344d5a54mr4175488fac.36.1728565513189; Thu, 10 Oct 2024
 06:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
 <20241007141539.1899350-6-frediano.ziglio@cloud.com> <c7b0092f-9e47-47ae-9a7f-fe28c49c82a3@citrix.com>
In-Reply-To: <c7b0092f-9e47-47ae-9a7f-fe28c49c82a3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 10 Oct 2024 14:05:01 +0100
Message-ID: <CACHz=Zh35SLuTcU-GLM56MHCFFPjyfJ0MWB=72h0_xh6q1vUEQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] x86/boot: Use trampoline_phys variable directly
 from C code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 1:57=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 07/10/2024 3:15 pm, Frediano Ziglio wrote:
> > No more need to pass from assembly code.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> > Changes since v1:
> > - split the 2 variable changes into 2 commits.
> > ---
> >  xen/arch/x86/boot/head.S  | 13 ++++---------
> >  xen/arch/x86/boot/reloc.c |  9 ++++++---
> >  2 files changed, 10 insertions(+), 12 deletions(-)
> >
> > diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> > index ade2c5c43d..32b658fa2b 100644
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -510,22 +510,17 @@ trampoline_setup:
> >          mov     %esi, sym_esi(xen_phys_start)
> >          mov     %esi, sym_esi(trampoline_xen_phys_start)
> >
> > -        /* Get bottom-most low-memory stack address. */
> > -        mov     sym_esi(trampoline_phys), %ecx
> > -        add     $TRAMPOLINE_SPACE,%ecx
> > -
> > +        /* Boot video info to be filled from MB2. */
> >  #ifdef CONFIG_VIDEO
> > -        lea     sym_esi(boot_vid_info), %edx
> > +        lea     sym_esi(boot_vid_info), %ecx
> >  #else
> > -        xor     %edx, %edx
> > +        xor     %ecx, %ecx
> >  #endif
> >
> >          /* Save Multiboot / PVH info struct (after relocation) for lat=
er use. */
> > -        push    %edx                /* Boot video info to be filled fr=
om MB2. */
> >          mov     %ebx, %edx          /* Multiboot / PVH information add=
ress. */
> > -        /*      reloc(magic/eax, info/edx, trampoline/ecx, video/stk) =
using fastcall. */
> > +        /*      reloc(magic/eax, info/edx, video/stk) using fastcall. =
*/
> >          call    reloc
> > -        add     $4, %esp
>
> Sorry - I was expecting you split the patches the other way around.
>

I'll do it again.

> If you drop video first, then trampoline second, there's no churn
> changing video from being on the stack to being in ecx.
>
> As it stands the "video/stk" needs to become "video/ecx".
>

I'll take care.

> >
> >  #ifdef CONFIG_PVH_GUEST
> >          cmpb    $0, sym_esi(pvh_boot)
> > diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> > index 94b078d7b1..4cca61adec 100644
> > --- a/xen/arch/x86/boot/reloc.c
> > +++ b/xen/arch/x86/boot/reloc.c
> > @@ -19,6 +19,9 @@
> >  #include <xen/kconfig.h>
> >  #include <xen/multiboot.h>
> >  #include <xen/multiboot2.h>
> > +#include <xen/page-size.h>
> > +
> > +#include <asm/trampoline.h>
> >
> >  #include <public/arch-x86/hvm/start_info.h>
> >
> > @@ -346,10 +349,10 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_=
in, uint32_t video_out, memctx
> >  }
> >
> >  /* SAF-1-safe */
> > -void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
> > -            uint32_t video_info)
> > +void *reloc(uint32_t magic, uint32_t in, uint32_t video_info)
> >  {
> > -    memctx ctx =3D { trampoline };
> > +    /* Get bottom-most low-memory stack address. */
> > +    memctx ctx =3D { (uint32_t)((long)trampoline_phys + TRAMPOLINE_SPA=
CE) };
>
> You don't need any casts here.  The result can't exceed 1<<20.
>

I'll do

>
> Again, I agree this is a correct transform of the code, but the comment
> you've moved is incorrect AFAICT, and conflicts with
>
> typedef struct memctx {
>     /*
>      * Simple bump allocator.
>      *
>      * It starts from the base of the trampoline and allocates downwards.
>      */
>     uint32_t ptr;
> } memctx;
>
> which is probably my fault, but needs resolving.
>
> What does the trampoline layout actually look like?  Can we see about
> correcting the comments?
>

Can you suggest what I should write?

> ~Andrew

Frediano

