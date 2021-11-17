Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E2345448E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 11:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226699.391836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHlD-0006jD-Ub; Wed, 17 Nov 2021 10:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226699.391836; Wed, 17 Nov 2021 10:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHlD-0006gu-R2; Wed, 17 Nov 2021 10:01:47 +0000
Received: by outflank-mailman (input) for mailman id 226699;
 Wed, 17 Nov 2021 10:01:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BnEr=QE=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1mnHlC-0006gj-Fs
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 10:01:46 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f2e9876-478d-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 11:01:45 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C89DA68B05; Wed, 17 Nov 2021 11:01:42 +0100 (CET)
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
X-Inumbo-ID: 5f2e9876-478d-11ec-a9d2-d9f7a1cc8784
Date: Wed, 17 Nov 2021 11:01:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
	hpa@zytor.com, jgross@suse.com, sstabellini@kernel.org,
	boris.ostrovsky@oracle.com, kys@microsoft.com,
	haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, joro@8bytes.org, will@kernel.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, xen-devel@lists.xenproject.org,
	michael.h.kelley@microsoft.com,
	Tianyu Lan <Tianyu.Lan@microsoft.com>,
	iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com, brijesh.singh@amd.com,
	konrad.wilk@oracle.com, parri.andrea@gmail.com,
	thomas.lendacky@amd.com, dave.hansen@intel.com
Subject: Re: [PATCH 3/5] hyperv/IOMMU: Enable swiotlb bounce buffer for
 Isolation VM
Message-ID: <20211117100142.GB10330@lst.de>
References: <20211116153923.196763-1-ltykernel@gmail.com> <20211116153923.196763-4-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116153923.196763-4-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

This doesn't really have much to do with normal DMA mapping,
so why does this direct through the dma ops?

