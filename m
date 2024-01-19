Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883BC832672
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 10:21:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668968.1041489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQl3L-0000jJ-A6; Fri, 19 Jan 2024 09:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668968.1041489; Fri, 19 Jan 2024 09:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQl3L-0000hk-62; Fri, 19 Jan 2024 09:20:43 +0000
Received: by outflank-mailman (input) for mailman id 668968;
 Fri, 19 Jan 2024 09:20:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQl3J-0000he-Be
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 09:20:41 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 027f3551-b6ac-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 10:20:38 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-337c40fde20so481241f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 01:20:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e21-20020adfa455000000b003392295997dsm487715wra.25.2024.01.19.01.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 01:20:38 -0800 (PST)
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
X-Inumbo-ID: 027f3551-b6ac-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705656038; x=1706260838; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhEVdlJbyndKpfYMYn4F9QW3tAxSPbKD7BkMILGT9gM=;
        b=DU20XAtD8E0iukYMvEdimp5/DoymRJm8kwYArmlsOo88KmCioZMUQSxegJDwpdWdtO
         76HRlqGER6/rIyDjpwYShL3+CTqJztitjrzu3BGOBzrPOlLuO+0bcSSbqA4akx5RMLPC
         SVVK4D6TQDtqZfUmR1jQgZp1pQl0RvgNSkuiyw0J46aaaZTLwC318hqW5rGh90vPpSw+
         tR7inXAdUEdZuugVyQgQ8U14krxAtLudmduHpbeAQusxeqWal5gOK00DLth79sH8grqU
         VXAQrACglsityFLm93gl0V21IcN6V8Fw/xJZfiIgm/+++Hw5rj5owLhqQGapg8lpqyYg
         nHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705656038; x=1706260838;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nhEVdlJbyndKpfYMYn4F9QW3tAxSPbKD7BkMILGT9gM=;
        b=AFCIyYuIJz3wPB+U2TNOzk1AxTeTVXFgUVRLpdhLy2gDcbrGsLpdj6RtVKOqC1/9k6
         GVLaTDSlLcdUtFqq5K7QSZ+SU9F3fio9iAqbukFnYHBg1laDsfkof7Nw36jbyKplXg/C
         twEe+ormAdFj8pQ3LC4IbAciP+OFFKpnGguez6xdBjYHXB9JyBCIfSX5FPEaKB5XAjYE
         Mz52tuiKx70Rgs1i9w0TYJ1w+VRAMY9gwZVTYVvvj95nVfmc3utk8USTx7gTNjcRTk16
         fde1JHrrKHeJ8W8U3C7++Qs1vMhKYAuHkNYUEvni+sT+qL0idQgsBAwkmP0seEb2SMo4
         +OnQ==
X-Gm-Message-State: AOJu0Yx8bFUV+VrQGB+vlPzlxpC+wTZUCz0NHQxy2VESg5K8b+qqYH/I
	nR3t12Qewd9SaySxA4WNUFlyViDDNk7Gb3YRct7DQBzAGkKHfhV8v5Bx8pZAlg==
X-Google-Smtp-Source: AGHT+IEQdoa0BEI89ro+YF5qJCTxqTTlp0+Snsrn5FNY43UZFUJ2WS+SjSv8xgYxiVj8vdg2jh1K0Q==
X-Received: by 2002:a5d:618c:0:b0:337:62c6:cd1c with SMTP id j12-20020a5d618c000000b0033762c6cd1cmr1244382wru.80.1705656038630;
        Fri, 19 Jan 2024 01:20:38 -0800 (PST)
Message-ID: <3f76742c-7f58-49d8-9ea4-c376bca71bf7@suse.com>
Date: Fri, 19 Jan 2024 10:20:36 +0100
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
 <2e10b170-5a75-4ae0-8d2f-c6c1ad9951a5@suse.com>
 <1b20fefd125598e2bb62d516495783650da75271.camel@gmail.com>
 <23955665-8bd8-4872-a1a5-e3a3711c9512@suse.com>
 <1c0eb1cdef1fac7695c4fc416128e2bb81cf13aa.camel@gmail.com>
 <ac43d7a3-f662-4985-9aaf-4cad1c517f35@suse.com>
 <ba1dbfbdd84811b09593425664f02a0cfe9430c3.camel@gmail.com>
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
In-Reply-To: <ba1dbfbdd84811b09593425664f02a0cfe9430c3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.01.2024 10:16, Oleksii wrote:
> On Thu, 2024-01-18 at 12:01 +0100, Jan Beulich wrote:
>> On 18.01.2024 10:43, Oleksii wrote:
>>> On Wed, 2024-01-17 at 14:42 +0100, Jan Beulich wrote:
>>>> On 17.01.2024 12:37, Oleksii wrote:
>>>>>>>>
>>>>>>>>>> Also you want to make sure asm-generic/bitops/bitops-
>>>>>>>>>> bits.h
>>>>>>>>>> is
>>>>>>>>>> really in use here, or else an arch overriding / not
>>>>>>>>>> using
>>>>>>>>>> that
>>>>>>>>>> header may end up screwed.
>>>>>>>>> I am not really understand what do you mean. Could you
>>>>>>>>> please
>>>>>>>>> explain a
>>>>>>>>> little bit more.
>>>>>>>>
>>>>>>>> Whichever type you use here, it needs to be in sync with
>>>>>>>> BITOP_BITS_PER_WORD. Hence you want to include the
>>>>>>>> _local_
>>>>>>>> bitops-
>>>>>>>> bits.h
>>>>>>>> here, such that in case of an inconsistent override by an
>>>>>>>> arch
>>>>>>>> the
>>>>>>>> compiler would complain about the two differring #define-
>>>>>>>> s.
>>>>>>>> (IOW
>>>>>>>> an
>>>>>>>> arch overriding BITOP_BITS_PER_WORD cannot re-use this
>>>>>>>> header
>>>>>>>> as-
>>>>>>>> is.)
>>>>>>>>
>>>>>>>> The same may, btw, be true for others of the new headers
>>>>>>>> you
>>>>>>>> add
>>>>>>>> -
>>>>>>>> the
>>>>>>>> same #include would therefore be needed there as well.
>>>>>>> Now it clear to me.
>>>>>>>
>>>>>>>
>>>>>>> It seems like BITOP_BITS_PER_WORD, BITOP_MASK, BITOP_WORD,
>>>>>>> and
>>>>>>> BITS_PER_BYTE are defined in {arm, ppc,
>>>>>>> riscv}/include/asm/bitops.h.
>>>>>>> I expected that any architecture planning to use asm-
>>>>>>> generic/bitops/bitops-bits.h would include it at the
>>>>>>> beginning
>>>>>>> of
>>>>>>> <arch>/include/asm/bitops.h, similar to what is done for
>>>>>>> RISC-
>>>>>>> V:
>>>>>>>    #ifndef _ASM_RISCV_BITOPS_H
>>>>>>>    #define _ASM_RISCV_BITOPS_H
>>>>>>>    
>>>>>>>    #include <asm/system.h>
>>>>>>>    
>>>>>>>    #include <asm-generic/bitops/bitops-bits.h>
>>>>>>>    ...
>>>>>>>
>>>>>>> But in this case, to allow architecture overrides macros,
>>>>>>> it is
>>>>>>> necessary to update asm-generic/bitops/bitops-bits.h:
>>>>>>>     #ifndef BITOP_BITS_PER_WORD
>>>>>>>     #define BITOP_BITS_PER_WORD     32
>>>>>>>     #endif
>>>>>>>    ...
>>>>>>> Therefore,  if an architecture needs to override something,
>>>>>>> it
>>>>>>> will
>>>>>>> add
>>>>>>> #define ... before #include <asm-generic/bitops/bitops-
>>>>>>> bits.h>.
>>>>>>>
>>>>>>> Does it make sense?
>>>>>>
>>>>>> Sure. But then the arch also needs to provide a corresponding
>>>>>> typedef
>>>>>> (and bitops-bits.h the fallback one), for use wherever you
>>>>>> use
>>>>>> any of
>>>>>> those #define-s.
>>>>> Which one typedef is needed to provide?
>>>>> <asm-generic/bitops/bitops-bits.h> contains only macros.
>>>>
>>>> A new one, to replace where right now you use "unsigned int" and
>>>> I
>>>> initially said you need to use "uint32_t" instead. With what you
>>>> said
>>>> earlier, uint32_t won't work there (anymore).
>>> Wouldn't it be enough just to "#include <xen/types.h>" in headers
>>> where
>>> "uint32_t" is used?
>>
>> No, my point wasn't to make uint32_t available. We need a _separate_
>> typedef which matches the #define-s. Otherwise, if an arch defines
>> BITOP_BITS_PER_WORD to, say, 64, this generic code would do the wrong
>> thing.
> Oh, yeah this is true.
> 
> We have to introduce in bitops-bits.h:
>    typedef uint_32t bitops_type; 

Perhaps e.g.

typedef uint32_t bitops_uint_t;

though.

Jan

> And then use it in function such as test_bit:
>    static inline int test_bit(int nr, const volatile void *addr)
>    {
>        const volatile bitops_type *p = addr;
>        return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD -
>    1)));
>    }
> 
> Thanks for clarification.
> 
> ~ Oleksii


