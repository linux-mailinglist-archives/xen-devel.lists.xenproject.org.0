Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EF292912D
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2024 07:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754585.1163034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPyJV-0002Wh-9P; Sat, 06 Jul 2024 05:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754585.1163034; Sat, 06 Jul 2024 05:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPyJV-0002Uy-5w; Sat, 06 Jul 2024 05:50:25 +0000
Received: by outflank-mailman (input) for mailman id 754585;
 Sat, 06 Jul 2024 05:50:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Onl8=OG=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sPyJT-0002Um-Nn
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2024 05:50:23 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a24b5d54-3b5b-11ef-bbfb-fd08da9f4363;
 Sat, 06 Jul 2024 07:50:22 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AB6C868D0E; Sat,  6 Jul 2024 07:50:19 +0200 (CEST)
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
X-Inumbo-ID: a24b5d54-3b5b-11ef-bbfb-fd08da9f4363
Date: Sat, 6 Jul 2024 07:50:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: mhklinux@outlook.com
Cc: robin.murphy@arm.com, joro@8bytes.org, will@kernel.org, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, hch@lst.de,
	m.szyprowski@samsung.com, petr@tesarici.cz, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/1] swiotlb: Reduce swiotlb pool lookups
Message-ID: <20240706055019.GA13280@lst.de>
References: <20240701165746.1358-1-mhklinux@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701165746.1358-1-mhklinux@outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)


Hi Michael,

I like the idea behind this, but can you respin it to avoid some of
the added code duplication.  We have a lot of this pattern:

	pool = swiotlb_find_pool(dev, paddr);
	if (pool)
		swiotlb_foo(dev, ...

duplicated in all three swiotlb users.  If we rename the original
swiotlb_foo to __swiotlb_foo and add a little inline wrapper this is
de-duplicated and also avoids exposing swiotlb_find_pool to the
callers.

If we then stub out swiotlb_find_pool to return NULL for !CONFIG_SWIOTLB,
we also don't need extra stubs for all the __swiotlb_ helpers as the
compiler will eliminate the calls as dead code.

I might be missing something, but what is the reason for using the
lower-level __swiotlb_find_pool in swiotlb_map and xen_swiotlb_map_page?
I can't see a reason why the simple checks in swiotlb_find_pool itself
are either wrong or a performance problem there.  Because if we don't
need these separate calls we can do away with __swiotlb_find_pool
for !CONFIG_SWIOTLB_DYNAMIC and simplify swiotlb_find_pool quite
a bit like this:

	...

	if (!mem)
		return NULL;

	if (IS_ENABLED(CONFIG_SWIOTLB_DYNAMIC)) {
		smp_rmb(); 
		if (!READ_ONCE(dev->dma_uses_io_tlb))
			return NULL;
		return __swiotlb_find_pool(dev, paddr);
	}

	if (paddr < mem->defpool.start || paddr >= mem->defpool.end)
		return NULL;
	return &dev->dma_io_tlb_mem->defpool;


While you're at it please fix the > 80 character lines as this patch
is adding plenty.

