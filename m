Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00993A911D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 07:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142595.263064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltNws-0007NP-6w; Wed, 16 Jun 2021 05:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142595.263064; Wed, 16 Jun 2021 05:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltNws-0007LY-3x; Wed, 16 Jun 2021 05:18:46 +0000
Received: by outflank-mailman (input) for mailman id 142595;
 Wed, 16 Jun 2021 05:18:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IKif=LK=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1ltNwr-0007LS-8i
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 05:18:45 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d7f71cb-0e37-435b-b809-5e9e5642ff32;
 Wed, 16 Jun 2021 05:18:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EC67D68AFE; Wed, 16 Jun 2021 07:18:39 +0200 (CEST)
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
X-Inumbo-ID: 7d7f71cb-0e37-435b-b809-5e9e5642ff32
Date: Wed, 16 Jun 2021 07:18:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Claire Chang <tientzu@chromium.org>
Cc: Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
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
Subject: Re: [PATCH v11 09/12] swiotlb: Add restricted DMA alloc/free
 support
Message-ID: <20210616051839.GA27982@lst.de>
References: <20210616035240.840463-1-tientzu@chromium.org> <20210616035240.840463-10-tientzu@chromium.org> <CALiNf28=3vqAs+8HsjyBGOiPNR2F3yT6OGnLpZH_AkWqgTqgOA@mail.gmail.com> <20210616045918.GA27537@lst.de> <CALiNf2-+vL8rw5fi=DcR=V7d55Ls3-OXoxC87Pvrf1Kz14D_+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALiNf2-+vL8rw5fi=DcR=V7d55Ls3-OXoxC87Pvrf1Kz14D_+A@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jun 16, 2021 at 01:10:02PM +0800, Claire Chang wrote:
> On Wed, Jun 16, 2021 at 12:59 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Wed, Jun 16, 2021 at 12:04:16PM +0800, Claire Chang wrote:
> > > Just noticed that after propagating swiotlb_force setting into
> > > io_tlb_default_mem->force, the memory allocation behavior for
> > > swiotlb_force will change (i.e. always skipping arch_dma_alloc and
> > > dma_direct_alloc_from_pool).
> >
> > Yes, I think we need to split a "use_for_alloc" flag from the force flag.
> 
> How about splitting is_dev_swiotlb_force into is_swiotlb_force_bounce
> (io_tlb_mem->force_bounce) and is_swiotlb_force_alloc
> (io_tlb_mem->force_alloc)?

Yes, something like that.  I'd probably not use force for the alloc side
given that we otherwise never allocte from the swiotlb buffer.

