Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999F9971BE9
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794556.1203548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snev1-0007JN-Fu; Mon, 09 Sep 2024 13:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794556.1203548; Mon, 09 Sep 2024 13:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snev1-0007Hr-DB; Mon, 09 Sep 2024 13:59:03 +0000
Received: by outflank-mailman (input) for mailman id 794556;
 Mon, 09 Sep 2024 13:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sneuz-0007Hh-Pb
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:59:01 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa31d969-6eb3-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 15:59:00 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so260676166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 06:59:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ced201sm343176066b.168.2024.09.09.06.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 06:58:59 -0700 (PDT)
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
X-Inumbo-ID: aa31d969-6eb3-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725890340; x=1726495140; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xbNdFPtW0z0co0DcxTL3RVcZHOB7EExKodBKwzrFybM=;
        b=TRqF0of20lBVuGrU4azienEMbR3k5WXdY4VJhxcHE25gMnbP2YHpMS8pjb7RiXwLY3
         OTBnvG98r7vW2Nuaz5rvFWU5POFX/dENp+oFjGy9le4KkPQ/tek8sRqaracMVnH7idFM
         oHmfQffebORGUxBsABRBpqqpf0Hs26828OPDI27a9LZBxMlWHgAfV0UciDX8jhT0xkK5
         Opb7uKuVN9r59RLjAj1JC2ecQEfMSKmMoh+UaV6zph0JNmy0WvB6hafFcFM3Z+wuRvMh
         7TaxSL2h1T0TfsyZG2N0JPbWHc2ZvQfy0kBZIfsReygp6e+gWaRY03g+T2IMhPcRtFk6
         OYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725890340; x=1726495140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbNdFPtW0z0co0DcxTL3RVcZHOB7EExKodBKwzrFybM=;
        b=SvMGqt5zXaTtMDrHc/vMXC6I3mgscxgcPZW2zgYkoIc/qBH70aheN8sZEYmlI5DxIT
         +OvKnvUUL3gsRrFGzQrnyaPRMl9N/B3IsMHrP24hdr1T1SG2znRau2HkoYxuS8WiYY4E
         f6rq1tIqTKy2IvUwzWAXsdsIsEmwXLsK4ykFVvixKTwCaHsUMLVMIdbF710YMxwcX1YP
         JvaiDQtuoZArIJAHtJD88K6COKrXcqMQBx4eVAnd6Ddgx2Vkh0AjKVn7RdjfwPtKswQ1
         2vnxxC5ssUD/FwpTjuAHAScKNNPdd9zMiYtqKNyBHUPHmgosUKJvw+gSdnGwAfWSnCM6
         Z08Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrbgAZB8U8RJZL2w7Rw7T7g+j6hUNWuT7VYyjm3B+sfr1CLsktGtaVSwAM/ncnGqVAadflNzwd64k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbGNyX7a0fszGhpPakDVSVqFfwqp5GFeam8OmMMYL//RDoxAKO
	xCf9NmM/TFT1nbnO4r47CPuNk8ie1KWira/yndYYWPVsb/T0RlY6qtLISGTx7g==
X-Google-Smtp-Source: AGHT+IGoAw9m6KRcr0L450jNAVhi2dz4r7dHSNLMq1fX4wZsFyc3Pt6YEgI/SR86evNcJRWjajx/EA==
X-Received: by 2002:a17:907:2d25:b0:a8d:3e29:a82d with SMTP id a640c23a62f3a-a8d3e29aecemr484165766b.37.1725890339969;
        Mon, 09 Sep 2024 06:58:59 -0700 (PDT)
Message-ID: <53ae5deb-753f-4061-aa23-1044ce0f2650@suse.com>
Date: Mon, 9 Sep 2024 15:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Define and use UINT64_C and INT64_C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240909100806.47280-1-frediano.ziglio@cloud.com>
 <abe1c3a2-2838-4756-a06f-f347e4fcd78e@suse.com>
 <CACHz=ZjsoJRM0Y1cVFK186NzJu=_sNxFhHyMyfaR_3p4h4e-nQ@mail.gmail.com>
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
In-Reply-To: <CACHz=ZjsoJRM0Y1cVFK186NzJu=_sNxFhHyMyfaR_3p4h4e-nQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.09.2024 15:41, Frediano Ziglio wrote:
> On Mon, Sep 9, 2024 at 11:38 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 09.09.2024 12:08, Frediano Ziglio wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1384,9 +1384,9 @@ void asmlinkage __init noreturn
>> __start_xen(unsigned long mbi_p)
>>>          }
>>>
>>>          if ( e > min(HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START,
>>> -                     1UL << (PAGE_SHIFT + 32)) )
>>> +                     UINT64_C(1) << (PAGE_SHIFT + 32)) )
>>>              e = min(HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START,
>>> -                    1UL << (PAGE_SHIFT + 32));
>>> +                    UINT64_C(1) << (PAGE_SHIFT + 32));
>>
>> I disagree - we're dealing with virtual addresses here, which better
>> wouldn't use fixed-width quantities.
>>
> I suppose you are suggesting type-based macros instead of fixed-type
> macros, so something like PADDR_C  and VADDR_C.
> That makes sense.

No, I'm suggesting to somply leave this code alone. On x86 we have no vaddr_t,
and hence I see no reason to have VADDR_C().

>> While not always virtual addresses, I similarly disagree for most or all
>> I've left in context further up: If the underlying type to deal with is
>> unsigned long, constants should match.
>>
> Sure, in this case the underlying type if used as 32 bit cannot be unsigned
> long but they should be unsigned long long (or any 64 bit type).

My primary request here is: Code that won't be built as 32-bit doesn't need
changing if it's not explicitly using {,u}int64_t-type variables /
expressions.

>> --- a/xen/crypto/vmac.c
>>> +++ b/xen/crypto/vmac.c
>>> @@ -11,7 +11,9 @@
>>>  #include <xen/types.h>
>>>  #include <xen/lib.h>
>>>  #include <crypto/vmac.h>
>>> +#ifndef UINT64_C
>>>  #define UINT64_C(x)  x##ULL
>>> +#endif
>>>  /* end for Xen */
>>
>> Here the #define should probably just be dropped?
>>
>>
> If we go for newer type-base macros, we won't need to change here.

I'm afraid I don't understand this reply.

>>> --- a/xen/include/xen/const.h
>>> +++ b/xen/include/xen/const.h
>>> @@ -15,10 +15,19 @@
>>>  #ifdef __ASSEMBLY__
>>>  #define _AC(X,Y)     X
>>>  #define _AT(T,X)     X
>>> +#define UINT64_C(X)     X
>>> +#define INT64_C(X)      X
>>>  #else
>>>  #define __AC(X,Y)    (X##Y)
>>>  #define _AC(X,Y)     __AC(X,Y)
>>>  #define _AT(T,X)     ((T)(X))
>>> +#if __SIZEOF_LONG__ >= 8
>>
>> This is available with gcc 4.3 and newer, yet for now our docs still
>> specify 4.1.2 as the baseline.
>>
> Do we have some sort of configure generated macro for this?

I don#t think we do. And I also don't think we need one - we have
BITS_PER_LONG, which ought to be sufficient here.

>> I'm also unconvinced of the >= - we're talking of fixed-width types here,
>> so imo it needs to be == and then also ...
>>
>>> +#define UINT64_C(X)     X ## UL
>>> +#define INT64_C(X)      X ## L
>>> +#else
>>
>> #elif __SIZEOF_LONG_LONG__ == 8
>>
>> here.
>>
>>> +#define UINT64_C(X)     X ## ULL
>>> +#define INT64_C(X)      X ## LL
>>> +#endif
>>>  #endif
>>
>> Finally if we introduce these, imo we should introduce the other
>> UINT<n>_C()
>> as well, and in a header named after the one mandated by the C library
>> spec.

I'm sorry, I was actually wrong here (alluding to inttypes.h), so ...

>>> --- a/xen/include/xen/stdint.h
>>> +++ b/xen/include/xen/stdint.h
>>> @@ -30,4 +30,6 @@ typedef __UINT64_TYPE__    uint64_t;
>>>
>>>  #endif
>>>
>>> +#include <xen/const.h>
>>
>> Why's this needed?
>>
> Not strictly needed, but in the standard headers they are usually defined
> including stdint.h.

... yes, but imo the definitions then would better live here in the first
place.

Jan

