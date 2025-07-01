Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607AAAEFC1C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 16:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029772.1403510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWbtt-0004zt-W3; Tue, 01 Jul 2025 14:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029772.1403510; Tue, 01 Jul 2025 14:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWbtt-0004xm-TS; Tue, 01 Jul 2025 14:23:57 +0000
Received: by outflank-mailman (input) for mailman id 1029772;
 Tue, 01 Jul 2025 14:23:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWbts-0004xg-QB
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 14:23:56 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05169097-5687-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 16:23:55 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso2694256f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 07:23:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c152331fsm11560472a91.44.2025.07.01.07.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 07:23:54 -0700 (PDT)
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
X-Inumbo-ID: 05169097-5687-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751379835; x=1751984635; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J9ndAmyyBPY1UnmjaYUd3YTxRLE+KCRNa5NZIILtvxk=;
        b=dcFjC3ME8CHEZMmYSrJOonH3RKc6vVR0cCQM8YSSf0LHFmRbzdwsE9deJhqlc4MXmu
         uwe3CYqB0IiDU/4lCe8rynkjxWwG45JEWsZwE3xznAokTxLXiCQEzNRY6o0EGlKMkFWh
         BPRo9CSKgO5z/Cw25SnBv1pKFo9FfsnHCmbB60rT3UN7OwGut5pdSBl1QyPqNl4HkS15
         tAndCZGdOVgDlAVJ0ntVs58q9kWa7SKVTT4EeqXOzuIuoh9waBnlcNDEmHZBcVfPyNGm
         7oua6z6NrV07RoLjbrE6ako6OkBqLbxQqmTH2hup0Du+S9+3r5SUyqldd+W1Is2YHBrM
         KUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751379835; x=1751984635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9ndAmyyBPY1UnmjaYUd3YTxRLE+KCRNa5NZIILtvxk=;
        b=rfkNVkl/oRVdhb/QsNVUnTm7Xq8KGjJeAo/9Br7vgiizZvmIIWCaFXNv/RRy+UJJNs
         /yb3EDynWLzMm5HIWL9b56IN68geQghnz8ocqra1t8q32dzuKYncMdN+KXAOFNd2vGsu
         CuUj785tThMoAJh0mPIJi8/bz00i1A/boZG4/SH9cYy66BQi43c/yhKnOWnJkPZz3pxh
         puc3YPng241jbT+ndgy0LRCbStyBq7duVzVegch78bHpe6M11TAM7j4nvBYR/y7d2Fc4
         YB4Im5cQdq9u9lKdzLwVgYt9ipUqUO0yqjy7XkvFvAf6do54ns2RyHRKiH8hdUpmgvKU
         2t9A==
X-Forwarded-Encrypted: i=1; AJvYcCVv37juwHKXu4ZH8Ady8GkuvTvb59SZpu7ngsDkeMCOee6UOdtnQgmqfaCNCfsMT3Eb5ZlXuv0Y6Zc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaGoB3ViZ/II/+801Mdywls7TafiRqb+qOPaZsNG0lCll6lft3
	NdL9b7NXWZqBXIpr04W5dFSEt1HaJLqU4snZ1aGOpYYTgfGHIJAieofJuEqJzad9WQ==
X-Gm-Gg: ASbGnctOnIteESfM9Yq9QG6nLYQJJyqJ96ygduKfnoTvIjSToZU9GZ5ArV/CDTst73W
	jwUOW0UDAr2UOg7KD2halrwC97dVl3zYizxP9syIhIFGynooDoTm/T2lbgKvHPG6ncFZmsLMMLa
	NSZcSXjmcVvSAWMmKRN56FI79ejavhpua9TzbNoxVj6gAHlKWs1cu+Uas0XYDH4cemlIIxS2VPw
	7khIjO4fKCJnAIW1EJOUMXCmPPOYd2vhLr2lR/SaBOQQ+jjId4LoCuMK04BLTrtFf+tZ2QXdaM+
	M9KVjj3zfZThnkaXbaF8edEzvAOZ+2F/JsqC2q2vdCU3d4w8hg6HTK8QY9PA7G8C5kDds+H9LQL
	x99Lbb0z/+tJgXIDdAJZYTknJnjARP3zm34fJ/hzG7BOcqO4=
X-Google-Smtp-Source: AGHT+IETzw9ctlOKsXvRiiMFQ3ArIsiEUwjb9OTZrj5XrZvZy+SgGb6/7jRYskR2T6JDaENQWS64TQ==
X-Received: by 2002:a05:6000:2489:b0:3a3:63d3:369a with SMTP id ffacd0b85a97d-3a8fea7ad21mr16106374f8f.25.1751379834893;
        Tue, 01 Jul 2025 07:23:54 -0700 (PDT)
Message-ID: <ec05b4c8-c328-4dc3-9f35-207421990893@suse.com>
Date: Tue, 1 Jul 2025 16:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/17] xen/riscv: Implement p2m_free_entry() and
 related helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <67148a7cceffdcbc5d8a51cd6af0a0c83e5b93bc.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <67148a7cceffdcbc5d8a51cd6af0a0c83e5b93bc.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> This patch introduces a working implementation of p2m_free_entry() for RISC-V
> based on ARM's implementation of p2m_free_entry(), enabling proper cleanup
> of page table entries in the P2M (physical-to-machine) mapping.
> 
> Only few things are changed:
> - Use p2m_force_flush_sync() instead of p2m_tlb_flush_sync() as latter
>   isn't implemented on RISC-V.
> - Introduce and use p2m_type_radix_get() to get a type of p2m entry as
>   RISC-V's PTE doesn't have enough space to store all necessary types so
>   a type is stored in a radix tree.
> 
> Key additions include:
> - p2m_free_entry(): Recursively frees page table entries at all levels. It
>   handles both regular and superpage mappings and ensures that TLB entries
>   are flushed before freeing intermediate tables.
> - p2m_put_page() and helpers:
>   - p2m_put_4k_page(): Clears GFN from xenheap pages if applicable.
>   - p2m_put_2m_superpage(): Releases foreign page references in a 2MB
>     superpage.
>   - p2m_type_radix_get(): Extracts the stored p2m_type from the radix tree
>     using the PTE.
> - p2m_free_page(): Returns a page either to the domain's freelist or to
>   the domheap, depending on whether the domain is hardware-backed.

What is "hardware-backed"?

> Defines XEN_PT_ENTRIES in asm/page.h to simplify loops over page table
> entries.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
>    functionality" which was splitted to smaller.
>  - s/p2m_is_superpage/p2me_is_superpage.

See my earlier comments regarding naming.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -345,11 +345,33 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>      return __map_domain_page(p2m->root + root_table_indx);
>  }
>  
> +static p2m_type_t p2m_type_radix_get(struct p2m_domain *p2m, pte_t pte)

Does it matter to callers that ...

> +{
> +    void *ptr;
> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
> +
> +    ptr = radix_tree_lookup(&p2m->p2m_type, gfn_x(gfn));
> +
> +    if ( !ptr )
> +        return p2m_invalid;
> +
> +    return radix_tree_ptr_to_int(ptr);
> +}

... this is a radix tree lookup? IOW does "radix" need to be part of the
function name? Also "get" may want to move forward in the name, to better
match the naming of other functions.

> +/*
> + * In the case of the P2M, the valid bit is used for other purpose. Use
> + * the type to check whether an entry is valid.
> + */
>  static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>  {
> -    panic("%s: isn't implemented for now\n", __func__);
> +    return p2m_type_radix_get(p2m, pte) != p2m_invalid;
> +}

No checking of the valid bit?

> -    return false;
> +static inline bool p2me_is_superpage(struct p2m_domain *p2m, pte_t pte,
> +                                    unsigned int level)
> +{
> +    return p2me_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK) &&
> +           (level > 0);

In such combinations of conditions it's usually helpful to put the
cheapest check(s) first. IOW what point is there in doing a radix
tree lookup when the other two conditions aren't satisfied? (FTAOD
applies elsewhere as well, even within this same patch.)

> @@ -404,11 +426,127 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>      return GUEST_TABLE_MAP_NONE;
>  }
>  
> +static void p2m_put_foreign_page(struct page_info *pg)
> +{
> +    /*
> +     * It's safe to do the put_page here because page_alloc will
> +     * flush the TLBs if the page is reallocated before the end of
> +     * this loop.
> +     */
> +    put_page(pg);

Is the comment really true? The page allocator will flush the normal
TLBs, but not the stage-2 ones. Yet those are what you care about here,
aiui.

> +/* Put any references on the single 4K page referenced by mfn. */
> +static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
> +{
> +    /* TODO: Handle other p2m types */
> +
> +    /* Detect the xenheap page and mark the stored GFN as invalid. */
> +    if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
> +        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);

Is this a valid thing to do? How do you make sure the respective uses
(in gnttab's shared and status page arrays) are / were also removed?

> +}
> +
> +/* Put any references on the superpage referenced by mfn. */
> +static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
> +{
> +    struct page_info *pg;
> +    unsigned int i;
> +
> +    ASSERT(mfn_valid(mfn));
> +
> +    pg = mfn_to_page(mfn);
> +
> +    for ( i = 0; i < XEN_PT_ENTRIES; i++, pg++ )
> +        p2m_put_foreign_page(pg);
> +}
> +
> +/* Put any references on the page referenced by pte. */
> +static void p2m_put_page(struct p2m_domain *p2m, const pte_t pte,
> +                         unsigned int level)
> +{
> +    mfn_t mfn = pte_get_mfn(pte);
> +    p2m_type_t p2m_type = p2m_type_radix_get(p2m, pte);

This gives you the type of the 1st page. What guarantees that all other pages
in a superpage are of the exact same type?

> +    ASSERT(p2me_is_valid(p2m, pte));
> +
> +    /*
> +     * TODO: Currently we don't handle level 2 super-page, Xen is not
> +     * preemptible and therefore some work is needed to handle such
> +     * superpages, for which at some point Xen might end up freeing memory
> +     * and therefore for such a big mapping it could end up in a very long
> +     * operation.
> +     */

This is pretty unsatisfactory. Imo, if you don't deal with that right away,
you're setting yourself up for a significant re-write.

> +    if ( level == 1 )
> +        return p2m_put_2m_superpage(mfn, p2m_type);
> +    else if ( level == 0 )
> +        return p2m_put_4k_page(mfn, p2m_type);

Use switch() right away?

> +}
> +
> +static void p2m_free_page(struct domain *d, struct page_info *pg)
> +{
> +    if ( is_hardware_domain(d) )
> +        free_domheap_page(pg);

Why's the hardware domain different here? It should have a pool just like
all other domains have.

> +    else
> +    {
> +        spin_lock(&d->arch.paging.lock);
> +        page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
> +        spin_unlock(&d->arch.paging.lock);
> +    }
> +}
> +
>  /* Free pte sub-tree behind an entry */
>  static void p2m_free_entry(struct p2m_domain *p2m,
>                             pte_t entry, unsigned int level)
>  {
> -    panic("%s: hasn't been implemented yet\n", __func__);
> +    unsigned int i;
> +    pte_t *table;
> +    mfn_t mfn;
> +    struct page_info *pg;
> +
> +    /* Nothing to do if the entry is invalid. */
> +    if ( !p2me_is_valid(p2m, entry) )
> +        return;

Does this actually apply to intermediate page tables (which you handle
later in the function), when that's (only) a P2M type check?

> +    if ( p2me_is_superpage(p2m, entry, level) || (level == 0) )
> +    {
> +#ifdef CONFIG_IOREQ_SERVER
> +        /*
> +         * If this gets called then either the entry was replaced by an entry
> +         * with a different base (valid case) or the shattering of a superpage
> +         * has failed (error case).
> +         * So, at worst, the spurious mapcache invalidation might be sent.
> +         */
> +        if ( p2m_is_ram( p2m_type_radix_get(p2m, entry)) &&

Nit: Style.

> +             domain_has_ioreq_server(p2m->domain) )
> +            ioreq_request_mapcache_invalidate(p2m->domain);
> +#endif
> +
> +        p2m_put_page(p2m, entry, level);
> +
> +        return;
> +    }
> +
> +    table = map_domain_page(pte_get_mfn(entry));
> +    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
> +        p2m_free_entry(p2m, *(table + i), level - 1);

Better table[i]?

Jan

