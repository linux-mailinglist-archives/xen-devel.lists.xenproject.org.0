Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30683A6865
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141526.261393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmyh-0004P2-9a; Mon, 14 Jun 2021 13:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141526.261393; Mon, 14 Jun 2021 13:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmyh-0004Mw-60; Mon, 14 Jun 2021 13:50:11 +0000
Received: by outflank-mailman (input) for mailman id 141526;
 Mon, 14 Jun 2021 13:50:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DfkY=LI=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1lsmyf-00041e-PD
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:50:09 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c607a8f9-1d77-4ce7-8aed-6cfbb2e81a63;
 Mon, 14 Jun 2021 13:50:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 294C36D;
 Mon, 14 Jun 2021 06:50:04 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A2A83F70D;
 Mon, 14 Jun 2021 06:49:57 -0700 (PDT)
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
X-Inumbo-ID: c607a8f9-1d77-4ce7-8aed-6cfbb2e81a63
Subject: Re: [RFC PATCH V3 08/11] swiotlb: Add bounce buffer remap address
 setting function
To: Christoph Hellwig <hch@lst.de>, Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 cai@lca.pw, krish.sadhukhan@oracle.com, saravanand@fb.com,
 Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, m.szyprowski@samsung.com,
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 joro@8bytes.org, will@kernel.org, xen-devel@lists.xenproject.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, iommu@lists.linux-foundation.org,
 linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, sunilmut@microsoft.com
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-9-ltykernel@gmail.com>
 <20210607064312.GB24478@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <94038087-a33c-93c5-27bf-7ec1f6f5f0e3@arm.com>
Date: Mon, 14 Jun 2021 14:49:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607064312.GB24478@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2021-06-07 07:43, Christoph Hellwig wrote:
> On Sun, May 30, 2021 at 11:06:25AM -0400, Tianyu Lan wrote:
>> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
>>
>> For Hyper-V isolation VM with AMD SEV SNP, the bounce buffer(shared memory)
>> needs to be accessed via extra address space(e.g address above bit39).
>> Hyper-V code may remap extra address space outside of swiotlb. swiotlb_
>> bounce() needs to use remap virtual address to copy data from/to bounce
>> buffer. Add new interface swiotlb_set_bounce_remap() to do that.
> 
> Why can't you use the bus_dma_region ranges to remap to your preferred
> address?

FWIW, I think a better generalisation for this would be allowing 
set_memory_decrypted() to return an address rather than implicitly 
operating in-place, and hide all the various hypervisor hooks behind that.

Robin.

