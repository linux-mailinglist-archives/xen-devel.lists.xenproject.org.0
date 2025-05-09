Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D016AB0CF2
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 10:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979842.1366342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDIwr-0005lA-4g; Fri, 09 May 2025 08:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979842.1366342; Fri, 09 May 2025 08:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDIwr-0005i8-1h; Fri, 09 May 2025 08:19:13 +0000
Received: by outflank-mailman (input) for mailman id 979842;
 Fri, 09 May 2025 08:19:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i8t3=XZ=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1uDIwp-0005i2-Du
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 08:19:11 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44a13235-2cae-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 10:19:05 +0200 (CEST)
Received: from [192.168.7.202] ([71.202.166.45]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5498IM5Q087553
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 9 May 2025 01:18:25 -0700
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
X-Inumbo-ID: 44a13235-2cae-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5498IM5Q087553
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746778708;
	bh=h8xQ3dgrnLnpM7heAICu789e0KZ7o9GKFoLnqD2Ak6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H06izGtqodA/ZhRkaC/Y9J6N3nu/0IPTNamUaGK0yzrLzta0+wqLYOzV79Kjzmeaw
	 cCu154HR3BnmtEEeqUenT1B2DovOmTGm9kDXJOkx1qY8+A16Bt0hDRBo9TzZCBzzkF
	 wNmI0pMmY1/uf5kgDHNiUVLGhlXM8MJyu+UB7SJb7RujLcpVwjNKEqVnD/G390uBVW
	 OEqb7d6mxryKHALG9MSIIa/gTeoxSRMKrH5PB8/oROFTZTT4bvEpg80rKOadov8R3P
	 dl2j9BfmQV09b0WqlslSTOAprseR9/ATMNjETxQH9yHJi9UemV6cVEkq2Kaeaq6Shw
	 D5DNZgL06ka8w==
Message-ID: <722f5b30-20e9-4540-98e4-d211d7c44cbe@zytor.com>
Date: Fri, 9 May 2025 01:18:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/paravirt: Switch MSR access pv_ops functions to
 instruction interfaces
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org, virtualization@lists.linux.dev
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
        Alexey Makhalov <alexey.amakhalov@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org
References: <20250506092015.1849-1-jgross@suse.com>
 <20250506092015.1849-6-jgross@suse.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <20250506092015.1849-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/2025 2:20 AM, Juergen Gross wrote:
> Instead of having callback functions for rdmsr/wrmsr on native, switch
> to inline the respective instructions directly in order to avoid
> overhead with the call interface.

To me, this is a beneficial addition to the existing pvops MSR code.

> 
> This requires to use the instruction interfaces for rdmsr/wrmsr
> emulation when running as a Xen PV guest.
> 
> In order to prepare support for the immediate forms of RDMSR and WRMSR
> when not running as a Xen PV guest, use the RDMSR and WRMSR
> instructions as the fallback case instead of ALT_CALL_INSTR.

I'm trying to evaluate how to add the immediate form MSR instructions
on top of this patch set.  And I'm close to get it done.

> 
> Note that in the Xen PV case the RDMSR/WRMSR patching must not happen
> even as an intermediate step, as this would clobber the indirect call
> information needed when patching in the direct call for the Xen case.

Good point!


Deciding whether to retain the pvops MSR API is the responsibility of
the x86 maintainers, who are the ones experiencing the challenges of 
maintaining the code.

tglx said @https://lore.kernel.org/lkml/87y1h81ht4.ffs@tglx/:

 > I fundamentaly hate adding this to the PV infrastructure. We don't
 > want more PV ops, quite the contrary.

That is the reason I took a different direction, i.e., removing the
pvops MSR APIs.  But if your approach is cleaner, they may prefer it.

> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
> index a463c747c780..df10b0e4f7b8 100644
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -175,24 +175,72 @@ static inline void __write_cr4(unsigned long x)
>   	PVOP_VCALL1(cpu.write_cr4, x);
>   }
>   
> -static inline u64 paravirt_read_msr(u32 msr)
> +static __always_inline u64 paravirt_read_msr(u32 msr)
>   {
> -	return PVOP_CALL1(u64, cpu.read_msr, msr);
> +	EAX_EDX_DECLARE_ARGS(val, low, high);

This is under CONFIG_PARAVIRT_XXL, thus CONFIG_XEN_PV and CONFIG_X86_64,
therefore we don't need to consider 32-bit at all, no?

> +
> +	PVOP_TEST_NULL(cpu.read_msr);
> +	asm volatile("1: "ALTERNATIVE_2(PARAVIRT_CALL,
> +					"rdmsr", ALT_NOT_XEN,
> +					ALT_CALL_INSTR, ALT_XENPV_CALL)
> +		     "2:\n"
> +		     _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_RDMSR)
> +		     : EAX_EDX_RET(val, low, high), ASM_CALL_CONSTRAINT
> +		     : paravirt_ptr(cpu.read_msr), "c" (msr));
> +
> +	return EAX_EDX_VAL(val, low, high);
>   }
>   
> -static inline void paravirt_write_msr(u32 msr, u64 val)
> +static __always_inline void paravirt_write_msr(u32 msr, u64 val)
>   {
> -	PVOP_VCALL2(cpu.write_msr, msr, val);
> +	PVOP_TEST_NULL(cpu.write_msr);
> +	asm volatile("1: "ALTERNATIVE_2(PARAVIRT_CALL,
> +					"wrmsr", ALT_NOT_XEN,
> +					ALT_CALL_INSTR, ALT_XENPV_CALL)
> +		      "2:\n"
> +		      _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR)
> +		      : ASM_CALL_CONSTRAINT
> +		      : paravirt_ptr(cpu.write_msr),
> +			  "c" (msr), "a" ((u32)val), "d" ((u32)(val >> 32))
> +		      : "memory");
>   }
>   
> -static inline int paravirt_read_msr_safe(u32 msr, u64 *val)
> +static __always_inline int paravirt_read_msr_safe(u32 msr, u64 *p)
>   {
> -	return PVOP_CALL2(int, cpu.read_msr_safe, msr, val);
> +	int err;
> +	EAX_EDX_DECLARE_ARGS(val, low, high);
> +
> +	PVOP_TEST_NULL(cpu.read_msr_safe);
> +	asm volatile("1: "ALTERNATIVE_2(PARAVIRT_CALL,
> +					"rdmsr; xor %[err],%[err]", ALT_NOT_XEN,
> +					ALT_CALL_INSTR, ALT_XENPV_CALL)
> +		     "2:\n"
> +		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %[err])
> +		     : [err] "=c" (err), EAX_EDX_RET(val, low, high),
> +		       ASM_CALL_CONSTRAINT
> +		     : paravirt_ptr(cpu.read_msr_safe), "0" (msr));
> +
> +	*p = EAX_EDX_VAL(val, low, high);
> +
> +	return err;
>   }
>   
> -static inline int paravirt_write_msr_safe(u32 msr, u64 val)
> +static __always_inline int paravirt_write_msr_safe(u32 msr, u64 val)
>   {
> -	return PVOP_CALL2(int, cpu.write_msr_safe, msr, val);
> +	int err;
> +
> +	PVOP_TEST_NULL(cpu.write_msr_safe);
> +	asm volatile("1: "ALTERNATIVE_2(PARAVIRT_CALL,
> +					"wrmsr; xor %[err],%[err]", ALT_NOT_XEN,
> +					ALT_CALL_INSTR, ALT_XENPV_CALL)
> +		     "2:\n"
> +		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_WRMSR_SAFE, %[err])
> +		     : [err] "=a" (err), ASM_CALL_CONSTRAINT
> +		     : paravirt_ptr(cpu.write_msr_safe),
> +		       "c" (msr), "0" ((u32)val), "d" ((u32)(val >> 32))
> +		     : "memory");
> +
> +	return err;
>   }
>   
>   static __always_inline u64 read_msr(u32 msr)
> @@ -573,27 +621,43 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
>   #define PV_SAVE_ALL_CALLER_REGS		"pushl %ecx;"
>   #define PV_RESTORE_ALL_CALLER_REGS	"popl  %ecx;"
>   #else
> +/* save and restore caller-save registers, except %rax, %rcx and %rdx. */
> +#define PV_SAVE_COMMON_CALLER_REGS	\
> +	"push %rsi;"			\
> +	"push %rdi;"			\
> +	"push %r8;"			\
> +	"push %r9;"			\
> +	"push %r10;"			\
> +	"push %r11;"

Add an empty line please, easier to read.

> +#define PV_RESTORE_COMMON_CALLER_REGS	\
> +	"pop %r11;"			\
> +	"pop %r10;"			\
> +	"pop %r9;"			\
> +	"pop %r8;"			\
> +	"pop %rdi;"			\
> +	"pop %rsi;"
> +
> +#define PV_PROLOGUE_MSR(func)		\
> +	PV_SAVE_COMMON_CALLER_REGS	\
> +	PV_PROLOGUE_MSR_##func

Ditto.  And the following similar cases.

> +#define PV_EPILOGUE_MSR(func)		\
> +	PV_EPILOGUE_MSR_##func		\
> +	PV_RESTORE_COMMON_CALLER_REGS
> +
>   /* save and restore all caller-save registers, except return value */
>   #define PV_SAVE_ALL_CALLER_REGS						\
>   	"push %rcx;"							\
>   	"push %rdx;"							\
> -	"push %rsi;"							\
> -	"push %rdi;"							\
> -	"push %r8;"							\
> -	"push %r9;"							\
> -	"push %r10;"							\
> -	"push %r11;"
> +	PV_SAVE_COMMON_CALLER_REGS
>   #define PV_RESTORE_ALL_CALLER_REGS					\
> -	"pop %r11;"							\
> -	"pop %r10;"							\
> -	"pop %r9;"							\
> -	"pop %r8;"							\
> -	"pop %rdi;"							\
> -	"pop %rsi;"							\
> +	PV_RESTORE_COMMON_CALLER_REGS					\
>   	"pop %rdx;"							\
>   	"pop %rcx;"
>   #endif
>   
> +#define PV_PROLOGUE_ALL(func)	PV_SAVE_ALL_CALLER_REGS
> +#define PV_EPILOGUE_ALL(func)	PV_RESTORE_ALL_CALLER_REGS
> +
>   /*
>    * Generate a thunk around a function which saves all caller-save
>    * registers except for the return value.  This allows C functions to
> @@ -607,7 +671,7 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
>    * functions.
>    */
>   #define PV_THUNK_NAME(func) "__raw_callee_save_" #func
> -#define __PV_CALLEE_SAVE_REGS_THUNK(func, section)			\
> +#define __PV_CALLEE_SAVE_REGS_THUNK(func, section, helper)		\
>   	extern typeof(func) __raw_callee_save_##func;			\
>   									\
>   	asm(".pushsection " section ", \"ax\";"				\
> @@ -617,16 +681,18 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
>   	    PV_THUNK_NAME(func) ":"					\
>   	    ASM_ENDBR							\
>   	    FRAME_BEGIN							\
> -	    PV_SAVE_ALL_CALLER_REGS					\
> +	    PV_PROLOGUE_##helper(func)					\
>   	    "call " #func ";"						\
> -	    PV_RESTORE_ALL_CALLER_REGS					\
> +	    PV_EPILOGUE_##helper(func)					\
>   	    FRAME_END							\
>   	    ASM_RET							\
>   	    ".size " PV_THUNK_NAME(func) ", .-" PV_THUNK_NAME(func) ";"	\
>   	    ".popsection")
>   
>   #define PV_CALLEE_SAVE_REGS_THUNK(func)			\
> -	__PV_CALLEE_SAVE_REGS_THUNK(func, ".text")
> +	__PV_CALLEE_SAVE_REGS_THUNK(func, ".text", ALL)
> +#define PV_CALLEE_SAVE_REGS_MSR_THUNK(func)		\
> +	__PV_CALLEE_SAVE_REGS_THUNK(func, ".text", MSR)
>   
>   /* Get a reference to a callee-save function */
>   #define PV_CALLEE_SAVE(func)						\
> diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
> index b08b9d3122d6..f7f879319e90 100644
> --- a/arch/x86/include/asm/paravirt_types.h
> +++ b/arch/x86/include/asm/paravirt_types.h
> @@ -91,15 +91,15 @@ struct pv_cpu_ops {
>   		      unsigned int *ecx, unsigned int *edx);
>   
>   	/* Unsafe MSR operations.  These will warn or panic on failure. */
> -	u64 (*read_msr)(u32 msr);
> -	void (*write_msr)(u32 msr, u64 val);
> +	struct paravirt_callee_save read_msr;
> +	struct paravirt_callee_save write_msr;
>   
>   	/*
>   	 * Safe MSR operations.
>   	 * Returns 0 or -EIO.
>   	 */
> -	int (*read_msr_safe)(u32 msr, u64 *val);
> -	int (*write_msr_safe)(u32 msr, u64 val);
> +	struct paravirt_callee_save read_msr_safe;
> +	struct paravirt_callee_save write_msr_safe;
>   
>   	u64 (*read_pmc)(int counter);
>   
> @@ -520,6 +520,10 @@ unsigned long pv_native_save_fl(void);
>   void pv_native_irq_disable(void);
>   void pv_native_irq_enable(void);
>   unsigned long pv_native_read_cr2(void);
> +void pv_native_rdmsr(void);
> +void pv_native_wrmsr(void);
> +void pv_native_rdmsr_safe(void);
> +void pv_native_wrmsr_safe(void);
>   #endif
>   
>   #define paravirt_nop	((void *)nop_func)
> @@ -527,6 +531,7 @@ unsigned long pv_native_read_cr2(void);
>   #endif	/* __ASSEMBLER__ */
>   
>   #define ALT_NOT_XEN	ALT_NOT(X86_FEATURE_XENPV)
> +#define ALT_XENPV_CALL	ALT_DIRECT_CALL(X86_FEATURE_XENPV)
>   
>   #endif  /* CONFIG_PARAVIRT */
>   #endif	/* _ASM_X86_PARAVIRT_TYPES_H */
> diff --git a/arch/x86/include/asm/qspinlock_paravirt.h b/arch/x86/include/asm/qspinlock_paravirt.h
> index 0a985784be9b..0351acb5a143 100644
> --- a/arch/x86/include/asm/qspinlock_paravirt.h
> +++ b/arch/x86/include/asm/qspinlock_paravirt.h
> @@ -14,7 +14,8 @@ void __lockfunc __pv_queued_spin_unlock_slowpath(struct qspinlock *lock, u8 lock
>    */
>   #ifdef CONFIG_64BIT
>   
> -__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock_slowpath, ".spinlock.text");
> +__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock_slowpath, ".spinlock.text",
> +			    ALL);
>   #define __pv_queued_spin_unlock	__pv_queued_spin_unlock
>   
>   /*
> @@ -61,7 +62,7 @@ DEFINE_ASM_FUNC(__raw_callee_save___pv_queued_spin_unlock,
>   #else /* CONFIG_64BIT */
>   
>   extern void __lockfunc __pv_queued_spin_unlock(struct qspinlock *lock);
> -__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock, ".spinlock.text");
> +__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock, ".spinlock.text", ALL);
>   
>   #endif /* CONFIG_64BIT */
>   #endif
> diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
> index 015bf298434f..ff7d7fdae360 100644
> --- a/arch/x86/kernel/paravirt.c
> +++ b/arch/x86/kernel/paravirt.c
> @@ -50,6 +50,24 @@ DEFINE_ASM_FUNC(pv_native_save_fl, "pushf; pop %rax", .noinstr.text);
>   DEFINE_ASM_FUNC(pv_native_irq_disable, "cli", .noinstr.text);
>   DEFINE_ASM_FUNC(pv_native_irq_enable, "sti", .noinstr.text);
>   DEFINE_ASM_FUNC(pv_native_read_cr2, "mov %cr2, %rax", .noinstr.text);
> +DEFINE_ASM_FUNC(pv_native_rdmsr,
> +		"1: rdmsr\n"
> +		"2:\n"
> +		_ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_RDMSR), .noinstr.text);
> +DEFINE_ASM_FUNC(pv_native_wrmsr,
> +		"1: wrmsr\n"
> +		"2:\n"
> +		_ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR), .noinstr.text);
> +DEFINE_ASM_FUNC(pv_native_rdmsr_safe,
> +		"1: rdmsr; xor %ecx, %ecx\n"
> +		"2:\n"
> +		_ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %%ecx),
> +		.noinstr.text);
> +DEFINE_ASM_FUNC(pv_native_wrmsr_safe,
> +		"1: wrmsr; xor %eax, %eax\n"
> +		"2:\n"
> +		_ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_WRMSR_SAFE, %%eax),
> +		.noinstr.text);
>   #endif
>   
>   DEFINE_STATIC_KEY_FALSE(virt_spin_lock_key);
> @@ -129,10 +147,10 @@ struct paravirt_patch_template pv_ops = {
>   	.cpu.read_cr0		= native_read_cr0,
>   	.cpu.write_cr0		= native_write_cr0,
>   	.cpu.write_cr4		= native_write_cr4,
> -	.cpu.read_msr		= native_read_msr,
> -	.cpu.write_msr		= native_write_msr,
> -	.cpu.read_msr_safe	= native_read_msr_safe,
> -	.cpu.write_msr_safe	= native_write_msr_safe,
> +	.cpu.read_msr		= __PV_IS_CALLEE_SAVE(pv_native_rdmsr),
> +	.cpu.write_msr		= __PV_IS_CALLEE_SAVE(pv_native_wrmsr),
> +	.cpu.read_msr_safe	= __PV_IS_CALLEE_SAVE(pv_native_rdmsr_safe),
> +	.cpu.write_msr_safe	= __PV_IS_CALLEE_SAVE(pv_native_wrmsr_safe),
>   	.cpu.read_pmc		= native_read_pmc,
>   	.cpu.load_tr_desc	= native_load_tr_desc,
>   	.cpu.set_ldt		= native_set_ldt,
> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 3be38350f044..c279b2bef7eb 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -1160,36 +1160,66 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
>   	}
>   }
>   
> -static int xen_read_msr_safe(u32 msr, u64 *val)
> -{
> +/*
> + * Prototypes for functions called via PV_CALLEE_SAVE_REGS_THUNK() in order
> + * to avoid warnings with "-Wmissing-prototypes".
> + */
> +struct xen_rdmsr_safe_ret {
> +	u64 val;
>   	int err;
> +};
> +struct xen_rdmsr_safe_ret xen_read_msr_safe(u32 msr);
> +int xen_write_msr_safe(u32 msr, u32 low, u32 high);
> +u64 xen_read_msr(u32 msr);
> +void xen_write_msr(u32 msr, u32 low, u32 high);
>   
> -	*val = xen_do_read_msr(msr, &err);
> -	return err;
> +__visible struct xen_rdmsr_safe_ret xen_read_msr_safe(u32 msr)
> +{
> +	struct xen_rdmsr_safe_ret ret;

struct xen_rdmsr_safe_ret ret = { 0, 0 };

Because the 'err' member may not be set in xen_do_read_msr().

> +
> +	ret.val = xen_do_read_msr(msr, &ret.err);
> +	return ret;
>   }
> +#define PV_PROLOGUE_MSR_xen_read_msr_safe	"mov %ecx, %edi;"
> +#define PV_EPILOGUE_MSR_xen_read_msr_safe	\
> +	"mov %edx, %ecx; mov %rax, %rdx; mov %eax, %eax; shr $0x20, %rdx;"
> +PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_read_msr_safe);
>   
> -static int xen_write_msr_safe(u32 msr, u64 val)
> +__visible int xen_write_msr_safe(u32 msr, u32 low, u32 high)

I think we can avoid splitting this u64 into two u32.

>   {
>   	int err = 0;
>   
> -	xen_do_write_msr(msr, val, &err);
> +	xen_do_write_msr(msr, (u64)high << 32 | low, &err);
>   
>   	return err;
>   }
> +#define PV_PROLOGUE_MSR_xen_write_msr_safe	\
> +	"mov %ecx, %edi; mov %eax, %esi;"
> +#define PV_EPILOGUE_MSR_xen_write_msr_safe
> +PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_write_msr_safe);
>   
> -static u64 xen_read_msr(u32 msr)
> +__visible u64 xen_read_msr(u32 msr)
>   {
>   	int err;
>   
>   	return xen_do_read_msr(msr, xen_msr_safe ? &err : NULL);
>   }
> +#define PV_PROLOGUE_MSR_xen_read_msr	"mov %ecx, %edi;"
> +#define PV_EPILOGUE_MSR_xen_read_msr	\
> +	"mov %rax, %rdx; mov %eax, %eax; shr $0x20, %rdx;"
> +PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_read_msr);
>   
> -static void xen_write_msr(u32 msr, u64 val)
> +__visible void xen_write_msr(u32 msr, u32 low, u32 high)

Ditto.

>   {
>   	int err;
>   
> -	xen_do_write_msr(msr, val, xen_msr_safe ? &err : NULL);
> +	xen_do_write_msr(msr, (u64)high << 32 | low,
> +			 xen_msr_safe ? &err : NULL);
>   }
> +#define PV_PROLOGUE_MSR_xen_write_msr	\
> +	"mov %ecx, %edi; mov %eax, %esi;"
> +#define PV_EPILOGUE_MSR_xen_write_msr
> +PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_write_msr);
>   
>   /* This is called once we have the cpu_possible_mask */
>   void __init xen_setup_vcpu_info_placement(void)

