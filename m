Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D982F4B65
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 13:37:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66456.118037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfOy-0005BS-Ay; Wed, 13 Jan 2021 12:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66456.118037; Wed, 13 Jan 2021 12:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfOy-0005Ay-7R; Wed, 13 Jan 2021 12:37:28 +0000
Received: by outflank-mailman (input) for mailman id 66456;
 Wed, 13 Jan 2021 12:37:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWMo=GQ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kzfOw-0005As-V9
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 12:37:26 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f733cef-ac9d-45ea-994d-4a0acdf031cd;
 Wed, 13 Jan 2021 12:37:25 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B5B9868AFE; Wed, 13 Jan 2021 13:37:21 +0100 (CET)
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
X-Inumbo-ID: 0f733cef-ac9d-45ea-994d-4a0acdf031cd
Date: Wed, 13 Jan 2021 13:37:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Claire Chang <tientzu@chromium.org>,
	robh+dt@kernel.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
	paulus@samba.org, joro@8bytes.org, will@kernel.org,
	frowand.list@gmail.com, konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	grant.likely@arm.com, xypron.glpk@gmx.de, treding@nvidia.com,
	mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org,
	saravanak@google.com, rafael.j.wysocki@intel.com,
	heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org, dan.j.williams@intel.com,
	bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
	tfiga@chromium.org, drinkcat@chromium.org
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
Message-ID: <20210113123721.GA1098@lst.de>
References: <20210106034124.30560-1-tientzu@chromium.org> <20210106034124.30560-3-tientzu@chromium.org> <X/VrqxcaAMi65CF0@kroah.com> <20210113115126.GB29376@lst.de> <X/7nkb/YDpKlakRO@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/7nkb/YDpKlakRO@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 13, 2021 at 01:29:05PM +0100, Greg KH wrote:
> > > Why does this have to be added here?  Shouldn't the platform-specific
> > > code handle it instead?
> > 
> > The whole code added here is pretty generic.  What we need to eventually
> > do, though is to add a separate dma_device instead of adding more and more
> > bloat to struct device.
> 
> I have no objections for that happening!

I'm pretty sure you agreed to it before in fact.  Now someone just needs
to find the time to do this heavy lifting, where "someone" probably means
me.

