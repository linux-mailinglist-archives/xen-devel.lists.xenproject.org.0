Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734EE8C4EAE
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721350.1124725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oqk-0006pI-A3; Tue, 14 May 2024 09:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721350.1124725; Tue, 14 May 2024 09:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oqk-0006m9-7I; Tue, 14 May 2024 09:53:34 +0000
Received: by outflank-mailman (input) for mailman id 721350;
 Tue, 14 May 2024 09:53:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6oqi-0006lv-D1
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:53:32 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d217edb4-11d7-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 11:53:31 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59c5c9c6aeso1325748166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:53:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17894d92sm697859066b.85.2024.05.14.02.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 02:53:30 -0700 (PDT)
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
X-Inumbo-ID: d217edb4-11d7-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715680411; x=1716285211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WcSjuuUmwI/uTFm3SLnWKhOwvy97ImVZk9TT5SOLH2E=;
        b=BJBr9uegqn+PFMu4OBHB12grV/4RkHmyqPaK7M9akJxEJQd3KxmhO78kUZXcPLwHEf
         lM7cuP8XblcU6tk9YCn6c4Z1yM6HglhMQAilvXon29wRb/lxcTHFH+CxlW3O9Qfsbcfi
         5Z+smRQ7L/CG9fhibzG7iehIXo2nmTCAh95w8FYoPyHOJYvCbJswGm+B0j76rMBTBOBw
         8FMncNIGPmEZM3+OXJLHXN1KVE8b/9ZAvH09iLC7WzUaz5W+Mhs5l+ut08R8YxUZ+PGU
         vmGTWvNJSFJf8+siJJ8Iop2hjRvfZh3IwaR+J8HPHoEg8pQIfZY02Idc933jiMxr7K4A
         4Ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715680411; x=1716285211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WcSjuuUmwI/uTFm3SLnWKhOwvy97ImVZk9TT5SOLH2E=;
        b=fWMaF3V1aS4jBkUGeX9jxDyNBBP7DKEjtCoC7/dydYA5hy3yvknM0eskPRRhiiVKhu
         ZQsUDgVmpuKK1uBBKEL1i1TvBZkvOP2L8gEP9K5lymEcM6ZlUqYZop6tjzpq3R9Cocv3
         xVSjLGehRj4yMlAicpL1mvFPoT2v/WLOoIZeLbjzeDArRo8zaj70qumpafCwtJiYS/YC
         vpH0o5GgWw68nIl9x+gHU2CrZttLC2eaptdNllIdjUXamsQFIfywN4nPZFW4ZnJi1gmo
         eQAaTTnT3aCyCrko3Zd9EQ5a2uH+wg4ts6AKHHxeyYuGTbyMlxsrV/jLixbnYXXqaz3X
         cAGw==
X-Forwarded-Encrypted: i=1; AJvYcCWubdCjqI8LG9nmk5GZSvSkpdEMHApTkVwJ7Z/4HEsPs+Tv6iT4iI+YiHciLJVFHTZEopl/sAEfSzY8k8t5jr5siQEg5e6KUuFX6XB4bXI=
X-Gm-Message-State: AOJu0Yxu7nKlaigYSHcHb5JAuTLH1wAuJS4N+peTEMkUwSUXSMxcSkjY
	iGgmYu8GWB1u9Na80dLbKm7dbv2lNbrOu0FgsytgbKu0YiQqobq9B3J96v9Ivw==
X-Google-Smtp-Source: AGHT+IHzEzFaT9851PgGPMxhJgxyFOzpd3SeGYOtjsx9PratNWuoD5LN44iXXHwoaF+PYCr7X1u6Zg==
X-Received: by 2002:a17:907:1b17:b0:a59:aa69:9791 with SMTP id a640c23a62f3a-a5a2d5eeb92mr1208196066b.34.1715680410801;
        Tue, 14 May 2024 02:53:30 -0700 (PDT)
Message-ID: <054dfde5-cfaa-470b-9d40-c0453bc4dbbb@suse.com>
Date: Tue, 14 May 2024 11:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 11/27] x86: Lift mapcache variable to the arch
 level
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Wang <wawei@amazon.de>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-12-eliasely@amazon.com>
 <1ff19cb2-851d-40cf-bb12-5b7074eee0b8@suse.com>
 <06e162de-55d6-4612-aa45-b1a350571d2b@amazon.com>
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
In-Reply-To: <06e162de-55d6-4612-aa45-b1a350571d2b@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.05.2024 17:22, Elias El Yandouzi wrote:
>>> This only lifts the mapcache variable up. Whether we populate the
>>> mapcache for a domain is unchanged in this patch.
>>
>> Is it? I wonder because of ...
>>
> 
> I agree, the commit message doesn't completely reflect the changes below.
> 
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -843,6 +843,8 @@ int arch_domain_create(struct domain *d,
>>>   
>>>       psr_domain_init(d);
>>>   
>>> +    mapcache_domain_init(d);
>>> +
>>>       if ( is_hvm_domain(d) )
>>>       {
>>>           if ( (rc = hvm_domain_initialise(d, config)) != 0 )
>>> @@ -850,8 +852,6 @@ int arch_domain_create(struct domain *d,
>>>       }
>>>       else if ( is_pv_domain(d) )
>>>       {
>>> -        mapcache_domain_init(d);
>>> -
>>>           if ( (rc = pv_domain_initialise(d)) != 0 )
>>>               goto fail;
>>>       }
>>
>> ... this and ...
>>
>>> --- a/xen/arch/x86/domain_page.c
>>> +++ b/xen/arch/x86/domain_page.c
>>> @@ -82,11 +82,11 @@ void *map_domain_page(mfn_t mfn)
>>>   #endif
>>>   
>>>       v = mapcache_current_vcpu();
>>> -    if ( !v || !is_pv_vcpu(v) )
>>> +    if ( !v )
>>>           return mfn_to_virt(mfn_x(mfn));
>>
>> ... this and yet more changes indicating otherwise.
>>
>> Yet if which domains have a mapcache set up is already changed here, I
>> wonder whether the idle domain shouldn't be taken care of here as well.
> 
> Do you suggest to fold here the following patch where the mapcache gets 
> initialized for idle domains?

Or the respective part(s) thereof.

Jan

