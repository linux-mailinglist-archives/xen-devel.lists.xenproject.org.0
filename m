Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8243CA34B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 18:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156793.289389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44c2-0002L0-Pn; Thu, 15 Jul 2021 16:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156793.289389; Thu, 15 Jul 2021 16:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44c2-0002IN-Mj; Thu, 15 Jul 2021 16:53:26 +0000
Received: by outflank-mailman (input) for mailman id 156793;
 Thu, 15 Jul 2021 16:53:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tkDB=MH=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1m44c0-0002IH-En
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 16:53:25 +0000
Received: from pandora.armlinux.org.uk (unknown
 [2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 319dd089-c00e-46dc-a1ee-e0eb4d0a1950;
 Thu, 15 Jul 2021 16:53:22 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46188)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1m44bq-00015M-DY; Thu, 15 Jul 2021 17:53:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1m44bl-0002LK-Cz; Thu, 15 Jul 2021 17:53:09 +0100
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
X-Inumbo-ID: 319dd089-c00e-46dc-a1ee-e0eb4d0a1950
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	 bh=SHLau5Ake9xcwQGIQtYxnHJNJDrvOEPwwI40kAVcRog=; b=U8UTMSyF6jF6T0gR2j3D29bvs
	eItdcAl8yoYyPm0BOaqxfp0KAqwYLm3tCNGL3UOXkwf2YVG3YLDETqIWI2+TSILpWhKSi+ZfIepQo
	lLen0o6KgjL85hkzakJ1QZk21sjlzGaASbY+nCfE7vBnPME0Mzb+H5RRmAZ+ZNIKuXcRPERLyqXtq
	VdtZCLk1naymemWuZBuS7BxTMY7tagmEv9JEUS6/HzNAPZKSxBYrlmfrzjhaGexuK2It2kZa4r1/A
	CGDiaLgNp8Hmc8kCrs/WvG5KWvG0MHFhzYQbO2P7Gy0lVzLUmA2kl6R0xkg6NYiRgFN4tL0/sUnPU
	SpUuGxGOA==;
Date: Thu, 15 Jul 2021 17:53:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
	xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stephen Bates <sbates@raithlin.com>,
	Martin Oliveira <martin.oliveira@eideticom.com>
Subject: Re: [PATCH v1 00/16] .map_sg() error cleanup
Message-ID: <20210715165309.GO22278@shell.armlinux.org.uk>
References: <20210715164544.6827-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Jul 15, 2021 at 10:45:28AM -0600, Logan Gunthorpe wrote:
> Hi,
> 
> This series is spun out and expanded from my work to add P2PDMA support
> to DMA map operations[1].
> 
> The P2PDMA work requires distinguishing different error conditions in
> a map_sg operation. dma_map_sgtable() already allows for returning an
> error code (where as dma_map_sg() is only allowed to return zero)
> however, it currently only returns -EINVAL when a .map_sg() call returns
> zero.
> 
> This series cleans up all .map_sg() implementations to return appropriate
> error codes. After the cleanup, dma_map_sg() will still return zero,
> however dma_map_sgtable() will pass the error code from the .map_sg()
> call. Thanks go to Martn Oliveira for doing a lot of the cleanup of the
> obscure implementations.
> 
> The patch set is based off of v5.14-rc1 and a git repo can be found
> here:

Have all the callers for dma_map_sg() been updated to check for error
codes? If not, isn't that a pre-requisit to this patch set?

From what I see in Linus' current tree, we still have cases today
where the return value of dma_map_sg() is compared with zero to
detect failure, so I think that needs fixing before we start changing
the dma_map_sg() implementation to return negative numbers.

I also notice that there are various places that don't check the
return value - and returning a negative number instead of zero may
well cause random other bits to be set in fields.

So, I think there's a fair amount of work to do in all the drivers
before this change can be considered.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

