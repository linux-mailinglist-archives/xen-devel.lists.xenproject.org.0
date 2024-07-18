Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBF59350F1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 18:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760633.1170543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUOv-0003hk-0H; Thu, 18 Jul 2024 16:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760633.1170543; Thu, 18 Jul 2024 16:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUOu-0003gF-Te; Thu, 18 Jul 2024 16:54:40 +0000
Received: by outflank-mailman (input) for mailman id 760633;
 Thu, 18 Jul 2024 16:54:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MiOu=OS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sUUOt-0003g9-JV
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 16:54:39 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6acbab8c-4526-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 18:54:37 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-58e76294858so99849a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 09:54:37 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a2b676c74dsm55561a12.10.2024.07.18.09.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 09:54:36 -0700 (PDT)
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
X-Inumbo-ID: 6acbab8c-4526-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721321677; x=1721926477; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcPb7I9RXMTFl4+UfiV1/KnoKBsPI0JuJtndM3eMftw=;
        b=ESB32CxOwJ/y87SgLvpaEZBhIdSdjvR+qsqrmpPfGnDVmSuVtAid/+NZYTvdcRR921
         zqOp+udanZE/pCjKTvbmaW3h2RPQsXmZn6VY53oolfqlmv7wdaP4+LbRGVz/SmM3e0El
         j5r+K06hivkzubheSRcaEcw3Or4QWuCvJxyj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321677; x=1721926477;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xcPb7I9RXMTFl4+UfiV1/KnoKBsPI0JuJtndM3eMftw=;
        b=LG4FcnsvPXHJlITnIW8b8qSkl/J51ziHzKALWLD5eXQ3+zf2AZ5iHKsmsz9HCgWrIb
         uwm9dZ2NJllVB/DXv9jRn7eBe6tR6Akr2Gjw///PTCvirjMvJKkWPsxmh48sC0qP67s7
         wVcLlmgSXSZefDXwj7/z8qU5Z9Sb8xz1nJ5EKXITHGU1tvtUL6ryI3slDUiWE679D+kF
         by3JNJ/ycwZtfm31vU5erhFxX4KHgHTZ/a+fpWXuiwx1ZlGYW09yJdxDDat95cRlpr4D
         uLdwadjrc3D/avyKUr93Lc29z8lFuPVJNgEE5vOeqvnKBRhnmnF5g9c0tMSXFBrt6doh
         PDyg==
X-Forwarded-Encrypted: i=1; AJvYcCUBiKQpCh7veW5jmaZjaf9GnmQ8Rcn4So/ZXbWcfPaVBE2hPRUX/hhtgkTN5KgS3AS+XU7TxTU/JGRTcGl3ewDsHkOU/7v3+fLiORj23Ng=
X-Gm-Message-State: AOJu0YxtJU/3jDtarUW9L9w2ZCuMo7mLin6Pib0KaJo4/+h8rncT0MUQ
	m1Z+8FBVyumOT0767FCENzcze0bJ5QdjzOOGHxadA9fJX4GVaDYa5ZHJZGktxe4=
X-Google-Smtp-Source: AGHT+IH15tW5MDA2fodCvG7TcmMVlGnM3xpT289mDzXlogdQapBRbTUKD1rG4pLYbcXExgc2nVJRuw==
X-Received: by 2002:a05:6402:2110:b0:57d:3e48:165d with SMTP id 4fb4d7f45d1cf-5a1557cd01fmr4345153a12.4.1721321676986;
        Thu, 18 Jul 2024 09:54:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jul 2024 17:54:34 +0100
Message-Id: <D2STLWUF9965.3QXLJ2TWIXS1Z@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.20 3/4] x86/fpu: Combine fpu_ctxt and xsave_area
 in arch_vcpu
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.17.0
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
 <170c78f39dfef620d9060be3f1b31313673f09b9.1720538832.git.alejandro.vallejo@cloud.com> <78ae0b2f-e0a6-4ab9-b7a6-43e1357ff9b9@suse.com>
In-Reply-To: <78ae0b2f-e0a6-4ab9-b7a6-43e1357ff9b9@suse.com>

On Thu Jul 18, 2024 at 12:49 PM BST, Jan Beulich wrote:
> On 09.07.2024 17:52, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/domctl.c
> > +++ b/xen/arch/x86/domctl.c
> > @@ -1343,7 +1343,8 @@ void arch_get_info_guest(struct vcpu *v, vcpu_gue=
st_context_u c)
> >  #define c(fld) (c.nat->fld)
> >  #endif
> > =20
> > -    memcpy(&c.nat->fpu_ctxt, v->arch.fpu_ctxt, sizeof(c.nat->fpu_ctxt)=
);
> > +    memcpy(&c.nat->fpu_ctxt, &v->arch.xsave_area->fpu_sse,
> > +           sizeof(c.nat->fpu_ctxt));
>
> Now that the middle argument has proper type, maybe take the opportunity
> and add BUILD_BUG_ON(sizeof(...) =3D=3D sizeof(...))? (Also in e.g.
> hvm_save_cpu_ctxt() then.)

Sure.

>
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -591,12 +591,7 @@ struct pv_vcpu
> > =20
> >  struct arch_vcpu
> >  {
> > -    /*
> > -     * guest context (mirroring struct vcpu_guest_context) common
> > -     * between pv and hvm guests
> > -     */
> > -
> > -    void              *fpu_ctxt;
> > +    /* Fixed point registers */
> >      struct cpu_user_regs user_regs;
>
> Not exactly, no. Selector registers are there as well for example, which
> I wouldn't consider "fixed point" ones. I wonder why the existing comment
> cannot simply be kept, perhaps extended to mention that fpu_ctxt now live=
s
> elsewhere.

Would you prefer "general purpose registers"? It's not quite that either, b=
ut
it's arguably closer. I can part with the comment altogether but I'd rather
leave a token amount of information to say "non-FPU register state" (but no=
t
that, because that would be a terrible description).=20

I'd rather update it to something that better reflects reality, as I found =
it
quite misleading when reading through. I initially thought it may have been
related to struct layout (as in C-style single-level inheritance), but as i=
t
turns out it's merely establishing a vague relationship between arch_vcpu a=
nd
vcpu_guest_context. I can believe once upon a time the relationship was clo=
ser
than it it now, but with the guest context missing AVX state, MSR state and
other bits and pieces I thought it better to avoid such confusions for futu=
re
navigators down the line so limit its description to the line below.

>
> > --- a/xen/arch/x86/x86_emulate/blk.c
> > +++ b/xen/arch/x86/x86_emulate/blk.c
> > @@ -11,7 +11,8 @@
> >      !defined(X86EMUL_NO_SIMD)
> >  # ifdef __XEN__
> >  #  include <asm/xstate.h>
> > -#  define FXSAVE_AREA current->arch.fpu_ctxt
> > +#  define FXSAVE_AREA ((struct x86_fxsr *) \
> > +                           (void*)&current->arch.xsave_area->fpu_sse)
>
> Nit: Blank missing after before *.

Heh, took me a while looking at x86_fxsr to realise you mean the void point=
er.

Ack.

>
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
> > +        size =3D XSTATE_AREA_MIN_SIZE;
>
> What exactly would break if just (a little over) 512 bytes worth were all=
ocated
> when there's no XSAVE? If it was exactly 512, something like xstate_all()=
 would
> need to apply a little more care, I guess. Yet for that having just alway=
s-zero
> xstate_bv and xcomp_bv there would already suffice (e.g. using
> offsetof(..., xsave_hdr.reserved) here, to cover further fields gaining m=
eaning
> down the road). Remember that due to xmalloc() overhead and the 64-byte-a=
ligned
> requirement, you can only have 6 of them in a page the way you do it, whe=
n the
> alternative way 7 would fit (if I got my math right).
>
> Jan

I'm slightly confused.

XSTATE_AREA_MIN_SIZE is already 512 + 64 to account for the XSAVE header,
including its reserved fields. Did you mean something else?

    #define XSAVE_HDR_SIZE            64
    #define XSAVE_SSE_OFFSET          160
    #define XSTATE_YMM_SIZE           256
    #define FXSAVE_SIZE               512
    #define XSAVE_HDR_OFFSET          FXSAVE_SIZE
    #define XSTATE_AREA_MIN_SIZE      (FXSAVE_SIZE + XSAVE_HDR_SIZE)

Part of the rationale is to simplify other bits of code that are currently
conditionalized on v->xsave_header being NULL. And for that the full xsave
header must be present (even if unused because !cpu_xsave)

Do you mean something else?

Cheers,
Alejandro

