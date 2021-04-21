Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D87D367308
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 21:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114914.219055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZI7U-0000mh-UV; Wed, 21 Apr 2021 19:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114914.219055; Wed, 21 Apr 2021 19:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZI7U-0000mI-RK; Wed, 21 Apr 2021 19:02:40 +0000
Received: by outflank-mailman (input) for mailman id 114914;
 Wed, 21 Apr 2021 19:02:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZI7U-0000mD-6T
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 19:02:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZI7S-0006Su-KC; Wed, 21 Apr 2021 19:02:38 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZI7S-0005z7-3J; Wed, 21 Apr 2021 19:02:38 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=zbYb2MMFQda8mBCHgXMTPStoVFtw59LQcqjF0a13878=; b=peqOqCknMb9pr11dv064Fy3KIX
	2KHenC8c4u5fAfhAexHbVrmo64bWNCK3dSZ862RZy85H1VsTOY3zVd/W9Bx4MkdDcYu98WlTCKXPu
	YeG98YGuG8F4L6GoyLOWnEWAcYd9vWc8vWfLoMW1ffjo8RT9YSQhNvfn44tHOB+7XHw8=;
Subject: Re: [PATCH 8/9] arm: Change type of hsr to register_t
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-9-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ce44efef-db10-b000-3a11-46fbfdf4ccbb@xen.org>
Date: Wed, 21 Apr 2021 20:02:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210420070853.8918-9-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 20/04/2021 08:08, Michal Orzel wrote:
> AArch64 system registers are 64bit whereas AArch32 ones
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 sysregs have upper 32bit reserved
> it does not mean that they can't be widen in the future.
> 
> Modify type of hsr to register_t.
> When on AArch64 add 32bit RES0 members to structures inside hsr union.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/arch/arm/arm64/entry.S            |  2 +-
>   xen/arch/arm/arm64/traps.c            |  2 +-
>   xen/arch/arm/arm64/vsysreg.c          |  3 ++-
>   xen/arch/arm/traps.c                  | 20 +++++++++-------
>   xen/arch/arm/vcpreg.c                 | 13 +++++-----
>   xen/include/asm-arm/arm32/processor.h |  2 +-
>   xen/include/asm-arm/arm64/processor.h |  5 ++--
>   xen/include/asm-arm/hsr.h             | 34 ++++++++++++++++++++++++++-
>   8 files changed, 59 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> index ab9a65fc14..218b063c97 100644
> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -155,7 +155,7 @@
>           add     x21, sp, #UREGS_CPSR
>           mrs     x22, spsr_el2
>           mrs     x23, esr_el2
> -        stp     w22, w23, [x21]
> +        stp     x22, x23, [x21]
>   
>           .endm
>   
> diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
> index babfc1d884..9113a15c7a 100644
> --- a/xen/arch/arm/arm64/traps.c
> +++ b/xen/arch/arm/arm64/traps.c
> @@ -36,7 +36,7 @@ void do_bad_mode(struct cpu_user_regs *regs, int reason)
>       union hsr hsr = { .bits = regs->hsr };
>   
>       printk("Bad mode in %s handler detected\n", handler[reason]);
> -    printk("ESR=0x%08"PRIx32":  EC=%"PRIx32", IL=%"PRIx32", ISS=%"PRIx32"\n",
> +    printk("ESR=%#"PRIregister":  EC=%"PRIx32", IL=%"PRIx32", ISS=%"PRIx32"\n",
>              hsr.bits, hsr.ec, hsr.len, hsr.iss);
>   
>       local_irq_disable();
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index 41f18612c6..3c10d464e7 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -368,7 +368,8 @@ void do_sysreg(struct cpu_user_regs *regs,
>                        sysreg.op2,
>                        sysreg.read ? "=>" : "<=",
>                        sysreg.reg, regs->pc);
> -            gdprintk(XENLOG_ERR, "unhandled 64-bit sysreg access %#x\n",
> +            gdprintk(XENLOG_ERR, "unhandled 64-bit sysreg access"
> +                     " %#"PRIregister"\n",
>                        hsr.bits & HSR_SYSREG_REGS_MASK);
>               inject_undef_exception(regs, hsr);
>               return;
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index e7384381cc..db15a2c647 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -546,7 +546,7 @@ void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len)
>           PSR_IRQ_MASK | PSR_DBG_MASK;
>       regs->pc = handler;
>   
> -    WRITE_SYSREG32(esr.bits, ESR_EL1);
> +    WRITE_SYSREG(esr.bits, ESR_EL1);
>   }
>   
>   /* Inject an abort exception into a 64 bit guest */
> @@ -580,7 +580,7 @@ static void inject_abt64_exception(struct cpu_user_regs *regs,
>       regs->pc = handler;
>   
>       WRITE_SYSREG(addr, FAR_EL1);
> -    WRITE_SYSREG32(esr.bits, ESR_EL1);
> +    WRITE_SYSREG(esr.bits, ESR_EL1);
>   }
>   
>   static void inject_dabt64_exception(struct cpu_user_regs *regs,
> @@ -919,7 +919,7 @@ static void _show_registers(const struct cpu_user_regs *regs,
>       printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
>       printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
>       printk("\n");
> -    printk("   ESR_EL2: %08"PRIx32"\n", regs->hsr);
> +    printk("   ESR_EL2: %"PRIregister"\n", regs->hsr);
>       printk(" HPFAR_EL2: %"PRIregister"\n", READ_SYSREG(HPFAR_EL2));
>   
>   #ifdef CONFIG_ARM_32
> @@ -2004,13 +2004,15 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>   
>           break;
>       default:
> -        gprintk(XENLOG_WARNING, "Unsupported FSC: HSR=%#x DFSC=%#x\n",
> +        gprintk(XENLOG_WARNING, "Unsupported FSC:"
> +                " HSR=%#"PRIregister" DFSC=%#x\n",

Please don't split the message in two. This makes more difficult to grep 
bits of the message in the log.

Instead the code should be:

gprintk(XENLOG_WARNING,
         "mystring",
         ...);

For this case, we are tolerated to go past the 80 characters mark.

>                   hsr.bits, xabt.fsc);
>       }
>   
>   inject_abt:
> -    gdprintk(XENLOG_DEBUG, "HSR=0x%x pc=%#"PRIregister" gva=%#"PRIvaddr
> -             " gpa=%#"PRIpaddr"\n", hsr.bits, regs->pc, gva, gpa);
> +    gdprintk(XENLOG_DEBUG, "HSR=%#"PRIregister" pc=%#"PRIregister""
> +             " gva=%#"PRIvaddr" gpa=%#"PRIpaddr"\n",

Same here.

> +             hsr.bits, regs->pc, gva, gpa);
>       if ( is_data )
>           inject_dabt_exception(regs, gva, hsr.len);
>       else
> @@ -2204,7 +2206,8 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
>   
>       default:
>           gprintk(XENLOG_WARNING,
> -                "Unknown Guest Trap. HSR=0x%x EC=0x%x IL=%x Syndrome=0x%"PRIx32"\n",
> +                "Unknown Guest Trap. HSR=%#"PRIregister" EC=0x%x IL=%x"
> +                " Syndrome=0x%"PRIx32"\n",

Same here.

>                   hsr.bits, hsr.ec, hsr.len, hsr.iss);
>           inject_undef_exception(regs, hsr);
>       }
> @@ -2242,7 +2245,8 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
>           break;
>       }
>       default:
> -        printk("Hypervisor Trap. HSR=0x%x EC=0x%x IL=%x Syndrome=0x%"PRIx32"\n",
> +        printk("Hypervisor Trap. HSR=%#"PRIregister" EC=0x%x IL=%x"
> +               " Syndrome=0x%"PRIx32"\n",

Same here.

>                  hsr.bits, hsr.ec, hsr.len, hsr.iss);
>           do_unexpected_trap("Hypervisor", regs);
>       }
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index 55351fc087..c7f516ee0a 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -385,7 +385,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>                    "%s p15, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
>                    cp32.read ? "mrc" : "mcr",
>                    cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
> -        gdprintk(XENLOG_ERR, "unhandled 32-bit CP15 access %#x\n",
> +        gdprintk(XENLOG_ERR, "unhandled 32-bit CP15 access %#"PRIregister"\n",
>                    hsr.bits & HSR_CP32_REGS_MASK);
>           inject_undef_exception(regs, hsr);
>           return;
> @@ -454,7 +454,8 @@ void do_cp15_64(struct cpu_user_regs *regs, const union hsr hsr)
>                        "%s p15, %d, r%d, r%d, cr%d @ 0x%"PRIregister"\n",
>                        cp64.read ? "mrrc" : "mcrr",
>                        cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs->pc);
> -            gdprintk(XENLOG_ERR, "unhandled 64-bit CP15 access %#x\n",
> +            gdprintk(XENLOG_ERR, "unhandled 64-bit CP15 access" > +                     " %#"PRIregister"\n",

Same here.

>                        hsr.bits & HSR_CP64_REGS_MASK);
>               inject_undef_exception(regs, hsr);
>               return;
> @@ -585,7 +586,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>                    "%s p14, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
>                     cp32.read ? "mrc" : "mcr",
>                     cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
> -        gdprintk(XENLOG_ERR, "unhandled 32-bit cp14 access %#x\n",
> +        gdprintk(XENLOG_ERR, "unhandled 32-bit cp14 access %#"PRIregister"\n",
>                    hsr.bits & HSR_CP32_REGS_MASK);
>           inject_undef_exception(regs, hsr);
>           return;
> @@ -627,7 +628,7 @@ void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr)
>                "%s p14, %d, r%d, r%d, cr%d @ 0x%"PRIregister"\n",
>                cp64.read ? "mrrc" : "mcrr",
>                cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs->pc);
> -    gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 access %#x\n",
> +    gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 access %#"PRIregister"\n",
>                hsr.bits & HSR_CP64_REGS_MASK);
>       inject_undef_exception(regs, hsr);
>   }
> @@ -658,7 +659,7 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
>                "%s p14, %d, r%d, r%d, cr%d @ 0x%"PRIregister"\n",
>                cp64.read ? "mrrc" : "mcrr",
>                cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs->pc);
> -    gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 DBG access %#x\n",
> +    gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 DBG access %#"PRIregister"\n",
>                hsr.bits & HSR_CP64_REGS_MASK);
>   
>       inject_undef_exception(regs, hsr);
> @@ -692,7 +693,7 @@ void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
>                    "%s p10, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
>                    cp32.read ? "mrc" : "mcr",
>                    cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
> -        gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#x\n",
> +        gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#"PRIregister"\n",
>                    hsr.bits & HSR_CP32_REGS_MASK);
>           inject_undef_exception(regs, hsr);
>           return;
> diff --git a/xen/include/asm-arm/arm32/processor.h b/xen/include/asm-arm/arm32/processor.h
> index 4e679f3273..395ce10692 100644
> --- a/xen/include/asm-arm/arm32/processor.h
> +++ b/xen/include/asm-arm/arm32/processor.h
> @@ -37,7 +37,7 @@ struct cpu_user_regs
>           uint32_t pc, pc32;
>       };
>       uint32_t cpsr; /* Return mode */
> -    uint32_t hsr;  /* Exception Syndrome */
> +    register_t hsr;  /* Exception Syndrome */

I would rather keep this one as uint32_t to stay consistent with the 
rest of the structure. If you still want to switch it, then please 
switch everything in cpu_user_regs.

>   
>       /* Outer guest frame only from here on... */
>   
> diff --git a/xen/include/asm-arm/arm64/processor.h b/xen/include/asm-arm/arm64/processor.h
> index 81dfc5e615..40f628d216 100644
> --- a/xen/include/asm-arm/arm64/processor.h
> +++ b/xen/include/asm-arm/arm64/processor.h
> @@ -64,8 +64,9 @@ struct cpu_user_regs
>       /* Return address and mode */
>       __DECL_REG(pc,           pc32);             /* ELR_EL2 */
>       uint32_t cpsr;                              /* SPSR_EL2 */

Above you use an STP instructions that will write 2 64-bit values: one 
in CPSR, the other in HSR.

So this wants to be switched to uint64_t. I guess you didn't notice any 
issue because there will thankfully be an implicit padding.

> -    uint32_t hsr;                               /* ESR_EL2 */
> +    register_t hsr;                             /* ESR_EL2 */

All the structure is using uint64_t rather than register_t. Could we do 
the same here?

>   > +    register_t pad1; /* Doubleword-align the user half of the frame */

May I asked, why the padding is moved here rather than kept below?

>       /* Outer guest frame only from here on... */
>   
>       union {
> @@ -73,8 +74,6 @@ struct cpu_user_regs
>           uint32_t spsr_svc;       /* AArch32 */
>       };
>   
> -    uint32_t pad1; /* Doubleword-align the user half of the frame */
> -

I think this deserves an explanation in the commit message. However, I 
believe this is going to corrupt spsr_fiq because we are writing a 
64-bit value to spsr_el1 (see the macro entry_guest in 
arch/arm/arm64/entry.S).

So the union likely want to be 64-bit.

>       /* AArch32 guests only */
>       uint32_t spsr_fiq, spsr_irq, spsr_und, spsr_abt;
>   
> diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h
> index 29d4531f40..7424402c6e 100644
> --- a/xen/include/asm-arm/hsr.h
> +++ b/xen/include/asm-arm/hsr.h
> @@ -16,11 +16,14 @@ enum dabt_size {
>   };
>   
>   union hsr {
> -    uint32_t bits;
> +    register_t bits;
>       struct {
>           unsigned long iss:25;  /* Instruction Specific Syndrome */
>           unsigned long len:1;   /* Instruction length */
>           unsigned long ec:6;    /* Exception Class */
> +#ifdef CONFIG_ARM_64
> +        unsigned long _res0:32;
> +#endif

Given that we don't define any useful, could we avoid the #ifdefery?

>       };
>   
>       /* Common to all conditional exception classes (0x0N, except 0x00). */
> @@ -30,6 +33,9 @@ union hsr {
>           unsigned long ccvalid:1;/* CC Valid */
>           unsigned long len:1;   /* Instruction length */
>           unsigned long ec:6;    /* Exception Class */
> +#ifdef CONFIG_ARM_64
> +        unsigned long _res0:32;
> +#endif
>       } cond;
>   
>       struct hsr_wfi_wfe {
> @@ -39,6 +45,9 @@ union hsr {
>           unsigned long ccvalid:1;/* CC Valid */
>           unsigned long len:1;   /* Instruction length */
>           unsigned long ec:6;    /* Exception Class */
> +#ifdef CONFIG_ARM_64
> +        unsigned long _res0:32;
> +#endif
>       } wfi_wfe;
>   
>       /* reg, reg0, reg1 are 4 bits on AArch32, the fifth bit is sbzp. */
> @@ -53,6 +62,9 @@ union hsr {
>           unsigned long ccvalid:1;/* CC Valid */
>           unsigned long len:1;   /* Instruction length */
>           unsigned long ec:6;    /* Exception Class */
> +#ifdef CONFIG_ARM_64
> +        unsigned long _res0:32;
> +#endif
>       } cp32; /* HSR_EC_CP15_32, CP14_32, CP10 */
>   
>       struct hsr_cp64 {
> @@ -66,6 +78,9 @@ union hsr {
>           unsigned long ccvalid:1;/* CC Valid */
>           unsigned long len:1;    /* Instruction length */
>           unsigned long ec:6;     /* Exception Class */
> +#ifdef CONFIG_ARM_64
> +        unsigned long _res0:32;
> +#endif
>       } cp64; /* HSR_EC_CP15_64, HSR_EC_CP14_64 */
>   
>        struct hsr_cp {
> @@ -77,6 +92,9 @@ union hsr {
>           unsigned long ccvalid:1;/* CC Valid */
>           unsigned long len:1;    /* Instruction length */
>           unsigned long ec:6;     /* Exception Class */
> +#ifdef CONFIG_ARM_64
> +        unsigned long _res0:32;
> +#endif
>       } cp; /* HSR_EC_CP */
>   
>       /*
> @@ -94,6 +112,9 @@ union hsr {
>           unsigned long ccvalid:1;/* CC Valid */
>           unsigned long len:1;   /* Instruction length */
>           unsigned long ec:6;    /* Exception Class */
> +#ifdef CONFIG_ARM_64
> +        unsigned long _res0:32;
> +#endif
>       } smc32; /* HSR_EC_SMC32 */
>   
>   #ifdef CONFIG_ARM_64
> @@ -108,6 +129,7 @@ union hsr {
>           unsigned long res0:3;
>           unsigned long len:1;    /* Instruction length */
>           unsigned long ec:6;
> +        unsigned long _res0:32;
>       } sysreg; /* HSR_EC_SYSREG */
>   #endif
>   
> @@ -121,6 +143,9 @@ union hsr {
>           unsigned long res2:14;
>           unsigned long len:1;   /* Instruction length */
>           unsigned long ec:6;    /* Exception Class */
> +#ifdef CONFIG_ARM_64
> +        unsigned long _res0:32;
> +#endif
>       } iabt; /* HSR_EC_INSTR_ABORT_* */
>   
>       struct hsr_dabt {
> @@ -143,6 +168,9 @@ union hsr {
>           unsigned long valid:1; /* Syndrome Valid */
>           unsigned long len:1;   /* Instruction length */
>           unsigned long ec:6;    /* Exception Class */
> +#ifdef CONFIG_ARM_64
> +        unsigned long _res0:32;
> +#endif
>       } dabt; /* HSR_EC_DATA_ABORT_* */
>   
>       /* Contain the common bits between DABT and IABT */
> @@ -156,6 +184,9 @@ union hsr {
>           unsigned long pad3:14;  /* Not common */
>           unsigned long len:1;    /* Instruction length */
>           unsigned long ec:6;     /* Exception Class */
> +#ifdef CONFIG_ARM_64
> +        unsigned long _res0:32;
> +#endif
>       } xabt;
>   
>   #ifdef CONFIG_ARM_64
> @@ -164,6 +195,7 @@ union hsr {
>           unsigned long res0:9;
>           unsigned long len:1;        /* Instruction length */
>           unsigned long ec:6;         /* Exception Class */
> +        unsigned long _res0:32;
>       } brk;
>   #endif
>   };
> 

Cheers,

-- 
Julien Grall

