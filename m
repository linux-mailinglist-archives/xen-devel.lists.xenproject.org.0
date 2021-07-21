Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8DE3D116D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 16:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159392.293201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6DIR-0007sy-9p; Wed, 21 Jul 2021 14:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159392.293201; Wed, 21 Jul 2021 14:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6DIR-0007r9-6X; Wed, 21 Jul 2021 14:34:03 +0000
Received: by outflank-mailman (input) for mailman id 159392;
 Wed, 21 Jul 2021 14:34:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fegI=MN=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1m6DIP-0007r0-MQ
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 14:34:01 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afe88b88-ea30-11eb-8c5c-12813bfff9fa;
 Wed, 21 Jul 2021 14:34:00 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 089B867373; Wed, 21 Jul 2021 16:33:56 +0200 (CEST)
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
X-Inumbo-ID: afe88b88-ea30-11eb-8c5c-12813bfff9fa
Date: Wed, 21 Jul 2021 16:33:55 +0200
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
	robin.murphy@arm.com, kirill.shutemov@linux.intel.com,
	akpm@linux-foundation.org, rppt@kernel.org,
	Tianyu.Lan@microsoft.com, thomas.lendacky@amd.com, ardb@kernel.org,
	robh@kernel.org, nramas@linux.microsoft.com, pgonda@google.com,
	martin.b.radev@gmail.com, david@redhat.com,
	krish.sadhukhan@oracle.com, saravanand@fb.com,
	xen-devel@lists.xenproject.org, keescook@chromium.org,
	rientjes@google.com, hannes@cmpxchg.org,
	michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com, brijesh.singh@amd.com,
	anparri@microsoft.com
Subject: Re: [Resend RFC PATCH V4 09/13] x86/Swiotlb/HV: Add Swiotlb bounce
 buffer remap function for HV IVM
Message-ID: <20210721143355.GA10848@lst.de>
References: <20210707154629.3977369-1-ltykernel@gmail.com> <20210707154629.3977369-10-ltykernel@gmail.com> <20210720135437.GA13554@lst.de> <8f1a285d-4b67-8041-d326-af565b2756c0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f1a285d-4b67-8041-d326-af565b2756c0@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jul 21, 2021 at 06:28:48PM +0800, Tianyu Lan wrote:
> dma_mmap_attrs() and dma_get_sgtable_attrs() get input virtual address
> belonging to backing memory with struct page and returns bounce buffer
> dma physical address which is below shared_gpa_boundary(vTOM) and passed
> to Hyper-V via vmbus protocol.
>
> The new map virtual address is only to access bounce buffer in swiotlb
> code and will not be used other places. It's stored in the mem->vstart.
> So the new API set_memory_decrypted_map() in this series is only called
> in the swiotlb code. Other platforms may replace set_memory_decrypted()
> with set_memory_decrypted_map() as requested.

It seems like you are indeed not using these new helpers in
dma_direct_alloc.  How is dma_alloc_attrs/dma_alloc_coherent going to
work on these systems?

