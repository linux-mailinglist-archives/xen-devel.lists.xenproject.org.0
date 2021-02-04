Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8E030EE98
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 09:41:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81176.149478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7aBj-0001O7-KQ; Thu, 04 Feb 2021 08:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81176.149478; Thu, 04 Feb 2021 08:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7aBj-0001Ni-H0; Thu, 04 Feb 2021 08:40:31 +0000
Received: by outflank-mailman (input) for mailman id 81176;
 Thu, 04 Feb 2021 08:40:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VauU=HG=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1l7aBh-0001Nb-Sq
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 08:40:29 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecce8bd5-4ca9-4aa1-90f8-edddb2f725e6;
 Thu, 04 Feb 2021 08:40:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 77E4067373; Thu,  4 Feb 2021 09:40:23 +0100 (CET)
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
X-Inumbo-ID: ecce8bd5-4ca9-4aa1-90f8-edddb2f725e6
Date: Thu, 4 Feb 2021 09:40:23 +0100
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
Message-ID: <20210204084023.GA32328@lst.de>
References: <20210203233709.19819-1-dongli.zhang@oracle.com> <20210203233709.19819-6-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203233709.19819-6-dongli.zhang@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

So one thing that has been on my mind for a while:  I'd really like
to kill the separate dma ops in Xen swiotlb.  If we compare xen-swiotlb
to swiotlb the main difference seems to be:

 - additional reasons to bounce I/O vs the plain DMA capable
 - the possibility to do a hypercall on arm/arm64
 - an extra translation layer before doing the phys_to_dma and vice
   versa
 - an special memory allocator

I wonder if inbetween a few jump labels or other no overhead enablement
options and possibly better use of the dma_range_map we could kill
off most of swiotlb-xen instead of maintaining all this code duplication?

