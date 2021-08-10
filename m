Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 093343E58D5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 13:04:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165327.302143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDPYC-0008JV-Sp; Tue, 10 Aug 2021 11:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165327.302143; Tue, 10 Aug 2021 11:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDPYC-0008HH-Pb; Tue, 10 Aug 2021 11:04:04 +0000
Received: by outflank-mailman (input) for mailman id 165327;
 Tue, 10 Aug 2021 11:04:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GuK=NB=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1mDPYB-0008HB-T1
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 11:04:03 +0000
Received: from mail-wm1-f54.google.com (unknown [209.85.128.54])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb83ce78-9f3d-4a1a-9df6-31e066c2a5fa;
 Tue, 10 Aug 2021 11:04:02 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id g138so922446wmg.4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Aug 2021 04:04:02 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q3sm3504575wmf.37.2021.08.10.04.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 04:04:01 -0700 (PDT)
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
X-Inumbo-ID: eb83ce78-9f3d-4a1a-9df6-31e066c2a5fa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h9AyImD9UvKdyZgMt8rSQ3Uk0c9+Og7qG6N7oOE6PXA=;
        b=QdNPIu3d9DITHnflhEkY8NcjD/Qra5Jp903/eNvaWpsKC9sVYguI22hR7A/pLOiYpc
         mAMqhuaX8z5M3iax1O+Q9iKqxYvtF+DzoBj9NTkUyPvEZ/odDHHSHmZ1m+eddEZsEuX2
         SqXGDCCTzN6uSmUjRnU1hjLySiEKRK9cIec92cVX2IVU7kz2M0Q7S3Md2hxVWaVaaRI8
         fedJy/LuLtZ/37XO59UNOabOzGdJeXiIvY/VH68jhDLc1jVdL6gIOZKiOhUjwUV4Qzk6
         dCP9z7DPEm0Ea70WGlR/4xty6Jmj4E6xLYdpsPuK1nFbQrvajJmeVua4qHbMj6X0PRuy
         x57Q==
X-Gm-Message-State: AOAM5319AR6WPr63tOaJy74bf+V56AZls86E9Y9LsNt88bjolZEuzFZ6
	azawqy2xpbsDM5Vi1p/C7dk=
X-Google-Smtp-Source: ABdhPJyrk1wBfHB9MekkHvpHW9x6fYmFebxaC/tx0zZS+XISdOGMjx9hLm+CPvA9MFZ9+dQ3n/YQhA==
X-Received: by 2002:a05:600c:3798:: with SMTP id o24mr4061437wmr.18.1628593441621;
        Tue, 10 Aug 2021 04:04:01 -0700 (PDT)
Date: Tue, 10 Aug 2021 11:03:59 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	thomas.lendacky@amd.com, brijesh.singh@amd.com, ardb@kernel.org,
	Tianyu.Lan@microsoft.com, pgonda@google.com,
	martin.b.radev@gmail.com, akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com, rppt@kernel.org,
	sfr@canb.auug.org.au, saravanand@fb.com, krish.sadhukhan@oracle.com,
	aneesh.kumar@linux.ibm.com, xen-devel@lists.xenproject.org,
	rientjes@google.com, hannes@cmpxchg.org, tj@kernel.org,
	michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com, parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: Re: [PATCH V3 03/13] x86/HV: Add new hvcall guest address host
 visibility support
Message-ID: <20210810110359.i4qodw7h36zrsicp@liuwe-devbox-debian-v2>
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-4-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809175620.720923-4-ltykernel@gmail.com>

On Mon, Aug 09, 2021 at 01:56:07PM -0400, Tianyu Lan wrote:
> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> Add new hvcall guest address host visibility support to mark
> memory visible to host. Call it inside set_memory_decrypted
> /encrypted(). Add HYPERVISOR feature check in the
> hv_is_isolation_supported() to optimize in non-virtualization
> environment.
> 
> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
> ---
> Change since v2:
>        * Rework __set_memory_enc_dec() and call Hyper-V and AMD function
>          according to platform check.
> 
> Change since v1:
>        * Use new staic call x86_set_memory_enc to avoid add Hyper-V
>          specific check in the set_memory code.
> ---
>  arch/x86/hyperv/Makefile           |   2 +-
>  arch/x86/hyperv/hv_init.c          |   6 ++
>  arch/x86/hyperv/ivm.c              | 114 +++++++++++++++++++++++++++++
>  arch/x86/include/asm/hyperv-tlfs.h |  20 +++++
>  arch/x86/include/asm/mshyperv.h    |   4 +-
>  arch/x86/mm/pat/set_memory.c       |  19 +++--
>  include/asm-generic/hyperv-tlfs.h  |   1 +
>  include/asm-generic/mshyperv.h     |   1 +
>  8 files changed, 160 insertions(+), 7 deletions(-)
>  create mode 100644 arch/x86/hyperv/ivm.c
> 
> diff --git a/arch/x86/hyperv/Makefile b/arch/x86/hyperv/Makefile
> index 48e2c51464e8..5d2de10809ae 100644
> --- a/arch/x86/hyperv/Makefile
> +++ b/arch/x86/hyperv/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-y			:= hv_init.o mmu.o nested.o irqdomain.o
> +obj-y			:= hv_init.o mmu.o nested.o irqdomain.o ivm.o
>  obj-$(CONFIG_X86_64)	+= hv_apic.o hv_proc.o
>  
>  ifdef CONFIG_X86_64
> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
> index 0bb4d9ca7a55..b3683083208a 100644
> --- a/arch/x86/hyperv/hv_init.c
> +++ b/arch/x86/hyperv/hv_init.c
> @@ -607,6 +607,12 @@ EXPORT_SYMBOL_GPL(hv_get_isolation_type);
>  
>  bool hv_is_isolation_supported(void)
>  {
> +	if (!cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
> +		return 0;

Nit: false instead of 0.

> +
> +	if (!hypervisor_is_type(X86_HYPER_MS_HYPERV))
> +		return 0;
> +
>  	return hv_get_isolation_type() != HV_ISOLATION_TYPE_NONE;
>  }
>  
[...]
> +int hv_mark_gpa_visibility(u16 count, const u64 pfn[],
> +			   enum hv_mem_host_visibility visibility)
> +{
> +	struct hv_gpa_range_for_visibility **input_pcpu, *input;
> +	u16 pages_processed;
> +	u64 hv_status;
> +	unsigned long flags;
> +
> +	/* no-op if partition isolation is not enabled */
> +	if (!hv_is_isolation_supported())
> +		return 0;
> +
> +	if (count > HV_MAX_MODIFY_GPA_REP_COUNT) {
> +		pr_err("Hyper-V: GPA count:%d exceeds supported:%lu\n", count,
> +			HV_MAX_MODIFY_GPA_REP_COUNT);
> +		return -EINVAL;
> +	}
> +
> +	local_irq_save(flags);
> +	input_pcpu = (struct hv_gpa_range_for_visibility **)
> +			this_cpu_ptr(hyperv_pcpu_input_arg);
> +	input = *input_pcpu;
> +	if (unlikely(!input)) {
> +		local_irq_restore(flags);
> +		return -EINVAL;
> +	}
> +
> +	input->partition_id = HV_PARTITION_ID_SELF;
> +	input->host_visibility = visibility;
> +	input->reserved0 = 0;
> +	input->reserved1 = 0;
> +	memcpy((void *)input->gpa_page_list, pfn, count * sizeof(*pfn));
> +	hv_status = hv_do_rep_hypercall(
> +			HVCALL_MODIFY_SPARSE_GPA_PAGE_HOST_VISIBILITY, count,
> +			0, input, &pages_processed);
> +	local_irq_restore(flags);
> +
> +	if (!(hv_status & HV_HYPERCALL_RESULT_MASK))
> +		return 0;
> +
> +	return hv_status & HV_HYPERCALL_RESULT_MASK;

Joseph introduced a few helper functions in 753ed9c95c37d. They will
make the code simpler.

Wei.

