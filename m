Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F78B9823
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 11:54:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715727.1117572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2T8A-00040t-H4; Thu, 02 May 2024 09:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715727.1117572; Thu, 02 May 2024 09:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2T8A-0003yT-DD; Thu, 02 May 2024 09:53:34 +0000
Received: by outflank-mailman (input) for mailman id 715727;
 Thu, 02 May 2024 09:53:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2T88-0003yK-JX
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 09:53:32 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3e5b059-0869-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 11:53:29 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41adf3580dbso9601625e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 02:53:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w20-20020a05600c475400b0041befc2652csm5146326wmo.31.2024.05.02.02.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 02:53:28 -0700 (PDT)
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
X-Inumbo-ID: d3e5b059-0869-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714643609; x=1715248409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=06MTo3BFClf2Y5rzR+dRcYttIeBThahWk2BGF+WvEok=;
        b=OGKWn18LxzZpZ/D25UMbCy29RcGvs1SUlw3bI/w7h6yfT2iqTTjic1tfsTZATrezUQ
         7TFY25PgTPqYzLWuc8fKs4d278F7tcJUKURqsOKIZaBr3Z51M++ImQJMx4j32QiZsc+d
         kLOsAs849Y8PzT1YrtBK5isB2FT+epOwBif0ilGJH6FOyEW4DxR1wUvRh7MwgF+MnILv
         DY7w94hDYGJP9QIe4pu1Wu6v0v1X96BgJXs10duED7J6Ph3COILN+JIz+s/0mltnl09K
         0spX1Ph+7krSiqHZdPeITv+kiFPKBbgDaTWEV+3BfIcnYI4HleLIqCRZdNC5TTpLR/vB
         lyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714643609; x=1715248409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06MTo3BFClf2Y5rzR+dRcYttIeBThahWk2BGF+WvEok=;
        b=is74zBLanPHl68tYta1xGjez9zo+IkrNIQ4Pblj8e+6cm+41avCGxNOsrfJcWeWvQz
         kQIym61K7Gkf/nwdneE7zHOW8UtyKI9Jbzggt4BokvJfYT+RtbxjcfXvqiky8rstowcH
         vEhUqUiV3M0lxjt9RF5UxgZEgrUtvrnSaz+96U2ffbMVzGgP3Ek9ZTZH1V4pIWeuOftN
         haSFANA5Z4Y8gdi4ONXlGa7Fm07hJX4GVL/k4EtmT0farfdXBYSKKqnJEnSwT6cIgj7j
         fxGBXn1nUhhr+66m2HdE+VjNJJwA5JVsp1mfla/jZFtWTQpSNPRegZLtNX1f+pagRRb6
         17BA==
X-Forwarded-Encrypted: i=1; AJvYcCVjl8C6MeDvxvHg0ox35EblB95TP8Gh8rxpa8ivHXqnao6fUy5ZXcxvDEtTkeDdzeNpJx/SElKV3chV7pZseWE4rrbwy5mtYRvlE8EkIGU=
X-Gm-Message-State: AOJu0Yx9vafdoNupUDN6gGUHMgGIlWTow4+539veIP916vk8muf7jC56
	XVO2ijlupDOIKZ9PPwMr1P4Rt/LiKfMInZ2gs4da6mItZZRjw3KP1QIsTJE68w==
X-Google-Smtp-Source: AGHT+IESk0CxrY2d1AWdT+b8PKtlzo8/eeapYwhMxA3YkEFsGux7th9XIEFhozvipU5RfUrvbZVq2A==
X-Received: by 2002:a05:600c:1383:b0:41a:8035:af77 with SMTP id u3-20020a05600c138300b0041a8035af77mr1865029wmf.12.1714643608718;
        Thu, 02 May 2024 02:53:28 -0700 (PDT)
Message-ID: <4fee2998-e29b-43bb-855a-8600dbef9f13@suse.com>
Date: Thu, 2 May 2024 11:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible array
 member not at the end
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-3-luca.fancellu@arm.com>
 <327c7e42-9b59-4925-b746-0b59dbb5a3fb@suse.com>
 <91B23E5F-7515-4C4E-9FBD-57654980905F@arm.com>
 <de09e134-0150-49ca-8338-a0f4759c218b@suse.com>
 <29573F6B-BE27-4A65-A310-35883A39F989@arm.com>
 <af1116ad-6401-403b-a3b8-abe421e2e3da@suse.com>
 <2DF15520-B0A4-4972-92F6-FCB6BB852292@arm.com>
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
In-Reply-To: <2DF15520-B0A4-4972-92F6-FCB6BB852292@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.05.2024 10:13, Luca Fancellu wrote:
> 
> 
>> On 2 May 2024, at 07:43, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 02.05.2024 08:33, Luca Fancellu wrote:
>>>
>>>
>>>> On 2 May 2024, at 07:14, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 01.05.2024 08:57, Luca Fancellu wrote:
>>>>> Hi Jan,
>>>>>
>>>>>> On 30 Apr 2024, at 12:37, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> On 30.04.2024 13:09, Luca Fancellu wrote:
>>>>>>> --- a/xen/arch/arm/include/asm/setup.h
>>>>>>> +++ b/xen/arch/arm/include/asm/setup.h
>>>>>>> @@ -64,18 +64,20 @@ struct membank {
>>>>>>> };
>>>>>>>
>>>>>>> struct membanks {
>>>>>>> -    unsigned int nr_banks;
>>>>>>> -    unsigned int max_banks;
>>>>>>> +    __struct_group(membanks_hdr, common, ,
>>>>>>> +        unsigned int nr_banks;
>>>>>>> +        unsigned int max_banks;
>>>>>>> +    );
>>>>>>>   struct membank bank[];
>>>>>>> };
>>>>>>
>>>>>> I'm afraid I can't spot why __struct_group() is needed here. Why would just
>>>>>> one of the two more straightforward
>>>>>>
>>>>>> struct membanks {
>>>>>>  struct membanks_hdr {
>>>>>>      unsigned int nr_banks;
>>>>>>      unsigned int max_banks;
>>>>>>  );
>>>>>>  struct membank bank[];
>>>>>> };
>>>>>>
>>>>>
>>>>> At the first sight I thought this solution could have worked, however GCC brought me back down to earth
>>>>> remembering me that flexible array members can’t be left alone in an empty structure:
>>>>>
>>>>> /data_sdc/lucfan01/gitlab_mickledore_xen/xen/xen/arch/arm/include/asm/setup.h:70:6: error: declaration does not declare anything [-Werror]
>>>>> 70 | };
>>>>> | ^
>>>>> /data_sdc/lucfan01/gitlab_mickledore_xen/xen/xen/arch/arm/include/asm/setup.h:71:20: error: flexible array member in a struct with no named members
>>>>> 71 | struct membank bank[];
>>>>> | ^~~~
>>>>> [...]
>>>>
>>>> Since for patch 1 you looked at Linux'es uapi/linux/stddef.h, the solution
>>>> to this lies there, in __DECLARE_FLEX_ARRAY(). Alongside or instead of
>>>> borrowing __struct_group(), we could consider borrowing this as well. Or
>>>> open-code it just here, for the time being (perhaps my preference). Yet
>>>> it's not clear to me that doing so will actually be enough to make things
>>>> work for you.
>>>
>>> I looked also into __DECLARE_FLEX_ARRAY(), but then decided __struct_group()
>>> was enough for my purpose, can I ask the technical reasons why it would be your
>>> preference? Is there something in that construct that is a concern for you?
>>
>> I don't like either construct very much, but of the two __DECLARE_FLEX_ARRAY()
>> looks slightly more "natural" for what is wanted and how it's done.
>> __struct_group() introducing twice the (effectively) same structure feels
>> pretty odd, for now at least. It's not even entirely clear to me whether there
>> aren't pitfalls, seeing that the C spec differentiates named and unnamed
>> struct fields in a few cases. For __DECLARE_FLEX_ARRAY(), otoh, I can't
>> presently see any reason to suspect possible corner cases.
>>
>> Yet as said before - I'm not sure __DECLARE_FLEX_ARRAY() alone would be enough
>> for what you want to achieve.
> 
> Mmm yes, I think I would still have problems because container_of wants a named member,
> so __DECLARE_FLEX_ARRAY() doesn’t help much alone, if I’m not missing something obvious.
> If you believe however that importing __struct_group() only for this instance is not enough to justify
> its presence in the codebase, I could open-code it, provided that maintainers are ok with that.

I'm afraid I've even more strongly against open-coding. If you can get an
ack from another maintainer for the introduction of struct_group(), that
would still allow it to go in. I didn't NAK the change, I merely have
reservations.

> In any case it would be used soon also for other architectures using bootinfo.

Oh, would it?

Jan

