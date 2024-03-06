Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1626B87334A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 10:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689017.1073913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rho3d-0002QY-ML; Wed, 06 Mar 2024 09:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689017.1073913; Wed, 06 Mar 2024 09:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rho3d-0002Na-JM; Wed, 06 Mar 2024 09:59:29 +0000
Received: by outflank-mailman (input) for mailman id 689017;
 Wed, 06 Mar 2024 09:59:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rho3b-0002La-NS
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 09:59:27 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 369ea254-dba0-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 10:59:25 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a441d7c6125so176057166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 01:59:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w16-20020a170906185000b00a4551cc291esm3153416eje.40.2024.03.06.01.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 01:59:24 -0800 (PST)
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
X-Inumbo-ID: 369ea254-dba0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709719165; x=1710323965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ChogrlZnSrn7Zj80mSp/ZBCpi766+icRGCu45I82H0o=;
        b=ba0R1nsoVRPN6vkBbYnokxUCBweSqr6h3mb798Is6OBggp8q2/YM1GZ5jaSf/L6BNb
         Tr4n9eOpkFtcosWfK2/CuKBIK/agH/50aEIqjwjRM6D/y/Y2ylBGOfvGKKQSA0jtqdK0
         PHIGs2IVNLPRo5VXOBuDmd/88JfbUz2aMz/xy9rZJhYE6gQo+BFU+loXo/aOW2H/wxTQ
         MvJGq5tJKOYYtCdyoj746Fhzd2v2Nn9OFvf2RzZ6F/sHH8HmCfrLFA/48ND6VOD1iND6
         AoPg+aHcWcGRSfXMchxSrownojQGsnXxaoatASsWidfcbTVSCzq+Y9l7T6joAZSLfLT3
         zo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709719165; x=1710323965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ChogrlZnSrn7Zj80mSp/ZBCpi766+icRGCu45I82H0o=;
        b=qolytRsENI6yhzPMZyKVc6BuNtcaASAHVgWdEV3MVSIw+qKxCiuKQMe7QuvVExOYuH
         VuNSkdew/rkPf48hQ7y7JRVQYZbgfq+Nsyre59v+vKFIJfHPV7lRX4UO8a5MsDpn38Ac
         g16LPInnn86e0jvhxiPfMwqJ6pfO+Po9Rg7TGRW8w9Hh/LSWKR/ZtseglZP07XwhNCoK
         zAeqExZq18Qb9KhvlzddB8yBBIg2fJR6hc1SbA6aqvCKL/xTdvPy7QjyyPDkfgyAfrXb
         YtR1rhxRU4NI7jPY0Yt0m42muzVHyevKJ2M/q6+/jS2EUzsdtEi2H9juQsLZE04JxuvI
         GOIA==
X-Forwarded-Encrypted: i=1; AJvYcCWqfq6ZGnGoFruhGAbJlY7MnCera5xINze1qFNMBPeVlBEygLBXlaC4CesBcd0yMzgvlx9RrHb7py7IosEr4wmLKcZdMvACbIqmDr10v1E=
X-Gm-Message-State: AOJu0YxmOF4F27CW9S9BqKDeRERm/AXYUglVHuOI4yH0YiEgf3fFQnYP
	wTFmrstUuHORIEvzDX3QOoocg/y7hn16SvVOXRbCoHLflhWAyXchNgFjJQqPzg==
X-Google-Smtp-Source: AGHT+IFgTmdIdOSxd26G7NXnG5W4K/G+5chVJHkS2Z2BmDILQ379z/txA7K1D1szlqJcPj7IazLqBg==
X-Received: by 2002:a17:906:364d:b0:a43:811b:71de with SMTP id r13-20020a170906364d00b00a43811b71demr9372471ejb.38.1709719164961;
        Wed, 06 Mar 2024 01:59:24 -0800 (PST)
Message-ID: <610e5e76-db0f-4509-84ed-c1bc085b4b6e@suse.com>
Date: Wed, 6 Mar 2024 10:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86+Arm: drop (rename) __virt_to_maddr() /
 __maddr_to_virt()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b837e02d-fd65-458f-a946-ea36a52ddd3e@suse.com>
 <ce705871-bda9-4518-96da-010f24c98512@xen.org>
 <6fb7b2c9-6665-4cbd-a1c4-24ebf7514b88@suse.com>
 <be2a0d46-4b2f-444d-8ae7-2e3d1f9d03c4@xen.org>
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
In-Reply-To: <be2a0d46-4b2f-444d-8ae7-2e3d1f9d03c4@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2024 10:44, Julien Grall wrote:
> On 06/03/2024 07:22, Jan Beulich wrote:
>> On 05.03.2024 20:24, Julien Grall wrote:
>>> The title is quite confusing. I would have expected the macro...
>>>
>>> On 05/03/2024 08:33, Jan Beulich wrote:
>>>> There's no use of them anymore except in the definitions of the non-
>>>> underscore-prefixed aliases. Rename the inline functions, adjust the
>>>> virt_to_maddr() #define-e, and purge the (x86-only) maddr_to_virt() one,
>>>> thus eliminating a bogus cast which would have allowed the passing of a
>>>> pointer type variable into maddr_to_virt() to go silently.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/arch/arm/include/asm/mm.h
>>>> +++ b/xen/arch/arm/include/asm/mm.h
>>>> @@ -256,12 +256,12 @@ static inline void __iomem *ioremap_wc(p
>>>>    /* Page-align address and convert to frame number format */
>>>>    #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
>>>>    
>>>> -static inline paddr_t __virt_to_maddr(vaddr_t va)
>>>> +static inline paddr_t virt_to_maddr(vaddr_t va)
>>>>    {
>>>>        uint64_t par = va_to_par(va);
>>>>        return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
>>>>    }
>>>> -#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
>>>> +#define virt_to_maddr(va) virt_to_maddr((vaddr_t)(va))
>>>
>>> ... to be removed. But you keep it and just overload the name. I know it
>>> is not possible to remove the macro because some callers are using
>>> pointers (?).
>>
>> Indeed. I actually tried without, but the build fails miserably.
>>
>>> So I would rather prefer if we keep the name distinct on Arm.
>>>
>>> Let see what the other Arm maintainers think.
>>
>> Well, okay. I'm a little surprised though; I was under the impression
>> that a goal would be to, eventually, get rid of all the __-prefixed
>> secondary variants of this kind of helpers.
> 
> Because of MISRA? If so, you would be replacing one violation by another 
> one (duplicated name). IIRC we decided to deviate it, yet I don't 
> particular want to use the pattern in Arm headers when there is no need.
> 
> If you are trying to solve MISRA, then I think we want to either remove 
> the macro (not possible here) or suffix with the double-underscore the 
> static inline helper.

No, Misra is only secondary here. Many of these helpers come in two flavors
such than one can be overridden in individual source files. That's mainly
connected to type-safety being generally wanted, but not always easy to
achieve without a lot of code churn. We've made quite a bit of progress
there, and imo ultimately the need for two flavors of doing the same thing
ought to disappear.

Jan

