Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D8964E5C0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 02:46:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464076.722402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5zni-0001dw-KI; Fri, 16 Dec 2022 01:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464076.722402; Fri, 16 Dec 2022 01:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5zni-0001ay-HL; Fri, 16 Dec 2022 01:46:14 +0000
Received: by outflank-mailman (input) for mailman id 464076;
 Fri, 16 Dec 2022 01:46:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=12d2=4O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p5znh-0001as-1c
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 01:46:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6aa6970f-7ce3-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 02:46:11 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4ACC561FDA;
 Fri, 16 Dec 2022 01:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0400DC433EF;
 Fri, 16 Dec 2022 01:46:07 +0000 (UTC)
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
X-Inumbo-ID: 6aa6970f-7ce3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671155169;
	bh=nJZYq9zNX+m5SrV+P9uWlUfA368yTaQ75XzFx2XBssY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bJm0M6/cYUAX3d4sVj/Z5NzIsa5Qc4Zwfl/o4zGxW1IWyA5G3ASMOeEA1BcIaRT8i
	 UYQ5CqSB69/Ho82WljxPgANYd20lj4jFEyPLnPIkmjXUp5tMVNsIL4rvcqOvL8Nquj
	 5JDqaUeTIT4L+tLCAZYDoq+P2sLOozK9kwtwQmzMmlxO4fO+eXA5Gf40WSQvZo65EB
	 p9YnLgIe0VdJzsAziKGpK28DxgxoB+qoJeZiWLv+m0AFdRmIZeoxdzgxcK9ejaqTpT
	 GTWK/7X62SWc40kkv/LFQOLPigU7CpCUYYfBHa3cwFYXdShbfzHBRp68Ygglyd7m5q
	 V+30x+1dbM97g==
Date: Thu, 15 Dec 2022 17:46:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: "Smith, Jackson" <rsmith@RiversideResearch.org>, 
    "Brookes, Scott" <sbrookes@RiversideResearch.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    "demi@invisiblethingslab.com" <demi@invisiblethingslab.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
In-Reply-To: <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212151725090.315094@ubuntu-linux-20-04-desktop>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM> <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org> <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Dec 2022, Julien Grall wrote:
> > > On 13/12/2022 19:48, Smith, Jackson wrote:
> > > > Hi Xen Developers,
> > > 
> > > Hi Jackson,
> > > 
> > > Thanks for sharing the prototype with the community. Some
> > > questions/remarks below.
> > > 
> > > > My team at Riverside Research is currently spending IRAD funding to
> > > > prototype next-generation secure hypervisor design ideas on Xen. In
> > > > particular, we are prototyping the idea of Virtual Memory Fuses for
> > > > Software Enclaves, as described in this paper:
> > > > https://www.nspw.org/papers/2020/nspw2020-brookes.pdf. Note
> > > that that
> > > > paper talks about OS/Process while we have implemented the idea
> > > for
> > > > Hypervisor/VM.
> > > > 
> > > > Our goal is to emulate something akin to Intel SGX or AMD SEV, but
> > > > using only existing virtual memory features common in all
> > processors.
> > > > The basic idea is not to map guest memory into the hypervisor so
> > > that
> > > > a compromised hypervisor cannot compromise (e.g. read/write) the
> > > > guest. This idea has been proposed before, however, Virtual Memory
> > > > Fuses go one step further; they delete the hypervisor's mappings to
> > > > its own page tables, essentially locking the virtual memory
> > > > configuration for the lifetime of the system. This creates what we
> > > > call "Software Enclaves", ensuring that an adversary with arbitrary
> > > > code execution in the hypervisor STILL cannot read/write guest
> > > memory.
> > > 
> > > I am confused, if the attacker is able to execute arbitrary code, then
> > > what prevent them to write code to map/unmap the page?
> > > 
> > > Skimming through the paper (pages 5-6), it looks like you would need
> > > to implement extra defense in Xen to be able to prevent map/unmap a
> > > page.
> > > 
> > 
> > The key piece is deleting all virtual mappings to Xen's page table
> > structures. From the paper (4.4.1 last paragraph), "Because all memory
> > accesses operate through the MMU, even page table memory needs
> > corresponding page table entries in order to be written to." Without a
> > virtual mapping to the page table, no code can modify the page table
> > because it cannot read or write the table. Therefore the mappings to the
> > guest cannot be restored even with arbitrary code execution.
>
> I don't think this is sufficient. Even if the page-tables not part of the
> virtual mapping, an attacker could still modify TTBR0_EL2 (that's a system
> register hold a host physical address). So, with a bit more work, you can gain
> access to everything (see more below).
> 
> AFAICT, this problem is pointed out in the paper (section 4.4.1):
> 
> "The remaining attack vector. Unfortunately, deleting the page
> table mappings does not stop the kernel from creating an entirely
> new page table with the necessary mappings and switching to it
> as the active context. Although this would be very difficult for
> an attacker, switching to a new context with a carefully crafted
> new page table structure could compromise the VMFE."
> 
> I believe this will be easier to do it in Xen because the virtual layout is
> not very complex.
> 
> It would be a matter of inserting a new entry in the root table you control. A
> rough sequence would be:
>    1) Allocate a page
>    2) Prepare the page to act as a root (e.g. mapping of your code...)
>    3) Map the "existing" root as a writable.
>    4) Update TTBR0_EL2 to point to your new root
>    5) Add a mapping in the "old" root
>    6) Switch to the old root
> 
> So can you outline how you plan to prevent/mitigate it?

[...]

> > Yes, we are familiar with the "secret-free hypervisor" work. As you
> > point out, both our work and the secret-free hypervisor remove the
> > directmap region to mitigate the risk of leaking sensitive guest
> > secrets. However, our work is slightly different because it additionally
> > prevents attackers from tricking Xen into remapping a guest.
> 
> I understand your goal, but I don't think this is achieved (see above). You
> would need an entity to prevent write to TTBR0_EL2 in order to fully protect
> it.

Without a way to stop Xen from reading/writing TTBR0_EL2, we cannot
claim that the guest's secrets are 100% safe.

But the attacker would have to follow the sequence you outlines above to
change Xen's pagetables and remap guest memory before accessing it. It
is an additional obstacle for attackers that want to steal other guests'
secrets. The size of the code that the attacker would need to inject in
Xen would need to be bigger and more complex.

Every little helps :-)

