Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9633AFACF2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 09:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035256.1407473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYg9A-00082b-F9; Mon, 07 Jul 2025 07:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035256.1407473; Mon, 07 Jul 2025 07:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYg9A-0007zz-Az; Mon, 07 Jul 2025 07:20:16 +0000
Received: by outflank-mailman (input) for mailman id 1035256;
 Mon, 07 Jul 2025 07:20:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYg98-0007zs-NE
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 07:20:14 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d24c7c22-5b02-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 09:20:12 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so1138117f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 00:20:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce35ccbaasm8446080b3a.41.2025.07.07.00.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 00:20:11 -0700 (PDT)
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
X-Inumbo-ID: d24c7c22-5b02-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751872812; x=1752477612; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t3Amatksh5tktANQvYCkbDa2ehnv3404PK+f65Nuy+E=;
        b=S6wyHJ86815EzsK5U53HHutCRY5b1/XJ0SB8GckuVeD7ggmpJFiWlp0vO8BT3ANPyw
         MZlAEvC6HKW0nnTAjVXyVdr0OEVptKcBz9PsXEVWoG7UAECIaMK1tDQM01ow7lYaNKuI
         NWns/hg0vRQ5Sy9597U7zRQqhcOwqMgUEtboUnUqyoGsY6euveSNA+1rfv15Ua0hoTOj
         7LakErBpppa5wnQOmpPJvKuB8y+MEyndJ5A20kQ+XueeYnrsbLj9aegl4zYiCd8p94so
         NEJiJgdRQazPCUSDHuDUpSm127fZPDfeB8RIC4fzHNH32KeCo6d4GdPNnkMM0PWZSLd5
         fu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751872812; x=1752477612;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3Amatksh5tktANQvYCkbDa2ehnv3404PK+f65Nuy+E=;
        b=eSWhWI5J8mtjyH0aYJ0J/CbY3yG/yv0w1h876jhma8ZdLrjY0Tu0WYDevjCvrCf78H
         Mvh1kLz8B7k6m5ZEr68iwdVMYJg4wN25VtGPJ9Mt37TyY8eGuAc2flEQS61lUy7smE/Y
         dJ9IA+sH/EoZuloLpACPUR9ygCW8jxYj2Mh2fLhDNPF+sKaoAqX++lg1HlvoAPwSNg2g
         n26TWExsJxLGIRga93qnG/ael5k/WmQA/KLj1v1qGtELKIsLRZoBB69ThyYJrHbojpUb
         CBrfV9mBuFCHeVh5o2cD3GE7WE+7dPr0c7h8k4Ql7cScjyg28j0NyMvciSJCbuB4+rre
         KjJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIzQ4zzKJaTXzocyeuQ+yuf8HVy1YHi85eIQpjRB/ACRf/GbwlTxs/tAwMWeVgP6eN1iyGpFztWhE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdJ1HpI3/TFbRWyhmIuC3BRjNY/QJH2kJ5csxacMkF7INNGMzz
	lYAq9L17cooPo6ErpFifdbPW1Oe3fMIQKWN+yqGkKdNxw38/oMVB4q900q3t85ox/w==
X-Gm-Gg: ASbGncuRYVcKABBjxEEhBvVfab8xk2MQpJzTqasEgyzlHprPhHGhs4dhQc2TwqoN2Aw
	pSlpOwZ/oZrgKO8Spbpt67KOeA3/uYHUz0ph5FN8uJ90DxGgFvwtT41hGVXeHAsplSbzolFCyd3
	ZvsdomyAXAltlb1AbTtm8AN09PLcMkHClZoo4pytaBC8Yt2bPkPi9uWe19UL66eeu/OsqyHgQpR
	HVLpx8V8Uj2b0mTzwN1eySMd3jDNQnJXJpNcRWw7gjyBj1FQ6tPjMz9JjOJ4gelvr1YTHjm7W65
	7exO//NizGALv3LB2n0FmLvktMUVaQmQsfRLhnTzNigTUT1Ag9J5Qt3qFoWmhYOMzbEEKBf5xFy
	fCH2nQD0MXLmjKsaOxxQ7SrFlCGSM32G+VZYChqQyzSB2aRNqemQ0TNi8Vw==
X-Google-Smtp-Source: AGHT+IFF8d+1yKTjfz74euXZtjX9V0h0FvJHAAMmt5wn5ztAzEad0N8x/8KbUGoBuq5crxmeb0CJ1Q==
X-Received: by 2002:a05:6000:41c8:b0:3a6:cfca:efee with SMTP id ffacd0b85a97d-3b49aa1ede0mr5464260f8f.17.1751872811842;
        Mon, 07 Jul 2025 00:20:11 -0700 (PDT)
Message-ID: <2afe5641-0790-4f27-823b-ab941ad2c971@suse.com>
Date: Mon, 7 Jul 2025 09:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/17] xen/riscv: implement p2m_set_entry() and
 __p2m_set_entry()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <7826732d2f6aa5888758942165f0f1e73fa84ffa.1749555949.git.oleksii.kurochko@gmail.com>
 <31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com>
 <674c9f82-f486-4cca-991b-3ac3da3a237d@gmail.com>
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
In-Reply-To: <674c9f82-f486-4cca-991b-3ac3da3a237d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.07.2025 17:01, Oleksii Kurochko wrote:
> On 7/1/25 3:49 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> This patch introduces p2m_set_entry() and its core helper __p2m_set_entry() for
>>> RISC-V, based loosely on the Arm implementation, with several RISC-V-specific
>>> modifications.
>>>
>>> Key differences include:
>>> - TLB Flushing: RISC-V allows caching of invalid PTEs and does not require
>>>    break-before-make (BBM). As a result, the flushing logic is simplified.
>>>    TLB invalidation can be deferred until p2m_write_unlock() is called.
>>>    Consequently, the p2m->need_flush flag is always considered true and is
>>>    removed.
>>> - Page Table Traversal: The order of walking the page tables differs from Arm,
>>>    and this implementation reflects that reversed traversal.
>>> - Macro Adjustments: The macros P2M_ROOT_LEVEL, P2M_ROOT_ORDER, and
>>>    P2M_ROOT_PAGES are updated to align with the new RISC-V implementation.
>>>
>>> The main functionality is in __p2m_set_entry(), which handles mappings aligned
>>> to page table block entries (e.g., 1GB, 2MB, or 4KB with 4KB granularity).
>>>
>>> p2m_set_entry() breaks a region down into block-aligned mappings and calls
>>> __p2m_set_entry() accordingly.
>>>
>>> Stub implementations (to be completed later) include:
>>> - p2m_free_entry()
>> What would a function of this name do?
> 
> Recursively visiting all leaf PTE's for sub-tree behind an entry, then calls
> put_page() (which will free if there is no any reference to this page),
> freeing intermediate page table (after all entries were freed) by removing
> it from d->arch.paging.freelist, and removes correspondent page of intermediate page
> table from p2m->pages list.
> 
>> You can clear entries, but you can't
>> free them, can you?
> 
> Is is a question regarding terminology?

Yes. If one sees a call to a function, it should be possible to at least
roughly know what it does without needing to go look at the implementation.

> I can't free entry itself, but a page table or
> a page (if it is a leaf entry) on which it points could free.

Then e.g. pte_free_subtree() or some such?

>>> +static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>> The rule of thumb is to have inline functions only in header files, leaving
>> decisions to the compiler elsewhere.
> 
> I am not sure what you mean in the second part (after coma) of your sentence.

The compiler does its own inlining decisions quite fine when it can see all
call sites (as is the case for static functions). Hence in general you want
to omit "inline" there. Except of course in header files, where non-inline
static-s are a problem.

>>> +{
>>> +    panic("%s: isn't implemented for now\n", __func__);
>>> +
>>> +    return false;
>>> +}
>> For this function in particular, though: Besides the "p2me" in the name
>> being somewhat odd (supposedly page table entries here are simply pte_t),
>> how is this going to be different from pte_is_valid()?
> 
> pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
> what is a type stored in the radix tree (p2m->p2m_types):
>    /*
>     * In the case of the P2M, the valid bit is used for other purpose. Use
>     * the type to check whether an entry is valid.
>     */
>    static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>    {
>        return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>    }
> 
> It is done to track which page was modified by a guest.

But then (again) the name doesn't convey what the function does. Plus
can't a guest also arrange for an entry's type to move to p2m_invalid?
That's then still an entry that was modified by the guest.

Overall I think I'm lacking clarity what you mean to use this predicate
for.

>>> +static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
>>> +{
>>> +    write_pte(p, pte);
>>> +    if ( clean_pte )
>>> +        clean_dcache_va_range(p, sizeof(*p));
>>> +}
>>> +
>>> +static inline void p2m_remove_pte(pte_t *p, bool clean_pte)
>>> +{
>>> +    pte_t pte;
>>> +
>>> +    memset(&pte, 0x00, sizeof(pte));
>>> +    p2m_write_pte(p, pte, clean_pte);
>>> +}
>> May I suggest "clear" instead of "remove" and plain 0 instead of 0x00
>> (or simply give the variable a trivial initializer)?
> 
> Sure, I will rename and use plain 0.
> 
>>
>> As to the earlier function that I commented on: Seeing the names here,
>> wouldn't p2m_pte_is_valid() be a more consistent name there?
> 
> Then all p2me_*() should be updated to p2m_pte_*().
> 
> But initial logic was that p2me = p2m entry = p2m page table entry.
> 
> Probably we can just return back to the prefix p2m_ as based on arguments
> it is clear that it is a function for working with P2M's PTE.

In the end it's up to you. Having thought about it some more, perhaps
p2me_*() is still quite helpful to separate from functions dealing with
P2Ms as a while, and to also avoid the verbosity of p2m_pte_*().

>>> +{
>>> +    unsigned int level;
>>> +    unsigned int target = page_order / PAGETABLE_ORDER;
>>> +    pte_t *entry, *table, orig_pte;
>>> +    int rc;
>>> +    /* A mapping is removed if the MFN is invalid. */
>>> +    bool removing_mapping = mfn_eq(smfn, INVALID_MFN);
>>> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(sgfn));
>>> +
>>> +    ASSERT(p2m_is_write_locked(p2m));
>>> +
>>> +    /*
>>> +     * Check if the level target is valid: we only support
>>> +     * 4K - 2M - 1G mapping.
>>> +     */
>>> +    ASSERT(target <= 2);
>> No provisions towards the division that produced the value having left
>> a remainder?
> 
> The way the order is initialized will always result in division without
> a remainder.
> 
> If it makes sense, the|ASSERT()| could be updated to ensure that the order
> is always a multiple of|PAGETABLE_ORDER|:
>    ASSERT((target <= 2) && !IS_ALIGNED(page_order, PAGETABLE_ORDER));

Except that the ! looks wrong here.

>>> @@ -332,7 +542,55 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>>                            p2m_type_t t,
>>>                            p2m_access_t a)
>>>   {
>>> -    return -EOPNOTSUPP;
>>> +    int rc = 0;
>>> +
>>> +    /*
>>> +     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
>>> +     * be dropped in relinquish_p2m_mapping(). As the P2M will still
>>> +     * be accessible after, we need to prevent mapping to be added when the
>>> +     * domain is dying.
>>> +     */
>>> +    if ( unlikely(p2m->domain->is_dying) )
>>> +        return -ENOMEM;
>> Why ENOMEM?
> 
> I expect that when a domain is dying, it means there’s no point in using its
> memory—either because it's no longer available or it has already been freed.
> Basically, no memory.

That can end up odd for call sites. Please consider using e.g. EACCES.

>>> +    while ( nr )
>> Why's there a loop here? The function name uses singular, i.e. means to
>> create exactly one entry.
> 
> I will rename the function to  p2m_set_entries().

Or maybe p2m_set_range()?

>>> +        /*
>>> +         * Don't take into account the MFN when removing mapping (i.e
>>> +         * MFN_INVALID) to calculate the correct target order.
>>> +         *
>>> +         * XXX: Support superpage mappings if nr is not aligned to a
>>> +         * superpage size.
>>> +         */
>> Does this really need leaving as a to-do?
> 
> I think so, yes. It won’t break the current workflow if|nr| isn’t aligned,
> a smaller order will simply be chosen.

Well, my question was more like "Isn't it simple enough to cover the case
right away?"

>>> +        mask = !mfn_eq(smfn, INVALID_MFN) ? mfn_x(smfn) : 0;
>>> +        mask |= gfn_x(sgfn) | nr;
>>> +
>>> +        for ( ; i != 0; i-- )
>>> +        {
>>> +            if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) )
>>> +            {
>>> +                    order = XEN_PT_LEVEL_ORDER(i);
>>> +                    break;
>> Nit: Style.
>>
>>> +            }
>>> +        }
>>> +
>>> +        rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
>>> +        if ( rc )
>>> +            break;
>>> +
>>> +        sgfn = gfn_add(sgfn, (1 << order));
>>> +        if ( !mfn_eq(smfn, INVALID_MFN) )
>>> +           smfn = mfn_add(smfn, (1 << order));
>>> +
>>> +        nr -= (1 << order);
>> Throughout maybe better be safe right away and use 1UL?
>>
>>> +    }
>>> +
>>> +    return rc;
>>>   }
>> How's the caller going to know how much of the range was successfully
>> mapped?
> 
> There is no such option. Do other arches do that? I mean returns somehow
> the number of successfully mapped (sgfn,smfn).

On x86 we had to introduce some not very nice code to cover for the absence
of proper handling there. For a new port I think it wants at least seriously
considering not to repeat such a potentially unhelpful pattern.

>> That part may need undoing (if not here, then in the caller),
>> or a caller may want to retry.
> 
> So the caller in the case if rc != 0, can just undoing the full range
> (by using the same sgfn, nr, smfn).

Can it? How would it know what the original state was?

Jan

