Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id l63jJf/SCWqcrQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2026 16:38:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE611561B66
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2026 16:38:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311264.1581473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOccw-0002L5-Ov; Sun, 17 May 2026 14:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311264.1581473; Sun, 17 May 2026 14:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOccw-0002IA-LL; Sun, 17 May 2026 14:37:58 +0000
Received: by outflank-mailman (input) for mailman id 1311264;
 Sun, 17 May 2026 14:37:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wOccu-0002I4-NE
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 14:37:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOccu-000GCH-3f
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 16:37:56 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a09d2a1-bab6-0a2a0a5309dd-0a2a4508989e-18
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 16:37:56 +0200
Received: from [209.85.167.53] (helo=mail-lf1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a09d2c3-63b5-0a2a45080019-d155a735f1f2-3
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 16:37:56 +0200
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5a858881ad2so1982681e87.3
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 07:37:55 -0700 (PDT)
Received: from [192.168.0.112] ([91.123.151.42])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a9164c545asm2785955e87.56.2026.05.17.07.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2026 07:37:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779028675; x=1779633475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B2qZzNxLP+Tnd+foSJp3M3NluVXFtAaQkvXV2G7SrzI=;
        b=dNEP/pyp42TKfQeSxz4f5EjiaAnItpsoEwSUX556APd6Yx+Rn8PPKwUKxOnUHFHtls
         vpF6/a+g15oEV7a07gXHbbvo6N9OLpTBfawU4Okgo6mHZdwdIonZ350CNHeHvSeQqmWS
         Z62mxHsYIkSk2jaNpc5OdppCKBePv+8Achus5dyT2Nh2Dm0SajyJyaicI4IF7I9m9ivE
         cfRXfp0xDDMp0gboVYANCDVmKlIoVLBCLJhhAgrzaR2k90DN0kAeMteaVWRHHMMRNgMc
         oROy7Hyb+X0yPoRbS7/7QoN0dzeLTQIxnBV5aN+12D4mAZ4+6bNXGz7ye5JrX9joIXhu
         1w2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779028675; x=1779633475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2qZzNxLP+Tnd+foSJp3M3NluVXFtAaQkvXV2G7SrzI=;
        b=pGvYr7rJPXBp28BXCpCNq/XcMCwUnugQcst6EWzO/fp8Yd6eBiAgfgCh1zzgMT/O24
         /GnwFGhEfJ1PFte1gmODSPHQ34xGAFiR00juABOiaYI8h8S8LwuzT7wI7mPN3BgRw9Df
         Y0ojYZVU/cVDnn311jQXCAAUgiC3DifypBRnXq/RJ66abqIEALqw/Thrj/0P5p9h6L7m
         4tk1mMWJcGjO/POOxq3MZp8GgelMRRSoNQuuUpadsygxeFTd6Q69OfxD4W4ExLCHJnb+
         xTG7rSZunLbXFdDZJ+ByUjiPGILBkJW2E3caQVYmEQ+7+CyvSzNAqHAMbebW/DglLgGm
         /gUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HzX/3qiWeximga7P0D5aD33jEH2OOomK2Jl/bqRGYrg8sGV3AHO5SNsHyilql26BGMKO0h9B5DTU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuOPq2H+NXYs/WpQY3yCviQuG9Pb2Awetr+TyNXoACqW8qu+oX
	zzIi9k5+mhM1nL6int6JDB0Nr/eFfcarL9itpIzoPXGbrIFd6ZBluHze
X-Gm-Gg: Acq92OFUYST0HYi26VN3jFfLRMm3OAHKVBRsMszAihgdZ6bqnyFwTo3J7ydHRDV9kn5
	kxHQbNbysoee0q8Bkv72FRk2/mjEziZL0R4q192haE7a4xfekZSGKEYqnpcr3T1fcy8hcYcjaTu
	KBNRal3FJoxWRZ8Q2TAnxq1Z5cSx2oKNFQN0LpCfCthbBucKEccbNGb6pvSB28JIpUMyxnOaSQF
	Q5X3jSTx/sTzNe0tlf0YMIuzr7XQVwBKffGRLroqWDPjP5mE5wgeFW2QuG6LYNSIKm22nAwggTf
	xRETKlFPsojzhNuhtRGytFLaUsUBviCbdnmtDp+NWChubHGRd28RSkGeW7OQ6oQd05rmh0zX+Gy
	ikNTykINjbjNSY4UapM7PDJduwUyq0NsjoJbZTJwrNvtxdFJapYEefqFzHXtYkvqxoDM/JArokS
	O/1O3uUPkT2BCYTex4q8uXvJY1jaKQWQ9B9wbP
X-Received: by 2002:a05:6512:2397:b0:5a8:f6fd:f48d with SMTP id 2adb3069b0e04-5aa0e740902mr3060538e87.40.1779028674783;
        Sun, 17 May 2026 07:37:54 -0700 (PDT)
Message-ID: <c8d0e466-d5e3-4791-9dfe-6221ba219abb@gmail.com>
Date: Sun, 17 May 2026 17:37:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <06448a30ef6694a55ac85d4c8c78ca2d71342430.1778605274.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <06448a30ef6694a55ac85d4c8c78ca2d71342430.1778605274.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1779028676-B5F6ADB1-14C3213E/0/0
X-purgate-type: clean
X-purgate-size: 19353
X-Rspamd-Queue-Id: BE611561B66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:rahul.singh@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.929];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/12/26 20:07, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>


Hello Mykola

> 
> Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
> capability for platforms where the hardware domain can be parked with
> SHUTDOWN_suspend without calling hwdom_shutdown().
> 
> Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
> non-control domains, including the hardware domain when it is not acting as a
> control domain, the call is handled as a guest/domain suspend request and
> parks the domain in SHUTDOWN_suspend.
> 
> Control domains need additional sequencing because their SYSTEM_SUSPEND
> request is used to coordinate host-wide suspend. A non-last awake control
> domain may be parked in SHUTDOWN_suspend without requiring the host suspend
> path to be available. The last awake control domain is treated as the point
> where the request becomes a host-suspend request, and it may only proceed
> when all non-control domains are already in SHUTDOWN_suspend and the host
> suspend path is available.
> 
> Keep the control-domain sequencing and domain-readiness checks out of
> PSCI_FEATURES. They are per-attempt runtime conditions rather than stable PSCI
> function availability. Advertise SYSTEM_SUSPEND as implemented by vPSCI and
> enforce the sequencing policy in the call handler.
> 
> Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND so
> that SHUTDOWN_suspend from the hardware domain can be treated as a domain
> suspend state rather than as a hardware-domain initiated host shutdown. This
> does not by itself imply that host-wide suspend is available.
> 
> Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPEND
> capability with runtime blockers reported by Xen-owned subsystems. Add
> runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ paths
> lacking suspend/resume support. These blockers are runtime based, so they
> only apply to drivers or paths that Xen actually uses on the platform. For
> SMMUv3, the blocker applies only when Xen actually uses the MSI IRQ path,
> since resume does not restore the SMMU *_IRQ_CFGn MSI registers yet.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Apart from Jan's and Luca's findings, patch looks good to me. Just a few 
questions to clarify, apologies if these have already been discussed 
elsewhere.

> ---
>   xen/arch/arm/Kconfig                  |   1 +
>   xen/arch/arm/gic.c                    |   6 ++
>   xen/arch/arm/include/asm/psci.h       |   3 +
>   xen/arch/arm/include/asm/suspend.h    |  10 ++-
>   xen/arch/arm/psci.c                   |   7 ++
>   xen/arch/arm/suspend.c                |  40 +++++++++
>   xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++++---
>   xen/common/Kconfig                    |   3 +
>   xen/common/domain.c                   |   7 +-
>   xen/drivers/char/serial.c             |  12 +++
>   xen/drivers/passthrough/arm/iommu.c   |   4 +
>   xen/drivers/passthrough/arm/smmu-v3.c |   4 +
>   xen/include/xen/serial.h              |   1 +
>   xen/include/xen/suspend.h             |   2 +
>   14 files changed, 201 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 79622b46a1..54a5bfb9ae 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,6 +19,7 @@ config ARM
>   	select HAS_ALTERNATIVE if HAS_VMAP
>   	select HAS_DEVICE_TREE_DISCOVERY
>   	select HAS_DOM0LESS
> +	select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
>   	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>   	select HAS_STACK_PROTECTOR
>   	select HAS_UBSAN
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 7727ffed5a..a5efcaeb4c 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -26,6 +26,7 @@
>   #include <asm/device.h>
>   #include <asm/io.h>
>   #include <asm/gic.h>
> +#include <asm/suspend.h>
>   #include <asm/vgic.h>
>   #include <asm/acpi.h>
>   
> @@ -44,6 +45,11 @@ static void __init __maybe_unused build_assertions(void)
>   void register_gic_ops(const struct gic_hw_operations *ops)
>   {
>       gic_hw_ops = ops;
> +
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( !ops->suspend || !ops->resume )
> +        host_system_suspend_disable("GIC driver lacks suspend/resume support");
> +#endif
>   }
>   
>   static void clear_cpu_lr_mask(void)
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
> index bb3c73496e..142fa1bfe5 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -24,6 +24,9 @@ void call_psci_cpu_off(void);
>   void call_psci_system_off(void);
>   void call_psci_system_reset(void);
>   int call_psci_system_suspend(void);
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +bool psci_system_suspend_allowed(void);
> +#endif
>   
>   /* Range of allocated PSCI function numbers */
>   #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
> index 2d9fc331fc..87db12eac3 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -38,7 +38,15 @@ extern struct resume_cpu_context resume_cpu_context;
>   
>   int prepare_resume_ctx(void);
>   void hyp_resume(void);
> -#endif /* CONFIG_SYSTEM_SUSPEND */
> +bool host_system_suspend_allowed(void);
> +void host_system_suspend_disable(const char *reason);
> +
> +#else /* !CONFIG_SYSTEM_SUSPEND */
> +
> +static inline bool host_system_suspend_allowed(void) { return false; }
> +static inline void host_system_suspend_disable(const char *reason) {}
> +
> +#endif
>   
>   #endif /* ARM_SUSPEND_H */
>   
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index e05dae1133..e9d78668fd 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -41,6 +41,13 @@ static bool __ro_after_init has_psci_system_suspend;
>   
>   #define PSCI_RET(res)   ((int32_t)(res).a0)
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +bool psci_system_suspend_allowed(void)
> +{
> +    return has_psci_system_suspend;
> +}
> +#endif
> +
>   int call_psci_cpu_on(int cpu)
>   {
>       struct arm_smccc_res res;
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index 6ea4a0f9cc..a571035d2c 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -1,9 +1,49 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
> +#include <asm/psci.h>
>   #include <asm/suspend.h>
>   
> +#include <xen/lib.h>
> +#include <xen/serial.h>
> +
>   struct resume_cpu_context resume_cpu_context;
>   
> +/*
> + * Non-PSCI infrastructure can make host suspend impossible even when the PSCI
> + * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has no valid
> + * suspend/resume path.
> + *
> + * This gate is checked only when the last awake control domain attempts to
> + * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
> + */
> +static bool host_system_suspend_runtime_allowed = true;
> +
> +static bool host_serial_suspend_allowed(void)
> +{
> +    if ( serial_suspend_supported() )
> +        return true;
> +
> +    printk_once(XENLOG_INFO
> +                "Host SYSTEM_SUSPEND blocked: serial driver lacks suspend/resume support\n");
> +
> +    return false;
> +}
> +
> +bool host_system_suspend_allowed(void)
> +{
> +    return psci_system_suspend_allowed() &&
> +           host_serial_suspend_allowed() &&
> +           host_system_suspend_runtime_allowed;
> +}
> +
> +void host_system_suspend_disable(const char *reason)
> +{
> +    host_system_suspend_runtime_allowed = false;
> +
> +    printk(XENLOG_INFO "Host SYSTEM_SUSPEND blocked: %s\n",
> +           reason ? reason : "unsupported suspend/resume path");
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index ac6af6118f..48a963ae3e 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -5,6 +5,7 @@
>   
>   #include <asm/current.h>
>   #include <asm/domain.h>
> +#include <asm/suspend.h>
>   #include <asm/vgic.h>
>   #include <asm/vpsci.h>
>   #include <asm/event.h>
> @@ -219,6 +220,89 @@ static void do_psci_0_2_system_reset(void)
>       domain_shutdown(d,SHUTDOWN_reboot);
>   }
>   
> +/*
> + * Serialise SYSTEM_SUSPEND policy decisions with the domain suspend transition,
> + * so multiple control domains cannot all observe each other as still awake.
> + */
> +static DEFINE_SPINLOCK(vpsci_system_suspend_lock);
> +
> +static bool domain_in_suspend_state(struct domain *d)
> +{
> +    bool suspended;
> +
> +    spin_lock(&d->shutdown_lock);
> +    suspended = d->is_shut_down && d->shutdown_code == SHUTDOWN_suspend;
> +    spin_unlock(&d->shutdown_lock);
> +
> +    return suspended;
> +}
> +
> +static int32_t domain_psci_system_suspend_policy(struct domain *d)
> +{
> +    struct domain *other;
> +    bool last_awake_control_domain = true;
> +    bool awake_non_control_domain = false;
> +
> +    /* Only control domains participate in sequencing policy. */
> +    if ( !is_control_domain(d) )
> +        return 0;
> +
> +    rcu_read_lock(&domlist_read_lock);
> +
> +    for_each_domain ( other )
> +    {
> +        bool suspended;
> +
> +        if ( other == d )
> +            continue;
> +
> +        suspended = domain_in_suspend_state(other);
> +        if ( suspended )
> +            continue;
> +
> +        if ( is_control_domain(other) )
> +        {
> +            last_awake_control_domain = false;
> +            break;
> +        }
> +
> +        awake_non_control_domain = true;
> +    }
> +
> +    rcu_read_unlock(&domlist_read_lock);
> +
> +    /*
> +     * Another control domain is still awake. This request is only the first
> +     * phase of the sequencing: park this control domain and leave the host
> +     * running. Host-wide suspend gates must not block this intermediate state.
> +     */
> +    if ( !last_awake_control_domain )
> +        return 0;
> +
> +    /*
> +     * This is the last awake control domain. It must not be parked unless the
> +     * request can proceed as a host-suspend request; otherwise Xen would lose
> +     * the last domain that can coordinate the system suspend.
> +     */
> +    if ( awake_non_control_domain )
> +    {
> +        printk(XENLOG_DEBUG
> +               "SYSTEM_SUSPEND denied: last awake control domain dom%u requested host suspend while non-control domains are still awake\n",
> +               d->domain_id);
> +        return PSCI_DENIED;
> +    }
> +
> +    /*
> +     * Host-wide gates are relevant only for the last-control-domain case. They
> +     * must not block parking of a non-last control domain, but they must reject
> +     * the last control domain when host suspend is not available.
> +     */
> +    if ( !host_system_suspend_allowed() )
> +        return PSCI_NOT_SUPPORTED;

In do_psci_1_0_features(), the guest is told that SYSTEM_SUSPEND is 
implemented:

case PSCI_1_0_FN64_SYSTEM_SUSPEND:
     return 0;  /* "This function IS implemented" */

However, when the guest actually calls SYSTEM_SUSPEND, the policy check 
above can reject it by return PSCI_NOT_SUPPORTED; /* "This function is 
NOT implemented" */

These two responses are contradictory. The guest probes via 
PSCI_FEATURES, is told suspend is available, and then gets 
PSCI_NOT_SUPPORTED when it attempts to use it (if let's say the SMMUv3 
driver has blocked suspend).

 From Arm Power State Coordination Interface (DEN0022F.b):

5.3.2 Implementation responsibilities
... Any function that is not implemented must return NOT_SUPPORTED in 
accordance with the SMC Calling Conventions [4]. In addition, 
PSCI_FEATURES must also return NOT_SUPPORTED for any non-implemented 
function...

My questing is should do_psci_1_0_features() consult the same policy so 
that the feature is only advertised when it can actually be used?

Or am I missing something here?

> +
> +    return 0;
> +}
> +
>   static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>   {
>       int32_t rc;
> @@ -232,10 +316,6 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>       if ( is_64bit_domain(d) && is_thumb )
>           return PSCI_INVALID_ADDRESS;
>   
> -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> -    if ( is_hardware_domain(d) )
> -        return PSCI_NOT_SUPPORTED;
> -
>       /* Ensure that all CPUs other than the calling one are offline */
>       domain_lock(d);
>       for_each_vcpu ( d, v )
> @@ -252,16 +332,29 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>       if ( rc )
>           return PSCI_DENIED;
>   
> -    rc = domain_shutdown(d, SHUTDOWN_suspend);
> +    spin_lock(&vpsci_system_suspend_lock);
> +
> +    rc = domain_psci_system_suspend_policy(d);
> +    if ( !rc )
> +    {
> +        rc = domain_shutdown(d, SHUTDOWN_suspend);
> +        if ( rc )
> +            rc = PSCI_DENIED;
> +        else
> +        {
> +            rctx->ctxt = ctxt;
> +            rctx->wake_cpu = current;
> +        }
> +    }
> +
> +    spin_unlock(&vpsci_system_suspend_lock);
> +
>       if ( rc )
>       {
>           free_vcpu_guest_context(ctxt);
> -        return PSCI_DENIED;
> +        return rc;
>       }
>   
> -    rctx->ctxt = ctxt;
> -    rctx->wake_cpu = current;
> -
>       gprintk(XENLOG_DEBUG,
>               "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
>               epoint, cid);
> @@ -287,10 +380,9 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>       case PSCI_0_2_FN32_SYSTEM_RESET:
>       case PSCI_1_0_FN32_PSCI_FEATURES:
>       case ARM_SMCCC_VERSION_FID:
> -        return 0;
>       case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>       case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> -        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTED : 0;
> +        return 0;
>       default:
>           return PSCI_NOT_SUPPORTED;
>       }
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 5ff71480ee..816a1a4ecb 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -140,6 +140,9 @@ config HAS_EX_TABLE
>   config HAS_FAST_MULTIPLY
>   	bool
>   
> +config HAS_HWDOM_SYSTEM_SUSPEND
> +	bool
> +
>   config HAS_IOPORTS
>   	bool
>   
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index bb9e210c28..d3edfb2a13 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1375,6 +1375,11 @@ void __domain_crash(struct domain *d)
>       domain_shutdown(d, SHUTDOWN_crash);
>   }
>   
> +static inline bool want_hwdom_shutdown(uint8_t reason)
> +{
> +    return !IS_ENABLED(CONFIG_HAS_HWDOM_SYSTEM_SUSPEND) ||
> +           reason != SHUTDOWN_suspend;
> +}
>   
>   int domain_shutdown(struct domain *d, u8 reason)
>   {
> @@ -1391,7 +1396,7 @@ int domain_shutdown(struct domain *d, u8 reason)
>           d->shutdown_code = reason;
>       reason = d->shutdown_code;
>   
> -    if ( is_hardware_domain(d) )
> +    if ( is_hardware_domain(d) && want_hwdom_shutdown(reason) )
>           hwdom_shutdown(reason);
>   
>       if ( d->is_shutting_down )
> diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
> index adb312d796..cc2b5b5dee 100644
> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -497,6 +497,8 @@ const struct vuart_info *serial_vuart_info(int idx)
>   
>   #ifdef CONFIG_SYSTEM_SUSPEND
>   
> +static bool __read_mostly serial_suspend_available = true;
> +
>   void serial_suspend(void)
>   {
>       int i;
> @@ -513,6 +515,11 @@ void serial_resume(void)
>               com[i].driver->resume(&com[i]);
>   }
>   
> +bool serial_suspend_supported(void)
> +{
> +    return serial_suspend_available;
> +}
> +
>   #endif /* CONFIG_SYSTEM_SUSPEND */
>   
>   void __init serial_register_uart(int idx, struct uart_driver *driver,
> @@ -521,6 +528,11 @@ void __init serial_register_uart(int idx, struct uart_driver *driver,
>       /* Store UART-specific info. */
>       com[idx].driver = driver;
>       com[idx].uart   = uart;
> +
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( !driver->suspend || !driver->resume )
> +        serial_suspend_available = false;


I wonder why different suspend-blocker API are used for serial vs other 
subsystems (GIC, IOMMU). Why serial_register_uart() could not simply 
call host_system_suspend_disable() like every other subsystem?

This would avoid adding three unnecessary symbols 
(serial_suspend_available, serial_suspend_supported(), 
host_serial_suspend_allowed()).

Or am I missing something here?


> +#endif
>   }
>   
>   void __init serial_async_transmit(struct serial_port *port)
> diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/arm/iommu.c
> index 100545e23f..420b9fbdf0 100644
> --- a/xen/drivers/passthrough/arm/iommu.c
> +++ b/xen/drivers/passthrough/arm/iommu.c
> @@ -19,6 +19,7 @@
>   #include <xen/device_tree.h>
>   #include <xen/iommu.h>
>   #include <xen/lib.h>
> +#include <xen/suspend.h>
>   
>   #include <asm/device.h>
>   
> @@ -46,6 +47,9 @@ void __init iommu_set_ops(const struct iommu_ops *ops)
>       }
>   
>       iommu_ops = ops;
> +
> +    if ( !ops->suspend || !ops->resume )
> +        host_system_suspend_disable("IOMMU driver lacks suspend/resume support");
>   }
>   
>   int __init iommu_hardware_setup(void)
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 82c8ead979..443dd0e893 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -91,6 +91,7 @@
>   #include <asm/io.h>
>   #include <asm/iommu_fwspec.h>
>   #include <asm/platform.h>
> +#include <asm/suspend.h>
>   
>   #include "smmu-v3.h"
>   
> @@ -1903,6 +1904,9 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
>   		}
>   	}
>   
> +	host_system_suspend_disable(
> +		"SMMUv3 MSI IRQ path is unsupported for host suspend");
> +
>   	/* Add callback to free MSIs on teardown */
>   	devm_add_action(dev, arm_smmu_free_msis, dev);
>   }
> diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
> index 8e18445552..418b00ead0 100644
> --- a/xen/include/xen/serial.h
> +++ b/xen/include/xen/serial.h
> @@ -137,6 +137,7 @@ const struct vuart_info* serial_vuart_info(int idx);
>   /* Serial suspend/resume. */
>   void serial_suspend(void);
>   void serial_resume(void);
> +bool serial_suspend_supported(void);
>   #endif
>   
>   /*
> diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
> index 6f94fd53b0..a941331035 100644
> --- a/xen/include/xen/suspend.h
> +++ b/xen/include/xen/suspend.h
> @@ -6,6 +6,8 @@
>   #if __has_include(<asm/suspend.h>)
>   #include <asm/suspend.h>
>   #else
> +struct domain;
> +
>   static inline void arch_domain_resume(struct domain *d) {}
>   #endif
>   


