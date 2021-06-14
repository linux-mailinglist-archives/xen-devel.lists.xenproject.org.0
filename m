Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D343A5D6F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 09:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141231.260955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsgic-0008GS-J3; Mon, 14 Jun 2021 07:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141231.260955; Mon, 14 Jun 2021 07:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsgic-0008Dn-F9; Mon, 14 Jun 2021 07:09:10 +0000
Received: by outflank-mailman (input) for mailman id 141231;
 Mon, 14 Jun 2021 07:09:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aFdS=LI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lsgia-0008Dd-VC
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 07:09:08 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d6c04c5-087e-4964-8997-ea3e5ae4adff;
 Mon, 14 Jun 2021 07:09:08 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1F7FB67373; Mon, 14 Jun 2021 09:09:04 +0200 (CEST)
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
X-Inumbo-ID: 6d6c04c5-087e-4964-8997-ea3e5ae4adff
Date: Mon, 14 Jun 2021 09:09:03 +0200
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
Message-ID: <20210614070903.GA29976@lst.de>
References: <20210530150628.2063957-1-ltykernel@gmail.com> <20210530150628.2063957-11-ltykernel@gmail.com> <20210607065007.GE24478@lst.de> <279cb4bf-c5b6-6db9-0f1e-9238e902c8f2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <279cb4bf-c5b6-6db9-0f1e-9238e902c8f2@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jun 07, 2021 at 11:21:20PM +0800, Tianyu Lan wrote:
>> dma_map_single can only be used on page baked memory, and if this is
>> using page backed memory you wouldn't need to do thee phys_to_virt
>> tricks.  Can someone explain the mess here in more detail?
>
> Sorry. Could you elaborate the issue? These pages in the pb array are not 
> allocated by DMA API and using dma_map_single() here is to map these pages' 
> address to bounce buffer physical address.

dma_map_single just calls dma_map_page using virt_to_page.  So this
can't work on addresses not in the kernel linear mapping.

