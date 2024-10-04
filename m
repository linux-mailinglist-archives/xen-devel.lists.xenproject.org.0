Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6CF9908CE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 18:16:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810544.1223251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swkyF-0001OT-P2; Fri, 04 Oct 2024 16:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810544.1223251; Fri, 04 Oct 2024 16:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swkyF-0001MJ-M9; Fri, 04 Oct 2024 16:15:59 +0000
Received: by outflank-mailman (input) for mailman id 810544;
 Fri, 04 Oct 2024 16:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YrJ5=RA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1swkyE-0001MD-Hl
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 16:15:58 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef69000a-826b-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 18:15:56 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a93b2070e0cso259212166b.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 09:15:56 -0700 (PDT)
Received: from localhost ([52.174.59.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5d007esm11306066b.29.2024.10.04.09.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 09:15:55 -0700 (PDT)
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
X-Inumbo-ID: ef69000a-826b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728058556; x=1728663356; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAl9116LxFC80Ti/IoeSQvi6I8jDd8Que48ATtHZVbY=;
        b=NtEPs3mtuWRfHxAskv+xz8i4EbEM+/gIqWzIC6WyUTzrLz9xSWe74P5o0Qd/kxvrLR
         5F7LoQRTaQckLhoA3XxNhobya803E6YJvyAjxMkANnJUwZ2pOQ4lK1OIpxsT1buvF9z9
         B4Id/4KUXWDq9ktVVCShxVdsHP5WA5oH2268k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728058556; x=1728663356;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VAl9116LxFC80Ti/IoeSQvi6I8jDd8Que48ATtHZVbY=;
        b=RrcHL9+VvZx6gAEIJoJ/AigL6sLit6ojTXYYclzdVDDXePVhaeFSoLhJG6OWNDvKZg
         eAvKcGAnY3mkm076vkzqCcg5G4p36a/Yyawe0Af53zLLgwqYVq1hLIq6e2roDs9ayBTa
         XYqigieCPIne9c2aCuEexvJhwpmKHMlNxrH7DMKJJRhMaQu9tIvFlUJHfLhAn9oZkZjr
         1qEES+dMad3c59e7XwWm+eZbw3sCH0nuEFJDB7kbupB0cCa4AUzIaYUUifrq3zB62uzr
         bH7jtEZpLa5S6L+j5E7u4cF8nY4O73YsNpNO1GPtP0Lop3+FpqPMNVdilrK3iCcnmp9l
         RZqw==
X-Forwarded-Encrypted: i=1; AJvYcCUE7KUQrygsrW1v+h6AiuHBIE2oWA09NA2OFn8CKZDNUnYXx3xfPNX7de/LsonJEtvDHMKWRPJHVKU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKGKS0OThV7QPIvlvKgYcU7gw/w2MEsuevimaAuNyVks+VqQ0D
	cjV/aF4oSqAinsKvhfuz8HB1CNoiNf+U1KvbsjHR5zZgaCWluoDKTB6PU8jJWwM=
X-Google-Smtp-Source: AGHT+IEoR98S0lYUoSBKbGdpVkuzlm0VuEL6xojnHg1IkEj/d/4g8bLIx89MII/Eb5gbjXeezEVY+g==
X-Received: by 2002:a17:907:d851:b0:a8a:7bed:d327 with SMTP id a640c23a62f3a-a991bd734e8mr258102166b.36.1728058555600;
        Fri, 04 Oct 2024 09:15:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Oct 2024 17:15:54 +0100
Message-Id: <D4N5MSL7BD8A.1EGEU8W875PFN@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/2] x86/fpu: Combine fpu_ctxt and xsave_area in
 arch_vcpu
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
 <20240813142119.29012-2-alejandro.vallejo@cloud.com>
 <2b42323a-961a-4dd8-8cde-f4b19eac0dc5@citrix.com>
In-Reply-To: <2b42323a-961a-4dd8-8cde-f4b19eac0dc5@citrix.com>

Hi,

On Thu Oct 3, 2024 at 8:38 PM BST, Andrew Cooper wrote:
> On 13/08/2024 3:21 pm, Alejandro Vallejo wrote:
> > @@ -299,44 +299,14 @@ void save_fpu_enable(void)
> >  /* Initialize FPU's context save area */
> >  int vcpu_init_fpu(struct vcpu *v)
> >  {
> > -    int rc;
> > -
> >      v->arch.fully_eager_fpu =3D opt_eager_fpu;
> > -
> > -    if ( (rc =3D xstate_alloc_save_area(v)) !=3D 0 )
> > -        return rc;
> > -
> > -    if ( v->arch.xsave_area )
> > -        v->arch.fpu_ctxt =3D &v->arch.xsave_area->fpu_sse;
> > -    else
> > -    {
> > -        BUILD_BUG_ON(__alignof(v->arch.xsave_area->fpu_sse) < 16);
> > -        v->arch.fpu_ctxt =3D _xzalloc(sizeof(v->arch.xsave_area->fpu_s=
se),
> > -                                    __alignof(v->arch.xsave_area->fpu_=
sse));
> > -        if ( v->arch.fpu_ctxt )
> > -        {
> > -            fpusse_t *fpu_sse =3D v->arch.fpu_ctxt;
> > -
> > -            fpu_sse->fcw =3D FCW_DEFAULT;
> > -            fpu_sse->mxcsr =3D MXCSR_DEFAULT;
> > -        }
> > -        else
> > -            rc =3D -ENOMEM;
>
> This looks wonky.=C2=A0 It's not, because xstate_alloc_save_area() contai=
ns
> the same logic for setting up FCW/MXCSR.
>
> It would be helpful to note this in the commit message.=C2=A0 Something a=
bout
> deduplicating the setup alongside deduplicating the pointer.
>

Sure

> > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/a=
sm/domain.h
> > index bca3258d69ac..3da60af2a44a 100644
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -592,11 +592,11 @@ struct pv_vcpu
> >  struct arch_vcpu
> >  {
> >      /*
> > -     * guest context (mirroring struct vcpu_guest_context) common
> > -     * between pv and hvm guests
> > +     * Guest context common between PV and HVM guests. Includes genera=
l purpose
> > +     * registers, segment registers and other parts of the exception f=
rame.
> > +     *
> > +     * It doesn't contain FPU state, as that lives in xsave_area inste=
ad.
> >       */
>
> This new comment isn't really correct either.=C2=A0 arch_vcpu contains th=
e
> PV/HVM union, so it not only things which are common between the two.

It's about cpu_user_regs though, not arch_vcpu?

>
> I'd either leave it alone, or delete it entirely.=C2=A0 It doesn't serve =
much
> purpose IMO, and it is going to bitrot very quickly (FRED alone will
> change two of the state groups you mention).
>

I'm happy getting rid of it because it's actively confusing in its current
form. That said, I can't possibly believe there's not a single simple
description of cpu_user_regs that everyone can agree on.

> > -
> > -    void              *fpu_ctxt;
> >      struct cpu_user_regs user_regs;
> > =20
> >      /* Debug registers. */
> > diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/=
blk.c
> > index e790f4f90056..28b54f26fe29 100644
> > --- a/xen/arch/x86/x86_emulate/blk.c
> > +++ b/xen/arch/x86/x86_emulate/blk.c
> > @@ -11,7 +11,8 @@
> >      !defined(X86EMUL_NO_SIMD)
> >  # ifdef __XEN__
> >  #  include <asm/xstate.h>
> > -#  define FXSAVE_AREA current->arch.fpu_ctxt
> > +#  define FXSAVE_AREA ((struct x86_fxsr *) \
> > +                           (void *)&current->arch.xsave_area->fpu_sse)
>
> This isn't a like-for-like replacement.
>
> Previously FXSAVE_AREA's type was void *.=C2=A0 I'd leave the expression =
as just
>
> =C2=A0=C2=A0=C2=A0 (void *)&current->arch.xsave_area->fpu_sse
>
> because struct x86_fxsr is not the only type needing to be used here in
> due course.=C2=A0=C2=A0 (There are 8 variations of data layout for older
> instructions.)
>

Sure

> >  # else
> >  #  define FXSAVE_AREA get_fpu_save_area()
> >  # endif
> > diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> > index 5c4144d55e89..850ee31bd18c 100644
> > --- a/xen/arch/x86/xstate.c
> > +++ b/xen/arch/x86/xstate.c
> > @@ -507,9 +507,16 @@ int xstate_alloc_save_area(struct vcpu *v)
> >      unsigned int size;
> > =20
> >      if ( !cpu_has_xsave )
> > -        return 0;
> > -
> > -    if ( !is_idle_vcpu(v) || !cpu_has_xsavec )
> > +    {
> > +        /*
> > +         * This is bigger than FXSAVE_SIZE by 64 bytes, but it helps t=
reating
> > +         * the FPU state uniformly as an XSAVE buffer even if XSAVE is=
 not
> > +         * available in the host. Note the alignment restriction of th=
e XSAVE
> > +         * area are stricter than those of the FXSAVE area.
> > +         */
>
> Can I suggest the following?
>
> "On non-XSAVE systems, we allocate an XSTATE buffer for simplicity.=C2=A0
> XSTATE is backwards compatible to FXSAVE, and only one cacheline larger."
>
> It's rather more concise.
>
> ~Andrew

Sure.

Cheers,
Alejandro

