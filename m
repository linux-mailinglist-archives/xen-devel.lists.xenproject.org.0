Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18FB3A5CE8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 08:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141154.260836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsfyO-0004w8-6j; Mon, 14 Jun 2021 06:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141154.260836; Mon, 14 Jun 2021 06:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsfyO-0004ty-3P; Mon, 14 Jun 2021 06:21:24 +0000
Received: by outflank-mailman (input) for mailman id 141154;
 Mon, 14 Jun 2021 06:21:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aFdS=LI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lsfyM-0004tZ-2M
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 06:21:22 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2107152-52a2-4560-9954-1a8a580ee528;
 Mon, 14 Jun 2021 06:21:21 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B72AF67373; Mon, 14 Jun 2021 08:21:18 +0200 (CEST)
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
X-Inumbo-ID: b2107152-52a2-4560-9954-1a8a580ee528
Date: Mon, 14 Jun 2021 08:21:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	benh@kernel.crashing.org, paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org, Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com, xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org,
	bauerman@linux.ibm.com, peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>, tfiga@chromium.org,
	bskeggs@redhat.com, bhelgaas@google.com, chris@chris-wilson.co.uk,
	daniel@ffwll.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	jxgao@google.com, joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com, rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v9 04/14] swiotlb: Add restricted DMA pool
 initialization
Message-ID: <20210614062118.GD28343@lst.de>
References: <20210611152659.2142983-1-tientzu@chromium.org> <20210611152659.2142983-5-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611152659.2142983-5-tientzu@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Jun 11, 2021 at 11:26:49PM +0800, Claire Chang wrote:
> Add the initialization function to create restricted DMA pools from
> matching reserved-memory nodes.

Bisection hazard:  we should only add the new config option when the
code is actually read to be used.  So this patch should move to the end
of the series.

