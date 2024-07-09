Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4993292B8C6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 13:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756225.1164774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR9NH-00017v-2U; Tue, 09 Jul 2024 11:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756225.1164774; Tue, 09 Jul 2024 11:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR9NG-00015H-WB; Tue, 09 Jul 2024 11:51:10 +0000
Received: by outflank-mailman (input) for mailman id 756225;
 Tue, 09 Jul 2024 11:51:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5/C9=OJ=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sR9NF-00015B-QQ
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 11:51:09 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 866935f4-3de9-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 13:51:06 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C293268BEB; Tue,  9 Jul 2024 13:51:03 +0200 (CEST)
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
X-Inumbo-ID: 866935f4-3de9-11ef-bbfb-fd08da9f4363
Date: Tue, 9 Jul 2024 13:51:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Christoph Hellwig <hch@lst.de>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"petr@tesarici.cz" <petr@tesarici.cz>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/1] swiotlb: Reduce swiotlb pool lookups
Message-ID: <20240709115103.GA7662@lst.de>
References: <20240708194100.1531-1-mhklinux@outlook.com> <20240709062555.GB16797@lst.de> <SN6PR02MB41571D61C2DE0D914D8B0923D4DB2@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB41571D61C2DE0D914D8B0923D4DB2@SN6PR02MB4157.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jul 09, 2024 at 11:48:08AM +0000, Michael Kelley wrote:
> Your tweaks look fine to me. Evidently I misunderstood your
> preference in our previous exchange about #ifdef vs. IS_ENABLED()
> in swiotlb_find_pool(), and the effect on dma_uses_io_tlb.

Actually I actively mislead you.  Yes, I prefer the IS_ENABLED, but
I missed that it would require make the field available unconditionally,
which is not worth the tradeoff.  Sorry for that.


