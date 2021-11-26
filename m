Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A28545F311
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 18:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233291.404698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfCM-00015I-2q; Fri, 26 Nov 2021 17:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233291.404698; Fri, 26 Nov 2021 17:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfCL-00012t-W4; Fri, 26 Nov 2021 17:39:45 +0000
Received: by outflank-mailman (input) for mailman id 233291;
 Fri, 26 Nov 2021 17:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m7Hm=QN=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1mqfCK-00012j-FN
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 17:39:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d6092a6d-4edf-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 18:39:42 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A6CC11D4;
 Fri, 26 Nov 2021 09:39:41 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C14D3F7B4;
 Fri, 26 Nov 2021 09:39:40 -0800 (PST)
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
X-Inumbo-ID: d6092a6d-4edf-11ec-9787-a32c541c8605
Date: Fri, 26 Nov 2021 17:39:37 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <stefano.stabellini@xilinx.com>, <julien@xen.org>,
 <Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
 <rahul.singh@arm.com>
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
Message-ID: <20211126173937.2d28c47d@donnerap.cambridge.arm.com>
In-Reply-To: <5d72345d-3236-0fa6-24fc-652385f41b54@xilinx.com>
References: <20211119165202.42442-1-ayankuma@xilinx.com>
	<20211126131459.2bbc81ad@donnerap.cambridge.arm.com>
	<5d72345d-3236-0fa6-24fc-652385f41b54@xilinx.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Nov 2021 15:28:06 +0000
Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:

Hi Ayan,

> Many thanks for your inputs.
> Apologies if I sound dumb, but I need a few clarifications.
> 
> On 26/11/2021 13:14, Andre Przywara wrote:
> > On Fri, 19 Nov 2021 16:52:02 +0000
> > Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
> > 
> > Hi,
> >   
> >> At present, post indexing instructions are not emulated by Xen.
> >> When Xen gets the exception, EL2_ESR.ISV bit not set. Thus as a
> >> result, data abort is triggered.
> >>
> >> Added the logic to decode ldr/str post indexing instructions.
> >> With this, Xen can decode instructions like these:-
> >> ldr w2, [x1], #4
> >> Thus, domU can read ioreg with post indexing instructions.  
> > 
> > Where do those instructions come from? A (C) compiler? (Some mail in
> > another thread from Stefano suggests so)
> > If yes, I would argue that is broken:
> > IIUC C compilers assume normal memory attributes for every pointer they
> > handle, so they are free to use unaligned accesses, load/store exclusives,
> > split accesses (two halfword reads) and what not when generating code.
> > The GIC needs to be mapped as device memory, which explicitly forbids
> > unaligned accesses and exclusives (as in: always traps), so you cannot let
> > compiler-generated code access the GIC (or most other MMIO devices, for
> > that matter).
> > I know, this somewhat works(TM) in practise, because a uint32_t assignment
> > is very likely to end up in an ldr/str, but please let me know which car
> > this code ends up in, so that can I avoid this brand ;-)
> > 
> > You can tell the compiler to avoid unaligned accesses with -mstrict-align
> > (and should definitely do so when you are running C code with the MMU
> > off), but that still leaves exclusives and split accesses at the
> > compiler's discretion. A variation on the topic of split access is merged
> > writes, where the compiler uses NEON or SVE instructions, for instance, to
> > cover multiple words at once, possibly via some memset()/memcpy() routine.  
> 
> I understand that we should be using inline assembly instructions to 
> access any MMIO region. This is to prevent the compiler doing any tricks.
> 
> But is there a restriction that post indexing instructions can never be 
> used to access MMIO region ?

No, this is a pure virtualisation restriction, see below. On real
hardware/bare-metal, ldr/str with post or pre-indexing works and is fine
to use for MMIO.
But we need to have the right access width, matching the MMIO device's
expectation. So ldp/stp would probably be problematic, for instance.

> > On top there is this architectural restriction of the ARMv7/v8
> > virtualisation extension to not decode many "advanced" load/store
> > instructions in ESR_EL2.  
> Where do I find this restriction ?

That's described in the ESR_ELx syndrome description in the ARMv8 ARM (DDI
0487G.b), section "ISS encoding for an exception from a Data Abort" (page
D13-3219 in my Issue G.b copy):
"For other faults reported in ESR_EL2, ISV is 0 except for the following stage 2 aborts: ...."

> Are you telling me that load/store with post indexing is an "advanced" 
> instruction and ArmV8 does not allow decoding of these instructions in 
> ESR_EL2 ?

Yes, it is in the group of instructions for which the hardware does not
provide syndrome information in ESR_EL2: " .... but excluding Load
Exclusive or Store Exclusive and excluding those with writeback)."

> Isn't that a very strong limitation ?

I don't know about that, it's what it is and what it was for years. Linux
deliberately chose ldr/str only for readl/writel to be able to trap and
handle MMIO aborts in hypervisors.

If you do MMIO accesses the right way, using (inline) assembly only, then
you don't have the problem, and also avoid many others, see my previous
mail.

If you think of it from an architectural and implementation point of view
(and keep the RISC idea in mind): it should happen rarely, but would
require many gates for something that you can do in software as well.

> Also what is your opinion on Xen decoding these instructions ?

I would be careful, we deliberately avoid this in KVM. This bubbles up
from time to time, though, so we now allow delegating this case to
userland, so the VMM can do the decoding there.
In Xen you have less issues with walking the guest's page tables,
though (a major problem in KVM), but it still adds complexity to a
hypervisor which aims to be lean by design.
Another argument would be that just post/pre does not cover everything, and
the cases start to pile up quickly: what about the immediate versions,
ldxr, stp, NEON/SVE load/stores, etc. Since many of those are not safe for
MMIO anyway, you add a lot of code for little use (and which gets little
testing!).

Cheers,
Andre

> > Linux deliberately coded readl/writel using inline assembly, to only
> > use instructions that provide syndrome information, plus guarantee
> > device-memory compatible semantics.
> > Check out https://lwn.net/Articles/698014/ for a comprehensive
> > discussion of this whole MMIO topic.
> > 
> > So I think you should do the same in your guest/bare metal code: define
> > {read,write}{b,h,l,q} as inline assembly functions, using ldr?/str?
> > only. See xen/include/asm-arm/arm64/io.h for an example that uses
> > static inline functions in a header file, to generate most optimal
> > code. Then always do MMIO only via those accessors. That prevents any
> > future compiler surprises, plus makes you perfectly virtualisable.
> > 
> > Cheers,
> > Andre.
> >   
> >> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> >> ---
> >> Note to reviewer:-
> >> This patch is based on an issue discussed in
> >> https://lists.xenproject.org/archives/html/xen-devel/2021-11/msg00969.html
> >> "Xen/ARM - Query about a data abort seen while reading GICD registers"
> >>
> >>
> >>   xen/arch/arm/decode.c | 77
> >> +++++++++++++++++++++++++++++++++++++++++++ xen/arch/arm/io.c     |
> >> 14 ++++++-- 2 files changed, 88 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> >> index 792c2e92a7..7b60bedbc5 100644
> >> --- a/xen/arch/arm/decode.c
> >> +++ b/xen/arch/arm/decode.c
> >> @@ -84,6 +84,80 @@ bad_thumb2:
> >>       return 1;
> >>   }
> >>   
> >> +static inline int32_t extract32(uint32_t value, int start, int
> >> length) +{
> >> +    int32_t ret;
> >> +
> >> +    if ( !(start >= 0 && length > 0 && length <= 32 - start) )
> >> +        return -EINVAL;
> >> +
> >> +    ret = (value >> start) & (~0U >> (32 - length));
> >> +
> >> +    return ret;
> >> +}
> >> +
> >> +static int decode_64bit_loadstore_postindexing(register_t pc, struct
> >> hsr_dabt *dabt) +{
> >> +    uint32_t instr;
> >> +    int size;
> >> +    int v;
> >> +    int opc;
> >> +    int rt;
> >> +    int imm9;
> >> +
> >> +    /* For details on decoding, refer to Armv8 Architecture
> >> reference manual
> >> +     * Section - "Load/store register (immediate post-indexed)", Pg
> >> 318
> >> +    */
> >> +    if ( raw_copy_from_guest(&instr, (void * __user)pc, sizeof
> >> (instr)) )
> >> +        return -EFAULT;
> >> +
> >> +    /* First, let's check for the fixed values */
> >> +
> >> +    /*  As per the "Encoding table for the Loads and Stores group",
> >> Pg 299
> >> +     * op4 = 1 - Load/store register (immediate post-indexed)
> >> +     */
> >> +    if ( extract32(instr, 10, 2) != 1 )
> >> +        goto bad_64bit_loadstore;
> >> +
> >> +    /* For the following, refer to "Load/store register (immediate
> >> post-indexed)"
> >> +     * to get the fixed values at various bit positions.
> >> +     */
> >> +    if ( extract32(instr, 21, 1) != 0 )
> >> +        goto bad_64bit_loadstore;
> >> +
> >> +    if ( extract32(instr, 24, 2) != 0 )
> >> +        goto bad_64bit_loadstore;
> >> +
> >> +    if ( extract32(instr, 27, 3) != 7 )
> >> +        goto bad_64bit_loadstore;
> >> +
> >> +    size = extract32(instr, 30, 2);
> >> +    v = extract32(instr, 26, 1);
> >> +    opc = extract32(instr, 22, 1);
> >> +
> >> +    /* At the moment, we support STR(immediate) - 32 bit variant and
> >> +     * LDR(immediate) - 32 bit variant only.
> >> +     */
> >> +    if (!((size==2) && (v==0) && ((opc==0) || (opc==1))))
> >> +        goto bad_64bit_loadstore;
> >> +
> >> +    rt = extract32(instr, 0, 5);
> >> +    imm9 = extract32(instr, 12, 9);
> >> +
> >> +    if ( imm9 < 0 )
> >> +        update_dabt(dabt, rt, size, true);
> >> +    else
> >> +        update_dabt(dabt, rt, size, false);
> >> +
> >> +    dabt->valid = 1;
> >> +
> >> +
> >> +    return 0;
> >> +bad_64bit_loadstore:
> >> +    gprintk(XENLOG_ERR, "unhandled 64bit instruction 0x%x\n", instr);
> >> +    return 1;
> >> +}
> >> +
> >>   static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
> >>   {
> >>       uint16_t instr;
> >> @@ -155,6 +229,9 @@ int decode_instruction(const struct cpu_user_regs
> >> *regs, struct hsr_dabt *dabt) if ( is_32bit_domain(current->domain)
> >> && regs->cpsr & PSR_THUMB ) return decode_thumb(regs->pc, dabt);
> >>   
> >> +    if ( is_64bit_domain(current->domain) )
> >> +        return decode_64bit_loadstore_postindexing(regs->pc, dabt);
> >> +
> >>       /* TODO: Handle ARM instruction */
> >>       gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
> >>   
> >> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> >> index 729287e37c..49e80358c0 100644
> >> --- a/xen/arch/arm/io.c
> >> +++ b/xen/arch/arm/io.c
> >> @@ -106,14 +106,13 @@ enum io_state try_handle_mmio(struct
> >> cpu_user_regs *regs, .gpa = gpa,
> >>           .dabt = dabt
> >>       };
> >> +    int rc;
> >>   
> >>       ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
> >>   
> >>       handler = find_mmio_handler(v->domain, info.gpa);
> >>       if ( !handler )
> >>       {
> >> -        int rc;
> >> -
> >>           rc = try_fwd_ioserv(regs, v, &info);
> >>           if ( rc == IO_HANDLED )
> >>               return handle_ioserv(regs, v);
> >> @@ -123,7 +122,16 @@ enum io_state try_handle_mmio(struct
> >> cpu_user_regs *regs, 
> >>       /* All the instructions used on emulated MMIO region should be
> >> valid */ if ( !dabt.valid )
> >> -        return IO_ABORT;
> >> +    {
> >> +        /*
> >> +         * Post indexing ldr/str instructions are not emulated by
> >> Xen. So, the
> >> +         * ISS is invalid. In such a scenario, we try to manually
> >> decode the
> >> +         * instruction from the program counter.
> >> +         */
> >> +        rc = decode_instruction(regs, &info.dabt);
> >> +        if ( rc )
> >> +            return IO_ABORT;
> >> +    }
> >>   
> >>       /*
> >>        * Erratum 766422: Thumb store translation fault to Hypervisor
> >> may  
> >   


