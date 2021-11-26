Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0B245E894
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 08:40:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232334.402770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqVqO-0001HG-Bd; Fri, 26 Nov 2021 07:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232334.402770; Fri, 26 Nov 2021 07:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqVqO-0001FU-7p; Fri, 26 Nov 2021 07:40:28 +0000
Received: by outflank-mailman (input) for mailman id 232334;
 Fri, 26 Nov 2021 07:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CuY=QN=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1mqVqN-0000lL-Gw
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 07:40:27 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1efdecd9-4e8c-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 08:40:26 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F195168AFE; Fri, 26 Nov 2021 08:40:22 +0100 (CET)
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
X-Inumbo-ID: 1efdecd9-4e8c-11ec-9787-a32c541c8605
Date: Fri, 26 Nov 2021 08:40:22 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, dave.hansen@linux.intel.com,
	luto@kernel.org, peterz@infradead.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	jgross@suse.com, sstabellini@kernel.org, boris.ostrovsky@oracle.com,
	kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, joro@8bytes.org,
	will@kernel.org, davem@davemloft.net, kuba@kernel.org,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	xen-devel@lists.xenproject.org, michael.h.kelley@microsoft.com,
	Tianyu Lan <Tianyu.Lan@microsoft.com>,
	iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com, brijesh.singh@amd.com,
	konrad.wilk@oracle.com, parri.andrea@gmail.com,
	thomas.lendacky@amd.com, dave.hansen@intel.com
Subject: Re: [PATCH 3/5] hyperv/IOMMU: Enable swiotlb bounce buffer for
 Isolation VM
Message-ID: <20211126074022.GA23659@lst.de>
References: <20211116153923.196763-1-ltykernel@gmail.com> <20211116153923.196763-4-ltykernel@gmail.com> <20211117100142.GB10330@lst.de> <c93bf3d4-75c1-bc3d-2789-1d65e7c19158@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c93bf3d4-75c1-bc3d-2789-1d65e7c19158@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 17, 2021 at 10:00:08PM +0800, Tianyu Lan wrote:
> On 11/17/2021 6:01 PM, Christoph Hellwig wrote:
>> This doesn't really have much to do with normal DMA mapping,
>> so why does this direct through the dma ops?
>>
>
> According to the previous discussion, dma_alloc_noncontigous()
> and dma_vmap_noncontiguous() may be used to handle the noncontigous
> memory alloc/map in the netvsc driver. So add alloc/free and vmap/vunmap
> callbacks here to handle the case. The previous patch v4 & v5 handles
> the allocation and map in the netvsc driver. If this should not go though 
> dma ops, We also may make it as vmbus specific function and keep
> the function in the vmbus driver.

But that only makes sense if they can actually use the normal DMA ops.
If you implement your own incomplete ops and require to use them you
do nothing but adding indirect calls to your fast path and making the
code convoluted.

