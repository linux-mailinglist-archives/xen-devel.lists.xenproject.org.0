Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83FC46D2DD
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 13:01:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242232.419011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muvd2-0005A2-Gt; Wed, 08 Dec 2021 12:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242232.419011; Wed, 08 Dec 2021 12:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muvd2-000584-C9; Wed, 08 Dec 2021 12:00:56 +0000
Received: by outflank-mailman (input) for mailman id 242232;
 Wed, 08 Dec 2021 12:00:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=90lV=QZ=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1muvd1-00056B-CO
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 12:00:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7db73811-581e-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 13:00:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 397D91042;
 Wed,  8 Dec 2021 04:00:52 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1217D3F73B;
 Wed,  8 Dec 2021 04:00:50 -0800 (PST)
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
X-Inumbo-ID: 7db73811-581e-11ec-9d12-4777fae47e2b
Date: Wed, 8 Dec 2021 12:00:48 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Ayan Kumar Halder
 <ayan.kumar.halder@xilinx.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, "stefanos@xilinx.com" <stefanos@xilinx.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
Message-ID: <20211208120048.63fbf49b@donnerap.cambridge.arm.com>
In-Reply-To: <4315f3f8-4431-3257-dc95-a3089532237b@xen.org>
References: <20211129191638.19877-1-ayankuma@xilinx.com>
 <20211130094950.1bf368d6@donnerap.cambridge.arm.com>
 <a69d41f1-7b57-c127-ae73-2de5a581dddd@xilinx.com>
 <D8811539-65F2-4D40-BFEF-CE72EA8E902A@arm.com>
 <4315f3f8-4431-3257-dc95-a3089532237b@xen.org>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 6 Dec 2021 19:31:06 +0000
Julien Grall <julien@xen.org> wrote:

Hi,

> On 01/12/2021 08:41, Bertrand Marquis wrote:
> > Hi Ayan,
> >   
> >> On 30 Nov 2021, at 19:13, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
> >>
> >> Hi Andre,
> >>
> >> Thanks for your comments. They are useful.
> >>
> >> On 30/11/2021 09:49, Andre Przywara wrote:  
> >>> On Mon, 29 Nov 2021 19:16:38 +0000
> >>> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
> >>> Hi,  
> >>>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
> >>>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
> >>>> could use to access MMIO regions.
> >>>>
> >>>> For instance, Xilinx baremetal OS will use:
> >>>>
> >>>>          volatile u32 *LocalAddr = (volatile u32 *)Addr;
> >>>>          *LocalAddr = Value;
> >>>>
> >>>> This leave the compiler to decide which store instructions to use.  
> >>> As mentioned in the other email, this is wrong, if this points to MMIO:
> >>> don't let the compiler do MMIO accesses. If a stage 2 fault isn't in
> >>> an MMIO area, you should not see traps that you cannot handle already.
> >>> So I don't think it's a good idea to use that as an example. And since
> >>> this patch only seems to address this use case, I would doubt its
> >>> usefulness in general.  
> >> Yes, I should have fixed the comment.
> >>
> >> Currently, I am testing with baremetal app which uses inline assembly code with post indexing instructions, to access the MMIO.
> >>
> >> ATM, I am testing with 32 bit MMIO only.
> >>
> >> On the usefulness, I am kind of torn as it is legitimate for post indexing instructions to be used in an inline-assembly code for accessing MMIO. However, that may not be something commonly seen.
> >>
> >> @Stefano/Bertrand/Julien/Volodymyr :- As you are the Arm mantainers, can you comment if we should have decoding logic or not ?  
> > 
> > Andre gave you the official statement from Arm and there is nothing more I can say.  
> 
> I think this would be handy for other hypervisor and OS developper to 
> know what they can expect when running in a virtualized environment. So 
> would it be possible to update the Arm Arm reflecting this statement?

I don't think it's within the scope of the ARM ARM to say that. It just
says that "there is no syndrome information", and your mileage may vary in
working around that.

Personally I would say that if you expect your software to work nicely
under a hypervisor, then just avoid those instructions. The Linux kernel
certainly did so.

You can try to do instruction emulation, but doing this right can get
tricky quickly: think about I$/D$ coherency, MMU on or off, etc.

> > I will leave this decision to Stefano and Julien.  
> 
> I have had a chat on IRC with Stefano about this. I think the main 
> sticking point is the Arm Arm doesn't clearly state those instructions 
> should not be used by a virtualized OS on MMIO regions.

I don't understand why the ARM ARM would need to say that. Certainly you
realise that immediately when trying to use them, and apparently it was not
a problem in the last 8ish years of Xen/ARM's existence.

So it's your decision on having the emulation, I personally would only do
it when there is a *good* use case.
And please apply the demanded scrutiny on the review - including all the
corner cases like Rn=Rt, XZR vs. SP (as Jan said) and possibly MMU status.

Cheers,
Andre

> To me, this topic looks similar to the set/way instruction dilemma. They 
> are a pain to virtualize (and the Arm Arm clearly hint it) but we had to 
> do it because some OSes relied on them.
> 
> I think the main difference is the Arm Arm doesn't hint they should not 
> be used (it only says a valid syndrome is not provided) and the 
> implementation should hopefully be smaller and self-contained.
> 
> So I would be inclined to allow Xen to decode post-indexing instructions 
> (pending the review).
> 
> Cheers,
> 


