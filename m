Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A61C756C2A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 20:34:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564815.882525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLT1f-0000jn-7g; Mon, 17 Jul 2023 18:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564815.882525; Mon, 17 Jul 2023 18:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLT1f-0000gk-4b; Mon, 17 Jul 2023 18:32:51 +0000
Received: by outflank-mailman (input) for mailman id 564815;
 Mon, 17 Jul 2023 18:32:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OuH4=DD=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qLT1d-0000ge-CE
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 18:32:49 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50dff741-24d0-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 20:32:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B71B2828553E;
 Mon, 17 Jul 2023 13:32:41 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kGNqfTIEOa3t; Mon, 17 Jul 2023 13:32:36 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D51F7828554F;
 Mon, 17 Jul 2023 13:32:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id H8uGhZsZUwB9; Mon, 17 Jul 2023 13:32:36 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E5C09828553E;
 Mon, 17 Jul 2023 13:32:35 -0500 (CDT)
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
X-Inumbo-ID: 50dff741-24d0-11ee-b23a-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D51F7828554F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1689618756; bh=51UpnSRCW6jh/dVXIZm6T1eerOBoBwe6mbLBAvYjTfk=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=aitt1+gHNC849ds3/jwctaA6kZ3dvwDzm25NVT2J6xKts0dB0R1Hk3ZXdzvVpLtp/
	 fF6ejQUPVNl6ty4hjiteh43TWcLCoqYCzyq/0fnmcKlbP6nAoZidGeV1pkpP+rNAJU
	 pbe3kpOHNVOe2BK6+MsKtvlITLejldgKqy1jRY2s=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <2fa2837d-37f4-aa28-6ca8-2e28b6f44181@raptorengineering.com>
Date: Mon, 17 Jul 2023 13:32:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/3] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1688670018.git.sanastasio@raptorengineering.com>
 <85172d385a730e196999b366207e2b2e8a261906.1688670018.git.sanastasio@raptorengineering.com>
 <aa58706f-5033-ef33-5202-bcc418bedb86@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <aa58706f-5033-ef33-5202-bcc418bedb86@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/17/23 11:17 AM, Jan Beulich wrote:
> On 06.07.2023 21:04, Shawn Anastasio wrote:
>> --- a/xen/arch/ppc/Makefile
>> +++ b/xen/arch/ppc/Makefile
>> @@ -1,5 +1,7 @@
>>  obj-$(CONFIG_PPC64) += ppc64/
>>  
>> +obj-y += boot-of.init.o
>> +obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
> 
> While in this case I could accept the name as is to be the same as Arm's,
> as said before it would be nice if new files could avoid underscores (and
> use dashes instead) unless strictly required by something.
> 
> Also, with boot-of.c using early_printk.c, shouldn't the latter also
> build into early_printk.init.o?

Yes, good point. I'll change it to early_printk.init.o.

>> --- /dev/null
>> +++ b/xen/arch/ppc/boot-of.c
>> @@ -0,0 +1,100 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright IBM Corp. 2005, 2006, 2007
> 
> Judging from the years the file was taken from somewhere. Is the license
> there permitting "2.0 or later"? (For files [partly] taken from somewhere,
> a clarification as to the originals' licenses would be helpful to have in
> the description, or maybe in the post-commit-message area.)

The original license of the file that this was derived from
(xen/arch/powerpc/boot_of.c from Xen 3.2) is GPL v2.0 or later.

In any case where I'm deriving code from existing files, I'm always
using the original license of the derived code. Should I still clarify
this in the header comment?

>> + * Copyright Raptor Engineering, LLC
>> + *
>> + * Authors: Jimi Xenidis <jimix@watson.ibm.com>
>> + *          Hollis Blanchard <hollisb@us.ibm.com>
>> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
>> + */
>> +
>> +#include <xen/init.h>
>> +#include <xen/stdarg.h>
>> +#include <xen/types.h>
>> +#include <asm/boot.h>
>> +#include <asm/byteorder.h>
>> +#include <asm/early_printk.h>
>> +
>> +#define ADDR(x) (uint32_t)(unsigned long)(x)
> 
> Besides needing to be wrapped in parentheses, this likely needs a comment:
> It is hard to see how in 64-bit code uint32_t can suffice as an address.
> Unless (see the question on patch 1) you intend to link/run Xen at an
> address firmly below 4Gb, now and going forward.

Calls to the Open Firmware client interface necessitate that the CPU be
running with both the MMU off and in 32-bit mode (MSR_SF unset).
Obviously these two criteria will not always be true for Xen itself, but
we can guarantee that Xen's physical address lies below 4GB. In fact,
the mere act of being booted by Open Firmware should guarantee that this
is the case.

This also came up earlier, but the Open Firmware interface will only
need to be used during early boot. Once the MMU is up it shouldn't be
necessary to use it, but if it does end up being required this could be
changed to use __pa() or equivalent (plus the uint32_t cast).

I'll definitely add a comment explaining the situation, as well as the
extra parenthesis.

>> +/* OF entrypoint*/
>> +static unsigned long __initdata of_vec;
>> +
>> +/* OF device handles*/
>> +static int __initdata bof_chosen;
>> +static int __initdata of_out;
>> +
>> +static int __init of_call(const char *service, uint32_t nargs, uint32_t nrets,
>> +                   int32_t rets[], ...)
> 
> Nit: Indentation.

Will fix.

>> +{
>> +    int rc;
>> +    va_list args;
>> +    int i;
> 
> unsigned int?

I might as well change it to uint32_t to be in line with nargs.

> 
>> +    struct of_service s = { 0 };
>> +
>> +    s.ofs_service = cpu_to_be32(ADDR(service));
>> +    s.ofs_nargs = cpu_to_be32(nargs);
>> +    s.ofs_nrets = cpu_to_be32(nrets);
>> +
>> +    /* copy all the params into the args array */
> 
> Nit: Style (comments want to start with a capital letter). Again below.

Will fix.

>> +    va_start(args, rets);
>> +
>> +    for ( i = 0; i < nargs; i++ )
>> +        s.ofs_args[i] = cpu_to_be32(va_arg(args, uint32_t));
>> +
>> +    va_end(args);
>> +
>> +    rc = enter_of(&s, of_vec);
>> +
>> +    /* copy all return values to the output rets array */
>> +    for ( i = 0; i < nrets; i++ )
>> +        rets[i] = be32_to_cpu(s.ofs_args[i + nargs]);
>> +
>> +    return rc;
>> +}
>> +
>> +static int __init of_finddevice(const char *devspec)
>> +{
>> +    int rets[1] = { OF_FAILURE };
> 
> Hmm, of_call() uses int32_t. Again below several times.

Good catch. I'll switch all of these to int32_t for consistency.

> 
>> +    of_call("finddevice", 1, 1, rets, devspec);
> 
> This could do with using ARRAY_SIZE(rets). Same again below.

Sure, will do this.

> Also don't you need to wrap devspec in ADDR()? Similar issues
> then again below.

Yes, good catch. I'll fix this and the other bare pointers.

>> +    return rets[0];
>> +}
>> +
>> +static int __init of_getprop(int ph, const char *name, void *buf, uint32_t buflen)
>> +{
>> +    int rets[1] = { OF_FAILURE };
>> +
>> +    of_call("getprop", 4, 1, rets, ph, ADDR(name), buf, buflen);
>> +    return rets[0];
>> +}
>> +
>> +int __init of_write(int ih, const char *addr, uint32_t len)
>> +{
>> +    int rets[1] = { OF_FAILURE };
>> +
>> +    of_call("write", 3, 1, rets, ih, addr, len);
>> +    return rets[0];
>> +}
>> +
>> +static void __init of_putchar(char c)
>> +{
>> +    if ( c == '\n' )
>> +    {
>> +        char buf = '\r';
>> +        of_write(of_out, &buf, 1);
>> +    }
>> +    of_write(of_out, &c, 1);
>> +}
>> +
>> +void __init boot_of_init(unsigned long vec)
>> +{
>> +    of_vec = vec;
>> +
>> +    /* Get a handle to the default console */
>> +    bof_chosen = of_finddevice("/chosen");
>> +    of_getprop(bof_chosen, "stdout", &of_out, sizeof(of_out));
>> +    of_out = be32_to_cpu(of_out);
>> +
>> +    early_printk_init(of_putchar);
>> +}
> 
> Considering that bof_chosen is used just here, why does it need to be
> a file-scope variable?

Good point. The original code had it as a file-scope variable to be used
by other routines, but I've pruned them from this version which only
does the bare-minimum required for console printing. I'll change this to
a function-scoped variable.

>> --- /dev/null
>> +++ b/xen/arch/ppc/early_printk.c
>> @@ -0,0 +1,28 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#include <xen/init.h>
>> +#include <asm/boot.h>
>> +
>> +static void (*putchar_func)(char);
> 
> __initdata? (Connected to the question of building into .init.o.)

Since I'm going to change this to build to .init.o, would this
automatically be put into the correct .init section? Would it still be
preferable style-wise to mark it as __initdata?

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/processor.h
>> @@ -0,0 +1,139 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright IBM Corp. 2005, 2006, 2007
>> + * Copyright Raptor Engineering, LLC
>> + *
>> + * Authors: Hollis Blanchard <hollisb@us.ibm.com>
>> + *          Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
>> + *          Timothy Pearson <tpearson@raptorengineering.com>
>> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
>> + */
>> +
>> +#ifndef _ASM_PPC_PROCESSOR_H
>> +#define _ASM_PPC_PROCESSOR_H
>> +
>> +#include <xen/config.h>
> 
> No need to - this is force-included by the Makefile machinery.

Ah, thanks. I'll remove this.

>> +#include <xen/types.h>
> 
> Note this. Why ...

See below

> 
>> +#define IOBMP_BYTES          8192
>> +#define IOBMP_INVALID_OFFSET 0x8000
>> +
>> +/* Processor Version Register (PVR) field extraction */
>> +
>> +#define PVR_VER(pvr) (((pvr) >> 16) & 0xFFFF) /* Version field */
>> +#define PVR_REV(pvr) (((pvr) >> 0) & 0xFFFF)  /* Revison field */
>> +
>> +#define __is_processor(pv) (PVR_VER(mfspr(SPRN_PVR)) == (pv))
>> +
>> +/*
>> + * IBM has further subdivided the standard PowerPC 16-bit version and
>> + * revision subfields of the PVR for the PowerPC 403s into the following:
>> + */
>> +
>> +#define PVR_FAM(pvr)  (((pvr) >> 20) & 0xFFF) /* Family field */
>> +#define PVR_MEM(pvr)  (((pvr) >> 16) & 0xF)   /* Member field */
>> +#define PVR_CORE(pvr) (((pvr) >> 12) & 0xF)   /* Core field */
>> +#define PVR_CFG(pvr)  (((pvr) >> 8) & 0xF)    /* Configuration field */
>> +#define PVR_MAJ(pvr)  (((pvr) >> 4) & 0xF)    /* Major revision field */
>> +#define PVR_MIN(pvr)  (((pvr) >> 0) & 0xF)    /* Minor revision field */
>> +
>> +/* Processor Version Numbers */
>> +
>> +#define PVR_403GA    0x00200000
>> +#define PVR_403GB    0x00200100
>> +#define PVR_403GC    0x00200200
>> +#define PVR_403GCX   0x00201400
>> +#define PVR_405GP    0x40110000
>> +#define PVR_STB03XXX 0x40310000
>> +#define PVR_NP405H   0x41410000
>> +#define PVR_NP405L   0x41610000
>> +#define PVR_601      0x00010000
>> +#define PVR_602      0x00050000
>> +#define PVR_603      0x00030000
>> +#define PVR_603e     0x00060000
>> +#define PVR_603ev    0x00070000
>> +#define PVR_603r     0x00071000
>> +#define PVR_604      0x00040000
>> +#define PVR_604e     0x00090000
>> +#define PVR_604r     0x000A0000
>> +#define PVR_620      0x00140000
>> +#define PVR_740      0x00080000
>> +#define PVR_750      PVR_740
>> +#define PVR_740P     0x10080000
>> +#define PVR_750P     PVR_740P
>> +#define PVR_7400     0x000C0000
>> +#define PVR_7410     0x800C0000
>> +#define PVR_7450     0x80000000
>> +#define PVR_8540     0x80200000
>> +#define PVR_8560     0x80200000
>> +/*
>> + * For the 8xx processors, all of them report the same PVR family for
>> + * the PowerPC core. The various versions of these processors must be
>> + * differentiated by the version number in the Communication Processor
>> + * Module (CPM).
>> + */
>> +#define PVR_821  0x00500000
>> +#define PVR_823  PVR_821
>> +#define PVR_850  PVR_821
>> +#define PVR_860  PVR_821
>> +#define PVR_8240 0x00810100
>> +#define PVR_8245 0x80811014
>> +#define PVR_8260 PVR_8240
>> +
>> +/* 64-bit processors */
>> +#define PVR_NORTHSTAR 0x0033
>> +#define PVR_PULSAR    0x0034
>> +#define PVR_POWER4    0x0035
>> +#define PVR_ICESTAR   0x0036
>> +#define PVR_SSTAR     0x0037
>> +#define PVR_POWER4p   0x0038
>> +#define PVR_970       0x0039
>> +#define PVR_POWER5    0x003A
>> +#define PVR_POWER5p   0x003B
>> +#define PVR_970FX     0x003C
>> +#define PVR_POWER6    0x003E
>> +#define PVR_POWER7    0x003F
>> +#define PVR_630       0x0040
>> +#define PVR_630p      0x0041
>> +#define PVR_970MP     0x0044
>> +#define PVR_970GX     0x0045
>> +#define PVR_POWER7p   0x004A
>> +#define PVR_POWER8E   0x004B
>> +#define PVR_POWER8NVL 0x004C
>> +#define PVR_POWER8    0x004D
>> +#define PVR_POWER9    0x004E
>> +#define PVR_POWER10   0x0080
>> +#define PVR_BE        0x0070
>> +#define PVR_PA6T      0x0090
>> +
>> +/* Macro to adjust thread priority for hardware multithreading */
>> +#define HMT_very_low()  asm volatile (" or %r31, %r31, %r31 ")
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +#include <xen/types.h>
> 
> ... another time here? Or is the first one perhaps too early?

Yes, the first include was a mistake -- this is the intended location.
Will fix.

> 
>> +/* User-accessible registers: nost of these need to be saved/restored
>> + * for every nested Xen invocation. */
> 
> Nit: Comment style. Multi-line comments want to be
> 
> /*
>  * User-accessible registers: most of these need to be saved/restored
>  * for every nested Xen invocation.
>  */
> 
> (also note the s/nost/most/ I did)

Will fix.

> 
>> --- a/xen/arch/ppc/ppc64/head.S
>> +++ b/xen/arch/ppc/ppc64/head.S
>> @@ -18,6 +18,15 @@ ENTRY(start)
>>      li %r11, 0
>>      stdu %r11, -STACK_FRAME_OVERHEAD(%r1)
>>  
>> +    /* clear .bss */
>> +    LOAD_IMM32(%r14, __bss_start)
>> +    LOAD_IMM32(%r15, __bss_end)
> 
> Question regarding addressing again.

Hopefully the above explanation answered your questions, but just to
summarize: Xen will always reside within the first 4G of physical
address space.

Also, as mentioned in your review of patch 1/3, this will soon be
changed to use TOC-relative addressing instead of immediate addressing.

> 
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
>> +
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
>> +    bcl 20, 31,.+4
>> +0:  mflr %r4
>> +    addi %r4, %r4,(1f - 0b)
> 
> Nit: Missing blank after last comma. I also wonder whether the parentheses
> are doing any good here.

Will fix the blank. The parentheses here are also unnecessary, so I can
remove them.

> Jan

Thanks,
Shawn

