Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C173691D79F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 07:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751237.1159119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sO9tB-00045F-Mt; Mon, 01 Jul 2024 05:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751237.1159119; Mon, 01 Jul 2024 05:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sO9tB-000436-K2; Mon, 01 Jul 2024 05:47:45 +0000
Received: by outflank-mailman (input) for mailman id 751237;
 Mon, 01 Jul 2024 05:47:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wz0W=OB=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1sO9t8-00041V-1z
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 05:47:43 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d3c0b82-376d-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 07:47:40 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 8D62F1D0C85;
 Mon,  1 Jul 2024 07:47:38 +0200 (CEST)
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
X-Inumbo-ID: 6d3c0b82-376d-11ef-90a4-e314d9c70b13
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1719812858; bh=e8FYNZRZuI5kI/HMQrEY/5s1bjxIxOJVytBhx8+lpm8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=w7telH3Y2yZsreZaX7KSVk1w+95a7tKP427OnWftl4f6LLVJ9S2TqidF9RqdpPlbH
	 WVrhcczr8OMR+CX8QIJSYRgg8jTathu3ayX3TH6uigHYGfHOJLpMchcYYoPImGbfUC
	 Bi2pYXmhxJ5pQ1NyAAioYXA4/fA2DKMut3/ukI3VLX/pPIhN/2seJnL5mwrcy7HFa0
	 qa9xDy4Z3oEdz/Zl6tOtf16vZaLypjrBmxXNxr1b+rS20/NvHbvhqYKYHIO31Routj
	 xXg0ar05+IS+/5+xYd3DR1RCy9+1cxFDwBlXJ7Dc/3E+ypRkuKxSDpp+9TLnmx7V4e
	 9H6Una8P8iusg==
Date: Mon, 1 Jul 2024 07:47:37 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: "hch@lst.de" <hch@lst.de>
Cc: Michael Kelley <mhklinux@outlook.com>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "will@kernel.org" <will@kernel.org>, "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Message-ID: <20240701072140.182aa267@meshulam.tesarici.cz>
In-Reply-To: <20240701043615.GB26372@lst.de>
References: <20240627060251.GA15590@lst.de>
	<20240627085216.556744c1@meshulam.tesarici.cz>
	<SN6PR02MB4157E61B49C8435E38AC968DD4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20240627152513.GA23497@lst.de>
	<SN6PR02MB4157D9B1A64FF78461D6A7EDD4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20240628060129.GA26206@lst.de>
	<20240628094708.3a454619@meshulam.tesarici.cz>
	<SN6PR02MB415781789CBD6597142BEC68D4D12@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20240630055542.GA5379@lst.de>
	<SN6PR02MB415735CA2F5487AE3FD74FFED4D22@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20240701043615.GB26372@lst.de>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Jul 2024 06:36:15 +0200
"hch@lst.de" <hch@lst.de> wrote:

> On Sun, Jun 30, 2024 at 02:02:52PM +0000, Michael Kelley wrote:
> > 1) Rename is_swiotlb_buffer() to swiotlb_find_pool(), since it
> > now returns a pool.  A NULL return value indicates that the
> > paddr is not an swiotlb buffer.
> > 
> > 2) Similarly, rename is_xen_swiotlb_buffer() to
> > xen_swiotlb_find_pool()
> > 
> > 3) The existing swiotlb_find_pool() has the same function signature,
> > but it is used only where the paddr is known to be an swiotlb buffer
> > and hence always succeeds. Rename it to __swiotlb_find_pool() as
> > the "internal" version of swiotlb_find_pool().  
> 
> Sounds good.

Agreed. Most importantly, the "nice" name swiotlb_find_pool() is used
for external users. The difference between swiotlb_find_pool() and
__swiotlb_find_pool() is that the former can be used with any device,
and the latter (internal) only with devices that make some use of
swiotlb. The main reason to keep them separate is that the internal
function should not be inlined if CONFIG_SWIOTLB_DYNAMIC=y.

I hope somebody finds my explanation useful when they touch the code
again in a few years from now. ;-)

> > 4) Do you still want is_swiotlb_buffer() as a trivial wrapper around
> > the new swiotlb_find_pool(), for use solely in dma_direct_need_sync()
> > where only a Boolean is needed and not the pool?  
> 
> If there is really just a single caller left we can skip the wrapper,
> otherwise it might be handy.

AFAICS dma_direct_need_sync() is the only such place.

Petr T

