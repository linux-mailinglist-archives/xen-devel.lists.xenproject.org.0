Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1AFAE5DC8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023202.1399137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTy92-0004wT-I5; Tue, 24 Jun 2025 07:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023202.1399137; Tue, 24 Jun 2025 07:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTy92-0004u7-Ed; Tue, 24 Jun 2025 07:32:40 +0000
Received: by outflank-mailman (input) for mailman id 1023202;
 Tue, 24 Jun 2025 07:32:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEHU=ZH=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uTy91-0004u1-Ml
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:32:39 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 672bd0e2-50cd-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 09:32:37 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-553b82f3767so4445482e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 00:32:37 -0700 (PDT)
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
X-Inumbo-ID: 672bd0e2-50cd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750750357; x=1751355157; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idY0L7FAG5ombVL1pgVzwW+SP8Atsr2COoChxPRVi8s=;
        b=dGZjNF2P2HOunqK7rSOV5u0iI9Yx9dW7y0ZbK+8AEEpj0Kyky7njbzVR60wBukL8fB
         fLsEHR2sYTWizaMbofLoqqX3ZoJxm9gDfkdVTH9/+pCmAwzYmiTRFDd1BKxlrXWr18pc
         GE68SDFf6E1raFYOXj9QLDnNIDP9+CSiiq0Etb3+ysfpVWr0NbLKU0F0oghp+V6xNjfO
         6RR3BY+sbDQsMOfbD0JIgBP9Poj3bhOhCHh+zfuDMw2RJD1PDVyAOIK4vGTY8qDjsw+J
         csso5SqGrIQqz8nozGcGYv6vFcc9x1C0bcAK3+WGGylSacd4jNw2XiM+ABqtLS6IpT/M
         XNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750357; x=1751355157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idY0L7FAG5ombVL1pgVzwW+SP8Atsr2COoChxPRVi8s=;
        b=Q380OSaNFdicDOf0mNgq7pmNHBhVBbKLUyUPpcHAnfv9WxmIBGa2lKAiYCiIlOnEwh
         uQA/uWX27tQ9U76kfs62NHdFs2cfSBeo4c0v/EDqv1CCewaGBVOLE1l3a+XAmRA7G68+
         k5xUun45qERW4HO7U5ZUyIogvGxhfhbC4ul3TPGXzd1EjqU9/LfOdSlJ5x35q55DSvG6
         dAeRKXW3Bxdsz6v8pjvG/tT3SsctOfvpUmpzgqJAb95YCnRmC8EBOf6YHctCT23wThOk
         N0ZEYrhKCsJtrU55fDvK/dkpOFb+RuCXoeuIBcngDxngIVHpJdTgVGo+bwSJ+uBQ78Lo
         5SFg==
X-Forwarded-Encrypted: i=1; AJvYcCWe+jnqa1NwltUgADuryZBdzKPw3bGqqnuvp7SOhhZcK4gN7G+eyKyKqmeASOkouUPyvBSnXSdTtjQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrEb71hB743qpJNJEJ/8VEpjVrj35Hk2Dw9Kt9U2r2mffpJMh6
	+62tumlDoPthqt+5cTpslf/L86Gy492piY+a5sOgH3gk+YM1Aj83Ut8dZo3bFP7xC+24fWyxvqZ
	tcGtBcJxV1oIUskqUE5I4KZFouhCRu7HqJolQLKdG8w==
X-Gm-Gg: ASbGnctfcDpv4dT6FeWTLV/6FT1ntpYmbWkx7VjcTRABqDdfwoe2KFVT0eTMYFET3FX
	v73pE5g0r18/Qtd5QseVxiEEH4j+XtXI+diDXM3jZb4B1NCbGrAdptElR1Ya2JuCczzQoYuplFC
	sqL6ksAvnvz4kspoRCa71cE2RfWWesrRFVPqB3sCDr3ZPrr8P5Uk32
X-Google-Smtp-Source: AGHT+IEL7SZMmDPhbWZETzSyYm+qp9+Rnpl2IsuPXqcLoDr/DqkeFdgNerkdqBq8z+LamlukndWrOXP1Og6tJsbiQwQ=
X-Received: by 2002:a05:6512:1052:b0:553:3407:eee0 with SMTP id
 2adb3069b0e04-553e3ba7f4amr5193639e87.4.1750750356867; Tue, 24 Jun 2025
 00:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748337249.git.mykola_kvach@epam.com> <1a8313537603bee36636b0fcd2fdc2f76a2374fb.1748337249.git.mykola_kvach@epam.com>
 <abf5da3e-8e5b-4159-98d4-60bf90672c2c@xen.org> <CAGeoDV-gZQ5QzP-5gFmFpNy5B=vUhdaeAbkN1LPFtSXBdGwepg@mail.gmail.com>
 <8884a8e1-4816-4b08-9f27-58f1df0c1d30@amd.com>
In-Reply-To: <8884a8e1-4816-4b08-9f27-58f1df0c1d30@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 24 Jun 2025 10:32:25 +0300
X-Gm-Features: AX0GCFsZ7SMR_8aGlSm_llCyA2Cp8uEQFXLTPcdAo0Pcqa-p3ja_zWAuKIyORlA
Message-ID: <CAGeoDV96YN=G_c9fXLR2xo6MRUBaNGCYfV-xE01mW7cngAoNQA@mail.gmail.com>
Subject: Re: [PATCH v4][PART 1 2/4] xen/arm: Implement PSCI SYSTEM_SUSPEND
 call for guests
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
	Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Fri, Jun 13, 2025 at 10:53=E2=80=AFAM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 06/06/2025 05:52, Mykola Kvach wrote:
> > Hi, @Julien Grall
> >
> > On Wed, Jun 4, 2025 at 2:00=E2=80=AFAM Julien Grall <julien@xen.org> wr=
ote:
> >>
> >> Hi Mykola,
> >>
> >> On 27/05/2025 10:18, Mykola Kvach wrote:
> >>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>
> >>> This patch adds support for the PSCI SYSTEM_SUSPEND function in the v=
PSCI
> >>> (virtual PSCI) interface, allowing guests to request suspend via the =
PSCI
> >>> v1.0 SYSTEM_SUSPEND call (both 32-bit and 64-bit variants).
> >>>
> >>> The implementation:
> >>> - Adds SYSTEM_SUSPEND function IDs to PSCI definitions
> >>> - Implements trapping and handling of SYSTEM_SUSPEND in vPSCI
> >>> - Allows only non-hardware domains to invoke SYSTEM_SUSPEND; for the
> >>>    hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting t=
he
> >>>    system in hwdom_shutdown() called from domain_shutdown
> >>> - Ensures all secondary VCPUs of the calling domain are offline befor=
e
> >>>    allowing suspend due to PSCI spec
> >>> - Treats suspend as a "standby" operation: the domain is shut down wi=
th
> >>>    SHUTDOWN_suspend, and resumes execution at the instruction followi=
ng
> >>>    the call
> >>
> >> Looking at the specification, I am still not convinced you can impleme=
nt
> >> PSCI SUSPEND as a NOP. For instance, in the section "5.1.19
> >> SYSTEM_SUSPEND", the wording implies the call cannot return when it is
> >> successul.
> >>
> >> I understand that 5.20.2 ("Caller reponsabilities" for SYSTEM_SUSPEND)
> >> suggests the caller should apply all the rules from 5.4 ("Caller
> >> responsabilties" for CPU_SUSPEND), but it is also mentioned that
> >> SYSTEM_SUSPEND behave as the deepest power down state.
> >>
> >> So I don't think standby is an option. I would like an opinion from th=
e
> >> other maintainers.
> >
> > Sure, let's discuss this with the others.
> My understanding of the spec is that SYSTEM_SUSPEND is equivalent to CPU_=
SUSPEND
> *for the deepest possible powerdown* state. CPU_SUSPEND can be implemente=
d as
> standby or powerdown, but the SYSTEM_SUSPEND only mentions powerdown stat=
e
> (which is the true deepest state). Therefore I don't think standby could =
apply
> to SYSTEM_SUSPEND and we could simply ignore the entry point address pass=
ed by OS.

Thank you for your feedback.

I agree with your and Julien's suggestions.
I will revert the behavior to the previous implementation, as proposed.

Best regards,
Mykola

>
> ~Michal
>
> >
> >>
> >>> +static int32_t do_psci_1_0_system_suspend(register_t epoint, registe=
r_t cid)
> >>  > +{> +    struct vcpu *v;
> >>> +    struct domain *d =3D current->domain;
> >>> +
> >>> +    /* Drop this check once SYSTEM_SUSPEND is supported in hardware =
domain */
> >>> +    if ( is_hardware_domain(d) )
> >>> +        return PSCI_NOT_SUPPORTED;
> >>> +
> >>> +    /* Ensure that all CPUs other than the calling one are offline *=
/
> >>> +    for_each_vcpu ( d, v )
> >>> +    {
> >>> +        if ( v !=3D current && is_vcpu_online(v) )
> >>
> >> I think this is racy because you can still turn on a vCPU afterwards
> >> from a vCPU you haven't checked.
> >>
> >
> > I'll think about how to protect against such cases.
> > Thank you for pointing that out.
> >
> >> Did you add this check just to follow the specification, or is there a=
ny
> >> other problem in Xen?
> >
> > Yes, it's just to comply with the specification =E2=80=94 at least,
> > I've never seen PSCI_DENIED triggered because of this check.
> > It's a leftover from a previous patch series.
> >
> >>
> >>> +            return PSCI_DENIED;
> >>  > +    }> +
> >>> +    /*
> >>> +     * System suspend requests are treated as performing standby
> >>> +     * as this simplifies Xen implementation.
> >>> +     *
> >>> +     * Arm Power State Coordination Interface (DEN0022F.b)
> >>
> >> This comment is a bit too verbose. There is no need to copy/paste the
> >> specification. You can just write a couple of sentence with link to th=
e
> >> specification.
> >
> > Got it, I'll revise the comment accordingly.
> >
> >>
> >> Cheers,
> >>
> >> --
> >> Julien Grall
> >>
> >
> > Best regards,
> > Mykola
>

