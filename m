Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E13539D542
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 08:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137695.255087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq90N-0003pM-QU; Mon, 07 Jun 2021 06:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137695.255087; Mon, 07 Jun 2021 06:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq90N-0003mv-NN; Mon, 07 Jun 2021 06:44:59 +0000
Received: by outflank-mailman (input) for mailman id 137695;
 Mon, 07 Jun 2021 06:44:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZuZ8=LB=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lq90L-0003mm-Eh
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 06:44:57 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 667d5b18-68e7-4eb6-a928-9ed6ca22bfc5;
 Mon, 07 Jun 2021 06:44:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B14DA68AFE; Mon,  7 Jun 2021 08:44:53 +0200 (CEST)
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
X-Inumbo-ID: 667d5b18-68e7-4eb6-a928-9ed6ca22bfc5
Date: Mon, 7 Jun 2021 08:44:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Tianyu Lan <ltykernel@gmail.com>, kys@microsoft.com,
	haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, x86@kernel.org, hpa@zytor.com, arnd@arndb.de,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, kirill.shutemov@linux.intel.com,
	rppt@kernel.org, hannes@cmpxchg.org, cai@lca.pw,
	krish.sadhukhan@oracle.com, saravanand@fb.com,
	Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com, jgross@suse.com,
	sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
	xen-devel@lists.xenproject.org, davem@davemloft.net,
	kuba@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
	iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
	vkuznets@redhat.com, thomas.lendacky@amd.com, brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: Re: [RFC PATCH V3 09/11] HV/IOMMU: Enable swiotlb bounce buffer
 for Isolation VM
Message-ID: <20210607064453.GC24478@lst.de>
References: <20210530150628.2063957-1-ltykernel@gmail.com> <20210530150628.2063957-10-ltykernel@gmail.com> <9488c114-81ad-eb67-79c0-5ed319703d3e@oracle.com> <a023ee3f-ce85-b54f-79c3-146926bf3279@gmail.com> <d6714e8b-dcb6-798b-59a4-5bb68f789564@oracle.com> <1cdf4e6e-6499-e209-d499-7ab82992040b@gmail.com> <099f311b-9614-dac5-ce05-6dad988f8a62@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <099f311b-9614-dac5-ce05-6dad988f8a62@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Honestly, we really need to do away with the concept of hypervisor-
specific swiotlb allocations and just add a hypervisor hook to remap the
"main" buffer. That should remove a lot of code and confusion not just
for Xen but also any future addition like hyperv.

