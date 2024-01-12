Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC7282BC03
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 08:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666679.1037477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOCGm-0002ja-1W; Fri, 12 Jan 2024 07:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666679.1037477; Fri, 12 Jan 2024 07:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOCGl-0002gL-Ua; Fri, 12 Jan 2024 07:47:59 +0000
Received: by outflank-mailman (input) for mailman id 666679;
 Fri, 12 Jan 2024 07:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnUc=IW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rOCGk-0002ex-PJ
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 07:47:58 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e62e3cb0-b11e-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 08:47:56 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3366ddd1eddso5133591f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 23:47:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b0040e60c00d2csm4649697wmq.12.2024.01.11.23.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 23:47:55 -0800 (PST)
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
X-Inumbo-ID: e62e3cb0-b11e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705045676; x=1705650476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDcCRkOllHyogcez2YXc+p19zNJiTZ+CI4GQ7eU4KFg=;
        b=Mq8XUS6KIe6U3wP+ebBC7kgW2FrjcgBi1yi6Y07Ivaf9KLc/vf5xv1zKkOOJRZnW7N
         B4oPaugTkRyYjaQNL8yDhyky9iMfKN1bp5X1iyew8DjDQ/cRiwlUsBkpPw34quIKn6+D
         r7jyKXvbwbrFz1tEC8ZH3UzB9mPG/N+K/SZc/ju2bA5vct3lGbNtZ0Nnex+8Ex/3c6SP
         Ws3mRkOmnlthhaPFg+nJV9HcAgE4+q/kwRJEi9rC3x96Jyz4B+ns+bv56Meq8UJ+sSZg
         Ci1gP52iqbkGW/HzRaFRWbtwPQAaJdOru/I6POTwosFctWRbUIcyH2jMKEOQYJ9l45Kx
         Q5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705045676; x=1705650476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDcCRkOllHyogcez2YXc+p19zNJiTZ+CI4GQ7eU4KFg=;
        b=VjzUk69LaMpBO3nLdLNm6r0uklIXH++LE5iRmZtyBsj6P71L4WIbshTqebLdVwt/S1
         6T6wcTevkHYuHNtaKq9esKPZsEJQeALnKdeBwSjJP6Bt6Vs+pyLYy5/XFraVDkA/vZKQ
         /TcG0Pls7xIFhCK6xwlP29O9Dz8vT8Y7lfR8aNrXM2fI3wKGr4FeIq7NHQI2wC8Le19d
         E1I2y64TxnhMePn4plFJ97/8aGQEwqXvQxAGR5CskfyUxPX8jFwgEZwh7bBJTfhvItpN
         GoPtr5RMednReQzZDXzzZOza1z/5/VksE9fYsZNO8S/3rukzu63Ao5jLNugPoj95wQdT
         kG6w==
X-Gm-Message-State: AOJu0YwQ4/A/MgiIYQGRPS6gBBCbNU1Zr6KNXDrTcUL1u7p+kZJHvHMl
	HExlOoZFXl6eaqlOTmE7vaAariT6gfPA
X-Google-Smtp-Source: AGHT+IEoadJmmuVgY2188ty8ejnsXPWU9A33w+4+0I6PeqeQFBllfQLiOaLOX2KeboLVo7I7nrQwbQ==
X-Received: by 2002:a05:600c:468d:b0:40e:6277:e11e with SMTP id p13-20020a05600c468d00b0040e6277e11emr261596wmo.304.1705045676058;
        Thu, 11 Jan 2024 23:47:56 -0800 (PST)
Message-ID: <6926f363-3994-4059-b7e1-cb8e45367be8@suse.com>
Date: Fri, 12 Jan 2024 08:47:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/22] x86: add a boot option to enable and disable the
 direct map
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>, Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-12-julien@xen.org>
 <fc70f967-34bb-9569-f514-7a3208e746c6@suse.com>
 <bc989828-69b9-4919-9ff3-fdd53fb2def1@amazon.com>
 <c736e4d9-5262-4adf-9e74-9b1be5ab13db@suse.com>
 <4ab710c3-c628-4bbe-9533-88af75a9b9ec@xen.org>
 <ba63d435-e26f-4c76-aedc-c027e8b03a6d@suse.com>
 <0dcc54dd-b729-4e20-95af-fa4907a550c6@amazon.com>
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
In-Reply-To: <0dcc54dd-b729-4e20-95af-fa4907a550c6@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.01.2024 19:25, Elias El Yandouzi wrote:
> 
> 
> On 11/01/2024 14:09, Jan Beulich wrote:
>> On 11.01.2024 13:25, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 11/01/2024 11:53, Jan Beulich wrote:
>>>> On 11.01.2024 11:47, Elias El Yandouzi wrote:
>>>>> On 22/12/2022 13:24, Jan Beulich wrote:
>>>>>> That said, I think this change comes too early in the series, or there is
>>>>>> something missing.
>>>>>
>>>>> At first, I had the same feeling but looking at the rest of the series,
>>>>> I can see that the option is needed in follow-up patches.
>>>>>
>>>>>> As said in reply to patch 10, while there the mapcache
>>>>>> is being initialized for the idle domain, I don't think it can be used
>>>>>> just yet. Read through mapcache_current_vcpu() to understand why I think
>>>>>> that way, paying particular attention to the ASSERT() near the end.
>>>>>
>>>>> Would be able to elaborate a bit more why you think that? I haven't been
>>>>> able to get your point.
>>>>
>>>> Why exactly I referred to the ASSERT() there I can't reconstruct. The
>>>> function as a whole looks problematic though when suddenly the idle
>>>> domain also gains a mapcache. I'm sorry, too much context was lost
>>>> from over a year ago; all of this will need looking at from scratch
>>>> again whenever a new version was posted.
>>>>
>>>>>> In preparation of this patch here I think the mfn_to_virt() uses have to all
>>>>>> disappear from map_domain_page(). Perhaps yet more strongly all
>>>>>> ..._to_virt() (except fix_to_virt() and friends) and __va() have to
>>>>>> disappear up front from x86 and any code path which can be taken on x86
>>>>>> (which may simply mean purging all respective x86 #define-s, without
>>>>>> breaking the build in any way).
>>>>>
>>>>> I agree with you on that one. I think it is what we're aiming for in the
>>>>> long term. However, as mentioned by Julien in the cover letter, the
>>>>> series's name is a misnomer and I am afraid we won't be able to remove
>>>>> all of them with this series. These helpers would still be used for
>>>>> xenheap pages or when the direct map is enabled.
>>>>
>>>> Leaving a hazard of certain uses not having been converted, or even
>>>> overlooked in patches going in at around the same time as this series?
>>>> I view this as pretty "adventurous".
>>>
>>> Until we get rid of the directmap completely (which is not the goal of
>>> this series), we will need to keep mfn_to_virt().
>>>
>>> In fact the one you ask to remove in map_domain_page() will need to be
>>> replaced with function doing the same thing. The same for the code that
>>> will initially prepare the directmap. This to avoid impacting
>>> performance when the user still wants to use the directmap.
>>>
>>> So are you just asking to remove most of the use and rename *_to_virt()
>>> to something that is more directmap specific (e.g. mfn_to_directmap_virt())?
>>
>> Well, in a way. If done this way, mfn_to_virt() (and __va()) should have no
>> users by the end of the series, and it would be obvious that nothing was
>> missed (and by then purging the old ones we could also ensure no new uses
>> would appear).
> 
> What about maddr_to_virt()? For instance, in the function 
> xen/arch/x86/dmi_scan.c:dmi_iterate(), we need to access a very low 
> machine address which isn't in the directmap range.

I'm afraid I don't follow: Very low addresses are always in the
direct map range, which - on x86 - always starts at 0.

> How would you proceed? Calling vmap() seems to be a bit overkill for 
> just a temporary mapping and I don't really want to rework this function 
> to use map_domain_page().
> 
> In such case, how would you proceed? What do you suggest?

fixmap may be an option to consider, but I also don't see why you
apparently think using vmap() would be a possibility while at the
same time making use of map_domain_page() is too much effort.

Jan

