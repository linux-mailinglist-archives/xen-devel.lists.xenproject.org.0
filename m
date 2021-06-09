Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867C93A14E8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 14:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139330.257675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxeC-0004Y4-2c; Wed, 09 Jun 2021 12:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139330.257675; Wed, 09 Jun 2021 12:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxeB-0004VD-UT; Wed, 09 Jun 2021 12:49:27 +0000
Received: by outflank-mailman (input) for mailman id 139330;
 Wed, 09 Jun 2021 12:49:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9c7t=LD=8bytes.org=joro@srs-us1.protection.inumbo.net>)
 id 1lqxeA-0004V5-J1
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 12:49:26 +0000
Received: from theia.8bytes.org (unknown [81.169.241.247])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3dfd65d-0368-4fe3-9947-a777fb2dbfff;
 Wed, 09 Jun 2021 12:49:21 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B439236A; Wed,  9 Jun 2021 14:49:20 +0200 (CEST)
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
X-Inumbo-ID: e3dfd65d-0368-4fe3-9947-a777fb2dbfff
Date: Wed, 9 Jun 2021 14:49:19 +0200
From: Joerg Roedel <joro@8bytes.org>
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
	will@kernel.org, xen-devel@lists.xenproject.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com,
	thomas.lendacky@amd.com, brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: Re: [RFC PATCH V3 05/11] HV: Add ghcb hvcall support for SNP VM
Message-ID: <YMC4z6L0PU3+HCTD@8bytes.org>
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-6-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530150628.2063957-6-ltykernel@gmail.com>

On Sun, May 30, 2021 at 11:06:22AM -0400, Tianyu Lan wrote:
> +u64 hv_ghcb_hypercall(u64 control, void *input, void *output, u32 input_size)
> +{
> +	union hv_ghcb *hv_ghcb;
> +	void **ghcb_base;
> +	unsigned long flags;
> +
> +	if (!ms_hyperv.ghcb_base)
> +		return -EFAULT;
> +
> +	local_irq_save(flags);
> +	ghcb_base = (void **)this_cpu_ptr(ms_hyperv.ghcb_base);
> +	hv_ghcb = (union hv_ghcb *)*ghcb_base;
> +	if (!hv_ghcb) {
> +		local_irq_restore(flags);
> +		return -EFAULT;
> +	}
> +
> +	memset(hv_ghcb, 0x00, HV_HYP_PAGE_SIZE);
> +	hv_ghcb->ghcb.protocol_version = 1;
> +	hv_ghcb->ghcb.ghcb_usage = 1;
> +
> +	hv_ghcb->hypercall.outputgpa = (u64)output;
> +	hv_ghcb->hypercall.hypercallinput.asuint64 = 0;
> +	hv_ghcb->hypercall.hypercallinput.callcode = control;
> +
> +	if (input_size)
> +		memcpy(hv_ghcb->hypercall.hypercalldata, input, input_size);
> +
> +	VMGEXIT();

Also not NMI-safe. When you re-use the existing GHCB setup code from
from SEV-ES code, you can also use sev_es_get/put_ghcb() which takes
care of re-using a GHCB already in use.

Regards,

	Joerg


