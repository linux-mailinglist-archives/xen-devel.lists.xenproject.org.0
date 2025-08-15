Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD4EB2802F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 14:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083428.1443029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umttK-0007lT-9d; Fri, 15 Aug 2025 12:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083428.1443029; Fri, 15 Aug 2025 12:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umttK-0007jM-6Z; Fri, 15 Aug 2025 12:50:42 +0000
Received: by outflank-mailman (input) for mailman id 1083428;
 Fri, 15 Aug 2025 12:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umttI-0007j7-Ky
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 12:50:40 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7202de94-79d6-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 14:50:39 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso341614366b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 05:50:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53d6csm141097666b.6.2025.08.15.05.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 05:50:38 -0700 (PDT)
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
X-Inumbo-ID: 7202de94-79d6-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755262239; x=1755867039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nT0wgmYg8j+TzXp9Jbb3VAX/4UIOVz3rjXWQslB704g=;
        b=TwqHmG43m5U+Uo8B7WZ2X5GGxich/sdUfPwXq5ivjft6soSrcVuWdVSyjlFxEK+wb1
         UXGh+qkH7LPmTmQelu1CMaOzLhSeX0FZYDWpx4M7wRMhiEkhHghjSFmskX3XSoD0PUmv
         nCQpyi6XYsi7nRtE1L5dwzL+qJQNp9KIxoyBXq5hSOi7fT3C3sW43k20cJbOQVNAtBji
         CAVuVNZ7altTOEhw+75P53OOIzRMSse/VlVSfL5CjXd60f2lY93rFCHXRwesgkObtNp6
         vpTCDkf17FGoZdSfP7NvnxDjLzbTBMXNyCXWIOxRQ/zE35VH/x2cW8BobePHu+xMsTAa
         DZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755262239; x=1755867039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nT0wgmYg8j+TzXp9Jbb3VAX/4UIOVz3rjXWQslB704g=;
        b=beGOnrsEvM5L255abnUcPbhCYNycsqHbg7LqhE8OOKnDidCpGjpxhw56qhiYWavTJy
         L6+UeofHaAGKMryx0QsPFrRltb3JYigPkJjGq5enJtgbmD9+yrZSaVI3PV3glMR5wyLG
         /uw5+PMIiDk8swYCn/hvZMAXxshge2DFL2aCf9HlTFMk5DE6hOR4XgJJtdENhxQFpNw5
         lVOBd2SWk1XHCG/XmjVbw/CEfx/obeyE2+HS1Xvuw2dj1sA+pEVYnlJQRd8k8ScIJqZ6
         elIlyw5uj8FUyBYOSKVX6bjZmzdcN9Abv1yk4tYaOnn52aLuvM6Y4Ab1DweHUWzxzl3a
         4sfw==
X-Forwarded-Encrypted: i=1; AJvYcCV1dYGtA8VBSi1FuWAlqEkN7P8nzxtgCPoVo9fWRcVoMXLtudGD/O14ptxRd20CFoF29S5vQONdrUU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4XpcdyjHxNEjWD4gwy8aGsPuxejxdZ3pHz8R+wvtMj4C1WiDF
	HCQRqs0BnYp+hke8axE0MwYD4JGjUMUvCyjGoPl8tYa/pV6DIrZPo3xg9gxE6LiSyQ==
X-Gm-Gg: ASbGncukTl6mhXh70OSSrmzTmJX4tCKgajn+x60gi8cZtIAP/JGLFtpnAZG2OY0TXWp
	mo/aVlZVEXXG395xg0sdg+WNXd7Rf5fIvnB0xMb0j0StUyU6r7qT7aEERZnwYJV6tMFuW50QBsR
	Wg4xWDir9oLIaQVtG7zMrmUY+qGF6GIegWJ48O2s50zkAb/9V8UrNEwOcM0xjiHtGBKMt2kOEIq
	pSN6Yd65Q/vIKMOYZRcbtAjb8dMpfnRQm7Z0J2ELm9nFgya7D+TBque1zYT4arPM1oYOdQkR6bJ
	+WulVxHMlxtF31VDFiQam9spCB14KZcUr0Dr4NjXnmINsHXwKu7KG1N4d6YSYBG24YGyQVVpl/O
	LLc1YFzzJMCD1jXdzMmPD5OtaY8OI79ka78OYZ3inLt9eIo1TU9KJ8zDAf6TlqjA8y9KhY3/02i
	NFw1DqfZDP7Rii28+sMqhlBfRMAY1u
X-Google-Smtp-Source: AGHT+IETPFNEnCRq4rfgGn5gxKvU85F4cyOibzYcOv/AACLt5d4ooLfoZS1K5VYvcpu9q5z6qlafCg==
X-Received: by 2002:a17:907:3e1a:b0:adb:428f:f748 with SMTP id a640c23a62f3a-afcdc1a3731mr164850766b.21.1755262238505;
        Fri, 15 Aug 2025 05:50:38 -0700 (PDT)
Message-ID: <da08c994-f14d-4fce-9b4e-8f97103e9acf@suse.com>
Date: Fri, 15 Aug 2025 14:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/20] xen/riscv: implement p2m_set_range()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <ea69584222a4c41eac276de1ec8eed25b13642d3.1753973161.git.oleksii.kurochko@gmail.com>
 <f217021e-1fef-4324-a56e-529fd29b4c69@suse.com>
 <62a3c3ef-1f19-4fac-b967-f7730e8f235f@gmail.com>
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
In-Reply-To: <62a3c3ef-1f19-4fac-b967-f7730e8f235f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2025 11:52, Oleksii Kurochko wrote:
> On 8/5/25 6:04 PM, Jan Beulich wrote:
>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>> This patch introduces p2m_set_range() and its core helper p2m_set_entry() for
>> Nit: This patch doesn't introduce p2m_set_range(); it merely fleshes it out.
>>
>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>> @@ -7,11 +7,13 @@
>>>   #include <xen/rwlock.h>
>>>   #include <xen/types.h>
>>>   
>>> +#include <asm/page.h>
>>>   #include <asm/page-bits.h>
>>>   
>>>   extern unsigned int p2m_root_order;
>>>   #define P2M_ROOT_ORDER  p2m_root_order
>>>   #define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
>>> +#define P2M_ROOT_LEVEL  HYP_PT_ROOT_LEVEL
>> I think I commented on this before, and I would have hoped for at least a remark
>> in the description to appear (perhaps even a comment here): It's okay(ish) to tie
>> these together for now, but in the longer run I don't expect this is going to be
>> wanted. If e.g. we ran Xen in Sv57 mode, there would be no reason at all to force
>> all P2Ms to use 5 levels of page tables.
> 
> Do you mean that for G-stage it could be chosen any SvXX mode to limit an amount
> of page tables necessary for G-stage? If yes, then, at least, I agree that a
> comment should be added or, probably, "#warning optimize an amount of p2m root level
> for MMU mode > Sv48" (or maybe >=).

Yes.

> Or do you mean if we set hgatp.mode=Sv57 then it is possible to limit an amount of
> page table's levels to use? In this case I think hardware still will expect to see
> 5 levels of page tables.

No.

>>> +static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
>>> +{
>>> +    write_pte(p, pte);
>>> +    if ( clean_pte )
>>> +        clean_dcache_va_range(p, sizeof(*p));
>> Not necessarily for right away, but if multiple adjacent PTEs are
>> written without releasing the lock, this then redundant cache flushing
>> can be a performance issue.
> 
> Can't it be resolved on a caller side? Something like:
>    p2m_write_pte(p1, pte1, false);
>    p2m_write_pte(p2, pte2, false);
>    p2m_write_pte(p3, pte3, false);
>    p2m_write_pte(p4, pte4, true);
> where p1-p4 are adjacent.

No. You wouldn't know whether the last write flushes what the earlier
three have written. There may be a cacheline boundary in between. Plus
I didn't really think of back-to-back writes, but e.g. a loop doing
many of them, where a single wider flush may then be more efficient.

>>> +#define P2M_TABLE_MAP_NONE 0
>>> +#define P2M_TABLE_MAP_NOMEM 1
>>> +#define P2M_TABLE_SUPER_PAGE 2
>>> +#define P2M_TABLE_NORMAL 3
>>> +
>>> +/*
>>> + * Take the currently mapped table, find the corresponding the entry
>>> + * corresponding to the GFN, and map the next table, if available.
>> Nit: Double "corresponding".
>>
>>> + * The previous table will be unmapped if the next level was mapped
>>> + * (e.g P2M_TABLE_NORMAL returned).
>>> + *
>>> + * `alloc_tbl` parameter indicates whether intermediate tables should
>>> + * be allocated when not present.
>>> + *
>>> + * Return values:
>>> + *  P2M_TABLE_MAP_NONE: a table allocation isn't permitted.
>>> + *  P2M_TABLE_MAP_NOMEM: allocating a new page failed.
>>> + *  P2M_TABLE_SUPER_PAGE: next level or leaf mapped normally.
>>> + *  P2M_TABLE_NORMAL: The next entry points to a superpage.
>>> + */
>>> +static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>>> +                          unsigned int level, pte_t **table,
>>> +                          unsigned int offset)
>>> +{
>>> +    panic("%s: hasn't been implemented yet\n", __func__);
>>> +
>>> +    return P2M_TABLE_MAP_NONE;
>>> +}
>>> +
>>> +/* Free pte sub-tree behind an entry */
>>> +static void p2m_free_subtree(struct p2m_domain *p2m,
>>> +                             pte_t entry, unsigned int level)
>>> +{
>>> +    panic("%s: hasn't been implemented yet\n", __func__);
>>> +}
>>> +
>>> +/*
>>> + * Insert an entry in the p2m. This should be called with a mapping
>>> + * equal to a page/superpage.
>>> + */
>>> +static int p2m_set_entry(struct p2m_domain *p2m,
>>> +                           gfn_t gfn,
>>> +                           unsigned long page_order,
>>> +                           mfn_t mfn,
>>> +                           p2m_type_t t)
>>> +{
>>> +    unsigned int level;
>>> +    unsigned int target = page_order / PAGETABLE_ORDER;
>>> +    pte_t *entry, *table, orig_pte;
>>> +    int rc;
>>> +    /* A mapping is removed if the MFN is invalid. */
>>> +    bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
>> Comment and code don't fit together. Many MFNs are invalid (any for which
>> mfn_valid() returns false), yet you only check for INVALID_MFN here.
> 
> Probably, it makes sense to add an|ASSERT()| here for the case when
> |mfn_valid(mfn)| is false, but the MFN is not explicitly equal to|INVALID_MFN|.
> This would indicate that someone attempted to perform a mapping with an
> incorrect MFN, which, IMO, is entirely wrong.

No, and we've been there before. MMIO can live anywhere, and mappings for
such still will need to be permitted. It is correct to check only for
INVALID_MFN here imo; it's just the comment which also needs to reflect
that.

>>> +    /*
>>> +     * If we are here with level > target, we must be at a leaf node,
>>> +     * and we need to break up the superpage.
>>> +     */
>>> +    if ( level > target )
>>> +    {
>>> +        panic("Shattering isn't implemented\n");
>>> +    }
>>> +
>>> +    /*
>>> +     * We should always be there with the correct level because all the
>>> +     * intermediate tables have been installed if necessary.
>>> +     */
>>> +    ASSERT(level == target);
>>> +
>>> +    orig_pte = *entry;
>>> +
>>> +    if ( removing_mapping )
>>> +        p2m_clean_pte(entry, p2m->clean_pte);
>>> +    else
>>> +    {
>>> +        pte_t pte = p2m_pte_from_mfn(mfn, t);
>>> +
>>> +        p2m_write_pte(entry, pte, p2m->clean_pte);
>>> +
>>> +        p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn,
>>> +                                      gfn_add(gfn, BIT(page_order, UL) - 1));
>>> +        p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, gfn);
>>> +    }
>>> +
>>> +    p2m->need_flush = true;
>>> +
>>> +    /*
>>> +     * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
>>> +     * is not ready for RISC-V support.
>>> +     *
>>> +     * When CONFIG_HAS_PASSTHROUGH=y, iommu_iotlb_flush() should be done
>>> +     * here.
>>> +     */
>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>> +#   error "add code to flush IOMMU TLB"
>>> +#endif
>>> +
>>> +    rc = 0;
>>> +
>>> +    /*
>>> +     * Free the entry only if the original pte was valid and the base
>>> +     * is different (to avoid freeing when permission is changed).
>>> +     */
>>> +    if ( pte_is_valid(orig_pte) &&
>>> +         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
>> I'm puzzled by this 2nd check: A permission change would - I expect - only
>> occur to a leaf entry. If the new entry is a super-page one and the old
>> wasn't, don't you still need to free the sub-tree, no matter whether the
>> MFNs are the same?
> 
> I expect the MFNs to differ in this scenario, so the old sub-tree will be freed.

You expecting something isn't a good criteria. If it's possible, even if
unexpected (by you), it needs dealing with correctly.

> Based on your example (new entry is super-page and old entry isn't):
> For old mapping (lets say, 4 KiB leaf) p2m_set_entry() walks all levels down
> to L0, so we will have the following MMU page table walks:
>    L2 PTE -> L1 PTE (MFN of L0 page table) -> L0 PTE -> RAM
> 
> When new mapping (lets say, 2 MiB superpage) will be requested, p2m_set_entry()
> will stop at L1 (the superpage level):
>   L2 PTE -> L1 PTE (at this moment, L1 PTE points to L0 page table, which
>                     points to RAM)
> Then the old L1 PTE will be saved in 'orig_pte', then writes 'entry' with
> the RAM MFN for the 2 MiB mapping. The walk becomes:
>    L2 PTE -> L1 PTE -> RAM
> 
> Therefore, 'entry' now holds an MFN pointing to RAM (superpage leaf). 'orig_pte'
> still holds an MFN pointing to the L0 table (the old sub-tree). Since these MFNs
> differ, the code calls p2m_free_subtree(p2m, orig_pte, …) and frees the old L0
> sub-tree.

A particular example doesn't help. All possible cases need handling correctly.

>>   Plus consider the special case of MFN 0: If you clear
>> an entry using MFN 0, you will find old and new PTEs' both having the same
>> MFN.
> 
> Isn't this happen only when a mapping removal is explicitly requested?
> In the case of a mapping removal it seems to me it is enough just to
> clear PTE with all zeroes.

Correct. Which means original MFN (PPN) and new MFN (PPN) would match.

Jan

