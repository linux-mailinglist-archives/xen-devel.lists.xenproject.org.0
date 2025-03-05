Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A96A4FCB2
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 11:50:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902191.1310152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpmKE-0003rR-40; Wed, 05 Mar 2025 10:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902191.1310152; Wed, 05 Mar 2025 10:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpmKE-0003ni-1E; Wed, 05 Mar 2025 10:50:06 +0000
Received: by outflank-mailman (input) for mailman id 902191;
 Wed, 05 Mar 2025 10:50:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpmKD-0002Td-85
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 10:50:05 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97cdb8fc-f9af-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 11:50:03 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso44953525e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 02:50:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4292144sm13813785e9.13.2025.03.05.02.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 02:50:02 -0800 (PST)
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
X-Inumbo-ID: 97cdb8fc-f9af-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741171803; x=1741776603; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ensTPfdrJMk3ZSEb1xAmSFWvV1YGDCiMcUCqT0JdamM=;
        b=fHLBfAsjd/wlXxrmnFVYdJheZkXyEN5KV2LfQxZF7TN0KB6LBv8uNDGesybSEKvaF5
         qz/QYKBiHpJc6EUhqDEAw8ML5AdhFAdhNvkw3umD7DJibrXio/rJETkHKnos6puDws/C
         wZqmJCu8D27aOuO3TDksd30Q3fjPcOsP09SJtZvgnEVsJdalYguy3zKOc3pDNRDXfOFA
         nDjMBuDIecBjXYtcB7g+mgq1hk3PW7nCbA00FWFy4hxmizsgOK+QBaaIcednqHQpYhEa
         J4N6SfRmteJC9y2s8l3snXTtCsGh1RIUus/QgMkweeomgXqPdcWjl+yb6H5MpKDqFJ14
         p0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741171803; x=1741776603;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ensTPfdrJMk3ZSEb1xAmSFWvV1YGDCiMcUCqT0JdamM=;
        b=wGQSKZNUUSXLAPgGJnWj0b/99Xxg81cItyg/NQZuJgOBHGtnc07QrxfFA7bHPj1p5u
         lYbSUKutPLvxnEYz3/FqKNucrWimagGeCfYSaiH2JjWF7dfb9LcVWstEpcKdunA6kSSA
         mRsFDJ/9s2xYG8uCTNoYNAGwLeQB4ubqQVLJ3EdUc11/BdKSph95qmKhcyTAZZ6C6LXV
         NiWcU2mqygRuWdShyChCnkcaXNLfHo9rjXUSy13qKmc6aDHCV3c1cvO55mEvRtTm/1Yn
         s/L0vXB9nLmBbvBJyHkszRHs9km4Iku7l1GO86DY31Ngu5cYXpmeRp0j52A+MQL1CnNB
         9FJQ==
X-Gm-Message-State: AOJu0YyIMV2P3vRA2PvoaOtpN+4ukhvGTxoMAYsFpvp37iAUcTSoeUWn
	xx9aDo0JSPIQor+BP4rRVhHTKsvkWzfCWDQyUT1/zftZfIIBLMQpHDlPyXDv0A==
X-Gm-Gg: ASbGncuBTq1kfs7TB5XA1sLGQc2C1otlupBZRxyeSsyFiIMDq2kQw0caGZCMutwu32w
	5TetnGMdCS1qiEQcwV6syPxucEar5KpPlLVRs95R415zYdMt8dSz2FL7gAluGdas6cMd8YLjH8a
	tqdWD3ntTOyRfuwFnZgEgR7HLnzVIPviP5ZfJkGenmO5OnASihzI3nkF1fjvsqdY5zPlUy2c2tE
	foX0FcmYqqYZcH9ldsN6p8hQEpGXpEhUjUvR/6OgCnDAe5c5cMiEQvdhRmItyO5JonbzOwii0hv
	X6J5sjhA/gbF+tu8rQOlKH1uAH48gKcpTnZN8cy7iuJ3bBWP8Bh4MjZSpo84qpvkZIxvqiI2gK/
	fZaN442LUcpc8EEdqO0N3pjM4YhV+1Q==
X-Google-Smtp-Source: AGHT+IHQZ8dCqr1O9O9NoteRhQU1yQ88LDfsMdvpWQHV3uTQqCyQY3f+CesIAH4Tq1h5JIor1mGshg==
X-Received: by 2002:a05:600c:548c:b0:43b:d04b:52b7 with SMTP id 5b1f17b1804b1-43bd2939f35mr19698045e9.12.1741171802826;
        Wed, 05 Mar 2025 02:50:02 -0800 (PST)
Message-ID: <0a7f1059-8939-4e8c-a88d-8ad20b3ffadc@suse.com>
Date: Wed, 5 Mar 2025 11:50:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <Z78djoAU7vjGepjr@macbook.local>
 <a9d4384c-770b-4947-b099-cf4bba1583a5@suse.com>
 <Z78lJfzqH9btDMrM@macbook.local> <D83B8MUC2HYI.F3IYZM092P3R@cloud.com>
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
In-Reply-To: <D83B8MUC2HYI.F3IYZM092P3R@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.02.2025 15:50, Alejandro Vallejo wrote:
> On Wed Feb 26, 2025 at 2:28 PM GMT, Roger Pau Monné wrote:
>> On Wed, Feb 26, 2025 at 03:08:33PM +0100, Jan Beulich wrote:
>>> On 26.02.2025 14:56, Roger Pau Monné wrote:
>>>> On Mon, Feb 24, 2025 at 01:27:24PM +0000, Alejandro Vallejo wrote:
>>>>> --- a/xen/common/page_alloc.c
>>>>> +++ b/xen/common/page_alloc.c
>>>>> @@ -490,13 +490,11 @@ static long outstanding_claims; /* total outstanding claims by all domains */
>>>>>  
>>>>>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>>>>>  {
>>>>> -    long dom_before, dom_after, dom_claimed, sys_before, sys_after;
>>>>> -
>>>>>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
>>>>>      d->tot_pages += pages;
>>>>>  
>>>>>      /*
>>>>> -     * can test d->claimed_pages race-free because it can only change
>>>>> +     * can test d->outstanding_pages race-free because it can only change
>>>>>       * if d->page_alloc_lock and heap_lock are both held, see also
>>>>>       * domain_set_outstanding_pages below
>>>>>       */
>>>>> @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>>>>>          goto out;
>>>>
>>>> I think you can probably short-circuit the logic below if pages == 0?
>>>> (and avoid taking the heap_lock)
>>>
>>> Are there callers passing in 0?
>>
>> Not sure, but if there are no callers expected we might add an ASSERT
>> to that effect then.
>>
>>>>>      spin_lock(&heap_lock);
>>>>> -    /* adjust domain outstanding pages; may not go negative */
>>>>> -    dom_before = d->outstanding_pages;
>>>>> -    dom_after = dom_before - pages;
>>>>> -    BUG_ON(dom_before < 0);
>>>>> -    dom_claimed = dom_after < 0 ? 0 : dom_after;
>>>>> -    d->outstanding_pages = dom_claimed;
>>>>> -    /* flag accounting bug if system outstanding_claims would go negative */
>>>>> -    sys_before = outstanding_claims;
>>>>> -    sys_after = sys_before - (dom_before - dom_claimed);
>>>>> -    BUG_ON(sys_after < 0);
>>>>> -    outstanding_claims = sys_after;
>>>>> +    BUG_ON(outstanding_claims < d->outstanding_pages);
>>>>> +    if ( pages > 0 && d->outstanding_pages < pages )
>>>>> +    {
>>>>> +        /* `pages` exceeds the domain's outstanding count. Zero it out. */
>>>>> +        outstanding_claims -= d->outstanding_pages;
>>>>> +        d->outstanding_pages = 0;
>>>>> +    } else {
>>>>> +        outstanding_claims -= pages;
>>>>> +        d->outstanding_pages -= pages;
>>>>
>>>> I wonder if it's intentional for a pages < 0 value to modify
>>>> outstanding_claims and d->outstanding_pages, I think those values
>>>> should only be set from domain_set_outstanding_pages().
>>>> domain_adjust_tot_pages() should only decrease the value, but never
>>>> increase either outstanding_claims or d->outstanding_pages.
>>>>
>>>> At best the behavior is inconsistent, because once
>>>> d->outstanding_pages reaches 0 there will be no further modification
>>>> from domain_adjust_tot_pages().
>>>
>>> Right, at that point the claim has run out. While freeing pages with an
>>> active claim means that the claim gets bigger (which naturally needs
>>> reflecting in the global).
>>
>> domain_adjust_tot_pages() is not exclusively called when freeing
>> pages, see steal_page() for example.
>>
>> When called from steal_page() it's wrong to increase the claim, as
>> it assumes that the page removed from d->tot_pages is freed, but
>> that's not the case.  The domain might end up in a situation where
>> the claim is bigger than the available amount of memory.
>>
>> Thanks, Roger.
> 
> This is what I meant by my initial reply questioning the logic itself.
> 
> It's all very dubious with memory_exchange and makes very little sense on the
> tentative code I have for per-node claims.
> 
> I'd be quite happy to put an early exit before the spin_lock on pages <= 0.
> That also covers your initial comment and prevents claims from growing after a
> domain started running if it didn't happen to consume all of them.
> 
> Is anyone opposed?

We first need to reach common understanding what a claim is (or is not). See
the other reply just sent.

Jan

