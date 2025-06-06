Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B41DACFBBD
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 05:53:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007821.1387013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNO86-0005lw-75; Fri, 06 Jun 2025 03:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007821.1387013; Fri, 06 Jun 2025 03:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNO86-0005jV-3A; Fri, 06 Jun 2025 03:52:30 +0000
Received: by outflank-mailman (input) for mailman id 1007821;
 Fri, 06 Jun 2025 03:52:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WdQj=YV=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uNO84-0005jP-Lm
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 03:52:28 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9c7ae88-4289-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 05:52:27 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55324587a53so2699470e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 20:52:27 -0700 (PDT)
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
X-Inumbo-ID: a9c7ae88-4289-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749181947; x=1749786747; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmiYJOGEmn+SreHNF+cjFhFXeNKSNS2Go8sLiTo6kNM=;
        b=fTMTnAmmOX7gfMsIIhFbGGn4qLhxN7tqcbvkU1cPrHMrIcQZ5+wQW9VzDXxUdaJ77P
         fjnyFmLPWO9me/9SXrk51lKoMe/DnacegRsIy8y0aV1rB39nZfjU3rglvAJxNvSFqZWs
         /MlIWfsySBlodL1N2F+yOKaFeHocL8vGyN8n2gBXqTo+AdBYFdr1/keIf8MscpG6vRhK
         Vd+1+y3kZi0M9ZtvYr1QVIPc7HKhKqaJC3d+SeLQ8gPvnfm3MUh/ZUYNrqMX4HmZEhfQ
         EH0+hF0LkSvKR9XQNOWlFE5dY1EIAgOHPDoXdES+TSMSsjK9e2OY+Eml6nH9sLpBiAx5
         II2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749181947; x=1749786747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmiYJOGEmn+SreHNF+cjFhFXeNKSNS2Go8sLiTo6kNM=;
        b=KTOwG5DY5XPfhBIiKJES7ZPa+MLRvHkzuA84bcBXwtRSEUUhl0mngy7aGvL2M5XwYW
         h0Y+ekE7CX1P/PcThaqdPa0GqDAGzKYPwNadxn+L2Qy5mQgJxqh2sJ6jeI4Npk2/dXTv
         Kp5C2XOSTxJqUHZiiOyyh3OL2cb/GCSf7/KP7zCqLjqSTQdhIrAhqZYM/A3Q2JNkcJSS
         Ha/qr92Wpc/QNMddRENVzjl5S/R467/QeuVY3VdUT8GlUdeKoq3Po+StDjzrcWn1yW25
         TpVFGtbyp/UuUXXaaSPyFU3Og0wLS1VbdiFuvmuOBzltWRxsGLU9DaHiarHzrYh/lGYk
         xlwg==
X-Gm-Message-State: AOJu0YxSmNC4mA1bfi/I72i5yIk6KorwDhPFqoY8O6mms/GJ/koRn1oG
	v1HKq0+C+cgE1wBEfu366QCZBkYz8qocE3fuN050q5dD9ubHibPP7EmkWhreQLbIZ/KmCldKt+r
	Aux7xfdO5ObjLXz783GK3x0p7SxWYVgc=
X-Gm-Gg: ASbGncuxU5OzsU2YxAbm4ftWvGS7f7DmZ3KScNpIs8laI0y5cVLhe0NsSpnpJm53MY7
	Ag4NL5nlUOWpOmPWml1Dyww22ezE7RWRpGMfZ86uqh0Axr1goypjPcwGk0AjrKpgX/OZPJWiBK2
	TuX5wPAhjPC2OH5Hn2XMiIYOl4r/ghKCNSKR15JbqFlA==
X-Google-Smtp-Source: AGHT+IGPCKORvjhbabzeVA3cghdGLj7c/CSBHt53h+MhHd1T77RvEyZUrgbv50HxMgZsjJ7BUlidFuAJ450CJwao9QQ=
X-Received: by 2002:a05:6512:1282:b0:553:268e:5011 with SMTP id
 2adb3069b0e04-5535d93f0d3mr1709876e87.26.1749181946578; Thu, 05 Jun 2025
 20:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748337249.git.mykola_kvach@epam.com> <1a8313537603bee36636b0fcd2fdc2f76a2374fb.1748337249.git.mykola_kvach@epam.com>
 <abf5da3e-8e5b-4159-98d4-60bf90672c2c@xen.org>
In-Reply-To: <abf5da3e-8e5b-4159-98d4-60bf90672c2c@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 6 Jun 2025 06:52:15 +0300
X-Gm-Features: AX0GCFtWMMuHO8vdIV_xNLhjvMOcEk_D7c8xKcyVE0sbgk-PTaKA85ZT1YqYc4Y
Message-ID: <CAGeoDV-gZQ5QzP-5gFmFpNy5B=vUhdaeAbkN1LPFtSXBdGwepg@mail.gmail.com>
Subject: Re: [PATCH v4][PART 1 2/4] xen/arm: Implement PSCI SYSTEM_SUSPEND
 call for guests
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, @Julien Grall

On Wed, Jun 4, 2025 at 2:00=E2=80=AFAM Julien Grall <julien@xen.org> wrote:
>
> Hi Mykola,
>
> On 27/05/2025 10:18, Mykola Kvach wrote:
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
> >    hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting the
> >    system in hwdom_shutdown() called from domain_shutdown
> > - Ensures all secondary VCPUs of the calling domain are offline before
> >    allowing suspend due to PSCI spec
> > - Treats suspend as a "standby" operation: the domain is shut down with
> >    SHUTDOWN_suspend, and resumes execution at the instruction following
> >    the call
>
> Looking at the specification, I am still not convinced you can implement
> PSCI SUSPEND as a NOP. For instance, in the section "5.1.19
> SYSTEM_SUSPEND", the wording implies the call cannot return when it is
> successul.
>
> I understand that 5.20.2 ("Caller reponsabilities" for SYSTEM_SUSPEND)
> suggests the caller should apply all the rules from 5.4 ("Caller
> responsabilties" for CPU_SUSPEND), but it is also mentioned that
> SYSTEM_SUSPEND behave as the deepest power down state.
>
> So I don't think standby is an option. I would like an opinion from the
> other maintainers.

Sure, let's discuss this with the others.

>
> > +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_=
t cid)
>  > +{> +    struct vcpu *v;
> > +    struct domain *d =3D current->domain;
> > +
> > +    /* Drop this check once SYSTEM_SUSPEND is supported in hardware do=
main */
> > +    if ( is_hardware_domain(d) )
> > +        return PSCI_NOT_SUPPORTED;
> > +
> > +    /* Ensure that all CPUs other than the calling one are offline */
> > +    for_each_vcpu ( d, v )
> > +    {
> > +        if ( v !=3D current && is_vcpu_online(v) )
>
> I think this is racy because you can still turn on a vCPU afterwards
> from a vCPU you haven't checked.
>

I'll think about how to protect against such cases.
Thank you for pointing that out.

> Did you add this check just to follow the specification, or is there any
> other problem in Xen?

Yes, it's just to comply with the specification =E2=80=94 at least,
I've never seen PSCI_DENIED triggered because of this check.
It's a leftover from a previous patch series.

>
> > +            return PSCI_DENIED;
>  > +    }> +
> > +    /*
> > +     * System suspend requests are treated as performing standby
> > +     * as this simplifies Xen implementation.
> > +     *
> > +     * Arm Power State Coordination Interface (DEN0022F.b)
>
> This comment is a bit too verbose. There is no need to copy/paste the
> specification. You can just write a couple of sentence with link to the
> specification.

Got it, I'll revise the comment accordingly.

>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

