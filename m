Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD48DBC17DF
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 15:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138812.1474418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v67hF-000188-Nu; Tue, 07 Oct 2025 13:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138812.1474418; Tue, 07 Oct 2025 13:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v67hF-00015l-L8; Tue, 07 Oct 2025 13:25:41 +0000
Received: by outflank-mailman (input) for mailman id 1138812;
 Tue, 07 Oct 2025 13:25:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v67hE-00015d-82
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 13:25:40 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cc6f9a6-a381-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 15:25:37 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso946734666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 06:25:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869c4e5d8sm1380091066b.82.2025.10.07.06.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 06:25:36 -0700 (PDT)
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
X-Inumbo-ID: 1cc6f9a6-a381-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759843537; x=1760448337; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2upZOfn+9XZKAVenT9IdSeeTsYpWOvhQECiAzLsOT9M=;
        b=BZJS906E0btZGu09SASWrkhgLW+INku72fSAufib1Jjsd5tqf54ns9I+KMAnhdTmRX
         u0pvkww+ljl2NbtqidvbBGlmXAmp9lKNCTanqmrtXeAp41j0kx1400PdNLkV1UMkwMhd
         ydIFaTPRETgx+0551AZkuDNi1gT5GmL/BSSwF80i5WGlCDfyYedELjjrvs+2kxJOkTX1
         6tgcJQWKz4uoQyPLyo7yA3q/0GkRqgSu7UXnZIWpGCH6jCsGxRBEUb0q+Bx3wexHxchL
         DZ8g+TiLjvOpFfSFb5Gig426iveBgEfmJohfU7pjEt7xTtYP4DsE/4UgykCzBaDFuL/6
         wb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843537; x=1760448337;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2upZOfn+9XZKAVenT9IdSeeTsYpWOvhQECiAzLsOT9M=;
        b=dNTQHmQIHHgHGuWgoauL5+bZYR1pct2RYs9LK3/kjx5eeU9XqtO8wV6IUhEIn7UT/7
         RfIqtXdO9yWwQBu3VxvESerBcJBWDDmnqq5GwTt5BQ0abr5P3TrtMKmX0rCX+grPCesY
         VWlvwd+pHiHMAeR+vvtnk+CbT9MV009rxo3bv3qYS+KpitBsTjGMJszvjdZH7i01S9u9
         Dx/uLPvUcrsXTKOis3yEN7JBs36mvx63fQ3oyZD1+u3YZkm4Ov0mx0TRd+NxEjfdH9/2
         r/cxJk6tOIWkT0m8OnBuImFpWX8n7Gkql7nzObz9udWkJkSgziVYvaji3zE3GvQHvapH
         LwUw==
X-Forwarded-Encrypted: i=1; AJvYcCWiU0QkVlTbY3O/qdNTRWJ/jbmhPNyIXkuUeoNbXJPihIqVl8Ckrs5PuWvlZBqIZKpVT5+Zc6wdFNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweTmxDEEQM+0FE7Wc1gB+c/FCyh5sNeztRQHbcg0C0Q08+M6h5
	YEkpMgbvD3H0S8S5ZQ1gnKgwFWVuRaKI10Uba00VScrSKqRi1ZhcPuu7eJu6iTp6JQ==
X-Gm-Gg: ASbGnct6DIvdsSBNXw8SGe3DtW/Uv+61lnVy1EIosnpCfFrdpp4Y+gylKtbUggAxbmX
	wGvxndm57JzJJFD0FldMgjnyUnNCOs2v+GuLDy5aVB9Lnp6ernmHhOG5yYNqd8ycVdrW3btkpAf
	kKRCpUIHGFKlV7ZzPI2nHzD8qHWJ3SfLO4S6FutUGgSaN9QRN47pyfvlS7aVp/pyTOTDWD9ApVj
	FvubRjLfU4gL6xzrJq+jmVQDVRfJcsj5yho0fDBHiUO0xuB2aUkgkoDbGGTY200YSrb6Lh6Ss6J
	s2JTjFmhOsSpwa4KImglQf6dXorjT94rtVoUde5u3hTgIo11qA+/JupD0xpzYHCPDejBvfByEPz
	jZPp+xUvXOw+oFNBRyBfhk+IKytPuUwKAjHTOH60K27T+KfI5tLGTQaZEfVvWSX3VQQl7YDTf+9
	Z/ADGYZdHm7oW2ZpEQ6lZ9v4SYuyyK2jiolu7K0cRSFg==
X-Google-Smtp-Source: AGHT+IHkz1RvUm2Y6K/v29K/FR/HFKL74dkvrcxiGVF4//Vfbdn/x8ph2egRij8xKmR0sRa6QiHgxA==
X-Received: by 2002:a17:906:6a1f:b0:b3e:3d95:b9bb with SMTP id a640c23a62f3a-b49c3f77baemr2137944866b.60.1759843537205;
        Tue, 07 Oct 2025 06:25:37 -0700 (PDT)
Message-ID: <4232140b-e44a-4d8b-8178-b583a2f4fabc@suse.com>
Date: Tue, 7 Oct 2025 15:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/18] xen/riscv: introduce metadata table to store P2M
 type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <f1e346b228ea76eb5bd988e8aab0062cbea58c9d.1758145428.git.oleksii.kurochko@gmail.com>
 <4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com>
 <5142b7c4-ab2e-4f73-a60d-3d23fe255ca7@gmail.com>
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
In-Reply-To: <5142b7c4-ab2e-4f73-a60d-3d23fe255ca7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.10.2025 18:00, Oleksii Kurochko wrote:
> On 9/23/25 12:41 AM, Jan Beulich wrote:
>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>
>>> +/*
>>> + * `pte` – PTE entry for which the type `t` will be stored.
>>> + *
>>> + * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided;
>>> + * otherwise, they may be NULL.
>>> + */
>>> +static void p2m_set_type(pte_t *pte, const p2m_type_t t,
>>> +                         struct p2m_pte_ctx *ctx,
>>> +                         struct p2m_domain *p2m)
>>>   {
>>> -    int rc = 0;
>>> +    /*
>>> +    * For the root page table (16 KB in size), we need to select the correct
>>> +    * metadata table, since allocations are 4 KB each. In total, there are
>>> +    * 4 tables of 4 KB each.
>>> +    * For none-root page table index of ->pt_page[] will be always 0 as
>>> +    * index won't be higher then 511. ASSERT() below verifies that.
>>> +    */
>>> +    struct page_info **md_pg =
>>> +        &ctx->pt_page[ctx->index / PAGETABLE_ENTRIES].v.md.metadata;
>>> +    pte_t *metadata = NULL;
>>> +
>>> +     /* Be sure that an index correspondent to page level is passed. */
>>> +    ASSERT(ctx->index <= P2M_PAGETABLE_ENTRIES(ctx->level));
>> Doesn't this need to be < ?
> 
> Yeah, it should be <.
> 
>>
>>> +    if ( !*md_pg && (t >= p2m_first_external) )
>>> +    {
>>> +        /*
>>> +         * Ensure that when `t` is stored outside the PTE bits
>>> +         * (i.e. `t == p2m_ext_storage` or higher),
>>> +         * both `ctx` and `p2m` are provided.
>>> +         */
>>> +        ASSERT(p2m && ctx);
>> Imo this would want to be checked whenever t > p2m_first_external, no
>> matter whether a metadata page was already allocated.
> 
> I think that|ctx| should be checked before this|if| condition, since it is
> used to obtain the proper metadata page.
> 
> The check for|p2m| can remain inside the|if| condition, as it is essentially
> only needed for allocating a metadata page.

That is, you want to allow callers to pass in NULL for the "p2m" parameter?
Isn't this going to be risky?

>>> -    if ( t > p2m_first_external )
>>> -        panic("unimplemeted\n");
>>> -    else
>>> +        if ( ctx->level <= P2M_SUPPORTED_LEVEL_MAPPING )
>>> +        {
>>> +            struct domain *d = p2m->domain;
>>> +
>>> +            *md_pg = p2m_alloc_table(p2m);
>>> +            if ( !*md_pg )
>>> +            {
>>> +                printk("%s: can't allocate extra memory for dom%d\n",
>>> +                        __func__, d->domain_id);
>>> +                domain_crash(d);
>>> +            }
>>> +        }
>>> +        else
>>> +            /*
>>> +             * It is not legal to set a type for an entry which shouldn't
>>> +             * be mapped.
>>> +             */
>>> +            ASSERT_UNREACHABLE();
>> Something not being legal doesn't mean it can't happen. Imo in this case
>> BUG_ON() (in place of the if() above) would be better.
>>
>>> +    }
>>> +
>>> +    if ( *md_pg )
>>> +        metadata = __map_domain_page(*md_pg);

Not this conditional assignment for ...

>>> +    if ( t < p2m_first_external )
>>> +    {
>>>           pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>   
>>> -    return rc;
>>> +        if ( metadata )
>>> +            metadata[ctx->index].pte = p2m_invalid;
>>> +    }
>>> +    else
>>> +    {
>>> +        pte->pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
>>> +
>>> +        metadata[ctx->index].pte = t;
>> Afaict metadata can still be NULL when you get here.
> 
> It shouldn't be, because when this line is executed, the metadata page already
> exists or was allocated at the start of p2m_set_type().

... this reply of yours. And the condition there can be false, in case you
took the domain_crash() path.

>>> @@ -812,13 +955,21 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>>       {
>>>           /* We need to split the original page. */
>>>           pte_t split_pte = *entry;
>>> +        struct page_info *tbl_pg = virt_to_page(table);
>> This isn't valid on a pointer obtained from map_domain_page().
> 
> Oh, sure — virt_to_page() and page_to_virt() should be used only for Xen
> heap addresses.
> 
> By the way, do we have any documentation, comments, or notes describing
> what should be allocated and from where?
> 
> Since map_domain_page() returns an address from the direct map region,
> should we instead use maddr_to_page(virt_to_maddr(table))?

How would that be any better? Even if right now you only build RISC-V code
with map_domain_page() having a trivial expansion, you will want to avoid
any assumptions along those lines. Or else you could avoid the use of that
abstraction altogether. It exists so when you need to support memory
amounts beyond what the directmap can cover, you can provide a suitable
implementation of the function and be done. You (or whoever else) in
particular shouldn't be required to go audit all the places where
map_domain_page() (and the pointers it returns) is (are) used.

Jan

