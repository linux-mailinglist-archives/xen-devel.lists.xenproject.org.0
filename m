Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61EC91D710
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 06:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751231.1159108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sO8m5-000483-Sk; Mon, 01 Jul 2024 04:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751231.1159108; Mon, 01 Jul 2024 04:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sO8m5-00045P-Q3; Mon, 01 Jul 2024 04:36:21 +0000
Received: by outflank-mailman (input) for mailman id 751231;
 Mon, 01 Jul 2024 04:36:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ufHl=OB=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sO8m4-00045J-DT
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 04:36:20 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 754b86a0-3763-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 06:36:18 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 86AF568BEB; Mon,  1 Jul 2024 06:36:15 +0200 (CEST)
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
X-Inumbo-ID: 754b86a0-3763-11ef-90a4-e314d9c70b13
Date: Mon, 1 Jul 2024 06:36:15 +0200
From: "hch@lst.de" <hch@lst.de>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "hch@lst.de" <hch@lst.de>,
	Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Message-ID: <20240701043615.GB26372@lst.de>
References: <20240627060251.GA15590@lst.de> <20240627085216.556744c1@meshulam.tesarici.cz> <SN6PR02MB4157E61B49C8435E38AC968DD4D72@SN6PR02MB4157.namprd02.prod.outlook.com> <20240627152513.GA23497@lst.de> <SN6PR02MB4157D9B1A64FF78461D6A7EDD4D72@SN6PR02MB4157.namprd02.prod.outlook.com> <20240628060129.GA26206@lst.de> <20240628094708.3a454619@meshulam.tesarici.cz> <SN6PR02MB415781789CBD6597142BEC68D4D12@SN6PR02MB4157.namprd02.prod.outlook.com> <20240630055542.GA5379@lst.de> <SN6PR02MB415735CA2F5487AE3FD74FFED4D22@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB415735CA2F5487AE3FD74FFED4D22@SN6PR02MB4157.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, Jun 30, 2024 at 02:02:52PM +0000, Michael Kelley wrote:
> 1) Rename is_swiotlb_buffer() to swiotlb_find_pool(), since it
> now returns a pool.  A NULL return value indicates that the
> paddr is not an swiotlb buffer.
> 
> 2) Similarly, rename is_xen_swiotlb_buffer() to
> xen_swiotlb_find_pool()
> 
> 3) The existing swiotlb_find_pool() has the same function signature,
> but it is used only where the paddr is known to be an swiotlb buffer
> and hence always succeeds. Rename it to __swiotlb_find_pool() as
> the "internal" version of swiotlb_find_pool().

Sounds good.

> 4) Do you still want is_swiotlb_buffer() as a trivial wrapper around
> the new swiotlb_find_pool(), for use solely in dma_direct_need_sync()
> where only a Boolean is needed and not the pool?

If there is really just a single caller left we can skip the wrapper,
otherwise it might be handy.


