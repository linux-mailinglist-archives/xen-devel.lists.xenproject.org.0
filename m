Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C907644E5E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 23:10:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455616.713136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2g8Y-00051Z-0p; Tue, 06 Dec 2022 22:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455616.713136; Tue, 06 Dec 2022 22:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2g8X-0004zB-Tm; Tue, 06 Dec 2022 22:10:01 +0000
Received: by outflank-mailman (input) for mailman id 455616;
 Tue, 06 Dec 2022 22:10:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2g8W-0004z5-Db
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 22:10:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2g8W-0003oz-B2
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 22:10:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2g8W-0004Pv-42; Tue, 06 Dec 2022 22:10:00 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=4Usd5Xz806pgc0L0C0Ni/deS65EzWeNxfewjaFM2mHg=; b=WP/Ud4J6cN/jihNX5NEqQqaPPl
	d9XojiQ/L1HWyxsOL9IWHzAoXzLbxUOzyv/XH6bPKj3bNXjCEbgsAEyrgHuc8lKKzboNEQ6BCB2Nd
	YDnUzx9W0VFTS5hVLKk7yqbDoY0O5Qyqgt8H+eoLm7Jq//2TuMWJn8cN1wgnSfVEMLRA=;
Message-ID: <597c89c5-9e2a-3174-9bae-29b721caa153@xen.org>
Date: Tue, 6 Dec 2022 22:09:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <dcd3e1ae475a478cd6f639c528565492b10e0f22.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 14/19] xen/arm: Save/restore context on suspend/resume
In-Reply-To: <dcd3e1ae475a478cd6f639c528565492b10e0f22.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> The context of CPU general purpose and system control registers
> has to be saved on suspend and restored on resume. This is
> implemented in hyp_suspend and before the return from hyp_resume
> function. The hyp_suspend is invoked just before the PSCI system > suspend call is issued to the ATF.
The software handling the PSCI call may not be ATF. It could be another 
vendor specific firmware or even another hypervisor (if running in 
nested environment). So let's avoid mention it.

> The hyp_suspend has to return a
> non-zero value so that the calling 'if' statement evaluates to true,
> causing the system suspend to be invoked. > Upon the resume, context
> saved on suspend will be restored, including the link register.
> Therefore, after restoring the context the control flow will
> return to the address pointed by the saved link register, which
> is the place from which the hyp_suspend was called. To ensure
> that the calling 'if' statement doesn't again evaluate to true
> and initiate system suspend, hyp_resume has to return a zero value
> after restoring the context.
> Note that the order of saving register context into cpu_context
> structure has to match the order of restoring.
> Since the suspend/resume is supported only for arm64, we define
> a null cpu_context structure so arm32 could compile.
> 
> Update: moved hyp_resume to head.S to place it near the rest of the
> start code

hyp_resume() is not moved in this patch. But this looks like more a 
changelog rather than something that should be part of the commit message.

> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/arch/arm/arm64/head.S     | 90 ++++++++++++++++++++++++++++++++++-
>   xen/arch/arm/suspend.c        | 25 ++++++++--
>   xen/include/asm-arm/suspend.h | 22 +++++++++
>   3 files changed, 133 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 82d83214dc..e2c46a864c 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -957,6 +957,53 @@ ENTRY(efi_xen_start)
>           b     real_start_efi
>   ENDPROC(efi_xen_start)
>   
> +/*
> + * void hyp_suspend(struct cpu_context *ptr)

This prototype doesn't match the code nor the commit message.

> + *
> + * x0 - pointer to the storage where callee's context will be saved
> + *
> + * CPU context saved here will be restored on resume in hyp_resume function.
> + * hyp_suspend shall return a non-zero value. Upon restoring context
> + * hyp_resume shall return value zero instead. From C code that invokes
> + * hyp_suspend, the return value is interpreted to determine whether the context
> + * is saved (hyp_suspend) or restored (hyp_resume).
> + */
> +ENTRY(hyp_suspend)
> +        /* Store callee-saved registers */
> +        stp     x19, x20, [x0], #16
> +        stp     x21, x22, [x0], #16
> +        stp     x23, x24, [x0], #16
> +        stp     x25, x26, [x0], #16
> +        stp     x27, x28, [x0], #16
> +        stp     x29, lr, [x0], #16
> +
> +        /* Store stack-pointer */
> +        mov     x2, sp
> +        str     x2, [x0], #8
> +
> +        /* Store system control registers */
> +        mrs     x2, VBAR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, VTCR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, VTTBR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, TPIDR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, MDCR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, HSTR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, CPTR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, HCR_EL2
> +        str     x2, [x0], #8
> +
> +        /* hyp_suspend must return a non-zero value */
> +        mov     x0, #1
> +        ret
> +
> +
>   ENTRY(hyp_resume)
>           msr   DAIFSet, 0xf           /* Disable all interrupts */
>   
> @@ -988,7 +1035,48 @@ mmu_resumed:
>           tlbi  alle2
>           dsb   sy                     /* Ensure completion of TLB flush */
>           isb
> -        b .
> +
> +        /* Now we can access the cpu_context, so restore the context here */
> +        ldr     x0, =cpu_context
> +
> +        /* Restore callee-saved registers */
> +        ldp     x19, x20, [x0], #16
> +        ldp     x21, x22, [x0], #16
> +        ldp     x23, x24, [x0], #16
> +        ldp     x25, x26, [x0], #16
> +        ldp     x27, x28, [x0], #16
> +        ldp     x29, lr, [x0], #16
> +
> +        /* Restore stack pointer */
> +        ldr     x2, [x0], #8
> +        mov     sp, x2
> +
> +        /* Restore system control registers */
> +        ldr     x2, [x0], #8
> +        msr     VBAR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     VTCR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     VTTBR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     TPIDR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     MDCR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     HSTR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     CPTR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     HCR_EL2, x2
> +        isb
> +
> +        /* Since context is restored return from this function will appear as

I can't parse it.

> +         * return from hyp_suspend. To distinguish a return from hyp_suspend
> +         * which is called upon finalizing the suspend, as opposed to return
> +         * from this function which executes on resume, we need to return zero
> +         * value here. */
Coding style. Multi-line comments looks like:

/*
  * Foo
  * Bar
  */

> +        mov x0, #0
> +        ret
>   
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index aa5ee4714b..13d1aba658 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -133,6 +133,11 @@ void vcpu_resume(struct vcpu *v)
>       clear_bit(_VPF_suspended, &v->pause_flags);
>   }
>   
> +#ifndef CONFIG_ARM_64
> +/* not supported on ARM_32 */
> +int32_t hyp_suspend(struct cpu_context *ptr) { return 1; }
> +#endif
> +

It would be better if suspend.c is compiled out. So we avoid introduce 
hyp_suspend().

>   /* Xen suspend. Note: data is not used (suspend is the suspend to RAM) */
>   static long system_suspend(void *data)
>   {
> @@ -161,9 +166,23 @@ static long system_suspend(void *data)
>           goto resume_irqs;
>       }
>   
> -    status = call_psci_system_suspend();
> -    if ( status )
> -        dprintk(XENLOG_ERR, "PSCI system suspend failed, err=%d\n", status);
> +    if ( hyp_suspend(&cpu_context) )
> +    {
> +        status = call_psci_system_suspend();
> +        /*
> +         * If suspend is finalized properly by above system suspend PSCI call,
> +         * the code below in this 'if' branch will never execute. Execution
> +         * will continue from hyp_resume which is the hypervisor's resume point.
> +         * In hyp_resume CPU context will be restored and since link-register is
> +         * restored as well, it will appear to return from hyp_suspend. The
> +         * difference in returning from hyp_suspend on system suspend versus
> +         * resume is in function's return value: on suspend, the return value is
> +         * a non-zero value, on resume it is zero. That is why the control flow
> +         * will not re-enter this 'if' branch on resume.
> +         */
> +        if ( status )
> +            dprintk(XENLOG_ERR, "PSCI system suspend failed, err=%d\n", status);
> +    }
>   
>       system_state = SYS_STATE_resume;
>   
> diff --git a/xen/include/asm-arm/suspend.h b/xen/include/asm-arm/suspend.h
> index 29420e27fa..70dbf4e208 100644
> --- a/xen/include/asm-arm/suspend.h
> +++ b/xen/include/asm-arm/suspend.h
> @@ -1,9 +1,31 @@
>   #ifndef __ASM_ARM_SUSPEND_H__
>   #define __ASM_ARM_SUSPEND_H__
>   
> +#ifdef CONFIG_ARM_64
> +struct cpu_context {
> +    uint64_t callee_regs[12];
> +    uint64_t sp;
> +    uint64_t vbar_el2;
> +    uint64_t vtcr_el2;
> +    uint64_t vttbr_el2;
> +    uint64_t tpidr_el2;
> +    uint64_t mdcr_el2;
> +    uint64_t hstr_el2;
> +    uint64_t cptr_el2;
> +    uint64_t hcr_el2;
> +} __aligned(16);
> +#else
> +struct cpu_context {
> +    uint8_t pad;
> +};
> +#endif
> +
> +extern struct cpu_context cpu_context;
> +
>   int32_t domain_suspend(register_t epoint, register_t cid);
>   void vcpu_resume(struct vcpu *v);
>   void hyp_resume(void);
> +int32_t hyp_suspend(struct cpu_context *ptr);
>   
>   #endif
>   

Cheers,

-- 
Julien Grall

