Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778898317F2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 12:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668709.1041086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQQ9X-0007nU-98; Thu, 18 Jan 2024 11:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668709.1041086; Thu, 18 Jan 2024 11:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQQ9X-0007lv-6H; Thu, 18 Jan 2024 11:01:43 +0000
Received: by outflank-mailman (input) for mailman id 668709;
 Thu, 18 Jan 2024 11:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQQ9V-0007lp-7V
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 11:01:41 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f32c8f3d-b5f0-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 12:01:38 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e958cd226so1679475e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 03:01:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b0040d8eca092esm29427703wmq.47.2024.01.18.03.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 03:01:36 -0800 (PST)
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
X-Inumbo-ID: f32c8f3d-b5f0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705575697; x=1706180497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3aSOBUaPPqVrLGsojPFcIPswEoadIjsvclB90sACfsc=;
        b=EM39+TlQ7Uk4fWrcdxB4XmW0DMuivM4zSHdsES4bmUS5fcgMi4wlMl46T4b0Ca8MLE
         AaDJBfKxNGo8FAAeg1oUT7QvD9kYR5o0gHOTNiQvWRbF6y2QO+gGTwRmAHl0Shra2iF/
         fzhGbyDltBaIFIUX7FqxxpjXK58f36ZWW1Wn8upLpYGVn9Ry6WSPDrTp0zRIoQmdKh/8
         M490cR7Ef/keMRw4oH4tnRkbTBeUcPD9Qd0GXuG9WK8KYmkYDU45GGMteteYKEnP+Z6D
         mIrt4sDlNqS3gkbeYh4YsZcN1XljWRFwuuMhtD5rEURbdkAfNfUIFPHq0i9Ty4bI+rAn
         UCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705575697; x=1706180497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3aSOBUaPPqVrLGsojPFcIPswEoadIjsvclB90sACfsc=;
        b=dJtX0krNRQuQZ88Us8f8egFJHtwbzc5uA5D1ntRhBE0udfwUqDt8GcsiGHAxt3/Qy/
         d/rhTOOw9rrjihJZTq1i0PDLn1M8BOIPUu8PebZx77+Puo926L+ftqwH0dCPDWcyRmuN
         uosQpsvqb0mgWKynVVIfFihxnM0uDJtOJ+e7STGp0rAbCGBMqOjRs1Tw+yHqqszgiRtI
         OrcPJ0HS3Vno8VznFM3awrxD6OYSU9uy28y7LyGR5eDPJKi5QpqNGew88YoaMw92lMIR
         U7eskDQB4XylX2EarVoHyd/o/YxguTWLLZZl/3G20x5mqjiCOK7N68aUlmmX77JGWFPT
         nn+Q==
X-Gm-Message-State: AOJu0YxpjFGJaVLoI4qpsOdIFyPsFuZFVVdJQGjti/IUINEEHxV5Rr9U
	FozdTR3ujw12X15RNDTm6E+I/TuRfaIim/0TIkS/pZ20apPQbxRsyBbBm3al1Q==
X-Google-Smtp-Source: AGHT+IELjaaeX7ODtYVkFi9tHM5kaH+xHcKJO6WXCLno4sbcAOiEm1RCbETsuRjt6sF0QAqROYE3Rg==
X-Received: by 2002:a05:600c:2984:b0:40e:596a:985b with SMTP id r4-20020a05600c298400b0040e596a985bmr399591wmd.160.1705575696770;
        Thu, 18 Jan 2024 03:01:36 -0800 (PST)
Message-ID: <ac43d7a3-f662-4985-9aaf-4cad1c517f35@suse.com>
Date: Thu, 18 Jan 2024 12:01:35 +0100
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
In-Reply-To: <1c0eb1cdef1fac7695c4fc416128e2bb81cf13aa.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.01.2024 10:43, Oleksii wrote:
> On Wed, 2024-01-17 at 14:42 +0100, Jan Beulich wrote:
>> On 17.01.2024 12:37, Oleksii wrote:
>>>>>>
>>>>>>>> Also you want to make sure asm-generic/bitops/bitops-
>>>>>>>> bits.h
>>>>>>>> is
>>>>>>>> really in use here, or else an arch overriding / not
>>>>>>>> using
>>>>>>>> that
>>>>>>>> header may end up screwed.
>>>>>>> I am not really understand what do you mean. Could you
>>>>>>> please
>>>>>>> explain a
>>>>>>> little bit more.
>>>>>>
>>>>>> Whichever type you use here, it needs to be in sync with
>>>>>> BITOP_BITS_PER_WORD. Hence you want to include the _local_
>>>>>> bitops-
>>>>>> bits.h
>>>>>> here, such that in case of an inconsistent override by an
>>>>>> arch
>>>>>> the
>>>>>> compiler would complain about the two differring #define-s.
>>>>>> (IOW
>>>>>> an
>>>>>> arch overriding BITOP_BITS_PER_WORD cannot re-use this header
>>>>>> as-
>>>>>> is.)
>>>>>>
>>>>>> The same may, btw, be true for others of the new headers you
>>>>>> add
>>>>>> -
>>>>>> the
>>>>>> same #include would therefore be needed there as well.
>>>>> Now it clear to me.
>>>>>
>>>>>
>>>>> It seems like BITOP_BITS_PER_WORD, BITOP_MASK, BITOP_WORD, and
>>>>> BITS_PER_BYTE are defined in {arm, ppc,
>>>>> riscv}/include/asm/bitops.h.
>>>>> I expected that any architecture planning to use asm-
>>>>> generic/bitops/bitops-bits.h would include it at the beginning
>>>>> of
>>>>> <arch>/include/asm/bitops.h, similar to what is done for RISC-
>>>>> V:
>>>>>    #ifndef _ASM_RISCV_BITOPS_H
>>>>>    #define _ASM_RISCV_BITOPS_H
>>>>>    
>>>>>    #include <asm/system.h>
>>>>>    
>>>>>    #include <asm-generic/bitops/bitops-bits.h>
>>>>>    ...
>>>>>
>>>>> But in this case, to allow architecture overrides macros, it is
>>>>> necessary to update asm-generic/bitops/bitops-bits.h:
>>>>>     #ifndef BITOP_BITS_PER_WORD
>>>>>     #define BITOP_BITS_PER_WORD     32
>>>>>     #endif
>>>>>    ...
>>>>> Therefore,  if an architecture needs to override something, it
>>>>> will
>>>>> add
>>>>> #define ... before #include <asm-generic/bitops/bitops-bits.h>.
>>>>>
>>>>> Does it make sense?
>>>>
>>>> Sure. But then the arch also needs to provide a corresponding
>>>> typedef
>>>> (and bitops-bits.h the fallback one), for use wherever you use
>>>> any of
>>>> those #define-s.
>>> Which one typedef is needed to provide?
>>> <asm-generic/bitops/bitops-bits.h> contains only macros.
>>
>> A new one, to replace where right now you use "unsigned int" and I
>> initially said you need to use "uint32_t" instead. With what you said
>> earlier, uint32_t won't work there (anymore).
> Wouldn't it be enough just to "#include <xen/types.h>" in headers where
> "uint32_t" is used?

No, my point wasn't to make uint32_t available. We need a _separate_
typedef which matches the #define-s. Otherwise, if an arch defines
BITOP_BITS_PER_WORD to, say, 64, this generic code would do the wrong
thing.

Jan

