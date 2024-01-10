Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7D4829198
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 01:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665282.1035434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNMk2-0007t0-O3; Wed, 10 Jan 2024 00:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665282.1035434; Wed, 10 Jan 2024 00:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNMk2-0007qT-Ko; Wed, 10 Jan 2024 00:46:46 +0000
Received: by outflank-mailman (input) for mailman id 665282;
 Wed, 10 Jan 2024 00:46:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0rG5=IU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rNMk1-0007qN-LE
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 00:46:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b86f6c99-af51-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 01:46:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AE080CE1AA2;
 Wed, 10 Jan 2024 00:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D78C433F1;
 Wed, 10 Jan 2024 00:46:37 +0000 (UTC)
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
X-Inumbo-ID: b86f6c99-af51-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704847599;
	bh=vy/N3fJJFv0kXXAl1w/jAz0jqXXPcsNLKX0239Bs7pQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NEYaVSxJcTLwBJo4hxSWqAJgTX63Nbk7mWU4+iAFFPhkKOokd103GQQfz+uWil8U9
	 PuDFYYcR7/wVJ30w82qI6BZK68F+rPfkqtAABxdIFspUmQ6T8Pfx2yly+kXykr6qF8
	 +1rXj2eSC7LKTVUWxBgVi5bWBYcZR8i3SoaDryt563OHQxV4Su8KlvMyKYimoDxtZE
	 2u7NakTS03KqvsrS20b1H6mUVFpYOSXtuakKQaDU7hndS1R53k38y0wg3Em10IkWJ5
	 hmBCMDQ4a+QEMsLjE2PfctUUSODijAXMgxQL5a6O/t5kq6E4I3ZuuSXcYs6KwiM0rI
	 qJWmEV4JvAYgg==
Date: Tue, 9 Jan 2024 16:46:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Carlo Nonato <carlo.nonato@minervasys.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Marco Solieri <marco.solieri@minervasys.tech>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 09/13] xen: add cache coloring allocator for domains
In-Reply-To: <7fbe9526-60cf-4844-8b48-58ab69ec1b29@suse.com>
Message-ID: <alpine.DEB.2.22.394.2401091637160.3675@ubuntu-linux-20-04-desktop>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech> <20240102095138.17933-10-carlo.nonato@minervasys.tech> <7fbe9526-60cf-4844-8b48-58ab69ec1b29@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Jan 2024, Jan Beulich wrote:
> On 02.01.2024 10:51, Carlo Nonato wrote:
> > This commit adds a new memory page allocator that implements the cache
> > coloring mechanism. The allocation algorithm enforces equal frequency
> > distribution of cache partitions, following the coloring configuration of a
> > domain. This allows an even utilization of cache sets for every domain.
> > 
> > Pages are stored in a color-indexed array of lists. Those lists are filled
> > by a simple init function which computes the color of each page.
> > When a domain requests a page, the allocator extract the page from the list
> > with the maximum number of free pages between those that the domain can
> > access, given its coloring configuration.
> > 
> > The allocator can only handle requests of order-0 pages. This allows for
> > easier implementation and since cache coloring targets only embedded systems,
> > it's assumed not to be a major problem.
> 
> I'm curious about the specific properties of embedded systems that makes
> the performance implications of deeper page walks less of an issue for
> them.

I think Carlo meant to say that embedded systems tend to have a smaller
amount of RAM (our boards today have 4-8GB of total memory). So higher
level allocations (2MB/1GB) might not be possible.

Also, domains that care about interrupt latency tend to be RTOSes (e.g.
Zephyr, FreeRTOS) and RTOSes are happy to run with less than 1MB of
total memory available. This is so true that I vaguely remember hitting
a bug in xl/libxl when I tried to create a domain with 128KB of memory. 


> Nothing is said about address-constrained allocations. Are such entirely
> of no interest to domains on Arm, not even to Dom0 (e.g. for filling
> Linux'es swiotlb)?

Cache coloring is useful if you can use an IOMMU with all the
dma-capable devices. If that is not the case, then not even Dom0 would
be able to boot with cache coloring enabled (because it wouldn't be 1:1
mapped).

On ARM we only support booting Dom0 1:1 mapped, or not-1:1-mapped but
relying on the IOMMU.


> Certainly alloc_color_heap_page() should at least fail when it can't
> satisfy the passed in memflags.

[...]


> > +void dump_color_heap(void)
> > +{
> > +    unsigned int color;
> > +
> > +    printk("Dumping color heap info\n");
> > +    for ( color = 0; color < get_nr_llc_colors(); color++ )
> > +        if ( free_colored_pages[color] > 0 )
> > +            printk("Color heap[%u]: %lu pages\n",
> > +                   color, free_colored_pages[color]);
> > +}
> 
> What's a typical range of number of colors on a system? I expect more
> than 9, but I'm not sure about a reasonable upper bound. For the
> output to be easy to consume, [%u] may want to become at least [%2u].

16 colors on our boards

