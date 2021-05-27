Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE68F392ED0
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:02:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133254.248451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFeU-0003DZ-QS; Thu, 27 May 2021 13:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133254.248451; Thu, 27 May 2021 13:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFeU-0003Be-MH; Thu, 27 May 2021 13:02:18 +0000
Received: by outflank-mailman (input) for mailman id 133254;
 Thu, 27 May 2021 13:02:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TI9I=KW=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lmFeT-0003BU-BF
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:02:17 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1403423d-dd02-4bfb-83e6-4cc5acf9a994;
 Thu, 27 May 2021 13:02:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D40FB68AFE; Thu, 27 May 2021 15:02:11 +0200 (CEST)
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
X-Inumbo-ID: 1403423d-dd02-4bfb-83e6-4cc5acf9a994
Date: Thu, 27 May 2021 15:02:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
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
	thomas.hellstrom@linux.intel.com,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v7 01/15] swiotlb: Refactor swiotlb init functions
Message-ID: <20210527130211.GA24344@lst.de>
References: <20210518064215.2856977-1-tientzu@chromium.org> <20210518064215.2856977-2-tientzu@chromium.org> <170a54f2-be20-ec29-1d7f-3388e5f928c6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170a54f2-be20-ec29-1d7f-3388e5f928c6@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, May 19, 2021 at 11:50:07AM -0700, Florian Fainelli wrote:
> You convert this call site with swiotlb_init_io_tlb_mem() which did not
> do the set_memory_decrypted()+memset(). Is this okay or should
> swiotlb_init_io_tlb_mem() add an additional argument to do this
> conditionally?

The zeroing is useful and was missing before.  I think having a clean
state here is the right thing.

Not sure about the set_memory_decrypted, swiotlb_update_mem_attributes
kinda suggests it is too early to set the memory decrupted.

Adding Tom who should now about all this.

