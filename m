Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD98DC649D1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163992.1491018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL03k-0008UM-Pn; Mon, 17 Nov 2025 14:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163992.1491018; Mon, 17 Nov 2025 14:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL03k-0008S6-MT; Mon, 17 Nov 2025 14:18:24 +0000
Received: by outflank-mailman (input) for mailman id 1163992;
 Mon, 17 Nov 2025 14:18:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL03k-0008S0-2f
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:18:24 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 455fd57f-c3c0-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 15:18:21 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-640c1fda178so6764325a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:18:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4ce83dsm10240579a12.34.2025.11.17.06.18.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:18:20 -0800 (PST)
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
X-Inumbo-ID: 455fd57f-c3c0-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763389101; x=1763993901; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zFX5lmSzcDAqtrf3TPbbhrHSqxGNjHrD+ov/V1rpaUM=;
        b=WBVijsk6Kn3RI62sFcENzKU0KLHWeLJEP//QuRVzPLJdhHjAPIYTHupI9WeewRjH6W
         YsMjMHX/T/3CAqZGyzEDLTzlPB9Mxe9qS6MuEMojeAyY5RrIjXOLYZZ+4K5jRaYNYbDB
         Px9CA3dpobXwj5g2oUOKE6TexS1wpfa9TmQsygoGAH+4sZAjhH0dLxGL2acq2hy2Fe53
         l9mHS3Bq9mMX/8WVAwvD4+uOB8wENIe4e0BkqzOJ8QwlWJtUaFhYl1uJ64fSC//wbZrY
         koitd3hn5yDjgEdKm4ancoBnx+YYIH+ClUIZXSHGt8RukQOCvP8ZASBf28MfEXQdA6kX
         jJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763389101; x=1763993901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFX5lmSzcDAqtrf3TPbbhrHSqxGNjHrD+ov/V1rpaUM=;
        b=qSQPJhPImk/8d0H0SwH8csY8Y2f+cuqufQ3BZKGW31hPB0mbpAxYFd0JIqYcXuI6Da
         n06y6rQ4RG5kvQu+C97CbZy2GiGYYNJuOiaE5YQUrPz5I1oqOyhvJxTt6ClxMNGobLQv
         lmR5UZSgttU93qiTUTXYpte3N7EcutcNZRGMSOkv9PDBn2zeZqWkG2hFOPDT6HWYKbqS
         ekhvq+6xyrfgaJ+pSg6GfDMcrauQQyHeECdld1PvLCnRfbLnYReTB361RAcRyrdU8I+s
         JHcTwHCpXBbmr5SzNFU4lZ6dLvLpcEECWGQUeYHQxb4uVOy/Yd/0wjWKru11/iIOvIZg
         kgQw==
X-Forwarded-Encrypted: i=1; AJvYcCVDdLy90cJxcfk8zHW2IK6H00G8RZ1LVdsHQtVB+pXX7N4MdS8OGBVL2zhQhK+7QnPtvuscFypq/ho=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5pvymc0RMmv6ujYgbUxtZOtgfknjRcreB06Fla1NOEmsr2jQB
	usUkqTxYa+spddand5s8AQsQdo9v2Ui+gdjSFL3OCd34in9dOi0jyk2lmlYaETkeXg==
X-Gm-Gg: ASbGncsxPJElzFZvVsJJCPGGM+KRZu0LqqBBOrob66YAC3DZxd+n5aPelFN5dDS21NI
	3FqOCyXJKfFN8uZTFKRmJHzhc2SUIt/i9XPkqr2VmJrO/6y7RJDnlScn8+ZTJhiESmDMfewcAP9
	/OGfEmqXO47dkSkNuKQl35ftJf1Mi1Qs6Pi8i9Czd4ZwjsmtZIVyyoRsnGviwXnizPxQgE1k5BX
	dKiws/Wpo4/JHevwq5wWhLzRJgfDQo8FIdb1UkkPeof5cHZSZvFCBTj6Fu8+kbVTc8/B9OrrDlx
	1Tx7Z7b0ab8FPBrYCfHOzyul1D7gtaJEYPyZA7Vmd2lASbXq/5SWo3HkP6hrxD/oEeRirU609SZ
	f26xWZpRFJO7wI2xXey+ZgN9hst717VIHKQT9DrrUW2rYsffw0QSn+pBCf5e9Lckw8vzW0vJMBB
	h8noZATGHCT0hPWtIjJhQe50qKRsJbMh5fAQ1iZ+LaCVimbnWyp3saBnN27XlOTR+ZoMZqG8wma
	ePkyE60thed2A==
X-Google-Smtp-Source: AGHT+IG1NSSUKRbuYJ4wtJ/MxGNyeWHfXnjVbolfQNUSvCuDsUOE++2uQPx9Dg2LZm6gXdgPPurysw==
X-Received: by 2002:a05:6402:42c7:b0:641:3a92:7e6f with SMTP id 4fb4d7f45d1cf-64350d2dba5mr11130057a12.0.1763389100696;
        Mon, 17 Nov 2025 06:18:20 -0800 (PST)
Message-ID: <c13a083a-bfba-4684-bdaf-dee4d5cd65b0@suse.com>
Date: Mon, 17 Nov 2025 15:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] amd/iommu: Always atomically update DTE
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1762961527.git.teddy.astie@vates.tech>
 <a14812d39743f5f49614d099bdac6720bf7c4fae.1762961527.git.teddy.astie@vates.tech>
 <b3ed438d-2b73-4b07-99e5-01e66a833f4d@suse.com>
 <4da9ecf1-3984-43a6-be45-1988bf79b85d@vates.tech>
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
In-Reply-To: <4da9ecf1-3984-43a6-be45-1988bf79b85d@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.11.2025 14:49, Teddy Astie wrote:
> Le 13/11/2025 à 12:38, Jan Beulich a écrit :
>> On 12.11.2025 16:37, Teddy Astie wrote:
>>> amd_iommu_set_root_page_table chooses between updating atomically
>>> and non-atomically depending on whether the DTE is active or not.
>>>
>>> This choice existed mostly because cx16 wasn't supposed always available
>>> until [1]. Thus we don't need to threat the non-atomic path in a special
>>> way anymore.
>>>
>>> By rearranging slightly the atomic path, we can make it cover all the cases
>>> which improves the code generation at the expense of systematically performing
>>> cmpxchg16b.
>>>
>>> Also remove unused raw64 fields of ldte, and the deprecated comment as the
>>> function actually behaves in a more usual way and can't return >0.
>>>
>>> [1] 2636fcdc15c7 "x86/iommu: check for CMPXCHG16B when enabling IOMMU"
>>>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>> ---
>>>   xen/drivers/passthrough/amd/iommu_map.c | 78 ++++++++-----------------
>>>   1 file changed, 25 insertions(+), 53 deletions(-)
>>>
>>> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
>>> index 320a2dc64c..e3165d93aa 100644
>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>>> @@ -154,69 +154,41 @@ static void set_iommu_ptes_present(unsigned long pt_mfn,
>>>       unmap_domain_page(table);
>>>   }
>>>   
>>> -/*
>>> - * This function returns
>>> - * - -errno for errors,
>>> - * - 0 for a successful update, atomic when necessary
>>> - * - 1 for a successful but non-atomic update, which may need to be warned
>>> - *   about by the caller.
>>> - */
>>>   int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
>>>                                     uint64_t root_ptr, uint16_t domain_id,
>>>                                     uint8_t paging_mode, unsigned int flags)
>>>   {
>>>       bool valid = flags & SET_ROOT_VALID;
>>>   
>>> -    if ( dte->v && dte->tv )
>>> -    {
>>> -        union {
>>> -            struct amd_iommu_dte dte;
>>> -            uint64_t raw64[4];
>>> -            __uint128_t raw128[2];
>>> -        } ldte = { .dte = *dte };
>>> -        __uint128_t res, old = ldte.raw128[0];
>>> -        int ret = 0;
>>> -
>>> -        ldte.dte.domain_id = domain_id;
>>> -        ldte.dte.pt_root = paddr_to_pfn(root_ptr);
>>> -        ldte.dte.iw = true;
>>> -        ldte.dte.ir = true;
>>> -        ldte.dte.paging_mode = paging_mode;
>>> -        ldte.dte.v = valid;
>>> -
>>> -        res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
>>> -
>>> -        /*
>>> -         * Hardware does not update the DTE behind our backs, so the
>>> -         * return value should match "old".
>>> -         */
>>> -        if ( res != old )
>>> -        {
>>> -            printk(XENLOG_ERR
>>> -                   "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%016lx)\n",
>>> -                   domain_id,
>>> -                   (uint64_t)(res >> 64), (uint64_t)res,
>>> -                   (uint64_t)(old >> 64), (uint64_t)old);
>>> -            ret = -EILSEQ;
>>> -        }
>>> +    union {
>>> +        struct amd_iommu_dte dte;
>>> +        __uint128_t raw128[2];
>>> +    } ldte = { .dte = *dte };
>>> +    __uint128_t res, old = ldte.raw128[0];
>>>   
>>> -        return ret;
>>> -    }
>>> +    ldte.dte.domain_id = domain_id;
>>> +    ldte.dte.pt_root = paddr_to_pfn(root_ptr);
>>> +    ldte.dte.iw = true;
>>> +    ldte.dte.ir = true;
>>> +    ldte.dte.paging_mode = paging_mode;
>>> +    ldte.dte.tv = true;
>>> +    ldte.dte.v = valid;
>>> +
>>> +    res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
>>>   
>>> -    if ( valid || dte->v )
>>> +    /*
>>> +     * Hardware does not update the DTE behind our backs, so the
>>> +     * return value should match "old".
>>> +     */
>>> +    if ( res != old )
>>>       {
>>> -        dte->tv = false;
>>> -        dte->v = true;
>>> -        smp_wmb();
>>> +        printk(XENLOG_ERR
>>> +                "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%016lx)\n",
>>> +                domain_id,
>>> +                (uint64_t)(res >> 64), (uint64_t)res,
>>> +                (uint64_t)(old >> 64), (uint64_t)old);
>>
>> Indentation is now off by 1 here.
>>
>>> +        return -EILSEQ;
>>
>> The downside of this is that all updates can now take this path. Yes, this shouldn't
>> be possible to be taken, but it's a (minor) concern nevertheless. At the very least
>> such a downside wants, imo, mentioning in the description, even if for nothing else
>> than to make clear that it was a deliberate choice.
>>
> 
> I only expect to see this path in case of a bug (recoverable here), 
> which is only checked in the res != old case. But if something similar 
> occurs in the non-atomic path, then nothing good will happen as such 
> checks cannot be implemented properly.
> 
> Perhaps we want to emphasis this :
> "The race check is now always made instead of only being made for the 
> atomic path. This specific path should be triggered under normal 
> circumstances, and is very likely a bug."

s/should/shouldn't/ I suppose?

Jan

> And wrap the res != old inside a unlikely() to insist on this aspect.
> --
> Teddy Astie | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 
> 


