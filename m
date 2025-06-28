Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD96FAEC9B3
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jun 2025 20:17:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028420.1402411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVa7A-0003DV-QB; Sat, 28 Jun 2025 18:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028420.1402411; Sat, 28 Jun 2025 18:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVa7A-0003Am-Mm; Sat, 28 Jun 2025 18:17:24 +0000
Received: by outflank-mailman (input) for mailman id 1028420;
 Sat, 28 Jun 2025 18:17:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uVa7A-0003Ag-2F
 for xen-devel@lists.xenproject.org; Sat, 28 Jun 2025 18:17:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVa79-0073gT-1N;
 Sat, 28 Jun 2025 18:17:23 +0000
Received: from [2a02:8012:3a1:0:d050:4cf0:af44:4b0]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVa79-0030pm-0L;
 Sat, 28 Jun 2025 18:17:23 +0000
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
	bh=jWXvREPJzPiKcGAiZdfLXeOSpatiJXJjdiIvtx+V4nQ=; b=yA9fvCh9Vuzvv58BQmPpv80SPM
	MAZ3iFIWn6uhB4j5g6QYEva/faI4pnFjXITduoy5QUZJUhQf+mUWlg8BO7rSMvcR3XBRebxSZnuJm
	TsULvpisaPBNmH+94XmToSvTUmOa2hajvU/nlViOBNc97wsIQLSV7v6Rfa0+hqticd0s=;
Message-ID: <066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org>
Date: Sat, 28 Jun 2025 19:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1751020456.git.mykola_kvach@epam.com>
 <072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 27/06/2025 11:51, Mykola Kvach wrote:
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
> index effd25b69e..8dfcac7e3b 100644
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
> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/vpsci.h
> index 0cca5e6830..69d40f9d7f 100644
> --- a/xen/arch/arm/include/asm/vpsci.h
> +++ b/xen/arch/arm/include/asm/vpsci.h
> @@ -23,7 +23,7 @@
>   #include <asm/psci.h>
>   
>   /* Number of function implemented by virtual PSCI (only 0.2 or later) */
> -#define VPSCI_NR_FUNCS  12
> +#define VPSCI_NR_FUNCS  14
>   
>   /* Functions handle PSCI calls from the guests */
>   bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 67296dabb5..f9c09a49e2 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -6,6 +6,8 @@
>   #include <xen/sched.h>
>   #include <xen/softirq.h>
>   
> +#include <public/sched.h>
> +
>   #include <asm/alternative.h>
>   #include <asm/event.h>
>   #include <asm/flushtlb.h>
> @@ -198,7 +200,9 @@ void dump_p2m_lookup(struct domain *d, paddr_t addr)
>    */
>   void p2m_save_state(struct vcpu *p)
>   {
> -    p->arch.sctlr = READ_SYSREG(SCTLR_EL1);
> +    if ( !(p->domain->is_shutting_down &&
> +           p->domain->shutdown_code == SHUTDOWN_suspend) )

This is definitely not obvious why you need to change p2m_save_state(). 
AFAIU, you are doing this because when suspending the system, you will 
overwrite p->arch.sctlr. However, this is super fragile. For instance, 
you still seem to overwrite TTBR{0,1} and TTBCR.

TTBR{0,1} are technically unknown at boot. So it is fine to ignore them. 
  But for TTBCR, I am not 100% whether this is supposed to be unknown.

Anyway, adding more "if (...)" is not the right solution because in the 
future we may decide to reset more registers.

It would be better if we stash the value sand then update the registers. 
Another possibility would be to entirely skip the save path for CPUs 
that are turned off (after all this is a bit useless work...).

> +static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
> +                            register_t context_id)
> +{
> +    int rc;
> +    struct vcpu *v;
> +    struct domain *d = current->domain;
> +    register_t vcpuid;
> +
> +    vcpuid = vaffinity_to_vcpuid(target_cpu);
> +
> +    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
> +        return PSCI_INVALID_PARAMETERS;
> +
> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> +        return PSCI_ALREADY_ON;
> +
> +    rc = do_setup_vcpu_ctx(v, entry_point, context_id);
> +    if ( rc == PSCI_SUCCESS )
> +        vcpu_wake(v);
> +
> +    return rc;
> +}
> +
>   static int32_t do_psci_cpu_on(uint32_t vcpuid, register_t entry_point)
>   {
>       int32_t ret;
> @@ -197,6 +208,52 @@ static void do_psci_0_2_system_reset(void)
>       domain_shutdown(d,SHUTDOWN_reboot);
>   }
>   
> +static void do_resume_on_error(struct domain *d)

This looks like an open-coding version of domain_resume() without the 
domain_{,un}pause(). What worries me is there is a comment on top of
domain_pause() explaining why it is called. I understand, we can't call 
domain_pause() here (it doesn't work on the current domain). However, it 
feels to me there is an explanation necessary why this is fine to diverge.

I am not a scheduler expert, so I am CCing Juergen in the hope he could 
provide some inputs.

> +{
> +    struct vcpu *v;
> +
> +    spin_lock(&d->shutdown_lock);
> +
> +    d->is_shutting_down = d->is_shut_down = 0;
> +    d->shutdown_code = SHUTDOWN_CODE_INVALID;
> +
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v->paused_for_shutdown )
> +            vcpu_unpause(v);
> +        v->paused_for_shutdown = 0;
> +    }
> +
> +    spin_unlock(&d->shutdown_lock);
> +}
> +
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
> +{
> +    int ret;
> +    struct vcpu *v;
> +    struct domain *d = current->domain;
> +
> +    /* Drop this check once SYSTEM_SUSPEND is supported in hardware domain */
> +    if ( is_hardware_domain(d) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    domain_shutdown(d, SHUTDOWN_suspend);

It would be good to add a comment explaining why you need to call 
domain_shutdown() first. Otherwise, one could wonder whether we can get 
rid of the complexity when a vCPU is still online.

> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    for_each_vcpu ( d, v )

NIT: Even if this is a single "statement" below, I think adding the 
brace would make the code clearer.

> +        if ( v != current && is_vcpu_online(v) )
> +        {
> +            do_resume_on_error(d);
> +            return PSCI_DENIED;
> +        }
> +
> +    ret = do_setup_vcpu_ctx(current, epoint, cid);
> +    if ( ret != PSCI_SUCCESS )
> +        do_resume_on_error(d);
> +
> +    return ret;
> +}
> +
>   static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>   {
>       /* /!\ Ordered by function ID and not name */
> @@ -214,6 +271,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>       case PSCI_0_2_FN32_SYSTEM_OFF:
>       case PSCI_0_2_FN32_SYSTEM_RESET:
>       case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>       case ARM_SMCCC_VERSION_FID:
>           return 0;
>       default:
> @@ -344,6 +403,17 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>           return true;
>       }
>   
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> +    {
> +        register_t epoint = PSCI_ARG(regs,1);
> +        register_t cid = PSCI_ARG(regs,2);

Coding style: For the two lines above, there is a missing space after ",".

Also, if a 64-bit domain is calling the 32-bit version, then we also 
need to ignore the top 32-bits. AFAICT CPU_ON also have the same issue. 
I am not going to ask fixing CPU_ON (it would be good though), but I 
will at least ask we don't spread the mistake further.

Cheers,

-- 
Julien Grall


