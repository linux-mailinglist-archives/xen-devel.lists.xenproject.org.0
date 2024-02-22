Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589C885FA37
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 14:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684423.1064274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd9Qr-0007fy-7t; Thu, 22 Feb 2024 13:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684423.1064274; Thu, 22 Feb 2024 13:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd9Qr-0007eH-3z; Thu, 22 Feb 2024 13:48:13 +0000
Received: by outflank-mailman (input) for mailman id 684423;
 Thu, 22 Feb 2024 13:48:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rd9Qp-0007eB-E8
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 13:48:11 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03aa47ef-d189-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 14:48:09 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3e8c1e4aa7so227514666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 05:48:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q18-20020a170906145200b00a3d2d81daafsm6098028ejc.172.2024.02.22.05.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 05:48:09 -0800 (PST)
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
X-Inumbo-ID: 03aa47ef-d189-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708609689; x=1709214489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CB32mqdCo2HKG4yTh7aIIABKIUipuqMQWkLbNKvQVmw=;
        b=eXDc3e/7vBFrHSzd9voBLVMcxCMECUvjyilXSI3WNLHdAlUuyllBTxk7iA6c+x7OHV
         mqAT5Wx+ooVvr2KiKV4VpGFkNyddJW7N5qAg25cIApd6gCu2LAwyIo4M7iXwjZTFFtF+
         gNE80ThVCohRv62JZsIUqbEoNFZpixOK9aGO2hjtuGBEG0zot4w/Mj3Rkw7Nl+CJtrOy
         iU4X4FekM5F5VknkJhZIfauctWYX+hIXc5LAbx3GcAyHxzOgja1MI/Ab5d0abv8evgEJ
         RSie3VacdBUXqUmB9yhAvHfHJoEt5LVj6Pf16Wh3NEh0ufHH/fj1WNxl0SLw08wRUJU8
         TX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708609689; x=1709214489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CB32mqdCo2HKG4yTh7aIIABKIUipuqMQWkLbNKvQVmw=;
        b=bhqDDZyzz51vl4Z0R+1Pcq252YvR3uQvuWyAJArxeFGrKvMzEU1D4fKNt7GXE18NE6
         Y9vp6AsxMABiLW7LItpgmX8LbfFlahMTEC22e86nIRgwdBNyLjuAC/3wJBAgNJEb85q0
         ikP2xwFS8oBfg5lyPgOqShPSmgWi82ntJdyfI2Eb1SKMk/KfKGC3iwVGPKIezqP0GQxA
         TOYTOmj9TeiBFFocq8KMVsOM3DJvWp3oLLt+NZy9b8MSEOgXMbXzCurfq+ayUJs9/b6F
         2Ixl6BwZVyvpjd17KWgI+rBtX/QNHvTvLYVcr+iq2XMEq+eUifQfLkz6o/79BVdsz85Y
         mg7A==
X-Forwarded-Encrypted: i=1; AJvYcCWNFXhqa/03tEZ5leCPFKWJJ9MYP8N39kLerMuwY4fQphyGlCXrzMaNdWs5UlWJ88s2yXogBUFYnMT59AmKOPjnSRLPPPYuZT1vX/BadPg=
X-Gm-Message-State: AOJu0YzauyNTtkk6JG3p0RL5IwISfBN2KywbkqkM1CFLrbIImixjRSX/
	fPyxcoCEWTui1E0xbant5mJaYRUDz0tSS6pHENrNQQZiVfJrbJ9/LM1/rxeVOA==
X-Google-Smtp-Source: AGHT+IHkGa0up2723rnQ5fe3oeMXa6ee1ak3iosmbRyUy02I02toNIv535jC90y4hfqEDdgxgeyXUg==
X-Received: by 2002:a17:906:6b90:b0:a3e:665a:c870 with SMTP id l16-20020a1709066b9000b00a3e665ac870mr8898866ejr.76.1708609689329;
        Thu, 22 Feb 2024 05:48:09 -0800 (PST)
Message-ID: <4b121e48-9541-4b53-8352-939c904f4f1c@suse.com>
Date: Thu, 22 Feb 2024 14:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: cache clearing and invalidation helpers
 refactoring
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, julien@xen.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com>
 <d90d98b6-508b-4a2a-ab6a-74a9828a5b94@suse.com>
 <45509cb67ecee3f690b5784489b5ccb4@bugseng.com>
 <1743b4248d30a4e8b68a150c25724caa@bugseng.com>
 <2ff52df443fc080875fd05614d89764d@bugseng.com>
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
In-Reply-To: <2ff52df443fc080875fd05614d89764d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2024 16:46, Nicola Vetrini wrote:
> On 2024-02-21 13:08, Nicola Vetrini wrote:
>> On 2024-02-20 09:14, Nicola Vetrini wrote:
>>> On 2024-02-20 08:45, Jan Beulich wrote:
>>>> On 19.02.2024 16:14, Nicola Vetrini wrote:
>>>>> The cache clearing and invalidation helpers in x86 and Arm didn't
>>>>> comply with MISRA C Rule 17.7: "The value returned by a function
>>>>> having non-void return type shall be used". On Arm they
>>>>> were always returning 0, while some in x86 returned -EOPNOTSUPP
>>>>> and in common/grant_table the return value is saved.
>>>>>
>>>>> As a consequence, a common helper arch_grant_cache_flush that 
>>>>> returns
>>>>> an integer is introduced, so that each architecture can choose 
>>>>> whether to
>>>>> return an error value on certain conditions, and the helpers have 
>>>>> either
>>>>> been changed to return void (on Arm) or deleted entirely (on x86).
>>>>>
>>>>> Signed-off-by: Julien Grall <julien@xen.org>
>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> ---
>>>>> The original refactor idea came from Julien Grall in [1]; I edited 
>>>>> that proposal
>>>>> to fix build errors.
>>>>>
>>>>> I did introduce a cast to void for the call to flush_area_local on 
>>>>> x86, because
>>>>> even before this patch the return value of that function wasn't 
>>>>> checked in all
>>>>> but one use in x86/smp.c, and in this context the helper (perhaps 
>>>>> incidentally)
>>>>> ignored the return value of flush_area_local.
>>>>
>>>> I object to such casting to void, at least until there's an 
>>>> overriding
>>>> decision that for Misra purposes such casts may be needed.
>>>>
>>>
>>> There are three choices here:
>>> 1. cast to void
>>> 2. deviation for flush_area_local, which for the case of the cache 
>>> helpers is what led to this patch; it may still be a viable option, if 
>>> other maintainers agree
>>> 3. refactor of flush_area_local; this is not viable here because the 
>>> return value is actually used and useful, as far as I can tell, in 
>>> smp.c
>>>
>>>>> --- a/xen/arch/arm/include/asm/page.h
>>>>> +++ b/xen/arch/arm/include/asm/page.h
>>>>> @@ -123,6 +123,7 @@
>>>>>
>>>>>  #ifndef __ASSEMBLY__
>>>>>
>>>>> +#include <public/grant_table.h>
>>>>
>>>> This is a no-go, imo (also on x86): Adding this include here 
>>>> effectively
>>>> means that nearly every CU will have a dependency on that header, no
>>>> matter that most are entirely agnostic of grants. Each arch has a
>>>> grant_table.h - is there any reason the new, grant-specific helper 
>>>> can't
>>>> be put there?
>>>>
>>>
>>> I would have to test, but I think that can be done
>>>
>>
>> The only blocker so far is that this triggers a build error due to a 
>> circular dependency between xen/mm.h and asm/flushtlb.h on x86. Also 
>> found some earlier evidence [1] that there are some oddities around 
>> asm/flushtlb's inclusion.
>>
>> [1] 
>> https://lore.kernel.org/xen-devel/20200318210540.5602-1-andrew.cooper3@citrix.com/
> 
> There could be a way of untangling asm/flushtlb.h from xen/mm.h, by 
> moving "accumulate_tlbflush" and "filtered_flush_tlb_mask" introduced by 
> commit 80943aa40e30 ("replace tlbflush check and operation with inline 
> functions") [1].
> However, these function should then be part of a generic xen/flushtlb.h 
> header, since they are used in common code (e.g., common/page_alloc) and 
> a bunch of common code source files should move their includes (see [2] 
> for a partial non-working patch). Do you feel that this is a feasible 
> route?

Yeah, introducing xen/flushtlb.h to hold these sounds pretty sensible.

> In passing it should be noted that the header ordering in 
> x86/alternative.c is not the one usually prescribed, so that may be 
> taken care of as well.

I'm afraid I don't understand this remark.

Jan

