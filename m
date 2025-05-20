Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED9BABD9A6
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 15:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990730.1374659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNA6-0003zz-MD; Tue, 20 May 2025 13:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990730.1374659; Tue, 20 May 2025 13:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNA6-0003wr-Hm; Tue, 20 May 2025 13:37:42 +0000
Received: by outflank-mailman (input) for mailman id 990730;
 Tue, 20 May 2025 13:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHNA4-0003wl-Ki
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 13:37:40 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97939fb2-357f-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 15:37:37 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6020ff8d35dso1310784a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 06:37:37 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-602047c4b73sm1360089a12.10.2025.05.20.06.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 06:37:35 -0700 (PDT)
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
X-Inumbo-ID: 97939fb2-357f-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747748256; x=1748353056; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7R6D/GxI7OgZG5KDS3ZKKACfjTPFPi0ygsszjLevS3c=;
        b=EEKERmizVW4My/XBX6kFMNCBVldyCZhGwIX0TZHGMmqpiqzKdjqsRGLxD/nWBrOoO0
         2LPxDxkAMsRgsWT75O6y1b8e9HJugqgjoj4XyW9IMK0NezmFASa4iS+8bA+gkkgIIskM
         sO5jUGwCgw3Iu9QUMdu1Gja5t38RjH6A3O7dfY4SuaGfx404o3m0qYkF0gVuOR/PWpjd
         ZP6R89o8mfRcRVgCq66tVKS/Y9RnlYqi69CTqtRdsjMlJL1H3JWlXdsGjwSkhRv0fILo
         y6gGF+UA3ZexUM/mbYMbuodWCUXBNY4SHH3etTvzUX3aPZB1gFQaW6wSwGgOAJkADdrM
         Ri6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748256; x=1748353056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7R6D/GxI7OgZG5KDS3ZKKACfjTPFPi0ygsszjLevS3c=;
        b=glvRsHmyB36AQtxPvkWku57pGFnjYGhOnG5vtAtHNjmaEQqtlXYs4kqfZvug8ztAWO
         QpDfFftHvVN5rfSZbWQnfc15QNkK9zrkDTg6FqsoPzmW8nHVfOXxlemYBJ49WTvWnMsq
         1LNRbLVo5lx0FjytmpofYojkapxv4Qhj9gh4AAXGjFL8/hwNUP+w0FP2UQ+GGnTszNg4
         SOEOwI3u28k+Zgzz+O03CYN9Z2C+MFldqJKnDw3yE/5EgTuAlCl3PlbF0v5vJ2S8X5MJ
         mVK7zkNvjyY32+w6G3BZuF6ESgeWFsSK+mYnGAtQ8Sv7YoQ9aj/MclI/jZ5Es/Vvis7e
         c3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqgqLrx8wxgVpPIZDuHx4+yABGQcDdvMLRdD6yD+BEfkkiRf34uUg2RI/th8sm7MQLmgxmXjGhdTQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxsqe0DLA84lRGK6Y1h401hCx7co0g0DXPvaLRfDtMqZt0p3e2Z
	KJeUMKXxTyq/sT8PPGV/mp9Qb0Vq2WYeqU8D3WA+XSIFlJ5W0Cou+uvJCjuSjMiNlg==
X-Gm-Gg: ASbGncugrcZOSdz4uYlfRyOd7zN0gbTwVfbbS5H+WNeB6GNfKcZaabVH4gPnw+exiWr
	K3qkgZf9wfihe3HQY6mOXji8MowzFT9YFqG6jqPTrAYlXBzL9r+oEKliHinZZzfRF0QTHL8EBrD
	m8sjQ4d+AoqOIevuM4yFRis4xo9/66ZvjT6ku7gh7UFgzjrHdpGEXrIrqTeOBXLMgaUCJiHLSHn
	PHBYaeoul8AgchnvSV9mXPlg8x3XuEnOt1hnto+AZlzTs/Y/zQ7FgewLBCyyf9S+2/VgVcc6ThE
	Ptgb+N6kGJNq4LfAVnU7pByOwMoMRAbPb90INWUhqQgwA/Rx6BQhBbL2DxW4v4AH2nNNxgaM
X-Google-Smtp-Source: AGHT+IH871cDPbu2SMCyKdMIJJT+HlgRMOKMoiK64oZ6ngNPe2RrN8CeLB4Mie3wNOuW6H0gAGXBFw==
X-Received: by 2002:a05:6402:4401:b0:5f4:8c80:77d with SMTP id 4fb4d7f45d1cf-6008a5a115emr14669156a12.6.1747748256344;
        Tue, 20 May 2025 06:37:36 -0700 (PDT)
Message-ID: <7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com>
Date: Tue, 20 May 2025 15:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: introduce things necessary for p2m
 initialization
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <0a03d1f38649cfd8656147f209652dff0f9d170c.1746805907.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0a03d1f38649cfd8656147f209652dff0f9d170c.1746805907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -5,6 +5,8 @@
>  #include <xen/xmalloc.h>
>  #include <public/hvm/params.h>
>  
> +#include <asm/p2m.h>
> +
>  struct hvm_domain
>  {
>      uint64_t              params[HVM_NR_PARAMS];
> @@ -16,8 +18,12 @@ struct arch_vcpu_io {
>  struct arch_vcpu {
>  };
>  
> +

Nit: As before, no double blank lines please.

>  struct arch_domain {
>      struct hvm_domain hvm;
> +
> +    struct p2m_domain p2m;
> +
>  };

Similarly, no blank lines please at the end of a struct/union/enum.

> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -149,6 +149,10 @@ extern struct page_info *frametable_virt_start;
>  #define mfn_to_page(mfn)    (frametable_virt_start + mfn_x(mfn))
>  #define page_to_mfn(pg)     _mfn((pg) - frametable_virt_start)
>  
> +/* Convert between machine addresses and page-info structures. */
> +#define maddr_to_page(ma) mfn_to_page(maddr_to_mfn(ma))
> +#define page_to_maddr(pg) (mfn_to_maddr(page_to_mfn(pg)))

Nit: The outermost parentheses aren't really needed here. Or if you really
want them, then please be consistent and also add them for the other macro
you add.

> --- /dev/null
> +++ b/xen/arch/riscv/p2m.c
> @@ -0,0 +1,168 @@
> +#include <xen/domain_page.h>
> +#include <xen/iommu.h>
> +#include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/pfn.h>
> +#include <xen/rwlock.h>
> +#include <xen/sched.h>
> +#include <xen/spinlock.h>
> +
> +#include <asm/page.h>
> +#include <asm/p2m.h>
> +
> +/*
> + * Force a synchronous P2M TLB flush.
> + *
> + * Must be called with the p2m lock held.
> + *
> + * TODO: add support of flushing TLB connected to VMID.
> + */
> +static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
> +{
> +    ASSERT(p2m_is_write_locked(p2m));
> +
> +    /*
> +     * TODO: shouldn't be this flush done for each physical CPU?
> +     *       If yes, then SBI call sbi_remote_hfence_gvma() could
> +     *       be used for that.
> +     */
> +#if defined(__riscv_hh) || defined(__riscv_h)

This is a compiler capability check (which would be applicable if you
used a built-in function below).

> +    asm volatile ( "hfence.gvma" ::: "memory" );

Whereas here you use a feature in the assembler, at least for the GNU
toolchain.

> +static void clear_and_clean_page(struct page_info *page)
> +{
> +    void *p = __map_domain_page(page);
> +
> +    clear_page(p);
> +    unmap_domain_page(p);
> +}

What's the "clean" about in the function name? The "clear" is referring
to the clear_page() call afaict. Also aren't you largely open-coding
clear_domain_page() here?

> +static struct page_info *p2m_get_clean_page(struct domain *d)
> +{
> +    struct page_info *page;
> +
> +    /*
> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
> +     * As explained in Section 18.5.1, for the paged virtual-memory schemes
> +     * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
> +     * and must be aligned to a 16-KiB boundary.
> +     */
> +    page = alloc_domheap_pages(NULL, 2, 0);

Shouldn't this allocation come from the domain's P2M pool (which is yet
to be introduced)? Also hard-coding 2 here as order effectively builds
in an assumption that PAGE_SIZE will only ever be 4k. I think to wants
properly calculating instead.

> +    if ( page == NULL )
> +        return NULL;
> +
> +    clear_and_clean_page(page);
> +
> +    return page;
> +}

Contrary to the function name you obtained 4 pages here, which is suitable
for ...

> +static struct page_info *p2m_allocate_root(struct domain *d)
> +{
> +    return p2m_get_clean_page(d);
> +}

... this but - I expect - no anywhere else.

> +static unsigned long hgatp_from_page_info(struct page_info *page_info)

Except for the struct name please drop _info; we don#t use such anywhere
else.

> +{
> +    unsigned long ppn;
> +    unsigned long hgatp_mode;
> +
> +    ppn = PFN_DOWN(page_to_maddr(page_info)) & HGATP_PPN;
> +
> +    /* ASID (VMID) not supported yet */
> +
> +#if RV_STAGE1_MODE == SATP_MODE_SV39
> +    hgatp_mode = HGATP_MODE_SV39X4;
> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
> +    hgatp_mode = HGATP_MODE_SV48X4;
> +#else
> +    #error "add HGATP_MODE"

As before, please have the # of pre-processor directives in the first column.

> +#endif
> +
> +    return ppn | (hgatp_mode << HGATP_MODE_SHIFT);

Use MASK_INSR()?

> +}
> +
> +static int p2m_alloc_table(struct domain *d)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +    p2m->root = p2m_allocate_root(d);
> +    if ( !p2m->root )
> +        return -ENOMEM;
> +
> +    p2m->hgatp = hgatp_from_page_info(p2m->root);
> +
> +    /*
> +     * Make sure that all TLBs corresponding to the new VMID are flushed
> +     * before using it.
> +     */
> +    p2m_write_lock(p2m);
> +    p2m_force_tlb_flush_sync(p2m);
> +    p2m_write_unlock(p2m);

While Andrew directed you towards a better model in general, it won't be
usable here then, as the guest didn't run on any pCPU(s) yet. Imo you
want to do a single global flush e.g. when VMIDs wrap around. That'll be
fewer global flushes than one per VM creation.

> +int p2m_init(struct domain *d)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    int rc;
> +
> +    rwlock_init(&p2m->lock);
> +    INIT_PAGE_LIST_HEAD(&p2m->pages);
> +
> +    p2m->max_mapped_gfn = _gfn(0);
> +    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);

You don't ever read these two fields. Likely better to introduce them when
they're actually needed. Same possibly for further things done in this
function.

> +    p2m->default_access = p2m_access_rwx;
> +
> +    radix_tree_init(&p2m->p2m_type);
> +
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +    /*
> +     * Some IOMMUs don't support coherent PT walk. When the p2m is
> +     * shared with the CPU, Xen has to make sure that the PT changes have
> +     * reached the memory
> +     */
> +    p2m->clean_pte = is_iommu_enabled(d) &&
> +        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
> +#else
> +    p2m->clean_pte = true;

When there's no IOMMU (in use), doesn't this want to be "false"?

> +#endif
> +
> +    /*
> +     * "Trivial" initialisation is now complete.  Set the backpointer so
> +     * p2m_teardown() and friends know to do something.
> +     */
> +    p2m->domain = d;

And where is that p2m_teardown(), to cross-check the comment against?

Jan

