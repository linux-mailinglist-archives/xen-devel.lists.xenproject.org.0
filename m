Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277FF82EFAE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 14:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667763.1039341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPjQa-0005fh-Bl; Tue, 16 Jan 2024 13:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667763.1039341; Tue, 16 Jan 2024 13:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPjQa-0005cS-82; Tue, 16 Jan 2024 13:24:28 +0000
Received: by outflank-mailman (input) for mailman id 667763;
 Tue, 16 Jan 2024 13:24:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjSB=I2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPjQY-0005cL-RC
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 13:24:26 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90dbbef2-b472-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 14:24:24 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cd1232a2c7so121199841fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 05:24:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ba30-20020a0566383a9e00b0046dda6b83c1sm2906894jab.25.2024.01.16.05.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 05:24:23 -0800 (PST)
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
X-Inumbo-ID: 90dbbef2-b472-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705411464; x=1706016264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17Yq9y2+qC9IoudMhbozuPkVnchduP15fO4mVknJ9rc=;
        b=IjjJp2ViEKnxf3Kkrd595lRZr+tGhARf34shedHGz2UWnWbRdhx368lbWa73AfBrj4
         RkXV/7gaZDIm6SWSIBVvbhBFs6ML/jpXWrvgXBUSSYag9Jl2zfGaFhJYpe0LHPUP/RPz
         3deJ1DPN0t2XyrSysnm8A9hd+ri1fOyiifF8SwBr5VPqB1m90ZdoewsyMCa3eo+oy29g
         SOXc91Hzq9JqyYROpMAXtNJ7vKz2aM7mw5kaIcFmutRXVhQmeqqZ4uz3C3qP8hoGPlvY
         N86e6XDzu48ORJRZg5e70/TgyMN/Xk1lkSGu4d0yLhL9bbJ/bVLwoUICYtL5jDkxv+kT
         BaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705411464; x=1706016264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=17Yq9y2+qC9IoudMhbozuPkVnchduP15fO4mVknJ9rc=;
        b=NEv5pu8nzYdtCji3ZzsXA6PS3MPVccxfX1+lMA3NbwXmP7EXiVkBjMEsEREX09AHpn
         ptAHUmtc5MIxw+1PXyiMl+Ibgqgr92sQX3AQpMFQv9d2lMRzOLV7iCmX6sDF7Dnp5NKb
         6xF3uRqoNsyjkl90REsUsFw3TRoToW4H0b0m3I+1G/f5UutBQ55WxFZK3Mu2VVIPcdGA
         wtJn89pJ0ovC8f8wmdIcmQjcLMcukDcEqIDQP96/B3N2MOr79fQQd78i46Jrz/AzqvP/
         3ZkAnOR9Od6xP0QPlrWNi2yUcSjtY6iqTXxxK4q3spT+OUWwCFN34w317JvB4aauLu77
         z1rA==
X-Gm-Message-State: AOJu0YwDttlTXCvZ2FlUbFUD0QR4+D01ODOQrl9LZ8X6mLKW5cT5FSB6
	g/z79QzOhIQkXewNEHxj2vfJdLO8aDvF
X-Google-Smtp-Source: AGHT+IGtWnBkWDfKcheW8zADACbDWUbOVdStx79/OoJWvUigqpdiNX+XVT+m5mG7Ip3198xv4TykYA==
X-Received: by 2002:a2e:b604:0:b0:2cd:c1af:4c3e with SMTP id r4-20020a2eb604000000b002cdc1af4c3emr1570046ljn.42.1705411463983;
        Tue, 16 Jan 2024 05:24:23 -0800 (PST)
Message-ID: <88df7ccd-8d14-4b00-900d-04cc87d9f230@suse.com>
Date: Tue, 16 Jan 2024 14:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/34] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
 <23f1212a-66a8-47b0-904b-08b2ab54c72b@suse.com>
 <17d9fe474e244a15aa5955e630d553a62b0080fd.camel@gmail.com>
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
In-Reply-To: <17d9fe474e244a15aa5955e630d553a62b0080fd.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.01.2024 14:06, Oleksii wrote:
> On Mon, 2024-01-15 at 17:44 +0100, Jan Beulich wrote:
>> On 22.12.2023 16:12, Oleksii Kurochko wrote:
>>> +#define test_and_set_bit   __test_and_set_bit
>>> +#define test_and_clear_bit __test_and_clear_bit
>>
>> I realize test-and-change have no present users, despite being made
>> available by Arm and x86, but I think they would better be provided
>> right away, rather than someone introducing a use then needing to
>> fiddle with RISC-V (and apparently also PPC) code.
> Sure, it makes sense. I'll add test-and-change too.
> 
>> I'm also puzzled by this aliasing: Aren't there cheaper non-atomic
>> insn forms that could be used for the double-underscore-prefixed
>> variants?
> It will be cheaper, but I assume that this API should be safe in the
> case of SMP where different CPUs can access the same variable or
> similar cases with simultaneous access to the variable.

Of course, that's what test_and_...() are for. __test_and_...() are
for cases where there's no concurrency, when hence the cheaper forms
can be used. Thus my asking about the aliasing done above.

>>> +#if BITS_PER_LONG == 64
>>> +    if ((word & 0xffffffff) == 0) {
>>> +        num += 32;
>>> +        word >>= 32;
>>> +    }
>>
>> You're ending up with neither Xen nor Linux style this way. May I
>> suggest to settle on either?
> 
> Will it fine to rework header from Linux to Xen style? Does it make
> sense?
> I think this file can be reworked to Xen style as I don't expect that
> it will be changed since it will be merged.

You may keep Linux style or fully switch to Xen style - which one is
largely up to you. All I'm asking is to avoid introducing further
mixed-style source files.

>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/bitops/bitops-bits.h
>>> @@ -0,0 +1,10 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef _ASM_GENERIC_BITOPS_BITS_H_
>>> +#define _ASM_GENERIC_BITOPS_BITS_H_
>>> +
>>> +#define BITOP_BITS_PER_WORD     32
>>> +#define BITOP_MASK(nr)          (1UL << ((nr) %
>>> BITOP_BITS_PER_WORD))
>>
>> Why 1UL and not just 1U, when bits per word is 32?
> There is no specific reason, should 1U. ( I originally used
> BITOPS_BITS_PER_LONG ) and with introduction of asm-generic bitops
> decided to follow what other archs provide.
> 
> Regarding to the second part of the question, I don't understand it
> fully. Considering BITOP_BIT_PER_WORD definition for other archs ( ARM
> and PPC ) it is expected that word is 32 bits.

The 2nd part was explaining why I'm asking. It wasn't another question.

>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/bitops/test-bit.h
>>> @@ -0,0 +1,16 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef _ASM_GENERIC_BITOPS_TESTBIT_H_
>>> +#define _ASM_GENERIC_BITOPS_TESTBIT_H_
>>> +
>>> +/**
>>> + * test_bit - Determine whether a bit is set
>>> + * @nr: bit number to test
>>> + * @addr: Address to start counting from
>>> + */
>>> +static inline int test_bit(int nr, const volatile void *addr)
>>> +{
>>> +    const volatile unsigned int *p = addr;
>>
>> With BITOP_BITS_PER_WORD I think you really mean uint32_t here.
> Isn't it the same: 'unsigned int' and 'uint32_t'?

No, or else there wouldn't have been a need to introduce uint<N>_t (and
others) in C99. It just so happens that right now all architectures Xen
can be built for have sizeof(int) == 4 and CHAR_BITS == 8. In an arch-
specific header I would see this as less of an issue, but in a generic
header we'd better avoid encoding wrong assumptions. The one assumption
we generally make is that sizeof(int) >= 4 and CHAR_BITS >= 8 (albeit I
bet really in various places we assume CHAR_BITS == 8).

>> Also you want to make sure asm-generic/bitops/bitops-bits.h is
>> really in use here, or else an arch overriding / not using that
>> header may end up screwed.
> I am not really understand what do you mean. Could you please explain a
> little bit more.

Whichever type you use here, it needs to be in sync with
BITOP_BITS_PER_WORD. Hence you want to include the _local_ bitops-bits.h
here, such that in case of an inconsistent override by an arch the
compiler would complain about the two differring #define-s. (IOW an
arch overriding BITOP_BITS_PER_WORD cannot re-use this header as-is.)

The same may, btw, be true for others of the new headers you add - the
same #include would therefore be needed there as well.

Jan

