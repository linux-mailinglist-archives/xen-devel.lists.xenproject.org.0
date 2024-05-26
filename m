Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACA08CF6DE
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 01:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730564.1135678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBNi2-0007a4-7z; Sun, 26 May 2024 23:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730564.1135678; Sun, 26 May 2024 23:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBNi2-0007Xv-4d; Sun, 26 May 2024 23:55:26 +0000
Received: by outflank-mailman (input) for mailman id 730564;
 Sun, 26 May 2024 23:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QFAz=M5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sBNi0-0007Xp-OX
 for xen-devel@lists.xenproject.org; Sun, 26 May 2024 23:55:24 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69800bfb-1bbb-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 01:55:22 +0200 (CEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5b5254f9c32so4005375eaf.0
 for <xen-devel@lists.xenproject.org>; Sun, 26 May 2024 16:55:22 -0700 (PDT)
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
X-Inumbo-ID: 69800bfb-1bbb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716767721; x=1717372521; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FtBCXJECgH5jG4zdwJ6hIO5ONat+ArbMrNEVsu+qeM=;
        b=BgBq+tk5iAJWriLYxPZBgk+AUYkP/qgK3gceXaYly8saUIZT2A0IHvp9OyAcD/I87Z
         KBNJ8rcBh8g7U/Gs4JWMSgpuRcfcw4verh+S/qDR3+nAz/Hl8sS49DYzWzYXKxnN0SG8
         4OM1ccHVp6N0ne7+4OQketZmjErTwRovuBUhB7Or3ktGmJOxHs0gsNrgkI8bdCiNaRaI
         /PJrkVX/LO/fGiRFygEMIYxwPtOw78xcyMdGnGkofMC9L6/kO2iOu2WE3sSHqTv+ni06
         mi94wyzwa5N7D2jWpvZjZBs9B6v68StugUAiFCGXF0qXRhsuMsS5Pjz6BR4HpWIHEVsB
         fmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716767721; x=1717372521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FtBCXJECgH5jG4zdwJ6hIO5ONat+ArbMrNEVsu+qeM=;
        b=Qj2vmjuwnqZJzXwdfDTmgWAwus+KWaFTW/k4+1Tn4m7rxuKNDmqUxxk1XDgu5qBBYx
         BPF6UXnUKHcyAiLBaYrO3FF5JpxSwqv2F+JpgmhIQuS+90yigK+3fn6fzsxm/K+lhIm3
         SftQHEGpuo7jBWP1k00y0aZ6J4a+KQdjfHHzmoOEP2FvxuCiFy+Sl246JcBgRs+G3/V5
         jL4v5R8hkyTlyevpgFEWpUknuse51bwheYX8QZRdCG2K6Q6M77IdQyyXjHRSfFb5Humi
         cqJI87fXMYS//DFI1Rp+BRXIUiERjznReZQVfvS9ToDgD6yUJmrvnfQ0tCrW3NtL3Des
         1f1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/TIZJqSC53iWsEgwaCOshlteXkKHxIYtdrs9rQ6QVUrhRZu9DBC2ZVPtWa/07AcQBkT4MNjdA65aanu3EQ0IxBJKYK7ZoyqeCgss4aqE=
X-Gm-Message-State: AOJu0Yx3DryPRJBCDh5X/CU+oIE1Nvct9DhfycZOkdudyYgJKCeM9xiD
	6i9P5GyKF7dEyVhmu+HmxhbExSFyLJl4bbgaNptIrtmiKIAcpBcgrjpv9HNr/VvL5/jBehqfmds
	tCXeXGYE8V3tVHm3qLsWzN0YaQLc=
X-Google-Smtp-Source: AGHT+IHqFmBtelvkkarGAKz5L+Vf5A9nRqAWmELa9QVrAg6u0FlXGqFvMFQ1uOF3djmvv90IY39NQ8sQGvYbIqNjDhE=
X-Received: by 2002:a05:6870:218c:b0:24f:bd2e:9c3f with SMTP id
 586e51a60fabf-24fbd2fea0dmr6752334fac.11.1716767720815; Sun, 26 May 2024
 16:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1716029860.git.w1benny@gmail.com> <ba5b81fdaf174a236c3963fcfd29ae3b19aff13d.1716029860.git.w1benny@gmail.com>
 <21196eb3-82ca-470b-8dc9-1a95b427f3b9@suse.com>
In-Reply-To: <21196eb3-82ca-470b-8dc9-1a95b427f3b9@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Mon, 27 May 2024 01:55:09 +0200
Message-ID: <CAKBKdXj7xUyuy-wPCjR0a+kNwqCmGXOoO=-pMQa7=Yiyaom_mg@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v4 4/6] x86: Make the maximum number of altp2m
 views configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 12:59=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> The compared entities don't really fit together. I think we want a new
> MAX_NR_ALTP2M, which - for the time being - could simply be
>
> #define MAX_NR_ALTP2M MAX_EPTP
>
> in the header. That would then be a suitable replacement for the
> min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) that you're adjusting
> elsewhere. Which however raises the question whether in EPT-specific
> code the min() wouldn't better survive, as min(d->nr_altp2m, MAX_EPTP).
>

As you mentioned in a previous email, I've removed all the min(...,
MAX_EPTP) invocations from the code, since nr_altp2m is validated to
be no greater than that value. The only remaining places where this
value occurs are:

- In my newly introduced condition in arch_sanitise_domain_config:

if ( config->nr_altp2m > MAX_EPTP )
{
    dprintk(XENLOG_INFO, "nr_altp2m must be <=3D %lu\n", MAX_NR_ALTP2M);
    return -EINVAL;
}

- In hap_enable():

for ( i =3D 0; i < MAX_EPTP; i++ )
{
    d->arch.altp2m_eptp[i] =3D mfn_x(INVALID_MFN);
    d->arch.altp2m_visible_eptp[i] =3D mfn_x(INVALID_MFN);
}

Note that altp2m_eptp/altp2m_visible_eptp is never accessed beyond
nr_altp2m. From what you're saying, it sounds to me like I should only
replace the first mentioned occurrence with MAX_NR_ALTP2M. Correct me
if I'm wrong.

> > @@ -5228,7 +5234,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t=
 p2midx)
> >      if ( !hvm_is_singlestep_supported() )
> >          return;
> >
> > -    if ( p2midx >=3D MAX_ALTP2M )
> > +    if ( p2midx >=3D v->domain->nr_altp2m )
> >          return;
>
> You don't introduce a new local variable here. I'd like to ask that you a=
lso
> don't ...
>
> > @@ -403,12 +403,12 @@ long p2m_set_mem_access_multi(struct domain *d,
> >      /* altp2m view 0 is treated as the hostp2m */
> >      if ( altp2m_idx )
> >      {
> > -        if ( altp2m_idx >=3D min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_E=
PTP) ||
> > -             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EP=
TP)] =3D=3D
> > -             mfn_x(INVALID_MFN) )
> > +        if ( altp2m_idx >=3D d->nr_altp2m ||
> > +             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, d->nr_=
altp2m)]
> > +             =3D=3D mfn_x(INVALID_MFN) )
>
> Please don't break previously correct style: Binary operators (here: =3D=
=3D )
> belong onto the end of the earlier line. That'll render the line too long
> again, but you want to deal with that e.g. thus:
>
>              d->arch.altp2m_eptp[array_index_nospec(altp2m_idx,
>                                                     d->nr_altp2m)] =3D=3D
>              mfn_x(INVALID_MFN) )
>

Roger suggested introducing the altp2m_get_p2m() function, which I
like. I think introducing altp2m_get_eptp/visible_eptp and
altp2m_set_eptp/visible_eptp would also elegantly solve the issue of
overly long lines. My question is: if I go this route, should I
strictly replace with these functions only accesses that use
array_index_nospec()? Or should I replace all array accesses? For
example:

for ( i =3D 0; i < d->nr_altp2m; i++ )
{
    struct p2m_domain *p2m;

    if ( d->arch.altp2m_eptp[i] =3D=3D mfn_x(INVALID_MFN) )
        continue;

    p2m =3D d->arch.altp2m_p2m[i];

    p2m_lock(p2m);
    p2m->ept.ad =3D value;
    p2m_unlock(p2m);
}

... should I be consistent and also replace these accesses with
altp2m_get_eptp/altp2m_get_p2m (which will internally use
array_index_nospec), or should I leave them as they are?

P.

