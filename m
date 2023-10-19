Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0519C7D02F4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 22:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619572.964873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtZEU-0003Yf-Nr; Thu, 19 Oct 2023 20:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619572.964873; Thu, 19 Oct 2023 20:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtZEU-0003Vs-Kb; Thu, 19 Oct 2023 20:03:02 +0000
Received: by outflank-mailman (input) for mailman id 619572;
 Thu, 19 Oct 2023 20:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Gc6=GB=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qtZET-0003Vm-PI
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 20:03:01 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fd33291-6eba-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 22:02:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AB5C18285527;
 Thu, 19 Oct 2023 15:02:57 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3b-jTolaVfMa; Thu, 19 Oct 2023 15:02:56 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4EA8B8285966;
 Thu, 19 Oct 2023 15:02:56 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QGVWBXQ4VcnC; Thu, 19 Oct 2023 15:02:56 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D3F688285527;
 Thu, 19 Oct 2023 15:02:55 -0500 (CDT)
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
X-Inumbo-ID: 7fd33291-6eba-11ee-98d5-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4EA8B8285966
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1697745776; bh=iytuFWv62eiyYgq+TSnbCZnGXvdCmxrwQaBI8wH9DtM=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=aHZ/5pmOJvjO6jcDZAHs6ClBbGE757xV0OVErfTDMGZO8s2WA7x7tQTbVTzhDdK5y
	 pX4qyhmDKwxsNFikhqkQQ/deK8L+4kjDQwf50qvUrf88G6hNjHjQE7/g6PP8I7R2t2
	 EbEYiyPzOI272IuzRe8aH1z0pgCSGvNh4NZ9sczQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <4da4a57b-06ae-dd66-e8b5-a388f7e492b3@raptorengineering.com>
Date: Thu, 19 Oct 2023 15:02:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] xen/ppc: Implement a basic exception handler
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1697220184.git.sanastasio@raptorengineering.com>
 <dfd134a6c59f329b62d2ecfaa37d74d70f8d4d90.1697220184.git.sanastasio@raptorengineering.com>
 <a5db276d-6bc0-1fe6-6cdd-7c097308fdce@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <a5db276d-6bc0-1fe6-6cdd-7c097308fdce@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/23 10:43 AM, Jan Beulich wrote:
> On 13.10.2023 20:13, Shawn Anastasio wrote:
>> --- /dev/null
>> +++ b/xen/arch/ppc/ppc64/exceptions-asm.S
>> @@ -0,0 +1,129 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <asm/asm-defns.h>
>> +#include <asm/processor.h>
>> +
>> +    .section .text.exceptions, "ax", %progbits
>> +
>> +    /* Helper to dump CPU state to struct cpu_user_regs pointed to by r1. */
>> +ENTRY(exception_common)
>> +    /* Save GPRs 1-31 */
>> +    SAVE_GPRS(1, 31, %r1)
> 
> This won't save the entry value of %r1, but the one that was already updated.
> If this is not a problem, perhaps worth a comment?
>

This is indeed not a problem for now, but agreed that it warrants a
comment. Will do.

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
> 
> Except for these four lines the two functions look identical. Is it
> really good to duplicate all of the rest of the code?
>

Andrew also pointed this out and as I mentioned to him, I expect the two
routines to diverge more significantly in the future, so I'd rather keep
them separate even if in this early stage there's not much difference.

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
>> +
>> +/*
>> + * Declare an ISR for the provided exception that jumps to the specified handler
>> + */
>> +.macro ISR name, exc, handler
>> +    . = (AIL_VECTOR_BASE - EXCEPTION_VECTORS_START) + \exc
>> +    ENTRY(\name)
>> +    /* TODO: switch stack */
>> +
>> +    /* Reserve space for struct cpu_user_regs */
>> +    subi    %r1, %r1, UREGS_sizeof
>> +
>> +    /* Save r0 immediately so we can use it as scratch space */
>> +    SAVE_GPR(0, %r1)
>> +
>> +    /* Save exception vector number */
>> +    li      %r0, \exc
>> +    std     %r0, UREGS_entry_vector(%r1)
>> +
>> +    /* Branch to common code */
>> +    b       \handler
>> +
>> +    .size \name, . - \name
>> +    .type \name, %function
>> +.endm
>> +
>> +
> 
> Nit: No double blank lines please.
> 

Will fix.

>> +ISR exc_sysreset,   EXC_SYSTEM_RESET,   exception_common
>> +ISR exc_mcheck,     EXC_MACHINE_CHECK,  exception_common
>> +ISR exc_dstore,     EXC_DATA_STORAGE,   exception_common
>> +ISR exc_dsegment,   EXC_DATA_SEGMENT,   exception_common
>> +ISR exc_istore,     EXC_INSN_STORAGE,   exception_common
>> +ISR exc_isegment,   EXC_INSN_SEGMENT,   exception_common
>> +ISR exc_extern,     EXC_EXTERNAL,       exception_common
>> +ISR exc_align,      EXC_ALIGNMENT,      exception_common
>> +ISR exc_program,    EXC_PROGRAM,        exception_common
>> +ISR exc_fpu,        EXC_FPU_UNAVAIL,    exception_common
>> +ISR exc_dec,        EXC_DECREMENTER,    exception_common
>> +ISR exc_h_dec,      EXC_H_DECREMENTER,  h_exception_common
>> +/* EXC_PRIV_DOORBELL ... EXC_TRACE */
>> +ISR exc_h_dstore,   EXC_H_DATA_STORAGE, h_exception_common
>> +ISR exc_h_istore,   EXC_H_INSN_STORAGE, h_exception_common
> 
> Aiui these are required to be in order, or else the assembler will choke.
> Maybe worth another comment?
>

Correct, the ordering does matter here. I'll add a comment.

>> --- /dev/null
>> +++ b/xen/arch/ppc/ppc64/exceptions.c
>> @@ -0,0 +1,102 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#include <xen/lib.h>
>> +
>> +#include <asm/processor.h>
>> +
>> +static const char *exception_name_from_vec(uint32_t vec)
>> +{
>> +    switch ( vec )
>> +    {
>> +    case EXC_SYSTEM_RESET:
>> +        return "System Reset Interrupt";
>> +    case EXC_MACHINE_CHECK:
>> +        return "Machine Check Interrupt";
>> +    case EXC_DATA_STORAGE:
>> +        return "Data Storage Interrupt";
>> +    case EXC_DATA_SEGMENT:
>> +        return "Data Segment Interrupt";
>> +    case EXC_INSN_STORAGE:
>> +        return "Instruction Storage Interrupt";
>> +    case EXC_INSN_SEGMENT:
>> +        return "Instruction Segment Interrupt";
>> +    case EXC_EXTERNAL:
>> +        return "External Interrupt";
>> +    case EXC_ALIGNMENT:
>> +        return "Alignment Interrupt";
>> +    case EXC_PROGRAM:
>> +        return "Program Interrupt";
>> +    case EXC_FPU_UNAVAIL:
>> +        return "Floating-Point Unavailable Interrupt";
>> +    case EXC_DECREMENTER:
>> +        return "Decrementer Interrupt";
>> +    case EXC_H_DECREMENTER:
>> +        return "Hypervisor Decrementer Interrupt";
>> +    case EXC_PRIV_DOORBELL:
>> +        return "Directed Privileged Doorbell Interrupt";
>> +    case EXC_SYSTEM_CALL:
>> +        return "System Call Interrupt";
>> +    case EXC_TRACE:
>> +        return "Trace Interrupt";
>> +    case EXC_H_DATA_STORAGE:
>> +        return "Hypervisor Data Storage Interrupt";
>> +    case EXC_H_INSN_STORAGE:
>> +        return "Hypervisor Instruction Storage Interrupt";
>> +    case EXC_H_EMUL_ASST:
>> +        return "Hypervisor Emulation Assistance Interrupt";
>> +    case EXC_H_MAINTENANCE:
>> +        return "Hypervisor Maintenance Interrupt";
>> +    case EXC_H_DOORBELL:
>> +        return "Directed Hypervisor Doorbell Interrupt";
>> +    case EXC_H_VIRT:
>> +        return "Hypervisor Virtualization Interrupt";
>> +    case EXC_PERF_MON:
>> +        return "Performance Monitor Interrupt";
>> +    case EXC_VECTOR_UNAVAIL:
>> +        return "Vector Unavailable Interrupt";
>> +    case EXC_VSX_UNAVAIL:
>> +        return "VSX Unavailable Interrupt";
>> +    case EXC_FACIL_UNAVAIL:
>> +        return "Facility Unavailable Interrupt";
>> +    case EXC_H_FACIL_UNAVAIL:
>> +        return "Hypervisor Facility Unavailable Interrupt";
> 
> Every string here has Interrupt at the end - any chance of collapsing
> all of them?
> 

Fair enough, I'll drop " Interrupt" from all the strings.

>> +    default:
>> +        return "(unknown)";
>> +    }
>> +}
>> +
>> +void exception_handler(struct cpu_user_regs *regs)
>> +{
>> +    /* TODO: this is currently only useful for debugging */
>> +
>> +    printk("UNRECOVERABLE EXCEPTION: %s (0x%04x)\n\n"
>> +           "GPR 0-3   : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
>> +           "GPR 4-7   : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
>> +           "GPR 8-11  : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
>> +           "GPR 12-15 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
>> +           "GPR 16-19 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
>> +           "GPR 20-23 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
>> +           "GPR 24-27 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n"
>> +           "GPR 28-31 : 0x%016lx 0x%016lx 0x%016lx 0x%016lx\n\n",
>> +           exception_name_from_vec(regs->entry_vector), regs->entry_vector,
>> +           regs->gprs[0], regs->gprs[1], regs->gprs[2], regs->gprs[3],
>> +           regs->gprs[4], regs->gprs[5], regs->gprs[6], regs->gprs[7],
>> +           regs->gprs[8], regs->gprs[9], regs->gprs[10], regs->gprs[11],
>> +           regs->gprs[12], regs->gprs[13], regs->gprs[14], regs->gprs[15],
>> +           regs->gprs[16], regs->gprs[17], regs->gprs[18], regs->gprs[19],
>> +           regs->gprs[20], regs->gprs[21], regs->gprs[22], regs->gprs[23],
>> +           regs->gprs[24], regs->gprs[25], regs->gprs[26], regs->gprs[27],
>> +           regs->gprs[28], regs->gprs[29], regs->gprs[30], regs->gprs[31]);
>> +    printk("LR        : 0x%016lx\n"
>> +           "CTR       : 0x%016lx\n"
>> +           "CR        : 0x%08x\n"
>> +           "PC        : 0x%016lx\n"
>> +           "MSR       : 0x%016lx\n"
>> +           "SRR0      : 0x%016lx\n"
>> +           "SRR1      : 0x%016lx\n"
>> +           "DAR       : 0x%016lx\n"
>> +           "DSISR     : 0x%08x\n",
>> +           regs->lr, regs->ctr, regs->cr, regs->pc, regs->msr, regs->srr0,
>> +           regs->srr1, regs->dar, regs->dsisr);
> 
> While surely a matter of taste, I'd still like to ask: In dumping like
> this, are 0x prefixes (taking space) actually useful?
>

I personally prefer the prefixes, but it is definitely just a matter of
taste.

>> --- a/xen/arch/ppc/setup.c
>> +++ b/xen/arch/ppc/setup.c
>> @@ -11,6 +11,15 @@
>>  /* Xen stack for bringing up the first CPU. */
>>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
>>
>> +void setup_exceptions(void)
>> +{
>> +    unsigned long lpcr;
>> +
>> +    /* Set appropriate interrupt location in LPCR */
>> +    lpcr = mfspr(SPRN_LPCR);
>> +    mtspr(SPRN_LPCR, lpcr | LPCR_AIL_3);
>> +}
> 
> Please forgive my lack of PPC knowledge: There's no use of any address
> here afaict. Where's the link to (presumably) AIL_VECTOR_BASE? If that
> address is kind of magic, I'm then lacking a connection between
> XEN_VIRT_START and that constant. (If Xen needed moving around in
> address space, it would be nice if changing a single constant would
> suffice.)
>

AIL_VECTOR_BASE is indeed a magic address defined by the ISA for AIL=3.
As for the second part of your question, I'm a bit confused as to what
you're asking. The ISRs are placed at a position relative to
the start of the .text.exceptions section (EXCEPTION_VECTORS_START), so
Xen can be arbitrarily shuffled around in address space as long as
EXCEPTION_VECTORS_START lies at or before AIL_VECTOR_BASE.

> Also you only OR in LPCR_AIL_3 - is it guaranteed that the respective
> field is zero when control is passed to Xen?
>

As AIL=3 corresponds to 0b11, the intial state of the AIL field is
irrelevant and OR'ing will always yield the desired result.

> Jan

Thanks,
Shawn

