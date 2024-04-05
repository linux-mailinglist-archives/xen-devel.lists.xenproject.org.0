Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED249899D78
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 14:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701269.1095600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsixg-0001aH-9w; Fri, 05 Apr 2024 12:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701269.1095600; Fri, 05 Apr 2024 12:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsixg-0001Yg-66; Fri, 05 Apr 2024 12:46:28 +0000
Received: by outflank-mailman (input) for mailman id 701269;
 Fri, 05 Apr 2024 12:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsixe-0001YP-JR
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 12:46:26 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 835f296d-f34a-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 14:46:25 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4148c6132b4so19162705e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 05:46:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l10-20020adfe58a000000b003434f526cb5sm1922456wrm.95.2024.04.05.05.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 05:46:24 -0700 (PDT)
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
X-Inumbo-ID: 835f296d-f34a-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712321185; x=1712925985; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gm7VP+crjXo4brUIcP4GbX5FpyFfgIDuKWdO8OGlHXU=;
        b=Skm3IIlc/MWvSuI90lOK57QqG37A3BzJgJQLT6JlhVpinL6Yvm9NdsKyTk+tzxMiIr
         h9j+FTQ91Zp3eO+s3F96BhNJJKgAkdowyEKM89gg/kZq5gHssI7tJYcys8k4uFvE5kWP
         Q5hMUsmIc/nZq8IQQsFqq6/jiCJipSgmCTkys5X15NwLvOsuhwP2tx4sVWgKPoHiFCUa
         /Q2zLXQGiY2hzmfsCtSIolbUSB+pM+oDYxuqAaTA/Cq7VrgjDTwIDQo2CUjxSJPae0wS
         Bbv9Ikf68bGKhLHCXpJOEoBWK5TdY+mwgEB0Mks4ygCHC025ZaQcSPRhNX9+kiEQF1s/
         BTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712321185; x=1712925985;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm7VP+crjXo4brUIcP4GbX5FpyFfgIDuKWdO8OGlHXU=;
        b=um2ENXO0NYI+NCznImDz/GQg9mP5HTnc+pMN4t9b5Q8mLmPYYi5GtThLaJFpxCB/Rd
         sxXKyAhOqR/dZJn3aY5P+4+MKcKRv/BfH3xUwSqLqfT/zAJsxmI61n2Z2IWXcVMoqWEi
         y4U3NPBkG4ytu9oFtZS7PYKrC8K1GGPvLJqywVwoEBS25de5Q+yDPUaI6Apo+2344nZi
         qejtmojLpK1+xDUXcRMKkXglPtITjCaUIVucUvk7Otpo5xphD1biDWkvd36POsz3VDnJ
         LwdxKjqtLeGfyULikH+VGgcPxwdqrJ7lXaXrDnwwlHg1HXzQQO88kl/BiTD90PDwwvGe
         I05A==
X-Forwarded-Encrypted: i=1; AJvYcCWojN30ZODvabin4Kh6dQfwvuwTBhCMoxop2k3h7YliCQ45LFyPRx0TTxyDBmEP5+PYyB5f9HTfm9dTmmFdLXJNSrMBqy6ZyFISU4COpn0=
X-Gm-Message-State: AOJu0YySXFmQJ7SQWAVzTEPvvHoaLnL8P64yt4+tHXAgs6H6NLXndbGI
	0N+2y21zIpDrQfJyT9/vemQwqssJYCpHmDLLfRmmGlFq4EM2LOEJn/8Ye0Eonw==
X-Google-Smtp-Source: AGHT+IFreEBPjhAxgfttDeAuoy9BrERPLUIAG/AsA3XUpvYXjBeTVjZ7V6BQ2n6Jo5FoWoXBbtYRYA==
X-Received: by 2002:a5d:6584:0:b0:33e:6ef3:b68e with SMTP id q4-20020a5d6584000000b0033e6ef3b68emr1356384wru.34.1712321184804;
        Fri, 05 Apr 2024 05:46:24 -0700 (PDT)
Message-ID: <c7b0a6b1-ca13-448d-ab46-9e54cd031211@suse.com>
Date: Fri, 5 Apr 2024 14:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/19] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <ff6922206ab5476df907e2a05255663865f07301.1712137031.git.oleksii.kurochko@gmail.com>
 <aabb1d9a-3910-479e-858d-a11777873ef5@suse.com>
 <5ee906c53e2d4a966fa6be3be50caa19c3c164a2.camel@gmail.com>
 <4ba7c962-a635-4a7d-8e03-093361cc6353@suse.com>
 <c92ef420468fdf45a878efda37c582c0cab2332f.camel@gmail.com>
 <edd36d22-a2da-4e38-a586-14c742da18f7@suse.com>
 <024957c9a5347b38639aa859d316dce7492f1eef.camel@gmail.com>
 <fda609e5-3ceb-432c-aaae-80b712013a6c@suse.com>
 <03cb48d41f93b9a5255828474cdf333106aee2f9.camel@gmail.com>
 <87ad818358831680e25281a8615248b31816a309.camel@gmail.com>
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
In-Reply-To: <87ad818358831680e25281a8615248b31816a309.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.04.2024 13:56, Oleksii wrote:
> On Fri, 2024-04-05 at 13:53 +0200, Oleksii wrote:
>> On Fri, 2024-04-05 at 10:05 +0200, Jan Beulich wrote:
>>> On 05.04.2024 09:56, Oleksii wrote:
>>>> On Fri, 2024-04-05 at 08:11 +0200, Jan Beulich wrote:
>>>>> On 04.04.2024 18:24, Oleksii wrote:
>>>>>> On Thu, 2024-04-04 at 18:12 +0200, Jan Beulich wrote:
>>>>>>> On 04.04.2024 17:45, Oleksii wrote:
>>>>>>>> On Thu, 2024-04-04 at 15:22 +0200, Jan Beulich wrote:
>>>>>>>>> On 03.04.2024 12:19, Oleksii Kurochko wrote:
>>>>>>>>>> --- a/xen/include/xen/bitops.h
>>>>>>>>>> +++ b/xen/include/xen/bitops.h
>>>>>>>>>> @@ -65,10 +65,164 @@ static inline int
>>>>>>>>>> generic_flsl(unsigned
>>>>>>>>>> long
>>>>>>>>>> x)
>>>>>>>>>>   * scope
>>>>>>>>>>   */
>>>>>>>>>>  
>>>>>>>>>> +#define BITOP_BITS_PER_WORD 32
>>>>>>>>>> +/* typedef uint32_t bitop_uint_t; */
>>>>>>>>>> +#define bitop_uint_t uint32_t
>>>>>>>>>
>>>>>>>>> So no arch overrides permitted anymore at all?
>>>>>>>> Not really, I agree that it is ugly, but I expected that
>>>>>>>> arch
>>>>>>>> will
>>>>>>>> use
>>>>>>>> undef to override.
>>>>>>>
>>>>>>> Which would be fine in principle, just that Misra wants us
>>>>>>> to
>>>>>>> avoid
>>>>>>> #undef-s
>>>>>>> (iirc).
>>>>>> Could you please give me a recommendation how to do that
>>>>>> better?
>>>>>>
>>>>>> The reason why I put this defintions before inclusion of
>>>>>> asm/bitops.h
>>>>>> as RISC-V specific code uses these definitions inside it, so
>>>>>> they
>>>>>> should be defined before asm/bitops.h; other option is to
>>>>>> define
>>>>>> these
>>>>>> definitions inside asm/bitops.h for each architecture.
>>>>>
>>>>> Earlier on you had it that other way already (in a different
>>>>> header,
>>>>> but the principle is the same): Move the generic definitions
>>>>> immediately
>>>>> past inclusion of asm/bitops.h and frame them with #ifndef.
>>>> It can be done in this way:
>>>> xen/bitops.h:
>>>>    ...
>>>>    #include <asm/bitops.h>
>>>>    
>>>>    #ifndef BITOP_TYPE
>>>>    #define BITOP_BITS_PER_WORD 32
>>>>    /* typedef uint32_t bitop_uint_t; */
>>>>    #define bitop_uint_t uint32_t
>>>>    #endif
>>>>    ...
>>>>    
>>>> But then RISC-V will fail as it is using bitop_uint_t inside
>>>> asm/bitops.h.
>>>> So, at least, for RISC-V it will be needed to add asm/bitops.h:
>>>>    #define BITOP_BITS_PER_WORD 32
>>>>    /* typedef uint32_t bitop_uint_t; */
>>>>    #define bitop_uint_t uint32_t
>>>>    
>>>>
>>>> It seems to me that this breaks the idea of having these macro
>>>> definitions generic, as RISC-V will redefine BITOP_BITS_PER_WORD
>>>> and
>>>> bitop_uint_t with the same values as the generic ones.
>>>
>>> I don't follow. Right now patch 7 has
>>>
>>> #undef BITOP_BITS_PER_WORD
>>> #undef bitop_uint_t
>>>
>>> #define BITOP_BITS_PER_WORD BITS_PER_LONG
>>> #define bitop_uint_t unsigned long
>>>
>>> You'd drop the #undef-s and keep the #define-s. You want to
>>> override
>>> them
>>> both, after all.
>>>
>>> A problem would arise for _another_ arch wanting to use these
>>> (default)
>>> types in its asm/bitops.h. Which then could still be solved by
>>> having
>>> a
>>> types-only header.
>> This problem arise now for Arm and PPC which use BITOP_BITS_PER_WORD
>> inside it. Then it is needed to define BITOP_BITS_PER_WORD=32 in
>> asm/bitops.h for Arm and PPC. If it is okay, then I will happy to
>> follow this approach.
>>
>>>  Recall the discussion on the last summit of us meaning
>>> to switch to such a model anyway (perhaps it being
>>> xen/types/bitops.h
>>> and
>>> asm/types/bitops.h then), in a broader fashion? IOW for now you
>>> could
>>> use
>>> the simple approach as long as no other arch needs the types in its
>>> asm/bitops.h. Later we would introduce the types-only headers, thus
>>> catering for possible future uses.
>> Do we really need asm/types/bitops.h? Can't we just do the following
>> in
>> asm/bitops.h:
>>   #ifndef BITOP_TYPE
>>   #include <xen/types/bitops.h>
>>   #endif

This might do, yes.

> Or as an options just update <xen/types.h> with after inclusion of
> <asm/types.h>:
>    #ifndef BITOP_TYPE
>       #define BITOP_BITS_PER_WORD 32
>       /* typedef uint32_t bitop_uint_t; */
>       #define bitop_uint_t uint32_t
>    #endif
>    
> And then just include <xen/types.h> to <<xen/bitops.h>.

That's a (transient) option as well, I guess.

Jan

