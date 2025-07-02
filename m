Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40A9AF0FE2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 11:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030786.1404451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWtid-0007FG-1N; Wed, 02 Jul 2025 09:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030786.1404451; Wed, 02 Jul 2025 09:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWtic-0007Cf-US; Wed, 02 Jul 2025 09:25:30 +0000
Received: by outflank-mailman (input) for mailman id 1030786;
 Wed, 02 Jul 2025 09:25:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWtia-0007CZ-Ig
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 09:25:28 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cc644db-5726-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 11:25:26 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so2300126f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 02:25:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31da5f2sm12392907a12.58.2025.07.02.02.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 02:25:25 -0700 (PDT)
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
X-Inumbo-ID: 7cc644db-5726-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751448326; x=1752053126; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PvveAeT5pEfZap+UM4eDFA55HaIrWRZx8PP0BhxWs84=;
        b=Z4E9pyaRWSaNJh4ynilwF8saBUNyTxTFYmxjN5KtmQdF2veyfw/8Y6CIH1sS++j03+
         zJX22wNnj1tpncsg+z2ZZeEpoI++x/zt1twbA0yLp90AswL/90lZgaeJoUt8zFrQWMVM
         uAPrMwI4x2hfXwXhee8uynPNm5jQqgzYh/evLT8lf4qhQh1s8nbSlOVG66Ll49qydC7/
         ZMyw2X1zOKnWaJiVwrB5mH3zLluoIjBFcGTO/hm6t2vT5qUvshpoHXh18zKcC72lvYuB
         ZI/6A6/A3P2JSP26Lxn79gs+wnOY6VW9Z4ZEGHljisXY7A3C/SARLjjZq25lUvw9ciD5
         KDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448326; x=1752053126;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvveAeT5pEfZap+UM4eDFA55HaIrWRZx8PP0BhxWs84=;
        b=UPNBRNch1MehUV+Nr1oy5yaTcCxWMV/+Gr3KeTZ2ZEuQxPsKTAErQEE30fodqNOuoO
         tEtLKMO914b3RyKhmvcm93FZnU1zkoD2B9jwhz/AlVB20VG5V5wuUiEsfgFudeDn68r7
         3nSNxow6Laes6vXaZGVpTxAima411aCMLaYY57KHPHk0mKEeLjT2zZcnCYi5wZXOBoYf
         gme6o+oGVKJzp3rBBzLY65/3Ae3m7OVV1GsCPMW3Q9x3MaQ5/y75bOdxhyhzoFsHh6yz
         oyjZvrQIDmfvvzPCOcxJ6XrfB7lUL2Vg4bGhsQR9ZmUwsYnbarh4lvRhSEHTfJaVqPK4
         cGMg==
X-Forwarded-Encrypted: i=1; AJvYcCWCCGoa6y077DYNJcIk5SKyphliB3jKgVoStFVIOmNJRYwdAKs5tlWyoXjawPFXftwvtMStJOCt8dQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlIbhAucKPoHT4GHad9KOZXLI3w6xMikrm1sD4vKL8U6dXwgVd
	sj/z8aQ2t30NeatKNHIg2XVbzJPhXATVEQ6LnprSeNJD1SHWg9H7FZRb0PYG1B0uyA==
X-Gm-Gg: ASbGnct310UqdSB+19u1KWnBvHUfwyJFx7NNv6ACUWDdHHBBaIFACi2zfz3/bgnxeIm
	KWCowxEJGDMaFm83Nn13xqO6HaypULOBCgytzF1MxS5GueUE8gw0K151Pxb8nziJiuXKyfKuekv
	9J/3HblwoihvNb6B3n8pidhz9eUPDoR98NGxNDLlPRvseIDWPLhKdN8x+gt7Rp3p1oKvVsR9PTU
	Niyo+xKVhWwMDMkTeXs22VU61kYMp610wMkH4tWI3AtShLtTgDBR+n8WqlH7LDnpVmdQTWQKOJ8
	WTXTVwYxXQ5JMVqkDXggp4EsrN1+nI5efaiMLdWlEuTsHIQ0kpAFJ3uhiHIxKDDMNrVn2CXqaBL
	emtIMt2uPbUGpYZtTD1ggOelhQ3mWRx3m+/ID2TD+b8zCFrU=
X-Google-Smtp-Source: AGHT+IEsqk8IoE41ubg6luGis30LG5LzhecCwsSh5yYpxKAz3UhVK6N3mJbJQc5utPL57z0BeIoCug==
X-Received: by 2002:a05:6000:41e2:b0:3a4:e4ee:4ca9 with SMTP id ffacd0b85a97d-3b1fe8a0885mr1452041f8f.23.1751448325514;
        Wed, 02 Jul 2025 02:25:25 -0700 (PDT)
Message-ID: <9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com>
Date: Wed, 2 Jul 2025 11:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/17] xen/riscv: Implement superpage splitting for p2m
 mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <7cdd3272f2eba32dfa00be4fd72da6921eac243d.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7cdd3272f2eba32dfa00be4fd72da6921eac243d.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> Add support for down large memory mappings ("superpages") in the RISC-V
> p2m mapping so that smaller, more precise mappings ("finer-grained entries")
> can be inserted into lower levels of the page table hierarchy.
> 
> To implement that the following is done:
> - Introduce p2m_split_superpage(): Recursively shatters a superpage into
>   smaller page table entries down to the target level, preserving original
>   permissions and attributes.
> - __p2m_set_entry() updated to invoke superpage splitting when inserting
>   entries at lower levels within a superpage-mapped region.
> 
> This implementation is based on the ARM code, with modifications to the part
> that follows the BBM (break-before-make) approach. Unlike ARM, RISC-V does
> not require BBM, so there is no need to invalidate the PTE and flush the
> TLB before updating it with the newly created, split page table.

But some flushing is going to be necessary. As long as you only ever do
global flushes, the one after the individual PTE modification (within the
split table) will do (if BBM isn't required, see below), but once you move
to more fine-grained flushing, that's not going to be enough anymore. Not
sure it's a good idea to leave such a pitfall.

As to (no need for) BBM: I couldn't find anything to that effect in the
privileged spec. Can you provide some pointer? What I found instead is e.g.
this sentence: "To ensure that implicit reads observe writes to the same
memory locations, an SFENCE.VMA instruction must be executed after the
writes to flush the relevant cached translations." And this: "Accessing the
same location using different cacheability attributes may cause loss of
coherence." (This may not only occur when the same physical address is
mapped twice at different VAs, but also after the shattering of a superpage
when the new entry differs in cacheability.)

> Additionally, the page table walk logic has been adjusted, as ARM uses the
> opposite walk order compared to RISC-V.

I think you used some similar wording already in an earlier patch. I find
this confusing: Walk order is, aiui, the same. It's merely the numbering
of levels that is the opposite way round, isn't it?

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
>    functionality" which was splitted to smaller.
>  - Update the commit above the cycle which creates new page table as
>    RISC-V travserse page tables in an opposite to ARM order.
>  - RISC-V doesn't require BBM so there is no needed for invalidating
>    and TLB flushing before updating PTE.
> ---
>  xen/arch/riscv/p2m.c | 102 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
> index 87dd636b80..79c4473f1f 100644
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -743,6 +743,77 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>      p2m_free_page(p2m->domain, pg);
>  }
>  
> +static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
> +                                unsigned int level, unsigned int target,
> +                                const unsigned int *offsets)
> +{
> +    struct page_info *page;
> +    unsigned int i;
> +    pte_t pte, *table;
> +    bool rv = true;
> +
> +    /* Convenience aliases */
> +    mfn_t mfn = pte_get_mfn(*entry);
> +    unsigned int next_level = level - 1;
> +    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
> +
> +    /*
> +     * This should only be called with target != level and the entry is
> +     * a superpage.
> +     */
> +    ASSERT(level > target);
> +    ASSERT(p2me_is_superpage(p2m, *entry, level));
> +
> +    page = p2m_alloc_page(p2m->domain);
> +    if ( !page )
> +        return false;
> +
> +    page_list_add(page, &p2m->pages);

Is there a reason this list maintenance isn't done in p2m_alloc_page()?

> +    table = __map_domain_page(page);
> +
> +    /*
> +     * We are either splitting a second level 1G page into 512 first level
> +     * 2M pages, or a first level 2M page into 512 zero level 4K pages.
> +     */
> +    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
> +    {
> +        pte_t *new_entry = table + i;
> +
> +        /*
> +         * Use the content of the superpage entry and override
> +         * the necessary fields. So the correct permission are kept.
> +         */
> +        pte = *entry;
> +        pte_set_mfn(&pte, mfn_add(mfn, i << level_order));

While okay as long as you only permit superpages up to 1G, this is another
trap for someone to fall into: Imo i would better be unsigned long right
away, considering that RISC-V permits large pages at all levels.

> +        write_pte(new_entry, pte);
> +    }
> +
> +    /*
> +     * Shatter superpage in the page to the level we want to make the
> +     * changes.
> +     * This is done outside the loop to avoid checking the offset to
> +     * know whether the entry should be shattered for every entry.
> +     */
> +    if ( next_level != target )
> +        rv = p2m_split_superpage(p2m, table + offsets[next_level],
> +                                 level - 1, target, offsets);

I don't understand the comment: Under what conditions would every entry
need (further) shattering? And where's that happening? Or is this merely
a word ordering issue in the sentence, and "for every entry" wants
moving ahead? (In that case I'm unconvinced this is in need of commenting
upon.)

> +    /* TODO: why it is necessary to have clean here? Not somewhere in the caller */
> +    if ( p2m->clean_pte )
> +        clean_dcache_va_range(table, PAGE_SIZE);
> +
> +    unmap_domain_page(table);

Again likely not something that wants taking care of right away, but there
again is an inefficiency here: The caller almost certainly wants to map
the same page again, to update the one entry that caused the request to
shatter the page.

> +    /*
> +     * Even if we failed, we should install the newly allocated PTE
> +     * entry. The caller will be in charge to free the sub-tree.
> +     */
> +    p2m_write_pte(entry, page_to_p2m_table(p2m, page), p2m->clean_pte);

Why would it be wrong to free the page right here, vacating the entry at
the same time (or leaving just that to the caller)? (IOW - if this is an
implementation decision of yours, I think the word "should" would want
dropping.) After all, the caller invoking p2m_free_entry() on the thus
split PTE is less efficient (needs to iterate over all entries) than on
the original one (where it's just a single superpage).

> @@ -806,7 +877,36 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
>       */
>      if ( level > target )

This condition is likely too strong, unless you actually mean to also
split a superpage if it really wouldn't need splitting (new entry written
still fitting with the superpage mapping, i.e. suitable MFN and same
attributes).

>      {
> -        panic("Shattering isn't implemented\n");
> +        /* We need to split the original page. */
> +        pte_t split_pte = *entry;
> +
> +        ASSERT(p2me_is_superpage(p2m, *entry, level));
> +
> +        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
> +        {
> +            /* Free the allocated sub-tree */
> +            p2m_free_entry(p2m, split_pte, level);
> +
> +            rc = -ENOMEM;
> +            goto out;
> +        }
> +
> +        p2m_write_pte(entry, split_pte, p2m->clean_pte);
> +
> +        /* Then move to the level we want to make real changes */
> +        for ( ; level < target; level++ )

Don't you mean to move downwards here? At which point I wonder: Did you test
this code?

> +        {
> +            rc = p2m_next_level(p2m, true, level, &table, offsets[level]);
> +
> +            /*
> +             * The entry should be found and either be a table
> +             * or a superpage if level 0 is not targeted
> +             */
> +            ASSERT(rc == GUEST_TABLE_NORMAL ||
> +                   (rc == GUEST_TABLE_SUPER_PAGE && target > 0));
> +        }

This, too, is inefficient (but likely good enough as a starting point): You walk
tables twice - first when splitting, and then again when finding the target level.

Considering the enclosing if(), this also again is a do/while() candidate.

Jan

