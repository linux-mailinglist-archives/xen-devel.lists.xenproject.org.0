Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3633386B40D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 17:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686732.1069131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfMOY-0007Xf-KK; Wed, 28 Feb 2024 16:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686732.1069131; Wed, 28 Feb 2024 16:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfMOY-0007V1-HN; Wed, 28 Feb 2024 16:02:58 +0000
Received: by outflank-mailman (input) for mailman id 686732;
 Wed, 28 Feb 2024 16:02:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfMOX-0007Uv-NY
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 16:02:57 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5ca900c-d652-11ee-afd8-a90da7624cb6;
 Wed, 28 Feb 2024 17:02:56 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a3e85a76fa8so567346066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 08:02:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cx11-20020a170907168b00b00a43e8430190sm1014758ejd.47.2024.02.28.08.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 08:02:55 -0800 (PST)
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
X-Inumbo-ID: d5ca900c-d652-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709136176; x=1709740976; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=99Fim99KC2lLNEyLs9RhWoU4a6GouEolWcAdgTKNHZk=;
        b=Ang745JPIc+laPjYfG4E1y8jl2iXLsiGmMnYVhwON/EqRTBsAjJ85qCeNNTDeKAULX
         h7FFha4VGE0nfPGkZ5ErlrqBFs2UEKjm1kRbiwXnFTFSTl2Ljn4A/EvgloGIcFMj3kzk
         sUJpWM99z9Z+7roizhuiHMlw36z139TgXsGkVcJrlh9DHTm5KXGkQgrNN0qo4pUyufqi
         qQ9J6C5GhNantDzgQfVzEO/ilghtihbSciw5Z0CczpdVtci80WSf5UzXSpBvr63AK0im
         L2mQzPUojWyJbzrPX+cEuHF0DC1SgReZEGDYlhY9i2whuX30WC7TinG/ua+9i1YasJr6
         NDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136176; x=1709740976;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=99Fim99KC2lLNEyLs9RhWoU4a6GouEolWcAdgTKNHZk=;
        b=eBsfmavsbUoeP4KXFWA/EH+ojziJcom0zbiH5ZVdWrFV1346c8DVu+r/UcYEUA8IeP
         SJXOR4lFdxfeGsqnNIn1YUugyyYRS4Ech3PfrNhDmWAoNvbYfxeOae6KIm6V01KNxkal
         IMe1QUOyEmy1xV3+GZBEiYnFrjaKg7kTfNa6xIxzfFsC/aeFmA1K+9Zg7u+uqSuxMq7Y
         FZekN48TVrppe60KShLjlQH1A6KNXHEFFRaxkQTw8Vo/G2WIE2jlXLedAm10y6sHozsU
         IYGcYq9FKp0Tm2zAjhRTa9sdC2NhCndDlcEfTsUhkxKGr1lacAryn3lVyGVaUNh17BKF
         VYxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXqkFGVBHM27PhHTgnfX/B+bUFe2qA/BDkzdcyKTl0S/7GnzDRsiVJ6gntzAYzNfWvWjoUyLSqDNYLEQ15QSM8TqzeEcfHtaDsYeadoy8=
X-Gm-Message-State: AOJu0YzfPlseROvvIc0vZMlnrzYefnbGzTEvl4fro0WRRFG751VZSvYO
	XHZ1R615Vad5p/yRwSXYumY4odxlAHLoI3l8e7qDHOVmyEBFZyeP2N4MACOg4w==
X-Google-Smtp-Source: AGHT+IEm4HL9oqEV+XnwVlzsWzgPYFpapdFctp4xzn0B6GqI9GsN/pkMdxxbVqww5SNmo7vLkHkdgw==
X-Received: by 2002:a17:906:7c45:b0:a43:bf24:41aa with SMTP id g5-20020a1709067c4500b00a43bf2441aamr106182ejp.37.1709136175635;
        Wed, 28 Feb 2024 08:02:55 -0800 (PST)
Message-ID: <8a0397c8-4ce6-4f4b-8a50-b0deaa30f291@suse.com>
Date: Wed, 28 Feb 2024 17:02:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] xen/spinlock: make struct lock_profile
 rspinlock_t aware
Content-Language: en-US
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-7-jgross@suse.com>
 <b76bff63-80de-4227-bcd9-8d3aa1275858@suse.com>
 <99aca5d7-87f1-4cce-a23d-3e1468ba3918@suse.com>
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
In-Reply-To: <99aca5d7-87f1-4cce-a23d-3e1468ba3918@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.02.2024 16:43, Jürgen Groß wrote:
> On 28.02.24 16:19, Jan Beulich wrote:
>> On 12.12.2023 10:47, Juergen Gross wrote:
>>> --- a/xen/common/spinlock.c
>>> +++ b/xen/common/spinlock.c
>>> @@ -538,19 +538,31 @@ static void spinlock_profile_iterate(lock_profile_subfunc *sub, void *par)
>>>   static void cf_check spinlock_profile_print_elem(struct lock_profile *data,
>>>       int32_t type, int32_t idx, void *par)
>>>   {
>>> -    struct spinlock *lock = data->lock;
>>> +    unsigned int cpu;
>>> +    uint32_t lockval;
>>
>> Any reason for this not being unsigned int as well? The more that ...
>>
>>> +    if ( data->is_rlock )
>>> +    {
>>> +        cpu = data->rlock->debug.cpu;
>>> +        lockval = data->rlock->tickets.head_tail;
>>> +    }
>>> +    else
>>> +    {
>>> +        cpu = data->lock->debug.cpu;
>>> +        lockval = data->lock->tickets.head_tail;
>>> +    }
> 
> I've used the same type as tickets.head_tail.
> 
>>>   
>>>       printk("%s ", lock_profile_ancs[type].name);
>>>       if ( type != LOCKPROF_TYPE_GLOBAL )
>>>           printk("%d ", idx);
>>> -    printk("%s: addr=%p, lockval=%08x, ", data->name, lock,
>>> -           lock->tickets.head_tail);
>>> -    if ( lock->debug.cpu == SPINLOCK_NO_CPU )
>>> +    printk("%s: addr=%p, lockval=%08x, ", data->name, data->lock, lockval);
>>
>> ... it's then printed with plain x as the format char.
> 
> Which hasn't been changed by the patch. I can change it to PRIx32 if you want.

As per ./CODING_STYLE unsigned int is preferred.

>>> --- a/xen/include/xen/spinlock.h
>>> +++ b/xen/include/xen/spinlock.h
>>> @@ -76,13 +76,19 @@ union lock_debug { };
>>>   */
>>>   
>>>   struct spinlock;
>>> +/* Temporary hack until a dedicated struct rspinlock is existing. */
>>> +#define rspinlock spinlock
>>>   
>>>   struct lock_profile {
>>>       struct lock_profile *next;       /* forward link */
>>>       const char          *name;       /* lock name */
>>> -    struct spinlock     *lock;       /* the lock itself */
>>> +    union {
>>> +        struct spinlock *lock;       /* the lock itself */
>>> +        struct rspinlock *rlock;     /* the recursive lock itself */
>>> +    };
>>
>> _LOCK_PROFILE() wants to initialize this field, unconditionally using
>> .lock. While I expect that problem to be taken care of in one of the
>> later patches, use of the macro won't work anymore with this union in
>> use with very old gcc that formally we still support. While a road to
>> generally raising the baseline requirements is still pretty unclear to
>> me, an option might be to require (and document) that to enable
>> DEBUG_LOCK_PROFILE somewhat newer gcc needs using.
> 
> Patch 8 is using either .lock or .rlock depending on the lock type.
> 
> What is the problem with the old gcc version? Static initializers of
> anonymous union members?

Yes.

Jan

