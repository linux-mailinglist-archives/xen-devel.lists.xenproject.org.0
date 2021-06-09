Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0FB3A149E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 14:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139317.257650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxTf-0002QX-Ow; Wed, 09 Jun 2021 12:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139317.257650; Wed, 09 Jun 2021 12:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxTf-0002OL-Lk; Wed, 09 Jun 2021 12:38:35 +0000
Received: by outflank-mailman (input) for mailman id 139317;
 Wed, 09 Jun 2021 12:38:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9c7t=LD=8bytes.org=joro@srs-us1.protection.inumbo.net>)
 id 1lqxTd-0002OF-SU
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 12:38:33 +0000
Received: from theia.8bytes.org (unknown
 [2a01:238:4383:600:38bc:a715:4b6d:a889])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e60bb87b-ea08-4a2b-8dbe-5219760b3ea6;
 Wed, 09 Jun 2021 12:38:32 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 99A0E36A; Wed,  9 Jun 2021 14:38:30 +0200 (CEST)
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
X-Inumbo-ID: e60bb87b-ea08-4a2b-8dbe-5219760b3ea6
Date: Wed, 9 Jun 2021 14:38:29 +0200
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
Subject: Re: [RFC PATCH V3 01/11] x86/HV: Initialize GHCB page in Isolation VM
Message-ID: <YMC2RSr/J1WYCvtz@8bytes.org>
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-2-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530150628.2063957-2-ltykernel@gmail.com>

On Sun, May 30, 2021 at 11:06:18AM -0400, Tianyu Lan wrote:
> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> Hyper-V exposes GHCB page via SEV ES GHCB MSR for SNP guest
> to communicate with hypervisor. Map GHCB page for all
> cpus to read/write MSR register and submit hvcall request
> via GHCB.
> 
> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
> ---
>  arch/x86/hyperv/hv_init.c       | 60 ++++++++++++++++++++++++++++++---
>  arch/x86/include/asm/mshyperv.h |  2 ++
>  include/asm-generic/mshyperv.h  |  2 ++
>  3 files changed, 60 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
> index bb0ae4b5c00f..dc74d01cb859 100644
> --- a/arch/x86/hyperv/hv_init.c
> +++ b/arch/x86/hyperv/hv_init.c
> @@ -60,6 +60,9 @@ static int hv_cpu_init(unsigned int cpu)
>  	struct hv_vp_assist_page **hvp = &hv_vp_assist_page[smp_processor_id()];
>  	void **input_arg;
>  	struct page *pg;
> +	u64 ghcb_gpa;
> +	void *ghcb_va;
> +	void **ghcb_base;

Any reason you can't reuse the SEV-ES support code in the Linux kernel?
It already has code to setup GHCBs for all vCPUs.

I see that you don't need #VC handling in your SNP VMs because of the
paravisor running underneath it, but just re-using the GHCB setup code
shouldn't be too hard.

Regards,

	Joerg

