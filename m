Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6A3DD6DA
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 15:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163072.298823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXrm-0003oz-OJ; Mon, 02 Aug 2021 13:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163072.298823; Mon, 02 Aug 2021 13:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXrm-0003n6-Kt; Mon, 02 Aug 2021 13:20:26 +0000
Received: by outflank-mailman (input) for mailman id 163072;
 Mon, 02 Aug 2021 13:20:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zvSH=MZ=8bytes.org=joro@srs-us1.protection.inumbo.net>)
 id 1mAXrl-0003n0-Jx
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 13:20:25 +0000
Received: from theia.8bytes.org (unknown [81.169.241.247])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19bd6510-0d0b-4c84-a60d-6ea293fa0cde;
 Mon, 02 Aug 2021 13:20:24 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 69583379; Mon,  2 Aug 2021 15:20:20 +0200 (CEST)
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
X-Inumbo-ID: 19bd6510-0d0b-4c84-a60d-6ea293fa0cde
Date: Mon, 2 Aug 2021 15:20:03 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, will@kernel.org, davem@davemloft.net,
	kuba@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
	arnd@arndb.de, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, thomas.lendacky@amd.com,
	brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
	rientjes@google.com, martin.b.radev@gmail.com,
	akpm@linux-foundation.org, rppt@kernel.org,
	kirill.shutemov@linux.intel.com, aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com, saravanand@fb.com,
	xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
	keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
	michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com, anparri@microsoft.com
Subject: Re: [PATCH 13/13] HV/Storvsc: Add Isolation VM support for storvsc
 driver
Message-ID: <YQfxA/AYfOqyqNh0@8bytes.org>
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-14-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728145232.285861-14-ltykernel@gmail.com>

On Wed, Jul 28, 2021 at 10:52:28AM -0400, Tianyu Lan wrote:
> In Isolation VM, all shared memory with host needs to mark visible
> to host via hvcall. vmbus_establish_gpadl() has already done it for
> storvsc rx/tx ring buffer. The page buffer used by vmbus_sendpacket_
> mpb_desc() still need to handle. Use DMA API to map/umap these
> memory during sending/receiving packet and Hyper-V DMA ops callback
> will use swiotlb function to allocate bounce buffer and copy data
> from/to bounce buffer.

I am wondering why you dont't use DMA-API unconditionally? It provides
enough abstraction to do the right thing for isolated and legacy VMs.

Regards,

	Joerg

