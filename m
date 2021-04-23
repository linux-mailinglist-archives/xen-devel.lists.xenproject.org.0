Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CE4368DBA
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 09:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115921.221221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZpyQ-0003E5-9k; Fri, 23 Apr 2021 07:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115921.221221; Fri, 23 Apr 2021 07:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZpyQ-0003Dg-6O; Fri, 23 Apr 2021 07:11:34 +0000
Received: by outflank-mailman (input) for mailman id 115921;
 Fri, 23 Apr 2021 07:11:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vg7O=JU=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lZpyO-0003Db-Rk
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 07:11:32 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a26440f-0550-476d-a4c6-d21db0106ed0;
 Fri, 23 Apr 2021 07:11:31 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E833068B05; Fri, 23 Apr 2021 09:11:26 +0200 (CEST)
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
X-Inumbo-ID: 1a26440f-0550-476d-a4c6-d21db0106ed0
Date: Fri, 23 Apr 2021 09:11:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Claire Chang <tientzu@chromium.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
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
	matthew.auld@intel.com, nouveau@lists.freedesktop.org,
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v5 01/16] swiotlb: Fix the type of index
Message-ID: <20210423071126.GA6404@lst.de>
References: <20210422081508.3942748-1-tientzu@chromium.org> <20210422081508.3942748-2-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422081508.3942748-2-tientzu@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Apr 22, 2021 at 04:14:53PM +0800, Claire Chang wrote:
> Fix the type of index from unsigned int to int since find_slots() might
> return -1.
> 
> Fixes: 0774983bc923 ("swiotlb: refactor swiotlb_tbl_map_single")
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

it really should go into 5.12.  I'm not sure if Konrad is going to
be able to queue this up due to his vacation, so I'm tempted to just
queue it up in the dma-mapping tree.

