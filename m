Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5763B2E28
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 13:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146759.270193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwNqf-0008Vc-Cb; Thu, 24 Jun 2021 11:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146759.270193; Thu, 24 Jun 2021 11:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwNqf-0008TL-8G; Thu, 24 Jun 2021 11:48:45 +0000
Received: by outflank-mailman (input) for mailman id 146759;
 Thu, 24 Jun 2021 11:48:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCk9=LS=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1lwNqd-0008TF-OK
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 11:48:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12daac31-ab98-4cff-9119-0fef9387dc7e;
 Thu, 24 Jun 2021 11:48:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E399761185;
 Thu, 24 Jun 2021 11:48:33 +0000 (UTC)
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
X-Inumbo-ID: 12daac31-ab98-4cff-9119-0fef9387dc7e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624535321;
	bh=tIEzJbFyzrkVCHoPFZv7EiSn5eGdWcktY1hM7567WC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cnBL/cs5jq0gzsWpdW01qPqR4FhnbZYA5FARUzRbfbTnReSUvqYZg/5d7fMfMzzLB
	 Yi5ocgI40U2CdP0yPBgaSH4aMAy6kTVPwJQovsDfnM8E0ctEFfmI50PYyqPNdilEHT
	 wiHUoLZz+z5T3P7Nu0n1FHp0CT0+Mpa9kCcUzUXOGKpJLUcEA7B6eF0lhIA1fVOD2N
	 8hTi4ZzKBg0KOAPGGETjH9KnPn8WseTFQmhg5QfTMY6mH9TlCuMS+A5EiYaVCFxL1+
	 hxLlyRsIfAlqe3aZtbbg/Ry8xq+FvG9CW/Y0YZqD103SdYwufpVGkDaukfSWqnEWQs
	 pjV7QbcyVw3Kw==
Date: Thu, 24 Jun 2021 12:48:30 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Claire Chang <tientzu@chromium.org>, Christoph Hellwig <hch@lst.de>,
	Qian Cai <quic_qiancai@quicinc.com>,
	Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
	peterz@infradead.org, benh@kernel.crashing.org,
	joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
	chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
	mingo@kernel.org, Jianxiong Gao <jxgao@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
	linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
	Thierry Reding <treding@nvidia.com>,
	intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
	linux-devicetree <devicetree@vger.kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
	maarten.lankhorst@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
	jani.nikula@linux.intel.com,
	Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, bauerman@linux.ibm.com
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210624114829.GB1382@willie-the-truck>
References: <20210619034043.199220-1-tientzu@chromium.org>
 <20210619034043.199220-7-tientzu@chromium.org>
 <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
 <20210623183736.GA472@willie-the-truck>
 <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
 <20210624054315.GA25381@lst.de>
 <CALiNf288ZLMhY3E8E3N+z9rkwi1viWNLm1wwMEwT4rNwh3FfwQ@mail.gmail.com>
 <364e6715-eafd-fc4a-e0af-ce2a042756b4@arm.com>
 <20210624111855.GA1382@willie-the-truck>
 <452155d2-c98e-23f6-86d6-3a2ff2e74783@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <452155d2-c98e-23f6-86d6-3a2ff2e74783@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Jun 24, 2021 at 12:34:09PM +0100, Robin Murphy wrote:
> On 2021-06-24 12:18, Will Deacon wrote:
> > On Thu, Jun 24, 2021 at 12:14:39PM +0100, Robin Murphy wrote:
> > > On 2021-06-24 07:05, Claire Chang wrote:
> > > > On Thu, Jun 24, 2021 at 1:43 PM Christoph Hellwig <hch@lst.de> wrote:
> > > > > 
> > > > > On Wed, Jun 23, 2021 at 02:44:34PM -0400, Qian Cai wrote:
> > > > > > is_swiotlb_force_bounce at /usr/src/linux-next/./include/linux/swiotlb.h:119
> > > > > > 
> > > > > > is_swiotlb_force_bounce() was the new function introduced in this patch here.
> > > > > > 
> > > > > > +static inline bool is_swiotlb_force_bounce(struct device *dev)
> > > > > > +{
> > > > > > +     return dev->dma_io_tlb_mem->force_bounce;
> > > > > > +}
> > > > > 
> > > > > To me the crash looks like dev->dma_io_tlb_mem is NULL.  Can you
> > > > > turn this into :
> > > > > 
> > > > >           return dev->dma_io_tlb_mem && dev->dma_io_tlb_mem->force_bounce;
> > > > > 
> > > > > for a quick debug check?
> > > > 
> > > > I just realized that dma_io_tlb_mem might be NULL like Christoph
> > > > pointed out since swiotlb might not get initialized.
> > > > However,  `Unable to handle kernel paging request at virtual address
> > > > dfff80000000000e` looks more like the address is garbage rather than
> > > > NULL?
> > > > I wonder if that's because dev->dma_io_tlb_mem is not assigned
> > > > properly (which means device_initialize is not called?).
> > > 
> > > What also looks odd is that the base "address" 0xdfff800000000000 is held in
> > > a couple of registers, but the offset 0xe looks too small to match up to any
> > > relevant structure member in that dereference chain :/
> > 
> > FWIW, I've managed to trigger a NULL dereference locally when swiotlb hasn't
> > been initialised but we dereference 'dev->dma_io_tlb_mem', so I think
> > Christoph's suggestion is needed regardless.
> 
> Ack to that - for SWIOTLB_NO_FORCE, io_tlb_default_mem will remain NULL. The
> massive jump in KernelCI baseline failures as of yesterday looks like every
> arm64 machine with less than 4GB of RAM blowing up...

Ok, diff below which attempts to tackle the offset issue I mentioned as
well. Qian Cai -- please can you try with these changes?

Will

--->8

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 175b6c113ed8..39284ff2a6cd 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -116,7 +116,9 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 
 static inline bool is_swiotlb_force_bounce(struct device *dev)
 {
-       return dev->dma_io_tlb_mem->force_bounce;
+       struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+
+       return mem && mem->force_bounce;
 }
 
 void __init swiotlb_exit(void);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 44be8258e27b..0ffbaae9fba2 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -449,6 +449,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
                dma_get_min_align_mask(dev) & ~(IO_TLB_SIZE - 1);
        unsigned int nslots = nr_slots(alloc_size), stride;
        unsigned int index, wrap, count = 0, i;
+       unsigned int offset = swiotlb_align_offset(dev, orig_addr);
        unsigned long flags;
 
        BUG_ON(!nslots);
@@ -497,7 +498,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
        for (i = index; i < index + nslots; i++) {
                mem->slots[i].list = 0;
                mem->slots[i].alloc_size =
-                       alloc_size - ((i - index) << IO_TLB_SHIFT);
+                       alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
        }
        for (i = index - 1;
             io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&

