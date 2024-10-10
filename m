Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF740997E98
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 09:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815621.1229605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syo0L-0003W6-Ef; Thu, 10 Oct 2024 07:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815621.1229605; Thu, 10 Oct 2024 07:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syo0L-0003Ux-BX; Thu, 10 Oct 2024 07:54:37 +0000
Received: by outflank-mailman (input) for mailman id 815621;
 Thu, 10 Oct 2024 07:54:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syo0K-0003Ur-Dr
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 07:54:36 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e43b1edb-86dc-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 09:54:35 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9950d27234so89744066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 00:54:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7f27eb3sm49314366b.84.2024.10.10.00.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 00:54:34 -0700 (PDT)
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
X-Inumbo-ID: e43b1edb-86dc-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728546875; x=1729151675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SV0GgX63AI+D0pHn26hQPJ/dmOPgI9UOkDjcjw6SNkE=;
        b=aDmZqc+5n350mmCa3hgoD0LO28PdageRlIG5ddM6RRO/8LLR5RpjgTc5rQsH63nMKo
         6Uet3srhQe5CQWJdTgUlK6ug7ttoQzuFseTaA2G8G23cnMiaYLI4+s8K0tn3GQqymcdV
         ce5UD9dBB+LJF4F/+FMdmkWSudgb2Jletynes1HDoMaFYTcGu974NbmsLmJEdXGpVaxJ
         ze4LAdHIEQgr5hj6s6Dtqqz4M5Eaxz8rhaxJL2AMV9MZbT2oRWD183uffy6BKqNXXiQ7
         pt//qYiM0O7jreYCSr89lqNB2xwgTX37QOVA8Kh338eAU1oSkzrgqr0hpFJl3LPWlVGo
         JTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728546875; x=1729151675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SV0GgX63AI+D0pHn26hQPJ/dmOPgI9UOkDjcjw6SNkE=;
        b=RcIym0i9keHmwL7OgTih857xHXtAXq491rVBamOpRWIJkVq6+vEwKcF/PHpumwzeu3
         bvbOonTxZCE4qa30Y1q5crTvH45gst3D8SlGr+AFu+DK4a/9Y8sGUKr/s7H0FqPh1J77
         rbMC2xI74qm+EWqT7YSBNZXjgVrSK1e0hjeZrnbomm9BMNXpSbv5IahwS8mQYZRnTqHx
         gV/TxBpmpzX0918hWEiUuApNWpsOddf0tvi3wOjIzu0s0aS9TeYYMbtnGfUxYN5qIxSN
         z+5L1V2Iq/PnCR1COOpAMZ9KuI0hvAgi0RwnAh/dsj8NE4bMPy5ei5ObIW1qBfLYSXeO
         0+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdphKdxvf3aR/JJgThpBdmzLlxRi2o5wUCkC+r4HUHxcYea0yIhvxs7O23N4aLF4IKiASyAYzu9IQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKCT48sASvlz19T7AyW7Q8Fp5c2QtyfN4SvGLBGTixlXuEJr+v
	wCz+k4hu5w559QejzqDAj/3IAwzOYEuCTTCUI+tb2R6IXM01xWSvmsSDlXZuBI6SelwFOTGT5iA
	=
X-Google-Smtp-Source: AGHT+IHfyULzVHcvPSDjYq20L6r5bxqUPjL62D08J6JswgAiOXBg+VVzbT0YKWYYudfTJBZZeMdr0g==
X-Received: by 2002:a17:906:c104:b0:a99:36fa:9575 with SMTP id a640c23a62f3a-a998d1fa05bmr502885266b.32.1728546874737;
        Thu, 10 Oct 2024 00:54:34 -0700 (PDT)
Message-ID: <b6eb6268-9155-48cd-9b00-bc34f8d4a01b@suse.com>
Date: Thu, 10 Oct 2024 09:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/11] xen/lib: Add topology generator for x86
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-9-alejandro.vallejo@cloud.com>
 <7595b3ab-0891-42f7-81b0-5666651046b9@suse.com>
 <D4RGXLJZQ6MA.1B1ND4RWZESBE@cloud.com>
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
In-Reply-To: <D4RGXLJZQ6MA.1B1ND4RWZESBE@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2024 19:57, Alejandro Vallejo wrote:
> On Wed Oct 9, 2024 at 3:45 PM BST, Jan Beulich wrote:
>> On 01.10.2024 14:38, Alejandro Vallejo wrote:
>>> --- a/xen/lib/x86/policy.c
>>> +++ b/xen/lib/x86/policy.c
>>> @@ -2,6 +2,94 @@
>>>  
>>>  #include <xen/lib/x86/cpu-policy.h>
>>>  
>>> +static unsigned int order(unsigned int n)
>>> +{
>>> +    ASSERT(n); /* clz(0) is UB */
>>> +
>>> +    return 8 * sizeof(n) - __builtin_clz(n);
>>> +}
>>> +
>>> +int x86_topo_from_parts(struct cpu_policy *p,
>>> +                        unsigned int threads_per_core,
>>> +                        unsigned int cores_per_pkg)
>>> +{
>>> +    unsigned int threads_per_pkg = threads_per_core * cores_per_pkg;
>>
>> What about the (admittedly absurd) case of this overflowing?
> 
> Each of them individually could overflow the fields in which they are used.
> 
> Does returning EINVAL if either threads_per_core or cores_per_pkg overflow the
> INTEL structure j

The sentence looks unfinished, so I can only vaguely say that my answer to
the question would likely be "yes".

>>> +    switch ( p->x86_vendor )
>>> +    {
>>> +    case X86_VENDOR_INTEL: {
>>> +        struct cpuid_cache_leaf *sl = p->cache.subleaf;
>>> +
>>> +        for ( size_t i = 0; sl->type &&
>>> +                            i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
>>> +        {
>>> +            sl->cores_per_package = cores_per_pkg - 1;
>>> +            sl->threads_per_cache = threads_per_core - 1;
>>> +            if ( sl->type == 3 /* unified cache */ )
>>> +                sl->threads_per_cache = threads_per_pkg - 1;
>>
>> I wasn't able to find documentation for this, well, anomaly. Can you please
>> point me at where this is spelled out?
> 
> That's showing all unified caches as caches covering the whole package. We
> could do it the other way around (but I don't want to reverse engineer what the
> host policy says because that's irrelevant). There's nothing in the SDM (AFAIK)
> forcing L2 or L3 to behave one way or another, so we get to choose. I thought
> it more helpful to make all unified caches unified across the package. to give
> more information in the leaf.
> 
> My own system exposes 2 unified caches (data trimmed for space):
> 
> ``` cpuid
> 
>    deterministic cache parameters (4):
>       --- cache 0 ---
>       cache type                         = data cache (1)
>       cache level                        = 0x1 (1)
>       maximum IDs for CPUs sharing cache = 0x1 (1)
>       maximum IDs for cores in pkg       = 0xf (15)
>       --- cache 1 ---
>       cache type                         = instruction cache (2)
>       cache level                        = 0x1 (1)
>       maximum IDs for CPUs sharing cache = 0x1 (1)
>       maximum IDs for cores in pkg       = 0xf (15)
>       --- cache 2 ---
>       cache type                         = unified cache (3)
>       cache level                        = 0x2 (2)
>       maximum IDs for CPUs sharing cache = 0x1 (1)

Note how this is different ...

>       maximum IDs for cores in pkg       = 0xf (15)
>       --- cache 3 ---
>       cache type                         = unified cache (3)
>       cache level                        = 0x3 (3)
>       maximum IDs for CPUs sharing cache = 0x1f (31)

... from this, whereas your code would make it the same.

Especially if this is something you do beyond / outside the spec, it imo
needs reasoning about in fair detail in the description.

Jan

