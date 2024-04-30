Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C4C8B7C6D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715037.1116468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1puA-0003wD-Sf; Tue, 30 Apr 2024 16:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715037.1116468; Tue, 30 Apr 2024 16:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1puA-0003ug-P9; Tue, 30 Apr 2024 16:00:30 +0000
Received: by outflank-mailman (input) for mailman id 715037;
 Tue, 30 Apr 2024 16:00:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zuuf=MD=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s1pu8-0003ua-PB
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:00:28 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1d4624b-070a-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 18:00:26 +0200 (CEST)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5acb737b508so2630706eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:00:26 -0700 (PDT)
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
X-Inumbo-ID: c1d4624b-070a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714492825; x=1715097625; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9K93l+qQHBw3k4VI9XKbaOJGuSi7wrpLnKLw5EPuXQ=;
        b=gDadQ9Gvr4nc9aDiGZLwB2WlYX0LPWilcCcUYmfMfDajQmkgi86VXV/Bxljvej/L6v
         OxJlZYKY2qFzY3Mb1btEW2AUof0ywB1hK0asKqdfdeLFWBRc3gYRMuGYy+3bgTfma+sS
         uJm83kFHRka0DLT7GpVlNn9ZulMdTZVWX23HGPOFiLWuIFQAEIAWVlOgXfwmJYrdbWH+
         Ukbr88SlDj7at+EFravS1Rh51xMkHsaCFC3owbGZvUr8MnRKvq/YD6tF8pCR1dxZBRCO
         OLn7Usl/Mu1589YoAghOeMiQ3/uw2VgBftpsrwl0yTkSKY3tLTnwmbXuupNk5KIfEfUv
         dRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714492825; x=1715097625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9K93l+qQHBw3k4VI9XKbaOJGuSi7wrpLnKLw5EPuXQ=;
        b=BabW9jbsPV+lNqrxF+rYRot2R7r3fPKqYJdI4DgFb96R/S7CPYa9Ih+B4T6dFIHoFY
         WQ1Vr1Pv59Ks2HN+AUeticNt51b7LuPoPp1jDoL2SVKWmiGw4BTY/diWEX1Vcg2JQapx
         f1Nzk/+lc5Anh3ysJC+TEhhE+T+Nsjl7hF2I0ERhLiggw8O4+eQjUSiaNrNQYFGBg4ej
         CP062X6iZqyI2UT9fd4eLGzOVXuZgW3I+UmwT/phCF846yLlHgPq6coRKJQpJz3l0xIR
         FWaCpQebrD3bwmPzOs7pxadfc/M1pK3K6CJoEHq6Q7B1PSPjSCow8I4S7rFkIp2dKD85
         G2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXm31F40WO9qNRKFMs3J9CQ8/ARlAYCvYFZP9KevHKnECPWe4Y8PnIypYP/pO+ne4ZpOY378LKLFZBaI3I3WFYO0JG05ItLC2I+v67D3A8=
X-Gm-Message-State: AOJu0Yz0Mh7jo3uA3wOEEA3bsq1oQqnDKQbKHtUmPxXfys/eRHtpe7pL
	iyoWCnM58ALi1EWkgKu464JpIqT8tvD5Ec/rvMvibk+45HVjeyZEQtP0JDgfcVIs1pYtZU4K5xI
	fNUYmilgvtPxmwqdPpVliT5RC6KvwNg==
X-Google-Smtp-Source: AGHT+IE8VPOj/AdPNyYEJxTn3ubftemBUv4rvAMFcZW0HD2NqAs1enfseRYO2vblV4UPC1KGx/KWZPBk7eyX9F87HUc=
X-Received: by 2002:a05:6871:794:b0:23c:b686:913 with SMTP id
 o20-20020a056871079400b0023cb6860913mr6013177oap.50.1714492824816; Tue, 30
 Apr 2024 09:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714322424.git.w1benny@gmail.com> <0041438ff7a5d5b2fad59b676f4ece80470bf3b3.1714322424.git.w1benny@gmail.com>
 <5600e97e-5d44-4901-a867-b48192e9525f@suse.com>
In-Reply-To: <5600e97e-5d44-4901-a867-b48192e9525f@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 30 Apr 2024 18:00:13 +0200
Message-ID: <CAKBKdXjsz_By_nZHDBpzTASSwMQUw61-7UA0YYrSTN+YDivqWQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] x86: Make the maximum number of altp2m views configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 4:27=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -685,6 +685,12 @@ int arch_sanitise_domain_config(struct xen_domctl_=
createdomain *config)
> >          return -EINVAL;
> >      }
> >
> > +    if ( config->max_altp2m > MAX_EPTP )
> > +    {
> > +        dprintk(XENLOG_INFO, "max_altp2m must be <=3D %u\n", MAX_EPTP)=
;
> > +        return -EINVAL;
> > +    }
>
> ... using MAX_EPTP here feels like a layering violation to me. Imo there =
want
> to be separate constants, tied together with a suitably placed BUILD_BUG_=
ON().
>
> Furthermore comparisons like this (there are further ones elsewhere) sugg=
est
> there is a (continued) naming issue: A max_ or MAX_ prefix ought to name =
a
> "maximum valid value", not "number of permitted values". This is not a
> request to alter MAX_EPTP, but one to make sure the new struct fields rea=
lly
> have matching names and purposes.

Do you have any proposals? I was considering nr_altp2m. Another
question is what it should be named in xl.cfg - also nr_altp2m? I was
too hesitant to name it like that, since there aren't any nr_* fields
currently.

> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -258,11 +258,10 @@ struct paging_vcpu {
> >      struct shadow_vcpu shadow;
> >  };
> >
> > +#define INVALID_ALTP2M  0xffff
> > +#define MAX_EPTP        ((unsigned int)(PAGE_SIZE / sizeof(uint64_t)))
>
> Aiui you add this cast because of the various min() uses. However, beside=
s
> wanting to avoid such casts (or in fact any, whenever possible), I don't
> see why you need to retain all those min(): You bound d->max_altp2m again=
st
> MAX_EPTP during domain creation anyway.

Fair. I considered removing the min()s altogether. I left them in
place because I was too paranoid.

>
> > @@ -28,8 +34,13 @@ altp2m_vcpu_initialise(struct vcpu *v)
> >  void
> >  altp2m_vcpu_destroy(struct vcpu *v)
> >  {
> > +    struct domain *d =3D v->domain;
> >      struct p2m_domain *p2m;
> >
> > +    /* Skip destruction if no altp2m was used. */
> > +    if ( d->max_altp2m =3D=3D 0 )
> > +        return;
>
> ... this one doesn't look quite right: Even if altp2m-s were initialized,
> none may have been used (yet).

Fair. Bad choice of words.

>
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -602,6 +602,8 @@ struct domain
> >          unsigned int guest_request_sync          : 1;
> >      } monitor;
> >
> > +    unsigned int max_altp2m; /* Maximum number of altp2m tables */
> > +
> >      unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disabl=
e. */
>
> ... this suggest you're confident other architectures will also want
> to support altp2m. Yet nothing like that is said in the description.
> In the absence of that common code should not require touching (much).

Depends on the definition of "want". altp2m patches for arm/aarch64
were sent to Xen some 6 years ago but were unfortunately rejected. I
would very much welcome them.

I have added the field to domain instead of arch_domain simply because
it is not an arch-bound feature - similarly to vmtrace below, which
also doesn't have an equivalent implementation on other archs than x86
(yet).

As far as other comments/nits go - understood.

P.

