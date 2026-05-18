Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGRLL09DC2qsFAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 18:50:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF2357132D
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 18:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312160.1582330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP1A5-00057j-46; Mon, 18 May 2026 16:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312160.1582330; Mon, 18 May 2026 16:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP1A5-00056c-14; Mon, 18 May 2026 16:49:49 +0000
Received: by outflank-mailman (input) for mailman id 1312160;
 Mon, 18 May 2026 16:49:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wP1A3-00056W-68
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:49:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP1A1-00FBPO-Pn
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 18:49:45 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b4303-e002-0a2a0a5209dd-0a2a4507d2ac-36
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 18:49:45 +0200
Received: from [209.85.208.174] (helo=mail-lj1-f174.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b4329-229c-0a2a45070019-d155d0aee59d-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 18:49:45 +0200
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-394413a63d3so22407411fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:49:45 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779122985; cv=none;
        d=google.com; s=arc-20240605;
        b=Q7ahKdAi/ytb+adxfgwau/iRKzgThadUCXpjzxDW8HvKVtUXX+Dqt6IZNdIHqxq9tq
         p1fOB1rfXPTJ0lLBMBEf1+SwZiGaS+8QdhQ9o0ntQt2YaGtxVRJN9iTF2OK2X2oo4apV
         /WmMa4erZdYTqptQGSgiIujuydTNzAvVcofFvsqsRBaf7+VCp78JWVhVUHB2QRmcz18t
         /aeYEkdOBfy8GWsl37r7lNttnrNyi3grqBsITlIArz5QSD/zIRdJcdXfLpHoex6vMVEX
         NKDDN7pdvA+wxIoouLvTuaNgCDMrr7NqEk4Sx838txwlCuzPIyHIVCupAXzefBxCZgBd
         zt9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Apv+qMKbA7fz7/8la2yYzKpT8LQKv7OimyMDcCXInk=;
        fh=SFtdlMni3BnFH+oTSZbVgVF1hLyFxrwlVmTI+BqD6+c=;
        b=Y053u7+ksSq2USO2mZpqe1qQaqWbMm62lIzalwSMmljQkSe6j1ipUKotuFPvA8ypYg
         LmxxBeRKlR8ixJiF/CmCZLjhIjJ+BcqLXfRo53pfMT8amKNr5aZqctmV33Udp2TZ6GaC
         jNWYLll0intSYunqxw7hgWLCbWEwPmPKeNgKRaofto3+ZccHHsU1hDDTTLEW2rLiuzdL
         01wfzhRuaVJN9bSg41rRs+S16FWExhonlvKbsUWSsSnibvPqXOE+jcGQIiagYph3hUG0
         LtNU5tcSVeD4f6v0rKknb/GbiJFzAURCbtgh8iJW1rOrSprtJRW6r4lHbFIAxvfGeEpr
         9rww==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779122985; x=1779727785; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Apv+qMKbA7fz7/8la2yYzKpT8LQKv7OimyMDcCXInk=;
        b=EePzDma6IlvH4nRQtUj4U1aZ/edlVY0sCsBpew385YYTX1zvkNdnAOJ7TqaSlegUQl
         A51JOQ1GVeldm1rszotioy5roT4w2jvk+tmY+dNLDyrtcH+D4eW0xrHDCT4El3TZ4MHT
         k03E50MlmKZDZ81fD08DpptyeQybarZg8UYx/IEhe64j+b9ZoGtVvBhTCq4FfzuGb1gx
         qchOtL9VZLVgfGW/6gwfT9c2YEZdOGd63YSYH9JwPtBxtvIL8CkFAJ54uJ+2c+SVzVq7
         PPRiKs1o+0aEPhf3k4IjVKgYKeF9ekS4wD+fIknRN5VD//CnWxkOILAc8UtlpTNZ0ymB
         2CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779122985; x=1779727785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Apv+qMKbA7fz7/8la2yYzKpT8LQKv7OimyMDcCXInk=;
        b=XKE9iBYLgCPBBNWJ8JBAHA37rPkiD4vqUWa/VB4rHePaGSKgnm4KM79IG3/z+S1mPB
         68i8GCnfOzwPZLrd0FDSQqh2CpD19MjXGI5Qu5sz60FbPEsfYRQjUjx92iuNMFkUCeom
         DkaTB8RVQbii5vZaircpeGff26OPqT77K2yfUJ+Tnxb0j85kurIOyks5IhXTXLtgoqru
         huRB7eNP5+ipcDhvWahZjXfW28YKT9xGj5rxhEI09npRpFw7ex60MVBCrRTTN+vV/0L2
         Kp10t5XjD+mbgH23zpppMHM+J5THpqzPNDzz17F8Nj6rr0HStbCGbnMQ45X2hEr03r1a
         mXCQ==
X-Gm-Message-State: AOJu0Yz3XidFHLwVkSED/zSQvi01U6q+rydyjSeHIU9+CgqZ8XwVQUdI
	gOFBWMelpSRvrXM4Er8Y6NNROw9MDwCn/r738nqqMMUZICZZZrMRtP0++I3C7feHX/3CgahwKcw
	bne7AP5JakRtSQTMohVKlXGv0U+A8ta4=
X-Gm-Gg: Acq92OG/vraX2soY3FJlrnP49QP58E/UP8BAFJaHcw5Tn/Sn0i5zYJAPtBc7+ERaNE9
	Qp+Nn0xTF93mBQdgftdpFbB9Rqhr3QEGZgHcRhziOunS8QzCbRBDxa84Wp+GWUiDi2msmoy292F
	4eOFX9WFM3wnWDh7CzY50/tZDcUijQITLwZWgAm2cDCMSnpuLHGabGJEV60ofhwCxvvO7IlwZPv
	1rcGpC9lqJNIAL5+lrK3Tdh7IgX6HqY7bHntQnGIPylu/e0eI9LRobz4Jm6XVAWcsCvPemWZ96t
	3WNX
X-Received: by 2002:a2e:a995:0:b0:393:7ac9:2d8a with SMTP id
 38308e7fff4ca-39561c05799mr48855741fa.2.1779122984661; Mon, 18 May 2026
 09:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778605274.git.mykola_kvach@epam.com> <2268857aa7eef95444169564c17f7e9a6f59b1c5.1778605274.git.mykola_kvach@epam.com>
 <8bdaa98b-94cb-43a7-a02d-d2ec1e899fb9@gmail.com>
In-Reply-To: <8bdaa98b-94cb-43a7-a02d-d2ec1e899fb9@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 19:49:33 +0300
X-Gm-Features: AVHnY4IYJOC8Bgg9Ct-BK3EGHlPnRUZKmBydfbolZI9I0alg-kxqmjx27zl3lWQ
Message-ID: <CAGeoDV9FU7kgm4eMZcOaxmEAkA6SnSimB5G_ux=Uh1Va7bmVJA@mail.gmail.com>
Subject: Re: [PATCH v9 13/13] xen/arm: Add host system suspend backend
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1779122985-20563C48-885141D0/0/0
X-purgate-type: clean
X-purgate-size: 11451
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:olekstysh@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,xilinx.com:email,epam.com:email,aggios.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2DF2357132D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oleksandr,

Thank you for the review.

On Sun, May 17, 2026 at 4:00=E2=80=AFPM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
>
>
> On 5/12/26 20:07, Mykola Kvach wrote:
>
> Hello Mykola
>
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > Add the Xen-wide suspend/resume backend used after a control-domain
> > vPSCI SYSTEM_SUSPEND request has been accepted. The vPSCI policy,
> > runtime driver blockers and control-domain sequencing checks are handle=
d
> > by the preceding commit; this change adds the code that actually drives
> > the host suspend attempt.
> >
> > The backend runs from a tasklet scheduled on pCPU0, because non-boot CP=
Us
> > are disabled during suspend. It freezes domains, disables the scheduler
> > and then disables non-boot CPUs.
> >
> > Host-side suspend participants are handled in phases. IOMMU and console
> > state are suspended first. Local IRQs are then disabled before suspendi=
ng
> > timer and GIC state. On resume or failure, the completed suspend phases
> > are unwound in reverse: GIC and timer state are restored while IRQs are
> > still disabled, local IRQs are restored, and then console and IOMMU sta=
te
> > are restored.
> >
> > On boot, init_ttbr is normally initialized during secondary CPU hotplug=
.
> > On uniprocessor systems this can leave init_ttbr uninitialized, so set =
it
> > from the boot CPU before entering suspend.
> >
> > Note: the code is behind CONFIG_HAS_SYSTEM_SUSPEND, which is currently
> > only selected when UNSUPPORTED is set and MPU is not set.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
>
> Patch looks good to me, just one question to clarify ...
>
>
> > ---
> > Changes in V9:
> > - Split vPSCI availability policy, runtime host-suspend blockers and th=
e
> >    domain-readiness precheck into the preceding commit.
> > - Trigger the host suspend backend from the control-domain SYSTEM_SUSPE=
ND
> >    path.
> > - Reorder the host suspend/resume phases so the timer is suspended with
> >    local IRQs disabled and local IRQs are restored after the GIC and ti=
mer
> >    resume paths, before the console and IOMMU resume paths.
> > - Move HAS_HWDOM_SYSTEM_SUSPEND and related logic to policy patch.
> >
> > Changes in V8:
> > - Add a pre-suspend check in system_suspend() after scheduler_disable()=
 to
> >    require all domains to be in the shut down state with SHUTDOWN_suspe=
nd
> >    before proceeding with the global suspend flow.
> > - Drop the common-level depends on !ARM_64 || !SYSTEM_SUSPEND from
> >    CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND and model the ARM64 suspend cas=
e
> >    with an arch-selected capability instead.
> > - Rename CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND to
> >    CONFIG_HAS_HWDOM_SYSTEM_SUSPEND.
> > - Rename need_hwdom_shutdown() to want_hwdom_shutdown().
> >
> > Changes in V7:
> > - Control domain is responsible for host suspend.
> > - Add an empty inline host_system_suspend() function when SYSTEM_SUSPEN=
D
> >    config is disabled.
> > - Use IS_ENABLED() for config checking instead of #ifdef.
> > - Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simpl=
ify
> >    control flow.
> > - Factor hardware domain shutdown condition into a helper
> >    (need_hwdom_shutdown()) to avoid preprocessor directives inside the
> >    function.
> > - Squash with iommu suspend/resume commit.
> > ---
> >   xen/arch/arm/Kconfig               |   1 +
> >   xen/arch/arm/include/asm/mm.h      |   2 +
> >   xen/arch/arm/include/asm/suspend.h |   2 +
> >   xen/arch/arm/mmu/smpboot.c         |   2 +-
> >   xen/arch/arm/suspend.c             | 140 ++++++++++++++++++++++++++++=
+
> >   xen/arch/arm/vpsci.c               |  10 ++-
> >   6 files changed, 154 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index 54a5bfb9ae..119bc00674 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -9,6 +9,7 @@ config ARM_64
> >       select 64BIT
> >       select HAS_DOMAIN_TYPE
> >       select HAS_FAST_MULTIPLY
> > +     select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
> >       select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
> >
> >   config ARM
> > diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/m=
m.h
> > index 2eb8465aa9..de119cad3a 100644
> > --- a/xen/arch/arm/include/asm/mm.h
> > +++ b/xen/arch/arm/include/asm/mm.h
> > @@ -360,6 +360,8 @@ static inline void page_set_xenheap_gfn(struct page=
_info *p, gfn_t gfn)
> >       } while ( (y =3D cmpxchg(&p->u.inuse.type_info, x, nx)) !=3D x );
> >   }
> >
> > +void set_init_ttbr(lpae_t *root);
> > +
> >   #endif /*  __ARCH_ARM_MM__ */
> >   /*
> >    * Local variables:
> > diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/=
asm/suspend.h
> > index 87db12eac3..a194dbb21a 100644
> > --- a/xen/arch/arm/include/asm/suspend.h
> > +++ b/xen/arch/arm/include/asm/suspend.h
> > @@ -40,11 +40,13 @@ int prepare_resume_ctx(void);
> >   void hyp_resume(void);
> >   bool host_system_suspend_allowed(void);
> >   void host_system_suspend_disable(const char *reason);
> > +void host_system_suspend(struct domain *d);
> >
> >   #else /* !CONFIG_SYSTEM_SUSPEND */
> >
> >   static inline bool host_system_suspend_allowed(void) { return false; =
}
> >   static inline void host_system_suspend_disable(const char *reason) {}
> > +static inline void host_system_suspend(struct domain *d) {}
> >
> >   #endif
> >
> > diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
> > index 37e91d72b7..ff508ecf40 100644
> > --- a/xen/arch/arm/mmu/smpboot.c
> > +++ b/xen/arch/arm/mmu/smpboot.c
> > @@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
> >       clear_table(boot_third);
> >   }
> >
> > -static void set_init_ttbr(lpae_t *root)
> > +void set_init_ttbr(lpae_t *root)
> >   {
> >       /*
> >        * init_ttbr is part of the identity mapping which is read-only. =
So
> > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > index a571035d2c..b1cc67fbdb 100644
> > --- a/xen/arch/arm/suspend.c
> > +++ b/xen/arch/arm/suspend.c
> > @@ -1,10 +1,16 @@
> >   /* SPDX-License-Identifier: GPL-2.0-only */
> >
> > +#include <asm/gic.h>
> >   #include <asm/psci.h>
> >   #include <asm/suspend.h>
> >
> > +#include <xen/console.h>
> > +#include <xen/cpu.h>
> > +#include <xen/iommu.h>
> >   #include <xen/lib.h>
> > +#include <xen/sched.h>
> >   #include <xen/serial.h>
> > +#include <xen/tasklet.h>
> >
> >   struct resume_cpu_context resume_cpu_context;
> >
> > @@ -44,6 +50,140 @@ void host_system_suspend_disable(const char *reason=
)
> >              reason ? reason : "unsupported suspend/resume path");
> >   }
> >
> > +/* Xen suspend. data identifies the domain that initiated suspend. */
> > +static void system_suspend(void *data)
> > +{
> > +    int status;
> > +    unsigned long flags;
> > +    struct domain *d =3D (struct domain *)data;
> > +
> > +    BUG_ON(system_state !=3D SYS_STATE_active);
> > +
> > +    system_state =3D SYS_STATE_suspend;
> > +
> > +    printk("Xen suspending...\n");
> > +
> > +    freeze_domains();
> > +    scheduler_disable();
> > +
> > +    /*
> > +     * Non-boot CPUs have to be disabled on suspend and enabled on res=
ume
> > +     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to=
 PSCI
> > +     * CPU_OFF to be called by each non-boot CPU. Depending on the und=
erlying
> > +     * platform capabilities, this may lead to the physical powering d=
own of
> > +     * CPUs.
> > +     */
> > +    status =3D disable_nonboot_cpus();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_nonboot_cpus;
> > +    }
> > +
> > +    console_start_sync();
> > +    status =3D iommu_suspend();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_end_sync;
> > +    }
> > +
> > +    status =3D console_suspend();
> > +    if ( status )
> > +    {
> > +        dprintk(XENLOG_ERR, "Failed to suspend the console, err=3D%d\n=
", status);
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_iommu;
> > +    }
> > +
> > +    local_irq_save(flags);
> > +
> > +    time_suspend();
> > +
> > +    status =3D gic_suspend();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_time;
> > +    }
> > +
> > +    set_init_ttbr(xen_pgtable);
> > +
> > +    /*
> > +     * Enable identity mapping before entering suspend to simplify
> > +     * the resume path
> > +     */
> > +    update_boot_mapping(true);
> > +
> > +    if ( prepare_resume_ctx() )
> > +    {
> > +        status =3D call_psci_system_suspend();
> > +        /*
> > +         * If suspend is finalized properly by above system suspend PS=
CI call,
> > +         * the code below in this 'if' branch will never execute. Exec=
ution
> > +         * will continue from hyp_resume which is the hypervisor's res=
ume point.
> > +         * In hyp_resume CPU context will be restored and since link-r=
egister is
> > +         * restored as well, it will appear to return from prepare_res=
ume_ctx.
> > +         * The difference in returning from prepare_resume_ctx on syst=
em suspend
> > +         * versus resume is in function's return value: on suspend, th=
e return
> > +         * value is a non-zero value, on resume it is zero. That is wh=
y the
> > +         * control flow will not re-enter this 'if' branch on resume.
> > +         */
> > +        if ( status )
> > +            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=
=3D%d\n",
> > +                    status);
> > +    }
>
>
>
> ... unless I am mistaken, the boot CPU appears to bypass errata checks
> on resume.
>
> Non-boot (secondary) CPUs: before suspending, Xen calls
> disable_nonboot_cpus(). Upon resume, it calls enable_nonboot_cpus(),
> which utilizes the standard secondary CPU bring-up path. Secondary CPUs
> boot through init_secondary() -> start_secondary(), where Xen explicitly
> calls functions such as check_local_cpu_errata(), etc. So, secondary
> CPUs are fine.
>
> Boot CPU: when CPU0 wakes up from SYSTEM_SUSPEND, it enters
> hyp_resume(), calls cpu_init(), and branches directly back into the
> middle of system_suspend(), where it resumes the GIC, timer, IOMMU, etc.
> At no point in hyp_resume() or system_suspend() does CPU0 call
> check_local_cpu_errata().
>
> Could you, please, clarify why this is OK?

Good catch, thanks.

I agree there is a gap here. Secondary CPUs go through the normal
secondary bring-up path after resume, so they run the local CPU
errata/workaround handling again. The boot CPU, however, resumes through
hyp_resume() and returns directly to the suspend path.

I will rework this so that the boot CPU also re-applies the relevant
local CPU errata/workaround handling after SYSTEM_SUSPEND, before
continuing with the rest of the resume sequence.

Best regards,
Mykola

