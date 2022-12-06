Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3C4644E02
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 22:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455600.713114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2faO-0008II-UT; Tue, 06 Dec 2022 21:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455600.713114; Tue, 06 Dec 2022 21:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2faO-0008Ft-Re; Tue, 06 Dec 2022 21:34:44 +0000
Received: by outflank-mailman (input) for mailman id 455600;
 Tue, 06 Dec 2022 21:34:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2faN-0008Fn-QA
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 21:34:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2faN-00030L-BV; Tue, 06 Dec 2022 21:34:43 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2faN-00030Q-3T; Tue, 06 Dec 2022 21:34:43 +0000
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
	bh=b+t3yx9lyzlLOTLkmm87s27yuFrb9eclXRTa92z4XYg=; b=IsyxDgzz+EORvc2Ugbp34cvMk/
	R8LQFvgr8f4SLTk9vtW5sMCll6Sz8vg1G61MBpwcezuO0E6UtUCpo4gWVDrfM0EUVx/6mAwL/uiuU
	OxxcZ9hGytBTuet20JxfKMFtkx2Bm1A/U55d4bZBTRtPM/wQTDzPn1SUhxYL3aGFl2A8=;
Message-ID: <e64c0224-5ab8-b758-1756-a0beae872d28@xen.org>
Date: Tue, 6 Dec 2022 21:34:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 12/19] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (physical interface)
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <3c5ec1f22e9ae6bac7ee98f63a0a700d7c3ec11f.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3c5ec1f22e9ae6bac7ee98f63a0a700d7c3ec11f.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> PSCI system suspend function shall be invoked to finalize Xen suspend
> procedure. Resume entry point, which needs to be passed via 1st argument
> of PSCI system suspend call to the EL3, is hyp_resume. For now, hyp_resume
> is just a placeholder that will be implemented in assembly. Context ID,
> which is 2nd argument of system suspend PSCI call, is unused, as in Linux.
> 
> Update: moved hyp_resume to head.S to place it near the rest of the
> start code
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/arch/arm/arm64/head.S     |  3 +++
>   xen/arch/arm/psci.c           | 16 ++++++++++++++++
>   xen/arch/arm/suspend.c        |  4 ++++
>   xen/include/asm-arm/psci.h    |  1 +
>   xen/include/asm-arm/suspend.h |  1 +
>   5 files changed, 25 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index aa1f88c764..8857955699 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -957,6 +957,9 @@ ENTRY(efi_xen_start)
>           b     real_start_efi
>   ENDPROC(efi_xen_start)
>   
> +ENTRY(hyp_resume)
> +        b .

This needs to be part of the idmap. At the moment, this will only cover 
up to _end_boot.

> +
>   /*
>    * Local variables:
>    * mode: ASM
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 0c90c2305c..43a67eb345 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -25,6 +25,7 @@
>   #include <asm/cpufeature.h>
>   #include <asm/psci.h>
>   #include <asm/acpi.h>
> +#include <asm/suspend.h>
>   
>   /*
>    * While a 64-bit OS can make calls with SMC32 calling conventions, for
> @@ -68,6 +69,21 @@ void call_psci_cpu_off(void)
>       }
>   }
>   
> +int call_psci_system_suspend(void)
> +{
> +#ifdef CONFIG_ARM_64
> +    struct arm_smccc_res res;
> +
> +    /* 2nd argument (context ID) is not used */
> +    arm_smccc_smc(PSCI_1_0_FN64_SYSTEM_SUSPEND, __pa(hyp_resume), &res);
> +
> +    return PSCI_RET(res);
> +#else
> +    /* not supported */
> +    return 1;
> +#endif
> +}
> +
>   void call_psci_system_off(void)
>   {
>       if ( psci_ver > PSCI_VERSION(0, 1) )
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index 05c43ce502..a0258befc9 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -161,6 +161,10 @@ static long system_suspend(void *data)
>           goto resume_irqs;
>       }
>   
> +    status = call_psci_system_suspend();
> +    if ( status )
> +        dprintk(XENLOG_ERR, "PSCI system suspend failed, err=%d\n", status);
> +
>       system_state = SYS_STATE_resume;
>   
>       gic_resume();
> diff --git a/xen/include/asm-arm/psci.h b/xen/include/asm-arm/psci.h
> index 26462d0c47..9f6116a224 100644
> --- a/xen/include/asm-arm/psci.h
> +++ b/xen/include/asm-arm/psci.h
> @@ -20,6 +20,7 @@ extern uint32_t psci_ver;
>   
>   int psci_init(void);
>   int call_psci_cpu_on(int cpu);
> +int call_psci_system_suspend(void);
>   void call_psci_cpu_off(void);
>   void call_psci_system_off(void);
>   void call_psci_system_reset(void);
> diff --git a/xen/include/asm-arm/suspend.h b/xen/include/asm-arm/suspend.h
> index fbaa414f0c..29420e27fa 100644
> --- a/xen/include/asm-arm/suspend.h
> +++ b/xen/include/asm-arm/suspend.h
> @@ -3,6 +3,7 @@
>   
>   int32_t domain_suspend(register_t epoint, register_t cid);
>   void vcpu_resume(struct vcpu *v);
> +void hyp_resume(void);
>   
>   #endif
>   

Cheers,

-- 
Julien Grall

