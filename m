Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC0F3DD64B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 15:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163014.298736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXXn-0005Xa-Cu; Mon, 02 Aug 2021 12:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163014.298736; Mon, 02 Aug 2021 12:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXXn-0005Vj-9t; Mon, 02 Aug 2021 12:59:47 +0000
Received: by outflank-mailman (input) for mailman id 163014;
 Mon, 02 Aug 2021 12:59:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zvSH=MZ=8bytes.org=joro@srs-us1.protection.inumbo.net>)
 id 1mAXXl-0005VX-WC
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 12:59:46 +0000
Received: from theia.8bytes.org (unknown
 [2a01:238:4383:600:38bc:a715:4b6d:a889])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d912e66-bf16-4365-92e1-89c50c57805c;
 Mon, 02 Aug 2021 12:59:45 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D9F01379; Mon,  2 Aug 2021 14:59:43 +0200 (CEST)
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
X-Inumbo-ID: 7d912e66-bf16-4365-92e1-89c50c57805c
Date: Mon, 2 Aug 2021 14:59:42 +0200
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
Subject: Re: [PATCH 04/13] HV: Mark vmbus ring buffer visible to host in
 Isolation VM
Message-ID: <YQfsPv1WC7dnHGDu@8bytes.org>
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-5-ltykernel@gmail.com>
 <YQfgH04t2SqacnHn@8bytes.org>
 <173823d1-280c-d34e-be2c-157b55bb6bc3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173823d1-280c-d34e-be2c-157b55bb6bc3@gmail.com>

On Mon, Aug 02, 2021 at 08:56:29PM +0800, Tianyu Lan wrote:
> Both second and third are HV_GPADL_RING type. One is send ring and the
> other is receive ring. The driver keeps the order to allocate rx and
> tx buffer. You are right this is not robust and will add a mutex to keep
> the order.

Or you introduce fixed indexes for the RX and TX buffers?

