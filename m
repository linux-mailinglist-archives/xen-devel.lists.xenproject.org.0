Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32D38994E4
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 08:05:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701088.1095180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rschm-0004f1-2n; Fri, 05 Apr 2024 06:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701088.1095180; Fri, 05 Apr 2024 06:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rschl-0004cs-Vh; Fri, 05 Apr 2024 06:05:37 +0000
Received: by outflank-mailman (input) for mailman id 701088;
 Fri, 05 Apr 2024 06:05:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rschk-0004cm-Bj
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 06:05:36 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83b77fd9-f312-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 08:05:34 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d23114b19dso20362441fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 23:05:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k41-20020a05600c1ca900b004156c501e24sm5129829wms.12.2024.04.04.23.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 23:05:33 -0700 (PDT)
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
X-Inumbo-ID: 83b77fd9-f312-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712297133; x=1712901933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Btnc2h8G17ewCsHT6UlOGFz9pkIVqSGlGBemIzmBJnI=;
        b=IGUhlTYT7l8JmC0af6VLCVwg6K0KCf4X11bANXC5aNJ/uirdJfkEAdZ8QcyfptnW/u
         a8ITSM/NC8R4s8WfzLPuFxBhru1U3IxRnm6mMg9NN6nnsi+r/0YAndbmxRwOaPA0tGa5
         Nm+RjNqgbKvK5LlNOUpLWDA5iZoGNAcOWjkbMHefEyG+hLEGiOMTN9+UCNAHsJz3jht2
         oXUQmR4VjaZljzoLBiPgcP1nP/WuRpOGerS08zKeZNRBu/ucW9qdAGElDbBWn6uikDcN
         4Rg02aDI4UOoZ5TWca1Xw77m01q4YxGRFlPJO8KePYuUIEIKFLP0L/ibA2XGdWyCTslv
         HGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712297133; x=1712901933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Btnc2h8G17ewCsHT6UlOGFz9pkIVqSGlGBemIzmBJnI=;
        b=DvGXurGACeaLcec6tJz/1zO0UKoOP2iDaeRV91Pz1aAIxyFIwPf/dxpiCjnDtHOIPJ
         CMsZFo4QkaAzKGMB54224P3SZv3LKtI1wH0CiQj8k5waeAIcnce9iSu0KSUjjhtOkRuP
         DDYcbuOgtUsrQUS7PW4kBDD94U+zNFt/H1XVq6H16i94smdWFntLTOIeN1aFul6VAyVk
         LXsGXbJanxCzeUnd3hz+YNtlbQuNuZfFDTHsGt011gmy/0GzoRTjYTv5Uz9Bwnm8Qg/k
         r0CUbkYcBPOzDyoZiLDwRJlMsEH1rYO0WryeyOuN9uUzO0kCCGOMDoZR6uIqXSnr+69r
         R9BA==
X-Forwarded-Encrypted: i=1; AJvYcCVRuXr/4k2YIhieSKt+WEd+EPl1Dg/DjzvocRU9rFW9ZnCiSyC8UR0cypWd5iWYjZ0YahnaQLclKPW4kMVFLl6+GfapiE2M1IyHDoROLF0=
X-Gm-Message-State: AOJu0YyurVdapwoVDz28G+ZJVthSU6AgQOyAYqwBQkNTQ1IQV4uGHZ+e
	FuQdst9L6R22R+f2xjuADzwgipta3z4LRaM6dSwcMsNW9xrMnxSy56kU42ol5w==
X-Google-Smtp-Source: AGHT+IFUKucmCh1+GvtZMkzxcZYuZFRfIJJmSAt1h8Auq0aJt9bLcEVoCqoU+rv3huQ0+chHc7Ty0g==
X-Received: by 2002:a2e:a368:0:b0:2d6:ecb1:ffb3 with SMTP id i8-20020a2ea368000000b002d6ecb1ffb3mr422683ljn.25.1712297133545;
        Thu, 04 Apr 2024 23:05:33 -0700 (PDT)
Message-ID: <0e9361f6-c419-4fdd-95a4-2fafa5de2406@suse.com>
Date: Fri, 5 Apr 2024 08:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/misra: document the expected sizes of integer
 types
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2404031806510.2245130@ubuntu-linux-20-04-desktop>
 <e3e13f3f-3df6-4eb4-8b73-21387007e7c3@suse.com>
 <alpine.DEB.2.22.394.2404041548530.2245130@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404041548530.2245130@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 01:56, Stefano Stabellini wrote:
> On Thu, 4 Apr 2024, Jan Beulich wrote:
>> On 04.04.2024 03:12, Stefano Stabellini wrote:
>>> --- a/docs/misra/C-language-toolchain.rst
>>> +++ b/docs/misra/C-language-toolchain.rst
>>> @@ -480,4 +480,73 @@ The table columns are as follows:
>>>       - See Section "4.13 Preprocessing Directives" of GCC_MANUAL and Section "11.1 Implementation-defined behavior" of CPP_MANUAL.
>>>  
>>>  
>>> +Sizes of Integer types
>>> +______________________
>>> +
>>> +Xen expects System V ABI on x86_64:
>>> +  https://gitlab.com/x86-psABIs/x86-64-ABI
>>> +
>>> +Xen expects AAPCS32 on ARMv8-A AArch32:
>>> +  https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst
>>> +
>>> +Xen expects AAPCS64 LP64 on ARMv8-A AArch64:
>>> +  https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst
>>> +
>>> +A summary table of data types, sizes and alignment is below:
>>> +
>>> +.. list-table::
>>> +   :widths: 10 10 10 45
>>> +   :header-rows: 1
>>> +
>>> +   * - Type
>>> +     - Size
>>> +     - Alignment
>>> +     - Architectures
>>> +
>>> +   * - char 
>>> +     - 8 bits
>>> +     - 8 bits
>>> +     - all architectures
>>
>> This one _may_ be acceptable, but already feels like going too far.
>>
>>> +   * - short
>>> +     - 16 bits
>>> +     - 16 bits
>>> +     - all architectures
>>> +
>>> +   * - int
>>> +     - 32 bits
>>> +     - 32 bits
>>> +     - all architectures
>>
>> These two I continue to disagree with. The values are minimum required ones.
> 
> The purpose of the document docs/misra/C-language-toolchain.rst is to
> describe the reference safety-supported configuration. In a way, this
> document is similar to SUPPORT.md but for safety instead of security.
> 
> Here, we need to write down the stable configuration, the one everyone
> is aligned and convinced should work correctly.
> 
> Now, let's say that I believe you and agree with you that it should be
> possible to support int as 64-bit. This configuration is not tested. If
> I can draw a comparison, it would be similar to ask for XSM to be
> security supported while in fact is marked as experimental in
> SUPPORT.md.
> 
> If you want, taking inspiration from SUPPORT.md, we can have a
> "supported" column and a "experimental" column. In the experimental
> column we can write down "at least 32-bit" or "32-bit or larger".
> 
> 
>> Even if code changes may be needed (Misra already helps us here by stopping
>> undue mixing of e.g. unsigned int and uint32_t in at least some situations),
>> there's no inherent requirement in Xen for such restrictions.
> 
> I hope that my comparison with XSM and SUPPORT.md helps explain why we
> need to clarify the safety supported configuration with the values we
> actually validate Xen with.
> 
> Your goal is to write down what should work with Xen, which is also OK
> but it is a different goal. It is OK to say that we aim for Xen to also
> work with other configurations too, and list them. That was not my
> intention, but I can expand the scope if you request.

To achieve just your goal, would you then please replace all instances
of "all architectures" and "all <N>-bit architectures" by an enumeration
of the specific ones, as you have it elsewhere? This would then allow
architectures I'm thinking about without impacting your goal. FTAOD ...

>>> +   * - long
>>> +     - 32 bits
>>> +     - 32 bits 
>>> +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
>>> +
>>> +   * - long
>>> +     - 64 bits
>>> +     - 64 bits 
>>> +     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
>>> +
>>> +   * - long long
>>> +     - 64-bit
>>> +     - 32-bit
>>> +     - x86_32
>>> +
>>> +   * - long long
>>> +     - 64-bit
>>> +     - 64-bit
>>> +     - 64-bit architectures, ARMv8-A AArch32, ARMv8-R AArch32
>>
>> Along the lines of the above, simply saying "64-bit architectures" here
>> is too generic. Whereas for long (above) and ...
>>
>>> +   * - pointer
>>> +     - 32-bit
>>> +     - 32-bit
>>> +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
>>> +
>>> +   * - pointer
>>> +     - 64-bit
>>> +     - 64-bit
>>> +     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
>>
>> ... pointers I agree (and the special mentioning of the architectures
>> in parentheses could even be omitted imo). To summarize, my counter
>> proposal:

... this counter proposal already specifically addressed that aspect, by
e.g. ...

>>    * - char 
>>      - at least 8 bits
> 
> this
> 
>>      - equaling size
>>      - all architectures
>>
>>    * - char
>>      - 8 bits
>>      - 8 bits
>>      - x86, ARM, RISC-V, PPC

... having two sections here: One to address your goal, and one to
address mine. My further suggestion further up merely would mean
dropping the generic parts (for imo no good reason).

Jan

>>    * - short
>>      - at least 16 bits
> 
> and this
> 
>>      - equaling size
>>      - all architectures
>>
>>    * - short
>>      - 16 bits
>>      - 16 bits
>>      - x86, ARM, RISC-V, PPC
>>
>>    * - int
>>      - at least 32 bits
> 
> and this, more below
> 
> 
>>      - equaling size
>>      - all architectures
>>
>>    * - int
>>      - 32 bits
>>      - 32 bits
>>      - x86, ARM, RISC-V, PPC
>>
>>    * - long
>>      - 32 bits
>>      - 32 bits 
>>      - 32-bit architectures
>>
>>    * - long
>>      - 64 bits
>>      - 64 bits 
>>      - 64-bit architectures
>>
>>    * - long long
>>      - 64-bit
>>      - 32-bit
>>      - x86_32
>>
>>    * - long long
>>      - 64-bit
>>      - 64-bit
>>      - x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch32, ARMv8-R AArch32
>>
>>    * - pointer
>>      - 32-bit
>>      - 32-bit
>>      - 32-bit architectures
>>
>>    * - pointer
>>      - 64-bit
>>      - 64-bit
>>      - 64-bit architectures
>>
>> Eventually, by properly decoupling pointers from longs (via using {,u}intptr_t
>> appropriately), the restrictions on "long" could also be lifted.
>>
>> Note that the generic requirements on char and short also are imposed by C99.
>> It may therefore not be necessary to state them explicitly, but rather refer
>> to that standard (just like you're now referencing the SysV psABI-s).
> 
> I am OK with the above, except for the three instances of "at least". As
> mentioned earlier, we need to specify the supported and validated
> configuration. If you want we can also add another field to express what
> we aim at getting Xen to work with, but it should be separate.


