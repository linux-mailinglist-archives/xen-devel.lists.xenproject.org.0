Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D23803FEA40
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 09:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177095.322307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLhVc-0007eC-NP; Thu, 02 Sep 2021 07:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177095.322307; Thu, 02 Sep 2021 07:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLhVc-0007bW-Ik; Thu, 02 Sep 2021 07:51:40 +0000
Received: by outflank-mailman (input) for mailman id 177095;
 Thu, 02 Sep 2021 07:51:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C28T=NY=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1mLhVb-0007bQ-39
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 07:51:39 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 999aa22c-0bc2-11ec-ae45-12813bfff9fa;
 Thu, 02 Sep 2021 07:51:37 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A78796736F; Thu,  2 Sep 2021 09:51:31 +0200 (CEST)
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
X-Inumbo-ID: 999aa22c-0bc2-11ec-ae45-12813bfff9fa
Date: Thu, 2 Sep 2021 09:51:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, kys@microsoft.com,
	haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
	hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	joro@8bytes.org, davem@davemloft.net, kuba@kernel.org,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	gregkh@linuxfoundation.org, arnd@arndb.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, brijesh.singh@amd.com,
	thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com,
	pgonda@google.com, martin.b.radev@gmail.com,
	akpm@linux-foundation.org, kirill.shutemov@linux.intel.com,
	rppt@kernel.org, hannes@cmpxchg.org, aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com, saravanand@fb.com,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, rientjes@google.com,
	ardb@kernel.org, michael.h.kelley@microsoft.com,
	iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
	vkuznets@redhat.com, parri.andrea@gmail.com, dave.hansen@intel.com
Subject: Re: [PATCH V4 00/13] x86/Hyper-V: Add Hyper-V Isolation VM support
Message-ID: <20210902075131.GA14986@lst.de>
References: <20210827172114.414281-1-ltykernel@gmail.com> <20210830120036.GA22005@lst.de> <91b5e997-8d44-77f0-6519-f574b541ba9f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91b5e997-8d44-77f0-6519-f574b541ba9f@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Aug 31, 2021 at 11:20:06PM +0800, Tianyu Lan wrote:
>> If so I suspect the best way to allocate them is by not using vmalloc
>> but just discontiguous pages, and then use kmap_local_pfn where the
>> PFN includes the share_gpa offset when actually copying from/to the
>> skbs.
>>
> When netvsc needs to copy packet data to send buffer, it needs to caculate 
> position with section_index and send_section_size.
> Please seee netvsc_copy_to_send_buf() detail. So the contiguous virtual 
> address of send buffer is necessary to copy data and batch packets.

Actually that makes the kmap approach much easier.  The phys_to_virt
can just be replaced with a kmap_local_pfn and the unmap needs to
be added.  I've been mostly focussing on the receive path, which
would need a similar treatment.

