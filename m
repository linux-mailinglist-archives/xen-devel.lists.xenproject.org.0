Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D493125A6
	for <lists+xen-devel@lfdr.de>; Sun,  7 Feb 2021 16:57:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82424.152209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mQ0-0002Kq-5M; Sun, 07 Feb 2021 15:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82424.152209; Sun, 07 Feb 2021 15:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mQ0-0002KR-1w; Sun, 07 Feb 2021 15:56:12 +0000
Received: by outflank-mailman (input) for mailman id 82424;
 Sun, 07 Feb 2021 15:56:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Evt2=HJ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1l8mPz-0002KM-5n
 for xen-devel@lists.xenproject.org; Sun, 07 Feb 2021 15:56:11 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e0603dc-e1a6-405a-afa1-61ad820dc84d;
 Sun, 07 Feb 2021 15:56:08 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3732F68B02; Sun,  7 Feb 2021 16:56:02 +0100 (CET)
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
X-Inumbo-ID: 3e0603dc-e1a6-405a-afa1-61ad820dc84d
Date: Sun, 7 Feb 2021 16:56:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, nouveau@lists.freedesktop.org,
	x86@kernel.org, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
	akpm@linux-foundation.org, benh@kernel.crashing.org,
	bskeggs@redhat.com, bhelgaas@google.com, bp@alien8.de,
	boris.ostrovsky@oracle.com, hch@lst.de, chris@chris-wilson.co.uk,
	daniel@ffwll.ch, airlied@linux.ie, hpa@zytor.com, mingo@kernel.org,
	mingo@redhat.com, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, jgross@suse.com,
	konrad.wilk@oracle.com, m.szyprowski@samsung.com,
	matthew.auld@intel.com, mpe@ellerman.id.au, rppt@kernel.org,
	paulus@samba.org, peterz@infradead.org, robin.murphy@arm.com,
	rodrigo.vivi@intel.com, sstabellini@kernel.org,
	bauerman@linux.ibm.com, tsbogend@alpha.franken.de,
	tglx@linutronix.de, ulf.hansson@linaro.org, joe.jin@oracle.com,
	thomas.lendacky@amd.com
Subject: Re: [PATCH RFC v1 5/6] xen-swiotlb: convert variables to arrays
Message-ID: <20210207155601.GA25111@lst.de>
References: <20210203233709.19819-1-dongli.zhang@oracle.com> <20210203233709.19819-6-dongli.zhang@oracle.com> <20210204084023.GA32328@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204084023.GA32328@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Feb 04, 2021 at 09:40:23AM +0100, Christoph Hellwig wrote:
> So one thing that has been on my mind for a while:  I'd really like
> to kill the separate dma ops in Xen swiotlb.  If we compare xen-swiotlb
> to swiotlb the main difference seems to be:
> 
>  - additional reasons to bounce I/O vs the plain DMA capable
>  - the possibility to do a hypercall on arm/arm64
>  - an extra translation layer before doing the phys_to_dma and vice
>    versa
>  - an special memory allocator
> 
> I wonder if inbetween a few jump labels or other no overhead enablement
> options and possibly better use of the dma_range_map we could kill
> off most of swiotlb-xen instead of maintaining all this code duplication?

So I looked at this a bit more.

For x86 with XENFEAT_auto_translated_physmap (how common is that?)
pfn_to_gfn is a nop, so plain phys_to_dma/dma_to_phys do work as-is.

xen_arch_need_swiotlb always returns true for x86, and
range_straddles_page_boundary should never be true for the
XENFEAT_auto_translated_physmap case.

So as far as I can tell the mapping fast path for the
XENFEAT_auto_translated_physmap can be trivially reused from swiotlb.

That leaves us with the next more complicated case, x86 or fully cache
coherent arm{,64} without XENFEAT_auto_translated_physmap.  In that case
we need to patch in a phys_to_dma/dma_to_phys that performs the MFN
lookup, which could be done using alternatives or jump labels.
I think if that is done right we should also be able to let that cover
the foreign pages in is_xen_swiotlb_buffer/is_swiotlb_buffer, but
in that worst case that would need another alternative / jump label.

For non-coherent arm{,64} we'd also need to use alternatives or jump
labels to for the cache maintainance ops, but that isn't a hard problem
either.



