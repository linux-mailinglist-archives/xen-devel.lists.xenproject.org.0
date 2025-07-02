Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD4AF1453
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 13:44:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030944.1404631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWvt6-000279-I1; Wed, 02 Jul 2025 11:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030944.1404631; Wed, 02 Jul 2025 11:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWvt6-00025i-Dv; Wed, 02 Jul 2025 11:44:28 +0000
Received: by outflank-mailman (input) for mailman id 1030944;
 Wed, 02 Jul 2025 11:44:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWvt5-00025c-Ar
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 11:44:27 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6f3ece3-5739-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 13:44:25 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4530921461aso44614875e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 04:44:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f54414acsm19359000a91.47.2025.07.02.04.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 04:44:23 -0700 (PDT)
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
X-Inumbo-ID: e6f3ece3-5739-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751456664; x=1752061464; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sra2Drvlyx6VA+NlClqQ5uhhEOAMIP3K+Kak3dMqC4k=;
        b=ck/s+LZRBklZFz4uINkiRDlA3eNMpp8N+gr+oVEP/P9DXoEplX3Rv5KKc7ixrYa0Jp
         Qm2OSSyi5albh5koTPbMdIvz8nC7UKBxpmaXqMxeTmwtYlmPV8VeckuOpOI3I/wz8G+D
         IUEHZNit6I5h4pT9UohgOX7QdUXKjlxqroN+N8ZfvwL7Bz006zf2YO8QVIevCtcO36zm
         njg3wl4Q/VOyu1refM44Pt3zVPXN9PXPQBQ/soVLmD1by4yNYKliTEnVZMhmXIDq6IWs
         uhcbtcO+sULRwpPN/i4HW9uh/XmZEln1aq0Cx2Se0C/b1aYPjNqF1FhLq0ZHApEsttUA
         SlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456664; x=1752061464;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sra2Drvlyx6VA+NlClqQ5uhhEOAMIP3K+Kak3dMqC4k=;
        b=P0vIBumlnaQWEKS1hhLy/5oX/ipSuGhqgAE76nHnfldr4v4Bdp+V2qtitQwiu9vKVm
         ykCBbwf9XfkJGCETa2CQ2MVyv/pOE0NzByJklBl4rh/ocaarXZeQbtB8N6WXiwt95nXF
         X0WiadQFiH0LG7yUWkIDEPRTJmlwgo+zuBr5cBHaqZWqQX61ICXddR4LEsatFTdcaNU6
         oMy/cdQBvY1jAAzzySUq94zk9VG6aZK2IvSNsLkZn9UlC7GJwQsK3sLFjq6T3q7PRcUj
         doBBMRIyPWI1g/g0Rqlo7oUB5voGof1JvB2s7DWXdDIs8R/mivUOyB6j/dCVj6K/NgA5
         4Yuw==
X-Forwarded-Encrypted: i=1; AJvYcCUjU7TJFt+Okoe0baUHw7YLUBN3PDW/pl41Jmx8i5CDZj6SEWldadWygV2rGVGjaKyR6Nzs8svmMl4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNsHmuDvAVW7RVyBFi12Jfj0Lre+OgtCzEMqTb95LdfakfHQC2
	2aFFJPvYQZnq85+A1cIfV/z4zaSlBwvZK2hBQoPL3GLy9xxIncOQIJabtIo1qRou8A==
X-Gm-Gg: ASbGncvC/uVCz9BgVypSG0u8P0HG3n4YhgCIBXPHBoE/TE8YXMrC813i0Uy1UrrT4Hr
	HCJTQBe/PnRHSF3j2tN0U/wn2lNF4QSut49XRYTrPwD+WPv4uDTFfpfb0TdLB5CJ7K6XZbP7w87
	g7tLDlIPFzJA7w6UOD2FInYhEdZV1iO+RrCr5cL5kgeGKoBAuU5IHTEoQgt4kjQFY+6KFR+ikfY
	MmhsPIzHpVQ6x6d3n7dz9bEuRAD4xpivRGVmOU73n99hdNIS/g9Z2tbcdK/8hgkSXk+8K/Jv+49
	SEcEKUH0Tjjm9btpzd6Df/R4aRr24rqE3Qz1f/RtZqjf3TRjVT8vOkI9aLgImQcArpva6deqC3Y
	Yvg3oCT3c9su/pqMaTCXc3qKnRSNB7uWbBYp0gU8xWXxfO/U=
X-Google-Smtp-Source: AGHT+IHGcQ71oM0oSWMIbblf4Be4a2fbCdpvog8E6LiqTJii/mw8jnj5l95VzvmqWUNiy1iEf5vJXw==
X-Received: by 2002:a05:6000:470d:b0:3a6:cfca:efee with SMTP id ffacd0b85a97d-3b1fe2de7aemr1731475f8f.17.1751456664162;
        Wed, 02 Jul 2025 04:44:24 -0700 (PDT)
Message-ID: <c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com>
Date: Wed, 2 Jul 2025 13:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/17] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <6281efb0dc9b0a9ab4dd8cee7952bff2a7745963.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6281efb0dc9b0a9ab4dd8cee7952bff2a7745963.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> Introduce helper functions for safely querying the P2M (physical-to-machine)
> mapping:
>  - add p2m_read_lock(), p2m_read_unlock(), and p2m_is_locked() for managing
>    P2M lock state.
>  - Implement p2m_get_entry() to retrieve mapping details for a given GFN,
>    including MFN, page order, and validity.
>  - Add p2m_lookup() to encapsulate read-locked MFN retrieval.
>  - Introduce p2m_get_page_from_gfn() to convert a GFN into a page_info
>    pointer, acquiring a reference to the page if valid.
> 
> Implementations are based on Arm's functions with some minor modifications:
> - p2m_get_entry():
>   - Reverse traversal of page tables, as RISC-V uses the opposite order
>     compared to Arm.
>   - Removed the return of p2m_access_t from p2m_get_entry() since
>     mem_access_settings is not introduced for RISC-V.

Didn't I see uses of p2m_access in earlier patches? If you don't mean to have
that, then please consistently {every,no}where.

>   - Updated BUILD_BUG_ON() to check using the level 0 mask, which corresponds
>     to Arm's THIRD_MASK.
>   - Replaced open-coded bit shifts with the BIT() macro.
>   - Other minor changes, such as using RISC-V-specific functions to validate
>     P2M PTEs, and replacing Arm-specific GUEST_* macros with their RISC-V
>     equivalents.
> - p2m_get_page_from_gfn():
>   - Removed p2m_is_foreign() and related logic, as this functionality is not
>     implemented for RISC-V.

Yet I expect you'll need this, sooner or later.

> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -184,6 +184,24 @@ static inline int p2m_is_write_locked(struct p2m_domain *p2m)
>      return rw_is_write_locked(&p2m->lock);
>  }
>  
> +static inline void p2m_read_lock(struct p2m_domain *p2m)
> +{
> +    read_lock(&p2m->lock);
> +}
> +
> +static inline void p2m_read_unlock(struct p2m_domain *p2m)
> +{
> +    read_unlock(&p2m->lock);
> +}
> +
> +static inline int p2m_is_locked(struct p2m_domain *p2m)
> +{
> +    return rw_is_locked(&p2m->lock);
> +}
> +
> +struct page_info *p2m_get_page_from_gfn(struct domain *d, gfn_t gfn,
> +                                        p2m_type_t *t);

Once again I don't think you can pass struct domain * here, when in
the long run a domain can have multiple P2Ms.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1055,3 +1055,134 @@ int guest_physmap_add_entry(struct domain *d,
>  {
>      return p2m_insert_mapping(d, gfn, (1 << page_order), mfn, t);
>  }
> +
> +/*
> + * Get the details of a given gfn.
> + *
> + * If the entry is present, the associated MFN will be returned and the
> + * access and type filled up. The page_order will correspond to the

You removed p2m_access_t * from the parameters; you need to also update
the comment then accordingly.

> + * order of the mapping in the page table (i.e it could be a superpage).
> + *
> + * If the entry is not present, INVALID_MFN will be returned and the
> + * page_order will be set according to the order of the invalid range.
> + *
> + * valid will contain the value of bit[0] (e.g valid bit) of the
> + * entry.
> + */
> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
> +                           p2m_type_t *t,
> +                           unsigned int *page_order,
> +                           bool *valid)
> +{
> +    paddr_t addr = gfn_to_gaddr(gfn);
> +    unsigned int level = 0;
> +    pte_t entry, *table;
> +    int rc;
> +    mfn_t mfn = INVALID_MFN;
> +    p2m_type_t _t;

Please no local variables with leading underscores. In x86 we commonly
name such variables p2mt.

> +    DECLARE_OFFSETS(offsets, addr);

This is the sole use of "addr". Is such a local variable really worth having?

> +    ASSERT(p2m_is_locked(p2m));
> +    BUILD_BUG_ON(XEN_PT_LEVEL_MAP_MASK(0) != PAGE_MASK);
> +
> +    /* Allow t to be NULL */
> +    t = t ?: &_t;
> +
> +    *t = p2m_invalid;
> +
> +    if ( valid )
> +        *valid = false;
> +
> +    /* XXX: Check if the mapping is lower than the mapped gfn */
> +
> +    /* This gfn is higher than the highest the p2m map currently holds */
> +    if ( gfn_x(gfn) > gfn_x(p2m->max_mapped_gfn) )
> +    {
> +        for ( level = P2M_ROOT_LEVEL; level ; level-- )

Nit: Stray blank before the 2nd semicolon. (Again at least once below.)

> +            if ( (gfn_x(gfn) & (XEN_PT_LEVEL_MASK(level) >> PAGE_SHIFT)) >
> +                 gfn_x(p2m->max_mapped_gfn) )
> +                break;
> +
> +        goto out;
> +    }
> +
> +    table = p2m_get_root_pointer(p2m, gfn);
> +
> +    /*
> +     * the table should always be non-NULL because the gfn is below
> +     * p2m->max_mapped_gfn and the root table pages are always present.
> +     */
> +    if ( !table )
> +    {
> +        ASSERT_UNREACHABLE();
> +        level = P2M_ROOT_LEVEL;
> +        goto out;
> +    }
> +
> +    for ( level = P2M_ROOT_LEVEL; level ; level-- )
> +    {
> +        rc = p2m_next_level(p2m, true, level, &table, offsets[level]);
> +        if ( (rc == GUEST_TABLE_MAP_NONE) && (rc != GUEST_TABLE_MAP_NOMEM) )

This condition looks odd. As written the rhs of the && is redundant.

> +            goto out_unmap;
> +        else if ( rc != GUEST_TABLE_NORMAL )

As before, no real need for "else" in such cases.

> +            break;
> +    }
> +
> +    entry = table[offsets[level]];
> +
> +    if ( p2me_is_valid(p2m, entry) )
> +    {
> +        *t = p2m_type_radix_get(p2m, entry);

If the incoming argument is NULL, the somewhat expensive radix tree lookup
is unnecessary here.

> +        mfn = pte_get_mfn(entry);
> +        /*
> +         * The entry may point to a superpage. Find the MFN associated
> +         * to the GFN.
> +         */
> +        mfn = mfn_add(mfn,
> +                      gfn_x(gfn) & (BIT(XEN_PT_LEVEL_ORDER(level), UL) - 1));
> +
> +        if ( valid )
> +            *valid = pte_is_valid(entry);

Interesting. Why not the P2M counterpart of the function? Yes, the comment
ahead of the function says so, but I don't see why the valid bit suddenly
is relevant here (besides the P2M type).

> +    }
> +
> +out_unmap:
> +    unmap_domain_page(table);
> +
> +out:

Nit: Style (bot labels).

> +    if ( page_order )
> +        *page_order = XEN_PT_LEVEL_ORDER(level);
> +
> +    return mfn;
> +}
> +
> +static mfn_t p2m_lookup(struct domain *d, gfn_t gfn, p2m_type_t *t)

pointer-to-const for the 1st arg? But again more likely struct p2m_domain *
anyway?

> +{
> +    mfn_t mfn;
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +    p2m_read_lock(p2m);
> +    mfn = p2m_get_entry(p2m, gfn, t, NULL, NULL);
> +    p2m_read_unlock(p2m);
> +
> +    return mfn;
> +}
> +
> +struct page_info *p2m_get_page_from_gfn(struct domain *d, gfn_t gfn,

Same here - likely you mean struct p2m_domain * instead.

> +                                        p2m_type_t *t)
> +{
> +    p2m_type_t p2mt = {0};

Why a compound initializer for something that isn't a compound object?
And why plain 0 for something that is an enumerated type?

> +    struct page_info *page;
> +
> +    mfn_t mfn = p2m_lookup(d, gfn, &p2mt);
> +
> +    if ( t )
> +        *t = p2mt;

What's wrong with passing t directly to p2m_lookup()?

Jan

