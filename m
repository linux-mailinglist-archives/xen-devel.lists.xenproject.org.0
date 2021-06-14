Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A1A3A6A76
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 17:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141631.261552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsoaC-0004eP-NW; Mon, 14 Jun 2021 15:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141631.261552; Mon, 14 Jun 2021 15:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsoaC-0004bl-Iw; Mon, 14 Jun 2021 15:33:00 +0000
Received: by outflank-mailman (input) for mailman id 141631;
 Mon, 14 Jun 2021 15:32:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aFdS=LI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lsoaA-0004bV-Hb
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 15:32:58 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3303be7-2a60-4b62-bf20-b255421617d5;
 Mon, 14 Jun 2021 15:32:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2740F68AFE; Mon, 14 Jun 2021 17:32:52 +0200 (CEST)
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
X-Inumbo-ID: a3303be7-2a60-4b62-bf20-b255421617d5
Date: Mon, 14 Jun 2021 17:32:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Christoph Hellwig <hch@lst.de>, Tianyu Lan <ltykernel@gmail.com>,
	kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com, rppt@kernel.org,
	hannes@cmpxchg.org, cai@lca.pw, krish.sadhukhan@oracle.com,
	saravanand@fb.com, Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com,
	m.szyprowski@samsung.com, boris.ostrovsky@oracle.com,
	jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org,
	will@kernel.org, xen-devel@lists.xenproject.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com,
	thomas.lendacky@amd.com, brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: Re: [RFC PATCH V3 08/11] swiotlb: Add bounce buffer remap address
 setting function
Message-ID: <20210614153252.GA1741@lst.de>
References: <20210530150628.2063957-1-ltykernel@gmail.com> <20210530150628.2063957-9-ltykernel@gmail.com> <20210607064312.GB24478@lst.de> <94038087-a33c-93c5-27bf-7ec1f6f5f0e3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94038087-a33c-93c5-27bf-7ec1f6f5f0e3@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jun 14, 2021 at 02:49:51PM +0100, Robin Murphy wrote:
> FWIW, I think a better generalisation for this would be allowing 
> set_memory_decrypted() to return an address rather than implicitly 
> operating in-place, and hide all the various hypervisor hooks behind that.

Yes, something like that would be a good idea.  As-is
set_memory_decrypted is a pretty horribly API anyway due to passing
the address as void, and taking a size parameter while it works in units
of pages.  So I'd very much welcome a major overhaul of this API.

