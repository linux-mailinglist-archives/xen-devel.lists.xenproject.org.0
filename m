Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD418C71CE
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 09:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722823.1127144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7VAX-0000uO-6g; Thu, 16 May 2024 07:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722823.1127144; Thu, 16 May 2024 07:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7VAX-0000rt-3h; Thu, 16 May 2024 07:04:49 +0000
Received: by outflank-mailman (input) for mailman id 722823;
 Thu, 16 May 2024 07:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7VAV-0000rn-GQ
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 07:04:47 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93d6da37-1352-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 09:04:46 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-574b3d6c0f3so2963359a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 00:04:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01631sm948048866b.153.2024.05.16.00.04.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 00:04:45 -0700 (PDT)
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
X-Inumbo-ID: 93d6da37-1352-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715843085; x=1716447885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zpc41xGROJJynsJRtAZSKaAEcXphCP8ViT6H4bQeDPc=;
        b=X4/hOUd2DK7mqW6SG0SPfjUnT2ubtcWZd6B/gAct4o9jiidIu38RhOjsFWe23thlpb
         lnY0SDMEBXcEld5X+U+mfhd2vOHdY4JsVxTNh8HM1ibrqo8dj5sMs5PbC4JrFTf+fLLM
         rumraPSa6/iR/mdLF5pMjvJQHKPt0Cs6oQVWHEH7p/pph4daSHH1Y+obLKSq7Wxa2YMp
         b4tsljAhjMwc//t3R/G8kx9FtQlhLihSwgJpt3/C54bqsVRnKL4s8sOEbXhcoxawLQSC
         fQLXRUo7Dr7cWg9+sstc5304LLY5zAkXIWo/MJcenuQ6OEowhGMWyUJSTQgQ4/q4fHi8
         /+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715843085; x=1716447885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zpc41xGROJJynsJRtAZSKaAEcXphCP8ViT6H4bQeDPc=;
        b=OPgfX+mAWyGOocU/Zj+hlmHlS00L9DdOtdp9HC00Ug0KGAoiRPxGZZdYZhyTtdF5h5
         XSMqu+P3Su2So1Zr6vOU4b+JIfY5cbCl7UtMjhko13JXBrFR/ehleZd9PxdGd02yDYH4
         6GVkx/31XPZ/QVjK/v6x4FVwNzJuKdTGj2Spa2JCuVRTd7uqxD7JlkBJDMXpRxNk+QuD
         OjRRRpjJHfdDoWxnX9QJeXyMxkejeKVE46sBXDg7aBaNmczBBVENMH+hXKJx0wprsXOm
         R+APYn9Bg7EZ+GrKbp1CfuH4F+6MrkL2gVR7mXgQIqrrmsPRCoXKNjK/asBSY4UvhagB
         zJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCjCJ10uFtnmGV9hbia2CPO/TVkDnekjuQZKrsV1x+V6pksCYjXXjm6C6uDYVrf/IK8sEADglFH1KPhuNM3fX8d2kjFt5QcLv5A48A71M=
X-Gm-Message-State: AOJu0YwE8ZCcynZ0dFXK5BkTtNV1lQx39mu1m7RjCOdGGiA3SKICXm01
	TaCxhlKhhxidbnAntcfX4/GwPNOTT6BBQUBY7MK7ktIesYBwfWfofQJPNGoB9g==
X-Google-Smtp-Source: AGHT+IFR1WmGeyJ9MRydx8kvWbB32wih4cugjErKY++43tS5EixybAzG830K9AVX1i0zvWn8SWiNrA==
X-Received: by 2002:a17:906:f6da:b0:a5a:1ba1:1e7b with SMTP id a640c23a62f3a-a5a2d584119mr1177032566b.19.1715843085571;
        Thu, 16 May 2024 00:04:45 -0700 (PDT)
Message-ID: <77c6e497-631d-4f92-bd38-8ab7dba4841d@suse.com>
Date: Thu, 16 May 2024 09:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/15] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
 <616e8be09f217a766b96c4f9060f6658636a4338.1714988096.git.oleksii.kurochko@gmail.com>
 <2ac0ca46-6957-4d31-95cb-3016de7b11b8@suse.com>
 <76a84e9e239e1338fc6f86d243b74fa239d8091d.camel@gmail.com>
 <5174d73f-677d-4c5c-9d4c-e651a29e4366@suse.com>
 <588867d6e054264551e0e27b534955fce9b6d6d5.camel@gmail.com>
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
In-Reply-To: <588867d6e054264551e0e27b534955fce9b6d6d5.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.05.2024 19:03, Oleksii K. wrote:
> On Wed, 2024-05-15 at 17:41 +0200, Jan Beulich wrote:
>> On 15.05.2024 17:29, Oleksii K. wrote:
>>> On Wed, 2024-05-15 at 10:52 +0200, Jan Beulich wrote:
>>>> On 06.05.2024 12:15, Oleksii Kurochko wrote:
>>>>> The following generic functions were introduced:
>>>>> * test_bit
>>>>> * generic__test_and_set_bit
>>>>> * generic__test_and_clear_bit
>>>>> * generic__test_and_change_bit
>>>>>
>>>>> Also, the patch introduces the following generics which are
>>>>> used by the functions mentioned above:
>>>>> * BITOP_BITS_PER_WORD
>>>>> * BITOP_MASK
>>>>> * BITOP_WORD
>>>>> * BITOP_TYPE
>>>>>
>>>>> These functions and macros can be useful for architectures
>>>>> that don't have corresponding arch-specific instructions.
>>>>
>>>> Logically this paragraph may better move ahead of the BITOP_*
>>>> one.
>>>>
>>>>> Because of that x86 has the following check in the macros
>>>>> test_bit(),
>>>>> __test_and_set_bit(), __test_and_clear_bit(),
>>>>> __test_and_change_bit():
>>>>>     if ( bitop_bad_size(addr) ) __bitop_bad_size();
>>>>> It was necessary to make bitop bad size check generic too, so
>>>>> arch_check_bitop_size() was introduced.
>>>>
>>>> Not anymore, with the most recent adjustments? There's nothing
>>>> arch-
>>>> specific anymore in the checking.
>>>>
>>>>> @@ -183,7 +180,7 @@ static inline int test_and_set_bit(int nr,
>>>>> volatile void *addr)
>>>>>   * If two examples of this operation race, one can appear to
>>>>> succeed
>>>>>   * but actually fail.  You must protect multiple accesses with
>>>>> a
>>>>> lock.
>>>>>   */
>>>>> -static inline int __test_and_set_bit(int nr, void *addr)
>>>>> +static inline int arch__test_and_set_bit(int nr, volatile void
>>>>> *addr)
>>>>
>>>> I think I raised this point before: Why arch__ here, ...
>>>>
>>>>> @@ -232,7 +226,7 @@ static inline int test_and_clear_bit(int
>>>>> nr,
>>>>> volatile void *addr)
>>>>>   * If two examples of this operation race, one can appear to
>>>>> succeed
>>>>>   * but actually fail.  You must protect multiple accesses with
>>>>> a
>>>>> lock.
>>>>>   */
>>>>> -static inline int __test_and_clear_bit(int nr, void *addr)
>>>>> +static inline int arch__test_and_clear_bit(int nr, volatile
>>>>> void
>>>>> *addr)
>>>>
>>>> ... here, ...
>>>>
>>>>> @@ -243,13 +237,10 @@ static inline int
>>>>> __test_and_clear_bit(int
>>>>> nr, void *addr)
>>>>>  
>>>>>      return oldbit;
>>>>>  }
>>>>> -#define __test_and_clear_bit(nr, addr) ({               \
>>>>> -    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
>>>>> -    __test_and_clear_bit(nr, addr);                     \
>>>>> -})
>>>>> +#define arch__test_and_clear_bit arch__test_and_clear_bit
>>>>>  
>>>>>  /* WARNING: non atomic and it can be reordered! */
>>>>> -static inline int __test_and_change_bit(int nr, void *addr)
>>>>> +static inline int arch__test_and_change_bit(int nr, volatile
>>>>> void
>>>>> *addr)
>>>>
>>>> ... and here, while ...
>>>>
>>>>> @@ -307,8 +295,7 @@ static inline int variable_test_bit(int nr,
>>>>> const volatile void *addr)
>>>>>      return oldbit;
>>>>>  }
>>>>>  
>>>>> -#define test_bit(nr, addr) ({                           \
>>>>> -    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
>>>>> +#define arch_test_bit(nr, addr) ({                      \
>>>>
>>>> ... just arch_ here? I don't like the double underscore infixes
>>>> very
>>>> much, but I'm okay with them as long as they're applied
>>>> consistently.
>>>
>>> Common code and x86 use __test_and_clear_bit(), and this patch
>>> provides
>>> a generic version of __test_and_clear_bit(). To emphasize that
>>> generic__test_and_clear_bit() is a common implementation of
>>> __test_and_clear_bit(), the double underscore was retained. Also,
>>> test_and_clear_bit() exists and if one day it will be needed to
>>> provide
>>> a generic version of it, then it will be needed to have
>>> generic__test_and_clear_bit() and generic_test_and_clear_bit()
>>>
>>> A similar logic was chosen for test_bit.
>>
>> Right, but in all of your reply arch_ doesn't appear at all.
> I am a little confused here. According to my logic, should it be
> arch___test_and_set_bit() and generic___test_and_set_bit()?

Why 3 underscores in a row? I'm clearly not following.

> If you are asking why there is no generic implementation for
> test_and_clear_bit() without the double underscores, the reason is that
> Arm, PPC, and x86 don't use generic code and rely on specific
> instructions for this operation. Therefore, I didn't see much sense in
> providing a generic version of test_and_clear_bit(), at least, for now.

No, there was no question in that direction. And hence ...

>>  Yet the
>> question was: Why then not arch__test_bit(), to match the other arch
>> helpers?
> Because no one uses __test_bit(). Everywhere is used test_bit().

... this seems unrelated (constrained by my earlier lack of following you).

(Later) Wait, maybe I've finally figured it: You use arch__test_and_*()
because those underlie __test_and_*(), but arch_test_bit() because there's
solely test_bit() (same for the generic_* naming). I guess I can accept
that then, despite the slight anomaly you point out, resulting in the
question towards 3 underscores in a row. To clarify, my thinking was more
towards there not possibly being generic forms of test_and_*() (i.e. no
possible set of arch_test_and_*() or generic_test_and_*()), thus using
double inner underscores in arch__test_*() and generic__test_*() to
signify that those are purely internal functions, which aren't supposed to
be called directly.

Jan

