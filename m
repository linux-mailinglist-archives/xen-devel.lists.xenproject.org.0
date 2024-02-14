Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A53B854815
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:20:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680582.1058576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDJC-0006eZ-89; Wed, 14 Feb 2024 11:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680582.1058576; Wed, 14 Feb 2024 11:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDJC-0006co-2g; Wed, 14 Feb 2024 11:20:10 +0000
Received: by outflank-mailman (input) for mailman id 680582;
 Wed, 14 Feb 2024 11:20:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raDJA-0006ch-3V
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:20:08 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00b9312b-cb2b-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 12:20:05 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-410e676c6bbso14394615e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:20:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b00410e90e82ebsm1677669wmo.4.2024.02.14.03.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 03:20:04 -0800 (PST)
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
X-Inumbo-ID: 00b9312b-cb2b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707909605; x=1708514405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rt1gKRJfgTQ1hdAu1e9zYcBvohmGTmI3u928D67LkQ0=;
        b=CSWAlZktdEkolTR8fqCO73GNfmDKxuAwlG8JNVI8OLQLscM6DLQgthO2r0ikMBWcBo
         9XRdmRL7EAwOmEyFFkdi7rVf79KO5bAVCieeG8vAVP8i1/w8WxcN/HfpclQF8hg73LH9
         oOHLzPDKEeFuQbH9ws3XPdNa4kbZxIpnh0tlx5pYtzVwMfAeHLYVJd4tK2SNtfQHL3LN
         bK9rrqqgiPesTICCT+h+ATOy27SA8mzeCetAaVDTmm1m/BIE5B1Qw70JtLzOWmm6y1DI
         m0MgUg22T8jhT8aOAbrh+LuS49YjknSCt2BvXw3o9saf517UkzvGGnoJ7h2AeEkcx1BG
         XRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707909605; x=1708514405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rt1gKRJfgTQ1hdAu1e9zYcBvohmGTmI3u928D67LkQ0=;
        b=bQu9N0du5Dm3vYp0zDaO2ALwprlSKHpbICBtSsSV2sRFGNh6BhxWMsS6506dp2XJCa
         UHS90flxKs3Y1KKzmxhp52FLHaLNyzFHg8woQxD0Gla/uYv8K3N816X8FhYxySECJmgE
         5EUcatwk03CghEP3EN8NvMJhTyYfldCgZNlqdFYWukFZ7laQhYRwqX8MdqsAZ0NKT0qg
         h1J3YJnmDlyKbsT4flQHWCmQVkUedSE5sWQJUo+Ju++AsuajcQWFjS1LRyMUlvYvm0M3
         x9U8fGA9sLAPy6sthIArEKYpTtirC3pSlklA3NRUc86MqVCi7BD9yjsLUnKQzA6/ssoI
         Kxxg==
X-Forwarded-Encrypted: i=1; AJvYcCUbL0QVJLsGw9iPs6g6g/FecAWNercJHKvc+A4ZUhGlxZpO0exUuz/vXhgEN6cqJWBaDaoijdEwFar1rsXWgXNGRjv+ZajLEKE2DniozAE=
X-Gm-Message-State: AOJu0Yy5oGQADecwv7ruL5GJ4tMprw4pvwsjNwwYA6sQtrHmjjHn04ut
	dMXr/nc2DIffMbsiCCzNjUwiztnAH1AUvALYmRYkRvFVzjM8La6V271HZ8aOEQ==
X-Google-Smtp-Source: AGHT+IFjLkaqewCMOPDe0RsfnfaBR25sKq8cXcWypbnvWnvEYgaOsIUqdyzDYP8F9K2FW/QHXrfq9g==
X-Received: by 2002:a05:600c:518e:b0:411:e398:9eff with SMTP id fa14-20020a05600c518e00b00411e3989effmr1255518wmb.37.1707909604664;
        Wed, 14 Feb 2024 03:20:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6Iz8ndJ/Xn1eGE1NzMirEKgaX2wdgH8i6OY9Uc73NOAjdGUtguzagfxiBlafKXAd0pCoGbgf0IxHtZosM2i3CM1PCeTAk8G8M2FZkt+FjLyVd4EYUkjU2HxMchex7A3xauro0wc3BAM6eytLhdrc6v7rt2Y5S83iHsXigbOp41RvgZjO6SyF4LSL32F10KMTiIniJ0Q8dCcgi+VpdapXt6ManFKe9SJTJjhLeLK+4hXxrlBymN3tzPhERPkM3SzD5fKsJH6cwfgxZRjy1SZR+OT99bd7Un2wUH6AGaM3Qu7c9RmphLXA=
Message-ID: <905ad2e9-ed7f-41f1-a660-456241dd059c@suse.com>
Date: Wed, 14 Feb 2024 12:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/30] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <f76bd85f4b64a47c59c0b306ce425036819fa380.1707146506.git.oleksii.kurochko@gmail.com>
 <b13fd044-c6db-45ab-83d0-3d02221967ed@suse.com>
 <655eed7d1af08936ee3f42a0b88eeb2e197434e2.camel@gmail.com>
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
In-Reply-To: <655eed7d1af08936ee3f42a0b88eeb2e197434e2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2024 12:06, Oleksii wrote:
> On Mon, 2024-02-12 at 16:58 +0100, Jan Beulich wrote:
>> On 05.02.2024 16:32, Oleksii Kurochko wrote:
>>> +({                                                      \
>>> +    unsigned long __res, __mask;                        \
>>
>> Leftover leading underscores?
> It is how it was defined in Linux, so I thought that I've to leave it
> as it, but I am OK to rename this variables in next patch version.

My view: If you retain Linux style, retaining such names is also (kind
of) okay. If you convert to Xen style, then name changes are to occur
as part of that conversion.

>>> +    __mask = BIT_MASK(nr);                              \
>>> +    __asm__ __volatile__ (                              \
>>> +        __AMO(op) #ord " %0, %2, %1"                    \
>>> +        : "=r" (__res), "+A" (addr[BIT_WORD(nr)])       \
>>> +        : "r" (mod(__mask))                             \
>>> +        : "memory");                                    \
>>> +    ((__res & __mask) != 0);                            \
>>> +})
>>> +
>>> +#define __op_bit_ord(op, mod, nr, addr, ord)    \
>>> +    __asm__ __volatile__ (                      \
>>> +        __AMO(op) #ord " zero, %1, %0"          \
>>> +        : "+A" (addr[BIT_WORD(nr)])             \
>>> +        : "r" (mod(BIT_MASK(nr)))               \
>>> +        : "memory");
>>> +
>>> +#define __test_and_op_bit(op, mod, nr, addr)    \
>>> +    __test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
>>> +#define __op_bit(op, mod, nr, addr) \
>>> +    __op_bit_ord(op, mod, nr, addr, )
>>> +
>>> +/* Bitmask modifiers */
>>> +#define __NOP(x)    (x)
>>> +#define __NOT(x)    (~(x))
>>
>> Here the (double) leading underscores are truly worrying: Simple
>> names like this aren't impossible to be assigned meaninb by a
>> compiler.
> I am not really understand what is the difference for a compiler
> between NOP and __NOP? Do you mean that the leading double underscores
> (__) are often used to indicate that these macros are implementation-
> specific and might be reserved for the compiler or the standard
> library?

It's not "often used". Identifiers starting with two underscores or an
underscore and a capital letter are reserved for the implementation
(i.e. for the compiler's internal use). When not overly generic we
stand a fair chance of getting away. But NOP and NOT are pretty generic.

>>> +#include <asm-generic/bitops/fls.h>
>>> +#include <asm-generic/bitops/flsl.h>
>>> +#include <asm-generic/bitops/__ffs.h>
>>> +#include <asm-generic/bitops/ffs.h>
>>> +#include <asm-generic/bitops/ffsl.h>
>>> +#include <asm-generic/bitops/ffz.h>
>>> +#include <asm-generic/bitops/find-first-set-bit.h>
>>> +#include <asm-generic/bitops/hweight.h>
>>> +#include <asm-generic/bitops/test-bit.h>
>>
>> To be honest there's too much stuff being added here to asm-generic/,
>> all in one go. I'll see about commenting on the remaining parts here,
>> but I'd like to ask that you seriously consider splitting.
> Would it be better to send it outside of this patch series? I can
> create a separate patch series with a separate patch for each asm-
> generic/bitops/*.h

Not sure. Depends in part on whether then you'd effectively introduce
dead code. If the introduction was such that RISC-V used the new ones
right away, then yes, that would quite likely be better.

Jan

