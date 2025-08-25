Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96299B3397D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 10:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092736.1448379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqSjJ-0002Ov-8J; Mon, 25 Aug 2025 08:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092736.1448379; Mon, 25 Aug 2025 08:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqSjJ-0002NP-5a; Mon, 25 Aug 2025 08:39:05 +0000
Received: by outflank-mailman (input) for mailman id 1092736;
 Mon, 25 Aug 2025 08:39:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqSjH-0002NH-MW
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 08:39:03 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3262732-818e-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 10:39:01 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61c4f73cf84so2111666a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 01:39:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c316f4f45sm4588018a12.36.2025.08.25.01.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 01:39:00 -0700 (PDT)
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
X-Inumbo-ID: f3262732-818e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756111141; x=1756715941; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fzvK6wrszmbnhyuS1qJdcrD1psISCGdg3f6T+CqbnXo=;
        b=KiOR2X+BqtCKIq0aNYIfYgx86C+5L1FiEG9Nxs9cfjWXAQLATWOUSCUf90Cjysmps6
         kg5ERw/HUPSDDy566U4rC7wcHS29lSKIDu7ufVfvl4nOyWjO1V4FNE9l0LR9yolBmr4B
         zrXpJwX5AvSEO5qk0xJTAbPZ8KurBkPCudTxkifwJNLMGt//Yg0fQ4wvm8YcilNCq1kN
         4mxp+wAgEHgzlK+4J/wNlbzYdo4/h2HNanN9wZtgifNsepPVuffRx2grEOkbnKBD5jdS
         tBh9aoQIYjMkeR88q08KsvN/iKGgEXHFFohoo/LdI1BLAcIjAHopyTEbwioKiqV5NK05
         DxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756111141; x=1756715941;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzvK6wrszmbnhyuS1qJdcrD1psISCGdg3f6T+CqbnXo=;
        b=lm9GsnnGrF/WHncw/Jx9Zda/QwoDbFJANaAs0z7IlDPzJKJ3kvTFjzjD1I0iGpLg6l
         luJds57PWPW/UTNNICOoa92HsC8zG2LdJkk2W7SmK4uxtndPQlZZTM7LEzBFo/9mrXhj
         e4ITD6nW3p50DNda9maGM6ZsTGn8ZOVr9mLtmvw1nQaGTrOqEPiOWR84u410W0OCI+ww
         N2f7DViY1jdRpyvOhtP4bN0l2J8ujS/v40nuAFerJE1HGmYgPKQgEXfsdBPmFUFIY6dl
         NGEebNnEX5o8EGkyrTsXy23Wog1rDP3covF9ny1sINs+VSml1bY38iUQaqqAEFSU9Ehg
         /8GA==
X-Forwarded-Encrypted: i=1; AJvYcCUrSsORLpAijtEAHhA4ImhsuIpslj7wXZ/9+W4APBx5BEPgnv3oEEvDCtssljh1qCj7qwU5xyCmFzw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnrP3oWIUH0lYTgeVv2jC87cyimOeoEO9ZobAyu0EUXSnStJrV
	5GBhTm/yDz2gRuCBG0yXO+hKMzqK+Y1gP04d328dDWqLVK/1X19m6lwlAqkm5vE/Rw==
X-Gm-Gg: ASbGncvw8WPEgKbI0imCjFF4Mt7R5F7vlhLpAyyrW22L7XUr/H5FTA+zM7w4jsUiaUx
	RbKAEyq+KNXQKAkWdXpdcommRAiHT0Ewy15cxcVtXvM9IPnO38LR1nMatYJtDklNTmRFiCgraH2
	xswDceIVbeIMmQsbpTurqUZNovBLWMMhEdDYugtsk6mrz4k4PoEuATLrkAHMhT6uOk7wevUzvoK
	THBsGeZPy/6TwaJHf8WUE3eauj8IXgXH13NUyAlHcrjRkKR+BViiLKSZOAOnv0/bBvWEZhUhgXH
	M1jK6f/DO8jagm+nkx1tcd74cstKJgWveYyGItAwUoEVC5D+HbMiCfiq+hy4xQZJgzohS/tKoMP
	rswkqkNNNEhAKf5T5PPwnC9drpZ8w+T1TpaquWgpHtFZRRt4v6VJC8qWxbV77tjQHpr3E1U13/Z
	csbWwQBLw=
X-Google-Smtp-Source: AGHT+IF7ehPGMSsxNTAopIvjzRsU61KMBHt3DE66ExyFIWSf4kbx03z2UI7aOFp4jEvpk2+Bt3cCSQ==
X-Received: by 2002:a05:6402:21c6:b0:61a:8966:ced6 with SMTP id 4fb4d7f45d1cf-61c1b717eb8mr10202195a12.35.1756111140693;
        Mon, 25 Aug 2025 01:39:00 -0700 (PDT)
Message-ID: <74c1fea2-72c7-4e9f-a7ca-13a9dae32002@suse.com>
Date: Mon, 25 Aug 2025 10:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: consider conversion from UL or (void*) to function
 pointer as safe
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <9e5e4ff2c7ba0a90a6ac403e2de9318e18949274.1755628705.git.dmytro_prokopchuk1@epam.com>
 <90fb95a3-4b32-4785-a77c-373e5b9da6ed@suse.com>
 <e1e2abdf0ef8708097aa78440eeb7147@bugseng.com>
 <6b912698-b871-4819-ac30-14325d0be146@epam.com>
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
In-Reply-To: <6b912698-b871-4819-ac30-14325d0be146@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.08.2025 18:34, Dmytro Prokopchuk1 wrote:
> On 8/21/25 11:25, Nicola Vetrini wrote:
>> On 2025-08-21 10:01, Jan Beulich wrote:
>>> On 19.08.2025 20:55, Dmytro Prokopchuk1 wrote:
>>>> Rule 11.1 states as following: "Conversions shall not be performed
>>>> between a pointer to a function and any other type."
>>>>
>>>> The conversion from unsigned long or (void *) to a function pointer
>>>> is safe in Xen because the architectures it supports (e.g., x86 and
>>>> ARM) guarantee compatible representations between these types.
>>>
>>> I think we need to be as precise as possible here. The architectures
>>> guarantee nothing, they only offer necessary fundamentals. In the
>>> Windows x86 ABI, for example, you can't convert pointers to/from longs
>>> without losing data. What we build upon is what respective ABIs say,
>>> possibly in combination of implementation specifics left to compilers.
>>>
>>
>> +1, a mention of the compilers and targets this deviation relies upon is 
>> needed.
> 
> Maybe with this wording:
> 
> This deviation is based on the guarantees provided by the specific ABIs
> (e.g., ARM AAPCS) and compilers (e.g., GCC) supported in Xen. These ABIs
> guarantee compatible representations for 'void *', 'unsigned long' and
> function pointers for the supported target platforms. This behavior is
> architecture-specific and may not be portable outside of supported
> environments.

Reads okay to me; for Arm64 I can only assume the psABI indeed makes this
guarantee.

>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -370,6 +370,16 @@ Deviations related to MISRA C:2012 Rules:
>>>>         to store it.
>>>>       - Tagged as `safe` for ECLAIR.
>>>>
>>>> +   * - R11.1
>>>> +     - The conversion from unsigned long or (void \*) to a function 
>>>> pointer does
>>>> +       not lose any information or violate type safety assumptions 
>>>> if unsigned
>>>> +       long or (void \*) type is guaranteed to be the same bit size 
>>>> as a
>>>> +       function pointer. This ensures that the function pointer can 
>>>> be fully
>>>> +       represented without truncation or corruption. The macro 
>>>> BUILD_BUG_ON is
>>>> +       integrated into xen/common/version.c to confirm conversion 
>>>> compatibility
>>>> +       across all target platforms.
>>>> +     - Tagged as `safe` for ECLAIR.
>>>
>>> Why the escaping of * here, when ...
>>>
>>>> --- a/docs/misra/rules.rst
>>>> +++ b/docs/misra/rules.rst
>>>> @@ -431,7 +431,13 @@ maintainers if you want to suggest a change.
>>>>       - All conversions to integer types are permitted if the 
>>>> destination
>>>>         type has enough bits to hold the entire value. Conversions to 
>>>> bool
>>>>         and void* are permitted. Conversions from 'void noreturn (*) 
>>>> (...)'
>>>> -       to 'void (*)(...)' are permitted.
>>>> +       to 'void (*)(...)' are permitted. Conversions from unsigned 
>>>> long or
>>>> +       (void \*) to a function pointer are permitted if the source 
>>>> type has
>>>> +       enough bits to restore function pointer without truncation or 
>>>> corruption.
>>>> +       Example::
>>>> +
>>>> +           unsigned long func_addr = (unsigned long)&some_function;
>>>> +           void (*restored_func)(void) = (void (*)(void))func_addr;
>>>
>>> ... context here suggests they work fine un-escaped, and you even add 
>>> some un-
>>> escaped instances as well. Perhaps I'm simply unaware of some 
>>> peculiarity?
>>>
>>
>> This is a literal rst block, while the other is not (* acts as a bullet 
>> point in rst iirc)
> 
> This is how "sphinx-build" tool interprets this.
> 1. * inside single quotes '' -> looks normal, e.g. ‘void (*)(…)’
> 2. * without quotes -> warning
> deviations.rst:369: WARNING: Inline emphasis start-string without 
> end-string. [docutils]
> 3. \* -> looks normal, e.g. (void *)
> 
> Because that we need such format: \*

Yet under "Example::" there's no quotation and no escaping. The one
"(void \*)" earlier in the text I'd suggest to replace by a quoted
form anyway, matching the rest of the text.

Jan

