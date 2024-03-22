Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3088886A96
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 11:42:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696764.1087955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rncLi-0003oF-0N; Fri, 22 Mar 2024 10:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696764.1087955; Fri, 22 Mar 2024 10:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rncLh-0003lE-TW; Fri, 22 Mar 2024 10:42:09 +0000
Received: by outflank-mailman (input) for mailman id 696764;
 Fri, 22 Mar 2024 10:42:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rncLh-0003l8-18
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 10:42:09 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d38c8c14-e838-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 11:42:06 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a46ba938de0so275418866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 03:42:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 pk2-20020a170906d7a200b00a471c6b3211sm879119ejb.175.2024.03.22.03.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 03:42:05 -0700 (PDT)
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
X-Inumbo-ID: d38c8c14-e838-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711104125; x=1711708925; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1dJ1UrBAIQsxiQ+U2xQ2kU0tpjpVaJNO0/8/hVzi6M=;
        b=bJ0zbaT0TfJUZN2IEsCoMWUBXRsyX+X7CoutTqNFBdQ6qMIA/jl+4ibpMKsSPtvpX6
         xRFEkd218KaTV1HzoNURhyeEiG8H62+37YyTNn0msIGF4QvgPpmjMrwu42P0D6uUVSuq
         NsqQgWEUDupbYBHOBPtB+7EZZPh6jDqsAya5y07FlLXrkSzOWUUBGygn7MRgV1bxKpqC
         SOGe8wu7yrnq0hQlETRVknWJ7Ao0D08lKajafspNvHPOgUfv51chDZMtAQgtbnIE+iBk
         a/Ujr/Q0AFURDEdajSExYZ6Uor71inmXmuLYXRZvqZxlwOms2lIJNA/1CYnzpXUBOkXg
         EPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711104125; x=1711708925;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1dJ1UrBAIQsxiQ+U2xQ2kU0tpjpVaJNO0/8/hVzi6M=;
        b=JotcHMVpH5A2v5dmsLU4dnqNfd/VkpoB8Fo+sj3TF4OZHcIPtVXIc7f8CvXUqOxk4B
         WLd1Zq4J9/roEc8CMcfKGf6d9z7QhUz0DJVQgY+CuYaJf5ZMISzl1hJJagEoHXjAXzz9
         mNUXxFQ7EBuWwO+ilomZ403StB4kNQ3E8+K15WsE487AmpeCSaLgoYFbVGEuP7f9oo/o
         6oojFEdgXIZ3swJvtEx23/gLH2gJahpRIzVZiBiBtnZPom62TF52FiNM559R9fKxgbx9
         1m3fkxAT8UVZgirMVt5zcxRObd5wEMm5UUmTIIGJtgJEm+sT7jxAWH8cJAeT8B1/mx6Y
         uFqg==
X-Forwarded-Encrypted: i=1; AJvYcCWoPi/f9c7/XP9licXSlTi3tNPBzLBc+XVowJMa4dEwL8LQ0xPAh3ULjtt9+c6hdicVXg0DVUAewE/kUmAIfqxjwGzQ+vgUbpRqUAVCQ4E=
X-Gm-Message-State: AOJu0Yw3E0fZDbim5YyugkWzPq7t1RFAB4A6em8DUW1/yyA8WDK4PEcV
	QYAYV4/x/7zNmlqZAgQ7illWlNf4XqeIATsH+aMXyMENmiHBd79tEX4xLalcWg==
X-Google-Smtp-Source: AGHT+IGfyv7YqHl8PJbfweGRlx5EO50H9RpHsCVAcObUoKVB/sNET82a9ehcYQu6KTsVjHu1pxtENw==
X-Received: by 2002:a17:907:7ea1:b0:a47:2d4f:6fad with SMTP id qb33-20020a1709077ea100b00a472d4f6fadmr1449721ejc.39.1711104125557;
        Fri, 22 Mar 2024 03:42:05 -0700 (PDT)
Message-ID: <a240f07f-a6f9-447e-b607-c3769e1f7af8@suse.com>
Date: Fri, 22 Mar 2024 11:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/20] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <bf65ce1ff5f683cc6b638fa7de0c54d5e0aead33.1710517542.git.oleksii.kurochko@gmail.com>
 <6f73368c-ea73-4d86-a6a1-8f9784c4b01f@suse.com>
 <ce522fd6be6169296789efd35ed8af18967f2958.camel@gmail.com>
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
In-Reply-To: <ce522fd6be6169296789efd35ed8af18967f2958.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.03.2024 11:32, Oleksii wrote:
> On Thu, 2024-03-21 at 13:07 +0100, Jan Beulich wrote:
>> On 15.03.2024 19:06, Oleksii Kurochko wrote:
>>> The header was taken from Linux kernl 6.4.0-rc1.
>>>
>>> Addionally, were updated:
>>> * add emulation of {cmp}xchg for 1/2 byte types using 32-bit atomic
>>>   access.
>>> * replace tabs with spaces
>>> * replace __* variale with *__
>>> * introduce generic version of xchg_* and cmpxchg_*.
>>> * drop {cmp}xchg{release,relaxed,acquire} as Xen doesn't use them
>>
>> With this, ...
>>
>>> * drop barries and use instruction suffixices instead ( .aq, .rl,
>>> .aqrl )
>>>
>>> Implementation of 4- and 8-byte cases were updated according to the
>>> spec:
>>> ```
>>>               ....
>>> Linux Construct         RVWMO AMO Mapping
>>> atomic <op> relaxed     amo<op>.{w|d}
>>> atomic <op> acquire     amo<op>.{w|d}.aq
>>> atomic <op> release     amo<op>.{w|d}.rl
>>> atomic <op>             amo<op>.{w|d}.aqrl
>>> Linux Construct         RVWMO LR/SC Mapping
>>> atomic <op> relaxed     loop: lr.{w|d}; <op>; sc.{w|d}; bnez loop
>>> atomic <op> acquire     loop: lr.{w|d}.aq; <op>; sc.{w|d}; bnez
>>> loop
>>> atomic <op> release     loop: lr.{w|d}; <op>; sc.{w|d}.aqrl∗ ; bnez
>>> loop OR
>>>                         fence.tso; loop: lr.{w|d}; <op>; sc.{w|d}∗
>>> ; bnez loop
>>> atomic <op>             loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl;
>>> bnez loop
>>>
>>> Table A.5: Mappings from Linux memory primitives to RISC-V
>>> primitives
>>>
>>> ```
>>
>> ... I consider quoting this table in full, without any further
>> remarks, as
>> confusing: Three of the lines each are inapplicable now, aiui.
> I'll shorten the table then.
> 
>>
>> Further what are the two * telling us? Quite likely they aren't there
>> just
>> accidentally.
>>
>> Finally, why sc.{w|d}.aqrl when in principle one would expect just
>> sc.{w|d}.rl?
> Because according to the last line of table A.5:
>     atomic <op>             loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl;
> Here it is used sc.{w|d}.aqrl form, so I decided to stick to the what
> is mentioned in the table.

I understand it's mentioned that way in the table. But it being that way
is not explained anywhere. Hence my "Why?"

>>> +    __typeof__(*(ptr)) old__ = (__typeof__(*(ptr)))(old); \
>>> +    __typeof__(*(ptr)) new__ = (__typeof__(*(ptr)))(new); \
>>
>> The casts aren't very nice to have here; I take they're needed for
>> cmpxchg_ptr() to compile?
> Not really, I have not faced an compilation issue.
> The reason why it was added is that lr instruction places the sign-
> extended value in destination register, but if not to do cast value for
> old and new were generated without sign extension, so, for example:
>    u32= 0xbbbbbbbb;
>    cmpxchg(&u32, 0xbbbbbbbb, 0xCCCCCCCC), u32);
> Will fail because after:
>        "0: lr" lr_sfx " %0, %2\n" 
> in %0 we will have 0xFFFFFFFFBBBBBBBB, but in %3 we will have
> 0xBBBBBBBB, so
>        bne  %0, %z3, 1f\n"
> %0 and %3 are always inequal in case when the most significat bit of
> value read from %2 has 1.

I'm afraid I don't follow: It's the type conversion you're after, but
that would happen also with the casts omitted.

> But now I realized that it would be better just to use a mask and not
> be dependent from compiler code generation, so it would be better to in
> the following way ( of course, the macros should be updated accordingly
> to remarks you give me ):
>    #define __generic_cmpxchg(ptr, old, new, ret, lr_sfx, sc_sfx)	\
>     ({ \
>        register unsigned int rc; \
>        unsigned long mask = GENMASK(((sizeof(*(ptr))) * BITS_PER_BYTE)
>    - 1, 0); \
>        asm volatile( \
>            "0: lr" lr_sfx " %0, %2\n" \
>            "   and  %0, %0, %z[mask]\n" \
>            "   bne  %0, %z3, 1f\n" \
>            "   sc" sc_sfx " %1, %z4, %2\n" \
>            "   bnez %1, 0b\n" \
>            "1:\n" \
>            : "=&r" (ret), "=&r" (rc), "+A" (*ptr) \
>            : "rJ" (old), "rJ" (new), [mask] "rJ" (mask)  \
>            : "memory"); \
>     })

It'll be up to you whether to switch to such an alternative.

Jan

