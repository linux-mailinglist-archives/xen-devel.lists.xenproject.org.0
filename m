Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE21C3B433E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 14:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147167.271081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwkyR-0002CF-B6; Fri, 25 Jun 2021 12:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147167.271081; Fri, 25 Jun 2021 12:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwkyR-00029e-80; Fri, 25 Jun 2021 12:30:19 +0000
Received: by outflank-mailman (input) for mailman id 147167;
 Fri, 25 Jun 2021 12:30:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xnol=LT=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1lwkyQ-00029Y-0m
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 12:30:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 154c3622-c7b3-4074-bca4-e8816fa18135;
 Fri, 25 Jun 2021 12:30:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4C9361463;
 Fri, 25 Jun 2021 12:30:08 +0000 (UTC)
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
X-Inumbo-ID: 154c3622-c7b3-4074-bca4-e8816fa18135
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624624216;
	bh=236dSGX7ExOVPv4h0UeOksGQ8SgYCOQ7aXD3NGK83S0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCaWwZtC9a0kNjsO191mUbtUcojnviRFMJnXBZ/UQc+wZDgM8hUcreC3qNCEkirNE
	 bbLWlaMbJfBXlg05V08tS0sV+lbJ6mjPNoN7Y8AT15UfxghYQbA3zVDmQkdENHWUeg
	 aoWWbni5r3mbAZmV1yWyb6Qtn3Rm3bH4e4imD6DcErBaFTOVYzmckxYQM6wCi00qxL
	 IKspsHt2W8+A5P7LrhMSB0wLC0J5AtiueFbpUWEKsYqOURtPkRdQJiwA+N05SkMbY0
	 yNml1K+qGwoAZk+3C0lKdhaf1wsPR1zKe7fVETOXT9FqPpHlh5Z2ca5kWomvg9Dx6c
	 8Pdmk/dzJ5M/g==
Date: Fri, 25 Jun 2021 13:30:05 +0100
From: Will Deacon <will@kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
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
	Jim Quinlan <james.quinlan@broadcom.com>, tfiga@chromium.org,
	bskeggs@redhat.com, bhelgaas@google.com, chris@chris-wilson.co.uk,
	daniel@ffwll.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	jxgao@google.com, joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com, rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com, thomas.lendacky@amd.com,
	quic_qiancai@quicinc.com
Subject: Re: [PATCH v15 00/12] Restricted DMA
Message-ID: <20210625123004.GA3170@willie-the-truck>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <YNTa1C5uvz+qWryf@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNTa1C5uvz+qWryf@char.us.oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Jun 24, 2021 at 03:19:48PM -0400, Konrad Rzeszutek Wilk wrote:
> On Thu, Jun 24, 2021 at 11:55:14PM +0800, Claire Chang wrote:
> > This series implements mitigations for lack of DMA access control on
> > systems without an IOMMU, which could result in the DMA accessing the
> > system memory at unexpected times and/or unexpected addresses, possibly
> > leading to data leakage or corruption.
> > 
> > For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> > not behind an IOMMU. As PCI-e, by design, gives the device full access to
> > system memory, a vulnerability in the Wi-Fi firmware could easily escalate
> > to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> > full chain of exploits; [2], [3]).
> > 
> > To mitigate the security concerns, we introduce restricted DMA. Restricted
> > DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> > specially allocated region and does memory allocation from the same region.
> > The feature on its own provides a basic level of protection against the DMA
> > overwriting buffer contents at unexpected times. However, to protect
> > against general data leakage and system memory corruption, the system needs
> > to provide a way to restrict the DMA to a predefined memory region (this is
> > usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).
> > 
> > [1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
> > [1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
> > [2] https://blade.tencent.com/en/advisories/qualpwn/
> > [3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
> > [4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
> > 
> > v15:
> > - Apply Will's diff (https://lore.kernel.org/patchwork/patch/1448957/#1647521)
> >   to fix the crash reported by Qian.
> > - Add Stefano's Acked-by tag for patch 01/12 from v14
> 
> That all should be now be on
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git/
> devel/for-linus-5.14 (and linux-next)

Thanks Konrad!

Will

