Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DA13A99F5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:09:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142910.263540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltULk-000167-GS; Wed, 16 Jun 2021 12:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142910.263540; Wed, 16 Jun 2021 12:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltULk-00012t-Cv; Wed, 16 Jun 2021 12:08:52 +0000
Received: by outflank-mailman (input) for mailman id 142910;
 Wed, 16 Jun 2021 12:08:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EZWs=LK=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1ltULj-00012n-7V
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:08:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43c8636c-5b13-4f09-ad0c-2f17bcfa809b;
 Wed, 16 Jun 2021 12:08:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD51A61245;
 Wed, 16 Jun 2021 12:08:41 +0000 (UTC)
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
X-Inumbo-ID: 43c8636c-5b13-4f09-ad0c-2f17bcfa809b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623845329;
	bh=QlkI38WT3hL5S6bnBl68cYI3mNCvqwOg2BtN6RClOD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gNoqbf4BoEB+mMSkF0LbPACcE8hfdhWziBuc3On0yCSF1OPpARGrphJEZzi5R8zhj
	 EQBk9eSasfJ21LDYEs5fQgad/5i5kQ4hvjwr2VzkCT5qsBkbBa2YuO73damjDS9tPT
	 gEWv6ceU59Ud8WyKcV32BLXCIyoDzCKKiI1Qx1b1D7h7TGQnS6Yc8Hh4jwg0vvdXHU
	 1ESCA6NJ9d+xly0Ts4XCXJSqpVE+kwtWKvwUzczVJ12VkVaF8vrrLoIIMNmcUpnUot
	 CLEWTlb2HNfBG1sx2OnHpHCbJjguomfMTK9NnEnMModJku7GBFKFrxYfN57naGCL26
	 kwPvkXDDNtLyg==
Date: Wed, 16 Jun 2021 13:08:38 +0100
From: Will Deacon <will@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
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
	thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v12 00/12] Restricted DMA
Message-ID: <20210616120837.GA22783@willie-the-truck>
References: <20210616062157.953777-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616062157.953777-1-tientzu@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Claire,

On Wed, Jun 16, 2021 at 02:21:45PM +0800, Claire Chang wrote:
> This series implements mitigations for lack of DMA access control on
> systems without an IOMMU, which could result in the DMA accessing the
> system memory at unexpected times and/or unexpected addresses, possibly
> leading to data leakage or corruption.
> 
> For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> not behind an IOMMU. As PCI-e, by design, gives the device full access to
> system memory, a vulnerability in the Wi-Fi firmware could easily escalate
> to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> full chain of exploits; [2], [3]).
> 
> To mitigate the security concerns, we introduce restricted DMA. Restricted
> DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> specially allocated region and does memory allocation from the same region.
> The feature on its own provides a basic level of protection against the DMA
> overwriting buffer contents at unexpected times. However, to protect
> against general data leakage and system memory corruption, the system needs
> to provide a way to restrict the DMA to a predefined memory region (this is
> usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).
> 
> [1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
> [1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
> [2] https://blade.tencent.com/en/advisories/qualpwn/
> [3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
> [4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
> 
> v12:
> Split is_dev_swiotlb_force into is_swiotlb_force_bounce (patch 06/12) and
> is_swiotlb_for_alloc (patch 09/12)

I took this for a spin in an arm64 KVM guest with virtio devices using the
DMA API and it works as expected on top of swiotlb devel/for-linus-5.14, so:

Tested-by: Will Deacon <will@kernel.org>

Thanks!

Will

