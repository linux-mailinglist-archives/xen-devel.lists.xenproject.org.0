Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E18DAF0E26
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:35:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030742.1404400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWswN-0003zh-Ik; Wed, 02 Jul 2025 08:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030742.1404400; Wed, 02 Jul 2025 08:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWswN-0003xh-G1; Wed, 02 Jul 2025 08:35:39 +0000
Received: by outflank-mailman (input) for mailman id 1030742;
 Wed, 02 Jul 2025 08:35:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWswL-0003xb-FS
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:35:37 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81bb0674-571f-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 10:35:28 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so4122823f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 01:35:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31d8580sm12037561a12.52.2025.07.02.01.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 01:35:26 -0700 (PDT)
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
X-Inumbo-ID: 81bb0674-571f-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751445327; x=1752050127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KqEm3mjRsCxW165HJb9xgb/FwjkmGjaEYyo6m1LiKzE=;
        b=EHBT7OkXkUc2YFYCBdEvXM/jxt5RKo0i9xh/fRGjfT/61pCG27QYezIGZNKx1Sgo7J
         sjShWd79rgdhTaThHOkZrDBPds20FKxz5/MjYgLdNJn5eE7k8mQDNxXFS9OX7QbUUCRo
         CDEROUAJRKaJF4kTAEPEpZhkiykPJkTGN+wObr44Q320dXDtBg0Rys12ZGS2hOjNPa97
         11SBMkUm8N64fGsQC+RP8TF9ZBIuhRhLRaPhSdTkxx8yMJgJivlts5/lzR32xuIyS6vi
         sUnuvSpGYLrCVsPKh7PaIiZ4rAP8bO40H9Aw6wt20EC9T6jWkdAowdbNg7NXuQr+4flm
         H69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445327; x=1752050127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqEm3mjRsCxW165HJb9xgb/FwjkmGjaEYyo6m1LiKzE=;
        b=N4CIU5v4WkOG73QdZ4euSBJHCpLd7IfetFXTYOW3Qi4hDJHZ4/n1TBd2cHJgoFtPsN
         OxyxL0NyKfEh4z7NpTTxX6Nv7/fYNzvjYFKORvtgS6uAvhM3k2SjAV5njUMu9BTS4JwE
         jMZkL0IrN99doRpWW/omkj+InYnAZwYC6ANf8t+6w2ad4aMsEmYRaclnAF1WXsJ4iv8I
         ufmPhElow8dW97u/AkrI5QNh5waUd3wyT/EDgRzS26NIkZE3e+AcnKkCzmHPVhPyxjlf
         8yLDFCmY9qwtIW80BKbBp+Wl8qXPsePq1GUW8e6pTJDnhhlhS1NYbxOWKZ02bMTC/CBO
         wryg==
X-Forwarded-Encrypted: i=1; AJvYcCUrdUEWKYl1IFQvIR0HwjQRTe21CdSzkoJSXKj+W09WACV3i0zY872FRRu1JzYZq9Jv47DKVF9fSHk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnclS+SDOz/H5gSsp9yqFN+tdWiVIvKvE9K9AS3NO3I+cKyD8C
	P5Z5km+Fb8YstglR25vngR802/+k5RYJxUX5FvL9WegsGfCPquDxkQQZD0CaoaoWRQ==
X-Gm-Gg: ASbGncsqB+TZHjsukbptZMRchJ+ZiIE33vN9RK8JLY5PFDIwNCcM+2R27az0gTlxOio
	Y9cefZ/O1tnPkCbPgglZhW2JvYpdkQ6mi6BNI60iLIikrsvcNSiTNGACfyXtwLeiHEqJAN0flxg
	8aYsGpZkjGHkQvZHcmaFKqFftZZTE6CWXLYnvyNSVpeKDQNpktMUOxxvqc3sqvF2Q50W9krVda8
	4CkT9nnu9MYomfGmPNlJozCB2+Zbo4/qGp7SOpsrMKoFAqjmS+B0IztU5DD75Wu47LnKdFtiWnf
	fvkHKAPzGOZ4XTfY/9ZrKnGGgjUqw81Jh7AKz4mA5dE9p/Gxf993CEbu+fNFNfOqnLAqlwkzNxf
	08cNLQcai2GVHh5J2k6G1fe7m1054axP+jE8AnWTof+W1e4TgfCEtim+2Lw==
X-Google-Smtp-Source: AGHT+IGT4jDj++akEeSvIMkmwGg6m+estxLkk24fmM+ze09Lq6WA1WmRA8Ze0xC3nUP7Jr3Fipmpog==
X-Received: by 2002:a05:6000:23c8:b0:3a4:f722:f98d with SMTP id ffacd0b85a97d-3b200c3ed50mr853808f8f.51.1751445327439;
        Wed, 02 Jul 2025 01:35:27 -0700 (PDT)
Message-ID: <1496586d-484c-4e99-aea7-974be335150f@suse.com>
Date: Wed, 2 Jul 2025 10:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] xen/riscv: implement p2m_next_level()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <cc696a9e4e74233c81f0cbcfd303cee91b8271af.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cc696a9e4e74233c81f0cbcfd303cee91b8271af.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -387,6 +387,17 @@ static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>      return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>  }
>  
> +/*
> + * pte_is_* helpers are checking the valid bit set in the
> + * PTE but we have to check p2m_type instead (look at the comment above
> + * p2me_is_valid())
> + * Provide our own overlay to check the valid bit.
> + */
> +static inline bool p2me_is_mapping(struct p2m_domain *p2m, pte_t pte)
> +{
> +    return p2me_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK);
> +}

Same question as on the earlier patch - does P2M type apply to intermediate
page tables at all? (Conceptually it shouldn't.)

> @@ -492,6 +503,70 @@ static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t,
>      return e;
>  }
>  
> +/* Generate table entry with correct attributes. */
> +static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
> +{
> +    /*
> +     * Since this function generates a table entry, according to "Encoding
> +     * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
> +     * to point to the next level of the page table.
> +     * Therefore, to ensure that an entry is a page table entry,
> +     * `p2m_access_n2rwx` is passed to `mfn_to_p2m_entry()` as the access value,
> +     * which overrides whatever was passed as `p2m_type_t` and guarantees that
> +     * the entry is a page table entry by setting r = w = x = 0.
> +     */
> +    return p2m_entry_from_mfn(p2m, page_to_mfn(page), p2m_ram_rw, p2m_access_n2rwx);

Similarly P2M access shouldn't apply to intermediate page tables. (Moot
with that, but (ab)using p2m_access_n2rwx would also look wrong: You did
read what it means, didn't you?)

> +}
> +
> +static struct page_info *p2m_alloc_page(struct domain *d)
> +{
> +    struct page_info *pg;
> +
> +    /*
> +     * For hardware domain, there should be no limit in the number of pages that
> +     * can be allocated, so that the kernel may take advantage of the extended
> +     * regions. Hence, allocate p2m pages for hardware domains from heap.
> +     */
> +    if ( is_hardware_domain(d) )
> +    {
> +        pg = alloc_domheap_page(d, MEMF_no_owner);
> +        if ( pg == NULL )
> +            printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
> +    }

The comment looks to have been taken verbatim from Arm. Whatever "extended
regions" are, does the same concept even exist on RISC-V?

Also, special casing Dom0 like this has benefits, but also comes with a
pitfall: If the system's out of memory, allocations will fail. A pre-
populated pool would avoid that (until exhausted, of course). If special-
casing of Dom0 is needed, I wonder whether ...

> +    else
> +    {
> +        spin_lock(&d->arch.paging.lock);
> +        pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
> +        spin_unlock(&d->arch.paging.lock);
> +    }

... going this path but with a Dom0-only fallback to general allocation
wouldn't be the better route.

> +    return pg;
> +}
> +
> +/* Allocate a new page table page and hook it in via the given entry. */
> +static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
> +{
> +    struct page_info *page;
> +    pte_t *p;
> +
> +    ASSERT(!p2me_is_valid(p2m, *entry));
> +
> +    page = p2m_alloc_page(p2m->domain);
> +    if ( page == NULL )
> +        return -ENOMEM;
> +
> +    page_list_add(page, &p2m->pages);
> +
> +    p = __map_domain_page(page);
> +    clear_page(p);
> +
> +    unmap_domain_page(p);

clear_domain_page()? Or actually clear_and_clean_page()?

> @@ -516,9 +591,33 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>                            unsigned int level, pte_t **table,
>                            unsigned int offset)
>  {
> -    panic("%s: hasn't been implemented yet\n", __func__);
> +    pte_t *entry;
> +    int ret;
> +    mfn_t mfn;
> +
> +    entry = *table + offset;
> +
> +    if ( !p2me_is_valid(p2m, *entry) )
> +    {
> +        if ( !alloc_tbl )
> +            return GUEST_TABLE_MAP_NONE;
> +
> +        ret = p2m_create_table(p2m, entry);
> +        if ( ret )
> +            return GUEST_TABLE_MAP_NOMEM;
> +    }
> +
> +    /* The function p2m_next_level() is never called at the last level */
> +    ASSERT(level != 0);

Logically you would perhaps better do this ahead of trying to allocate a
page table. Calls here with level == 0 are invalid in all cases aiui, not
just when you make it here.

> +    if ( p2me_is_mapping(p2m, *entry) )
> +        return GUEST_TABLE_SUPER_PAGE;
> +
> +    mfn = mfn_from_pte(*entry);
> +
> +    unmap_domain_page(*table);
> +    *table = map_domain_page(mfn);

Just to mention it (may not need taking care of right away), there's an
inefficiency here: In p2m_create_table() you map the page to clear it.
Then you tear down that mapping, just to re-establish it here.

Jan

