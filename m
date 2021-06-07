Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB439D54F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 08:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137702.255099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq91T-0004Qv-5x; Mon, 07 Jun 2021 06:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137702.255099; Mon, 07 Jun 2021 06:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq91T-0004OH-1m; Mon, 07 Jun 2021 06:46:07 +0000
Received: by outflank-mailman (input) for mailman id 137702;
 Mon, 07 Jun 2021 06:46:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZuZ8=LB=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lq91S-0004O3-0P
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 06:46:06 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 286305df-f0c1-405a-a4c8-dbe8279bcae8;
 Mon, 07 Jun 2021 06:46:04 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 619F368AFE; Mon,  7 Jun 2021 08:46:03 +0200 (CEST)
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
X-Inumbo-ID: 286305df-f0c1-405a-a4c8-dbe8279bcae8
Date: Mon, 7 Jun 2021 08:46:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com, rppt@kernel.org,
	hannes@cmpxchg.org, cai@lca.pw, krish.sadhukhan@oracle.com,
	saravanand@fb.com, Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com,
	hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	joro@8bytes.org, will@kernel.org, xen-devel@lists.xenproject.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com,
	thomas.lendacky@amd.com, brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: Re: [RFC PATCH V3 11/11] HV/Storvsc: Add Isolation VM support for
 storvsc driver
Message-ID: <20210607064603.GD24478@lst.de>
References: <20210530150628.2063957-1-ltykernel@gmail.com> <20210530150628.2063957-12-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530150628.2063957-12-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, May 30, 2021 at 11:06:28AM -0400, Tianyu Lan wrote:
> +				for (i = 0; i < request->hvpg_count; i++)
> +					dma_unmap_page(&device->device,
> +							request->dma_range[i].dma,
> +							request->dma_range[i].mapping_size,
> +							request->vstor_packet.vm_srb.data_in
> +							     == READ_TYPE ?
> +							DMA_FROM_DEVICE : DMA_TO_DEVICE);
> +				kfree(request->dma_range);

Unreadably long lines.  You probably want to factor the quoted code into
a little readable helper and do the same for the map side.

