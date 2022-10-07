Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8135F7725
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 13:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417854.662587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogl4O-00029Q-ML; Fri, 07 Oct 2022 10:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417854.662587; Fri, 07 Oct 2022 10:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogl4O-000275-IM; Fri, 07 Oct 2022 10:59:08 +0000
Received: by outflank-mailman (input) for mailman id 417854;
 Fri, 07 Oct 2022 10:59:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ogl4M-00026z-A1
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:59:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ogl4L-00080M-15; Fri, 07 Oct 2022 10:59:05 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.20.83]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ogl4K-0005iJ-Ky; Fri, 07 Oct 2022 10:59:04 +0000
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
	bh=zWi1CwmeiZ3088j4C62vU4t0ZJKlHSdHJSLoLfq07F4=; b=U+uCWfB1WGynQBLKR2zzTVews7
	gPCdo6WgZl4eNuXZ/Yr3IRejTo+f6/snhSSIEgcqp/1TiYyWzJaHF5MH6zWaSyz1Ibb6p3aMv6zMn
	dyW6oK5lVtE2jIv9BmguuacT2fVMAEHADpsyToHyn/jjVMXB9jjpbvTluE3zIwVwTn7Y=;
Message-ID: <a24447f1-4011-365a-24c6-cb448c2cb43e@xen.org>
Date: Fri, 7 Oct 2022 11:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH 01/19] xen/arm: Implement PSCI system suspend
Content-Language: en-US
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta.poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <598de284f5f133a622eca3e120a1aabae0f2a1e2.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <598de284f5f133a622eca3e120a1aabae0f2a1e2.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

I couldn't find any cover letter for this series in neither my inbox nor 
xen-devel. Can you provide one explain the goal of this series (you seem 
to have a mix of domain suspend and host suspend)? If it is also based 
on an existing series, then it would be nice to mention it (this would 
be helpful to look at the existings and check if they were addressed).

Also, we are currently in the middle of the code freeze. So the review 
will likely be quite slow until 4.17 is out and I caught up with the 
rest of my backlog.

That said from a brief look, I see you included a patch that was merged 
around 4.12. So is this series actually based on staging?

If not, then the first step would be to rebase this series to the latest 
staging.

Cheers,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> The implementation consists of:
> -Adding PSCI system suspend call as new PSCI function
> -Trapping PSCI system_suspend HVC
> -Implementing PSCI system suspend call (virtual interface that allows
>   guests to suspend themselves)
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
> argument of PSCI system suspend call. The context of VCPU is set during
> resume path, to prevent it being overwritten by ctxt_switch_from after
> vcpu is blocked and scheduled out.
> 
> VCPU is marked as suspended with _VPF_suspended flag. A suspended domain
> will resume after the Xen receives an interrupt which is targeted to the
> domain, unblocks the domain's VCPU, and schedules it in. During the
> vcpu_unblock execution the VCPU is checked for VPF_suspended flag. If
> the flag is present, the context of that VCPU gets cleared and entry
> point/cid are set.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta.poturai@epam.com>
> ---
>   xen/arch/arm/Makefile            |   1 +
>   xen/arch/arm/domain.c            |   4 +
>   xen/arch/arm/suspend.c           | 182 +++++++++++++++++++++++++++++++
>   xen/arch/arm/vpsci.c             |  28 +++++
>   xen/common/sched/core.c          |   8 ++
>   xen/include/asm-arm/domain.h     |   3 +
>   xen/include/asm-arm/perfc_defn.h |   1 +
>   xen/include/asm-arm/psci.h       |   2 +
>   xen/include/asm-arm/suspend.h    |  17 +++
>   xen/include/xen/sched.h          |   3 +
>   10 files changed, 249 insertions(+)
>   create mode 100644 xen/arch/arm/suspend.c
>   create mode 100644 xen/include/asm-arm/suspend.h
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index b5913c9d39..07dbbd99a3 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -49,6 +49,7 @@ obj-y += setup.o
>   obj-y += shutdown.o
>   obj-y += smp.o
>   obj-y += smpboot.o
> +obj-y += suspend.o
>   obj-y += sysctl.o
>   obj-y += time.o
>   obj-y += traps.o
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 23c8b345d4..4110154bda 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -40,6 +40,8 @@
>   #include <asm/vtimer.h>
>   #include <asm/vscmi.h>
>   
> +#include <public/sched.h>
> +
>   #include "vpci.h"
>   #include "vuart.h"
>   
> @@ -101,6 +103,8 @@ static void ctxt_switch_from(struct vcpu *p)
>       if ( is_idle_vcpu(p) )
>           return;
>   
> +    /* VCPU's context should not be saved if its domain is suspended */
> +
>       p2m_save_state(p);
>   
>       /* CP 15 */
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> new file mode 100644
> index 0000000000..987ba6ac11
> --- /dev/null
> +++ b/xen/arch/arm/suspend.c
> @@ -0,0 +1,182 @@
> +/*
> + * Copyright (C) 2022 EPAM Systems Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU Lesser General Public License as published
> + * by the Free Software Foundation; version 2.1 only. with the special
> + * exception on linking described in file LICENSE.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU Lesser General Public License for more details.
> + */
> +
> +#include <xen/sched.h>
> +#include <asm/cpufeature.h>
> +#include <asm/event.h>
> +#include <asm/psci.h>
> +#include <asm/suspend.h>
> +#include <public/sched.h>
> +
> +struct cpu_context cpu_context;
> +
> +/* Reset values of VCPU architecture specific registers */
> +static void vcpu_arch_reset(struct vcpu *v)
> +{
> +    v->arch.ttbr0 = 0;
> +    v->arch.ttbr1 = 0;
> +    v->arch.ttbcr = 0;
> +
> +    v->arch.csselr = 0;
> +    v->arch.cpacr = 0;
> +    v->arch.contextidr = 0;
> +    v->arch.tpidr_el0 = 0;
> +    v->arch.tpidrro_el0 = 0;
> +    v->arch.tpidr_el1 = 0;
> +    v->arch.vbar = 0;
> +    v->arch.dacr = 0;
> +    v->arch.par = 0;
> +#if defined(CONFIG_ARM_32)
> +    v->arch.mair0 = 0;
> +    v->arch.mair1 = 0;
> +    v->arch.amair0 = 0;
> +    v->arch.amair1 = 0;
> +#else
> +    v->arch.mair = 0;
> +    v->arch.amair = 0;
> +#endif
> +    /* Fault Status */
> +#if defined(CONFIG_ARM_32)
> +    v->arch.dfar = 0;
> +    v->arch.ifar = 0;
> +    v->arch.dfsr = 0;
> +#elif defined(CONFIG_ARM_64)
> +    v->arch.far = 0;
> +    v->arch.esr = 0;
> +#endif
> +
> +    v->arch.ifsr  = 0;
> +    v->arch.afsr0 = 0;
> +    v->arch.afsr1 = 0;
> +
> +#ifdef CONFIG_ARM_32
> +    v->arch.joscr = 0;
> +    v->arch.jmcr = 0;
> +#endif
> +
> +    if ( is_32bit_domain(v->domain) && cpu_has_thumbee )
> +    {
> +        v->arch.teecr = 0;
> +        v->arch.teehbr = 0;
> +    }
> +}
> +
> +
> +static void vcpu_suspend(register_t epoint, register_t cid)
> +{
> +    struct vcpu *v = current;
> +
> +    v->arch.suspend_ep = epoint;
> +    v->arch.suspend_cid = cid;
> +    set_bit(_VPF_suspended, &v->pause_flags);
> +    return;
> +}
> +
> +/*
> + * This function sets the context of current VCPU to the state which is expected
> + * by the guest on resume. The expected VCPU state is:
> + * 1) pc to contain resume entry point (1st argument of PSCI SYSTEM_SUSPEND)
> + * 2) r0/x0 to contain context ID (2nd argument of PSCI SYSTEM_SUSPEND)
> + * 3) All other general purpose and system registers should have reset values
> + */
> +void vcpu_resume(struct vcpu *v)
> +{
> +
> +    struct vcpu_guest_context ctxt;
> +
> +    /* Make sure that VCPU guest regs are zeroed */
> +    memset(&ctxt, 0, sizeof(ctxt));
> +
> +    /* Set non-zero values to the registers prior to copying */
> +    ctxt.user_regs.pc64 = (u64)v->arch.suspend_ep;
> +
> +    if ( is_32bit_domain(v->domain) )
> +    {
> +        ctxt.user_regs.r0_usr = v->arch.suspend_cid;
> +        ctxt.user_regs.cpsr = PSR_GUEST32_INIT;
> +
> +        /* Thumb set is allowed only for 32-bit domain */
> +        if ( v->arch.suspend_ep & 1 )
> +        {
> +            ctxt.user_regs.cpsr |= PSR_THUMB;
> +            ctxt.user_regs.pc64 &= ~(u64)1;
> +        }
> +    }
> +#ifdef CONFIG_ARM_64
> +    else
> +    {
> +        ctxt.user_regs.x0 = v->arch.suspend_cid;
> +        ctxt.user_regs.cpsr = PSR_GUEST64_INIT;
> +    }
> +#endif
> +    ctxt.sctlr = SCTLR_GUEST_INIT;
> +    ctxt.flags = VGCF_online;
> +
> +    /* Reset architecture specific registers */
> +    vcpu_arch_reset(v);
> +
> +    /* Initialize VCPU registers */
> +    arch_set_info_guest(v, &ctxt);
> +    clear_bit(_VPF_suspended, &v->pause_flags);
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
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v != current && is_vcpu_online(v) )
> +            return PSCI_DENIED;
> +    }
> +
> +    //TODO: add support for suspending from any VCPU
> +    if (current->vcpu_id != 0)
> +        return PSCI_DENIED;
> +
> +    /*
> +     * Prepare the calling VCPU for suspend (reset its context, save entry point
> +     * into pc and context ID into r0/x0 as specified by PSCI SYSTEM_SUSPEND)
> +     */
> +    vcpu_suspend(epoint, cid);
> +
> +    /*
> +     * The calling domain is suspended by blocking its last running VCPU. If an
> +     * event is pending the domain will resume right away (VCPU will not block,
> +     * but when scheduled in it will resume from the given entry point).
> +     */
> +    vcpu_block_unless_event_pending(current);
> +
> +    return PSCI_SUCCESS;
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
> index c1e250be59..f4e6e92873 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -18,6 +18,7 @@
>   #include <asm/vgic.h>
>   #include <asm/vpsci.h>
>   #include <asm/event.h>
> +#include <asm/suspend.h>
>   
>   #include <public/sched.h>
>   
> @@ -208,6 +209,11 @@ static void do_psci_0_2_system_reset(void)
>       domain_shutdown(d,SHUTDOWN_reboot);
>   }
>   
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
> +{
> +    return domain_suspend(epoint, cid);
> +}
> +
>   static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>   {
>       /* /!\ Ordered by function ID and not name */
> @@ -225,6 +231,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>       case PSCI_0_2_FN32_SYSTEM_OFF:
>       case PSCI_0_2_FN32_SYSTEM_RESET:
>       case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>       case ARM_SMCCC_VERSION_FID:
>           return 0;
>       default:
> @@ -355,6 +363,26 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
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
> +         * Otherwise preserve the context_id in x0. For now
> +         * we don't support the case where the system is suspended
> +         * to a shallower level and PSCI_SUCCESS is returned to the
> +         * caller.
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
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 8f4b1ca10d..4e1ea62c44 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -38,6 +38,10 @@
>   #include <xsm/xsm.h>
>   #include <xen/err.h>
>   
> +#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> +#include <asm/suspend.h>
> +#endif
> +
>   #include "private.h"
>   
>   #ifdef CONFIG_XEN_GUEST
> @@ -957,6 +961,10 @@ void vcpu_unblock(struct vcpu *v)
>   {
>       if ( !test_and_clear_bit(_VPF_blocked, &v->pause_flags) )
>           return;
> +#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> +    if ( test_bit(_VPF_suspended, &v->pause_flags) )
> +        vcpu_resume(v);
> +#endif
>   
>       /* Polling period ends when a VCPU is unblocked. */
>       if ( unlikely(v->poll_evtchn != 0) )
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 413e5a2a18..715841e0b5 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -203,6 +203,9 @@ struct arch_vcpu
>       struct vtimer virt_timer;
>       bool   vtimer_initialized;
>   
> +    register_t suspend_ep;
> +    register_t suspend_cid;
> +
>       /*
>        * The full P2M may require some cleaning (e.g when emulation
>        * set/way). As the action can take a long time, it requires
> diff --git a/xen/include/asm-arm/perfc_defn.h b/xen/include/asm-arm/perfc_defn.h
> index 31f071222b..d71e91a5e4 100644
> --- a/xen/include/asm-arm/perfc_defn.h
> +++ b/xen/include/asm-arm/perfc_defn.h
> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_reset")
>   PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>   PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>   PERFCOUNTER(vpsci_features,            "vpsci: features")
> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
>   
>   PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
>   
> diff --git a/xen/include/asm-arm/psci.h b/xen/include/asm-arm/psci.h
> index 832f77afff..26462d0c47 100644
> --- a/xen/include/asm-arm/psci.h
> +++ b/xen/include/asm-arm/psci.h
> @@ -43,10 +43,12 @@ void call_psci_system_reset(void);
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
> diff --git a/xen/include/asm-arm/suspend.h b/xen/include/asm-arm/suspend.h
> new file mode 100644
> index 0000000000..fbaa414f0c
> --- /dev/null
> +++ b/xen/include/asm-arm/suspend.h
> @@ -0,0 +1,17 @@
> +#ifndef __ASM_ARM_SUSPEND_H__
> +#define __ASM_ARM_SUSPEND_H__
> +
> +int32_t domain_suspend(register_t epoint, register_t cid);
> +void vcpu_resume(struct vcpu *v);
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
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 3b4ed3a2ab..b2f6d1af28 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -903,6 +903,9 @@ static inline struct domain *next_domain_in_cpupool(
>   /* VCPU is parked. */
>   #define _VPF_parked          8
>   #define VPF_parked           (1UL<<_VPF_parked)
> +/* VCPU is suspended */
> +#define _VPF_suspended       9
> +#define VPF_suspended        (1UL<<_VPF_suspended)
>   
>   static inline bool vcpu_runnable(const struct vcpu *v)
>   {

-- 
Julien Grall

