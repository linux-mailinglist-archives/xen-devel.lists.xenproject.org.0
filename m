Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F763B29CDF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085718.1444026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvf8-0001P5-T1; Mon, 18 Aug 2025 08:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085718.1444026; Mon, 18 Aug 2025 08:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvf8-0001Nc-Pc; Mon, 18 Aug 2025 08:56:18 +0000
Received: by outflank-mailman (input) for mailman id 1085718;
 Mon, 18 Aug 2025 08:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFvU=26=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1unvf7-0001NW-HP
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:56:17 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32959493-7c11-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 10:56:15 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-333f92f1911so28244171fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:56:15 -0700 (PDT)
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
X-Inumbo-ID: 32959493-7c11-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755507375; x=1756112175; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9DlkGUcRpvPQ88uUWsNvtalYbldu7n4i89bSCAY7mc=;
        b=V8ZvMzFOxb97u+ZYVZFJQm8STKJO1UTFAbDMejuFSIyAIbLmZTlrG3nE1gFfkcIzDK
         urNbvCtJizAPB16jlnQvtpM2baIX3pi6q2G76BUoS1atz+Ie5UvChm/M4BnOf4mSCRoE
         T7GWqMb/PWQCBWLEsoMmdytc0kNw/UHw4ZvuOmraEAMX9m/1Ai52UfYoms1ZxBLLseqt
         g+RDgrd7Zcbe6mmPumVQfQzQLyahU729H5HV/luIZlZG9NJz+XzPlGnlPkjlgDpuw8IG
         2rnvIlgrAWOXdJdLsqTlWN9J5l2pOeOVXZut3zYihgnZccDZzRzV+AhIy7c3N5YvXVKh
         9chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507375; x=1756112175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9DlkGUcRpvPQ88uUWsNvtalYbldu7n4i89bSCAY7mc=;
        b=Nv4MTqRab7MLZI5YFNRv3c5iawYwPhzfX4X8ex3aXdre6Bf1V437VE/u8jdXBZwepk
         qvWAr0Wmv4y1w/SdSYjMVpe9Umbqf6/MEgOAxAe5a+malXuAN8XjGc0rqSr68bAKJJGZ
         FbR/lYRFI4DmJEJ/Ki+eVCxApkdYaL2YB0HEqrARu1PwMq6o7mSh2ig9PuPlaG0ITJan
         WMKDXt7+IDSfEKN2k1RayTkluI4ZOWxzz08R5Gn9/4dv3dY25Xk2vsVB7T23Y/KNpSSP
         24vXHcO8159/QHMD9X1hcWkGor89jZmk84/pKPRt2SWjHieOxH3Nv61Qnr1HPp+0yxxP
         4rBA==
X-Forwarded-Encrypted: i=1; AJvYcCWGjxMxlsWqhfwaWeYDPO5XNSC21qSwodbfKW7AKuzWmIUHe8lhZK+qXxhy8qYOc7nL69AoSMvgkqc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKcFPG1o4//C+hISTpTbzKkoA8CyHKvtutI6DWITfsYJcTFogz
	2dYJC9aDAwVnddcbYH75cA4NdZFwga8JsNV6YbdQjKmOLLUseceL+D18Vudx3jxznjmwUZ5MhRD
	IMq3lWWWiyf8sZFK0SvAp2tecGytPp9Y=
X-Gm-Gg: ASbGncsTu6PT/nTkeJY8iG20MJwuCxxUfWkl1fmYCQFUPSfCIYNusD/ZC2I28GnfoXM
	nrIdwCgO+E+oS/gCiL9MoKWhEVPQt2jS/JhYnijjQnwsQZs4rjiNUbCfVuwL/Uvvllgbpy6dm24
	1m04SlRX+Bm9WNpFcU9UGr2cUXU9uwidna3Iocj/c+T1/DbY6pEIVJ6ZXB1aBjKVVKFYD5y9d6o
	47m/uYlG4XrQA7S
X-Google-Smtp-Source: AGHT+IEOSXECCursbVT7t0NKBgRgjHlh1aH/T2zr8PLRk7vjQ28YDCKf+lNy5oF9KzP8s7MneKZyOqp1ETtaH0Hv0yE=
X-Received: by 2002:a2e:bea1:0:b0:32b:881e:9723 with SMTP id
 38308e7fff4ca-3340995bademr28611751fa.30.1755507374654; Mon, 18 Aug 2025
 01:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754595198.git.mykola_kvach@epam.com> <64cbfa58af7935c47141a2b1c0560e8d63e3d712.1754595198.git.mykola_kvach@epam.com>
 <f3973f06-8305-4895-97f9-6d52f03d03b3@suse.com>
In-Reply-To: <f3973f06-8305-4895-97f9-6d52f03d03b3@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 Aug 2025 11:56:03 +0300
X-Gm-Features: Ac12FXzoHP3Z7Wg9Wm0dCgee_PlmSPWESHJl2QVLi9RzVoQr_Utfo9vvxoRQyvc
Message-ID: <CAGeoDV8XUy-LxQ0w4brdkzdUrWsH6U6aRArgt47b2aV4KwDADA@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
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

On Fri, Aug 8, 2025 at 9:33=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 07.08.2025 21:39, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > This patch adds support for the PSCI SYSTEM_SUSPEND function in the vPS=
CI
> > (virtual PSCI) interface, allowing guests to request suspend via the PS=
CI
> > v1.0 SYSTEM_SUSPEND call (both 32-bit and 64-bit variants).
> >
> > The implementation:
> > - Adds SYSTEM_SUSPEND function IDs to PSCI definitions
> > - Implements trapping and handling of SYSTEM_SUSPEND in vPSCI
> > - Allows only non-hardware domains to invoke SYSTEM_SUSPEND; for the
> >   hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting the
> >   system in hwdom_shutdown() called from domain_shutdown
> > - Ensures all secondary VCPUs of the calling domain are offline before
> >   allowing suspend due to PSCI spec
> >
> > GIC and virtual timer context must be saved when the domain suspends.
> > This is done by moving the respective code in ctxt_switch_from
> > before the return that happens if the domain suspended.
> >
> > Usage:
> >
> > For Linux-based guests, suspend can be initiated with:
> >     echo mem > /sys/power/state
> > or via:
> >     systemctl suspend
> >
> > Resuming the guest is performed from control domain using:
> >       xl resume <domain>
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
> Nothing is being said on why domain_resume_nopause() would be needed. Whi=
le this
> may be entirely obvious to Arm people, the change is done in common code.
>
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1343,16 +1343,13 @@ int domain_shutdown(struct domain *d, u8 reason=
)
> >      return 0;
> >  }
> >
> > -void domain_resume(struct domain *d)
> > +#ifndef CONFIG_ARM
> > +static
> > +#endif
> > +void domain_resume_nopause(struct domain *d)
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
> >      spin_lock(&d->shutdown_lock);
> >
> >      d->is_shutting_down =3D d->is_shut_down =3D 0;
> > @@ -1360,13 +1357,24 @@ void domain_resume(struct domain *d)
> >
> >      for_each_vcpu ( d, v )
> >      {
> > +        clear_bit(_VPF_suspended, &v->pause_flags);
>
> Similarly it's not becoming clear why unconditionally doing this here wou=
ld
> be correct (now and going forward). There are other calls to this functio=
n,
> after all.
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
> > @@ -1010,6 +1013,9 @@ static inline struct domain *next_domain_in_cpupo=
ol(
> >  /* VCPU is parked. */
> >  #define _VPF_parked          8
> >  #define VPF_parked           (1UL<<_VPF_parked)
> > +/* VCPU is suspended. */
> > +#define _VPF_suspended 9
> > +#define VPF_suspended (1UL<<_VPF_suspended)
>
> And then, even if it's "only" style: With how adjacent code is formatted,
> how come there's no suitable blank padding here? If anything wants (and
> really needs) doing differently from pre-existing code, then to have
> blanks around the << as well.

Thank you for reviewing this patch series.
All your comments have been addressed in the next version of this patch
series, V9.

Best regards,
Mykola

>
> Jan

