Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A174C39D530
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 08:43:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137688.255076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq8yj-0003Bz-Fr; Mon, 07 Jun 2021 06:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137688.255076; Mon, 07 Jun 2021 06:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq8yj-00038o-CM; Mon, 07 Jun 2021 06:43:17 +0000
Received: by outflank-mailman (input) for mailman id 137688;
 Mon, 07 Jun 2021 06:43:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZuZ8=LB=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lq8yi-00037m-07
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 06:43:16 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5521208-f9ca-44d4-b8d7-7fb737526b70;
 Mon, 07 Jun 2021 06:43:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 19E8068AFE; Mon,  7 Jun 2021 08:43:13 +0200 (CEST)
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
X-Inumbo-ID: f5521208-f9ca-44d4-b8d7-7fb737526b70
Date: Mon, 7 Jun 2021 08:43:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com, rppt@kernel.org,
	hannes@cmpxchg.org, cai@lca.pw, krish.sadhukhan@oracle.com,
	saravanand@fb.com, Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com,
	hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	joro@8bytes.org, will@kernel.org, xen-devel@lists.xenproject.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com,
	thomas.lendacky@amd.com, brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: Re: [RFC PATCH V3 08/11] swiotlb: Add bounce buffer remap address
 setting function
Message-ID: <20210607064312.GB24478@lst.de>
References: <20210530150628.2063957-1-ltykernel@gmail.com> <20210530150628.2063957-9-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530150628.2063957-9-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, May 30, 2021 at 11:06:25AM -0400, Tianyu Lan wrote:
> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> For Hyper-V isolation VM with AMD SEV SNP, the bounce buffer(shared memory)
> needs to be accessed via extra address space(e.g address above bit39).
> Hyper-V code may remap extra address space outside of swiotlb. swiotlb_
> bounce() needs to use remap virtual address to copy data from/to bounce
> buffer. Add new interface swiotlb_set_bounce_remap() to do that.

Why can't you use the bus_dma_region ranges to remap to your preferred
address?

