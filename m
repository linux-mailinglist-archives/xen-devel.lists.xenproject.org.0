Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7F1830463
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 12:18:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668402.1040587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3vX-0002u8-NP; Wed, 17 Jan 2024 11:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668402.1040587; Wed, 17 Jan 2024 11:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3vX-0002ro-Jj; Wed, 17 Jan 2024 11:17:47 +0000
Received: by outflank-mailman (input) for mailman id 668402;
 Wed, 17 Jan 2024 11:17:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ3vX-0002qU-02
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 11:17:47 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a10f262-b52a-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 12:17:45 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cca8eb0509so135498461fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 03:17:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a23-20020a6b6c17000000b007bee386f29csm3193159ioh.20.2024.01.17.03.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 03:17:44 -0800 (PST)
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
X-Inumbo-ID: 0a10f262-b52a-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705490265; x=1706095065; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fj3RPdaeIbc6PRv+5XDFMUhH59x+TJHSW35AJ64jnMA=;
        b=bQS8n1ZCHb/V1cwo/5zHfbWsDVpftZ4WvJRXxr/PeEDZ76vYAgnfRl1SgDSJGNS6mO
         sfISHmNdGLC4iXzsl+dFAWR/QDbRGoNzlaOXQQppF0xyoE5iZ/F/G5UWoIHYhedvzbid
         B+1Iad5tNAvZKsfHSYOElQ9pbJBAC4lhS667TeQYpiHn5nBoyLP74cxdFBpt8lWxHMYQ
         26ABqA3KtmdlAEr7Qmrr1rW6g9iQ7ZadRGYA5F5bX8azi9s8BabsjiX/bf6FlOOh8kg5
         7RZ8xIR8ugUyBa2AOnlaoLq0AdYrWR4cIggEX1iMZxb7MViJwxxi7AcEIC5dQnYJTSnP
         zGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705490265; x=1706095065;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fj3RPdaeIbc6PRv+5XDFMUhH59x+TJHSW35AJ64jnMA=;
        b=TdO0SBwUbmHu6UkL+e8r/tW3u0Wf3gmsUPRp26ERvlOIV4duFg2R+HJyrKBZUJfANB
         QkiWYSSTfcUPC0p1oWL/hFRQlX7QC7CPWoAqYW7M09mPXk+CqyUziF1m8sCRJnyMQmDl
         DiTuKjqHrf2/F3sJLKDLd2CLC7049A8JarppRxzjuEWQh6C+JlTAiopHeeBQDc8wJ5nw
         9+jBFG9R8I1vVNQAy0eE9vVzhdWVXkscll/5qlRycGkaqomvLuSf7ZzfWJIIR/fjRkIo
         LdbDgpnoF78l4gWrWPlBTy4N6smjgY5kEy5rxc33sv6ki3XSa2+a/iRZ1QnfYGPzQS8D
         /mSQ==
X-Gm-Message-State: AOJu0YzKK/PNnS7X5htQRcLVGgk66mp5/GSX3DLyEK00DIu4A77yeV3R
	/IirSbQzsO6RimIvv3WuA9chkDB1zNpH
X-Google-Smtp-Source: AGHT+IENQKVFLFP5rJkH5vcoCyEBvkqCDeioCgtJwW1vSxcm4MBX6X6L0YsItG7MpjTGN1FAjWVCmA==
X-Received: by 2002:a2e:9ec4:0:b0:2cd:241c:848d with SMTP id h4-20020a2e9ec4000000b002cd241c848dmr3585767ljk.103.1705490265230;
        Wed, 17 Jan 2024 03:17:45 -0800 (PST)
Message-ID: <2e10b170-5a75-4ae0-8d2f-c6c1ad9951a5@suse.com>
Date: Wed, 17 Jan 2024 12:17:41 +0100
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
 <88df7ccd-8d14-4b00-900d-04cc87d9f230@suse.com>
 <863b09f03d37e96d737ab6bda4cc8923f75550fd.camel@gmail.com>
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
In-Reply-To: <863b09f03d37e96d737ab6bda4cc8923f75550fd.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.01.2024 12:13, Oleksii wrote:
> On Tue, 2024-01-16 at 14:24 +0100, Jan Beulich wrote:
>> On 16.01.2024 14:06, Oleksii wrote:
>>> On Mon, 2024-01-15 at 17:44 +0100, Jan Beulich wrote:
>>>> On 22.12.2023 16:12, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/include/asm-generic/bitops/test-bit.h
>>>>> @@ -0,0 +1,16 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>> +#ifndef _ASM_GENERIC_BITOPS_TESTBIT_H_
>>>>> +#define _ASM_GENERIC_BITOPS_TESTBIT_H_
>>>>> +
>>>>> +/**
>>>>> + * test_bit - Determine whether a bit is set
>>>>> + * @nr: bit number to test
>>>>> + * @addr: Address to start counting from
>>>>> + */
>>>>> +static inline int test_bit(int nr, const volatile void *addr)
>>>>> +{
>>>>> +    const volatile unsigned int *p = addr;
>>>>
>>>> With BITOP_BITS_PER_WORD I think you really mean uint32_t here.
>>> Isn't it the same: 'unsigned int' and 'uint32_t'?
>>
>> No, or else there wouldn't have been a need to introduce uint<N>_t
>> (and
>> others) in C99. It just so happens that right now all architectures
>> Xen
>> can be built for have sizeof(int) == 4 and CHAR_BITS == 8. In an
>> arch-
>> specific header I would see this as less of an issue, but in a
>> generic
>> header we'd better avoid encoding wrong assumptions. The one
>> assumption
>> we generally make is that sizeof(int) >= 4 and CHAR_BITS >= 8 (albeit
>> I
>> bet really in various places we assume CHAR_BITS == 8).
> In this case we have to switch to uint<N>_t.
> Thanks for the explanation. I'll update this part of code in the next
> patch version.
> 
>>
>>>> Also you want to make sure asm-generic/bitops/bitops-bits.h is
>>>> really in use here, or else an arch overriding / not using that
>>>> header may end up screwed.
>>> I am not really understand what do you mean. Could you please
>>> explain a
>>> little bit more.
>>
>> Whichever type you use here, it needs to be in sync with
>> BITOP_BITS_PER_WORD. Hence you want to include the _local_ bitops-
>> bits.h
>> here, such that in case of an inconsistent override by an arch the
>> compiler would complain about the two differring #define-s. (IOW an
>> arch overriding BITOP_BITS_PER_WORD cannot re-use this header as-is.)
>>
>> The same may, btw, be true for others of the new headers you add -
>> the
>> same #include would therefore be needed there as well.
> Now it clear to me.
> 
> 
> It seems like BITOP_BITS_PER_WORD, BITOP_MASK, BITOP_WORD, and
> BITS_PER_BYTE are defined in {arm, ppc, riscv}/include/asm/bitops.h.
> I expected that any architecture planning to use asm-
> generic/bitops/bitops-bits.h would include it at the beginning of
> <arch>/include/asm/bitops.h, similar to what is done for RISC-V:
>    #ifndef _ASM_RISCV_BITOPS_H
>    #define _ASM_RISCV_BITOPS_H
>    
>    #include <asm/system.h>
>    
>    #include <asm-generic/bitops/bitops-bits.h>
>    ...
> 
> But in this case, to allow architecture overrides macros, it is
> necessary to update asm-generic/bitops/bitops-bits.h:
>     #ifndef BITOP_BITS_PER_WORD
>     #define BITOP_BITS_PER_WORD     32
>     #endif
>    ...
> Therefore,  if an architecture needs to override something, it will add
> #define ... before #include <asm-generic/bitops/bitops-bits.h>.
> 
> Does it make sense?

Sure. But then the arch also needs to provide a corresponding typedef
(and bitops-bits.h the fallback one), for use wherever you use any of
those #define-s.

Jan

