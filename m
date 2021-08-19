Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019183F1598
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 10:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168443.307544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGdkN-0002Ih-Lc; Thu, 19 Aug 2021 08:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168443.307544; Thu, 19 Aug 2021 08:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGdkN-0002Fz-II; Thu, 19 Aug 2021 08:49:59 +0000
Received: by outflank-mailman (input) for mailman id 168443;
 Thu, 19 Aug 2021 08:49:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qlai=NK=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1mGdkL-0002Ft-FG
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 08:49:57 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6cfeb4ae-00ca-11ec-a5c9-12813bfff9fa;
 Thu, 19 Aug 2021 08:49:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9B4F767357; Thu, 19 Aug 2021 10:49:51 +0200 (CEST)
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
X-Inumbo-ID: 6cfeb4ae-00ca-11ec-a5c9-12813bfff9fa
Date: Thu, 19 Aug 2021 10:49:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, kys@microsoft.com,
	haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, arnd@arndb.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, thomas.lendacky@amd.com,
	brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
	pgonda@google.com, martin.b.radev@gmail.com,
	akpm@linux-foundation.org, kirill.shutemov@linux.intel.com,
	rppt@kernel.org, sfr@canb.auug.org.au, saravanand@fb.com,
	krish.sadhukhan@oracle.com, aneesh.kumar@linux.ibm.com,
	xen-devel@lists.xenproject.org, rientjes@google.com,
	hannes@cmpxchg.org, tj@kernel.org, michael.h.kelley@microsoft.com,
	iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
	vkuznets@redhat.com, parri.andrea@gmail.com, dave.hansen@intel.com
Subject: Re: [PATCH V3 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap
 function for HV IVM
Message-ID: <20210819084951.GA10461@lst.de>
References: <20210809175620.720923-1-ltykernel@gmail.com> <20210809175620.720923-11-ltykernel@gmail.com> <20210812122741.GC19050@lst.de> <d18ae061-6fc2-e69e-fc2c-2e1a1114c4b4@gmail.com> <890e5e21-714a-2db6-f68a-6211a69bebb9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <890e5e21-714a-2db6-f68a-6211a69bebb9@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Aug 16, 2021 at 10:50:26PM +0800, Tianyu Lan wrote:
> Hi Christoph:
>       Sorry to bother you.Please double check with these two patches
> " [PATCH V3 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap function 
> for HV IVM" and "[PATCH V3 09/13] DMA: Add dma_map_decrypted/dma_
> unmap_encrypted() function".

Do you have a git tree somewhere to look at the whole tree?

>       The swiotlb bounce buffer in the isolation VM are allocated in the
> low end memory and these memory has struct page backing. All dma address
> returned by swiotlb/DMA API are low end memory and this is as same as what 
> happen in the traditional VM.

Indeed.

>       The API dma_map_decrypted() introduced in the patch 9 is to map the 
> bounce buffer in the extra space and these memory in the low end space are 
> used as DMA memory in the driver. Do you prefer these APIs
> still in the set_memory.c? I move the API to dma/mapping.c due to the
> suggested name arch_dma_map_decrypted() in the previous mail
> (https://lore.kernel.org/netdev/20210720135437.GA13554@lst.de/).

Well, what would help is a clear description of the semantics.

