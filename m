Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62E08B94C6
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 08:43:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715565.1117292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Q9s-0002TI-Bs; Thu, 02 May 2024 06:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715565.1117292; Thu, 02 May 2024 06:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Q9s-0002QM-90; Thu, 02 May 2024 06:43:08 +0000
Received: by outflank-mailman (input) for mailman id 715565;
 Thu, 02 May 2024 06:43:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2Q9q-0002QG-D7
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 06:43:06 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 398fedc4-084f-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 08:43:03 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41b4ff362a8so70651795e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 23:43:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c1d8c00b0041bcb898984sm791184wms.31.2024.05.01.23.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 23:43:02 -0700 (PDT)
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
X-Inumbo-ID: 398fedc4-084f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714632183; x=1715236983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvxunB0V+uViE8WQxSg4C7zZwRt/Mn7AaDi3tcb3hEU=;
        b=TCFvErmgyyJzJCfGwKyepdpEBKsEuh59Vj1WXxISly/1PtLKOh0ZDj11lIqi4TH68o
         7FXbNlrtJlKjARdoKFliAQPS/QnR+osxa+Vt2hOCHMEVhheEgUzI64IWuyYZL6u+6w+i
         SaNDgrOtZRwhZ8wtQgG/DEUnOQl2tKrC7M9QKIxxQrIcXAI5ZUc++doAWTaloqTEGHiJ
         jTprYgHRadnNCbcbbKTxr+NQKBb6XwuP8w2Bd/OA+cwfyH5238fT5EyBCAK2wv3ST4JQ
         YuTQE3xVsv2Ql9bQt4Ep0vfTp7B5jU9996ulk+Se7/TfqcKJRvk41OhFchf/+qGg/8lD
         GHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714632183; x=1715236983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MvxunB0V+uViE8WQxSg4C7zZwRt/Mn7AaDi3tcb3hEU=;
        b=MpuTkhES2rO4Vn1yAX4PSfO0uwhSKH26mCbSN8roi1zb8O2lcx8cAa9RDBjoIBYOow
         rR6WfuhyD49rR0i9ZRTHqVCAqUsW0qMFtYQe1QeCEsrxAroapPIViSqaNeai8atNi+SJ
         ljUjR4DU4VWSECf6Qvz2RLexIz8lGlP3sOV3wWE7TBH+/hGewOo4rf14GGrtWMuIT1SS
         rGlHBqeui2j5wPfSx2IiZQC68d1bbI0O1DBRAPluPrPVMCieZq/j2e3tQzodnUKq9Jyp
         N4S7DGqDjUmtEdG+p1eEnsHsN0Eam2IPvRe84WF3lwTZscQ4TK17xb45NaN43ZVc0CdX
         ho6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4/6lpKNjBEMz2FOJ1fxMYoUBTBwhH4Vss08uduTYx727iapiWRgd2rG+Bb3pbN/Hh2QBsAshQrZNigdbFhEt6/wLWkYAf7ADT1LqGJkQ=
X-Gm-Message-State: AOJu0YzqypoR5ttp1rZRaDrXrOmOBAvKpRcfgcSoYKy3Vlw3+kVA6D9L
	ieRb+izGREYHoUsBa7WaSw89a/FqKEcrbnUjIAKGROj//7kiHHFpLYgNL51t6w==
X-Google-Smtp-Source: AGHT+IEsAPHrsVZoklCsm2+0z+E5Q2OOycBmiWrl109MnjaYFJL5k2Cu4QR9B4K0je9XpquHusPvzg==
X-Received: by 2002:a05:600c:3516:b0:41b:eaf2:f7e6 with SMTP id h22-20020a05600c351600b0041beaf2f7e6mr4386004wmq.2.1714632182858;
        Wed, 01 May 2024 23:43:02 -0700 (PDT)
Message-ID: <af1116ad-6401-403b-a3b8-abe421e2e3da@suse.com>
Date: Thu, 2 May 2024 08:43:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible array
 member not at the end
Content-Language: en-US
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
In-Reply-To: <29573F6B-BE27-4A65-A310-35883A39F989@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.05.2024 08:33, Luca Fancellu wrote:
> 
> 
>> On 2 May 2024, at 07:14, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 01.05.2024 08:57, Luca Fancellu wrote:
>>> Hi Jan,
>>>
>>>> On 30 Apr 2024, at 12:37, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 30.04.2024 13:09, Luca Fancellu wrote:
>>>>> --- a/xen/arch/arm/include/asm/setup.h
>>>>> +++ b/xen/arch/arm/include/asm/setup.h
>>>>> @@ -64,18 +64,20 @@ struct membank {
>>>>> };
>>>>>
>>>>> struct membanks {
>>>>> -    unsigned int nr_banks;
>>>>> -    unsigned int max_banks;
>>>>> +    __struct_group(membanks_hdr, common, ,
>>>>> +        unsigned int nr_banks;
>>>>> +        unsigned int max_banks;
>>>>> +    );
>>>>>    struct membank bank[];
>>>>> };
>>>>
>>>> I'm afraid I can't spot why __struct_group() is needed here. Why would just
>>>> one of the two more straightforward
>>>>
>>>> struct membanks {
>>>>   struct membanks_hdr {
>>>>       unsigned int nr_banks;
>>>>       unsigned int max_banks;
>>>>   );
>>>>   struct membank bank[];
>>>> };
>>>>
>>>
>>> At the first sight I thought this solution could have worked, however GCC brought me back down to earth
>>> remembering me that flexible array members can’t be left alone in an empty structure:
>>>
>>> /data_sdc/lucfan01/gitlab_mickledore_xen/xen/xen/arch/arm/include/asm/setup.h:70:6: error: declaration does not declare anything [-Werror]
>>> 70 | };
>>> | ^
>>> /data_sdc/lucfan01/gitlab_mickledore_xen/xen/xen/arch/arm/include/asm/setup.h:71:20: error: flexible array member in a struct with no named members
>>> 71 | struct membank bank[];
>>> | ^~~~
>>> [...]
>>
>> Since for patch 1 you looked at Linux'es uapi/linux/stddef.h, the solution
>> to this lies there, in __DECLARE_FLEX_ARRAY(). Alongside or instead of
>> borrowing __struct_group(), we could consider borrowing this as well. Or
>> open-code it just here, for the time being (perhaps my preference). Yet
>> it's not clear to me that doing so will actually be enough to make things
>> work for you.
> 
> I looked also into __DECLARE_FLEX_ARRAY(), but then decided __struct_group()
> was enough for my purpose, can I ask the technical reasons why it would be your
> preference? Is there something in that construct that is a concern for you?

I don't like either construct very much, but of the two __DECLARE_FLEX_ARRAY()
looks slightly more "natural" for what is wanted and how it's done.
__struct_group() introducing twice the (effectively) same structure feels
pretty odd, for now at least. It's not even entirely clear to me whether there
aren't pitfalls, seeing that the C spec differentiates named and unnamed
struct fields in a few cases. For __DECLARE_FLEX_ARRAY(), otoh, I can't
presently see any reason to suspect possible corner cases.

Yet as said before - I'm not sure __DECLARE_FLEX_ARRAY() alone would be enough
for what you want to achieve.

Jan

