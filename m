Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73396A4FCAD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 11:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902183.1310143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpmJL-0002W8-SG; Wed, 05 Mar 2025 10:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902183.1310143; Wed, 05 Mar 2025 10:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpmJL-0002UF-Oe; Wed, 05 Mar 2025 10:49:11 +0000
Received: by outflank-mailman (input) for mailman id 902183;
 Wed, 05 Mar 2025 10:49:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpmJK-0002Td-F1
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 10:49:10 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77331424-f9af-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 11:49:08 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38f406e9f80so5042267f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 02:49:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e479608fsm20934812f8f.14.2025.03.05.02.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 02:49:07 -0800 (PST)
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
X-Inumbo-ID: 77331424-f9af-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741171748; x=1741776548; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RxhRUVKfr8JjgeK+JIcIYAn/fcfB14HcMzLZwJebzqY=;
        b=gPGt76OmWfLAupnBIr/byecgnDM+zX2scWyYS+BOUMPEb0jOUlNihFoNhMcQTrj9BN
         qfxHX7CWw1vjCEBmPAQFh67hRI5g3oLDFkFKbBB+1U37zYe2+YX/EE30LHIg1PwK1u5r
         VkD9qVPDNjg3Awqz2XZZ3hx8J1/sq5ZZiG/f4pwyhu+vCJmVRS9SqlUDn2mpH+aLHQB3
         qG3cxWuEVQWCUS37xTiP4J8X5cRi581WGHVzG7Pv+OLk54Mq/S0XjI0+dPlYvUA7y9M9
         tStYTXULkIqD8mispk2OJEodVwcgGW1/4NVEjIc4UefM+6u3RqA6ctC+tXy5NxMIx3Fa
         xtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741171748; x=1741776548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxhRUVKfr8JjgeK+JIcIYAn/fcfB14HcMzLZwJebzqY=;
        b=vBubPOHNQ854pGtTxOfKeeDbRw60UY+1gM09yQt1IjDibcjCzKfC0YmX52GAqMrANO
         8U0TH2giafNxnhd+lJJ+GQmrGOrhhrotsYtqtSQyHUj1jub+4rTY7xSK1p5uFOO3q8nL
         4Nl9sxOCFucm+cFraDQSotbU48zWFqWFIr4dOUCoWFvBG/c+AYpnDcBXnMihoosHPDoG
         BZg7ulm8igHYOT+tT7Axosr1O4D0yqkBVewSZb/gG7rN4yAc3+XkAMIsYdh9cFmqmrLM
         4Swmw9Z/C6gYNWQF1AgWu/L9Hdn20Dt+8CG8ctvHtddMsRy5QYg8QKnWQIcY2zkZcaV5
         D2Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWKEHP7p8a3CW9ATa7uEEUCJhfJOC+orShBJ2hQqnIefLYbdbgpth0NYNsTy2uXB3DFTvnolWsI7tk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgQDTF0n4QZyBkuBKffqCZIhvEHEKmPwCbLJX4cfQwh7ombawk
	K1x+Np2AV2CTkrSvRyAF+5lw5dCNQza/Dx0f7croeUW4+NpkkEPoyh9rS7ExwA==
X-Gm-Gg: ASbGncuCdhlYQ0fvo1u5/UWXgK9pf80gXsJc6T4tVU0GjQLCHCm2Jd1Qr5Ff7S9o4sp
	pTjuHdsGwoZBG47Fb+fqGFBwvpFKN1+aNbalMhiBYwBodMvRqV71cmGdAXalDS1bJDayLwj32dp
	xqxT0zs3t07sn/280rpQZqgXmmA/aSslKv5UoyUTv+ti+c1lDO8Wgi6wCu+i0DiOoNkJ0wxz+nf
	+K+kp+uRqhUhhuhvaUfkhGGmhJ8lMZRTTb1tJUaxsKHht3sprqGI1EdHEdCWzumMKJ6jKpzbI6Y
	HMwDgR9Daqm12wAqqsxYbtjw+0PwNTNVuQh6XJtwPulUYnwNH4irE0TYXF+eWcyw3k/yGsOFjJS
	KgC8BA6/8/xKhLbY2WPeUy+SFPAsj1Q==
X-Google-Smtp-Source: AGHT+IFhhT071uLRU0ze159uDJGhU71r4h82T0p5rqUEkK5zhUZ5KFtClVTaHjRT+j3f6m6kQqsZMQ==
X-Received: by 2002:a05:6000:1886:b0:390:e8bf:55a8 with SMTP id ffacd0b85a97d-3911f7412f1mr1882629f8f.18.1741171748132;
        Wed, 05 Mar 2025 02:49:08 -0800 (PST)
Message-ID: <f50d8ee7-a00f-4f4f-99f6-4313af7a4fdc@suse.com>
Date: Wed, 5 Mar 2025 11:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <D80RCS1Y7AKH.373ULA2LO3MND@cloud.com>
 <4af0077c-c933-4894-bfad-2adda7afbbf7@suse.com>
 <D83AY7ZBKC81.3NBCLVK3DX833@cloud.com>
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
In-Reply-To: <D83AY7ZBKC81.3NBCLVK3DX833@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.02.2025 15:36, Alejandro Vallejo wrote:
> On Wed Feb 26, 2025 at 2:05 PM GMT, Jan Beulich wrote:
>> On 24.02.2025 15:49, Alejandro Vallejo wrote:
>>> Open question to whoever reviews this...
>>>
>>> On Mon Feb 24, 2025 at 1:27 PM GMT, Alejandro Vallejo wrote:
>>>>      spin_lock(&heap_lock);
>>>> -    /* adjust domain outstanding pages; may not go negative */
>>>> -    dom_before = d->outstanding_pages;
>>>> -    dom_after = dom_before - pages;
>>>> -    BUG_ON(dom_before < 0);
>>>> -    dom_claimed = dom_after < 0 ? 0 : dom_after;
>>>> -    d->outstanding_pages = dom_claimed;
>>>> -    /* flag accounting bug if system outstanding_claims would go negative */
>>>> -    sys_before = outstanding_claims;
>>>> -    sys_after = sys_before - (dom_before - dom_claimed);
>>>> -    BUG_ON(sys_after < 0);
>>>> -    outstanding_claims = sys_after;
>>>> +    BUG_ON(outstanding_claims < d->outstanding_pages);
>>>> +    if ( pages > 0 && d->outstanding_pages < pages )
>>>> +    {
>>>> +        /* `pages` exceeds the domain's outstanding count. Zero it out. */
>>>> +        outstanding_claims -= d->outstanding_pages;
>>>> +        d->outstanding_pages = 0;
>>>
>>> While this matches the previous behaviour, do we _really_ want it? It's weird,
>>> quirky, and it hard to extend to NUMA-aware claims (which is something in
>>> midway through).
>>>
>>> Wouldn't it make sense to fail the allocation (earlier) if the claim has run
>>> out? Do we even expect this to ever happen this late in the allocation call
>>> chain?
>>
>> This goes back to what a "claim" means. Even without any claim, a domain may
>> allocate memory. So a claim having run out doesn't imply allocation has to
>> fail.
> 
> Hmmm... but that violates the purpose of the claim infra as far as I understand
> it. If a domain may overallocate by (e.g) ballooning in memory it can distort the
> ability of another domain to start up, even if it succeeded in its own claim.

Why would that be? As long as we hold back enough memory to cover the claim, it
shouldn't matter what kind of allocation we want to process. I'd say that a PV
guest starting ballooned ought to be able to deflate its balloon as far as
there was a claim established for it up front.

> We might also break the invariant that total claims are strictly >=
> total_avail_pages.

Same here - I don't see why this would happen as long as all accounting is
working correctly.

> I'm somewhat puzzled at the "why" of having separate concepts for max_mem and
> claims. I guess it simply grew the way it did. Reinstating sanity would
> probably involve making max_mem effectively the claim, but that's a ton of
> work I really would rather not do for now.

To me the two are different (beyond claim being global while max-mem is per-
domain). max-mem is a hard boundary (beyond which allocations _will_ fail),
whereas a claim is a softer one, beyond which allocations _may_ fail.

Jan

