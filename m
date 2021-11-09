Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730DA44B64C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 23:23:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224113.387205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkZWM-0006xZ-5p; Tue, 09 Nov 2021 22:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224113.387205; Tue, 09 Nov 2021 22:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkZWM-0006vm-2j; Tue, 09 Nov 2021 22:23:14 +0000
Received: by outflank-mailman (input) for mailman id 224113;
 Tue, 09 Nov 2021 22:23:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Q5=P4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mkZWK-0006vN-C5
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 22:23:12 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e4cb69c-41ab-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 23:23:10 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D97161B04;
 Tue,  9 Nov 2021 22:23:08 +0000 (UTC)
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
X-Inumbo-ID: 9e4cb69c-41ab-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636496588;
	bh=cw01eSYfL8UtZdAVlIiNUiUlynYOBDvoRIDp2QEgHNs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MI07reSprc7T5wviBPSOHHtY/DMnq2YLO9FUxA9XXtUWXxlVqz2ihd5X7jDKFRnPC
	 2a/7+bXXFSMHHncrKdAd+kpVEKKXbDUt18HYN9p/vvaZND4GlR1EEdoOKAM20xPx2z
	 pv++SZ2x7S93PKnhA6pOaim55pe3sF6rbs07siFIoRH2gxHppro8aXIBhZF7j0eNSh
	 fAXUa62lPTwkHbjcHcAKssFERD4M9Ztat/jy+ToFqkMkYq/nZkrnKS/FvEUzHmb/hC
	 07TLs3oHOKTwbH6+v1D+53JpwpOyQT7eO2+6Jv3drD4nzMTZlEIppeaAHs117JtRZH
	 U10yKHg6JMT2g==
Date: Tue, 9 Nov 2021 14:23:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, oleksandr_tyshchenko@epam.com, 
    iwj@xenproject.org, Bertrand.Marquis@arm.com, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: ASSERT in rangeset_remove_range
In-Reply-To: <666a0b12-bfda-a6b4-a7e6-d58e0a01d5ff@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111091423020.440530@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2111081430090.3317@ubuntu-linux-20-04-desktop> <666a0b12-bfda-a6b4-a7e6-d58e0a01d5ff@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Nov 2021, Julien Grall wrote:
> (+ Jan, Andrew, Wei for the common code)
> 
> On 08/11/2021 22:45, Stefano Stabellini wrote:
> > Hi Oleksandr, Julien,
> 
> Hi,
> 
> > I discovered a bug caused by the recent changes to introduce extended
> > regions in make_hypervisor_node (more logs appended):
> > 
> > 
> > (XEN) d1 BANK[0] 0x00000040000000-0x0000007e800000 (1000MB)
> > (XEN) d1 BANK[1] 0x00000200000000-0x00000200000000 (0MB)
> > (XEN) DEBUG find_unallocated_memory 994 s=40000000 e=7e7fffff
> > (XEN) DEBUG find_unallocated_memory 994 s=200000000 e=1ffffffff
> > (XEN) Assertion 's <= e' failed at rangeset.c:189
> > 
> > 
> > When a bank of memory is zero in size, then rangeset_remove_range is
> > called with end < start, triggering an ASSERT in rangeset_remove_range.
> > 
> > One solution is to avoid creating 0 size banks. The following change
> > does that:
> > 
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 49b4eb2b13..3efe542d0f 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -459,9 +459,12 @@ static void __init allocate_memory(struct domain *d,
> > struct kernel_info *kinfo)
> >           goto fail;
> >         bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> > -    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
> > +    if ( bank_size > 0 )
> > +    {
> > +        if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
> >                                  bank_size) )
> > -        goto fail;
> > +            goto fail;
> > +    }
> 
> I would move the size check in allocate_bank_memory().

Sure, I can do that


> >         if ( kinfo->unassigned_mem )
> >           goto fail;
> > 
> > 
> > 
> > We have a couple of other options too:
> > 
> > - remove the ASSERT in rangeset_remove_range
> > There is an argument that we should simply return error
> > fromrangeset_remove_range, rather than a full assert.
> 
> To be honest, this is a developper mistake to call with end < start. If we
> were going to return an error then we would completely hide (even in
> developper) it because we would fallback to not exposing extended regions.
> 
> So I am not sure switch from ASSERT() to a plain check is a good idea. Jan,
> Andrew, Wei, what do you think?
> 
> That said, this option would not be sufficient to fix your problem as extended
> regions will not work.
> 
> > 
> > - add a if (end > start) check before calling rangeset_remove_range
> > We could check that end > start before calling rangeset_remove_range at
> > all the call sites in domain_build.c. There are 5 call sites at the
> > moment.
> 
> I think we only want to add (end > start) where we expect the region size to
> be 0. AFAICT, the only other potential place where this can happens is
> ``find_memory_holes()`` (I vaguely recall a discussion in the past where some
> of the "reg"  property would have size == 0).
> 
> > 
> > Any other ideas or suggestions?
> 
> My preference goes with your initial sugestion (so long the check is moved to
> allocate_bank_memory()).
> 
> [...]
> 
> > (XEN) Assertion 's <= e' failed at rangeset.c:189
> > (XEN) ----[ Xen-4.16-rc  arm64  debug=y  Not tainted ]----
> > (XEN) Xen call trace:
> > (XEN)    [<0000000000220e6c>] rangeset_remove_range+0xbc/0x2bc (PC)
> > (XEN)    [<00000000002cd508>]
> > domain_build.c#make_hypervisor_node+0x258/0x7f4 (LR)
> > (XEN)    [<00000000002cf2a8>] domain_build.c#construct_domU+0x9cc/0xa8c
> 
> Vanilla staging doesn't call make_hypervisor_node() from construct_domU. So
> what are you using?

Well spotted. This is my WIP branch with PV drivers support for Dom0less
guests (soon to be sent to xen-devel). The underlying bug could affect
vanilla Xen too as it only takes a zero-size bank to trigger it, but it
is certainly harder to reproduce because make_hypervisor_node is only
called for Dom0 and allocate_bank_memory (the function that today always
adds a zero size bank) is called for DomUs.


> > (XEN)    [<00000000002d0440>] create_domUs+0xe8/0x224
> > (XEN)    [<00000000002d4988>] start_xen+0xafc/0xbf0
> > (XEN)    [<00000000002001a0>] arm64/head.o#primary_switched+0xc/0x1c
> > (XEN)
> > (XEN)
> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) Assertion 's <= e' failed at rangeset.c:189
> > (XEN) ****************************************

