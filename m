Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A74866C5
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 16:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254109.435649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Ulk-0002wd-Bx; Thu, 06 Jan 2022 15:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254109.435649; Thu, 06 Jan 2022 15:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Ulk-0002ty-8P; Thu, 06 Jan 2022 15:33:36 +0000
Received: by outflank-mailman (input) for mailman id 254109;
 Thu, 06 Jan 2022 15:33:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ato=RW=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1n5Uli-0002ts-T5
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 15:33:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 00977ce3-6f06-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 16:33:31 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8C101042;
 Thu,  6 Jan 2022 07:33:30 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB2C03F5A1;
 Thu,  6 Jan 2022 07:33:29 -0800 (PST)
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
X-Inumbo-ID: 00977ce3-6f06-11ec-81c0-a30af7de8005
Date: Thu, 6 Jan 2022 15:33:27 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, "stefanos@xilinx.com" <stefanos@xilinx.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
Message-ID: <20220106153327.6ebb2be1@donnerap.cambridge.arm.com>
In-Reply-To: <0f6e058a-bc23-2a77-6797-39bfacb7db79@xilinx.com>
References: <20211129191638.19877-1-ayankuma@xilinx.com>
	<20211130094950.1bf368d6@donnerap.cambridge.arm.com>
	<a69d41f1-7b57-c127-ae73-2de5a581dddd@xilinx.com>
	<D8811539-65F2-4D40-BFEF-CE72EA8E902A@arm.com>
	<4315f3f8-4431-3257-dc95-a3089532237b@xen.org>
	<20211208120048.63fbf49b@donnerap.cambridge.arm.com>
	<0f6e058a-bc23-2a77-6797-39bfacb7db79@xilinx.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Jan 2022 16:55:11 +0000
Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:

Hi,

> Thank you so much for your feedback.
> 
> I need a couple of clarifications before I can start with the v3 patch.
> 
> On 08/12/2021 12:00, Andre Przywara wrote:
> > On Mon, 6 Dec 2021 19:31:06 +0000
> > Julien Grall <julien@xen.org> wrote:
> >
> > Hi,
> >  
> >> On 01/12/2021 08:41, Bertrand Marquis wrote:  
> >>> Hi Ayan,
> >>>      
> >>>> On 30 Nov 2021, at 19:13, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
> >>>>
> >>>> Hi Andre,
> >>>>
> >>>> Thanks for your comments. They are useful.
> >>>>
> >>>> On 30/11/2021 09:49, Andre Przywara wrote:  
> >>>>> On Mon, 29 Nov 2021 19:16:38 +0000
> >>>>> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
> >>>>> Hi,  
> >>>>>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
> >>>>>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
> >>>>>> could use to access MMIO regions.
> >>>>>>
> >>>>>> For instance, Xilinx baremetal OS will use:
> >>>>>>
> >>>>>>           volatile u32 *LocalAddr = (volatile u32 *)Addr;
> >>>>>>           *LocalAddr = Value;
> >>>>>>
> >>>>>> This leave the compiler to decide which store instructions to use.  
> >>>>> As mentioned in the other email, this is wrong, if this points to MMIO:
> >>>>> don't let the compiler do MMIO accesses. If a stage 2 fault isn't in
> >>>>> an MMIO area, you should not see traps that you cannot handle already.
> >>>>> So I don't think it's a good idea to use that as an example. And since
> >>>>> this patch only seems to address this use case, I would doubt its
> >>>>> usefulness in general.  
> >>>> Yes, I should have fixed the comment.
> >>>>
> >>>> Currently, I am testing with baremetal app which uses inline assembly code with post indexing instructions, to access the MMIO.
> >>>>
> >>>> ATM, I am testing with 32 bit MMIO only.
> >>>>
> >>>> On the usefulness, I am kind of torn as it is legitimate for post indexing instructions to be used in an inline-assembly code for accessing MMIO. However, that may not be something commonly seen.
> >>>>
> >>>> @Stefano/Bertrand/Julien/Volodymyr :- As you are the Arm mantainers, can you comment if we should have decoding logic or not ?  
> >>> Andre gave you the official statement from Arm and there is nothing more I can say.  
> >> I think this would be handy for other hypervisor and OS developper to
> >> know what they can expect when running in a virtualized environment. So
> >> would it be possible to update the Arm Arm reflecting this statement?  
> > I don't think it's within the scope of the ARM ARM to say that. It just
> > says that "there is no syndrome information", and your mileage may vary in
> > working around that.
> >
> > Personally I would say that if you expect your software to work nicely
> > under a hypervisor, then just avoid those instructions. The Linux kernel
> > certainly did so.
> >
> > You can try to do instruction emulation, but doing this right can get
> > tricky quickly: think about I$/D$ coherency, MMU on or off, etc.  
> 
> I am trying to get all the restrictions that need to be checked. I have 
> referred 
> https://developer.arm.com/documentation/dui0802/a/A64-General-Instructions/Register-restrictions-for-A64-instructions?lang=en 
> and "Arm A64 Instruction Set Architecture - DDI 0596" - LDR (immediate).
> 
> So far I only see the following restrictions:-
> 
> Rn -ne Rt
> 
> Rt -ne SP
> 
> You had mentioned the following cases :-
> 
> 1. XZR vs SP - I see that both these refer to register no 31. Xen gets 
> the register number (for Rn/Rt) only, so I am not sure what is to be 
> done here.

But the emulation code in Xen needs to know whether number 31 refers to the
stack pointer or to the zero register. This depends on the context of the
instruction. It's nothing magical about it, you just need to figure out
which it is in your case and make sure that the code uses the right
value. In the LDR case n==31 means SP, but t==31 means XZR. The emulation
would need to consider this.

> 2. MMU on or off - As I see in try_handle_mmio(), one gets the physical 
> address in gpa. So I am not sure what is to be done here.

You *might* be fine, if Xen takes care of that, I don't know.
But it needs to explicitly consider those two cases - and also make
sure that caching effects are cared for.

> 3. I/D coherency - I don't understand how this affects instruction decoding.

In the ARM architecture the I cache and D cache are not necessarily
coherent. So whatever the CPU reads via the data bus does not need to be
the same data that the instruction fetcher read a while ago. And while
there is a well-known sequence to make the current data side visible to
the instruction side, there is nothing architectural for the other way
around.
For example the CPU fetches a bunch of instructions into the I cache, then
consumes it from there. Now some code changes those instruction words in
"memory". Without explicit D-cache-clean-to-the-PoU and
I-cache-invalidate+ISB the CPU might still execute the old instructions.
But if your emulation code tries to read the instruction from memory, it
fetches the data-visible side of it - which is not what the CPU executed,
so end up emulating the wrong thing.

Please also keep in mind that the architecture does not *guarantee*
coherency, but in reality it might actually be coherent - either because
of the particular silicon implementation, or because of side effects in
the system (data cache line being evicted, ISB executed). So seeing the
effects of coherency in your testing does not mean you are safe, it might
just happen by chance.

Cheers,
Andre

> Please help me to understand further.
> 
> - Ayan
> 
> >  
> >>> I will leave this decision to Stefano and Julien.  
> >> I have had a chat on IRC with Stefano about this. I think the main
> >> sticking point is the Arm Arm doesn't clearly state those instructions
> >> should not be used by a virtualized OS on MMIO regions.  
> > I don't understand why the ARM ARM would need to say that. Certainly you
> > realise that immediately when trying to use them, and apparently it was not
> > a problem in the last 8ish years of Xen/ARM's existence.
> >
> > So it's your decision on having the emulation, I personally would only do
> > it when there is a *good* use case.
> > And please apply the demanded scrutiny on the review - including all the
> > corner cases like Rn=Rt, XZR vs. SP (as Jan said) and possibly MMU status.
> >
> > Cheers,
> > Andre
> >  
> >> To me, this topic looks similar to the set/way instruction dilemma. They
> >> are a pain to virtualize (and the Arm Arm clearly hint it) but we had to
> >> do it because some OSes relied on them.
> >>
> >> I think the main difference is the Arm Arm doesn't hint they should not
> >> be used (it only says a valid syndrome is not provided) and the
> >> implementation should hopefully be smaller and self-contained.
> >>
> >> So I would be inclined to allow Xen to decode post-indexing instructions
> >> (pending the review).
> >>
> >> Cheers,
> >>  


