Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F124975112
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 13:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796473.1206076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soLrA-0005Fh-UG; Wed, 11 Sep 2024 11:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796473.1206076; Wed, 11 Sep 2024 11:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soLrA-0005EC-R6; Wed, 11 Sep 2024 11:49:56 +0000
Received: by outflank-mailman (input) for mailman id 796473;
 Wed, 11 Sep 2024 11:49:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soLr9-0005E6-EX
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 11:49:55 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5401d6e-7033-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 13:49:53 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8a7929fd64so894813666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 04:49:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c72757sm603800866b.103.2024.09.11.04.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 04:49:52 -0700 (PDT)
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
X-Inumbo-ID: f5401d6e-7033-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726055393; x=1726660193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X/LQJiwskFLogeEPC1rENWxhVBEaeNhGqNM57ViwNd0=;
        b=W+WZ/qAHz5yd+0/yVuCaI6OTwehI8QlC9BHbEcKCXCdYa1GB2yNLTkJfAfCtsptNsA
         UCDfwUjcUT7l4A+gYR4cRJmhICSGfWUKQnyuqRJ40OWCmtAyRafxxEYdVKsYUmqq2KE2
         mCAcj2MzrIH6JczgStgfY0Opgg3HcT2FVZKa1gAH8NFRNnrZZK2f817D65EL/2j80a/L
         /r+BHCljEmhAmrGWJldsQgxKoZ2vqjS3QyOxj/QK5WBG7cHPyE/IUwi5iJ8RyDmBrtvL
         9kkKKKmpDwvkvzb6n3vnO1dveYtU/IL5T5jAdus7QN76jBBJJp4z3qmdQI6LurEQ7Cbv
         I/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726055393; x=1726660193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/LQJiwskFLogeEPC1rENWxhVBEaeNhGqNM57ViwNd0=;
        b=wIk6SwiZZZUaGyr4lLErgL4dMakQO2CFX3VJZkiwtS062WF14UaBpi37js9tSqFxNL
         kvr4zDl333uXpzornXk3gt7pZpDoLnkYAF+P/eNPW+PDoH/oQrkRtbyCwWs1vTd/mIQx
         k8hq5Mr9xvmXxjjVeZJPyypjQhz8m4ECVUbbSUao6NM28r/cIaYqYpGrezOXPtp3Jd0x
         nFAsgtEnCMYXR/UWcPknqoDfalHYEqM4niR14VIlqVTM16iyQSmy7PftFamEejIP6No8
         O/6wijrH7jT4OXcFstHu+KZ5aGs7GSelaRpTvofsbDu+YuEwWhotihNKC0UVDiKmcmwa
         rK9A==
X-Forwarded-Encrypted: i=1; AJvYcCUFWCOmiqDHVJ8Fm2kAE8peVNMFOwMMDgWyG35xXYFA/w7+sDSMBbwGtkxDUkcFP6Myx2dkitTLEHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSikJBNKjxngdqyLtSynwuAeGWT6jv/VvaldtFovjPeaEezgtU
	Tq4+izh/gE0PumEw/HJJbbOg+9iOL8tWjPymOVMMdjjDSKov+SDwbSPZoNfcpA==
X-Google-Smtp-Source: AGHT+IF+oUlHBhFRUtnP6UQ6wJBIokjouP6vNG9Utyzc59RVvZVAHmY0qIQeywI3lBm5nlBS68OGXA==
X-Received: by 2002:a17:906:c10b:b0:a8a:792c:4116 with SMTP id a640c23a62f3a-a8ffade1622mr304463866b.40.1726055392623;
        Wed, 11 Sep 2024 04:49:52 -0700 (PDT)
Message-ID: <59d3ef0f-dc1d-4d6e-9e1e-4fb3550113a8@suse.com>
Date: Wed, 11 Sep 2024 13:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] xen/riscv: allow write_atomic() to work with
 non-scalar types
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <44810c0c3faa4fd2d36a8be9a87c5022088c0e62.1725295716.git.oleksii.kurochko@gmail.com>
 <687511c2-2c0a-4766-9eb7-427bd648565b@suse.com>
 <c571f1d2760ea09b6e9dba41c8d6a056a2b69c23.camel@gmail.com>
 <20a1a3ae-95c4-4568-9cd3-a4f023940b73@suse.com>
 <bdbf7bbbdb7ec22b157797fe3c09c13a9829f1d6.camel@gmail.com>
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
In-Reply-To: <bdbf7bbbdb7ec22b157797fe3c09c13a9829f1d6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.09.2024 13:34, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-09-10 at 18:05 +0200, Jan Beulich wrote:
>> On 10.09.2024 17:28, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-09-10 at 11:53 +0200, Jan Beulich wrote:
>>>> On 02.09.2024 19:01, Oleksii Kurochko wrote:
>>>>> @@ -72,7 +72,7 @@ static always_inline void
>>>>> _write_atomic(volatile
>>>>> void *p,
>>>>>  #define write_atomic(p, x)                              \
>>>>>  ({                                                      \
>>>>>      typeof(*(p)) x_ = (x);                              \
>>>>> -    _write_atomic(p, x_, sizeof(*(p)));                 \
>>>>> +    _write_atomic(p, &x_, sizeof(*(p)));                \
>>>>>  })
>>>>>  
>>>>>  static always_inline void _add_sized(volatile void *p,
>>>>> @@ -82,27 +82,23 @@ static always_inline void
>>>>> _add_sized(volatile
>>>>> void *p,
>>>>>      {
>>>>>      case 1:
>>>>>      {
>>>>> -        volatile uint8_t *ptr = p;
>>>>> -        write_atomic(ptr, read_atomic(ptr) + x);
>>>>> +        writeb_cpu(readb_cpu(p) + x, p);
>>>>>          break;
>>>>>      }
>>>>>      case 2:
>>>>>      {
>>>>> -        volatile uint16_t *ptr = p;
>>>>> -        write_atomic(ptr, read_atomic(ptr) + x);
>>>>> +        writew_cpu(readw_cpu(p) + x, p);
>>>>>          break;
>>>>>      }
>>>>>      case 4:
>>>>>      {
>>>>> -        volatile uint32_t *ptr = p;
>>>>> -        write_atomic(ptr, read_atomic(ptr) + x);
>>>>> +        writel_cpu(readl_cpu(p) + x, p);
>>>>>          break;
>>>>>      }
>>>>>  #ifndef CONFIG_RISCV_32
>>>>>      case 8:
>>>>>      {
>>>>> -        volatile uint64_t *ptr = p;
>>>>> -        write_atomic(ptr, read_atomic(ptr) + x);
>>>>> +        writeq_cpu(readw_cpu(p) + x, p);
>>>>>          break;
>>>>>      }
>>>>>  #endif
>>>>
>>>> I'm afraid I don't understand this part, or more specifically the
>>>> respective
>>>> part of the description. It is the first parameter of
>>>> write_atomic()
>>>> which is
>>>> volatile qualified. And it is the first argument that's volatile
>>>> qualified
>>>> here. Isn't the problem entirely unrelated to volatile-ness, and
>>>> instead a
>>>> result of the other parameter changing from scalar to pointer
>>>> type,
>>>> which
>>>> doesn't fit the addition expressions you pass in?
>>> if _add_sized() is defined as it was before:
>>>    static always_inline void _add_sized(volatile void *p,
>>>                                         unsigned long x, unsigned
>>> int
>>>    size)
>>>    {
>>>        switch ( size )
>>>        {
>>>        case 1:
>>>        {
>>>            volatile uint8_t *ptr = p;
>>>            write_atomic(ptr, read_atomic(ptr) + x);
>>>            break;
>>>        }
>>>    ...
>>> Then write_atomic(ptr, read_atomic(ptr) + x) will be be changed to:
>>>    volatile uint8_t x_ = (x);
>>>    
>>> And that will cause a compiler error:
>>>    ./arch/riscv/include/asm/atomic.h:75:22: error: passing argument
>>> 2
>>>    of '_write_atomic' discards 'volatile' qualifier from pointer
>>> target
>>>    type [-Werror=discarded-qualifiers]
>>>       75 |     _write_atomic(p, &x_, sizeof(*(p)));
>>> Because it can't cast 'volatile uint8_t *' to 'void *':
>>>    expected 'void *' but argument is of type 'volatile uint8_t *'
>>> {aka
>>>    'volatile unsigned char *'}
>>
>> Oh, I think I see now. What we'd like write_atomic() to derive is the
>> bare
>> (unqualified) type of *ptr, yet iirc only recent compilers have a way
>> to
>> obtain that.
> I assume that you are speaking about typeof_unqual which requires C23
> (?).

What C version it requires doesn't matter much for our purposes. The
question is as of which gcc / clang version (if any) this is supported
as an extension.

> __auto_type seems to me can also drop volatile quilifier but in the
> docs I don't see that it should (or not) discard qualifier. Could it be
> an option:
>    #define write_atomic(p, x)                              \
>    ({                                                      \
>        __auto_type x_ = (x);                              \
>        _write_atomic(p, &x_, sizeof(*(p)));                 \
>    })

For our purposes __auto_type doesn't provide advantages over typeof().
Plus, more importantly, the use above is wrong, just like typeof(x)
would also be wrong. It needs to be p that the type is derived from.
Otherwise consider what happens when ptr is unsigned long * or
unsigned short * and you write

    write_atomic(ptr, 0);

> And another option could be just drop volatile by casting:
>    #define write_atomic(p, x)                              \
>    ...
>        _write_atomic(p, (const void *)&x_, sizeof(*(p)));                 

See what I said earlier about casts: You shall not cast away
qualifiers. Besides doing so being bad practice, you'll notice the
latest when RISC-V code also becomes subject to Misra compliance.

Jan

