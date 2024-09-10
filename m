Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D53973CF1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 18:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795843.1205312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3N6-0004eF-DW; Tue, 10 Sep 2024 16:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795843.1205312; Tue, 10 Sep 2024 16:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3N6-0004cT-As; Tue, 10 Sep 2024 16:05:40 +0000
Received: by outflank-mailman (input) for mailman id 795843;
 Tue, 10 Sep 2024 16:05:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so3N5-0004c7-B6
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 16:05:39 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 844ba2c5-6f8e-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 18:05:36 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c255e3c327so6119819a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 09:05:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd52099sm4380319a12.48.2024.09.10.09.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 09:05:35 -0700 (PDT)
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
X-Inumbo-ID: 844ba2c5-6f8e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725984336; x=1726589136; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TdBzmckkVFVYuhnTRUoZaKXWMLhkF5C32rHYhvlkU5E=;
        b=WFhe8yjNpy1a4l9NyjDWKt/hOcWCjU0/43jNVrcTiEi4Hlnz9X568bBVLIhIc6mymL
         D19ahte5tdZez/ZAQxtor15B7imQZ6PA6Q000dy+guWVJbiaFRR7hxEbffP+305QDmT3
         EyZrDYdwpFgrEBoC4C+j1QljaO0TkmTcTAm4Hnl9SRrOdGWM5wZxnBJsE9AehjQeZtKf
         EZj34KrUiXNsMU3MLo5Xig0EsZq5MMbMDvuc+QQ/A97cf/+OUR4xVbBJZw085vzzkQDS
         NyctMthmx3ML8I8fiEaOwFm+dHr4RiFF/q7j1SRl9kLZPPQs8F0WAWNa7qKvHiOUuP0P
         5csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725984336; x=1726589136;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdBzmckkVFVYuhnTRUoZaKXWMLhkF5C32rHYhvlkU5E=;
        b=MlD1VyUfuq5w6C7+QiEErMC8Ja2ONhP9TUy6p8POnaridN7lhJHdS2M4X6iQ9AdkQS
         0QjybPhH58lCGAQ4sP8iY5FWiP4F5A44Vv9Gpe2Hj3NqJhAD1USLny53GpdW562xfzwi
         lFosSzYlgJb7APVPvre2DEiRcgMPpPzLYfX1gOoCnRKwOiXoRbLY4/mfBlyn0dkuym3W
         PdEpJwLkRuVOM9eXqkOKelWfNbHW+V/txD2K/jmreSvdXYjk+12izT/S45POBwFnyyuJ
         oVn4CZUGVYfWgEk+0mQXZSgguhGsk8BtPCA5UFgAOrKe7v/LeW1w5rjCs1Z0zHU3eni8
         soOw==
X-Forwarded-Encrypted: i=1; AJvYcCVxSMLkH15bt3oxTCkJFrPvhMt0FLcnpEn+aQXHcYgpBRHGqtiPigs7bDIzIlBRDrh/u/uLqr23i7A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIsme92UdsNJvCaiyiFO5tQMC6nEIgVomVfm100mFIFCg8OTdQ
	l/BqBUNgxOFv1XP39X3ngyTvi49PLhvUjEYo4TqY0DXSHP+zdoIlHTch6Ulv9A==
X-Google-Smtp-Source: AGHT+IHj5JV5E9GTLBCKlpNIwqq5lyfYI3OmyGsUuZzYv6DyEGTvIgj85p3UXwOi5s8AwCe4q0q3Ng==
X-Received: by 2002:a05:6402:4306:b0:5c3:3f6a:7dd3 with SMTP id 4fb4d7f45d1cf-5c3dc798bd7mr10442570a12.15.1725984336189;
        Tue, 10 Sep 2024 09:05:36 -0700 (PDT)
Message-ID: <20a1a3ae-95c4-4568-9cd3-a4f023940b73@suse.com>
Date: Tue, 10 Sep 2024 18:05:35 +0200
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
In-Reply-To: <c571f1d2760ea09b6e9dba41c8d6a056a2b69c23.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2024 17:28, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-09-10 at 11:53 +0200, Jan Beulich wrote:
>> On 02.09.2024 19:01, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/atomic.h
>>> +++ b/xen/arch/riscv/include/asm/atomic.h
>>> @@ -54,16 +54,16 @@ static always_inline void
>>> read_atomic_size(const volatile void *p,
>>>  })
>>>  
>>>  static always_inline void _write_atomic(volatile void *p,
>>> -                                        unsigned long x,
>>> +                                        void *x,
>>
>> Pointer-to-const please, to further aid in easily recognizing which
>> parameter is what. After all ...
>>
>>>                                          unsigned int size)
>>>  {
>>>      switch ( size )
>>>      {
>>> -    case 1: writeb_cpu(x, p); break;
>>> -    case 2: writew_cpu(x, p); break;
>>> -    case 4: writel_cpu(x, p); break;
>>
>> ... unhelpfully enough parameters are then swapped, just to confuse
>> things.
> If it would be better to keep 'unsigned long' as the type of x, then,
> if I am not mistaken, write_atomic() should be updated in the following
> way:
>    #define write_atomic(p, x)                              \
>    ({                                                      \
>        typeof(*(p)) x_ = (x);                              \
>        _write_atomic(p, *(unsigned long *)&x_, sizeof(*(p)));            
>    \
>    })
> However, I am not sure if it is safe when x is a 2-byte value (for
> example) that it will read more than 2 bytes before passing the value
> to the _write_atomic() function.

No, that's definitely unsafe.

>>> @@ -72,7 +72,7 @@ static always_inline void _write_atomic(volatile
>>> void *p,
>>>  #define write_atomic(p, x)                              \
>>>  ({                                                      \
>>>      typeof(*(p)) x_ = (x);                              \
>>> -    _write_atomic(p, x_, sizeof(*(p)));                 \
>>> +    _write_atomic(p, &x_, sizeof(*(p)));                \
>>>  })
>>>  
>>>  static always_inline void _add_sized(volatile void *p,
>>> @@ -82,27 +82,23 @@ static always_inline void _add_sized(volatile
>>> void *p,
>>>      {
>>>      case 1:
>>>      {
>>> -        volatile uint8_t *ptr = p;
>>> -        write_atomic(ptr, read_atomic(ptr) + x);
>>> +        writeb_cpu(readb_cpu(p) + x, p);
>>>          break;
>>>      }
>>>      case 2:
>>>      {
>>> -        volatile uint16_t *ptr = p;
>>> -        write_atomic(ptr, read_atomic(ptr) + x);
>>> +        writew_cpu(readw_cpu(p) + x, p);
>>>          break;
>>>      }
>>>      case 4:
>>>      {
>>> -        volatile uint32_t *ptr = p;
>>> -        write_atomic(ptr, read_atomic(ptr) + x);
>>> +        writel_cpu(readl_cpu(p) + x, p);
>>>          break;
>>>      }
>>>  #ifndef CONFIG_RISCV_32
>>>      case 8:
>>>      {
>>> -        volatile uint64_t *ptr = p;
>>> -        write_atomic(ptr, read_atomic(ptr) + x);
>>> +        writeq_cpu(readw_cpu(p) + x, p);
>>>          break;
>>>      }
>>>  #endif
>>
>> I'm afraid I don't understand this part, or more specifically the
>> respective
>> part of the description. It is the first parameter of write_atomic()
>> which is
>> volatile qualified. And it is the first argument that's volatile
>> qualified
>> here. Isn't the problem entirely unrelated to volatile-ness, and
>> instead a
>> result of the other parameter changing from scalar to pointer type,
>> which
>> doesn't fit the addition expressions you pass in?
> if _add_sized() is defined as it was before:
>    static always_inline void _add_sized(volatile void *p,
>                                         unsigned long x, unsigned int
>    size)
>    {
>        switch ( size )
>        {
>        case 1:
>        {
>            volatile uint8_t *ptr = p;
>            write_atomic(ptr, read_atomic(ptr) + x);
>            break;
>        }
>    ...
> Then write_atomic(ptr, read_atomic(ptr) + x) will be be changed to:
>    volatile uint8_t x_ = (x);
>    
> And that will cause a compiler error:
>    ./arch/riscv/include/asm/atomic.h:75:22: error: passing argument 2
>    of '_write_atomic' discards 'volatile' qualifier from pointer target
>    type [-Werror=discarded-qualifiers]
>       75 |     _write_atomic(p, &x_, sizeof(*(p)));
> Because it can't cast 'volatile uint8_t *' to 'void *':
>    expected 'void *' but argument is of type 'volatile uint8_t *' {aka
>    'volatile unsigned char *'}

Oh, I think I see now. What we'd like write_atomic() to derive is the bare
(unqualified) type of *ptr, yet iirc only recent compilers have a way to
obtain that.

Jan

