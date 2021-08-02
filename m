Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C953DD4FC
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 13:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162948.298641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAWVm-00042r-El; Mon, 02 Aug 2021 11:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162948.298641; Mon, 02 Aug 2021 11:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAWVm-000413-Aa; Mon, 02 Aug 2021 11:53:38 +0000
Received: by outflank-mailman (input) for mailman id 162948;
 Mon, 02 Aug 2021 11:53:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zvSH=MZ=8bytes.org=joro@srs-us1.protection.inumbo.net>)
 id 1mAWVl-00040x-Ad
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 11:53:37 +0000
Received: from theia.8bytes.org (unknown
 [2a01:238:4383:600:38bc:a715:4b6d:a889])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2f4394a-b380-496a-85aa-2fe24b1d72ba;
 Mon, 02 Aug 2021 11:53:35 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 835EB379; Mon,  2 Aug 2021 13:53:32 +0200 (CEST)
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
X-Inumbo-ID: d2f4394a-b380-496a-85aa-2fe24b1d72ba
Date: Mon, 2 Aug 2021 13:53:26 +0200
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
Subject: Re: [PATCH 01/13] x86/HV: Initialize GHCB page in Isolation VM
Message-ID: <YQfctjRm16IP0qZy@8bytes.org>
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-2-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728145232.285861-2-ltykernel@gmail.com>

On Wed, Jul 28, 2021 at 10:52:16AM -0400, Tianyu Lan wrote:
> +static int hyperv_init_ghcb(void)
> +{
> +	u64 ghcb_gpa;
> +	void *ghcb_va;
> +	void **ghcb_base;
> +
> +	if (!ms_hyperv.ghcb_base)
> +		return -EINVAL;
> +
> +	rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
> +	ghcb_va = memremap(ghcb_gpa, HV_HYP_PAGE_SIZE, MEMREMAP_WB);

This deserves a comment. As I understand it, the GHCB pa is set by
Hyper-V or the paravisor, so the page does not need to be allocated by
Linux.
And it is not mapped unencrypted because the GHCB page is allocated
above the VTOM boundary?

> @@ -167,6 +190,31 @@ static int hv_cpu_die(unsigned int cpu)
>  {
>  	struct hv_reenlightenment_control re_ctrl;
>  	unsigned int new_cpu;
> +	unsigned long flags;
> +	void **input_arg;
> +	void *pg;
> +	void **ghcb_va = NULL;
> +
> +	local_irq_save(flags);
> +	input_arg = (void **)this_cpu_ptr(hyperv_pcpu_input_arg);
> +	pg = *input_arg;

Pg is never used later on, why is it set?


