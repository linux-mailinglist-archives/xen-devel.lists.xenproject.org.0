Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F4CEE050
	for <lists+xen-devel@lfdr.de>; Fri, 02 Jan 2026 09:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194855.1513024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbahp-00056U-PN; Fri, 02 Jan 2026 08:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194855.1513024; Fri, 02 Jan 2026 08:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbahp-00053l-L2; Fri, 02 Jan 2026 08:40:21 +0000
Received: by outflank-mailman (input) for mailman id 1194855;
 Fri, 02 Jan 2026 08:40:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+OO=7H=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vbaho-00053f-4X
 for xen-devel@lists.xenproject.org; Fri, 02 Jan 2026 08:40:20 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9909538-e7b6-11f0-9ccf-f158ae23cfc8;
 Fri, 02 Jan 2026 09:40:17 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-598f59996aaso14142343e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Jan 2026 00:40:16 -0800 (PST)
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
X-Inumbo-ID: a9909538-e7b6-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767343216; x=1767948016; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXv3agKNnV0s9elI9yh2JSpFn8oB/bR6iRkK8+zm05E=;
        b=a9KI4h1+LyAoovROCQWR+FizWW7w2H29Yp/rK6uo95tY9euQW9WkUgw1RXobEAL3GJ
         Mvo9xGMAJFIQsQV09fpGrIvFTY52O+O3AA5xl6XTTKPW/RPSVEn6JxLzQPEdGfrYMv4o
         uWQvQfs2do/L/K6ztngRtHmxU5dCDiVmK5VkcIlBINoWDs3Afeg1UO2QCmxqhlRq6RLD
         4uXG3ic1LBxDgsfjMGHNmsoESgDLeflvOBr+qmYP6GYK0qDSFUGZVOGGENKGMXBQbrex
         ooFsl0QGTJYcvklPOBOQ3Um5gThU5TNEUOfiY7GC0UILaO3ca7pgBC83hPzEw+YD3rdx
         7KCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767343216; x=1767948016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXv3agKNnV0s9elI9yh2JSpFn8oB/bR6iRkK8+zm05E=;
        b=lU+LyhbAdckND21ziAkdYyyDE2/GLmhauhO4hXwKjAtBFRVmN9cGzOnWW7Aka6i3c8
         gm98UwjMiSaLQxJxKbAEsOGwRpH7ficcXocyom5X38ea//x6Ftic41HoKpyZZyS2mRaL
         mMnYJiMyIbAG+9FaFbBb7DACVjSNecsJY9Gkj13ofQ/vFMWQbwITEI52T9Y26K9YvO2S
         Ywwvorgl3l1NZusLhhsybKEo72QFHidiEOl6gPAinGoa5UvObQi2wsqjUzGRLkJZ32D3
         njoU7NiPoiq5z5gJzfo5qMHx6mL7Z6ftKZwhzlRNPMZSD+tq86G8GI++38aYE9bYDjOg
         apXA==
X-Gm-Message-State: AOJu0Yw6sC4K3SDCPwo5AZpZEyfSlxbAKLlDnHWinDN/JSmu2ydvMHEM
	ZK2timKeKVmso/227MIbGq3xTj/QRVoJFc8KYRoWyLWYD5fyEcAD/ZbJdo7qVw+AuTy7u5NNdpi
	EFNMpsmgZQpnCZrzZzCXcOft7EmYMaEw=
X-Gm-Gg: AY/fxX6GOG4JAm7S4Rv/+kTHbBb7abwU/oELq/FsVtqGsIq53a+06yZ5aA8I7UxdHUc
	3y68zrhg75uFR5PXs/b93/rj9IKZ6rnd3Q3BX1dLB7chM8Xq4f/3jsSnXZvSXMvXSWqLeBxr7li
	6lGNaDuGdffd9GlTwSCwLBkpcyLea47YD0WySoN6M4Az0oRt1DdoOtSWvW/rbiZAhhsbrUGf9VY
	GWYX2BIx57iNymtbXaDLt9mbjAHiYHo/8Ur4Lgh83cJBiGizmI3j3lTpTR4vGjDea3DPvw=
X-Google-Smtp-Source: AGHT+IHSah1FqpXb0pDArFOIyWEczE0xZ6hZ2vaeTd0SD77mOpsMZBecIkKl686G9AV6g9ykQAY6HzFtIiOak+TD/L0=
X-Received: by 2002:a05:6512:128c:b0:595:9152:b920 with SMTP id
 2adb3069b0e04-59a17d479d3mr15426420e87.39.1767343215513; Fri, 02 Jan 2026
 00:40:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765472890.git.mykola_kvach@epam.com> <9f084beff76e40fed2138ba2d59145a96b930c63.1765472890.git.mykola_kvach@epam.com>
 <a2be5ae1-7e4a-4137-9e36-6c5845a93ca1@xen.org>
In-Reply-To: <a2be5ae1-7e4a-4137-9e36-6c5845a93ca1@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 2 Jan 2026 10:40:04 +0200
X-Gm-Features: AQt7F2qXLshlF6bDzxyoPtKPsyUAFnAAo_SqV0sd3lPi1TvvyHWtzNrJPXZW6g4
Message-ID: <CAGeoDV-KM1D91MJ+BZ01osKYS0602eByzEON48O_LmpOmGaL-A@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thank you for the review.

On Fri, Dec 26, 2025 at 2:39=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 11/12/2025 18:43, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > System suspend may lead to a state where GIC would be powered down.
> > Therefore, Xen should save/restore the context of GIC on suspend/resume=
.
> >
> > Note that the context consists of states of registers which are
> > controlled by the hypervisor. Other GIC registers which are accessible
> > by guests are saved/restored on context switch.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V7:
> > - restore LPI regs on resume
> > - add timeout during redist disabling
> > - squash with suspend/resume handling for GICv3 eSPI registers
> > - drop ITS guard paths so suspend/resume always runs; switch missing ct=
x
> >    allocation to panic
> > - trim TODO comments; narrow redistributor storage to PPI icfgr
> > - keep distributor context allocation even without ITS; adjust resume
> >    to use GENMASK(31, 0) for clearing enables
> > - drop storage of the SGI configuration register, as SGIs are always
> >    edge-triggered
> > ---
> >   xen/arch/arm/gic-v3-lpi.c              |   3 +
> >   xen/arch/arm/gic-v3.c                  | 319 ++++++++++++++++++++++++=
-
> >   xen/arch/arm/include/asm/gic_v3_defs.h |   1 +
> >   3 files changed, 320 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> > index de5052e5cf..61a6e18303 100644
> > --- a/xen/arch/arm/gic-v3-lpi.c
> > +++ b/xen/arch/arm/gic-v3-lpi.c
> > @@ -391,6 +391,9 @@ static int cpu_callback(struct notifier_block *nfb,=
 unsigned long action,
> >       switch ( action )
> >       {
> >       case CPU_UP_PREPARE:
> > +        if ( system_state =3D=3D SYS_STATE_resume )
> > +            break;
>
> Do we need this check because we don't free the LPI pending table when
> the CPU is turned off?

Yes. In the system suspend/resume case we intentionally keep the LPI
pending table in RAM and reuse it after wake-up/CPU bring-up. The state
is still stored in memory, so we do not need to save/restore it elsewhere;
we just need to avoid allocating a new table on resume.

>
> If so, don't we already have a problem for CPU hotplug because the
> percpu area will be freed but not the pending table?

System suspend/resume is a special case in Xen: system_state is
transitioned during suspend, and the generic percpu allocator does not
free/allocate percpu areas in that state (see [1] and [2]). As a result,
the percpu storage (including the pointer to the pending table) remains
intact across the suspend/resume cycle, and reusing the existing table
is safe.

CPU hotplug is different: system_state remains in the normal running
state, so percpu areas can be freed on CPU offline. In that scenario
we should not rely on the =E2=80=9Creuse on resume=E2=80=9D logic; the pend=
ing table
needs to be explicitly freed as part of the CPU teardown (otherwise it
would indeed be leaked once the percpu pointer is gone). The check in
this change is intended for suspend/resume, not for hotplug semantics.

[1] https://elixir.bootlin.com/xen/v4.21.0/source/xen/common/percpu.c#L36
[2] https://elixir.bootlin.com/xen/v4.21.0/source/xen/common/percpu.c#L88

Thanks,
Mykola

>
> Cheers,
>
> --
> Julien Grall
>

