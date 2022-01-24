Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E8A49887F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 19:42:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259959.448822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC4HK-0004VV-4E; Mon, 24 Jan 2022 18:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259959.448822; Mon, 24 Jan 2022 18:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC4HK-0004S8-0I; Mon, 24 Jan 2022 18:41:22 +0000
Received: by outflank-mailman (input) for mailman id 259959;
 Mon, 24 Jan 2022 18:41:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ZXe=SI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nC4HI-0004S2-QX
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 18:41:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 380089d9-7d45-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 19:41:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23E2FB81214;
 Mon, 24 Jan 2022 18:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69413C340E5;
 Mon, 24 Jan 2022 18:41:16 +0000 (UTC)
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
X-Inumbo-ID: 380089d9-7d45-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643049676;
	bh=NI978rdnPcW2AHan+4mwVzjOEo+l8dBmZipLO/dRm4Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hE74JwJPYfaY7heVfSzBV8TTMhI0DMVQWd9+ThM0L5TqShzSPevJf50/cXRwVerjf
	 fa54mR25Ou/7bx6CDSMSks37bRzm45u3VXgHKRY1cRhTWWjVpXzRd8Lcj+WytygkRr
	 /HrEV+JVRPZJNjSpGD5B0PGCBfTpc4xKybUHWJrB5uvNJQLTJ/O8Z2zhJsvkGwkrGA
	 TUg55I0beFQnqqUM3rJ3heWR90DEpqe+Uf8qguwM1O3/m9H/4klwg/h58sP6P1ZTwi
	 q0401GedUzk8Qf+ILk1uf2eizXebo94EuMWksTEoMzy2bxQcblCDXfb7731ETPNsJr
	 u6E1TmA5jJWoA==
Date: Mon, 24 Jan 2022 10:41:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: Andre Przywara <andre.przywara@arm.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, jbeulich@suse.com, 
    wei.chen@arm.com
Subject: Re: [XEN v3] xen/arm64: io: Decode ldr/str post-indexing
 instructions
In-Reply-To: <bae9a35f-be42-2ebe-5ce0-30e08001ae97@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2201240941310.27308@ubuntu-linux-20-04-desktop>
References: <20220120215527.28138-1-ayankuma@xilinx.com> <20220122013046.6a786d3f@slackpad.fritz.box> <18e715ae-111d-58e6-55f9-a48a521e99b3@xilinx.com> <20220124143601.3e2ac6ac@donnerap.cambridge.arm.com> <bae9a35f-be42-2ebe-5ce0-30e08001ae97@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jan 2022, Ayan Kumar Halder wrote:
> Hi Andre,
> 
> Thanks forn your comments.
> 
> On 24/01/2022 14:36, Andre Przywara wrote:
> > On Mon, 24 Jan 2022 12:07:42 +0000
> > Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
> > 
> > Hi Ayan,
> > 
> > > Many thanks for your feedback. I have one clarification :-
> > > 
> > > On 22/01/2022 01:30, Andre Przywara wrote:
> > > > On Thu, 20 Jan 2022 21:55:27 +0000
> > > > Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
> > > > 
> > > > Hi,
> > > >   
> > > > > At the moment, Xen is only handling data abort with valid syndrome
> > > > > (i.e.
> > > > > ISV=0). Unfortunately, this doesn't cover all the instructions a
> > > > > domain
> > > > > could use to access MMIO regions.
> > > > > 
> > > > > For instance, a baremetal OS can use any of the following
> > > > > instructions, where
> > > > > x1 contains the address of the MMIO region:
> > > > > 
> > > > > 1.      ldr     x2,    [x1],    #4
> > > > That looks dodgy, since is misaligns the pointer afterwards. MMIO
> > > > access typically go to device memory, which must be naturally aligned.
> > > > Just don't give a bad example here and change that to a multiple of 8.
> > > >   
> > > > > 2.      ldr     w2,    [x1],    #-4
> > > > (this one is fine, btw, because it's a 32-bit read)
> > > >   
> > > > > 3.      ldr     x2,    [x1],    #-8
> > > > > 4.      ldr     w2,    [x1],    #4
> > > > > 5.      ldrh    w2,    [x1],    #8
> > > > > 6.      ldrb    w2,    [x1],    #16
> > > > More naturally I'd use the data size of the postindex value ...
> > > > ldr  x2 ... #-8
> > > > ldr  w2 ... #4
> > > > ldrh w2 ... #2
> > > > ldrb w2 ... #1
> > > >   
> > > > > 7.      str     x2,    [x1],    #4
> > > > This is a again problematic, because x1 is not 8-byte aligned anymore
> > > > after that.
> > > >   
> > > > > 8.      str     w2,    [x1],    #-4
> > > > > 9.      strh    w2,    [x1],    #8
> > > > > 10.     strb    w2,    [x1],    #16
> > > > > 
> > > > > In the following two instructions, sp contains the address of the MMIO
> > > > > region:-
> > > > Really? I don't think you should give people funny ideas, just mention
> > > > that the Rn register could theoretically be the stack pointer.
> > > >   
> > > > > 11.     ldrb    w2,    [sp],    #16
> > > > > 12.     ldrb    wzr,   [sp],    #16
> > > > > 
> > > > > In order to handle post-indexing store/load instructions (like those
> > > > > mentioned
> > > > > above), Xen will need to fetch and decode the instruction.
> > > > > 
> > > > > This patch only cover post-index store/load instructions from AArch64
> > > > > mode.
> > > > > For now, this is left unimplemented for trap from AArch32 mode.
> > > > > 
> > > > > Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> > > > > ---
> > > > > 
> > > > > Changelog :-
> > > > > v2 - 1. Updated the rn register after reading from it. (Pointed by
> > > > > Julien,
> > > > >           Stefano)
> > > > >        2. Used a union to represent the instruction opcode (Suggestd
> > > > > by Bertrand)
> > > > >        3. Fixed coding style issues (Pointed by Julien)
> > > > >        4. In the previous patch, I was updating dabt->sign based on
> > > > > the signedness
> > > > >           of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI
> > > > > 0487G.b,
> > > > >           Page 3221, SSE indicates the signedness of the data item
> > > > > loaded. In our
> > > > >           case, the data item loaded is always unsigned.
> > > > > 
> > > > > v3- 1. Handled all the variants of ldr/str (ie 64, 32, 16, 8 bit
> > > > > variants).
> > > > >          Thus, I have removed the check for "instr->code.opc == 0"
> > > > > (Suggested by
> > > > >          Andre)
> > > > >       2. Handled the scenario when rn = SP, rt = XZR (Suggested by
> > > > > Jan, Andre)
> > > > >       3. Added restriction for "rt != rn" (Suggested by Andre)
> > > > >       4. Moved union ldr_str_instr_class {} to decode.h. This is the
> > > > > header included
> > > > >          by io.c and decode.c (where the union is referred).
> > > > > (Suggested by Jan)
> > > > >       5. Indentation and typo fixes (Suggested by Jan)
> > > > > 
> > > > > Changes suggested but could not be considered due to reasons :-
> > > > >       1. Using accessor macros instead of bitfields for
> > > > > "ldr_str_instr_class". (Andre)
> > > > >          Reason - I could not find a simple way to represent 9 bit
> > > > > signed integer
> > > > >          (ie imm9) without using bitfields. If I use accessor macros,
> > > > > then I need
> > > > >          to manually calculate two's complement to obtain the value
> > > > > when signed
> > > > >          bit is present.
> > > > > 
> > > > >       2. I/D cache cohenerncy (Andre)
> > > > >          Reason :- I could not see any instruction to flush the I
> > > > > cache.
> > > > First, please try to avoid the term "flush", because it is somewhat
> > > > overloaded. The architecture speaks of "clean" and "invalidate", which
> > > > are more precise.
> > > > Assuming you mean "clean" here: conceptually there is no such thing for
> > > > the I cache, because it's always clean. The I$ will only be read from
> > > > the CPU side - from the instruction fetcher - there is nothing written
> > > > back through it. Every store goes through the data path - always.
> > > > That is the problem that I tried to sketch you previously: you don't
> > > > have a guarantee that the instruction you read from memory is the same
> > > > that the CPU executed. The guest could have changed the instruction
> > > > after the I$ fetched that. So the CPU will execute (and trap) on
> > > > instruction X, but you will read Y. I leave it up to your imagination
> > > > if that could be exploited.
> > > I see what you mean.
> > > 
> > > Refer Armv8 Arm DDI 0487G.b Page D1-2476, it says that (for instr/data
> > > abort) the faulting virtual address and IPA is saved in FAR_ELx and
> > > HPFAR_EL2 respectively. But, I do not see if the faulting instruction is
> > > saved in any special register. Is there something I am missing ?
> > No, indeed there is no such thing. You get the address, but not the
> > faulting instruction. It would indeed be nice to have from a software
> > developer's point of view, but the architecture does not support it.
> > One reason might be that it's potentially hard to implement, because it
> > could be tricky to reconstruct the original instruction, when it has been
> > broken down to something different in the actual pipelines.
> 
> Is it possible for Arm to implement such a register which will hold the
> instruction that caused the exception, in the future architecture revision ?
> This would be useful given that the faulting address (PC) can not be trusted
> to get to the original faulting instruction (as it can be changed after being
> loaded in I cache). I could imagine this being useful in any scenario when the
> user wants to know which instruction caused the fault.
> 
> Stefano/Julien/Bertrand/Volodymyr :- I would love to hear your inputs on this
> as well.
> 
> As for the patch, I will mention this issue (as a comment in the code) where
> we are loading the instruction from PC. Stefano/Julien/Bertrand/Volodymyr:-
> Does it look fine with you ?

As this issue could happen on any architecture (the guest could change
the instruction from another vcpu while the other is trapping in Xen)
and given that we do quite a bit of emulation on x86 I asked Jan on IRC
how do we handle this kind of things on x86 today. He had a good answer:
"By not making any assumptions on what we're going to find."

In other words, don't assume you are going to find a store or a load
instruction at the memory location pointed by the PC. You could find
total garbage (because it was changed in between). Make sure to check
everything is as expected before taking any actions.

And I think you are already doing that in decode_loadstore_postindexing.

These are the fields:

+ * 31 30 29  27 26 25  23   21 20              11   9         4       0
+ * ___________________________________________________________________
+ * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
+ * |____|______|__|____|____|__|_______________|____|_________|_______|
+ */
+union ldr_str_instr_class {
+    uint32_t value;
+    struct ldr_str {
+        unsigned int rt:5;     /* Rt register */
+        unsigned int rn:5;     /* Rn register */
+        unsigned int fixed1:2; /* value == 01b */
+        signed int imm9:9;            /* imm9 */
+        unsigned int fixed2:1; /* value == 0b */
+        unsigned int opc:2;    /* opc */
+        unsigned int fixed3:2; /* value == 00b */
+        unsigned int v:1;      /* vector */
+        unsigned int fixed4:3; /* value == 111b */
+        unsigned int size:2;   /* size */
+    } code;
+};


This patch already checks for:
- the fixed values
- v
- opc
- some special rt and rn values

Considering that:
- size is fine either way
- as rt and rn are 5 bits wide, all values are acceptable (x0->x31)

It doesn't look like we are missing anything, unless imm9 is restricted
to some ranges only.

