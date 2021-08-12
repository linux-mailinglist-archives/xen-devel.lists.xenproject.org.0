Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE423EA4AB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 14:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166307.303681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE9oH-0005R5-Gt; Thu, 12 Aug 2021 12:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166307.303681; Thu, 12 Aug 2021 12:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE9oH-0005Ni-D8; Thu, 12 Aug 2021 12:27:45 +0000
Received: by outflank-mailman (input) for mailman id 166307;
 Thu, 12 Aug 2021 12:27:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T2cV=ND=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1mE9oF-0005Nc-T4
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 12:27:43 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0e5bdaa-fb68-11eb-a17e-12813bfff9fa;
 Thu, 12 Aug 2021 12:27:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9A64768B05; Thu, 12 Aug 2021 14:27:41 +0200 (CEST)
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
X-Inumbo-ID: b0e5bdaa-fb68-11eb-a17e-12813bfff9fa
Date: Thu, 12 Aug 2021 14:27:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	thomas.lendacky@amd.com, brijesh.singh@amd.com, ardb@kernel.org,
	Tianyu.Lan@microsoft.com, pgonda@google.com,
	martin.b.radev@gmail.com, akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com, rppt@kernel.org,
	sfr@canb.auug.org.au, saravanand@fb.com, krish.sadhukhan@oracle.com,
	aneesh.kumar@linux.ibm.com, xen-devel@lists.xenproject.org,
	rientjes@google.com, hannes@cmpxchg.org, tj@kernel.org,
	michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com, parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: Re: [PATCH V3 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap
 function for HV IVM
Message-ID: <20210812122741.GC19050@lst.de>
References: <20210809175620.720923-1-ltykernel@gmail.com> <20210809175620.720923-11-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809175620.720923-11-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

This is still broken.  You need to make sure the actual DMA allocations
do have struct page backing.

