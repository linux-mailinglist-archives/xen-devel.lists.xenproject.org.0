Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD388C73A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 16:36:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698126.1089496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp8q8-0000Lr-Rn; Tue, 26 Mar 2024 15:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698126.1089496; Tue, 26 Mar 2024 15:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp8q8-0000JU-OA; Tue, 26 Mar 2024 15:35:52 +0000
Received: by outflank-mailman (input) for mailman id 698126;
 Tue, 26 Mar 2024 15:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp8q7-0000JO-De
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 15:35:51 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86093720-eb86-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 16:35:50 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a4702457ccbso728700566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 08:35:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f12-20020a170906084c00b00a42f6d17123sm4312017ejd.46.2024.03.26.08.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 08:35:49 -0700 (PDT)
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
X-Inumbo-ID: 86093720-eb86-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711467350; x=1712072150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5tlE2Lgt5hafUbY7kklfIB9+yT3fJaSoqSNj/1aQfM=;
        b=Iq2mLLXdDv6EJj39dFu/l5V3O+7k2SO6hnTCZWJOmVabpVUiK8NvYn9hylXG815ZsZ
         HmAwB5e5Bpk7lj87/+Scb5YkG8E0bLHBFTO7f8wX1Iwd3GumoA83XxtrpNvfxqg3cqGz
         0V6P1zPRAZ77AOfndEE2Z6w3ZuwzPBq3TTMdiZ8L2teL1RrTMmdbsUzLl3wO9ForN708
         dPHJPS/3vQgCbH0fF+P1ar+zbANgpTWHYjbj0Lkc67v+77KiFNRmojvROXVUo9PL7Ecy
         8hKVLiclvm9Edc3lgXlp9iE66hGNfk09is+9XOQBLtqzuyIpLS2vL4wQzreEzr/uHjy4
         SwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711467350; x=1712072150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5tlE2Lgt5hafUbY7kklfIB9+yT3fJaSoqSNj/1aQfM=;
        b=QtCDVTyVuf5VIZo+kLSjTihGM9pN7YfeOvKELXY4MIvMpWnIoy5QDF7niYHS/4MC60
         LxiVyJV3xMxobAngDlMxZamY/G4YEIjspf2mYZe9iIccFkvvi/YzRSDkK/6EGtAeYIRl
         0hqe1ELS5eGQgpZaQKd9L0DdAQc3wyi2X/lSPYfawIklOrF35yYemTNhqOMbm4D07HvE
         N8WlKtO5OhA1xhspupWqDW4UtKBC+fJNU3S/EI1adOJiIUuSA/USARIcq2ap2ofEYabj
         aoiWTTFCURz3oNABssv1cvx7PtzcSMthmVqui4sItXntBCVX/CEd0W06Yj7AVVGF/Fhz
         G5BA==
X-Forwarded-Encrypted: i=1; AJvYcCVdRIBUxDKsAjpyAMYQul4nIIqybcTDiwP1K4UnioMEvesHnZgfBKTqGd9b8krNcNO2871q2kAWnUdzIksszbna8U1ka51+ZIrLsry3M0Y=
X-Gm-Message-State: AOJu0Yy5wF3vQbJm4ZDMw2xSp7DkjY5vr8c64bj8+P8dI4iMRVOFdngc
	JDwoum08JxZcwTTZEpsA1J/FTwXY0MZbke+OmNT5l0N4Gmd9owAVV1Jq9DDlYQ==
X-Google-Smtp-Source: AGHT+IHPx7Y9I8yNU81jy74m565ywY0IRwD+kXRS7/l1lKDaditjD/FGVja1tns/LqqNWzdEq44s0Q==
X-Received: by 2002:a17:906:1d04:b0:a47:34c8:900b with SMTP id n4-20020a1709061d0400b00a4734c8900bmr7001061ejh.0.1711467349742;
        Tue, 26 Mar 2024 08:35:49 -0700 (PDT)
Message-ID: <f8cfa921-5586-4fe0-a18b-a34255a37731@suse.com>
Date: Tue, 26 Mar 2024 16:35:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 07/11] xen/page_alloc: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <ead692e7a9f7f21ae54448073af8b64a40f2ddfe.1711118582.git.nicola.vetrini@bugseng.com>
 <e013539a-b199-4e0f-90c7-835c9774fe17@suse.com>
 <ecb4007097fb835641667161950cc339@bugseng.com>
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
In-Reply-To: <ecb4007097fb835641667161950cc339@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2024 16:27, Nicola Vetrini wrote:
> On 2024-03-25 10:27, Jan Beulich wrote:
>> On 22.03.2024 17:01, Nicola Vetrini wrote:
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -150,7 +150,7 @@
>>>  #include <asm/paging.h>
>>>  #else
>>>  #define p2m_pod_offline_or_broken_hit(pg) 0
>>
>> Seeing this in context: Does Misra also have a rule demanding 
>> evaluation
>> of macro arguments?
> 
> No such rule. There is one for unused function parameters, though.

Interesting. Are there no concerns regarding side effects not taking
place, as one might expect when looking just at the call site?

>>> -#define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>>> +#define p2m_pod_offline_or_broken_replace(pg) BUG_ON((pg) != NULL)
>>
>> Or easier
>>
>> #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg)
>>
>> ?
>>
> 
> Good point. I'll modify it.

I can do that as well while committing. With that adjustment
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

