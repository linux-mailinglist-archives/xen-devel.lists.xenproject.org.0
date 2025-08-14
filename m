Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E4B26AA5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 17:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081936.1441890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZhb-0008QI-Ki; Thu, 14 Aug 2025 15:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081936.1441890; Thu, 14 Aug 2025 15:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZhb-0008Ne-I1; Thu, 14 Aug 2025 15:17:15 +0000
Received: by outflank-mailman (input) for mailman id 1081936;
 Thu, 14 Aug 2025 15:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umZha-0008NY-EV
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 15:17:14 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0bc4929-7921-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 17:17:12 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb7a0550cso178982866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 08:17:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe77cfsm23781904a12.42.2025.08.14.08.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 08:17:11 -0700 (PDT)
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
X-Inumbo-ID: c0bc4929-7921-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755184632; x=1755789432; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4yZJTaGhZtrvq1andNWgka9JF0YBKEOWX1lhoETBrgM=;
        b=g4SLpW9Ke39sVgkx0hz87Jcyn/5wA/LR0IQ66Xu9fLfH4EwqDfMSAcnjZ2ke2yhCoa
         fjnvagF1XnCzhUgcmINuK1rQteq68iv6IHpDppjvk8ZJaL87Fx2sAv6PWOgDX3jnnEUK
         GjW28VDmkXPnQu+YEkod7O2OrLk4nTcHOp6l9BB47tXXgmE0BvvGl0E+wSLTbJtK6obx
         RF6kfbZsJMVFdBvXdSAZiknxN3Pm7okgad8mCS8Fw1pWtwzDoy+8q1LnVFTc/U0lQ/HS
         ggxxeEeuPlrBCjoz1wh40tz+QXWWQZW84U5cuuT0abx9u4WnHFMY61R/IUIQ3bBZKB01
         RufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184632; x=1755789432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yZJTaGhZtrvq1andNWgka9JF0YBKEOWX1lhoETBrgM=;
        b=PyFeTWoIWNZl2FpaqNCaburd3sYztL7reJ0McVmvg0ki1J7yymCXOApki7b8eN4OvH
         8QExDCDB8pwc5QmGtHjhzxtMl6tQzW9whP4wzRbpuwbinW7X1UBhxGHEXck8bG8+ezut
         Q12fl2AxZw90LDxrOpaZs7DSJYpYw3akn8CHZvX85IcX8VtdcEd1XUnK+Li72GaMZqnr
         /904QjmvXA1rEzntkQxV2TSNkqIr78mX3+pDbUv15RGfGks2slSlHc7Qm+QPd8mVyWLr
         8g9k1zkEIC+U4frQPjfFJYlE8P+rUZYOUB6IMb85xN4xUgwilu3e/ZSGYbNkAHGpfHzq
         c25w==
X-Forwarded-Encrypted: i=1; AJvYcCWF0N7L+kiN8juvdYUxr49LDpCU/pZ3UedPCssbYLQDXhzP2Kt6RIn3XNcuUsKtigu6UoFlauK0rng=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfVwz6DIsGshvh0uxggcdVpiGTe7yp8PcpgNSbRyQtwN+Re/2d
	3NRgLjFmehHyEExCVH+yDqCd3pvzd/ci7jftebzwODVtmMBZlKItENAydWLWXEpxxQ==
X-Gm-Gg: ASbGncvFBBO86EBSbEB6QRX1O7y8497OxaP1UiHOLDSwmSLzuiIJng1fwhdlVuWt3/I
	+jA0CmNaCuTJJnwmfpBMkfOAYUQxB+O5eXa/k5uao1WI/aSCJg8+Tljjuf+XPkMyjBKlpSFV7ju
	h54PjIJx2azgrtr4C83Rn56YOt0durVmVL0ro6jmHq4d6wtMU4n23DdKhBAl64NGXPvDqDUAaOq
	ZvwaVApbljQeAQBc9cqw0IfLjN2AijWAwNW86ENNOR5Y7lrNy1k+zcBuxQLigPz42e0GVWPF/FT
	1kAdRBpoG+4bCZ83nVz8x7Ct7ijbsQ8waQXQkWRnvSKAX+SF8C/o3jAkfr8DOHdfpQWecMpWL6L
	jg+Sv7vxxKuluJBdqC7ATHntpMfEoihZbuLhoF5he6Qbty8KClSzwbbipRZMGwnX5dJykO1hIER
	HqlDvATK4pjN5N8VlMcw==
X-Google-Smtp-Source: AGHT+IEwzPoy4jRF/3stzw+O9NBbz2v80ezTffN2Bv9Iev+lkbV1QMh4hHLd/MUwPapX5aFm8Dm5VQ==
X-Received: by 2002:a17:907:6eac:b0:ae0:d8f2:9065 with SMTP id a640c23a62f3a-afcbe1b0700mr308103866b.39.1755184631728;
        Thu, 14 Aug 2025 08:17:11 -0700 (PDT)
Message-ID: <117e35e0-d23e-4527-964a-82fa2bed57fd@suse.com>
Date: Thu, 14 Aug 2025 17:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/20] xen/riscv: Implement p2m_free_subtree() and
 related helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <41845723a7b0e3efd09095d13e57aace6f7747ef.1753973161.git.oleksii.kurochko@gmail.com>
 <98dc796e-bb14-435e-8c19-53e5de60cc43@suse.com>
 <c8a07c48-b79b-4136-a265-91c14bb96c81@gmail.com>
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
In-Reply-To: <c8a07c48-b79b-4136-a265-91c14bb96c81@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2025 17:09, Oleksii Kurochko wrote:
> On 8/6/25 5:55 PM, Jan Beulich wrote:
>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>> +/* Put any references on the page referenced by pte. */
>>> +static void p2m_put_page(const pte_t pte, unsigned int level)
>>> +{
>>> +    mfn_t mfn = pte_get_mfn(pte);
>>> +    p2m_type_t p2m_type = p2m_get_type(pte);
>>> +
>>> +    ASSERT(pte_is_valid(pte));
>>> +
>>> +    /*
>>> +     * TODO: Currently we don't handle level 2 super-page, Xen is not
>>> +     * preemptible and therefore some work is needed to handle such
>>> +     * superpages, for which at some point Xen might end up freeing memory
>>> +     * and therefore for such a big mapping it could end up in a very long
>>> +     * operation.
>>> +     */
>>> +    switch ( level )
>>> +    {
>>> +    case 1:
>>> +        return p2m_put_2m_superpage(mfn, p2m_type);
>>> +
>>> +    case 0:
>>> +        return p2m_put_4k_page(mfn, p2m_type);
>>> +    }
>> Yet despite the comment not even an assertion for level 2 and up?
> 
> Not sure that an ASSERT() is needed here as a reference(s) for such page(s)
> will be put during domain_relinquish_resources() as there we could do preemption.
> Something like Arm does here:
>    https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c?ref_type=heads#L1587
> 
> I'm thinking that probably it makes sense to put only 4k page(s) and
> all other cases postpone until domain_relinquish_resources() is called.

How can you defer to domain cleanup? How would handling of foreign mappings
(or e.g. ballooning? not sure) work when you don't drop references as
necessary?

>>>   /* Free pte sub-tree behind an entry */
>>>   static void p2m_free_subtree(struct p2m_domain *p2m,
>>>                                pte_t entry, unsigned int level)
>>>   {
>>> -    panic("%s: hasn't been implemented yet\n", __func__);
>>> +    unsigned int i;
>>> +    pte_t *table;
>>> +    mfn_t mfn;
>>> +    struct page_info *pg;
>>> +
>>> +    /* Nothing to do if the entry is invalid. */
>>> +    if ( !pte_is_valid(entry) )
>>> +        return;
>>> +
>>> +    if ( pte_is_superpage(entry, level) || (level == 0) )
>> Perhaps swap the two conditions around?
>>
>>> +    {
>>> +#ifdef CONFIG_IOREQ_SERVER
>>> +        /*
>>> +         * If this gets called then either the entry was replaced by an entry
>>> +         * with a different base (valid case) or the shattering of a superpage
>>> +         * has failed (error case).
>>> +         * So, at worst, the spurious mapcache invalidation might be sent.
>>> +         */
>>> +        if ( p2m_is_ram(p2m_get_type(p2m, entry)) &&
>>> +             domain_has_ioreq_server(p2m->domain) )
>>> +            ioreq_request_mapcache_invalidate(p2m->domain);
>>> +#endif
>>> +
>>> +        p2m_put_page(entry, level);
>>> +
>>> +        return;
>>> +    }
>>> +
>>> +    table = map_domain_page(pte_get_mfn(entry));
>>> +    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
>>> +        p2m_free_subtree(p2m, table[i], level - 1);
>> In p2m_put_page() you comment towards concerns for level >= 2; no similar
>> concerns for the resulting recursion here?
> 
> This function is generic enough to handle any level.
> 
> Except that it is possible that it will be needed, for example, to split 1G mapping
> into something smaller then p2m_free_subtree() could be called for freeing a subtree
> of 1gb mapping.

The question wasn't about it being generic enough, but it possibly taking
too much time for level >= 2.

Jan

