Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIxvIzO8CWrlnAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2026 15:01:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E245610E5
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2026 15:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311222.1581463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOb6X-000720-7g; Sun, 17 May 2026 13:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311222.1581463; Sun, 17 May 2026 13:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOb6X-0006z9-0p; Sun, 17 May 2026 13:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1311222;
 Sun, 17 May 2026 13:00:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wOb6V-0006z0-Vb
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 13:00:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOb6V-00BKXm-Bc
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 15:00:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a09bbd8-5cb7-0a2a0a5109dd-0a2a4505aea0-18
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 15:00:23 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a09bbe6-aaa8-0a2a45050019-d155d0b6c502-3
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 15:00:23 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-38eab6cf7d8so11762661fa.1
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 06:00:23 -0700 (PDT)
Received: from [192.168.0.112] ([91.123.151.42])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3958874ec22sm5047071fa.21.2026.05.17.06.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2026 06:00:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779022822; x=1779627622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mm5+sl8QgNMDwez/WMGZOAiAUDAKsHA86ip9lSVzkYQ=;
        b=Em89X7XRL8WbrVGdiew352sSM8KTxV9MGPL8lNtMLiLL+8N1Zy8+qIdNDhUBYZRd1s
         ITCjhgMx7MIBiWlyyMkgOwjMc6djGP9J6aV43YXy6fAPsEsbgf/AhYA+QacVtljtB+CL
         16aqb9OSV2WQaNrhNdFXLW894caBWI8nCHprNkLa5BaDe7kBPWPFXKpqd9ZDESfyG6G8
         WnBUoA9PzqMUxTqREPOXjGAWwEmsKaQyx77VCq5tuukCe8lzE6viARpMkQ0LjBAe9z3G
         jCqS4oPjdRk2MfAAhPVw4WrqyhY6FghQvBlfEe6lj9VMGmKHqUon6rayduwzZhl5qRdQ
         mwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779022822; x=1779627622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mm5+sl8QgNMDwez/WMGZOAiAUDAKsHA86ip9lSVzkYQ=;
        b=dku/h3fXdNrboGNVarYIbx74uG+rnaiMbVpiAcobm67qXRg1zNlCWopoi8DRmmjngM
         r1iRN4fYi8b8gMqPjHrW32WF4jWKDu/xfeRCvgcL6oggCEag0iPoqD9Db53ahH5WbjuZ
         AaBNF6036D8giHpE32dDHglE94bxGEAr5+iKJ3YXUR/pNPYcVX/HMyF9T5v/qNGJzVt0
         BteFM56miOGz7paPpfTJCK7vs3Y2nlS31HK8D0kojZslKiwGr1jj/jbx60m9+XS3O8/R
         Cfw400cHGTKgTewunsbiQuy18MSmOKSAuPLP06IDTftwZqeHRQ8rZgavXpX6izxaOS7W
         0C3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Y9QQZdcGTkONtmDLbF6h9JY4ogbfDC2AWRcRd3O0EMvcbuUuqOjiEEW2P8cExxLXQaOuOyqXNGGk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDbPosXHS9YhHKHgGmVTcshhddUiKVeybxHONGE1FCdke+fQJy
	mWSpoXgg3u8qcLwmDiZ5WqQf6MS4iak+dXdOIlnGdxVV9hgjtBxxG3uBViGBFQ==
X-Gm-Gg: Acq92OEpn0DjehQfLU3TELVPoqZQsDB0mMXVdXd/ZVVq0/XM84b0Yb48OGJSPRKF8b5
	aLB39PxeOsYudn0ATB1mCL1jgtOEkWI/AYE/pY9BMgLSvgr7SQFK/+I/+05VL/VBwwjcsHCe+RR
	8XPUz0kp+76uhb5n4jf86zwtlTcuOBQkwIlaxoFzGPSdxYwtoml2Crng66hkaGM1qbbs9gP133q
	jm2MkLQIeEz24u8Si8BODpcvL3HUmIidxGb1b2pdvV41yqzrVjindkSy92d2LFBx3f/NIrDhyIU
	nLwjaWY/w44O6dN7JbwutmiWUZn0iFgf4lxGC3tj5/HW4vYzMkqM8J1ornJ+brIv5fqjsG+cyKv
	xdWsPuLVke5jBUS0HuPN2epESEC5A5P1Cb46BlsjQjs51uGZ3Hd++9zmCDINsdvkZjxH8jikRrP
	C9osTzs/VL26N5kgP4Ga8Np20xgWqitMwctY4S
X-Received: by 2002:a05:651c:4187:b0:38e:2183:2282 with SMTP id 38308e7fff4ca-39561f41e90mr26341271fa.23.1779022822032;
        Sun, 17 May 2026 06:00:22 -0700 (PDT)
Message-ID: <8bdaa98b-94cb-43a7-a02d-d2ec1e899fb9@gmail.com>
Date: Sun, 17 May 2026 16:00:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/13] xen/arm: Add host system suspend backend
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <2268857aa7eef95444169564c17f7e9a6f59b1c5.1778605274.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <2268857aa7eef95444169564c17f7e9a6f59b1c5.1778605274.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1779022823-D9772443-DB3BB4D0/0/0
X-purgate-type: clean
X-purgate-size: 11165
X-Rspamd-Queue-Id: E0E245610E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.917];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/12/26 20:07, Mykola Kvach wrote:

Hello Mykola

> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> Add the Xen-wide suspend/resume backend used after a control-domain
> vPSCI SYSTEM_SUSPEND request has been accepted. The vPSCI policy,
> runtime driver blockers and control-domain sequencing checks are handled
> by the preceding commit; this change adds the code that actually drives
> the host suspend attempt.
> 
> The backend runs from a tasklet scheduled on pCPU0, because non-boot CPUs
> are disabled during suspend. It freezes domains, disables the scheduler
> and then disables non-boot CPUs.
> 
> Host-side suspend participants are handled in phases. IOMMU and console
> state are suspended first. Local IRQs are then disabled before suspending
> timer and GIC state. On resume or failure, the completed suspend phases
> are unwound in reverse: GIC and timer state are restored while IRQs are
> still disabled, local IRQs are restored, and then console and IOMMU state
> are restored.
> 
> On boot, init_ttbr is normally initialized during secondary CPU hotplug.
> On uniprocessor systems this can leave init_ttbr uninitialized, so set it
> from the boot CPU before entering suspend.
> 
> Note: the code is behind CONFIG_HAS_SYSTEM_SUSPEND, which is currently
> only selected when UNSUPPORTED is set and MPU is not set.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>


Patch looks good to me, just one question to clarify ...


> ---
> Changes in V9:
> - Split vPSCI availability policy, runtime host-suspend blockers and the
>    domain-readiness precheck into the preceding commit.
> - Trigger the host suspend backend from the control-domain SYSTEM_SUSPEND
>    path.
> - Reorder the host suspend/resume phases so the timer is suspended with
>    local IRQs disabled and local IRQs are restored after the GIC and timer
>    resume paths, before the console and IOMMU resume paths.
> - Move HAS_HWDOM_SYSTEM_SUSPEND and related logic to policy patch.
> 
> Changes in V8:
> - Add a pre-suspend check in system_suspend() after scheduler_disable() to
>    require all domains to be in the shut down state with SHUTDOWN_suspend
>    before proceeding with the global suspend flow.
> - Drop the common-level depends on !ARM_64 || !SYSTEM_SUSPEND from
>    CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND and model the ARM64 suspend case
>    with an arch-selected capability instead.
> - Rename CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND to
>    CONFIG_HAS_HWDOM_SYSTEM_SUSPEND.
> - Rename need_hwdom_shutdown() to want_hwdom_shutdown().
> 
> Changes in V7:
> - Control domain is responsible for host suspend.
> - Add an empty inline host_system_suspend() function when SYSTEM_SUSPEND
>    config is disabled.
> - Use IS_ENABLED() for config checking instead of #ifdef.
> - Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simplify
>    control flow.
> - Factor hardware domain shutdown condition into a helper
>    (need_hwdom_shutdown()) to avoid preprocessor directives inside the
>    function.
> - Squash with iommu suspend/resume commit.
> ---
>   xen/arch/arm/Kconfig               |   1 +
>   xen/arch/arm/include/asm/mm.h      |   2 +
>   xen/arch/arm/include/asm/suspend.h |   2 +
>   xen/arch/arm/mmu/smpboot.c         |   2 +-
>   xen/arch/arm/suspend.c             | 140 +++++++++++++++++++++++++++++
>   xen/arch/arm/vpsci.c               |  10 ++-
>   6 files changed, 154 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 54a5bfb9ae..119bc00674 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -9,6 +9,7 @@ config ARM_64
>   	select 64BIT
>   	select HAS_DOMAIN_TYPE
>   	select HAS_FAST_MULTIPLY
> +	select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
>   	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>   
>   config ARM
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 2eb8465aa9..de119cad3a 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -360,6 +360,8 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>       } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
>   }
>   
> +void set_init_ttbr(lpae_t *root);
> +
>   #endif /*  __ARCH_ARM_MM__ */
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
> index 87db12eac3..a194dbb21a 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -40,11 +40,13 @@ int prepare_resume_ctx(void);
>   void hyp_resume(void);
>   bool host_system_suspend_allowed(void);
>   void host_system_suspend_disable(const char *reason);
> +void host_system_suspend(struct domain *d);
>   
>   #else /* !CONFIG_SYSTEM_SUSPEND */
>   
>   static inline bool host_system_suspend_allowed(void) { return false; }
>   static inline void host_system_suspend_disable(const char *reason) {}
> +static inline void host_system_suspend(struct domain *d) {}
>   
>   #endif
>   
> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
> index 37e91d72b7..ff508ecf40 100644
> --- a/xen/arch/arm/mmu/smpboot.c
> +++ b/xen/arch/arm/mmu/smpboot.c
> @@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
>       clear_table(boot_third);
>   }
>   
> -static void set_init_ttbr(lpae_t *root)
> +void set_init_ttbr(lpae_t *root)
>   {
>       /*
>        * init_ttbr is part of the identity mapping which is read-only. So
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index a571035d2c..b1cc67fbdb 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -1,10 +1,16 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
> +#include <asm/gic.h>
>   #include <asm/psci.h>
>   #include <asm/suspend.h>
>   
> +#include <xen/console.h>
> +#include <xen/cpu.h>
> +#include <xen/iommu.h>
>   #include <xen/lib.h>
> +#include <xen/sched.h>
>   #include <xen/serial.h>
> +#include <xen/tasklet.h>
>   
>   struct resume_cpu_context resume_cpu_context;
>   
> @@ -44,6 +50,140 @@ void host_system_suspend_disable(const char *reason)
>              reason ? reason : "unsupported suspend/resume path");
>   }
>   
> +/* Xen suspend. data identifies the domain that initiated suspend. */
> +static void system_suspend(void *data)
> +{
> +    int status;
> +    unsigned long flags;
> +    struct domain *d = (struct domain *)data;
> +
> +    BUG_ON(system_state != SYS_STATE_active);
> +
> +    system_state = SYS_STATE_suspend;
> +
> +    printk("Xen suspending...\n");
> +
> +    freeze_domains();
> +    scheduler_disable();
> +
> +    /*
> +     * Non-boot CPUs have to be disabled on suspend and enabled on resume
> +     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to PSCI
> +     * CPU_OFF to be called by each non-boot CPU. Depending on the underlying
> +     * platform capabilities, this may lead to the physical powering down of
> +     * CPUs.
> +     */
> +    status = disable_nonboot_cpus();
> +    if ( status )
> +    {
> +        system_state = SYS_STATE_resume;
> +        goto resume_nonboot_cpus;
> +    }
> +
> +    console_start_sync();
> +    status = iommu_suspend();
> +    if ( status )
> +    {
> +        system_state = SYS_STATE_resume;
> +        goto resume_end_sync;
> +    }
> +
> +    status = console_suspend();
> +    if ( status )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to suspend the console, err=%d\n", status);
> +        system_state = SYS_STATE_resume;
> +        goto resume_iommu;
> +    }
> +
> +    local_irq_save(flags);
> +
> +    time_suspend();
> +
> +    status = gic_suspend();
> +    if ( status )
> +    {
> +        system_state = SYS_STATE_resume;
> +        goto resume_time;
> +    }
> +
> +    set_init_ttbr(xen_pgtable);
> +
> +    /*
> +     * Enable identity mapping before entering suspend to simplify
> +     * the resume path
> +     */
> +    update_boot_mapping(true);
> +
> +    if ( prepare_resume_ctx() )
> +    {
> +        status = call_psci_system_suspend();
> +        /*
> +         * If suspend is finalized properly by above system suspend PSCI call,
> +         * the code below in this 'if' branch will never execute. Execution
> +         * will continue from hyp_resume which is the hypervisor's resume point.
> +         * In hyp_resume CPU context will be restored and since link-register is
> +         * restored as well, it will appear to return from prepare_resume_ctx.
> +         * The difference in returning from prepare_resume_ctx on system suspend
> +         * versus resume is in function's return value: on suspend, the return
> +         * value is a non-zero value, on resume it is zero. That is why the
> +         * control flow will not re-enter this 'if' branch on resume.
> +         */
> +        if ( status )
> +            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=%d\n",
> +                    status);
> +    }



... unless I am mistaken, the boot CPU appears to bypass errata checks 
on resume.

Non-boot (secondary) CPUs: before suspending, Xen calls 
disable_nonboot_cpus(). Upon resume, it calls enable_nonboot_cpus(), 
which utilizes the standard secondary CPU bring-up path. Secondary CPUs 
boot through init_secondary() -> start_secondary(), where Xen explicitly 
calls functions such as check_local_cpu_errata(), etc. So, secondary 
CPUs are fine.

Boot CPU: when CPU0 wakes up from SYSTEM_SUSPEND, it enters 
hyp_resume(), calls cpu_init(), and branches directly back into the 
middle of system_suspend(), where it resumes the GIC, timer, IOMMU, etc. 
At no point in hyp_resume() or system_suspend() does CPU0 call 
check_local_cpu_errata().

Could you, please, clarify why this is OK?



> +
> +    system_state = SYS_STATE_resume;
> +    update_boot_mapping(false);
> +
> +    gic_resume();
> +
> + resume_time:
> +    time_resume();
> +
> +    local_irq_restore(flags);
> +
> +    console_resume();
> +
> + resume_iommu:
> +    iommu_resume();
> +
> + resume_end_sync:
> +    console_end_sync();
> +
> + resume_nonboot_cpus:
> +    /*
> +     * The rcu_barrier() has to be added to ensure that the per cpu area is
> +     * freed before a non-boot CPU tries to initialize it (_free_percpu_area()
> +     * has to be called before the init_percpu_area()). This scenario occurs
> +     * when non-boot CPUs are hot-unplugged on suspend and hotplugged on resume.
> +     */
> +    rcu_barrier();
> +    enable_nonboot_cpus();
> +
> +    scheduler_enable();
> +    thaw_domains();
> +
> +    system_state = SYS_STATE_active;
> +
> +    printk("Resume (status %d)\n", status);
> +
> +    domain_resume(d);
> +}

[snip]

