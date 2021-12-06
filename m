Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93067469802
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:07:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239026.414274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEdy-0000mQ-Lu; Mon, 06 Dec 2021 14:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239026.414274; Mon, 06 Dec 2021 14:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEdy-0000kd-Il; Mon, 06 Dec 2021 14:07:02 +0000
Received: by outflank-mailman (input) for mailman id 239026;
 Mon, 06 Dec 2021 14:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0EtG=QX=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1muEdx-0000kX-19
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:07:01 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c720c08c-569d-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 15:06:59 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1077C68B05; Mon,  6 Dec 2021 15:06:52 +0100 (CET)
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
X-Inumbo-ID: c720c08c-569d-11ec-8a4d-196798b21f7b
Date: Mon, 6 Dec 2021 15:06:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, jgross@suse.com,
	sstabellini@kernel.org, boris.ostrovsky@oracle.com, joro@8bytes.org,
	will@kernel.org, davem@davemloft.net, kuba@kernel.org,
	jejb@linux.ibm.com, martin.petersen@oracle.com, arnd@arndb.de,
	hch@infradead.org, m.szyprowski@samsung.com, robin.murphy@arm.com,
	thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com,
	xen-devel@lists.xenproject.org, michael.h.kelley@microsoft.com,
	iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
	vkuznets@redhat.com, brijesh.singh@amd.com, konrad.wilk@oracle.com,
	hch@lst.de, parri.andrea@gmail.com, dave.hansen@intel.com
Subject: Re: [PATCH V4 2/5] x86/hyper-v: Add hyperv Isolation VM check in
 the cc_platform_has()
Message-ID: <20211206140651.GA5100@lst.de>
References: <20211205081815.129276-1-ltykernel@gmail.com> <20211205081815.129276-3-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211205081815.129276-3-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, Dec 05, 2021 at 03:18:10AM -0500, Tianyu Lan wrote:
> +static bool hyperv_cc_platform_has(enum cc_attr attr)
> +{
> +#ifdef CONFIG_HYPERV
> +	return attr == CC_ATTR_GUEST_MEM_ENCRYPT;
> +#else
> +	return false;
> +#endif
> +}

Can we even end up here without CONFIG_HYPERV?

