Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7BC9B4ADC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 14:25:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827397.1241990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5mDa-0003mQ-FA; Tue, 29 Oct 2024 13:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827397.1241990; Tue, 29 Oct 2024 13:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5mDa-0003jq-Bv; Tue, 29 Oct 2024 13:25:06 +0000
Received: by outflank-mailman (input) for mailman id 827397;
 Tue, 29 Oct 2024 13:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WX/=RZ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t5mDY-0003jk-V0
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 13:25:05 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32bdf91b-95f9-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 14:25:01 +0100 (CET)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3e6359ab118so1762433b6e.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 06:25:00 -0700 (PDT)
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
X-Inumbo-ID: 32bdf91b-95f9-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoyMmMiLCJoZWxvIjoibWFpbC1vaTEteDIyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMyYmRmOTFiLTk1ZjktMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjA4MzAxLjExNzUxMiwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730208300; x=1730813100; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZ8b6OUpuMdFA2NZvqdbg6qA4P6P0vagI2On9U05ssg=;
        b=OWGMZ18wBSeY1SnSBAi/s0/lKMKVxz8GdPkbM5+FGh9VlJdJGDcJCm+wrxUkeoE/sC
         YciC8TxOGsfmP7mlutX3zp3suD80ojME/ql07Rf4J3WCze5ew6B8A6ExJjWaLm0aAv84
         qHj/n3zOACxQpLgjgn8mAFRNwFBxHPDqXFn2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730208300; x=1730813100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZ8b6OUpuMdFA2NZvqdbg6qA4P6P0vagI2On9U05ssg=;
        b=mMzYKtv0QmqDGSkQocqqW90Xh7N3dmtYahhO1slg8Vj5aNdGjzTwBFXgojIplUrwrx
         +HQaY9J+ZoUzpFRRKW80p0V5YOnyL9LXhIC9cYsZMiEA4evcFtpVWpMyj7XvJBDdF2C1
         gih3si5lg2X3iP43y1qcDhkjSg+GkuZZlJkUmg3H1rEgVq1VbyjbYoC72MuR6nMvpRIh
         F0a9mFufRkbTEBFUIXYRSpzyd0QnOY2Hr7CtZANZioIPp3sDXIWhvwsR/nYQKn8zEp5E
         FK4enKAB4VdSFTz7MAntDOw1ZMuK48WLFU2rNCRzLv3e2SuuPk2lSTanIYa1P79IGxHv
         coyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNyVOxk6KbxG0JcKSp17wt7GLDzCYDc2hmjghHFh/u2UlGPj3kf5dRousCCbh9Kb+GpNha5BAPe7E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznAWIAQaSJS1a7xEYXshuE5LZM4aOLLVWmXnVVCZoRb9IUmsCo
	iTUyLCdmc3fHwgTBxe2YABianGbPC38E23RaimU1xzRPA/brkyMXhJ/baDddUa7fp9OyX6VyV1q
	YfILHzea2X3TRbUT+9Yt9KMa1yU7I5U/ySdqRAQ==
X-Google-Smtp-Source: AGHT+IGDGsLI84UTcRtXFxhNeTC/RIyN5j6gmFLyytYHcqCJRGCk5+ub99J6bZNfZczgWecPVKyHHD0xwW9X+Owc0+E=
X-Received: by 2002:a05:6808:1b98:b0:3e2:9468:49db with SMTP id
 5614622812f47-3e65294ea06mr1084209b6e.21.1730208299664; Tue, 29 Oct 2024
 06:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-3-alejandro.vallejo@cloud.com> <0a644e0d-b7dc-49b5-b4ba-943f809286a8@citrix.com>
 <D589SQ8Y0WGU.2MM4HPFUKJYGT@cloud.com>
In-Reply-To: <D589SQ8Y0WGU.2MM4HPFUKJYGT@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 29 Oct 2024 13:24:48 +0000
Message-ID: <CACHz=ZgDVFMo-if54oivyjK-hr5nnN8PKDp1YT_KL3e3R84HNQ@mail.gmail.com>
Subject: Re: [PATCH 02/14] x86/xstate: Create map/unmap primitives for xsave areas
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 11:58=E2=80=AFAM Alejandro Vallejo
<alejandro.vallejo@cloud.com> wrote:
>
> Hi,
>
> On Mon Oct 28, 2024 at 5:20 PM GMT, Andrew Cooper wrote:
> > On 28/10/2024 3:49 pm, Alejandro Vallejo wrote:
> > > diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include=
/asm/xstate.h
> > > index 07017cc4edfd..36260459667c 100644
> > > --- a/xen/arch/x86/include/asm/xstate.h
> > > +++ b/xen/arch/x86/include/asm/xstate.h
> > > @@ -143,4 +143,24 @@ static inline bool xstate_all(const struct vcpu =
*v)
> > >             (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
> > >  }
> > >
> > > +/*
> > > + * Fetch a pointer to the XSAVE area of a vCPU
> > > + *
> > > + * If ASI is enabled for the domain, this mapping is pCPU-local.
> > > + *
> > > + * @param v Owner of the XSAVE area
> > > + */
> > > +#define vcpu_map_xsave_area(v) ((v)->arch.xsave_area)
> > > +
> > > +/*
> > > + * Drops the XSAVE area of a vCPU and nullifies its pointer on exit.
> > > + *
> > > + * If ASI is enabled and v is not the currently scheduled vCPU then =
the
> > > + * per-pCPU mapping is removed from the address space.
> > > + *
> > > + * @param v           vCPU logically owning xsave_area
> > > + * @param xsave_area  XSAVE blob of v
> > > + */
> > > +#define vcpu_unmap_xsave_area(v, x) ({ (x) =3D NULL; })
> > > +
> >
> > Is there a preview of how these will end up looking with the real ASI
> > bits in place?
>
> I expect the contents to be something along these lines (in function form=
 for
> clarity):
>
>   struct xsave_struct *vcpu_map_xsave_area(struct vcpu *v)
>   {
>       if ( !v->domain->asi )
>           return v->arch.xsave_area;
>
>       if ( likely(v =3D=3D current) )
>           return percpu_fixmap(v, PCPU_FIX_XSAVE_AREA);
>
>       /* Likely some new vmap-like abstraction after AMX */
>       return map_domain_page(v->arch.xsave_area_pg);
>   }
>
> Where:
>   1. v->arch.xsave_area is a pointer to the XSAVE area on non-ASI domains=
.
>   2. v->arch.xsave_area_pg an mfn (or a pointer to a page_info, converted=
)
>   3. percpu_fixmap(v, PCPU_FIX_XSAVE_AREA) is a slot in a per-vCPU fixmap=
, that
>      changes as we context switch from vCPU to vCPU.
>
>   /*
>    * NOTE: Being a function this doesn't nullify the xsave_area pointer, =
but
>    * it would in a macro. It's unimportant for the overall logic though.
>    */
>   void vcpu_unmap_xsave_area(struct vcpu *v, struct xsave_struct *xsave_a=
rea)
>   {
>       /* Catch mismatched areas when ASI is disabled */
>       ASSERT(v->domain->asi || xsave_area =3D=3D v->arch.xsave_area);
>
>       /* Likely some new vunmap-like abstraction after AMX */
>       if ( v->domain->asi && v !=3D current )
>           unmap_domain_page(xsave_area);
>   }
>
> Of course, many of these details hang in the balance of what happens to t=
he ASI
> series from Roger. In any case, the takeaway is that map/unmap must have
> fastpaths for "current" that don't involve mapping. The assumption is tha=
t
> non-current vCPUs are cold paths. In particular, context switches will un=
dergo
> some refactoring in order to make save/restore not require additional
> map/unmaps besides the page table switch and yet another change to furthe=
r
> align "current" with the currently running page tables. Paths like the
> instruction emulator go through these wrappers later on for ease of
> auditability, but are early-returns that cause no major overhead.
>
> My expectation is that these macros are general enough to be tweakable in
> whatever way is most suitable, thus allowing the refactor of the codebase=
 at
> large to make it ASI-friendly before the details of the ASI infra are mer=
ged,
> or even finalised.
>
> >
> > Having a macro-that-reads-like-a-function mutating x by name, rather
> > than by pointer, is somewhat rude.  This is why we capitalise
> > XFREE()/etc which have a similar pattern; to make it clear it's a macro
> > and potentially doing weird things with scopes.
> >
> > ~Andrew
>
> That magic trick on unmap warrants uppercase, agreed. Initially it was al=
l
> function calls and after macrofying them I was lazy to change their users=
.
>
> Cheers,
> Alejandro
>

Why not using static inline functions?

On the documentation, I found weird that "v" is described quite
differently for the 2 macros:
1) @param v Owner of the XSAVE area;
2) @param v           vCPU logically owning xsave_area

For "x" the documentation is "@param xsave_area  XSAVE blob of v", but
there's no "xsave_area" parameter.

(very minors, you can ignore)

Frediano

