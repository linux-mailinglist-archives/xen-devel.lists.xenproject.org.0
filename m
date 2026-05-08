Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHk6O21M/mllowAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:49:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2A44FBA25
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304208.1577284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLS8W-0005CC-TF; Fri, 08 May 2026 20:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304208.1577284; Fri, 08 May 2026 20:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLS8W-0005Al-Pw; Fri, 08 May 2026 20:49:28 +0000
Received: by outflank-mailman (input) for mailman id 1304208;
 Fri, 08 May 2026 20:49:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wLS8V-0005Af-I8
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 20:49:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLS8U-006T6s-Qv
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 22:49:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fe4c51-e002-0a2a0a5209dd-0a2a4503d192-2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:49:26 +0200
Received: from [209.85.167.45] (helo=mail-lf1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fe4c55-672d-0a2a45030019-d155a72dd0cf-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:49:26 +0200
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5a887ebb416so2364000e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 13:49:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1778273365; cv=none;
        d=google.com; s=arc-20240605;
        b=jChQCcQvG+DQy0UP7icr+wS2Sgo4PHEevts1xhdxIj5qFrXGKrDUsrQ37h+coRWfs/
         o6pHQXPuOipUQVphuyt3mmSsZwZyMXhSDxriHo6cmtWUgBrjNgK4y+r6frxcuj5Zpa1I
         An0yrpeWJtM2fpVDkls8To5AIH3BFj9f2z5Mzz526CeCngGiJGWtVGbmtYzAuwDIvzWe
         GDZvnRy2h5ELFmAKTjsmvB9RlFKPCG5IndgChyup1mdIzr0VrQUo7TyJlCyNHu07h/ht
         HZrVNhuR2uUoFOspaxtV2PqE0TP1nzi6HcEdQy8zYZ5zkNVdHMWMCeW9nxKuALgq/PV2
         670A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w2Ts6xCNp5C0CnS/K72bmyoG4TpDMeFoFiGVyriUgr4=;
        fh=eEq7B6rg7ssf3icSookiwOw/XyVLUuCIMVm7gUWrf/I=;
        b=RrM2/BL83Q/3pp05YkVIvRrj3xnbnJKI2wAJ7/18oDJ+Fxxvz0TWbDWHuY4XV6ABaK
         o3gwk/xRse/2JRUN1CgQ8Lkqw4j33K5E9GgMIJcvlIqvtqTlX5a7YR6/kO+0I6TI5vv9
         5snW7LNV6xWLhbeqj3NJ0gec90U22nJtAQBgmiriDTBqBlI07avujzTBZjOIoLZt46u/
         NMM7rOA9OLIXCP93EbLAJyAUOBhfHVLAqxq9nqRGv2yEVR+O8ZcnlIB7jK6DDW25XToB
         1C18Uxa7pHe1LtPY7Akw/N6QwcbGui2vTtOYEcgrpQP7V99VRJ7yaRVwnpVZ6oBlbiar
         P+Qw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778273365; x=1778878165; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2Ts6xCNp5C0CnS/K72bmyoG4TpDMeFoFiGVyriUgr4=;
        b=XagxHtSnQgIY/Ep7il7bHUQ/D7i4xwdC8wFu6hTfItYi90y7UZudRBfMn5C41E6h5S
         u1kklc0BZECsHsbVz9c4xmwQoYcQcof6oKh1Dz5QfxIVmpnV3qD4HQxDozw0/YYeMOE6
         QN9e9odMilFK6Jey0k0FJNO5VsCXYqc5sUJkFoahTS0NDTuWnycJMX7AiH4I36skppGH
         QwtWs6ENvX9l7ZWjTE6no70RCfBlZEGHrn8j7xioKldOWD7WT+ZMgVVZN89wr25fdKTa
         6uBIOBJqd8pJx3YhNhI8wZmP2hDC8IIXuFTftB2ZwyyQ9kg2aocgfRl5hhVXxkyV5svl
         Br0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778273365; x=1778878165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w2Ts6xCNp5C0CnS/K72bmyoG4TpDMeFoFiGVyriUgr4=;
        b=qPK7L65ks+buzKISyo+yx12xwHdlxFOsiYjmC80zCil1XLw3MR1wpb0pO6JGNoNFZf
         +gmq7/I1XbAGEPWDzG3xYI1GUZWLexlTcq05FVLy0DyafGPxXb9Ft+bjm1+mPjsjfQOO
         XJKAMBORlsa67tnkBnF/k4IK3oZci0bDob4McAdk6XeglGTCWHq4mE5xQ42Ux1w1b7yf
         +YMKx6kTyutXC91HhIYmgjTKd38p4HsHj3ZgcNuml2IoFtVhF31e7WLW4BnBRKr4rXdR
         qZ+bCaCPbsItihjVn2Q+0tn60061hUy6NvdVZ4xwLxXi+fMlS0n9/rOUESMvKE5KTV/3
         VjNA==
X-Gm-Message-State: AOJu0YxmiXPFOaAE7RCiqAp4mlfahUKSiWDIeKCj1rIEal9IlqbjjgHs
	tPAkWH5i2yUlU5uFHgho39N5GBcW5fcylMyeuhYQUNcco4eYUjMb8h35GCLaF7A743CdBjNioRg
	cZONNN+hF55aUTS0FGkyjz+Hbnx3CoE8=
X-Gm-Gg: Acq92OFG7JrPKqKglr/Z2wdWHt4W50zLSXmD9dtNAeG6xYRcqjUfP/UQcHfeLnKq0fp
	ZdqMQIdM8VOIUZ5Rcvmjxa8CkFA/ZPpHyLn8VyVTK8sPlns2Y9ArVcP1GCX/106PF+lyWHTuIgj
	+kepFTDgjH2n8QLdXPAOaHUtZinQ7ulU2YlEHzubIWr5e+TQExsaXByU3ob7k72wfR5yiXpSOsZ
	4rR9dLxtnGE9nineorQUqJeXWkcdlrgS6XKPgmzQ6cQ/ZKOwGo273TxEKWfEi2kcfSlKxboLK4r
	LiL0TlAYb8Z6vNu5
X-Received: by 2002:a05:6512:124c:b0:5a8:7f4c:8a22 with SMTP id
 2adb3069b0e04-5a887cdf0a2mr5399916e87.20.1778273364865; Fri, 08 May 2026
 13:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <9b0f8922cd33df2b8e8038d639c1b8d8d73ce401.1775125380.git.mykola_kvach@epam.com>
 <4977CF18-39CC-4CC0-936A-890BAE5E8615@arm.com> <CAGeoDV8WkRGubF0qEXd4+PsXuabz3914G7bTYxTbaxZ2DsnY6w@mail.gmail.com>
 <A37EF531-9180-4410-8C01-0A591A10DC95@arm.com>
In-Reply-To: <A37EF531-9180-4410-8C01-0A591A10DC95@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 8 May 2026 23:49:13 +0300
X-Gm-Features: AVHnY4JUSBzt2DGg28-D9DWL1tOx1SosJsJFoIGEmfYFJ2gyh8R7BFJU-1_31KU
Message-ID: <CAGeoDV-xVnFUU8-GqJm6Ctm-m6KTt9C5ZmStq1kR146JdGgggA@mail.gmail.com>
Subject: Re: [PATCH v8 13/13] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Rahul Singh <Rahul.Singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1778273366-4086B938-7669A946/0/0
X-purgate-type: clean
X-purgate-size: 11936
X-Rspamd-Queue-Id: 5A2A44FBA25
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,arm.com:email];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:Rahul.Singh@arm.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 5:31=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.com=
> wrote:
>
> Hi Mykola,
>
> >>> +/* Xen suspend. data identifies the domain that initiated suspend. *=
/
> >>> +static void system_suspend(void *data)
> >>> +{
> >>> +    int status;
> >>> +    unsigned long flags;
> >>> +    struct domain *d =3D (struct domain *)data;
> >>> +
> >>> +    BUG_ON(system_state !=3D SYS_STATE_active);
> >>> +
> >>> +    system_state =3D SYS_STATE_suspend;
> >>> +
> >>> +    printk("Xen suspending...\n");
> >>> +
> >>> +    freeze_domains();
> >>> +    scheduler_disable();
> >>> +
> >>> +    status =3D can_system_suspend();
> >>> +    if ( status )
> >>> +    {
> >>> +        system_state =3D SYS_STATE_resume;
> >>> +        goto resume_scheduler;
> >>
> >> When we have an error and we get the resume_scheduler path, we apply b=
ack the
> >> context of the guest saved previously in do_psci_1_0_system_suspend(),=
 so am I
> >> correct saying the guest won=E2=80=99t get any PSCI error back and we =
resume the guest
> >> from the guest resume entrypoint?
> >>
> >> In case, should we have a different path that returns a PSCI error (PS=
CI_*) into the guest
> >> x0, and skips the context restore?
> >
> > You are right about the current control flow: once the virtual
> > SYSTEM_SUSPEND request has been accepted and the domain has been parked=
, a
> > later failure in the Xen-wide suspend path resumes the domain through t=
he normal
> > domain resume path, rather than returning a PSCI error from the origina=
l call.
> >
> > This is intentional in the current design. The virtual PSCI SYSTEM_SUSP=
END
> > path parks the domain and saves its resume context. The actual Xen-wide=
 host
> > suspend is a separate step that is attempted only after all domains are
> > suspended.
> >
> > So a failure in the later Xen-wide suspend step is treated as an abort =
of the
> > host suspend attempt after the domain suspend was already accepted. The=
 domain
> > is then resumed through the existing domain resume path, similarly to t=
he
> > toolstack/xl suspend-resume flow, rather than by re-entering the guest =
PSCI
> > call path and modifying the saved vCPU context again.
> >
> > I agree this design is not obvious from the patch. I will clarify the c=
ommit
> > message and comments. If you or the maintainers think that failures bef=
ore the
> > physical SYSTEM_SUSPEND call succeeds should be reported back through t=
he
> > original virtual PSCI call, then this would require a different flow. I=
 was
> > trying to avoid that extra complexity in this series.
>
> Ok I understand, I=E2=80=99m wondering if inside do_psci_1_0_system_suspe=
nd() we could do something
> like:
>
> [=E2=80=A6]
> if ( is_control_domain(d) && !other_domains_ready_for_suspend(d) )
>     return PSCI_DENIED;

Yes. I have reworked this locally and will include it in v9.

The control-domain readiness check is now done in the vPSCI SYSTEM_SUSPEND
path before building the guest resume context and before calling
domain_shutdown(..., SHUTDOWN_suspend), so in that case the call returns
PSCI_DENIED early rather than parking the domain first.

>
> [=E2=80=A6]
>
> But I=E2=80=99m ok also to only document this behaviour.
>
>
> >>>
> >>> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> >>> index bd87ec430d..8fb9172186 100644
> >>> --- a/xen/arch/arm/vpsci.c
> >>> +++ b/xen/arch/arm/vpsci.c
> >>> @@ -5,6 +5,7 @@
> >>>
> >>> #include <asm/current.h>
> >>> #include <asm/domain.h>
> >>> +#include <asm/suspend.h>
> >>> #include <asm/vgic.h>
> >>> #include <asm/vpsci.h>
> >>> #include <asm/event.h>
> >>> @@ -232,8 +233,7 @@ static int32_t do_psci_1_0_system_suspend(registe=
r_t epoint, register_t cid)
> >>>    if ( is_64bit_domain(d) && is_thumb )
> >>>        return PSCI_INVALID_ADDRESS;
> >>>
> >>> -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet *=
/
> >>> -    if ( is_hardware_domain(d) )
> >>> +    if ( !IS_ENABLED(CONFIG_SYSTEM_SUSPEND) && is_hardware_domain(d)=
 )
> >>>        return PSCI_NOT_SUPPORTED;
> >>>
> >>>    /* Ensure that all CPUs other than the calling one are offline */
> >>> @@ -266,6 +266,9 @@ static int32_t do_psci_1_0_system_suspend(registe=
r_t epoint, register_t cid)
> >>>            "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=
=3D%#"PRIregister"\n",
> >>>            epoint, cid);
> >>>
> >>> +    if ( is_control_domain(d) )
> >>
> >> Why is_control_domain() here and not is_hardware_domain() ?
> >
> > The use of is_control_domain() is intentional.
> >
> > The intended model is that Xen-wide host suspend is orchestrated by the
> > privileged management/control domain. The control domain coordinates th=
e
> > toolstack side, asks other domains to enter suspend, and then issues th=
e final
> > SYSTEM_SUSPEND request to Xen.
> >
> > This does not have to be the same entity as the hardware domain. If the
> > hardware domain is separate, it is one of the domains that the control =
domain
> > parks before the final host suspend step.
> >
> > The hwdom-specific checks in this patch have a different purpose: they =
avoid
> > the old hwdom_shutdown() path for SHUTDOWN_suspend and allow the hardwa=
re
> > domain to be parked as part of the suspend sequence. They do not define=
 the
> > policy for who is allowed to trigger Xen-wide host suspend.
> >
> > That said, this policy may not be optimal for all configurations, espec=
ially
> > when the control and hardware domain roles are split. I would appreciat=
e your
> > view, as well as the maintainers' views, on whether the trigger should =
remain
> > control-domain based, be tied to the hardware domain instead, or be exp=
ressed
> > through a separate host-suspend capability/helper.
>
> In the commit message and title I saw HW domain, so maybe the commit shou=
ld be updated
> to say control domain instead?

Yes, that was stale wording from an older version. I have fixed it
locally for v9.

>
> At this point however I=E2=80=99m wondering about this code above:
> ```
>     if ( !IS_ENABLED(CONFIG_SYSTEM_SUSPEND) && is_hardware_domain(d) )
>         return PSCI_NOT_SUPPORTED;
> ```
> and in do_psci_1_0_features(), shouldn=E2=80=99t we use consistently is_c=
ontrol_domain()?

Yes. I have reworked this locally so the policy is now explicit and
consistent.

The control domain is the only domain whose SYSTEM_SUSPEND request may
drive the Xen-wide host suspend path. For that domain, both
PSCI_FEATURES(SYSTEM_SUSPEND) and the real SYSTEM_SUSPEND path now
consult the same helper, so the advertised capability and the execution
path stay consistent.

That helper is an explicit host-suspend capability check: it requires
firmware support for PSCI SYSTEM_SUSPEND and it also keeps host suspend
disabled when Xen detects a missing suspend/resume path in required
host-side components.

For a non-control hardware domain, SYSTEM_SUSPEND remains a virtual
guest suspend operation and does not by itself trigger Xen-wide host
suspend. Other guests keep the existing virtual behaviour as well.

>
> >
> >>
> >>> +        host_system_suspend(d);
> >>> +
> >>>    return rc;
> >>> }
> >>>
> >>> @@ -290,7 +293,10 @@ static int32_t do_psci_1_0_features(uint32_t psc=
i_func_id)
> >>>        return 0;
> >>>    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >>>    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >>> -        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPOR=
TED : 0;
> >>> +        if ( IS_ENABLED(CONFIG_SYSTEM_SUSPEND) ||
> >>> +             !is_hardware_domain(current->domain) )
> >>
> >> Should this have also the condition that =E2=80=9Cis hardware domain a=
nd psci_ver >=3D PSCI_VERSION(1, 0)=E2=80=9D?
> >> Otherwise if the host machine doestn=E2=80=99t support PSCI 1.0 we wou=
ld return OK here but the call would
> >> fail later in call_psci_system_suspend()?
> >
> > Good point.
> >
> > I agree that, for the domain allowed to trigger Xen-wide suspend, Xen s=
hould
> > not advertise SYSTEM_SUSPEND if the host suspend path cannot be used.
> >
> > I think this should be checked as an explicit host SYSTEM_SUSPEND capab=
ility,
> > rather than only as psci_ver >=3D PSCI_VERSION(1, 0). The same capabili=
ty check
> > also needs to be enforced in the actual SYSTEM_SUSPEND handler before p=
arking
> > the domain, because a caller may invoke SYSTEM_SUSPEND directly without=
 first
> > querying PSCI_FEATURES.
> >
> > For ordinary guests, the physical PSCI version is not relevant because =
they
> > cannot trigger host suspend; their SYSTEM_SUSPEND path is virtual.
> >
> > I will make this consistent in v9: PSCI_FEATURES will advertise SYSTEM_=
SUSPEND
> > for the host-suspend-triggering domain only when the host SYSTEM_SUSPEN=
D backend
> > is available, and the actual SYSTEM_SUSPEND path will enforce the same =
check.
>
> ok

I have reworked this locally accordingly.

Rather than open-coding a psci_ver >=3D PSCI_VERSION(1, 0) test, the new
code uses an explicit host SYSTEM_SUSPEND capability predicate. For the
control domain, PSCI_FEATURES(SYSTEM_SUSPEND) and the actual
SYSTEM_SUSPEND handler now share that same check, so they stay
consistent even when host suspend is blocked by firmware capability or
by Xen-side runtime suspend/resume limitations.

>
> >>>
> >>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthr=
ough/arm/smmu.c
> >>> index 22d306d0cb..45f29ef8ec 100644
> >>> --- a/xen/drivers/passthrough/arm/smmu.c
> >>> +++ b/xen/drivers/passthrough/arm/smmu.c
> >>> @@ -2947,6 +2947,13 @@ static void arm_smmu_iommu_domain_teardown(str=
uct domain *d)
> >>> xfree(xen_domain);
> >>> }
> >>>
> >>> +#ifdef CONFIG_SYSTEM_SUSPEND
> >>> +static int arm_smmu_suspend(void)
> >>> +{
> >>> + return -ENOSYS;
> >>> +}
> >>> +#endif
> >>
> >> Maybe we want to gate the feature also to !CONFIG_ARM_SMMU ? I would w=
ait for the maintainers
> >> view on this.
> >
> > I feel that gating this strictly on !CONFIG_ARM_SMMU might not be the m=
ost
> > optimal approach here.
> >
> > CONFIG_ARM_SMMU is a build-time option and does not mean that an old SM=
MUv1/v2
> > device is actually present. Using it would disable system suspend even =
on
> > platforms where only SMMUv3 is used, because CONFIG_ARM_SMMU is enabled=
 by
> > default for Arm.
> >
> > The condition should be runtime-based: whether the active/probed IOMMU =
devices
> > have system suspend/resume support. For the old ARM SMMU driver this is=
 not
> > implemented today, so a platform with an SMMUv1/v2 instance should not =
expose
> > or attempt host suspend.
> >
> > I think we should handle this by tracking whether any old ARM SMMUv1/v2=
 device
> > was actually probed, or by adding a generic IOMMU suspend capability ch=
eck. Then
> > the host suspend availability check can reject system suspend only when=
 such an
> > unsupported IOMMU is present, instead of disabling the feature for all
> > Arm builds
> > with CONFIG_ARM_SMMU enabled.
> >
> > I would be interested to hear if you or the maintainers see a better wa=
y to
> > express this capability.
>
> ok, let=E2=80=99s address Jan comment now and we can see what the maintai=
ners think about this.

Ack, thanks.

I have already reworked the Jan-related part locally for v9: the
control-domain readiness/capability checks now happen in the vPSCI
SYSTEM_SUSPEND path before the domain finishes suspend, and PSCI_FEATURES
plus the real call now use the same host-suspend capability predicate.

I=E2=80=99ll fold that into the next revision, and then we can see what the
maintainers prefer for the remaining runtime-gating details.

Best regards,
Mykola

>
> Cheers,
> Luca
>
>

