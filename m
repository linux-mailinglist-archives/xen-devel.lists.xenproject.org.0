Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951DE24C5A2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 20:35:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8pPS-0006yF-0I; Thu, 20 Aug 2020 18:35:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ewgh=B6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k8pPR-0006yA-00
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 18:35:33 +0000
X-Inumbo-ID: 69ee646f-0e94-4ac1-a4b8-3466224cc11f
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69ee646f-0e94-4ac1-a4b8-3466224cc11f;
 Thu, 20 Aug 2020 18:35:32 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AA3C206B5;
 Thu, 20 Aug 2020 18:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597948531;
 bh=qnZ7MBpsqa9olG4QJOU3qfWg+5WLOFXvvwnHkeakkaM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=yj0J/l95458cHwuwKmkeIzRKp2+XJQl9bxZwRMh+ejt4xovdmz+gzxadd3Cn622K2
 7ooLYDqezGvSYg+UMMyU4scyt+icg8KWJHcoRSoaJYqC5ke2G71y7sEm+8eL5khkBI
 YQjN/zUfPDcwq7uYKHzX2SX/p6ttAbTHwsFjIpSo=
Date: Thu, 20 Aug 2020 11:35:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Simon Leiner <simon@leiner.me>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
Subject: Re: [Linux] [ARM] Granting memory obtained from the DMA API
In-Reply-To: <b45a40e3-ea9d-0eef-ea99-88201be83511@xen.org>
Message-ID: <alpine.DEB.2.21.2008201120260.6005@sstabellini-ThinkPad-T480s>
References: <32922E87-9F50-41B3-A321-3212697CF7DB@leiner.me>
 <b45a40e3-ea9d-0eef-ea99-88201be83511@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 20 Aug 2020, Julien Grall wrote:
> > Part of virtio is having shared memory. So naturally, I'm using Xen's
> > grant system for that. Part of the Xenbus client API is the function
> > xenbus_grant_ring which, by its documentation grants access to a block
> > of memory starting at vaddr to another domain. I tried using this in my
> > driver which created the grants and returned without any error, but
> > after mounting the grants on another domain, it turns out that some
> > other location in memory was actually granted instead of the one behind
> > the original vaddr.
> > 
> > So I found the problem: The vaddr that I was using xenbus_grant_ring
> > with was obtained by dma_alloc_coherent (whereas the other split
> > drivers included in the mainline kernel use Xen IO rings allocated by
> > the "regular" mechanisms such as __get_free_page, alloc_page etc.).
> > But xenbus_grant_ring uses virt_to_gfn to get the GFN for the vaddr
> > which on ARM(64) must not be used for DMA addresses. So I could fix the
> > problem by providing a modified version of xenbus_grant_ring as part of
> > my driver which takes a dma_addr_t instead of a void* for the start
> > address, gets the PFN via dma_to_phys, converts it to a GFN and then
> > delegates to gnttab_grant_foreign_access, just like xenbus_grant_ring.
> > I can confirm that this works on Linux 5.4.0.
>
> > My question to you is: How can this be fixed "the right way"?
> > Is there anything that can be done to prevent others from debugging
> > the same problem (which for me, took some hours...)?
> > 
> > I can see multiple approaches:
> > 1. Have xenbus_grant_ring "just work" even with DMA addresses on ARM
> >     This would certainly be the nicest solution, but I don't see how
> >     it could be implemented. I don't know how to check whether some
> >     address actually is a DMA address and even if there was a way to
> >     know, dma_to_phys still requires a pointer to the device struct
> >     which was used for allocation.
> > 2. Provide another version which takes a dma_addr_t instead of void*
> >     This can be easily done, but things get complicated when the device
> >     for which the DMA memory was allocated is not the xenbus_device
> >     which is passed anyway. So, it would be necessary to include an
> >     additional argument pointing the actual device struct which was used
> >     for allocation.
> > 3. Just use gnttab_grant_foreign_access which works with GFNs anyway
> >     Which is essentially what I'm doing currently, as in my driver I
> >     know from which the device the DMA addresses were allocated.
> >     If this is the preferred solution to this problem, I propose adding
> >     a warning to the documentation of xenbus_grant_ring that forbids
> >     using this for vaddrs obtained from the DMA API as it will not work
> >     (at least on ARM).
> > 
> > What do you think?

Thank for the well-written analysis of the problem. The following should
work to translate the virtual address properly in xenbus_grant_ring:

	if (is_vmalloc_addr(vaddr))
		page = vmalloc_to_page(vaddr);
	else
		page = virt_to_page(vaddr);

Please give it a try and let me know. Otherwise, if it cannot be made to
work, option 3 with a proper warning is also fine.

