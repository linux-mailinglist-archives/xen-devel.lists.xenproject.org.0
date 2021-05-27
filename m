Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CE9392F97
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133398.248681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmG2g-0000PJ-Mg; Thu, 27 May 2021 13:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133398.248681; Thu, 27 May 2021 13:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmG2g-0000Mh-J3; Thu, 27 May 2021 13:27:18 +0000
Received: by outflank-mailman (input) for mailman id 133398;
 Thu, 27 May 2021 13:27:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TI9I=KW=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lmG2f-0000MW-0K
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:27:17 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30e63615-ac97-4f59-bdd0-d117e000b202;
 Thu, 27 May 2021 13:27:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A928168AFE; Thu, 27 May 2021 15:27:11 +0200 (CEST)
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
X-Inumbo-ID: 30e63615-ac97-4f59-bdd0-d117e000b202
Date: Thu, 27 May 2021 15:27:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>, boris.ostrovsky@oracle.com,
	jgross@suse.com, Christoph Hellwig <hch@lst.de>,
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
	Jim Quinlan <james.quinlan@broadcom.com>,
	Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com,
	Bjorn Helgaas <bhelgaas@google.com>, chris@chris-wilson.co.uk,
	Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com, Jianxiong Gao <jxgao@google.com>,
	joonas.lahtinen@linux.intel.com, linux-pci@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v7 04/15] swiotlb: Add restricted DMA pool
 initialization
Message-ID: <20210527132711.GC26160@lst.de>
References: <20210518064215.2856977-1-tientzu@chromium.org> <20210518064215.2856977-5-tientzu@chromium.org> <CALiNf2_AWsnGqCnh02ZAGt+B-Ypzs1=-iOG2owm4GZHz2JAc4A@mail.gmail.com> <YKvLDlnns3TWEZ5l@0xbeefdead.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKvLDlnns3TWEZ5l@0xbeefdead.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, May 24, 2021 at 11:49:34AM -0400, Konrad Rzeszutek Wilk wrote:
> rmem_swiotlb_setup
> 
> ?
> 
> Which is ARM specific and inside the generic code?

I don't think it is arm specific at all.  It is OF specific, but just
about every platform but x86 uses OF.  And I can think of an ACPI version
of this as well.

