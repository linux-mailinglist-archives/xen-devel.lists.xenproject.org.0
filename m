Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D62BADF22B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 18:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019311.1396131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRvL0-0000yw-8t; Wed, 18 Jun 2025 16:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019311.1396131; Wed, 18 Jun 2025 16:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRvL0-0000wc-5p; Wed, 18 Jun 2025 16:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1019311;
 Wed, 18 Jun 2025 16:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRvKz-0000wW-7U
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 16:08:33 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7572fa11-4c5e-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 18:08:23 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso5375932f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 09:08:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900d2351sm11187078b3a.162.2025.06.18.09.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 09:08:21 -0700 (PDT)
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
X-Inumbo-ID: 7572fa11-4c5e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750262902; x=1750867702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=has3YaGAUMCsALXIyrZHB9whbEV+eQu2rDdP/VC4DVo=;
        b=MJy7iUdy12/CxZDorTroOrK6bpOEpRczJ6QUk1lawTKsnw6Zph4OLyBDaxI0AggtTq
         /GHxDxPw2ZtfC+DBacQF3JAlQ0+SWVBMRo1yarKIAgu9QPLqLeNeKo0R0yUQKdHGF8sc
         zc9NxnxETD7VfXTMlErjGT5+66ru6hD5SqhPgUuVkYI73OQPEsw8t1rmq0STJgDPc+Fy
         bgZk/xXbnapI8SOjnzIa28WhLSi+YbwqFzm4MYtgvWqxxwsKaTaCG+ZubIdbCQFT7dhv
         I4mfD70vfd63CQgQSK+MDfBTs3ChtHlJN6PsEngegyVu2zCYeMhYaK8yJuxhEEuwEAFq
         DuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750262902; x=1750867702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=has3YaGAUMCsALXIyrZHB9whbEV+eQu2rDdP/VC4DVo=;
        b=HBGOrBUtRCylANuviacuPUyBmevdNXSNXkxymI9t6T/utzkOplfHLgBZqqzGQF96wX
         55vcTTjKvM0vaV9UEpnoW/Djlo9PsR/taINTwUdzgI1w8o48LvNJgKffRyMB/mVzWgG7
         6grv7YpYAPzk4FmkLepA/T+UM1jw8DrPCRq2l4dK6LT4bSmh8S3byZlcXPmfnKMyMK3H
         Pwch5Y1FkzwE0cDRjWff7iCsHv18jl1+Rl1wHk7L/45hMKAUfH5MGMKQicSGDKTtlHCF
         g1oSPHDP4ZQ5X/5ieNA244cfYHCpqHWH3YAJZqtp5EJCNPW7q71IAPVugxGPqOUnoKYx
         KS2A==
X-Forwarded-Encrypted: i=1; AJvYcCWwWoarmt60H2CZUgTmeCgVzmu3S5Qgb2D8Mbecz5ke+ChnlYd8iXLFfVLmok1pfOJ39dy/Nh4+XVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvxpfevR30QuShZSn0Rh1QdaVXhOBMwIRTeblTeDypya0rXLo1
	9aqVQA+SQ9KTmJCi7hGM+OMUFDdBsrNqyWABblzsL1afoM6Gmp/siaDaJCQv5cHwBQ==
X-Gm-Gg: ASbGnctTpsOjhr5KUiqu5XkAyD+PeKejn7mJqJ8OT3CrKnWLblS3laTnOqGR/n54U5u
	FE1yMoWDoddtFS6UdBJDW3LXNqUJlBGvGs3aAyCfK+5ZzVhPtw/T8UTO2zGRdv0eX39NmPNMg27
	b6vAQ168QFCRHxTisqmvkU4kAw7H8dauZtWxvOpuS1PbYEhNDxjOk8WWF6t0Ezyt1/ecrvNlfPh
	6QV+JaqAjsmQRKg0W1CSozlTIXp3NNXp7IDOfVEFiX1O/UJkFO7T4ca0eAS/QFiRLTlTNUiyzzf
	Re3xL7Xe4ztwLeYUh3U4MT8wAh/ZgcUBrUFS3zNqf/TzwNWO9bmE1J0h8s6rF1qcHXC/N+wkSBd
	inEdpWaKwW9zYBI0yHLJOOzVXpy5DB96LhQVlnQENY2z5dB0=
X-Google-Smtp-Source: AGHT+IHywG1KS1RsyNxqIAzMTl+oJ6gl6v8FFNdwpVMDcaMYqi730rUEUF0nqVTPVIJjSYp6Pp80wg==
X-Received: by 2002:a05:6000:2504:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a572371e88mr15553428f8f.21.1750262902397;
        Wed, 18 Jun 2025 09:08:22 -0700 (PDT)
Message-ID: <5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com>
Date: Wed, 18 Jun 2025 18:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/17] xen/riscv: introduce things necessary for p2m
 initialization
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <443cb3566a60dcb5d5440c72410ff6d76a010a58.1749555949.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <443cb3566a60dcb5d5440c72410ff6d76a010a58.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> Introduce the following things:
> - Update p2m_domain structure, which describe per p2m-table state, with:
>   - lock to protect updates to p2m.
>   - pool with pages used to construct p2m.
>   - clean_pte which indicate if it is requires to clean the cache when
>     writing an entry.
>   - radix tree to store p2m type as PTE doesn't have enough free bits to
>     store type.
>   - default_access to store p2m access type for each page in the domain.
>   - back pointer to domain structure.
> - p2m_init() to initalize members introduced in p2m_domain structure.
> - Introudce p2m_write_lock() and p2m_is_write_locked().

What about the reader variant? If you don't need that, why not use a simple
spin lock?

> @@ -14,6 +18,29 @@
>  
>  /* Per-p2m-table state */
>  struct p2m_domain {
> +    /*
> +     * Lock that protects updates to the p2m.
> +     */
> +    rwlock_t lock;
> +
> +    /* Pages used to construct the p2m */
> +    struct page_list_head pages;
> +
> +    /* Indicate if it is required to clean the cache when writing an entry */
> +    bool clean_pte;
> +
> +    struct radix_tree_root p2m_type;

A field with a p2m_ prefix in a p2m struct? And is this tree really about
just a single "type"?

> +    /*
> +     * Default P2M access type for each page in the the domain: new pages,
> +     * swapped in pages, cleared pages, and pages that are ambiguously
> +     * retyped get this access type.  See definition of p2m_access_t.
> +     */
> +    p2m_access_t default_access;
> +
> +    /* Back pointer to domain */
> +    struct domain *domain;

This you may want to introduce earlier, to prefer passing around struct
p2m_domain * in / to P2M functions (which would benefit earlier patches
already, I think).

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1,13 +1,46 @@
>  #include <xen/bitops.h>
> +#include <xen/domain_page.h>
>  #include <xen/event.h>
> +#include <xen/iommu.h>
>  #include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/pfn.h>
> +#include <xen/rwlock.h>
>  #include <xen/sched.h>
>  #include <xen/spinlock.h>
>  #include <xen/xvmalloc.h>
>  
> +#include <asm/page.h>
>  #include <asm/p2m.h>
>  #include <asm/sbi.h>
>  
> +/*
> + * Force a synchronous P2M TLB flush.
> + *
> + * Must be called with the p2m lock held.
> + */
> +static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
> +{
> +    struct domain *d = p2m->domain;
> +
> +    ASSERT(p2m_is_write_locked(p2m));
> +
> +    sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid);
> +}
> +
> +/* Unlock the flush and do a P2M TLB flush if necessary */
> +void p2m_write_unlock(struct p2m_domain *p2m)
> +{
> +    /*
> +     * The final flush is done with the P2M write lock taken to avoid
> +     * someone else modifying the P2M wbefore the TLB invalidation has
> +     * completed.
> +     */
> +    p2m_force_tlb_flush_sync(p2m);

The comment ahead of the function says "if necessary". Yet there's no
conditional here. I also question the need for a global flush in all
cases.

> @@ -109,8 +142,33 @@ int p2m_init(struct domain *d)
>      spin_lock_init(&d->arch.paging.lock);
>      INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
>  
> +    rwlock_init(&p2m->lock);
> +    INIT_PAGE_LIST_HEAD(&p2m->pages);
> +
>      p2m->vmid = INVALID_VMID;
>  
> +    p2m->default_access = p2m_access_rwx;
> +
> +    radix_tree_init(&p2m->p2m_type);
> +
> +#ifdef CONFIG_HAS_PASSTHROUGH

Do you expect this to be conditionally selected on RISC-V?

> +    /*
> +     * Some IOMMUs don't support coherent PT walk. When the p2m is
> +     * shared with the CPU, Xen has to make sure that the PT changes have
> +     * reached the memory
> +     */
> +    p2m->clean_pte = is_iommu_enabled(d) &&
> +        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);

The comment talks about shared page tables, yet you don't check whether
page table sharing is actually enabled for the domain.

> +#else
> +    p2m->clean_pte = false;

I hope the struct starts out zero-filled, in which case you wouldn't need
this.

> +#endif
> +
> +    /*
> +     * "Trivial" initialisation is now complete.  Set the backpointer so the
> +     * users of p2m could get an access to domain structure.
> +     */
> +    p2m->domain = d;

Better set this about the very first thing?

Jan

