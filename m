Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC00CB1D49A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 11:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072695.1435672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujwik-0006S9-Ie; Thu, 07 Aug 2025 09:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072695.1435672; Thu, 07 Aug 2025 09:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujwik-0006Q7-F4; Thu, 07 Aug 2025 09:15:34 +0000
Received: by outflank-mailman (input) for mailman id 1072695;
 Thu, 07 Aug 2025 09:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbW2=2T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ujwii-0006NV-JZ
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 09:15:32 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1131e74d-736f-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 11:15:31 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-55b847a061dso2092834e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 02:15:31 -0700 (PDT)
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
X-Inumbo-ID: 1131e74d-736f-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754558131; x=1755162931; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7QloieeF6cWwG6JpS5ZTXmWkk2nuuaGJXBvDCAZ/XI=;
        b=kmg6hWyApNYbgB92Rnzgx25j8fIgavCmCEkFEghMWFA4DmBR8LOR5gz8J5jbq2QzBz
         ++nXesgdOmTe9VFK3+IFThK293KC5h1QKeUUw1lrmJ/juTpZRdX9Pu1Hx1pwIztJiaYQ
         nYkVafOhplo+RsMhVJktke2fxmYAIXYKL7WwJUny0njJls7h0wPq8paj32HCo9ZYbtAu
         shWE7bwpukd6+GA67a76chqvwWHZNvYowWq9LUcjLpTToRJ818D6O9PPDCmi+l3VGxwS
         EFPH452NL7PLFKUQDZ4t5/8sZJtR6w6DoYQFZgbG2ZIIy0bo1BuecepknBbxGq5MEFcg
         JPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754558131; x=1755162931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7QloieeF6cWwG6JpS5ZTXmWkk2nuuaGJXBvDCAZ/XI=;
        b=ePmwk5iREgBVEi9bZA99ES4ao2x/T78IjdUPN27urUw9gFzVeeKNvP8xDBOZR8GY/q
         8tlrpuh1Koctq/K9UdkGyTYTpP3SVCcv+yy8EagIU4eSRoZVjis4ltx6fjm8r5+g3PBZ
         fPm4CrPIKzO3rK5ZvjVTi3lcL9PJFSzw3QeD/bUK0fnPD5v+HqNy6RvL/h1chC7Gu/v1
         6Q1NJ+okOGwrcZfljqsCs0p6bbEFK3o8mxkTAeHz8tXw1T+m/7AahD7O03/i3MrSNyHp
         VTe9d/ZWDwQiB0oQ5FYIzV285mfaxqCY4Iyi6Ihk9B41DyVlL04fXYf5mPigDdGqgJd5
         SPIw==
X-Forwarded-Encrypted: i=1; AJvYcCUS5hPBBguJZT7/qPYkfaDQouScUwZd7xcGgu3fIuoAjR1fl9Ov0QnxlIbxXbNhVYJUBLdWxg8HnlU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+tiW950A7lTJ2AnZnpO18M6wBWhgkl/4ac9y0Z23sf+9ecNLX
	KPXSmxk/0cF29VQRCzPKbKB/GvOPIyRQ2pk5iPTkjhJ393vN3+fPtYyQRGSKIKKGM/q6HXA4fnM
	AvAVjW1DBGSiIQhGKIHuLnqjLrQuxxOM=
X-Gm-Gg: ASbGncvsyXynYLW+C6Q/OjN19d0wH3+ExLRgbMFkLsoBBd4Zigw0UtwMNn4NBQCfOF9
	JolQzuud7ChdgKgS1/oMam9BSrLKptyiNcUVL0pe3hSlzAlY02fRkLjDeXrMr8W/ImMRYUotSvO
	TEVYB8s1tES3P0EH4avp6zJwfJXlGpBRfJAtReYebZ4eFeQwSlXsliQGihbEk6YKufWkgnoXn+6
	+ROUQ==
X-Google-Smtp-Source: AGHT+IHvqDnNo4UYQ3g0VScMDfYhRwwoBft+WcnWGugiJMsdrqfJg4O0HBqvFwdmB20ZZ7fEOfJrIZRz2OZFxVzRlRk=
X-Received: by 2002:a05:6512:23a9:b0:55b:814a:a7fa with SMTP id
 2adb3069b0e04-55cb5d91a56mr848932e87.8.1754558130647; Thu, 07 Aug 2025
 02:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753778926.git.mykola_kvach@epam.com> <45e670391c37ab54f721b6576a41ded2e543d6db.1753778926.git.mykola_kvach@epam.com>
 <2e43ded3-d14d-49f8-bf98-f3d58d0b39af@suse.com> <CAGeoDV8QuaFHFg3_MaFdk_zsMCKVD0V6a55ut74HoLuQF3diJw@mail.gmail.com>
In-Reply-To: <CAGeoDV8QuaFHFg3_MaFdk_zsMCKVD0V6a55ut74HoLuQF3diJw@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 7 Aug 2025 12:15:19 +0300
X-Gm-Features: Ac12FXwKhJiSKJ21LvXLp9ZWVDkTz6O9Sb_dbg9JtZCFIJQvUbaOKvPuC32HDmI
Message-ID: <CAGeoDV-u8LALBsCz8aFa7E6qJNyu9-rsx3aHzEPQsSjLaKeGCA@mail.gmail.com>
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

On Thu, Aug 7, 2025 at 10:38=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail.co=
m> wrote:
>
> Hi Jan,
>
> On Tue, Jul 29, 2025 at 12:11=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >
> > On 29.07.2025 10:52, Mykola Kvach wrote:
> > > --- a/xen/common/domain.c
> > > +++ b/xen/common/domain.c
> > > @@ -1334,16 +1334,15 @@ int domain_shutdown(struct domain *d, u8 reas=
on)
> > >      return 0;
> > >  }
> > >
> > > -void domain_resume(struct domain *d)
> > > +#ifdef CONFIG_ARM
> > > +void domain_resume_nopause(struct domain *d)
> > > +#else
> > > +static void domain_resume_nopause(struct domain *d)
> > > +#endif
> >
> > #ifndef CONFIG_ARM
> > static
> > #endif
> > void domain_resume_nopause(struct domain *d)
> >
> > to have as little redundancy as possible.
>
> Okay, I=E2=80=99ll change it.
>
> >
> > >  {
> > >      struct vcpu *v;
> > >
> > > -    /*
> > > -     * Some code paths assume that shutdown status does not get rese=
t under
> > > -     * their feet (e.g., some assertions make this assumption).
> > > -     */
> > > -    domain_pause(d);
> > > -
> > > +    domain_lock(d);
> >
> > This addition of locking affects domain_resume() as well. Neither need =
nor
> > correctness are discussed in the description. If the locking was really
> > needed for domain_resume() as well, I suppose adding that would better =
be
> > a separate change anyway.
>
> Thanks for the review.
>
> The locking was added to avoid potential races involving _VPF_suspended a=
nd
> the suspend/resume logic.
>
> Consider the case where domain_lock() is not used inside domain_resume():
>
> Domain 1 initiates suspend via PSCI SYSTEM_SUSPEND. At the same time,
> Domain 0 invokes resume for Domain 1.
>
> Domain 0 calls xl resume, which leads to domain_resume(). Domain 1 acquir=
es
> domain_lock() as part of the suspend path. Then it acquires the shutdown
> lock in domain_shutdown(). Domain 0 is blocked waiting for the shutdown
> lock. When Domain 1 releases the shutdown lock, it sets _VPF_suspended an=
d
> modifies the VCPU context. Then Domain 0 clears _VPF_suspended.
>
> At this point, ctxt_switch_from() might be called with _VPF_suspended
> already cleared, and the VCPU context partially updated. For example, the
> guest PC is set to the resume entry point, but some registers like TTBR o=
r
> SCTLR_EL1 are saved from the current hardware context by
> ctxt_switch_from.
>
> However, after reviewing the flow again, I think this kind of race could
> still happen even with the lock in place. Imagine Domain 1 sets the flag
> via SYSTEM_SUSPEND, and then Domain 0 clears it by resuming the domain
> before the first context switch. This could still result in a partially
> updated context with inconsistent state.

There are no synchronization issues here -- domain_pause inside domain_resu=
me
prevents them by design.

The only situation where issues might arise is during a SYSTEM_SUSPEND requ=
est
for a guest that has multiple vCPUs online (buggy OS), while another
vCPU performs
a CPU_ON request.

Therefore, it seems we only need to protect the loop that checks if other v=
CPUs
are offline during the SYSTEM_SUSPEND vPSCI call using the domain lock.

>
> So it might be better to update the VCPU context at the point of resume
> instead of doing it during suspend. I'll look into that further and also
> check for other possible races if the update is moved.
>
> >
> > The addition of this locking is particularly interesting considering th=
at
> > ...
> >
> > >      spin_lock(&d->shutdown_lock);
> >
> > ... is what follows right after.
> >
> > > --- a/xen/include/xen/sched.h
> > > +++ b/xen/include/xen/sched.h
> > > @@ -814,6 +814,9 @@ void domain_destroy(struct domain *d);
> > >  int domain_kill(struct domain *d);
> > >  int domain_shutdown(struct domain *d, u8 reason);
> > >  void domain_resume(struct domain *d);
> > > +#ifdef CONFIG_ARM
> > > +void domain_resume_nopause(struct domain *d);
> > > +#endif
> > >
> > >  int domain_soft_reset(struct domain *d, bool resuming);
> > >
> > > @@ -1010,6 +1013,10 @@ static inline struct domain *next_domain_in_cp=
upool(
> > >  /* VCPU is parked. */
> > >  #define _VPF_parked          8
> > >  #define VPF_parked           (1UL<<_VPF_parked)
> > > +/* VCPU is suspended. */
> > > +#define _VPF_suspended       9
> > > +#define VPF_suspended        (1UL<<_VPF_suspended)
> >
> > Irrespective of the style violations in pre-existing code, can you plea=
se
> > not add further violations, by inserting the missing blanks?
>
> Okay
>
> >
> > > +
> > >
> >
> > Please also don't introduce double blank lines.
>
> I'll remove it.
>
> >
> > Jan
>
> Best regards,
> Mykola

