Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC633A5D7F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 09:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141237.260967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsglq-0001Hn-3x; Mon, 14 Jun 2021 07:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141237.260967; Mon, 14 Jun 2021 07:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsglp-0001EY-Vk; Mon, 14 Jun 2021 07:12:29 +0000
Received: by outflank-mailman (input) for mailman id 141237;
 Mon, 14 Jun 2021 07:12:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aFdS=LI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lsglo-0001EO-HG
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 07:12:28 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5ce7fb8-1947-45de-85c0-4b9025f5b1cc;
 Mon, 14 Jun 2021 07:12:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 537CA67373; Mon, 14 Jun 2021 09:12:23 +0200 (CEST)
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
X-Inumbo-ID: f5ce7fb8-1947-45de-85c0-4b9025f5b1cc
Date: Mon, 14 Jun 2021 09:12:23 +0200
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
Subject: Re: [RFC PATCH V3 08/11] swiotlb: Add bounce buffer remap address
 setting function
Message-ID: <20210614071223.GA30171@lst.de>
References: <20210530150628.2063957-1-ltykernel@gmail.com> <20210530150628.2063957-9-ltykernel@gmail.com> <20210607064312.GB24478@lst.de> <48516ce3-564c-419e-b355-0ce53794dcb1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48516ce3-564c-419e-b355-0ce53794dcb1@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jun 07, 2021 at 10:56:47PM +0800, Tianyu Lan wrote:
> These addresses in extra address space works as system memory mirror. The 
> shared memory with host in Isolation VM needs to be accessed via extra 
> address space which is above shared gpa boundary.

Why?

