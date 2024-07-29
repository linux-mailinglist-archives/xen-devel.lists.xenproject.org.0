Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194AC93FD79
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 20:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767066.1177637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYVEU-000130-AP; Mon, 29 Jul 2024 18:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767066.1177637; Mon, 29 Jul 2024 18:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYVEU-00010K-77; Mon, 29 Jul 2024 18:36:30 +0000
Received: by outflank-mailman (input) for mailman id 767066;
 Mon, 29 Jul 2024 18:36:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sYVES-0000yV-Dl
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 18:36:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sYVER-0004NX-Pp; Mon, 29 Jul 2024 18:36:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sYVER-0000qW-Hp; Mon, 29 Jul 2024 18:36:27 +0000
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
	bh=KjvEYtc9GLw6AYpclvrKLl0ilJRyrS7Ibi0cpJ88ogw=; b=KH5TxQiRuQcIBi52DYxCEu6YrP
	mBAdOu2sN+yMuK9kp+1bGklm4E2GQyhIZOmKIaps+HjOpum2Cn46ymo4vxedSKzSa8FWAa/uHctvI
	xo/duG3oHqgxH/GuXJxIpIuMFY2wj7C59OObH584VBLd1Nrksjqqqok+mu1UymSRi018=;
Message-ID: <d313f39a-f5aa-4611-975e-bc64759bbd01@xen.org>
Date: Mon, 29 Jul 2024 19:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm: stack check instrumentation
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-4-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240729142421.137283-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 29/07/2024 15:24, Stewart Hildebrand wrote:
> Use the -finstrument-functions option to check that the stack pointer is

Is the feature supported by both clang and GCC? If so, which from versions?

 From README, this is what we currently support.

       - For ARM 32-bit:
         - GCC 4.9 or later
         - GNU Binutils 2.24 or later
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later

We don't mention Clang, but I would expect a clang from 4-5 years should 
still be Arm (not cross-compile as we never fully added the support).


> valid upon each function entry. Only enable it for debug builds due to
> the overhead introduced.

How much overhead is it? We use debug builds during the dev cycle, so we 
need to make sure this is not noticeable.

In any case, it would be better if this new option is under its own 
kconfig options. We can separately decide whether it is on or off by 
default when CONFIG_DEBUG=y.

> 
> Use per-cpu variables to store the stack base and nesting level. The
> nesting level is used to avoid invoking __cyg_profile_func_enter
> recursively.
> 
> A check is added for whether per-cpu data has been initialized. Since
> TPIDR_EL2 resets to an unknown value, initialize it to an invalid value.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> RFC: I only tested this on arm64. I still need to test with arm32.
> 
> RFC: Should we put this under its own config option instead of reusing
>       CONFIG_DEBUG?

See above.

> 
> RFC: Is there a better value for INVALID_PER_CPU_OFFSET? We can't use 0
>       because 0 is a valid value for get_per_cpu_offset().

I would consider to use ~0 because this is very unlikely to be used as 
an offset (at least on arm64).

> ---
>   xen/arch/arm/arch.mk             |  1 +
>   xen/arch/arm/arm64/head.S        |  4 +++
>   xen/arch/arm/domain.c            |  3 +++
>   xen/arch/arm/include/asm/page.h  |  2 ++
>   xen/arch/arm/include/asm/traps.h |  8 ++++++
>   xen/arch/arm/setup.c             |  4 +++
>   xen/arch/arm/smpboot.c           |  3 +++
>   xen/arch/arm/traps.c             | 45 ++++++++++++++++++++++++++++++++
>   8 files changed, 70 insertions(+)
> 
> diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
> index 022dcda19224..c39cb65d183d 100644
> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -12,6 +12,7 @@ CFLAGS-$(CONFIG_ARM_32) += -mno-unaligned-access
>   CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
>   CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
>   $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
> +CFLAGS-$(CONFIG_DEBUG) += -finstrument-functions
>   
>   ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
>       $(error You must use 'make menuconfig' to enable/disable early printk now)
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 2fa07dc3a04b..4a332b9cbc7c 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -399,6 +399,10 @@ FUNC_LOCAL(cpu_init)
>            * than SP_EL0.
>            */
>           msr spsel, #1
> +

I would add a comment explaining what we are doing.

> +        ldr   x0, =INVALID_PER_CPU_OFFSET
> +        msr   tpidr_el2, x0
> +
>           ret
>   END(cpu_init)
>   
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 7cfcefd27944..93ebe6e5f8af 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -26,6 +26,7 @@
>   #include <asm/procinfo.h>
>   #include <asm/regs.h>
>   #include <asm/tee/tee.h>
> +#include <asm/traps.h>
>   #include <asm/vfp.h>
>   #include <asm/vgic.h>
>   #include <asm/vtimer.h>
> @@ -328,6 +329,8 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
>   
>       set_current(next);
>   
> +    stack_set(next->arch.stack);
> +
>       prev = __context_switch(prev, next);
>   
>       schedule_tail(prev);
> diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
> index 69f817d1e68a..6b5aaf1eb3ff 100644
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -7,6 +7,8 @@
>   #include <asm/lpae.h>
>   #include <asm/sysregs.h>
>   
> +#define INVALID_PER_CPU_OFFSET            _AC(0x1, UL)
> +
>   /* Shareability values for the LPAE entries */
>   #define LPAE_SH_NON_SHAREABLE 0x0
>   #define LPAE_SH_UNPREDICTALE  0x1
> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
> index 9a60dbf70e5b..13e6997c2643 100644
> --- a/xen/arch/arm/include/asm/traps.h
> +++ b/xen/arch/arm/include/asm/traps.h
> @@ -118,6 +118,14 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>   
>   void finalize_instr_emulation(const struct instr_details *instr);
>   
> +#ifdef CONFIG_DEBUG
> +void stack_check_init(void);
> +void stack_set(unsigned char *base);
> +#else
> +static inline void stack_check_init(void) { }
> +static inline void stack_set(unsigned char *base) { }
> +#endif
> +
>   #endif /* __ASM_ARM_TRAPS__ */
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 0c2fdaceaf21..07d07feff602 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -47,6 +47,7 @@
>   #include <asm/setup.h>
>   #include <xsm/xsm.h>
>   #include <asm/acpi.h>
> +#include <asm/traps.h>
>   
>   struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
>   
> @@ -733,6 +734,8 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>       percpu_init_areas();
>       set_processor_id(0); /* needed early, for smp_processor_id() */
>   
> +    stack_check_init();
> +
>       /* Initialize traps early allow us to get backtrace when an error occurred */
>       init_traps();
>   
> @@ -924,6 +927,7 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>        * since the static one we're running on is about to be freed. */
>       memcpy(idle_vcpu[0]->arch.cpu_info, get_cpu_info(),
>              sizeof(struct cpu_info));
> +    stack_set(idle_vcpu[0]->arch.stack);
>       switch_stack_and_jump(idle_vcpu[0]->arch.cpu_info, init_done);
>   }
>   
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 04e363088d60..1c689f2caed7 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -30,6 +30,7 @@
>   #include <asm/psci.h>
>   #include <asm/acpi.h>
>   #include <asm/tee/tee.h>
> +#include <asm/traps.h>
>   
>   /* Override macros from asm/page.h to make them work with mfn_t */
>   #undef virt_to_mfn
> @@ -329,6 +330,8 @@ void asmlinkage start_secondary(void)
>   
>       set_processor_id(cpuid);
>   
> +    stack_check_init();
> +
>       identify_cpu(&current_cpu_data);
>       processor_setup();
>   
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index aac6c599f878..b4890eec7ec4 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2325,6 +2325,51 @@ void asmlinkage leave_hypervisor_to_guest(void)
>           arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
>   }
>   
> +#ifdef CONFIG_DEBUG

Loooking at the code below. Aside the stack pointer part, nothing seems 
specific to Arm. So maybe this could be moved to common code?

> +DEFINE_PER_CPU(unsigned int, stack_check_nesting);
> +DEFINE_PER_CPU(unsigned char *, stack_base);

I think this could be "const unsigned char *" as the stack should not be 
modified directly.

> +
> +void __attribute__((no_instrument_function)) stack_set(unsigned char *base)
> +{
> +    this_cpu(stack_base) = base;
> +}
> +
> +void __init __attribute__((no_instrument_function)) stack_check_init(void)
> +{
> +    this_cpu(stack_check_nesting) = 0;
> +    stack_set(init_data.stack);
> +}
> +
> +__attribute__((no_instrument_function))
> +void __cyg_profile_func_enter(void *this_fn, void *call_site)
> +{
> +    unsigned char *sp;
> +
> +    if ( get_per_cpu_offset() == INVALID_PER_CPU_OFFSET )
> +        return;
> +
> +    asm volatile ("mov %0, sp" : "=r" (sp) );
> +
> +    if ( sp < this_cpu(stack_base) ||
> +         sp > (this_cpu(stack_base) + STACK_SIZE) )

The top of the stack is used to store struct cpu_info. So you want to 
substract its size (see arch_vcpu_create()).

> +    {
> +        if ( this_cpu(stack_check_nesting) )
> +            return;
> +
> +        this_cpu(stack_check_nesting)++;

Looking at the use, it only seems to be used as "print/panic once". So 
maybe use a bool to avoid any overflow.

> +        printk("CPU %d stack pointer out of bounds (sp %#lx, stack base %#lx)\n",
> +               smp_processor_id(), (uintptr_t)sp,
> +               (uintptr_t)this_cpu(stack_base));
> +        BUG();

I would consider to call panic(). But is it safe to call any of this if 
we blew the stack? IOW, should we have a buffer?

Cheers,

-- 
Julien Grall

