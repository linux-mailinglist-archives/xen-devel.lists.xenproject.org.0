Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A16B0C5CD
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 16:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051568.1419914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udrAS-0006kF-14; Mon, 21 Jul 2025 14:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051568.1419914; Mon, 21 Jul 2025 14:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udrAR-0006hh-Uk; Mon, 21 Jul 2025 14:06:59 +0000
Received: by outflank-mailman (input) for mailman id 1051568;
 Mon, 21 Jul 2025 14:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udrAR-0006hb-1O
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 14:06:59 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f69dffe1-663b-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 16:06:57 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45617887276so29693805e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 07:06:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb1575f0sm5767720b3a.75.2025.07.21.07.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 07:06:56 -0700 (PDT)
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
X-Inumbo-ID: f69dffe1-663b-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753106817; x=1753711617; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJ4VQdRBSRIJiZgalJoHkSrIFmkr1Ihf2bK2ibWog80=;
        b=UyX/KVlJi5NPAwstF8eMUBVpsffgmt52Jk3r68TlnaUh86jMmSGj1uF4UcIL4PkaBr
         p/Jp/BRRpo9eCTpfxI09wHZTnClCino7O56WCJf6L6w3SUecYQW6IJ9Y2L6Uv3/Fu0lO
         hoWkS1+7Q5farpZZIYxWJNxB1exBLKt5byyp0MaqfG60P+bhPWMfvhBuX5T7O1E3ugY2
         mOTJ3/AF8lrmsOuxLg/lwNwxAVjKdVQRelrsO/9ZGfzO1GIgKu1tOkoDjYRccXutOgzn
         UQUC2Mj+7gup+ZVcrAMMfGZjoCVhoa5jB+pKwT1X/jJsXQajqWXDXRN6AwZ7R2309doU
         +/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753106817; x=1753711617;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ4VQdRBSRIJiZgalJoHkSrIFmkr1Ihf2bK2ibWog80=;
        b=L1QH3a7Jq1jODCL+ltUQbXgP4dWOjfNUs30LNTfEHXTK+lKzpyabWgFMSRTlNf+mBk
         92f3AswQiEm2wRA4eDVusJvDq1UHUNnoY0GsAWy/yJ8QtOL8IVIhdIIauSalIKy36i8P
         0k9ExIiP9MFYLCYeKqxXeFyW4M+bFdaT/RyAFZfRaNg0keq3qpQcIb7HQ4jVfoCypoqP
         cvRe4Iay26Wv0UBKcq4mST24GWiQOOiuWe2J+gGeY7txArraLO0yhAru350t5YfMj6UA
         PuJffjSa2Yb+Q28iduoQXM/YbnxDAilsrV/LtSUCA35A6jXM0RAPBu0xFh3CaI9XRThD
         smAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJIbQfnnylQhH4hSpitjy6nPF3e7qfmt7CpPye5TUf9lEjwe4yni+cBtg+Ucf3rNI8YJK8O+orkmE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJlsSeRYp8CK4w1emWONOMbJDyY/Q2Kth23+AzOply0lw3b53U
	yfgHT3xdgMWAO59eLlBQUn02wUc5eS4TkKLrbHpAYUKc4+nW4TvUEHlP3yCuLVVizg==
X-Gm-Gg: ASbGncujazsFZk12k6DBkKvq3CIleZHz+5Njka0QKcMssDWPIS0xYiPj6c71MhZKAKm
	K5JVvHzpDvTpbjrYxE84jzQFEvSfvm9U4nj7pMqV+ySuQcFM6Brxr1qFYk/WzwsAHXtJMtJJFGy
	KCjoq1lEPjlXGJNxwPIbehkG0Tp63NPUIF7OFu2zVCtte0TWilXWpcuErZclLsPj694HdSpc4Xz
	wXJHBkj0JLJeZC0/jQ6UjizpovXdFps6YpdtfMiCOE++7mXkIRn3To+c0x4St8StGZ+dwi1S2Z8
	4/f6G4QGq18/M+WeI3be0fFLCnzNs7e4kH8bPVdC0pKKGtkryLt+YKZ1uum6rPkfZ798JV/VhFH
	aMoGNNjSES4bMk/wMBQwTEkQ1Vohz/+dMyhbupTdbyZeKHlCIV6Vw8Pj4uBi0hbYxJ+jOheiwh3
	xvjvfHsIk=
X-Google-Smtp-Source: AGHT+IE8q53jTh769mD9Ak3IdOJm7eK6ZmhUNbD6GKmX9/J1KJu5bgl1HpCCx71ALG4mQUSjFGAiqA==
X-Received: by 2002:a05:6000:2c0a:b0:3b4:9721:2b1b with SMTP id ffacd0b85a97d-3b60e4d1de9mr17261385f8f.9.1753106816827;
        Mon, 21 Jul 2025 07:06:56 -0700 (PDT)
Message-ID: <257f7cb0-2459-4dbb-a350-dce72d6b0dfe@suse.com>
Date: Mon, 21 Jul 2025 16:06:46 +0200
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
 <c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com>
 <d4cc7511-da13-4f29-87f7-e799b533a4ac@gmail.com>
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
In-Reply-To: <d4cc7511-da13-4f29-87f7-e799b533a4ac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.07.2025 11:43, Oleksii Kurochko wrote:
> On 7/2/25 1:44 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -1055,3 +1055,134 @@ int guest_physmap_add_entry(struct domain *d,
>>>   {
>>>       return p2m_insert_mapping(d, gfn, (1 << page_order), mfn, t);
>>>   }
>>> +
>>> +/*
>>> + * Get the details of a given gfn.
>>> + *
>>> + * If the entry is present, the associated MFN will be returned and the
>>> + * access and type filled up. The page_order will correspond to the
>> You removed p2m_access_t * from the parameters; you need to also update
>> the comment then accordingly.
>>
>>> + * order of the mapping in the page table (i.e it could be a superpage).
>>> + *
>>> + * If the entry is not present, INVALID_MFN will be returned and the
>>> + * page_order will be set according to the order of the invalid range.
>>> + *
>>> + * valid will contain the value of bit[0] (e.g valid bit) of the
>>> + * entry.
>>> + */
>>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>>> +                           p2m_type_t *t,
>>> +                           unsigned int *page_order,
>>> +                           bool *valid)
>>> +{
>>> +    paddr_t addr = gfn_to_gaddr(gfn);
>>> +    unsigned int level = 0;
>>> +    pte_t entry, *table;
>>> +    int rc;
>>> +    mfn_t mfn = INVALID_MFN;
>>> +    p2m_type_t _t;
>> Please no local variables with leading underscores. In x86 we commonly
>> name such variables p2mt.
>>
>>> +    DECLARE_OFFSETS(offsets, addr);
>> This is the sole use of "addr". Is such a local variable really worth having?
> 
> Not really, I'll drop it.
> 
>>> +    ASSERT(p2m_is_locked(p2m));
>>> +    BUILD_BUG_ON(XEN_PT_LEVEL_MAP_MASK(0) != PAGE_MASK);
>>> +
>>> +    /* Allow t to be NULL */
>>> +    t = t ?: &_t;
>>> +
>>> +    *t = p2m_invalid;
>>> +
>>> +    if ( valid )
>>> +        *valid = false;
>>> +
>>> +    /* XXX: Check if the mapping is lower than the mapped gfn */
>>> +
>>> +    /* This gfn is higher than the highest the p2m map currently holds */
>>> +    if ( gfn_x(gfn) > gfn_x(p2m->max_mapped_gfn) )
>>> +    {
>>> +        for ( level = P2M_ROOT_LEVEL; level ; level-- )
>> Nit: Stray blank before the 2nd semicolon. (Again at least once below.)
>>
>>> +            if ( (gfn_x(gfn) & (XEN_PT_LEVEL_MASK(level) >> PAGE_SHIFT)) >
>>> +                 gfn_x(p2m->max_mapped_gfn) )
>>> +                break;
>>> +
>>> +        goto out;
>>> +    }
>>> +
>>> +    table = p2m_get_root_pointer(p2m, gfn);
>>> +
>>> +    /*
>>> +     * the table should always be non-NULL because the gfn is below
>>> +     * p2m->max_mapped_gfn and the root table pages are always present.
>>> +     */
>>> +    if ( !table )
>>> +    {
>>> +        ASSERT_UNREACHABLE();
>>> +        level = P2M_ROOT_LEVEL;
>>> +        goto out;
>>> +    }
>>> +
>>> +    for ( level = P2M_ROOT_LEVEL; level ; level-- )
>>> +    {
>>> +        rc = p2m_next_level(p2m, true, level, &table, offsets[level]);
>>> +        if ( (rc == GUEST_TABLE_MAP_NONE) && (rc != GUEST_TABLE_MAP_NOMEM) )
>> This condition looks odd. As written the rhs of the && is redundant.
> 
> And it is wrong. It should:
>   if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
> 
>>> +            goto out_unmap;
>>> +        else if ( rc != GUEST_TABLE_NORMAL )
>> As before, no real need for "else" in such cases.
>>
>>> +            break;
>>> +    }
>>> +
>>> +    entry = table[offsets[level]];
>>> +
>>> +    if ( p2me_is_valid(p2m, entry) )
>>> +    {
>>> +        *t = p2m_type_radix_get(p2m, entry);
>> If the incoming argument is NULL, the somewhat expensive radix tree lookup
>> is unnecessary here.
> 
> Good point.
> 
>>> +        mfn = pte_get_mfn(entry);
>>> +        /*
>>> +         * The entry may point to a superpage. Find the MFN associated
>>> +         * to the GFN.
>>> +         */
>>> +        mfn = mfn_add(mfn,
>>> +                      gfn_x(gfn) & (BIT(XEN_PT_LEVEL_ORDER(level), UL) - 1));
>>> +
>>> +        if ( valid )
>>> +            *valid = pte_is_valid(entry);
>> Interesting. Why not the P2M counterpart of the function? Yes, the comment
>> ahead of the function says so, but I don't see why the valid bit suddenly
>> is relevant here (besides the P2M type).
> 
> This valid variable is expected to be used in the caller (something what Arm does here
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/p2m.c#L375) to check if
> it is needed to do flush_page_to_ram(), so if the the valid bit in PTE was set to 0
> then it means nothing should be flushed as entry wasn't used as it marked invalid.

I hope you see what a mess you get if you have two flavors of "valid" for a
PTE.

>>> +    }
>>> +
>>> +out_unmap:
>>> +    unmap_domain_page(table);
>>> +
>>> +out:
>> Nit: Style (bot labels).
>>
>>> +    if ( page_order )
>>> +        *page_order = XEN_PT_LEVEL_ORDER(level);
>>> +
>>> +    return mfn;
>>> +}
>>> +
>>> +static mfn_t p2m_lookup(struct domain *d, gfn_t gfn, p2m_type_t *t)
>> pointer-to-const for the 1st arg? But again more likely struct p2m_domain *
>> anyway?
> 
> |struct p2_domain| would be better, but I’m not really sure that a
> pointer-to-const can be used here.

Note how I also didn't suggest const there.

> I expect that, in that case,
> |p2m_read_lock()| would also need to accept a pointer-to-const, and since it
> calls|read_lock()| internally, that could be a problem because|read_lock() |accepts a|rwlock_t *l|.

Correct.

Jan

