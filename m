Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326DE7C8CB1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 20:02:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616828.959120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMUa-0002mJ-PQ; Fri, 13 Oct 2023 18:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616828.959120; Fri, 13 Oct 2023 18:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMUa-0002jm-Lm; Fri, 13 Oct 2023 18:02:32 +0000
Received: by outflank-mailman (input) for mailman id 616828;
 Fri, 13 Oct 2023 18:02:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m8jO=F3=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qrMUZ-0002Qe-AV
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 18:02:31 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab1a49ed-69f2-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 20:02:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 136298285872;
 Fri, 13 Oct 2023 13:02:26 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PI_oVbjcUtEa; Fri, 13 Oct 2023 13:02:24 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C86948285873;
 Fri, 13 Oct 2023 13:02:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NMKuVHpuZ5lo; Fri, 13 Oct 2023 13:02:24 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 54E9B8285872;
 Fri, 13 Oct 2023 13:02:24 -0500 (CDT)
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
X-Inumbo-ID: ab1a49ed-69f2-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C86948285873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1697220144; bh=7x52lhRkK5RTtU9gooS/8hNq4NSdl0hDvp7rkSUAytA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=h3tUwy9eyi5tb+AQ4P+m7g+3KzzT+3Bi8YYZYqeo81L1O1k0h9XUS2GyDmUyPoKZ9
	 yjkkWAxUatya3/2JJuGC7EdmAPqJb91ZbKkI72//qryZfQuZPGWwsOOKoCyPxPho43
	 OKt1k9CmpFj0Cq/3KT+mG2pDMinF9VJNumSD9F7k=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <68edd4ec-bb9c-7138-9d67-9180d3251e15@raptorengineering.com>
Date: Fri, 13 Oct 2023 13:02:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/3] xen/ppc: Implement a basic exception handler
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1695942864.git.sanastasio@raptorengineering.com>
 <edbe94f5ba1db05beb36fef6589b6a79a30c4a7c.1695942864.git.sanastasio@raptorengineering.com>
 <bfeb8d21-66ae-4bc4-99d7-33fd9ede266e@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <bfeb8d21-66ae-4bc4-99d7-33fd9ede266e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/29/23 4:48 AM, Andrew Cooper wrote:
> On 29/09/2023 12:19 am, Shawn Anastasio wrote:
>> Implement a basic exception handler that dumps the CPU state to the
>> console, as well as the code required to set the correct exception
>> vector table's base address in setup.c.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>  xen/arch/ppc/include/asm/processor.h |  31 +++++++
>>  xen/arch/ppc/ppc64/Makefile          |   2 +
>>  xen/arch/ppc/ppc64/asm-offsets.c     |   1 +
>>  xen/arch/ppc/ppc64/exceptions-asm.S  | 122 +++++++++++++++++++++++++++
>>  xen/arch/ppc/ppc64/exceptions.c      | 102 ++++++++++++++++++++++
>>  xen/arch/ppc/setup.c                 |  11 +++
>>  6 files changed, 269 insertions(+)
>>  create mode 100644 xen/arch/ppc/ppc64/exceptions-asm.S
>>  create mode 100644 xen/arch/ppc/ppc64/exceptions.c
>>
>> diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
>> index d3dd943c20..a01b62b8a4 100644
>> --- a/xen/arch/ppc/include/asm/processor.h
>> +++ b/xen/arch/ppc/include/asm/processor.h
>> @@ -103,6 +103,37 @@
>>  #define PVR_BE        0x0070
>>  #define PVR_PA6T      0x0090
>>  
>> +/* Exception Definitions */
>> +#define EXC_SYSTEM_RESET    0x0100 /* System Reset Interrupt */
>> +#define EXC_MACHINE_CHECK   0x0200 /* Machine Check Interrupt */
>> +#define EXC_DATA_STORAGE    0x0300 /* Data Storage Interrupt */
>> +#define EXC_DATA_SEGMENT    0x0380 /* Data Segment Interrupt */
>> +#define EXC_INSN_STORAGE    0x0400 /* Instruction Storage Interrupt */
>> +#define EXC_INSN_SEGMENT    0x0480 /* Instruction Segment Interrupt */
>> +#define EXC_EXTERNAL        0x0500 /* External Interrupt */
>> +#define EXC_ALIGNMENT       0x0600 /* Alignment Interrupt */
>> +#define EXC_PROGRAM         0x0700 /* Program Interrupt */
>> +#define EXC_FPU_UNAVAIL     0x0800 /* Floating-Point Unavailable Interrupt */
>> +#define EXC_DECREMENTER     0x0900 /* Decrementer Interrupt */
>> +#define EXC_H_DECREMENTER   0x0980 /* Hypervisor Decrementer Interrupt */
>> +#define EXC_PRIV_DOORBELL   0x0A00 /* Directed Privileged Doorbell Interrupt */
>> +#define EXC_SYSTEM_CALL     0x0C00 /* System Call Interrupt */
>> +#define EXC_TRACE           0x0D00 /* Trace Interrupt */
>> +#define EXC_H_DATA_STORAGE  0x0E00 /* Hypervisor Data Storage Interrupt */
>> +#define EXC_H_INSN_STORAGE  0x0E20 /* Hypervisor Instruction Storage Interrupt */
>> +#define EXC_H_EMUL_ASST     0x0E40 /* Hypervisor Emulation Assistance Interrupt */
>> +#define EXC_H_MAINTENANCE   0x0E60 /* Hypervisor Maintenance Interrupt */
>> +#define EXC_H_DOORBELL      0x0E80 /* Directed Hypervisor Doorbell Interrupt */
>> +#define EXC_H_VIRT          0x0EA0 /* Hypervisor Virtualization Interrupt */
>> +#define EXC_PERF_MON        0x0F00 /* Performance Monitor Interrupt */
>> +#define EXC_VECTOR_UNAVAIL  0x0F20 /* Vector Unavailable Interrupt */
>> +#define EXC_VSX_UNAVAIL     0x0F40 /* VSX Unavailable Interrupt */
>> +#define EXC_FACIL_UNAVAIL   0x0F60 /* Facility Unavailable Interrupt */
>> +#define EXC_H_FACIL_UNAVAIL 0x0F80 /* Hypervisor Facility Unavailable Interrupt */
>> +
>> +/* Base address of interrupt vector table when LPCR[AIL]=3 */
>> +#define AIL_VECTOR_BASE _AC(0xc000000000004000, UL)
>> +
>>  #ifndef __ASSEMBLY__
>>  
>>  #include <xen/types.h>
>> diff --git a/xen/arch/ppc/ppc64/Makefile b/xen/arch/ppc/ppc64/Makefile
>> index 5b88355bb2..914bb21c40 100644
>> --- a/xen/arch/ppc/ppc64/Makefile
>> +++ b/xen/arch/ppc/ppc64/Makefile
>> @@ -1,2 +1,4 @@
>> +obj-y += exceptions.o
>> +obj-y += exceptions-asm.o
>>  obj-y += head.o
>>  obj-y += opal-calls.o
>> diff --git a/xen/arch/ppc/ppc64/asm-offsets.c b/xen/arch/ppc/ppc64/asm-offsets.c
>> index c15c1bf136..634d7260e3 100644
>> --- a/xen/arch/ppc/ppc64/asm-offsets.c
>> +++ b/xen/arch/ppc/ppc64/asm-offsets.c
>> @@ -46,6 +46,7 @@ void __dummy__(void)
>>      OFFSET(UREGS_dsisr, struct cpu_user_regs, dsisr);
>>      OFFSET(UREGS_cr, struct cpu_user_regs, cr);
>>      OFFSET(UREGS_fpscr, struct cpu_user_regs, fpscr);
>> +    OFFSET(UREGS_entry_vector, struct cpu_user_regs, entry_vector);
>>      DEFINE(UREGS_sizeof, sizeof(struct cpu_user_regs));
>>  
>>      OFFSET(OPAL_base, struct opal, base);
>> diff --git a/xen/arch/ppc/ppc64/exceptions-asm.S b/xen/arch/ppc/ppc64/exceptions-asm.S
>> new file mode 100644
>> index 0000000000..877df97c9b
>> --- /dev/null
>> +++ b/xen/arch/ppc/ppc64/exceptions-asm.S
>> @@ -0,0 +1,122 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <asm/asm-defns.h>
>> +#include <asm/processor.h>
>> +
>> +    /* Helper to dump CPU state to struct cpu_user_regs pointed to by r1. */
>> +ENTRY(exception_common)
>> +    /* Save GPRs 1-31 */
>> +    SAVE_GPRS(1, 31, %r1)
>> +
>> +    /* Save LR, CTR, CR */
>> +    mflr    %r0
>> +    std     %r0, UREGS_lr(%r1)
>> +    mfctr   %r0
>> +    std     %r0, UREGS_ctr(%r1)
>> +    mfcr    %r0
>> +    stw     %r0, UREGS_cr(%r1) /* 32-bit */
>> +
>> +    /* Save Exception Registers */
>> +    mfsrr0  %r0
>> +    std     %r0, UREGS_pc(%r1)
>> +    mfsrr1  %r0
>> +    std     %r0, UREGS_msr(%r1)
>> +    mfdsisr %r0
>> +    stw     %r0, UREGS_dsisr(%r1) /* 32-bit */
>> +    mfdar   %r0
>> +    std     %r0, UREGS_dar(%r1)
>> +    li      %r0, -1 /* OS's SRR0/SRR1 have been clobbered */
>> +    std     %r0, UREGS_srr0(%r1)
>> +    std     %r0, UREGS_srr1(%r1)
>> +
>> +    /* Setup TOC and a stack frame then call C exception handler */
>> +    mr      %r3, %r1
>> +    bcl     20, 31, 1f
>> +1:  mflr    %r12
>> +    addis   %r2, %r12, .TOC.-1b@ha
>> +    addi    %r2, %r2, .TOC.-1b@l
>> +
>> +    li      %r0, 0
>> +    stdu    %r0, -STACK_FRAME_OVERHEAD(%r1)
>> +    bl      exception_handler
>> +
>> +    .size exception_common, . - exception_common
>> +    .type exception_common, %function
>> +
>> +    /* Same as exception_common, but for exceptions that set HSRR{0,1} */
>> +ENTRY(h_exception_common)
>> +    /* Save GPRs 1-31 */
>> +    SAVE_GPRS(1, 31, %r1)
>> +
>> +    /* Save LR, CTR, CR */
>> +    mflr    %r0
>> +    std     %r0, UREGS_lr(%r1)
>> +    mfctr   %r0
>> +    std     %r0, UREGS_ctr(%r1)
>> +    mfcr    %r0
>> +    stw     %r0, UREGS_cr(%r1) /* 32-bit */
>> +
>> +    /* Save Exception Registers */
>> +    mfhsrr0 %r0
>> +    std     %r0, UREGS_pc(%r1)
>> +    mfhsrr1 %r0
>> +    std     %r0, UREGS_msr(%r1)
>> +    mfsrr0  %r0
>> +    std     %r0, UREGS_srr0(%r1)
>> +    mfsrr1  %r0
>> +    std     %r0, UREGS_srr1(%r1)
>> +    mfdsisr %r0
>> +    stw     %r0, UREGS_dsisr(%r1) /* 32-bit */
>> +    mfdar   %r0
>> +    std     %r0, UREGS_dar(%r1)
>> +
>> +    /* Setup TOC and a stack frame then call C exception handler */
>> +    mr      %r3, %r1
>> +    bcl     20, 31, 1f
>> +1:  mflr    %r12
>> +    addis   %r2, %r12, .TOC.-1b@ha
>> +    addi    %r2, %r2, .TOC.-1b@l
>> +
>> +    li      %r0, 0
>> +    stdu    %r0, -STACK_FRAME_OVERHEAD(%r1)
>> +    bl      exception_handler
>> +
>> +    .size h_exception_common, . - h_exception_common
>> +    .type h_exception_common, %function
> 
> These two are almost identical, and differ only by the handling of
> srr{0,1} as far as I can tell.
> 
> Is that just because the handler is fatal, or are they likely to stay
> this similar longterm?
> 
> One thing you could do, which would remove the duplicated logic
> constructing cpu_regs would be
> 
> exception_common_ssr
>     mfsrr0  %r0
>     std     %r0, UREGS_srr0(%r1)
>     mfsrr1  %r0
>     std     %r0, UREGS_srr1(%r1)
>     b exception_common
> 
> exception_common_clobber_ssr
>     li      %r0, -1 /* OS's SRR0/SRR1 have been clobbered */
>     std     %r0, UREGS_srr0(%r1)
>     std     %r0, UREGS_srr1(%r1)
>     b exception_common
> 
> but this only works if the internal differences aren't going to get larger.
>

I anticipate that these two will end up diverging further in the
medium-to-long term, so if you'd accept it I'd rather keep them separate
initially.

>> +
>> +/*
>> + * Declare an ISR for the provided exception that jumps to `continue`
>> + */
>> +#define DEFINE_ISR(name, exc, continue)                                        \
>> +    . = (AIL_VECTOR_BASE - EXCEPTION_VECTORS_START) + (exc);                   \
>> +    ENTRY(name)                                                                \
>> +    /* TODO: switch stack */                                                   \
>> +    /* Reserve space for struct cpu_user_regs */                               \
>> +    subi    %r1, %r1, UREGS_sizeof;                                            \
>> +    /* Save r0 immediately so we can use it as scratch space */                \
>> +    SAVE_GPR(0, %r1);                                                          \
>> +    /* Save exception vector number */                                         \
>> +    li      %r0, (exc);                                                        \
>> +    std     %r0, UREGS_entry_vector(%r1);                                      \
>> +    /* Branch to common code */                                                \
>> +    b       (continue);                                                        \
>> +    .size name, . - name;                                                      \
>> +    .type name, %function;
> 
> This will be much nicer as an ASM macro rather than a preprocessor macro.
> 
> .macro ISR name, exc, handler
>     ...
> .endm
> 
> Everything inside can stay the same, but no need for ; or \, and a few
> newlines go a long way for readability.
>

Fair enough, will do.

> 
>> +
>> +    .section .text.exceptions, "ax", %progbits
>> +
>> +DEFINE_ISR(exc_sysreset, EXC_SYSTEM_RESET, exception_common)
>> +DEFINE_ISR(exc_mcheck, EXC_MACHINE_CHECK, exception_common)
>> +DEFINE_ISR(exc_dstore, EXC_DATA_STORAGE, exception_common)
>> +DEFINE_ISR(exc_dsegment, EXC_DATA_SEGMENT, exception_common)
>> +DEFINE_ISR(exc_istore, EXC_INSN_STORAGE, exception_common)
>> +DEFINE_ISR(exc_isegment, EXC_INSN_SEGMENT, exception_common)
>> +DEFINE_ISR(exc_extern, EXC_EXTERNAL, exception_common)
>> +DEFINE_ISR(exc_align, EXC_ALIGNMENT, exception_common)
>> +DEFINE_ISR(exc_program, EXC_PROGRAM, exception_common)
>> +DEFINE_ISR(exc_fpu, EXC_FPU_UNAVAIL, exception_common)
>> +DEFINE_ISR(exc_dec, EXC_DECREMENTER, exception_common)
>> +DEFINE_ISR(exc_h_dec, EXC_H_DECREMENTER, h_exception_common)
>> +/* EXC_PRIV_DOORBELL ... EXC_TRACE */
>> +DEFINE_ISR(exc_h_dstore, EXC_H_DATA_STORAGE, h_exception_common)
>> +DEFINE_ISR(exc_h_istore, EXC_H_INSN_STORAGE, h_exception_common)
> 
> It also makes this less cluttered, and I'd recommend tabulating it too.
>

Ditto.

> ~Andrew

Thanks,
Shawn

