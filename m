Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCE73DD5A8
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 14:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162973.298676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAX3o-0008SZ-Q4; Mon, 02 Aug 2021 12:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162973.298676; Mon, 02 Aug 2021 12:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAX3o-0008QL-N5; Mon, 02 Aug 2021 12:28:48 +0000
Received: by outflank-mailman (input) for mailman id 162973;
 Mon, 02 Aug 2021 12:28:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zvSH=MZ=8bytes.org=joro@srs-us1.protection.inumbo.net>)
 id 1mAX3m-0008QD-Hu
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 12:28:46 +0000
Received: from theia.8bytes.org (unknown [81.169.241.247])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d761722-f38d-11eb-9a43-12813bfff9fa;
 Mon, 02 Aug 2021 12:28:45 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3FDE620C; Mon,  2 Aug 2021 14:28:42 +0200 (CEST)
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
X-Inumbo-ID: 2d761722-f38d-11eb-9a43-12813bfff9fa
Date: Mon, 2 Aug 2021 14:28:36 +0200
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
Subject: Re: [PATCH 05/13] HV: Add Write/Read MSR registers via ghcb page
Message-ID: <YQfk9G+k0Tj8ihyu@8bytes.org>
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-6-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728145232.285861-6-ltykernel@gmail.com>

On Wed, Jul 28, 2021 at 10:52:20AM -0400, Tianyu Lan wrote:
> +void hv_ghcb_msr_write(u64 msr, u64 value)
> +{
> +	union hv_ghcb *hv_ghcb;
> +	void **ghcb_base;
> +	unsigned long flags;
> +
> +	if (!ms_hyperv.ghcb_base)
> +		return;
> +
> +	WARN_ON(in_nmi());
> +
> +	local_irq_save(flags);
> +	ghcb_base = (void **)this_cpu_ptr(ms_hyperv.ghcb_base);
> +	hv_ghcb = (union hv_ghcb *)*ghcb_base;
> +	if (!hv_ghcb) {
> +		local_irq_restore(flags);
> +		return;
> +	}
> +
> +	memset(hv_ghcb, 0x00, HV_HYP_PAGE_SIZE);

Do you really need to zero out the whole 4k? The validation bitmap
should be enough, there are no secrets on the page anyway.
Same in hv_ghcb_msr_read().

> +enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
> +				   struct es_em_ctxt *ctxt,
> +				   u64 exit_code, u64 exit_info_1,
> +				   u64 exit_info_2)
>  {
>  	enum es_result ret;
>  
> @@ -109,7 +109,16 @@ static enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
>  	ghcb_set_sw_exit_info_1(ghcb, exit_info_1);
>  	ghcb_set_sw_exit_info_2(ghcb, exit_info_2);
>  
> -	sev_es_wr_ghcb_msr(__pa(ghcb));
> +	/*
> +	 * Hyper-V runs paravisor with SEV. Ghcb page is allocated by
> +	 * paravisor and not needs to be updated in the Linux guest.
> +	 * Otherwise, the ghcb page's PA reported by paravisor is above
> +	 * VTOM. Hyper-V use this function with NULL for ctxt point and
> +	 * skip setting ghcb page in such case.
> +	 */
> +	if (ctxt)
> +		sev_es_wr_ghcb_msr(__pa(ghcb));

No, do not make this function work with ctxt==NULL. Instead, factor out
a helper function which contains what Hyper-V needs and use that in
sev_es_ghcb_hv_call() and Hyper-V code.

> +union hv_ghcb {
> +	struct ghcb ghcb;
> +} __packed __aligned(PAGE_SIZE);

I am curious what this will end up being good for.


