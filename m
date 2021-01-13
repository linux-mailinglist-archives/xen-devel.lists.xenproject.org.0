Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C17E2F5212
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 19:32:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66688.118543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkwW-0001f7-6R; Wed, 13 Jan 2021 18:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66688.118543; Wed, 13 Jan 2021 18:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkwW-0001ed-2u; Wed, 13 Jan 2021 18:32:28 +0000
Received: by outflank-mailman (input) for mailman id 66688;
 Wed, 13 Jan 2021 18:32:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWMo=GQ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kzkwU-0001eY-LA
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 18:32:26 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74cd43b2-ec82-4614-bc91-ad0170cf3842;
 Wed, 13 Jan 2021 18:32:25 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A66E868B02; Wed, 13 Jan 2021 19:32:19 +0100 (CET)
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
X-Inumbo-ID: 74cd43b2-ec82-4614-bc91-ad0170cf3842
Date: Wed, 13 Jan 2021 19:32:18 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Christoph Hellwig <hch@lst.de>, Claire Chang <tientzu@chromium.org>,
	robh+dt@kernel.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
	paulus@samba.org, joro@8bytes.org, will@kernel.org,
	frowand.list@gmail.com, konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	m.szyprowski@samsung.com, grant.likely@arm.com, xypron.glpk@gmx.de,
	treding@nvidia.com, mingo@kernel.org, bauerman@linux.ibm.com,
	peterz@infradead.org, gregkh@linuxfoundation.org,
	saravanak@google.com, rafael.j.wysocki@intel.com,
	heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org, dan.j.williams@intel.com,
	bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
	tfiga@chromium.org, drinkcat@chromium.org
Subject: Re: [RFC PATCH v3 4/6] swiotlb: Add restricted DMA alloc/free
 support.
Message-ID: <20210113183218.GB19254@lst.de>
References: <20210106034124.30560-1-tientzu@chromium.org> <20210106034124.30560-5-tientzu@chromium.org> <20210113124847.GC1383@lst.de> <82bb75bc-11e6-ac94-9d24-7c896e3aae98@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82bb75bc-11e6-ac94-9d24-7c896e3aae98@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 13, 2021 at 06:27:08PM +0000, Robin Murphy wrote:
>> Can we hook in somewhat lower level in the dma-direct code so that all
>> the remapping in dma-direct can be reused instead of duplicated?  That
>> also becomes important if we want to use non-remapping uncached support,
>> e.g. on mips or x86, or the direct changing of the attributes that Will
>> planned to look into for arm64.
>
> Indeed, AFAICS this ought to boil down to a direct equivalent of 
> __dma_direct_alloc_pages() - other than the address there should be no 
> conceptual difference between pages from the restricted pool and those from 
> the regular page allocator, so this probably deserves to be plumbed in as 
> an alternative to that.

Yes, that's what I mean.  You managed to word it much better, though.

