Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332C43BC5BD
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 06:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150708.278623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0d0z-0008Vl-02; Tue, 06 Jul 2021 04:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150708.278623; Tue, 06 Jul 2021 04:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0d0y-0008Su-Sk; Tue, 06 Jul 2021 04:48:56 +0000
Received: by outflank-mailman (input) for mailman id 150708;
 Tue, 06 Jul 2021 04:48:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O3el=L6=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1m0d0x-0008So-AZ
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 04:48:55 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8ecf833-2c27-4caf-8ae2-18cb4d664dfb;
 Tue, 06 Jul 2021 04:48:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 25C5068BEB; Tue,  6 Jul 2021 06:48:49 +0200 (CEST)
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
X-Inumbo-ID: e8ecf833-2c27-4caf-8ae2-18cb4d664dfb
Date: Tue, 6 Jul 2021 06:48:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Will Deacon <will@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Claire Chang <tientzu@chromium.org>,
	Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	benh@kernel.crashing.org, paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Stefano Stabellini <sstabellini@kernel.org>, grant.likely@arm.com,
	xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org,
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
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Qian Cai <quic_qiancai@quicinc.com>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210706044848.GA13640@lst.de>
References: <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain> <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com> <20210630114348.GA8383@willie-the-truck> <YNyUQwiagNeZ9YeJ@Ryzen-9-3900X.localdomain> <20210701074045.GA9436@willie-the-truck> <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org> <20210702135856.GB11132@willie-the-truck> <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com> <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain> <20210705190352.GA19461@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705190352.GA19461@willie-the-truck>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jul 05, 2021 at 08:03:52PM +0100, Will Deacon wrote:
> So at this point, the AMD IOMMU driver does:
> 
> 	swiotlb        = (iommu_default_passthrough() || sme_me_mask) ? 1 : 0;
> 
> where 'swiotlb' is a global variable indicating whether or not swiotlb
> is in use. It's picked up a bit later on by pci_swiotlb_late_init(), which
> will call swiotlb_exit() if 'swiotlb' is false.
> 
> Now, that used to work fine, because swiotlb_exit() clears
> 'io_tlb_default_mem' to NULL, but now with the restricted DMA changes, I
> think that all the devices which have successfully probed beforehand will
> have stale pointers to the freed structure in their 'dev->dma_io_tlb_mem'
> field.

Yeah.  I don't think we can do that anymore, and I also think it is
a bad idea to start with.

