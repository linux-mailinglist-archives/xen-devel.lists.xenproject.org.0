Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7487175D00F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 18:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567661.886991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMtNO-0001JW-5y; Fri, 21 Jul 2023 16:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567661.886991; Fri, 21 Jul 2023 16:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMtNO-0001Hu-2a; Fri, 21 Jul 2023 16:53:10 +0000
Received: by outflank-mailman (input) for mailman id 567661;
 Fri, 21 Jul 2023 16:53:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NI5b=DH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qMtNM-0001Ho-VU
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 16:53:08 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f4c83f4-27e7-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 18:53:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9E8328285590;
 Fri, 21 Jul 2023 11:53:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7T53_EDlM9kY; Fri, 21 Jul 2023 11:53:02 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 36EA68285957;
 Fri, 21 Jul 2023 11:53:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UrC3dRSvM5h6; Fri, 21 Jul 2023 11:53:02 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id B69C18285590;
 Fri, 21 Jul 2023 11:53:01 -0500 (CDT)
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
X-Inumbo-ID: 0f4c83f4-27e7-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 36EA68285957
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1689958382; bh=fYfLF0WSeFnVwXg54J6bA2OQsEwG0Ye0kjBmI9gTu+k=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=tUiIJBauH0acvaYAu2EpsY2bglQDrmvm6l+iDRNcq13+ZNN/FVg1pBGXPpA7GQs1k
	 sqRwP8VEdEwyFMI/J8rDn8rSYaz4dyiL+G4v6lAKSDNRFSU8Ms3v0Gt1Ckh1HlPxK5
	 4JAHoKd8NCkbXJ3HSUP+f8YnAZLbKk+nKMa+7kXM=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <a7f89b3b-bcd1-6844-b836-40b73a9fa3b0@raptorengineering.com>
Date: Fri, 21 Jul 2023 11:53:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1689710519.git.sanastasio@raptorengineering.com>
 <7c416ff843ea359bb24b8c954cc079fe1bbaf75f.1689710519.git.sanastasio@raptorengineering.com>
 <6d3b7cd6-7d6a-8d28-f1e7-7e939e393445@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <6d3b7cd6-7d6a-8d28-f1e7-7e939e393445@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/19/23 9:05 AM, Jan Beulich wrote:
> On 18.07.2023 22:20, Shawn Anastasio wrote:
>> +void __init boot_of_init(unsigned long vec)
>> +{
>> +    int bof_chosen;
>> +
>> +    of_vec = vec;
>> +
>> +    /* Get a handle to the default console */
>> +    bof_chosen = of_finddevice("/chosen");
>> +    of_getprop(bof_chosen, "stdout", &of_out, sizeof(of_out));
>> +    of_out = be32_to_cpu(of_out);
> 
> Can any of these fail, and hence lead to ...

These calls are allowed to fail, but their return value in those cases
is well-defined (an invalid handle), so...

> 
>> +    early_printk_init(of_putchar);
> 
> ... this better not getting invoked?

this being invoked is fine even in those cases. It will just result in
the invalid handle being passed to of_write and the firmware will refuse
to service the writes.

>> --- a/xen/arch/ppc/ppc64/asm-offsets.c
>> +++ b/xen/arch/ppc/ppc64/asm-offsets.c
>> @@ -0,0 +1,59 @@
>> +/*
>> + * Generate definitions needed by assembly language modules.
>> + * This code generates raw asm output which is post-processed
>> + * to extract and format the required data.
>> + */
>> +
>> +#include <asm/processor.h>
>> +
>> +#define DEFINE(_sym, _val)                                                 \
>> +    asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
>> +                  : : "i" (_val) )
> 
> Nit: There's a blank missing after the opening paren, which will then want
> the 2nd line to be indented by one more character. (Instead, as a matter of
> your taste, you may omit the blank between the two colons.)

Will fix.

>> +#define BLANK()                                                            \
>> +    asm volatile ( "\n.ascii\"==><==\"" : : )
>> +#define OFFSET(_sym, _str, _mem)                                           \
>> +    DEFINE(_sym, offsetof(_str, _mem));
>> +
>> +/* base-2 logarithm */
>> +#define __L2(_x)  (((_x) & 0x00000002) ?   1 : 0)
>> +#define __L4(_x)  (((_x) & 0x0000000c) ? ( 2 + __L2( (_x)>> 2)) : __L2( _x))
>> +#define __L8(_x)  (((_x) & 0x000000f0) ? ( 4 + __L4( (_x)>> 4)) : __L4( _x))
>> +#define __L16(_x) (((_x) & 0x0000ff00) ? ( 8 + __L8( (_x)>> 8)) : __L8( _x))
>> +#define LOG_2(_x) (((_x) & 0xffff0000) ? (16 + __L16((_x)>>16)) : __L16(_x))
>> +
>> +void __dummy__(void)
>> +{
>> +    DEFINE(GPR_WIDTH, sizeof(unsigned long));
>> +    DEFINE(FPR_WIDTH, sizeof(double));
>> +
>> +    OFFSET(UREGS_gprs, struct cpu_user_regs, gprs);
>> +    OFFSET(UREGS_r0, struct cpu_user_regs, gprs[0]);
>> +    OFFSET(UREGS_r1, struct cpu_user_regs, gprs[1]);
>> +    OFFSET(UREGS_r13, struct cpu_user_regs, gprs[13]);
>> +    OFFSET(UREGS_srr0, struct cpu_user_regs, srr0);
>> +    OFFSET(UREGS_srr1, struct cpu_user_regs, srr1);
>> +    OFFSET(UREGS_pc, struct cpu_user_regs, pc);
>> +    OFFSET(UREGS_msr, struct cpu_user_regs, msr);
>> +    OFFSET(UREGS_lr, struct cpu_user_regs, lr);
>> +    OFFSET(UREGS_ctr, struct cpu_user_regs, ctr);
>> +    OFFSET(UREGS_xer, struct cpu_user_regs, xer);
>> +    OFFSET(UREGS_hid4, struct cpu_user_regs, hid4);
>> +    OFFSET(UREGS_dar, struct cpu_user_regs, dar);
>> +    OFFSET(UREGS_dsisr, struct cpu_user_regs, dsisr);
>> +    OFFSET(UREGS_cr, struct cpu_user_regs, cr);
>> +    OFFSET(UREGS_fpscr, struct cpu_user_regs, fpscr);
>> +    DEFINE(UREGS_sizeof, sizeof(struct cpu_user_regs));
>> +}
>> +
>> +/* TODO: Replace with BUILD_BUG_ON + IS_ALIGNED once we can use <xen/lib.h> */
>> +_Static_assert(sizeof(struct cpu_user_regs) % STACK_ALIGN == 0,
>> +               "struct cpu_user_regs not stack aligned!");
> 
> But patch 1 makes BUILD_BUG_ON() available now.

Good point, will fix.

>> --- /dev/null
>> +++ b/xen/arch/ppc/ppc64/of-call.S
>> @@ -0,0 +1,83 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Adapted from Linux's arch/powerpc/kernel/entry_64.S, with the
>> + * following copyright notice:
>> + *
>> + *  PowerPC version
>> + *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
>> + *  Rewritten by Cort Dougan (cort@cs.nmt.edu) for PReP
>> + *    Copyright (C) 1996 Cort Dougan <cort@cs.nmt.edu>
>> + *  Adapted for Power Macintosh by Paul Mackerras.
>> + *  Low-level exception handlers and MMU support
>> + *  rewritten by Paul Mackerras.
>> + *    Copyright (C) 1996 Paul Mackerras.
>> + *  MPC8xx modifications Copyright (C) 1997 Dan Malek (dmalek@jlc.net).
>> + */
>> +
>> +#include <asm/asm-offsets.h>
>> +#include <asm/asm-defns.h>
>> +#include <asm/msr.h>
>> +
>> +/* size of minimum stack frame that can hold an entire cpu_user_regs struct */
>> +#define STACK_SWITCH_FRAME_SIZE UREGS_sizeof
>> +
>> +    .section .init.text, "ax", @progbits
>> +
>> +ENTRY(enter_of)
>> +    mflr %r0
>> +    std %r0, 16(%r1)
>> +    stdu %r1,-STACK_SWITCH_FRAME_SIZE(%r1) /* Save SP and create stack space */
> 
> Nit: A blank after the comma would again be nice.

Will fix.

>> +    /*
>> +     * Because PROM is running in 32b mode, it clobbers the high order half
>> +     * of all registers that it saves.  We therefore save those registers
>> +     * PROM might touch to the stack.  (%r0, %r3-%r13 are caller saved)
>> +     */
>> +    SAVE_GPR(2, %r1)
>> +    SAVE_GPR(13, %r1)
>> +    SAVE_NVGPRS(%r1)
>> +    mfcr %r10
>> +    mfmsr %r11
>> +    std %r10, UREGS_cr(%r1)
>> +    std %r11, UREGS_msr(%r1)
>> +
>> +    /* Put PROM address in SRR0 */
>> +    mtsrr0 %r4
>> +
>> +    /* Setup our trampoline return addr in LR */
>> +    bcl 20, 31, .+4
>> +0:  mflr %r4
>> +    addi %r4, %r4, 1f - 0b
>> +    mtlr %r4
>> +
>> +    /* Prepare a 32-bit mode big endian MSR */
>> +    LOAD_IMM64(%r12, MSR_SF | MSR_LE)
>> +    andc %r11, %r11, %r12
>> +    mtsrr1 %r11
>> +    rfid
>> +
>> +1:  /* Return from OF */
>> +    FIXUP_ENDIAN
>> +
>> +    /* Just make sure that %r1 top 32 bits didn't get corrupt by OF */
>> +    rldicl %r1, %r1, 0, 32
>> +
>> +    /* Restore the MSR (back to 64 bits) */
>> +    ld %r0, UREGS_msr(%r1)
>> +    mtmsrd %r0
>> +    isync
>> +
>> +    /* Restore other registers */
>> +    REST_GPR(2, %r1)
>> +    REST_GPR(13, %r1)
>> +    REST_NVGPRS(%r1)
>> +    ld %r4, UREGS_cr(%r1)
>> +    mtcr %r4
>> +
>> +    addi %r1, %r1, STACK_SWITCH_FRAME_SIZE
>> +    ld %r0, 16(%r1)
>> +    mtlr %r0
>> +    blr
>> +
>> +    .size enter_of, . - enter_of
>> +    .type enter_of, %function

Thanks,
Shawn

