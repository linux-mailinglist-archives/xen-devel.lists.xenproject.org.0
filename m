Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D783B26F6
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 07:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146399.269367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwI96-0004NG-Qw; Thu, 24 Jun 2021 05:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146399.269367; Thu, 24 Jun 2021 05:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwI96-0004LQ-N5; Thu, 24 Jun 2021 05:43:24 +0000
Received: by outflank-mailman (input) for mailman id 146399;
 Thu, 24 Jun 2021 05:43:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=55tw=LS=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lwI94-0004LK-S4
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 05:43:22 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a1f9078-82c8-485c-babb-480776fbae31;
 Thu, 24 Jun 2021 05:43:20 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6EF7567373; Thu, 24 Jun 2021 07:43:15 +0200 (CEST)
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
X-Inumbo-ID: 8a1f9078-82c8-485c-babb-480776fbae31
Date: Thu, 24 Jun 2021 07:43:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Qian Cai <quic_qiancai@quicinc.com>
Cc: Will Deacon <will@kernel.org>, Claire Chang <tientzu@chromium.org>,
	Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
	peterz@infradead.org, benh@kernel.crashing.org,
	joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
	chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
	mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
	Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
	linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
	Thierry Reding <treding@nvidia.com>,
	intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
	linux-devicetree <devicetree@vger.kernel.org>, daniel@ffwll.ch,
	airlied@linux.ie, maarten.lankhorst@linux.intel.com,
	linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
	Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
	bhelgaas@google.com, Dan Williams <dan.j.williams@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Jim Quinlan <james.quinlan@broadcom.com>, thomas.lendacky@amd.com,
	Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210624054315.GA25381@lst.de>
References: <20210619034043.199220-1-tientzu@chromium.org> <20210619034043.199220-7-tientzu@chromium.org> <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com> <20210623183736.GA472@willie-the-truck> <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jun 23, 2021 at 02:44:34PM -0400, Qian Cai wrote:
> is_swiotlb_force_bounce at /usr/src/linux-next/./include/linux/swiotlb.h:119
> 
> is_swiotlb_force_bounce() was the new function introduced in this patch here.
> 
> +static inline bool is_swiotlb_force_bounce(struct device *dev)
> +{
> +	return dev->dma_io_tlb_mem->force_bounce;
> +}

To me the crash looks like dev->dma_io_tlb_mem is NULL.  Can you
turn this into :

	return dev->dma_io_tlb_mem && dev->dma_io_tlb_mem->force_bounce;

for a quick debug check?

