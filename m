Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78A994AA81
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 16:42:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773561.1184004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbhrZ-0001WP-HB; Wed, 07 Aug 2024 14:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773561.1184004; Wed, 07 Aug 2024 14:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbhrZ-0001Ug-Ca; Wed, 07 Aug 2024 14:42:05 +0000
Received: by outflank-mailman (input) for mailman id 773561;
 Wed, 07 Aug 2024 14:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nE80=PG=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sbhrX-0001UY-UL
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 14:42:03 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35085de3-54cb-11ef-8776-851b0ebba9a2;
 Wed, 07 Aug 2024 16:42:01 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a6135eso1184198a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 07:42:01 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83a152e4dsm7154107a12.48.2024.08.07.07.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 07:42:00 -0700 (PDT)
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
X-Inumbo-ID: 35085de3-54cb-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723041721; x=1723646521; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AxUYojaPf9XDmnVQj8HHru1cs+c4/iNI1AGzjdZhM4=;
        b=OZkmDFxraXP5gSELH3htUK/wQ0J7txwaNys+8cXmkvffMbPaiYK4tXY+k81beO8udn
         0qFa9uDkmlkjxvaejXHlmJEKK4tkr1k7zCcD1mryFHT5WNeWUnmw0PGWC6yjRHsf4sKW
         yd/nvioBL112eNDzvD+snD9IKRpS+fYJKFUT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723041721; x=1723646521;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0AxUYojaPf9XDmnVQj8HHru1cs+c4/iNI1AGzjdZhM4=;
        b=jfjAJ4Hqt6B7ll8z3BiZ68/Ry0KUmGcGmE8CayPsTzqTb/OvUA+xTjWyBPomsTIMtO
         bLWtA3EMKEv00zvOhEuZJL/PZImk30Jd+mn03KDk7LfFeZhba3oqANWI2UaYk7HF60IH
         lL35hgEpOfsMSVPtSOeoKs/f9xMLzt+j5kMQTxJAqlH59zoDZcCnh2ZqlEulzELbjIzU
         IpSGYQtALtKJXuev6ZXo57jIoH2qgSyOpnD5klFu9Qh8MXwW6NQyUQYsE0pRRDR6oAUH
         MLOqgvdZ0j5ypvIrJ+xVseiclxvx/hBR2sIVwzpjAWAjFAZwKvlNyomQA3dqNhMILTqp
         U1jw==
X-Forwarded-Encrypted: i=1; AJvYcCVNKw6I83rM1Gq13apolDxwgQ92QDTqcW7lD/L35SR8Srhu3UxquMrJCkt29r7Z/BIkGQMJhwGk24Qj7C9zLI9ripx1qdJnTJTvQ6N//O0=
X-Gm-Message-State: AOJu0YwaI6A6WR4y7BBXSAiV/jtJMbk17B1+bEIf+SZ5aiI+UNsEOH95
	/yyzYwJt1Kf/bxCepLnxZrPdvJ6x/SyIjMo7t9f2bKl2JSRnAH/TnWSLUW7j5XU=
X-Google-Smtp-Source: AGHT+IETq79MThODDxcTvfeYrC5SfPSJWtPgzacBD2+nQdgB/vmQ4NxtnowcxjF6zpYjoZ4ZRcJ2jQ==
X-Received: by 2002:aa7:ca46:0:b0:5b7:faba:311b with SMTP id 4fb4d7f45d1cf-5bba3680434mr2062620a12.5.1723041721085;
        Wed, 07 Aug 2024 07:42:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Aug 2024 15:41:59 +0100
Message-Id: <D39RBA6G4ASA.2SHREKOQBFQLC@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.20 3/4] x86/fpu: Combine fpu_ctxt and xsave_area
 in arch_vcpu
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.17.0
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
 <170c78f39dfef620d9060be3f1b31313673f09b9.1720538832.git.alejandro.vallejo@cloud.com> <78ae0b2f-e0a6-4ab9-b7a6-43e1357ff9b9@suse.com> <D2STLWUF9965.3QXLJ2TWIXS1Z@cloud.com> <4cc61747-904c-4b00-a722-2c31f7d04c2d@suse.com>
In-Reply-To: <4cc61747-904c-4b00-a722-2c31f7d04c2d@suse.com>

Hi. Sorry, I've been busy and couldn't get back to this sooner.

On Fri Jul 19, 2024 at 10:14 AM BST, Jan Beulich wrote:
> On 18.07.2024 18:54, Alejandro Vallejo wrote:
> > On Thu Jul 18, 2024 at 12:49 PM BST, Jan Beulich wrote:
> >> On 09.07.2024 17:52, Alejandro Vallejo wrote:
> >>> --- a/xen/arch/x86/include/asm/domain.h
> >>> +++ b/xen/arch/x86/include/asm/domain.h
> >>> @@ -591,12 +591,7 @@ struct pv_vcpu
> >>> =20
> >>>  struct arch_vcpu
> >>>  {
> >>> -    /*
> >>> -     * guest context (mirroring struct vcpu_guest_context) common
> >>> -     * between pv and hvm guests
> >>> -     */
> >>> -
> >>> -    void              *fpu_ctxt;
> >>> +    /* Fixed point registers */
> >>>      struct cpu_user_regs user_regs;
> >>
> >> Not exactly, no. Selector registers are there as well for example, whi=
ch
> >> I wouldn't consider "fixed point" ones. I wonder why the existing comm=
ent
> >> cannot simply be kept, perhaps extended to mention that fpu_ctxt now l=
ives
> >> elsewhere.
> >=20
> > Would you prefer "general purpose registers"? It's not quite that eithe=
r, but
> > it's arguably closer. I can part with the comment altogether but I'd ra=
ther
> > leave a token amount of information to say "non-FPU register state" (bu=
t not
> > that, because that would be a terrible description).=20
> >=20
> > I'd rather update it to something that better reflects reality, as I fo=
und it
> > quite misleading when reading through. I initially thought it may have =
been
> > related to struct layout (as in C-style single-level inheritance), but =
as it
> > turns out it's merely establishing a vague relationship between arch_vc=
pu and
> > vcpu_guest_context. I can believe once upon a time the relationship was=
 closer
> > than it it now, but with the guest context missing AVX state, MSR state=
 and
> > other bits and pieces I thought it better to avoid such confusions for =
future
> > navigators down the line so limit its description to the line below.
>
> As said, I'd prefer if you amended the existing comment. Properly describ=
ing
> what's in cpu_user_regs isn't quite as easy in only very few words. Neith=
er
> "fixed point register" nor "general purpose registers" really covers it. =
And
> I'd really like to avoid having potentially confusing comments.

Sure.

>
> >>> --- a/xen/arch/x86/xstate.c
> >>> +++ b/xen/arch/x86/xstate.c
> >>> @@ -507,9 +507,16 @@ int xstate_alloc_save_area(struct vcpu *v)
> >>>      unsigned int size;
> >>> =20
> >>>      if ( !cpu_has_xsave )
> >>> -        return 0;
> >>> -
> >>> -    if ( !is_idle_vcpu(v) || !cpu_has_xsavec )
> >>> +    {
> >>> +        /*
> >>> +         * This is bigger than FXSAVE_SIZE by 64 bytes, but it helps=
 treating
> >>> +         * the FPU state uniformly as an XSAVE buffer even if XSAVE =
is not
> >>> +         * available in the host. Note the alignment restriction of =
the XSAVE
> >>> +         * area are stricter than those of the FXSAVE area.
> >>> +         */
> >>> +        size =3D XSTATE_AREA_MIN_SIZE;
> >>
> >> What exactly would break if just (a little over) 512 bytes worth were =
allocated
> >> when there's no XSAVE? If it was exactly 512, something like xstate_al=
l() would
> >> need to apply a little more care, I guess. Yet for that having just al=
ways-zero
> >> xstate_bv and xcomp_bv there would already suffice (e.g. using
> >> offsetof(..., xsave_hdr.reserved) here, to cover further fields gainin=
g meaning
> >> down the road). Remember that due to xmalloc() overhead and the 64-byt=
e-aligned
> >> requirement, you can only have 6 of them in a page the way you do it, =
when the
> >> alternative way 7 would fit (if I got my math right).
> >=20
> > I'm slightly confused.
> >=20
> > XSTATE_AREA_MIN_SIZE is already 512 + 64 to account for the XSAVE heade=
r,
> > including its reserved fields. Did you mean something else?
>
> No, I didn't. I've in fact commented on it precisely because it is the va=
lue
> you name. That's larger than necessary, and when suitably shrunk - as sai=
d -
> one more of these structures could fit in a page (assuming they were all
> allocated back-to-back, which isn't quite true right now, but other
> intervening allocations may or may not take space from the same page, so
> chances are still that the ones here all might come from one page as long=
 as
> there's space left).
>
> >     #define XSAVE_HDR_SIZE            64
> >     #define XSAVE_SSE_OFFSET          160
> >     #define XSTATE_YMM_SIZE           256
> >     #define FXSAVE_SIZE               512
> >     #define XSAVE_HDR_OFFSET          FXSAVE_SIZE
> >     #define XSTATE_AREA_MIN_SIZE      (FXSAVE_SIZE + XSAVE_HDR_SIZE)
> >=20
> > Part of the rationale is to simplify other bits of code that are curren=
tly
> > conditionalized on v->xsave_header being NULL. And for that the full xs=
ave
> > header must be present (even if unused because !cpu_xsave)
>
> But that's my point: The reserved[] part doesn't need to be there; it's
> not being accessed anywhere, I don't think.
>
> Jan

The reserved octets want to be in the structure so we can zero them out on
machines with XSAVE. Once they are it's quite dangerous to not allocate spa=
ce
for them, as doing something like "*xsave_area =3D *foo;" would overflow th=
e
allocation silently (that's in fact what the next patch does).

Combined with the fact that (a) not having XSAVE is fairly rare and (b) all=
 of
this is bound to end up round to the page anyway once we get Address Space
Isolation going... it really doesn't motivate me to save a handful of octet=
s
per vCPU. The cost in memory would be negligible even if we had tens of
thousands of them running concurrently.

Cheers,
Alejandro

