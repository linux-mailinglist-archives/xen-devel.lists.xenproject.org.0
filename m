Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8066DA5D1F9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:50:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909432.1316377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts7TW-0007qE-5j; Tue, 11 Mar 2025 21:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909432.1316377; Tue, 11 Mar 2025 21:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts7TW-0007nA-2N; Tue, 11 Mar 2025 21:49:22 +0000
Received: by outflank-mailman (input) for mailman id 909432;
 Tue, 11 Mar 2025 21:49:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts7TU-0007n4-JN
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:49:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts7TU-00EjxQ-0v;
 Tue, 11 Mar 2025 21:49:20 +0000
Received: from [2a02:8012:3a1:0:9c08:78f4:b949:88f8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts7TT-005Vl7-2k;
 Tue, 11 Mar 2025 21:49:19 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=wRnLpbhWkjgtDUe3vtbrsnj6WjAiSrViZ+f90TH+WLc=; b=hH8zKu11iy6VrZgSYzos5TI+oc
	ny0cYPrGLmhxDeqz8rgVYl3zGqUEytnFuVirJ7kc5Nwo2Y74sdka/gE//qh2A690cDuZmCr9gh9BS
	fYO2J0WAmlz4AtICLdi6n3u//KTobO0DC2MZebnRoTmQdnq5LfQ+Ep8lu0p5LSPAPkn0=;
Message-ID: <37d1210c-cfc6-4cd4-9562-40db809b8223@xen.org>
Date: Tue, 11 Mar 2025 21:49:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] xen/arm: Implement PSCI system suspend
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <b80f0559048638bfe1a934f2d256331db733ed3e.1741164138.git.xakep.amatop@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b80f0559048638bfe1a934f2d256331db733ed3e.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/03/2025 09:11, Mykola Kvach wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> The implementation consists of:
> -Adding PSCI system suspend call as new PSCI function
> -Trapping PSCI system_suspend HVC
> -Implementing PSCI system suspend call (virtual interface that allows
>   guests to suspend themselves), but currently it is only partially
>   implemented, so suspend/resume will correctly work only for dom0

What is missing for other domains?

> 
> The PSCI system suspend should be called by a guest from its boot
> VCPU. Non-boot VCPUs of the guest should be hot-unplugged using PSCI
> CPU_OFF call prior to issuing PSCI system suspend. Interrupts that
> are left enabled by the guest are assumed to be its wake-up interrupts.
> Therefore, a wake-up interrupt triggers the resume of the guest. Guest
> should resume regardless of the state of Xen (suspended or not).
> 
> When a guest calls PSCI system suspend the respective domain will be
> suspended if the following conditions are met:
> 1) Given resume entry point is not invalid
> 2) Other (if any) VCPUs of the calling guest are hot-unplugged
> 
> If the conditions above are met the calling domain is labeled as
> suspended and the calling VCPU is blocked. If nothing else wouldn't
> be done the suspended domain would resume from the place where it
> called PSCI system suspend. This is expected if processing of the PSCI
> system suspend call fails. However, in the case of success the calling
> guest should resume (continue execution after the wake-up) from the entry
> point which is given as the first argument of the PSCI system suspend
> call. In addition to the entry point, the guest expects to start within
> the environment whose state matches the state after reset. This means
> that the guest should find reset register values, MMU disabled, etc.
> Thereby, the context of VCPU should be 'reset' (as if the system is
> comming out of reset), the program counter should contain entry point,
> which is 1st argument, and r0/x0 should contain context ID which is 2nd
> argument of PSCI system suspend call. The context of VCPU is set
> accordingly when the PSCI system suspend is processed, so that nothing
> needs to be done on resume/wake-up path.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V3:
> Dropped all domain flags and related code (which touched common functions like
> vcpu_unblock), keeping only the necessary changes for Xen suspend/resume, i.e.
> suspend/resume is now fully supported only for the hardware domain.
> Proper support for domU suspend/resume will be added in a future patch.
> This patch does not yet include VCPU context reset or domain context
> restoration in VCPU.
> ---
>   xen/arch/arm/Makefile                 |  1 +
>   xen/arch/arm/include/asm/domain.h     |  3 ++
>   xen/arch/arm/include/asm/perfc_defn.h |  1 +
>   xen/arch/arm/include/asm/psci.h       |  2 +
>   xen/arch/arm/include/asm/suspend.h    | 18 +++++++
>   xen/arch/arm/suspend.c                | 67 +++++++++++++++++++++++++++
>   xen/arch/arm/vpsci.c                  | 32 +++++++++++++
>   7 files changed, 124 insertions(+)
>   create mode 100644 xen/arch/arm/include/asm/suspend.h
>   create mode 100644 xen/arch/arm/suspend.c
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 43ab5e8f25..70d4b5daf8 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -53,6 +53,7 @@ obj-y += smpboot.o
>   obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>   obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
>   obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
> +obj-$(CONFIG_SYSTEM_SUSPEND) += suspend.o

I am a bit confused why we are tie guest suspend/resume with system 
suspend/resume. Shouldn't they be separate?

>   obj-y += sysctl.o
>   obj-y += time.o
>   obj-y += traps.o
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 50b6a4b009..8b1bdf3d74 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -233,6 +233,9 @@ struct arch_vcpu
>       struct vtimer virt_timer;
>       bool   vtimer_initialized;
>   
> +    register_t suspend_ep;
> +    register_t suspend_cid;
> +
>       /*
>        * The full P2M may require some cleaning (e.g when emulation
>        * set/way). As the action can take a long time, it requires
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
> index 3ab0391175..5049563718 100644
> --- a/xen/arch/arm/include/asm/perfc_defn.h
> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_reset")
>   PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>   PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>   PERFCOUNTER(vpsci_features,            "vpsci: features")
> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
>   
>   PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
>   
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
> index 4780972621..48a93e6b79 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>   #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>   #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>   #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
>   
>   #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>   #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>   #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
>   
>   /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>   #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
> new file mode 100644
> index 0000000000..745377dbcf
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_ARM_SUSPEND_H__
> +#define __ASM_ARM_SUSPEND_H__
> +
> +int32_t domain_suspend(register_t epoint, register_t cid);
> +
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> new file mode 100644
> index 0000000000..27fab8c999
> --- /dev/null
> +++ b/xen/arch/arm/suspend.c
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/sched.h>
> +#include <asm/cpufeature.h>
> +#include <asm/event.h>
> +#include <asm/psci.h>
> +#include <asm/suspend.h>
> +#include <asm/platform.h>
> +#include <public/sched.h>
> +
> +static void vcpu_suspend_prepare(register_t epoint, register_t cid)
> +{
> +    struct vcpu *v = current;
> +
> +    v->arch.suspend_ep = epoint;
> +    v->arch.suspend_cid = cid;
> +}
> +
> +int32_t domain_suspend(register_t epoint, register_t cid)
> +{
> +    struct vcpu *v;
> +    struct domain *d = current->domain;
> +    bool is_thumb = epoint & 1;
> +
> +    dprintk(XENLOG_DEBUG,
> +            "Dom%d suspend: epoint=0x%"PRIregister", cid=0x%"PRIregister"\n",
> +            d->domain_id, epoint, cid);
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    /* TODO: care about locking here */

What's the plan for this?

> +    /* Ensure that all CPUs other than the calling one are offline */
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v != current && is_vcpu_online(v) )
> +            return PSCI_DENIED;
> +    }
> +
> +    /*
> +     * Prepare the calling VCPU for suspend (save entry point into pc and
> +     * context ID into r0/x0 as specified by PSCI SYSTEM_SUSPEND)
> +     */

Looking at the code, it doesn't save the value into pc and x0/r0. 
Instead, it is stashing it into different fields.

> +    vcpu_suspend_prepare(epoint, cid);
> +
> +    /* Disable watchdogs of this domain */
> +    watchdog_domain_suspend(d);

At least for guests, I was expecting psci_suspend to behave very 
similarly to domain_shutdown(SHUTDOWN_suspend) so it can be used with 
"xl suspend/resume". Is there any reason we are diverging?

> +
> +    /*
> +     * The calling domain is suspended by blocking its last running VCPU. If an
> +     * event is pending the domain will resume right away (VCPU will not block,
> +     * but when scheduled in it will resume from the given entry point).
> +     */

Looking at the code, you don't seem to set x0, pc or even reset the vCPU 
unless the platform suspend. So are you sure the suspend will work 
properly if there is an event pending?


> +    vcpu_block_unless_event_pending(current);
 > +> +    return PSCI_SUCCESS;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index d1615be8a6..96eef06c18 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -7,6 +7,7 @@
>   #include <asm/vgic.h>
>   #include <asm/vpsci.h>
>   #include <asm/event.h>
> +#include <asm/suspend.h>
>   
>   #include <public/sched.h>
>   
> @@ -197,6 +198,15 @@ static void do_psci_0_2_system_reset(void)
>       domain_shutdown(d,SHUTDOWN_reboot);
>   }
>   
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
> +{
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    return domain_suspend(epoint, cid);
> +#else
> +    return PSCI_NOT_SUPPORTED;
> +#endif
> +}
> +
>   static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>   {
>       /* /!\ Ordered by function ID and not name */
> @@ -214,6 +224,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>       case PSCI_0_2_FN32_SYSTEM_OFF:
>       case PSCI_0_2_FN32_SYSTEM_RESET:
>       case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>       case ARM_SMCCC_VERSION_FID:
>           return 0;
>       default:
> @@ -344,6 +356,26 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>           return true;
>       }
>   
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> +    {
> +        register_t epoint = PSCI_ARG(regs,1);
> +        register_t cid = PSCI_ARG(regs,2);
> +        register_t ret;
> +
> +        perfc_incr(vpsci_system_suspend);
> +        /* Set the result to PSCI_SUCCESS if the call fails.

I don't understand the comment. Below, you will set "ret" only if the 
call doesn't return SUCCESS.

Also, coding style:

/*
  * Foo ...
  * Bar ...
  */

> +         * Otherwise preserve the context_id in x0. For now

Per above, I don't think this is correct.

> +         * we don't support the case where the system is suspended
> +         * to a shallower level and PSCI_SUCCESS is returned to the
> +         * caller.

I am confused. Per the specification, PSCI_SYSTEM_SUSPEND cannot return 
PSCI_SUCCESS if the call is successful. Any chance you are confusing 
with CPU_SUSPEND?

> +         */
> +        ret = do_psci_1_0_system_suspend(epoint, cid);
> +        if ( ret != PSCI_SUCCESS )
> +            PSCI_SET_RESULT(regs, ret);
> +        return true;
> +    }
> +
>       default:
>           return false;
>       }

Cheers,

-- 
Julien Grall


