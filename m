Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBF3B037AB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 09:15:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042577.1412632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDPS-0002dr-AM; Mon, 14 Jul 2025 07:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042577.1412632; Mon, 14 Jul 2025 07:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDPS-0002ai-74; Mon, 14 Jul 2025 07:15:34 +0000
Received: by outflank-mailman (input) for mailman id 1042577;
 Mon, 14 Jul 2025 07:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubDPQ-0002ac-Eo
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 07:15:32 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5386876c-6082-11f0-a318-13f23c93f187;
 Mon, 14 Jul 2025 09:15:31 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so2098874f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 00:15:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4335c8asm93739775ad.167.2025.07.14.00.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 00:15:29 -0700 (PDT)
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
X-Inumbo-ID: 5386876c-6082-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752477331; x=1753082131; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6eeBpOuMJnXfJd812AeFTTjgfIJmbAEXB60hOtNWerg=;
        b=aVUiM94qVhwxtxMyoIF+6KRqfjy711BFdufrXovQW/Ddw4whx42oJGdhUQPfx9GbnX
         Nf69uhj9pvDPxPacewEyDvsrRfmR+gl1K5YJ/t976c5lGe6tbJ2Uf0v7bwKxZp2oh+UF
         eqBFfRFjkwgFdV5B7lMufRxu5uqE+pUbuZy4ZOk+ENMK5OdzkQHggGYkALqsnzggz8u3
         Mq2VjpZg9UVzSMTDbQegI9fcrGAvQBF5sjYEx9ccoXOXrspsEPNCnYZwVEnDcA6FAWJF
         4rwDIIJcdJWEkGt/yNyFZlGW4wzpDLJ89fnvZ7o5rEBYUhx25VIHMmIAZ2d82f5pM0cQ
         BfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752477331; x=1753082131;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eeBpOuMJnXfJd812AeFTTjgfIJmbAEXB60hOtNWerg=;
        b=vhKmvZ595Yj43NTDVYwZ0RX+Ry+nN+B2YYF9iEfl94L7oc2FuhqNRYY/wx+snT6sMl
         T8nrCYGegV/dKY1g3gmTAsNq97JgZPjgy1NZYtzXn4s5+XcOoWJKMToD64rq9015MciX
         tQYlGBXBuUsVf27gHLXWgNRXF1sm4BfQvidFn2MdVzira5d8yB8L2EZAQn8o5McxcNlx
         pw9WI46MkU+V1knDvJI0FkOCNiUGdJwun5DMxufs5up2HlpwVZ18PQ4ALTru8z7B8dN6
         QJfz0Mdjv0H9joTQvSCkpfETkRYbrWZ2BjCS4197V9Db7s/4ZisvFy0UuvZih3kwNvSn
         UaMg==
X-Forwarded-Encrypted: i=1; AJvYcCUBgVhW96+qcERTahsSufQf3cTyaMTzKPoGCLAhiIAMb8o0Ag+x9RGNpFJbJYqNpQlSbwjPOqH4XCk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYq/eEH0ngJ4fyVcVTM3l5c0T/pKBBaOFhxtnTqgP/zv5Ew2S0
	EF5KxPO362W5HMmQv2YIhyUTlGL9Ccv4lQ5NC6E+7tNyeO3k2cdvw7NXtLrBUUTsvg==
X-Gm-Gg: ASbGncuiClLltSdX9ej/JWfPHJoIwsOellbg+kL1hCwak0AD5Gg0osmLIDcN3ddb140
	RAYt+5lJCKdcwxw6wwjbhYb4dS6QZiE31cCsgNFVOyFS+Imq34V6GWBiXYrZKxtJ0+TVqyCRT7s
	sO22d98HkoWIyP8A4lFahrrosyjmk9OTid3ajqj1MooLnUUDlAVTrHBfak4NkZgZMwLraxjMBcW
	3DzDx5H434FRPpMSQtjYfRalx26h8M87zFe5b2e/SWdTm4QaQQbcMyZPz59hisdlk9K9pW6xAdS
	4WDG+gF4FcqueGnp9PEn0uhJ7p4uR/cQ2uX3Jn96SSIqpeS6Xe++3Cj7JT39W2WQRVHTwdMm/sD
	nGYtTLJBanVC3rFNXx7BqVzK8+CTQanKphpeJPAMesFhnfEix4uA/HVdfRe+PCSGTF87Rf724di
	RR5hifgzI=
X-Google-Smtp-Source: AGHT+IGSvTm67paT2O+hhU96LRnuvbk77Hbd5AL1ge6H0ab9AP1LEfW9rqVgJRWUEtF6sGj4kIG1Bg==
X-Received: by 2002:a05:6000:230f:b0:3a6:cfca:efee with SMTP id ffacd0b85a97d-3b5f35305c9mr9330198f8f.17.1752477330431;
        Mon, 14 Jul 2025 00:15:30 -0700 (PDT)
Message-ID: <9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com>
Date: Mon, 14 Jul 2025 09:15:22 +0200
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
 <ec05b4c8-c328-4dc3-9f35-207421990893@suse.com>
 <de4ce9e3-c858-4ef6-917e-c9dd05bca02e@gmail.com>
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
In-Reply-To: <de4ce9e3-c858-4ef6-917e-c9dd05bca02e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 17:56, Oleksii Kurochko wrote:
> On 7/1/25 4:23 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> +/*
>>> + * In the case of the P2M, the valid bit is used for other purpose. Use
>>> + * the type to check whether an entry is valid.
>>> + */
>>>   static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>   {
>>> -    panic("%s: isn't implemented for now\n", __func__);
>>> +    return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>> +}
>> No checking of the valid bit?
> 
> As mentioned in the comment, only the P2M type should be checked, since the
> valid bit is used for other purposes we discussed earlier, for example, to
> track whether pages were accessed by a guest domain, or to support certain
> table invalidation optimizations (1) and (2).
> So, in this case, we only need to consider whether the entry is invalid
> from the P2M perspective.
> 
> (1)https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1245
> (2)https://github.com/xen-project/xen/blob/19772b67/xen/arch/arm/mmu/p2m.c#L1386

And there can be e.g. entries with the valid bit set and the type being
p2m_invalid? IOW there's no short-circuiting possible in any of the
possible cases, avoiding the radix tree lookup in at least some of the
cases?

>>> @@ -404,11 +426,127 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>>>       return GUEST_TABLE_MAP_NONE;
>>>   }
>>>   
>>> +static void p2m_put_foreign_page(struct page_info *pg)
>>> +{
>>> +    /*
>>> +     * It's safe to do the put_page here because page_alloc will
>>> +     * flush the TLBs if the page is reallocated before the end of
>>> +     * this loop.
>>> +     */
>>> +    put_page(pg);
>> Is the comment really true? The page allocator will flush the normal
>> TLBs, but not the stage-2 ones. Yet those are what you care about here,
>> aiui.
> 
> In alloc_heap_pages():
>   ...
>       if ( need_tlbflush )
>          filtered_flush_tlb_mask(tlbflush_timestamp);
>   ...
>   
> filtered_flush_tlb_mask() calls arch_flush_tlb_mask().
> 
> and arch_flush_tlb_mask(), at least, on Arm (I haven't checked x86) is
> implented as:
>    void arch_flush_tlb_mask(const cpumask_t *mask)
>    {
>        /* No need to IPI other processors on ARM, the processor takes care of it. */
>        flush_all_guests_tlb();
>    }
> 
> So it flushes stage-2 TLB.

Hmm, okay. And I take it you have the same plan on RISC-V? What I'd like to
ask for, though, is that the comment (also) mentions where that (guest)
flushing actually happens. That's not in page_alloc.c, and it also wasn't
originally intended for guest TLBs to also be flushed from there (as x86 is
where the flush avoidance machinery originates, which Arm and now also
RISC-V don't really use).

>>> +/* Put any references on the single 4K page referenced by mfn. */
>>> +static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
>>> +{
>>> +    /* TODO: Handle other p2m types */
>>> +
>>> +    /* Detect the xenheap page and mark the stored GFN as invalid. */
>>> +    if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
>>> +        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
>> Is this a valid thing to do? How do you make sure the respective uses
>> (in gnttab's shared and status page arrays) are / were also removed?
> 
> As grant table frame GFN is stored directly in struct page_info instead
> of keeping it in standalone status/shared arrays, thereby there is no need
> for status/shared arrays.

I fear I don't follow. Looking at Arm's header (which I understand you
derive from), I see

#define gnttab_shared_page(t, i)   virt_to_page((t)->shared_raw[i])

#define gnttab_status_page(t, i)   virt_to_page((t)->status[i])

Are you intending to do things differently?

>>> +/* Put any references on the superpage referenced by mfn. */
>>> +static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
>>> +{
>>> +    struct page_info *pg;
>>> +    unsigned int i;
>>> +
>>> +    ASSERT(mfn_valid(mfn));
>>> +
>>> +    pg = mfn_to_page(mfn);
>>> +
>>> +    for ( i = 0; i < XEN_PT_ENTRIES; i++, pg++ )
>>> +        p2m_put_foreign_page(pg);
>>> +}
>>> +
>>> +/* Put any references on the page referenced by pte. */
>>> +static void p2m_put_page(struct p2m_domain *p2m, const pte_t pte,
>>> +                         unsigned int level)
>>> +{
>>> +    mfn_t mfn = pte_get_mfn(pte);
>>> +    p2m_type_t p2m_type = p2m_type_radix_get(p2m, pte);
>> This gives you the type of the 1st page. What guarantees that all other pages
>> in a superpage are of the exact same type?
> 
> Doesn't superpage mean that all the 4KB pages within that superpage have the
> same type and contiguous in memory?

If the mapping is a super-page one - yes. Yet I see nothing super-page-ish
here.

>>> +    if ( level == 1 )
>>> +        return p2m_put_2m_superpage(mfn, p2m_type);
>>> +    else if ( level == 0 )
>>> +        return p2m_put_4k_page(mfn, p2m_type);
>> Use switch() right away?
> 
> It could be, I think that no big difference at the moment, at least.
> But I am okay to rework it.

If you don't want to use switch() here, then my other style nit would
need giving: Please avoid "else" in situations like this.

>>> +static void p2m_free_page(struct domain *d, struct page_info *pg)
>>> +{
>>> +    if ( is_hardware_domain(d) )
>>> +        free_domheap_page(pg);
>> Why's the hardware domain different here? It should have a pool just like
>> all other domains have.
> 
> Hardware domain (dom0) should be no limit in the number of pages that can
> be allocated, so allocate p2m pages for hardware domain is done from heap.
> 
> An idea of p2m pool is to provide a way how to put clear limit and amount
> to the p2m allocation.

Well, we had been there on another thread, and I outlined how I think
Dom0 may want handling.

>>>   /* Free pte sub-tree behind an entry */
>>>   static void p2m_free_entry(struct p2m_domain *p2m,
>>>                              pte_t entry, unsigned int level)
>>>   {
>>> -    panic("%s: hasn't been implemented yet\n", __func__);
>>> +    unsigned int i;
>>> +    pte_t *table;
>>> +    mfn_t mfn;
>>> +    struct page_info *pg;
>>> +
>>> +    /* Nothing to do if the entry is invalid. */
>>> +    if ( !p2me_is_valid(p2m, entry) )
>>> +        return;
>> Does this actually apply to intermediate page tables (which you handle
>> later in the function), when that's (only) a P2M type check?
> 
> Yes, any PTE should have V bit set to 1, so from P2M perspective it also
> should be, at least, not equal to p2m_invalid.

I don't follow. Where would that type be set? The radix tree being GFN-
indexed, you would need to "invent" a GFN for every intermediate page table,
just to be able to (legitimately) invoke the type retrieval function. Maybe
you mean to leverage that (now, i.e. post-v2) you encode some of the types
directly in the PTE, and p2m_invalid may be one of them. But that wasn't
the case in the v2 submission, and hence the code looked wrong to me. Which
in turn suggests that at least some better commentary is going to be needed,
maybe even some BUILD_BUG_ON().

Jan

