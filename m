Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EF7B20A0E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 15:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077608.1438645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulSWZ-0000Zv-0E; Mon, 11 Aug 2025 13:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077608.1438645; Mon, 11 Aug 2025 13:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulSWY-0000YU-Td; Mon, 11 Aug 2025 13:25:14 +0000
Received: by outflank-mailman (input) for mailman id 1077608;
 Mon, 11 Aug 2025 13:25:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulSWX-0000YO-1x
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 13:25:13 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b9f2228-76b6-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 15:25:11 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-af95b919093so639822366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 06:25:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a396fsm2029839266b.42.2025.08.11.06.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 06:25:10 -0700 (PDT)
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
X-Inumbo-ID: 9b9f2228-76b6-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754918711; x=1755523511; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1QakprPly9v0H+YwMbntGulgbO21nLMu9KER28L80Gs=;
        b=chBK22rdZ86AdeMryVz55wKHr9Vo5AL1jUBdXu6+SAuUl00tFlJFiy34ZZlpRie4SN
         GwBgV4hdYd10nlrc5nyOR9q5rODlREHngtRC1A9OM9YnD0d3Iwrso6y34xSFcDeIj0Jp
         dwP35WveRi5ayHuyR543obuOUmn8GnZ153aM2N1nJOGq/aCyt2hrWdr+6aLnfuaHeB+e
         CYQnAKA/mfVV1j6gmSNMap+kAZ+xbV+f6yDkwg4A4KYy0AdHHhjyCRBNBYYiYpJpLw7h
         5nVJggHmjWXOgpc4ZDPKRtGg3YMlGMk5EWCW+XXFOB1jaBCwwxuVAQYViL+HzfqSRcut
         +01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754918711; x=1755523511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QakprPly9v0H+YwMbntGulgbO21nLMu9KER28L80Gs=;
        b=FqCjFAkiqI/O1T7prkr3JylqG17b2N6ZrzJfNVxomVfK2re0H2MoRfZKxgevqhGzCP
         GZWef/+l5/O7UnzvfZflm/sAzMzQmRrKv+Gk56yaVYX+XVLz7xPH2GaIh+l6dYKnTUX0
         G0LooqUXQUdyYW0oXDBQPZpHWxIj380g+HJL9OzyUc99VaLmcs7eArHYRdQ/63Os1Fuw
         g+vtAUR9ARbz1Vwt9N/7IylvKa56k3U5Mf1yj7U+hONlkCptuVckpYiz5FOoSiPGREv/
         6oYxpCeP1M8oMbngX13peQ3PN1ITZtUaos89E5I0CJV8BbnYZ3ongiBK7D7+hBTeEkt4
         WHDg==
X-Forwarded-Encrypted: i=1; AJvYcCXVmZU7/cDopuiad4LtDIoVUNUhtbXQmo6nrKHH6TlIbRiLOvaj7acFjicpH31h2lkAIuudf1y1FiE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxfDO12pQ9Hv3N3Mt+q/+rkhHFnC6FMtskqvgHW3BjvpSsAfw2
	DPESb3IPnlmqChIt6oR7GTWAM8hdUJHev+1Iuy1EGOFpWuz+iHt4MH+0/9g5YvP+jg==
X-Gm-Gg: ASbGnctnus9P+T5Wu38A2FE7i8LwbfqqaRZkBJZmMPTT4ulZXodatmnJ3nAktRyEVha
	mPSJTG40Lw/wPO9Yx1DZdWZU1dxv6ceA4MAxinV7oSH3QcKG2X0XmLEReNs07WUvZtJJ1G9tlJr
	Z+JEZBO+9SZxTFMhPm6AW4Q8C33Hj+NRTB6ZZGdzjdVjmMyEOHXJPBQmstBt2VUyle8sNoa8v6g
	MekmT0rsuT+vfRtvaYlOlEoFa5WUe5z0g/lRxUwYYrFpf89uV3sDYnfIYCXvRko9AgKtCsqk3Fb
	yRSmFEwqU9v/tjZCTWkBz8HHnb5oEiEWqdf/Q6nkd6R2cOywqaitVfi1eIKvwBitGfC4Ku5UCpm
	HbDp+aBMOFSMEmGS0qoy5Njm0I4niCHabt5a07kzFmQueVOjRh5APBLFEyReUO8FOG9fzExwOXk
	pf1VLMU9g=
X-Google-Smtp-Source: AGHT+IHY4Rm+lGrXLtN2Td2JlKwbYXsjIbG9k3+P4y+Q8mBCEV0q5v2le7EJnCJ4dLrAiWEuSf5YSg==
X-Received: by 2002:a17:907:3d8d:b0:af9:5ca0:e4fe with SMTP id a640c23a62f3a-af9c6608b5amr1158947566b.56.1754918710929;
        Mon, 11 Aug 2025 06:25:10 -0700 (PDT)
Message-ID: <f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com>
Date: Mon, 11 Aug 2025 15:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/20] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <24bb8ca6ad9d325f48d0c64b0fa461db5f0d0cc5.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <24bb8ca6ad9d325f48d0c64b0fa461db5f0d0cc5.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> Introduce helper functions for safely querying the P2M (physical-to-machine)
> mapping:
>  - add p2m_read_lock(), p2m_read_unlock(), and p2m_is_locked() for managing
>    P2M lock state.
>  - Implement p2m_get_entry() to retrieve mapping details for a given GFN,
>    including MFN, page order, and validity.
>  - Add p2m_lookup() to encapsulate read-locked MFN retrieval.
>  - Introduce p2m_get_page_from_gfn() to convert a GFN into a page_info
>    pointer, acquiring a reference to the page if valid.
>  - Introduce get_page().
> 
> Implementations are based on Arm's functions with some minor modifications:
> - p2m_get_entry():
>   - Reverse traversal of page tables, as RISC-V uses the opposite level
>     numbering compared to Arm.
>   - Removed the return of p2m_access_t from p2m_get_entry() since
>     mem_access_settings is not introduced for RISC-V.
>   - Updated BUILD_BUG_ON() to check using the level 0 mask, which corresponds
>     to Arm's THIRD_MASK.
>   - Replaced open-coded bit shifts with the BIT() macro.
>   - Other minor changes, such as using RISC-V-specific functions to validate
>     P2M PTEs, and replacing Arm-specific GUEST_* macros with their RISC-V
>     equivalents.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>  - Add is_p2m_foreign() macro and connected stuff.

What is this about?

> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -202,6 +202,24 @@ static inline int p2m_is_write_locked(struct p2m_domain *p2m)
>  
>  unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid);
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

bool return type (also for p2m_is_write_locked() in patch 11)? Also perhaps
pointer-to-const parameter?

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -852,3 +852,139 @@ int map_regions_p2mt(struct domain *d,
>  {
>      return p2m_insert_mapping(p2m_get_hostp2m(d), gfn, nr, mfn, p2mt);
>  }
> +
> +/*
> + * Get the details of a given gfn.
> + *
> + * If the entry is present, the associated MFN will be returned type filled up.

This sentence doesn't really parse, perhaps due to missing words.

> + * The page_order will correspond to the order of the mapping in the page
> + * table (i.e it could be a superpage).
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
> +    unsigned int level = 0;
> +    pte_t entry, *table;
> +    int rc;
> +    mfn_t mfn = INVALID_MFN;
> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
> +
> +    ASSERT(p2m_is_locked(p2m));
> +    BUILD_BUG_ON(XEN_PT_LEVEL_MAP_MASK(0) != PAGE_MASK);

What function-wide property is this check about? Even when moved ...

> +    if ( valid )
> +        *valid = false;
> +
> +    /* XXX: Check if the mapping is lower than the mapped gfn */

(Nested: What is this about?)

> +    /* This gfn is higher than the highest the p2m map currently holds */
> +    if ( gfn_x(gfn) > gfn_x(p2m->max_mapped_gfn) )
> +    {
> +        for ( level = P2M_ROOT_LEVEL; level; level-- )
> +            if ( (gfn_x(gfn) & (XEN_PT_LEVEL_MASK(level) >> PAGE_SHIFT)) >

... into the more narrow scope where another XEN_PT_LEVEL_MASK() exists I
can't really spot what the check is to guard against.

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

Nit: Style.

> +    if ( !table )
> +    {
> +        ASSERT_UNREACHABLE();
> +        level = P2M_ROOT_LEVEL;
> +        goto out;
> +    }
> +
> +    for ( level = P2M_ROOT_LEVEL; level; level-- )
> +    {
> +        rc = p2m_next_level(p2m, true, level, &table, offsets[level]);

Why would you blindly allocate a page table (hierarchy) here? If anything,
this may need doing upon caller request (as it's only up the call chain
where the necessary knowledge exists). For example, ...

> +static mfn_t p2m_lookup(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t)
> +{
> +    mfn_t mfn;
> +
> +    p2m_read_lock(p2m);
> +    mfn = p2m_get_entry(p2m, gfn, t, NULL, NULL);

... this (by its name) pretty likely won't want allocation, while ...

> +    p2m_read_unlock(p2m);
> +
> +    return mfn;
> +}
> +
> +struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
> +                                        p2m_type_t *t)
> +{

... this will. Yet then ...

> +    struct page_info *page;
> +    p2m_type_t p2mt = p2m_invalid;
> +    mfn_t mfn = p2m_lookup(p2m, gfn, t);

... you use the earlier one here.

> +    if ( !mfn_valid(mfn) )
> +        return NULL;
> +
> +    if ( t )
> +        p2mt = *t;
> +
> +    page = mfn_to_page(mfn);
> +
> +    /*
> +     * get_page won't work on foreign mapping because the page doesn't
> +     * belong to the current domain.
> +     */
> +    if ( p2m_is_foreign(p2mt) )
> +    {
> +        struct domain *fdom = page_get_owner_and_reference(page);
> +        ASSERT(fdom != NULL);
> +        ASSERT(fdom != p2m->domain);
> +        return page;

In a release build (with no assertions) this will be wrong if either of the
two condition would not be satisfied. See x86'es respective code.

Jan

