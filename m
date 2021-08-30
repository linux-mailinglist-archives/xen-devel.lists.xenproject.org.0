Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0916F3FB4E7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 14:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174998.318929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKfy2-00083q-Pi; Mon, 30 Aug 2021 12:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174998.318929; Mon, 30 Aug 2021 12:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKfy2-00080l-M9; Mon, 30 Aug 2021 12:00:46 +0000
Received: by outflank-mailman (input) for mailman id 174998;
 Mon, 30 Aug 2021 12:00:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A3PD=NV=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1mKfy1-0007zz-5L
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 12:00:45 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e64f090f-0989-11ec-ac84-12813bfff9fa;
 Mon, 30 Aug 2021 12:00:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 25CFD68B05; Mon, 30 Aug 2021 14:00:37 +0200 (CEST)
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
X-Inumbo-ID: e64f090f-0989-11ec-ac84-12813bfff9fa
Date: Mon, 30 Aug 2021 14:00:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	x86@kernel.org, hpa@zytor.com, dave.hansen@linux.intel.com,
	luto@kernel.org, peterz@infradead.org, konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	joro@8bytes.org, davem@davemloft.net, kuba@kernel.org,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	gregkh@linuxfoundation.org, arnd@arndb.de, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	brijesh.singh@amd.com, thomas.lendacky@amd.com,
	Tianyu.Lan@microsoft.com, pgonda@google.com,
	martin.b.radev@gmail.com, akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com, rppt@kernel.org,
	hannes@cmpxchg.org, aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com, saravanand@fb.com,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, rientjes@google.com,
	ardb@kernel.org, michael.h.kelley@microsoft.com,
	iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
	vkuznets@redhat.com, parri.andrea@gmail.com, dave.hansen@intel.com
Subject: Re: [PATCH V4 00/13] x86/Hyper-V: Add Hyper-V Isolation VM support
Message-ID: <20210830120036.GA22005@lst.de>
References: <20210827172114.414281-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827172114.414281-1-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Sorry for the delayed answer, but I look at the vmap_pfn usage in the
previous version and tried to come up with a better version.  This
mostly untested branch:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/hyperv-vmap

get us there for swiotlb and the channel infrastructure  I've started
looking at the network driver and didn't get anywhere due to other work.

As far as I can tell the network driver does gigantic multi-megabyte
vmalloc allocation for the send and receive buffers, which are then
passed to the hardware, but always copied to/from when interacting
with the networking stack.  Did I see that right?  Are these big
buffers actually required unlike the normal buffer management schemes
in other Linux network drivers?

If so I suspect the best way to allocate them is by not using vmalloc
but just discontiguous pages, and then use kmap_local_pfn where the
PFN includes the share_gpa offset when actually copying from/to the
skbs.

