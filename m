Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26BAB1D377
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 09:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072592.1435601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujvDQ-0005ts-B0; Thu, 07 Aug 2025 07:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072592.1435601; Thu, 07 Aug 2025 07:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujvDQ-0005rv-8E; Thu, 07 Aug 2025 07:39:08 +0000
Received: by outflank-mailman (input) for mailman id 1072592;
 Thu, 07 Aug 2025 07:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbW2=2T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ujvDO-0005rp-Tu
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 07:39:06 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93df4453-7361-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 09:38:57 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-55b8a0f36fcso790020e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 00:38:57 -0700 (PDT)
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
X-Inumbo-ID: 93df4453-7361-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754552337; x=1755157137; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKAtAZGw0OLUOOWa2L+nz0djnwMkXJBjzcf4z7gEyBw=;
        b=O7R4yaFshvH7D2wCZrZ9M79BBWXoEJuyJyErnkFtVIxC2+V50J3FYybEZcviT/ZqX1
         m8L/O/ffxj1GY/DMA10ciRNtNJi6ZLDpsKD/LrUepRunMVI6M7GGyAED4loKlOf92+YK
         FD9dbY7iOEIqJj2nuTfjMyGvf8Cp3v0v3We5ae/Wo2wzEtgfVQl30hxpjNjqz2j4mpKn
         kDZWajGFYqz3PpV5oHhD5LCbyuzS7xRtBoeMwYjMi/f+Ni2818aDG3zBzJ2wLmw8WNCQ
         /cNPXT9Ad1zNjdaTAh237rAP9eKncJ1XOvIGfEC0Wpo0nibPIlmWubnwqiNx+HLxJVjd
         NDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552337; x=1755157137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKAtAZGw0OLUOOWa2L+nz0djnwMkXJBjzcf4z7gEyBw=;
        b=WGVH99pE1GBF9xrXEYHvpC9eJQT7/p32lxWYn/dG1y2JJVtxSqOqhA8RFZQwGbwzED
         AmpP09/u+vnJNmEfz4/k390ktp46osEASrsy90gCZZuf0f5okrpkGz54Zno/ipCWU4Wq
         PEAT4METrsjhL9bK5LhVJ20m+dvC3TRTXFetvk/H5/sPSKkEMpqiv69EyEF+Q+q0awHF
         IRCX7ReHwBUHQWQIqf1J+/dcQmgpGcc5N8F/FW54P/DMWRn3CDttbhINrLxJu+651Ub9
         7ylSm7xgJF5CNAa1aXyWNo9eWCAbic/zHrqUz4FSBcBbLbqp9HXE+qh0mgzVRA/UYfnN
         OvLw==
X-Forwarded-Encrypted: i=1; AJvYcCX1O/lvTOT7udOyiiy9dLrfMVwM9BJ1NCZExwYCsgjLXXupAyc4FvhBGrTTvMnacjoC9blRSp7X1EA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwhWLuDQPDOiIldI8Ji6ZLiIjl/lZErEcOG23oUZBeeQQ4iQXT
	2SyPaQzbH2pFIP3igcjexH3pcyrtjw0MhJBiKSfyz203DYjgZzrGdttDsgEHk92847AwvpE8r/v
	YXsbWcr0uy3TyrSFR7q6deWtl6tUEVSY=
X-Gm-Gg: ASbGnct5N1cIxCNXtJ2v2CoYy61eg4Ve9ncBh/ynndlINmOJVQ9LRW8pEoOS7pz4zSp
	HAEGZdy2qtB9IFwAIBLcpK7eIeNzU95XCRNdJMJd0FJaP5RhpdaAePbOVWHsbwVa4TYBoRGpLft
	tQJkjdhiVnNmrbtTHGGNydQdOZuUCx1/1vy6SCt6UytE17tRlB0Krp8ndYrv11TNO5vLynKFQwO
	z3I5gjhsLT5egtB
X-Google-Smtp-Source: AGHT+IHKx1vIJEtczLCUs3vrUB65kKa6tDRKDhVVVuY7mcwZrkQsNQYqLHQfkh1XPsFg6ssjVO5fLQIXXOmMsBMwge4=
X-Received: by 2002:ac2:4e01:0:b0:55b:5393:bb32 with SMTP id
 2adb3069b0e04-55caf37bd4cmr1576631e87.33.1754552336994; Thu, 07 Aug 2025
 00:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753778926.git.mykola_kvach@epam.com> <45e670391c37ab54f721b6576a41ded2e543d6db.1753778926.git.mykola_kvach@epam.com>
 <2e43ded3-d14d-49f8-bf98-f3d58d0b39af@suse.com>
In-Reply-To: <2e43ded3-d14d-49f8-bf98-f3d58d0b39af@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 7 Aug 2025 10:38:46 +0300
X-Gm-Features: Ac12FXzENTIOvUC_-kobFDIHWBUHMvWuVpSCa-16IyJxIrWtUNP4OgitmvWAiJQ
Message-ID: <CAGeoDV8QuaFHFg3_MaFdk_zsMCKVD0V6a55ut74HoLuQF3diJw@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Jul 29, 2025 at 12:11=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 29.07.2025 10:52, Mykola Kvach wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1334,16 +1334,15 @@ int domain_shutdown(struct domain *d, u8 reason=
)
> >      return 0;
> >  }
> >
> > -void domain_resume(struct domain *d)
> > +#ifdef CONFIG_ARM
> > +void domain_resume_nopause(struct domain *d)
> > +#else
> > +static void domain_resume_nopause(struct domain *d)
> > +#endif
>
> #ifndef CONFIG_ARM
> static
> #endif
> void domain_resume_nopause(struct domain *d)
>
> to have as little redundancy as possible.

Okay, I=E2=80=99ll change it.

>
> >  {
> >      struct vcpu *v;
> >
> > -    /*
> > -     * Some code paths assume that shutdown status does not get reset =
under
> > -     * their feet (e.g., some assertions make this assumption).
> > -     */
> > -    domain_pause(d);
> > -
> > +    domain_lock(d);
>
> This addition of locking affects domain_resume() as well. Neither need no=
r
> correctness are discussed in the description. If the locking was really
> needed for domain_resume() as well, I suppose adding that would better be
> a separate change anyway.

Thanks for the review.

The locking was added to avoid potential races involving _VPF_suspended and
the suspend/resume logic.

Consider the case where domain_lock() is not used inside domain_resume():

Domain 1 initiates suspend via PSCI SYSTEM_SUSPEND. At the same time,
Domain 0 invokes resume for Domain 1.

Domain 0 calls xl resume, which leads to domain_resume(). Domain 1 acquires
domain_lock() as part of the suspend path. Then it acquires the shutdown
lock in domain_shutdown(). Domain 0 is blocked waiting for the shutdown
lock. When Domain 1 releases the shutdown lock, it sets _VPF_suspended and
modifies the VCPU context. Then Domain 0 clears _VPF_suspended.

At this point, ctxt_switch_from() might be called with _VPF_suspended
already cleared, and the VCPU context partially updated. For example, the
guest PC is set to the resume entry point, but some registers like TTBR or
SCTLR_EL1 are saved from the current hardware context by
ctxt_switch_from.

However, after reviewing the flow again, I think this kind of race could
still happen even with the lock in place. Imagine Domain 1 sets the flag
via SYSTEM_SUSPEND, and then Domain 0 clears it by resuming the domain
before the first context switch. This could still result in a partially
updated context with inconsistent state.

So it might be better to update the VCPU context at the point of resume
instead of doing it during suspend. I'll look into that further and also
check for other possible races if the update is moved.

>
> The addition of this locking is particularly interesting considering that
> ...
>
> >      spin_lock(&d->shutdown_lock);
>
> ... is what follows right after.
>
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -814,6 +814,9 @@ void domain_destroy(struct domain *d);
> >  int domain_kill(struct domain *d);
> >  int domain_shutdown(struct domain *d, u8 reason);
> >  void domain_resume(struct domain *d);
> > +#ifdef CONFIG_ARM
> > +void domain_resume_nopause(struct domain *d);
> > +#endif
> >
> >  int domain_soft_reset(struct domain *d, bool resuming);
> >
> > @@ -1010,6 +1013,10 @@ static inline struct domain *next_domain_in_cpup=
ool(
> >  /* VCPU is parked. */
> >  #define _VPF_parked          8
> >  #define VPF_parked           (1UL<<_VPF_parked)
> > +/* VCPU is suspended. */
> > +#define _VPF_suspended       9
> > +#define VPF_suspended        (1UL<<_VPF_suspended)
>
> Irrespective of the style violations in pre-existing code, can you please
> not add further violations, by inserting the missing blanks?

Okay

>
> > +
> >
>
> Please also don't introduce double blank lines.

I'll remove it.

>
> Jan

Best regards,
Mykola

