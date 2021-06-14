Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749FE3A6A81
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 17:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141640.261577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsoat-0005oi-EY; Mon, 14 Jun 2021 15:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141640.261577; Mon, 14 Jun 2021 15:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsoat-0005mO-Ac; Mon, 14 Jun 2021 15:33:43 +0000
Received: by outflank-mailman (input) for mailman id 141640;
 Mon, 14 Jun 2021 15:33:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aFdS=LI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lsoar-0005mG-I4
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 15:33:41 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04af035a-0bae-479a-9225-1ea44978ae1b;
 Mon, 14 Jun 2021 15:33:41 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4E32868AFE; Mon, 14 Jun 2021 17:33:39 +0200 (CEST)
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
X-Inumbo-ID: 04af035a-0bae-479a-9225-1ea44978ae1b
Date: Mon, 14 Jun 2021 17:33:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, kys@microsoft.com,
	haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, x86@kernel.org, hpa@zytor.com, arnd@arndb.de,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, kirill.shutemov@linux.intel.com,
	rppt@kernel.org, hannes@cmpxchg.org, cai@lca.pw,
	krish.sadhukhan@oracle.com, saravanand@fb.com,
	Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	joro@8bytes.org, will@kernel.org, xen-devel@lists.xenproject.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com,
	thomas.lendacky@amd.com, brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: Re: [RFC PATCH V3 10/11] HV/Netvsc: Add Isolation VM support for
 netvsc driver
Message-ID: <20210614153339.GB1741@lst.de>
References: <20210530150628.2063957-1-ltykernel@gmail.com> <20210530150628.2063957-11-ltykernel@gmail.com> <20210607065007.GE24478@lst.de> <279cb4bf-c5b6-6db9-0f1e-9238e902c8f2@gmail.com> <20210614070903.GA29976@lst.de> <e10c2696-23c3-befe-4f4d-25e18918132f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e10c2696-23c3-befe-4f4d-25e18918132f@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jun 14, 2021 at 10:04:06PM +0800, Tianyu Lan wrote:
> The pages in the hv_page_buffer array here are in the kernel linear 
> mapping. The packet sent to host will contain an array which contains 
> transaction data. In the isolation VM, data in the these pages needs to be 
> copied to bounce buffer and so call dma_map_single() here to map these data 
> pages with bounce buffer. The vmbus has ring buffer where the send/receive 
> packets are copied to/from. The ring buffer has been remapped to the extra 
> space above shared gpa boundary/vTom during probing Netvsc driver and so 
> not call dma map function for vmbus ring
> buffer.

So why do we have all that PFN magic instead of using struct page or
the usual kernel I/O buffers that contain a page pointer?

