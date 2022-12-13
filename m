Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6118364BE26
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 21:56:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461156.719201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5CJI-0003oH-Ku; Tue, 13 Dec 2022 20:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461156.719201; Tue, 13 Dec 2022 20:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5CJI-0003lh-Hj; Tue, 13 Dec 2022 20:55:32 +0000
Received: by outflank-mailman (input) for mailman id 461156;
 Tue, 13 Dec 2022 20:55:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5CJH-0003lb-Bu
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 20:55:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5CJG-00035e-SH; Tue, 13 Dec 2022 20:55:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5CJG-00085K-MV; Tue, 13 Dec 2022 20:55:30 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=7ZWRSN+wWP8i4lrKdOuMjSki1Ve9CeXCg2rOUgdKsrQ=; b=yYS7PTrt7EoQctSWvHOutK/H2f
	hyIUVKdTU65+7CPd80SvVA6Izd8qf6MPyTfYkr99x9RDVIyqpC+QlpiOdimpmx15aRozyRJR7zwPG
	FsBdRacqNsp1OUm6W1OaxRRKUJN/F6U10JQj0V22rS1IHYrp0Bv6MJJKRrj58cATR2xU=;
Message-ID: <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
Date: Tue, 13 Dec 2022 20:55:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: "Smith, Jackson" <rsmith@RiversideResearch.org>
Cc: "Brookes, Scott" <sbrookes@RiversideResearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "demi@invisiblethingslab.com" <demi@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
In-Reply-To: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/12/2022 19:48, Smith, Jackson wrote:
> Hi Xen Developers,

Hi Jackson,

Thanks for sharing the prototype with the community. Some 
questions/remarks below.

> My team at Riverside Research is currently spending IRAD funding
> to prototype next-generation secure hypervisor design ideas
> on Xen. In particular, we are prototyping the idea of Virtual
> Memory Fuses for Software Enclaves, as described in this paper:
> https://www.nspw.org/papers/2020/nspw2020-brookes.pdf. Note that
> that paper talks about OS/Process while we have implemented the idea
> for Hypervisor/VM.
> 
> Our goal is to emulate something akin to Intel SGX or AMD SEV,
> but using only existing virtual memory features common in all
> processors. The basic idea is not to map guest memory into the
> hypervisor so that a compromised hypervisor cannot compromise
> (e.g. read/write) the guest. This idea has been proposed before,
> however, Virtual Memory Fuses go one step further; they delete the
> hypervisor's mappings to its own page tables, essentially locking
> the virtual memory configuration for the lifetime of the system. This
> creates what we call "Software Enclaves", ensuring that an adversary
> with arbitrary code execution in the hypervisor STILL cannot read/write
> guest memory.

I am confused, if the attacker is able to execute arbitrary code, then 
what prevent them to write code to map/unmap the page?

Skimming through the paper (pages 5-6), it looks like you would need to 
implement extra defense in Xen to be able to prevent map/unmap a page.

> 
> With this technique, we protect the integrity and confidentiality of
> guest memory. However, a compromised hypervisor can still read/write
> register state during traps, or refuse to schedule a guest, denying
> service. We also recognize that because this technique precludes
> modifying Xen's page tables after startup, it may not be compatible
> with all of Xen's potential use cases. On the other hand, there are
> some uses cases (in particular statically defined embedded systems)
> where our technique could be adopted with minimal friction.

 From what you wrote, this sounds very much like the project Citrix and 
Amazon worked on called "Secret-free hypervisor" with a twist. In your 
case, you want to prevent the hypervisor to map/unmap the guest memory.

You can find some details in [1]. The code is x86 only, but I don't see 
any major blocker to port it on arm64.

> 
> With this in mind our goal is to work with the Xen community to
> upstream this work as an optional feature. At this point, we have
> a prototype implementation of VMF on Xen (the contents of this RFC
> patch series) that supports dom0less guests on arm 64. By sharing
> our prototype, we hope to socialize our idea, gauge interest, and
> hopefully gain useful feedback as we work toward upstreaming.
> 
> ** IMPLEMENTATION **
> In our current setup we have a static configuration with dom0 and
> one or two domUs. Soon after boot, Dom0 issues a hypercall through
> the xenctrl interface to blow the fuse for the domU. In the future,
> we could also add code to support blowing the fuse automatically on
> startup, before any domains are un-paused.
> 
> Our Xen/arm64 prototype creates Software Enclaves in two steps,
> represented by these two functions defined in xen/vmf.h:
> void vmf_unmap_guest(struct domain *d);
> void vmf_lock_xen_pgtables(void);
> 
> In the first, the Xen removes mappings to the guest(s) On arm64, Xen
> keeps a reference to all of guest memory in the directmap. Right now,
> we simply walk all of the guest second stage tables and remove them
> from the directmap, although there is probably a more elegant method
> for this.

IIUC, you first map all the RAM and then remove the pages. What you 
could do instead is to map only the memory required for Xen use. The 
rest would be left unmapped.

This would be similar to what we are doing on arm32. We have a split 
heap. Only the xenheap is mapped. The pages from the domheap will be 
mapped ondemand.

Another approach, would be to have a single heap where pages used by Xen 
are mapped in the page-tables when allocated (this is what secret-free 
hypervisor is doing is).

If you don't map to keep the page-tables around, then it sounds like you 
want the first approach.

> 
> Second, the Xen removes mappings to its own page tables.
> On arm64, this also involves manipulating the directmap. One challenge
> here is that as we start to unmap our tables from the directmap,
> we can't use the directmap to walk them. Our solution here is also
> bit less elegant, we temporarily insert a recursive mapping and use
> that to remove page table entries.

See above.

> 
> ** LIMITATIONS and other closing thoughts **
> The current Xen code has obviously been implemented under the
> assumption that new pages can be mapped, and that guest virtual
> addresses can be read, so this technique will break some Xen
> features. However, in the general case

Can you clarify your definition of "general case"? From my PoV, it is a 
lot more common to have guest with PV emulated device rather than with 
device attached. So it will be mandatory to access part of the memory 
(e.g. grant table).

> (in particular for static
> workloads where the number of guest's is not changed after boot)

That very much depend on how you configure your guest. If they have 
device assigned then possibly yes. Otherwise see above.

> Finally, our initial testing suggests that Xen never reads guest memory
> (in a static, non-dom0-enchanced configuration), but have not really
> explored this thoroughly.
> We know at least these things work:
> 	Dom0less virtual serial terminal
> 	Domain scheduling
> We are aware that these things currently depend on accessible guest
> memory:
> 	Some hypercalls take guest pointers as arguments

There are not many hypercalls that don't take guest pointers.

> 	Virtualized MMIO on arm needs to decode certain load/store
> 	instructions

On Arm, this can be avoided of the guest OS is not using such 
instruction. In fact they were only added to cater "broken" guest OS.

Also, this will probably be a lot more difficult on x86 as, AFAIK, there 
is no instruction syndrome. So you will need to decode the instruction 
in order to emulate the access.

> 
> It's likely that other Xen features require guest memory access.

For Arm, guest memory access is also needed when using the GICv3 ITS 
and/or second-level SMMU (still in RFC).

For x86, if you don't want to access the guest memory, then you may need 
to restrict to PVH as for HVM we need to emulate some devices in QEMU. 
That said, I am not sure PVH is even feasible.

Cheers,

[1] 
https://www.youtube.com/watch?v=RKJOwIkCnB4&list=PLYyw7IQjL-zFYmEoZEYswoVuXrHvXAWxj&index=5

-- 
Julien Grall

