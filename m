Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A7D941F32
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 20:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768048.1178792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYrGN-0007Pd-0K; Tue, 30 Jul 2024 18:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768048.1178792; Tue, 30 Jul 2024 18:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYrGM-0007O9-Tp; Tue, 30 Jul 2024 18:07:54 +0000
Received: by outflank-mailman (input) for mailman id 768048;
 Tue, 30 Jul 2024 18:07:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sYrGL-0007Nk-LF
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 18:07:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sYrGK-0002s5-RG; Tue, 30 Jul 2024 18:07:52 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sYrGK-0002Pk-KF; Tue, 30 Jul 2024 18:07:52 +0000
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
	bh=q+uEIXsYah8wV9Ej7qUYbl4VVaqhYo56k3Bk1ndEEJA=; b=a3d6Me8FxoErkTCsS06CI1CL6I
	M3rkw2224C7db9lJQFaeMwZTJwNmShJ1WZNaz1CNjxYy4st7ImuyYypUCHy0LDa1IwRit7vGgIwi9
	dnzcl6uaDx2sKjJUK1QIoxcixqV5eX0WHHSU6Izi656jS6clGvH2fLkYmD/yPLhbMpzI=;
Message-ID: <6a71cff1-feac-44cd-9233-9ed474e871e4@xen.org>
Date: Tue, 30 Jul 2024 19:07:50 +0100
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
 <d313f39a-f5aa-4611-975e-bc64759bbd01@xen.org>
 <23fe4756-4e5c-47f8-b9cc-101b7b8d116f@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <23fe4756-4e5c-47f8-b9cc-101b7b8d116f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 30/07/2024 18:50, Stewart Hildebrand wrote:
> On 7/29/24 14:36, Julien Grall wrote:
>> Hi Stewart,
>>
>> On 29/07/2024 15:24, Stewart Hildebrand wrote:
>>> Use the -finstrument-functions option to check that the stack pointer is
>>
>> Is the feature supported by both clang and GCC?
> 
> Yes, I tested both.
> 
>> If so, which from versions?
> 
> gcc since at least 1998, not sure what version specifically.
> 
> clang since v2.8 (2010)

That's quite old :). Thanks for checking.

>>
>> In any case, it would be better if this new option is under its own kconfig options. We can separately decide whether it is on or off by default when CONFIG_DEBUG=y.
> 
> Will do. Given the significant overhead when running on qemu, I think I
> must reluctantly suggest that it be off by default. For CI runs with
> real hardware, we could turn it on.

That makes sense.

>>> Use per-cpu variables to store the stack base and nesting level. The
>>> nesting level is used to avoid invoking __cyg_profile_func_enter
>>> recursively.
>>>
>>> A check is added for whether per-cpu data has been initialized. Since
>>> TPIDR_EL2 resets to an unknown value, initialize it to an invalid value.
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> ---
>>> RFC: I only tested this on arm64. I still need to test with arm32.
>>>
>>> RFC: Should we put this under its own config option instead of reusing
>>>        CONFIG_DEBUG?
>>
>> See above.
>>
>>>
>>> RFC: Is there a better value for INVALID_PER_CPU_OFFSET? We can't use 0
>>>        because 0 is a valid value for get_per_cpu_offset().
>>
>> I would consider to use ~0 because this is very unlikely to be used as an offset (at least on arm64).
> 
> Yep, ~0 works, will do.
> 
>>
>>> ---
>>>    xen/arch/arm/arch.mk             |  1 +
>>>    xen/arch/arm/arm64/head.S        |  4 +++
>>>    xen/arch/arm/domain.c            |  3 +++
>>>    xen/arch/arm/include/asm/page.h  |  2 ++
>>>    xen/arch/arm/include/asm/traps.h |  8 ++++++
>>>    xen/arch/arm/setup.c             |  4 +++
>>>    xen/arch/arm/smpboot.c           |  3 +++
>>>    xen/arch/arm/traps.c             | 45 ++++++++++++++++++++++++++++++++
>>>    8 files changed, 70 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
>>> index 022dcda19224..c39cb65d183d 100644
>>> --- a/xen/arch/arm/arch.mk
>>> +++ b/xen/arch/arm/arch.mk
>>> @@ -12,6 +12,7 @@ CFLAGS-$(CONFIG_ARM_32) += -mno-unaligned-access
>>>    CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
>>>    CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
>>>    $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
>>> +CFLAGS-$(CONFIG_DEBUG) += -finstrument-functions
>>>      ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
>>>        $(error You must use 'make menuconfig' to enable/disable early printk now)
>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>> index 2fa07dc3a04b..4a332b9cbc7c 100644
>>> --- a/xen/arch/arm/arm64/head.S
>>> +++ b/xen/arch/arm/arm64/head.S
>>> @@ -399,6 +399,10 @@ FUNC_LOCAL(cpu_init)
>>>             * than SP_EL0.
>>>             */
>>>            msr spsel, #1
>>> +
>>
>> I would add a comment explaining what we are doing.
> 
> Will do.
> 
>>
>>> +        ldr   x0, =INVALID_PER_CPU_OFFSET
>>> +        msr   tpidr_el2, x0
>>> +
>>>            ret
>>>    END(cpu_init)
>>>    diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 7cfcefd27944..93ebe6e5f8af 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -26,6 +26,7 @@
>>>    #include <asm/procinfo.h>
>>>    #include <asm/regs.h>
>>>    #include <asm/tee/tee.h>
>>> +#include <asm/traps.h>
>>>    #include <asm/vfp.h>
>>>    #include <asm/vgic.h>
>>>    #include <asm/vtimer.h>
>>> @@ -328,6 +329,8 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
>>>          set_current(next);
>>>    +    stack_set(next->arch.stack);
>>> +
>>>        prev = __context_switch(prev, next);
>>>          schedule_tail(prev);
>>> diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
>>> index 69f817d1e68a..6b5aaf1eb3ff 100644
>>> --- a/xen/arch/arm/include/asm/page.h
>>> +++ b/xen/arch/arm/include/asm/page.h
>>> @@ -7,6 +7,8 @@
>>>    #include <asm/lpae.h>
>>>    #include <asm/sysregs.h>
>>>    +#define INVALID_PER_CPU_OFFSET            _AC(0x1, UL)
>>> +
>>>    /* Shareability values for the LPAE entries */
>>>    #define LPAE_SH_NON_SHAREABLE 0x0
>>>    #define LPAE_SH_UNPREDICTALE  0x1
>>> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
>>> index 9a60dbf70e5b..13e6997c2643 100644
>>> --- a/xen/arch/arm/include/asm/traps.h
>>> +++ b/xen/arch/arm/include/asm/traps.h
>>> @@ -118,6 +118,14 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>>>      void finalize_instr_emulation(const struct instr_details *instr);
>>>    +#ifdef CONFIG_DEBUG
>>> +void stack_check_init(void);
>>> +void stack_set(unsigned char *base);
>>> +#else
>>> +static inline void stack_check_init(void) { }
>>> +static inline void stack_set(unsigned char *base) { }
>>> +#endif
>>> +
>>>    #endif /* __ASM_ARM_TRAPS__ */
>>>    /*
>>>     * Local variables:
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index 0c2fdaceaf21..07d07feff602 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -47,6 +47,7 @@
>>>    #include <asm/setup.h>
>>>    #include <xsm/xsm.h>
>>>    #include <asm/acpi.h>
>>> +#include <asm/traps.h>
>>>      struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
>>>    @@ -733,6 +734,8 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>>>        percpu_init_areas();
>>>        set_processor_id(0); /* needed early, for smp_processor_id() */
>>>    +    stack_check_init();
>>> +
>>>        /* Initialize traps early allow us to get backtrace when an error occurred */
>>>        init_traps();
>>>    @@ -924,6 +927,7 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>>>         * since the static one we're running on is about to be freed. */
>>>        memcpy(idle_vcpu[0]->arch.cpu_info, get_cpu_info(),
>>>               sizeof(struct cpu_info));
>>> +    stack_set(idle_vcpu[0]->arch.stack);
>>>        switch_stack_and_jump(idle_vcpu[0]->arch.cpu_info, init_done);
>>>    }
>>>    diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>>> index 04e363088d60..1c689f2caed7 100644
>>> --- a/xen/arch/arm/smpboot.c
>>> +++ b/xen/arch/arm/smpboot.c
>>> @@ -30,6 +30,7 @@
>>>    #include <asm/psci.h>
>>>    #include <asm/acpi.h>
>>>    #include <asm/tee/tee.h>
>>> +#include <asm/traps.h>
>>>      /* Override macros from asm/page.h to make them work with mfn_t */
>>>    #undef virt_to_mfn
>>> @@ -329,6 +330,8 @@ void asmlinkage start_secondary(void)
>>>          set_processor_id(cpuid);
>>>    +    stack_check_init();
>>> +
>>>        identify_cpu(&current_cpu_data);
>>>        processor_setup();
>>>    diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>>> index aac6c599f878..b4890eec7ec4 100644
>>> --- a/xen/arch/arm/traps.c
>>> +++ b/xen/arch/arm/traps.c
>>> @@ -2325,6 +2325,51 @@ void asmlinkage leave_hypervisor_to_guest(void)
>>>            arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
>>>    }
>>>    +#ifdef CONFIG_DEBUG
>>
>> Loooking at the code below. Aside the stack pointer part, nothing seems specific to Arm. So maybe this could be moved to common code?
> 
> Yes, I suppose so.
> 
>>
>>> +DEFINE_PER_CPU(unsigned int, stack_check_nesting);
>>> +DEFINE_PER_CPU(unsigned char *, stack_base);
>>
>> I think this could be "const unsigned char *" as the stack should not be modified directly.
> 
> Every time there's a vcpu context switch we will have a new stack.

I am not sure I follow. "const unsigned char *" should still allow you 
to update stack_base. It will just prevent anyone to try to write to 
modify the stack via stack_base.

> 
>>
>>> +
>>> +void __attribute__((no_instrument_function)) stack_set(unsigned char *base)
>>> +{
>>> +    this_cpu(stack_base) = base;
>>> +}
>>> +
>>> +void __init __attribute__((no_instrument_function)) stack_check_init(void)
>>> +{
>>> +    this_cpu(stack_check_nesting) = 0;
>>> +    stack_set(init_data.stack);
>>> +}
>>> +
>>> +__attribute__((no_instrument_function))
>>> +void __cyg_profile_func_enter(void *this_fn, void *call_site)
>>> +{
>>> +    unsigned char *sp;
>>> +
>>> +    if ( get_per_cpu_offset() == INVALID_PER_CPU_OFFSET )
>>> +        return;
>>> +
>>> +    asm volatile ("mov %0, sp" : "=r" (sp) );
>>> +
>>> +    if ( sp < this_cpu(stack_base) ||
>>> +         sp > (this_cpu(stack_base) + STACK_SIZE) )
>>
>> The top of the stack is used to store struct cpu_info. So you want to substract its size (see arch_vcpu_create()).
> 
> Will do.
> 
>>
>>> +    {
>>> +        if ( this_cpu(stack_check_nesting) )
>>> +            return;
>>> +
>>> +        this_cpu(stack_check_nesting)++;
>>
>> Looking at the use, it only seems to be used as "print/panic once". So maybe use a bool to avoid any overflow.
> 
> It will only ever be incremented once. I'll still change it to a bool,
> this should make it more obvious.
> 
>>
>>> +        printk("CPU %d stack pointer out of bounds (sp %#lx, stack base %#lx)\n",
>>> +               smp_processor_id(), (uintptr_t)sp,
>>> +               (uintptr_t)this_cpu(stack_base));
>>> +        BUG();
>>
>> I would consider to call panic().
> 
> panic() alone doesn't show the stack trace / call trace.

Ah good point. But TBH, I have never really understood why panic() 
didn't return a call stack. There are a few places where I found 
beneficial when debugging.

Anyway, I guess this could be handled separately.

> 
>> But is it safe to call any of this if we blew the stack?
> 
> Nope, it sure isn't!
> 
>> IOW, should we have a buffer?
> 
> Yes. After some experimentation, I found that this printk and a WARN
> (similar to BUG, but resumes execution and allows me to collect these
> metrics) uses approximately 1632 bytes of stack. Assuming BUG uses a
> similar amount of stack as WARN, and adding in a comfortable margin for
> error, I'll add a 4096 byte buffer (i.e. invoke the print/BUG with 4096
> bytes remaining on the stack).

AFAICT, the stack on Arm is 32KB. So we 1/8 of the stack as a buffer. Do 
you know the current stack use in a normal setup (e.g. boot a guest)?

Anyway, so long the feature is not enabled in production, then it might 
be ok to steal 4KB. We could increase the stack if we see any issue.

Cheers,

-- 
Julien Grall


