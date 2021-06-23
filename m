Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9992B3B2060
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 20:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146278.269121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lw7l1-0007QI-Ej; Wed, 23 Jun 2021 18:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146278.269121; Wed, 23 Jun 2021 18:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lw7l1-0007OT-Bd; Wed, 23 Jun 2021 18:37:51 +0000
Received: by outflank-mailman (input) for mailman id 146278;
 Wed, 23 Jun 2021 18:37:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcuX=LR=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1lw7l0-0007ON-5K
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 18:37:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8169a997-27df-40f9-8136-c29e1e413bc1;
 Wed, 23 Jun 2021 18:37:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C1E061185;
 Wed, 23 Jun 2021 18:37:40 +0000 (UTC)
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
X-Inumbo-ID: 8169a997-27df-40f9-8136-c29e1e413bc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624473468;
	bh=K9ctSOOXg/HLNG/KMzo+bt+uXbhOKksVK31vHq8QEAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pew0mCStiOrsU0bWjM0b54f2cDTk0BFJYuT7oL0Hl93RfndilrrpZ00P5EcbMTEX/
	 /lbkdoUtJfhzG6xhgO6NWycBIcDRvmNhEJGTWAKSFbeL2aFhOe2jpLrVodVSrKGkzr
	 gHxURUCJo+Bry9z+VHTZDIOT/ABoSs0DN2Tjo7IL/UHU38iukI2V/m5xdJIYc7NUws
	 7NMVKjT7vcMuSIu2fy0OZOLVI8+LwwecPlMOHv27TBpClMax/sAEQmgzVN3VS5iIlB
	 HGiL4Uzn3xHn2voW7eTXBh/NjM9NO32LN+GkhPpRHj+kINjyQizH9+P5WDGveYcADU
	 kFBCzfquuEa8w==
Date: Wed, 23 Jun 2021 19:37:37 +0100
From: Will Deacon <will@kernel.org>
To: Qian Cai <quic_qiancai@quicinc.com>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
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
Message-ID: <20210623183736.GA472@willie-the-truck>
References: <20210619034043.199220-1-tientzu@chromium.org>
 <20210619034043.199220-7-tientzu@chromium.org>
 <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jun 23, 2021 at 12:39:29PM -0400, Qian Cai wrote:
> 
> 
> On 6/18/2021 11:40 PM, Claire Chang wrote:
> > Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
> > use it to determine whether to bounce the data or not. This will be
> > useful later to allow for different pools.
> > 
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> > Tested-by: Will Deacon <will@kernel.org>
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Reverting the rest of the series up to this patch fixed a boot crash with NVMe on today's linux-next.

Hmm, so that makes patch 7 the suspicious one, right?

Looking at that one more closely, it looks like swiotlb_find_slots() takes
'alloc_size + offset' as its 'alloc_size' parameter from
swiotlb_tbl_map_single() and initialises 'mem->slots[i].alloc_size' based
on 'alloc_size + offset', which looks like a change in behaviour from the
old code, which didn't include the offset there.

swiotlb_release_slots() then adds the offset back on afaict, so we end up
accounting for it twice and possibly unmap more than we're supposed to?

Will

