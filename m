Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF11B3E706
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 16:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104969.1455972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut5Tx-0008Pd-HE; Mon, 01 Sep 2025 14:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104969.1455972; Mon, 01 Sep 2025 14:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut5Tx-0008Md-E5; Mon, 01 Sep 2025 14:26:05 +0000
Received: by outflank-mailman (input) for mailman id 1104969;
 Mon, 01 Sep 2025 14:26:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut5Tv-0008MX-VD
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 14:26:03 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9669d4fd-873f-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 16:26:02 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afec5651966so173606366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 07:26:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0423ed35e4sm315315866b.25.2025.09.01.07.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 07:26:01 -0700 (PDT)
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
X-Inumbo-ID: 9669d4fd-873f-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756736762; x=1757341562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UpGPCVo0O2UxfenHY1cBlPDMbjb8GNJeXc8iIh5vx2U=;
        b=ENhqS4USUT3wHKC4NOxmF7c4v/nu3+qPGv/mejAVRiuHphowDVHYKE6fODC6Z1mM1l
         0kECFKJBFEhUWn5X272rrMpbCwlxRJXFDF7/9r44k9fDF0aSyN3T37rsjbO5PcJxMsBk
         AqpWoXr966K1dOT2QLGiKRA/BGKoX1LrPELfj2JbEoJmcSBV3nCjz1TRNpEG9/SufxVc
         xQh3db+cC3QoUOAk06KvjIEdPk/hH4klN3GkF0HDaRI5reg2+3TCzwsETUq86+2wa9s2
         TYeag5fvlVgTvNHuOav8ZA30MxGWnahySF5Wb9YxXjgOF3wHkt/JeBI2GcuMHD63sU8P
         moQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756736762; x=1757341562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpGPCVo0O2UxfenHY1cBlPDMbjb8GNJeXc8iIh5vx2U=;
        b=c5X66se02g/WRabNElpgNVTdJlh44SJnqCGOkZB84WsGZiNPY9kfxvtw1uLOZ+J/m5
         s1NjLneU6v4bB+gs/L0jrDNK8OJ4IZm+oe7HYJcMebLtdr36/SqtjG4YAQ5R/JrxrPGK
         PLsoeN9qGGUPmGlRvKxxwBxTTEl/8uI2pLwCG8CYEKdjYzBbWzafMOJCKMug1ERkPxvP
         rtbOU1DvV/CxyowLSb/SlLILOowr9z8c/xuCyUmlQ3MIGYvhnUqyX0ZwGSUPUXviJZlp
         7jLm6ctcW/Xz6ojp3YGp4esqwcr+18lLwrRsqWH1xu5xAO/tseCtaYWigcrtQivvawad
         QqUA==
X-Forwarded-Encrypted: i=1; AJvYcCWfyjYZEZBO5R51xpBRSg1v5ZYPwRSkolP66gyRnNoNcoq2911ZiGV6u+D+Wkm+PrlbUurxEx6/ohw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzyvw9IZyJt0TEMz+hNWMcyuSsm/nvrUWFo+7B3Im/vp8TZ2pyz
	8UwF1Swjss3ai3uBhTtQHshL1SiWI1xrHzCbgldMb/ibCSVLm9eY2kl1mpZofjkXVw==
X-Gm-Gg: ASbGnctmDsDOqLtXGhcQW8ZOKmP0jHUbKjGFFhUR3kh3L26VY4Q1+ZIgkXE0tNylU5K
	84lasuuSJpuyU4LgjtRrUmiPtw1wWw69Vo1DnWzfiuwVG1b5acTy58LhcBP25ZCbXJEWmMHMgAT
	ExqRfboXZdV47eBfXU3tDzSs4k05pUuhlTt7ZYA24Ke1DE2nnsvFsaS6VxWXhIvCbOF0VHB5FvB
	2Hsgyn4kZ60kdT/Ef7tvSRtX1PWI2L3PJ2T7F+67uOHbGqRjy42tFPE9siop7lhyDhi6mWZTjWZ
	ZRlQ91f5PKIHJOHG8TEpu3kUkarwUDoQbqd1FlvxF+diWw9aYOV361Pdw2uaJ7NOnuvjX5Sz3xH
	dm7FfmsOo4y+Qtw1cU6yjSzizZgxT1dysgs3yQ1lsMIDbAF34+pchNiHq0fNf/gawg7jmoWRkVZ
	7oj2+1Ns8=
X-Google-Smtp-Source: AGHT+IH1KgVa6W8gM056VpZ8Dk48jp72aIfF/qMDLeQwX93u36FLT1uAUXCpqo4cQAL9ylaRR/bkyQ==
X-Received: by 2002:a17:907:6095:b0:afe:bbbf:f002 with SMTP id a640c23a62f3a-b01f20bfbffmr952566366b.62.1756736762147;
        Mon, 01 Sep 2025 07:26:02 -0700 (PDT)
Message-ID: <8e7293e9-6479-4904-8072-8eec9f1d5751@suse.com>
Date: Mon, 1 Sep 2025 16:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/bitops: Optimise arch_ffs{,l}() some more on AMD
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250527222930.1452674-1-andrew.cooper3@citrix.com>
 <20250826174135.605220-1-andrew.cooper3@citrix.com>
 <3ec7b53e-aef6-4a00-acb3-19cbbe6543c9@suse.com>
 <fa534ac9-21db-4d26-94f7-e7a016f31edf@citrix.com>
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
In-Reply-To: <fa534ac9-21db-4d26-94f7-e7a016f31edf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.09.2025 16:21, Andrew Cooper wrote:
> On 27/08/2025 8:52 am, Jan Beulich wrote:
>> On 26.08.2025 19:41, Andrew Cooper wrote:
>>> --- a/xen/common/bitops.c
>>> +++ b/xen/common/bitops.c
>>> @@ -97,14 +97,14 @@ static void __init test_for_each_set_bit(void)
>>>      if ( ui != ui_res )
>>>          panic("for_each_set_bit(uint) expected %#x, got %#x\n", ui, ui_res);
>>>  
>>> -    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 1);
>>> +    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 0x11);
>>>      for_each_set_bit ( i, ul )
>>>          ul_res |= 1UL << i;
>>>  
>>>      if ( ul != ul_res )
>>>          panic("for_each_set_bit(ulong) expected %#lx, got %#lx\n", ul, ul_res);
>>>  
>>> -    ull = HIDE(0x8000000180000001ULL);
>>> +    ull = HIDE(0x8000000180000011ULL);
>>>      for_each_set_bit ( i, ull )
>>>          ull_res |= 1ULL << i;
>> How do these changes make a difference? Apart from ffs() using TZCNT, ...
>>
>>> @@ -127,6 +127,79 @@ static void __init test_for_each_set_bit(void)
>>>          panic("for_each_set_bit(break) expected 0x1008, got %#x\n", ui_res);
>>>  }
>>>  
>>> +/*
>>> + * A type-generic fls() which picks the appropriate fls{,l,64}() based on it's
>>> + * argument.
>>> + */
>>> +#define fls_g(x)                                        \
>>> +    (sizeof(x) <= sizeof(int)      ? fls(x) :           \
>>> +     sizeof(x) <= sizeof(long)     ? flsl(x) :          \
>>> +     sizeof(x) <= sizeof(uint64_t) ? fls64(x) :         \
>>> +     ({ BUILD_ERROR("fls_g() Bad input type"); 0; }))
>>> +
>>> +/*
>>> + * for_each_set_bit_reverse() - Iterate over all set bits in a scalar value,
>>> + * from MSB to LSB.
>>> + *
>>> + * @iter An iterator name.  Scoped is within the loop only.
>>> + * @val  A scalar value to iterate over.
>>> + *
>>> + * A copy of @val is taken internally.
>>> + */
>>> +#define for_each_set_bit_reverse(iter, val)             \
>>> +    for ( typeof(val) __v = (val); __v; __v = 0 )       \
>>> +        for ( unsigned int (iter);                      \
>>> +              __v && ((iter) = fls_g(__v) - 1, true);   \
>>> +              __clear_bit(iter, &__v) )
>>> +
>>> +/*
>>> + * Xen doesn't have need of for_each_set_bit_reverse() at present, but the
>>> + * construct does exercise a case of arch_fls*() not covered anywhere else by
>>> + * these tests.
>>> + */
>>> +static void __init test_for_each_set_bit_reverse(void)
>>> +{
>>> +    unsigned int  ui,  ui_res = 0, tmp;
>>> +    unsigned long ul,  ul_res = 0;
>>> +    uint64_t      ull, ull_res = 0;
>>> +
>>> +    ui = HIDE(0x80008001U);
>>> +    for_each_set_bit_reverse ( i, ui )
>>> +        ui_res |= 1U << i;
>>> +
>>> +    if ( ui != ui_res )
>>> +        panic("for_each_set_bit_reverse(uint) expected %#x, got %#x\n", ui, ui_res);
>>> +
>>> +    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 0x11);
>>> +    for_each_set_bit_reverse ( i, ul )
>>> +        ul_res |= 1UL << i;
>>> +
>>> +    if ( ul != ul_res )
>>> +        panic("for_each_set_bit_reverse(ulong) expected %#lx, got %#lx\n", ul, ul_res);
>>> +
>>> +    ull = HIDE(0x8000000180000011ULL);
>>> +    for_each_set_bit_reverse ( i, ull )
>>> +        ull_res |= 1ULL << i;
>> ... even here the need for the extra setting of bit 4 remains unclear to
>> me: The thing that was missing was the testing of the reverse for-each.
>> You mention the need for an asymmetric input in the description, but isn't
>> that covered already by the first test using 0x80008001U?
> 
> The first test covers {arch_,}f[fl]s() only.  It happens to be safe to
> count-from-the-wrong-end bugs, but that was by chance.
> 
> The second test covers {arch_,}f[fs]sl() only.  They are unsafe WRT
> symmetry, and disjoint (coverage wise) from the first test.
> 
> The third test, while the same as the second test on x86, isn't the same
> on arm32.
> 
> 
> Just because one test happens to be safe (symmetry wise) and passes,
> doesn't make the other variants tested.

Hmm, okay, it is of course in principle possible that one flavor is screwed
while the other isn't.

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

