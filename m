Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230D09431C4
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 16:12:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768817.1179706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZA45-0000Iw-4Y; Wed, 31 Jul 2024 14:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768817.1179706; Wed, 31 Jul 2024 14:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZA45-0000GZ-0v; Wed, 31 Jul 2024 14:12:29 +0000
Received: by outflank-mailman (input) for mailman id 768817;
 Wed, 31 Jul 2024 14:12:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZA44-0000GT-AF
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 14:12:28 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9e928d5-4f46-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 16:12:26 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7a8e73b29cso459797766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 07:12:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab22ff1sm773816666b.35.2024.07.31.07.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 07:12:25 -0700 (PDT)
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
X-Inumbo-ID: e9e928d5-4f46-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722435146; x=1723039946; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+TAyoyIqnH8cIcRiaj90o1rkWu+glJGqWkl7UmKVSYk=;
        b=dYqOOO19Fkr8UfLmxVnFnxNjeE+Mk5/xbIm6Qfwmdp8VpLWcTa2vL3vGEqcmRU7JXk
         RnBeeibHXCjtvLAacRSAhiGf8PDhZC2zW20TmqBP8PGzrbf7JHFj9vvcRdilHXBcX2Ye
         lkSSgmIsH+U5F0sqYcrTv2LsY5PKsYU9c/LR6adoH/4hwy+XJfZ/4LEInyhK9zPenoJv
         7WatANrK997XezEIXO3Et4PKXAAkT0Gt0rxm8auZAOamdtbR6Lv0SjO4AJ8cnPs4YQLg
         TAA28mF7vqoT9juEXi2Rc9kXbzFlHDjDkydLZBAkivo8rotO/RgkKci1dluRvze3vK2T
         kwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722435146; x=1723039946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TAyoyIqnH8cIcRiaj90o1rkWu+glJGqWkl7UmKVSYk=;
        b=rrpsLSOAf+fbQV+lbCoOR4x+JOZhmwK9RR8FnD76V4s3cHUvxmFcokhybzHXRZ+6ED
         ojTPK7r9BAIISSvNe5IvYbJ7jbTML8aBIwOGEvTgCb9KadMMAn9HuVeD7d9CMjYe+k+3
         clF4GWqgOXSuWbiFOyjsO9g/1CU2bbz6vPTSqF1QcwKPS1XYqFtuUBD/0O6XrYlaCa7n
         t44lUTAUifXYlZdzP2bJp8lzipSSgLJnJvPUKZ0HC1qwV9TxdiSgXuPkwD1V4FCFlTfV
         +w6UN/hC1geHbe8DodrdexwlHesWLPSJS3RsAmNyOp9/P27117RNLEGeHrPX3hvHkHRa
         DbkA==
X-Forwarded-Encrypted: i=1; AJvYcCWbzraLRCQtl4Ec7HfMRUhIzLX6dv+l0hL7pGShxdSEIXxoWiaUTkpmoi+CwxpJnXx28INHoYKAp+AmbTgE/h5KC1PtegaU8VFi1JPDBtk=
X-Gm-Message-State: AOJu0YwO16bbl/bA5liJuNdJUgCMmZrIaq7i0W0qYVatwI9lXh8wcy3x
	ZPE0BJ0OuwDL5U/URHEE0VgFmAgRprRC/1tuur7eHpYZY7ETA5yGJ4XEaDg43w==
X-Google-Smtp-Source: AGHT+IEoBJG07FJFs0E2E+6MRXcncvCLdmCFO8+GxQXun7W8mz7i86soTcFZrRWTaP1fILO70zslaw==
X-Received: by 2002:a17:907:9483:b0:a7a:83f8:cfd5 with SMTP id a640c23a62f3a-a7d3ff9f2f8mr989134366b.18.1722435145567;
        Wed, 31 Jul 2024 07:12:25 -0700 (PDT)
Message-ID: <67896aad-8cec-4bb7-a9dd-c244aae61c85@suse.com>
Date: Wed, 31 Jul 2024 16:12:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: Factor domlist_{insert,remove}() out of
 domain_{create,destroy}()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240731120406.3429430-1-andrew.cooper3@citrix.com>
 <33cde4c7-e00a-47e0-b752-82e514df99d3@suse.com>
 <1de0e761-0c87-4a7f-a7a9-3c468489c410@citrix.com>
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
In-Reply-To: <1de0e761-0c87-4a7f-a7a9-3c468489c410@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 16:07, Andrew Cooper wrote:
> On 31/07/2024 1:14 pm, Jan Beulich wrote:
>> On 31.07.2024 14:04, Andrew Cooper wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -64,6 +64,57 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>>>  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>>>  struct domain *domain_list;
>>>  
>>> +/*
>>> + * Insert a domain into the domlist/hash.  This allows the domain to be looked
>>> + * up by domid, and therefore to be the subject of hypercalls/etc.
>>> + */
>>> +static void domlist_insert(struct domain *d)
>>> +{
>>> +    struct domain **pd;
>>> +
>>> +    spin_lock(&domlist_update_lock);
>>> +
>>> +    /* domain_list is maintained in domid order. */
>>> +    pd = &domain_list;
>> Make this the initializer of the variable, if ...
>>
>>> +    for ( ; *pd != NULL; pd = &(*pd)->next_in_list )
>> ... isn't to be the starting clause of the for()?
> 
> Ok.
> 
>>
>>> +        if ( (*pd)->domain_id > d->domain_id )
>>> +            break;
>>> +
>>> +    d->next_in_list = *pd;
>>> +    d->next_in_hashbucket = domain_hash[DOMAIN_HASH(d->domain_id)];
>>> +    rcu_assign_pointer(*pd, d);
>>> +    rcu_assign_pointer(domain_hash[DOMAIN_HASH(d->domain_id)], d);
>> Maybe worth putting the hash in a local variable?
> 
> Ok.
> 
>>
>>> +    spin_unlock(&domlist_update_lock);
>>> +}
>>> +
>>> +/*
>>> + * Remove a domain from the domlist/hash.  This means the domain can no longer
>>> + * be looked up by domid, and therefore can no longer be the subject of
>>> + * *subsequent* hypercalls/etc.  In-progress hypercalls/etc can still operate
>>> + * on the domain.
>>> + */
>>> +static void domlist_remove(struct domain *d)
>>> +{
>>> +    struct domain **pd = &domain_list;
>>> +
>>> +    spin_lock(&domlist_update_lock);
>>> +
>>> +    pd = &domain_list;
>> pd already has an initializer.
> 
> Ah - that was a copy&paste error of mine.  I'll drop the initialiser.

The initializer? Then please also don't switch to making it the initializer
in domlist_insert(), but rather move it into the for(). I think the two
functions want to remain in sync in this regard.

> The code I copied from strictly initialises *pd with the update lock
> held.  As we're only taking the address of pointer, I think it's safe to
> be outside, but its also just an LEA so also not interesting to
> initialise outside.

One can really view it both ways, I suppose. The compiler is also free to
move it, even across the spin_lock(), aiui.

Jan

