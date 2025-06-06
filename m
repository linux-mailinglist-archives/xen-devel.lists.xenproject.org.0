Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D53ACFE3B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008108.1387322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSPZ-0006UL-2P; Fri, 06 Jun 2025 08:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008108.1387322; Fri, 06 Jun 2025 08:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSPY-0006S9-W0; Fri, 06 Jun 2025 08:26:48 +0000
Received: by outflank-mailman (input) for mailman id 1008108;
 Fri, 06 Jun 2025 08:26:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WdQj=YV=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uNSPX-0006S3-Jr
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:26:47 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc300eae-42af-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 10:26:46 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54d98aa5981so2373666e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 01:26:46 -0700 (PDT)
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
X-Inumbo-ID: fc300eae-42af-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749198406; x=1749803206; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewAT+odme99bLYZdokTwmbq8XUKEDDDi1p+vKpGkV5M=;
        b=NP+iymKb6LWouUQoiUC0wGlW5wOz/CBX5gg1SR7IleVv7y5q2nP5YIy5ippg6nd6FV
         j1JOfq3mVToPnSoa9Xbz8+mwZPfeMPlGnnQzGSyEIgLI7xUJsJ/ZGZNLOOrL77iGEQ3D
         QqtwTundCAc56HyBSKpYkUZ2dUe/WjE5CM7lfExWIDjeQBllLN0h+9Dd+AdK67mu9DYW
         yTyQKvzus+674ajCJBp2JPD8Jl5mGiUJXQnsolpFTsHE3BupKlqm3A+0Erx5jHONh8pi
         UTMJmKQIemUqsqw/VX+bPPiIzJlFyIWL26J1By+F5qC15dRI9+eX2l4aWBX0phPdxgPu
         N2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749198406; x=1749803206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewAT+odme99bLYZdokTwmbq8XUKEDDDi1p+vKpGkV5M=;
        b=ZnS0jfxaI+cUQ5dcDbqTTyB1PII4HceWVyHlPVQaH5w3EbEqNsSZTj79KZp6WPp5D8
         uirwTrtyFKr1ouEAdqJSLBTVXQsry3hxRztF5vwuKdv5JK7LzbUWKpQeVo8rY7BqiU7J
         jmqqnnyeW2wqxWCwdzOQMIzTHDPX1/5qwhCkZl2TQDud3bTqDfVZy/Yc109lozWD/EAi
         Vu6HSyrP14c4uRs0gTmXVCeQbfaoj5UOrfDBWfRLSPO0xX5AtPI9GJzyxaKADlZ53gfP
         tftZtzvslNwG+MYAkQCOHVZYSeSbRQWITZ+Rv2gfJrZQB7fa3bM2kk36Jght3MESR3y0
         didw==
X-Gm-Message-State: AOJu0YyFg2wd3u4KGaczOkH95nKRo0xA9hozru1Qfzk8aWq7jM9j2VD1
	EWGGd5LMpDZRnHQrF37bu6hdxmiM6DmA0R4juGLDKVK0Dtk9ugZGJRIyrcrHcZgER+ZOkYzzoSE
	tzXOzsEx9bSmNgTsXwmiAZ5FsHVlVObc=
X-Gm-Gg: ASbGncvc8Kvb8VWZGBMHXbxRJoDR/J07vmtNGxx/5mYSftq1PS7/WxjBH00HE+CGKjr
	jpwgcM1Y8/sxXKZdRW9BCpmeusshYJQZAY/6e8FdidjepapQKvchtprt+9yyu1Gw/Jh8KkRoJAA
	GKNJLoo03IkIvcAUHmPsM5DzeUWgKxDVE=
X-Google-Smtp-Source: AGHT+IHeilxyUONEo2ILQlZXyR3O/JIsnNDwVU9ZZERBT8aTXV4a1X8mr53Q44zy52xz86Ekq4PCqZXwvI+tEhVtP2s=
X-Received: by 2002:a05:6512:2316:b0:553:51a2:441b with SMTP id
 2adb3069b0e04-55366bd3acemr613366e87.4.1749198405777; Fri, 06 Jun 2025
 01:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748337249.git.mykola_kvach@epam.com> <1a8313537603bee36636b0fcd2fdc2f76a2374fb.1748337249.git.mykola_kvach@epam.com>
 <abf5da3e-8e5b-4159-98d4-60bf90672c2c@xen.org> <CAGeoDV-gZQ5QzP-5gFmFpNy5B=vUhdaeAbkN1LPFtSXBdGwepg@mail.gmail.com>
In-Reply-To: <CAGeoDV-gZQ5QzP-5gFmFpNy5B=vUhdaeAbkN1LPFtSXBdGwepg@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 6 Jun 2025 11:26:33 +0300
X-Gm-Features: AX0GCFvPM3HQcgvBk5Xh5SNf_keyTVM5lYQ_KYha90uNAE4vEPGLZRoddmk-ykA
Message-ID: <CAGeoDV9VTj4e0zKnYGJGrHe797oQrbRifbi7qiz-Uc9zFMgrTw@mail.gmail.com>
Subject: Re: [PATCH v4][PART 1 2/4] xen/arm: Implement PSCI SYSTEM_SUSPEND
 call for guests
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 6:52=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail.com=
> wrote:
>
> Hi, @Julien Grall
>
> On Wed, Jun 4, 2025 at 2:00=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
> >
> > Hi Mykola,
> >
> > On 27/05/2025 10:18, Mykola Kvach wrote:
> > > From: Mykola Kvach <mykola_kvach@epam.com>
> > >
> > > This patch adds support for the PSCI SYSTEM_SUSPEND function in the v=
PSCI
> > > (virtual PSCI) interface, allowing guests to request suspend via the =
PSCI
> > > v1.0 SYSTEM_SUSPEND call (both 32-bit and 64-bit variants).
> > >
> > > The implementation:
> > > - Adds SYSTEM_SUSPEND function IDs to PSCI definitions
> > > - Implements trapping and handling of SYSTEM_SUSPEND in vPSCI
> > > - Allows only non-hardware domains to invoke SYSTEM_SUSPEND; for the
> > >    hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting t=
he
> > >    system in hwdom_shutdown() called from domain_shutdown
> > > - Ensures all secondary VCPUs of the calling domain are offline befor=
e
> > >    allowing suspend due to PSCI spec
> > > - Treats suspend as a "standby" operation: the domain is shut down wi=
th
> > >    SHUTDOWN_suspend, and resumes execution at the instruction followi=
ng
> > >    the call
> >
> > Looking at the specification, I am still not convinced you can implemen=
t
> > PSCI SUSPEND as a NOP. For instance, in the section "5.1.19
> > SYSTEM_SUSPEND", the wording implies the call cannot return when it is
> > successul.
> >
> > I understand that 5.20.2 ("Caller reponsabilities" for SYSTEM_SUSPEND)
> > suggests the caller should apply all the rules from 5.4 ("Caller
> > responsabilties" for CPU_SUSPEND), but it is also mentioned that
> > SYSTEM_SUSPEND behave as the deepest power down state.
> >
> > So I don't think standby is an option. I would like an opinion from the
> > other maintainers.
>
> Sure, let's discuss this with the others.
>
> >
> > > +static int32_t do_psci_1_0_system_suspend(register_t epoint, registe=
r_t cid)
> >  > +{> +    struct vcpu *v;
> > > +    struct domain *d =3D current->domain;
> > > +
> > > +    /* Drop this check once SYSTEM_SUSPEND is supported in hardware =
domain */
> > > +    if ( is_hardware_domain(d) )
> > > +        return PSCI_NOT_SUPPORTED;
> > > +
> > > +    /* Ensure that all CPUs other than the calling one are offline *=
/
> > > +    for_each_vcpu ( d, v )
> > > +    {
> > > +        if ( v !=3D current && is_vcpu_online(v) )
> >
> > I think this is racy because you can still turn on a vCPU afterwards
> > from a vCPU you haven't checked.
> >
>
> I'll think about how to protect against such cases.
> Thank you for pointing that out.

Is that actually possible in this context? If suspend is successful, we pau=
se
all present vCPUs (including the current one), and control is not returned =
to
the guest until either resume or an error occurs in this function. Since th=
is
runs as part of a trap, the current function can't be preempted.

Also, from the use of _VPF_down (via is_vcpu_online) on Arm, it looks like
guest requests are what manipulate this bit, which further limits what can
happen concurrently.

Maybe I missed something=E2=80=94if so, please share some details on how th=
is could
happen.

Note: It looks like the same behavior is present for VCPUOP_down as well.

>
> > Did you add this check just to follow the specification, or is there an=
y
> > other problem in Xen?
>
> Yes, it's just to comply with the specification =E2=80=94 at least,
> I've never seen PSCI_DENIED triggered because of this check.
> It's a leftover from a previous patch series.
>
> >
> > > +            return PSCI_DENIED;
> >  > +    }> +
> > > +    /*
> > > +     * System suspend requests are treated as performing standby
> > > +     * as this simplifies Xen implementation.
> > > +     *
> > > +     * Arm Power State Coordination Interface (DEN0022F.b)
> >
> > This comment is a bit too verbose. There is no need to copy/paste the
> > specification. You can just write a couple of sentence with link to the
> > specification.
>
> Got it, I'll revise the comment accordingly.
>
> >
> > Cheers,
> >
> > --
> > Julien Grall
> >
>
> Best regards,
> Mykola

