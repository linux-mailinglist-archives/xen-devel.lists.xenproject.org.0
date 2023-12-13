Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFDF810C8D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 09:37:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653761.1020271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDKjh-0006dx-Kt; Wed, 13 Dec 2023 08:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653761.1020271; Wed, 13 Dec 2023 08:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDKjh-0006bZ-IM; Wed, 13 Dec 2023 08:36:57 +0000
Received: by outflank-mailman (input) for mailman id 653761;
 Wed, 13 Dec 2023 08:36:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDKjf-0006bR-SW
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 08:36:55 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c53056f8-9992-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 09:36:54 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a1f6433bc1eso1046292866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 00:36:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 rd12-20020a170907a28c00b00a11b2677acbsm7309435ejc.163.2023.12.13.00.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 00:36:54 -0800 (PST)
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
X-Inumbo-ID: c53056f8-9992-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702456614; x=1703061414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wGhqywp7cv5PGxLMBSHpNRwp1heMj6dFujZmw103qyY=;
        b=NkW6ETlu/2GsjNNlAvR6sCqRAJV80IZFsZKmBKR+nsmla/yxeFAMpQ/UgfnuirMaYA
         YkVI8RDto+qTQjliyjhGAuClyDH19hAYzx35F1elR2Ywx2KmDXYQ2Fm855gRVDuMQqc5
         PoQIRcjp5cL+qWn93MSiCkjmqH2YdtE3I8sXVL2n1J0uiqCFGOqraXEziMGxEw0It/EC
         nZZkUfshaZfCs0VYrSSq0/hFpgfC5r8m/xbN9T/XhyGxoT3x7W22/gKyxZ58VVkbxhHC
         iUHWlPYrE40iLX+qXGEaESeIzgls3/mYCa5jeatDpwRuoIZixCYpYVNyxNi6ztzynz9B
         WPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702456614; x=1703061414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wGhqywp7cv5PGxLMBSHpNRwp1heMj6dFujZmw103qyY=;
        b=tj9mXKkH3zqf0Yb9wNmTpNp3DZGpiAcGBSMB6pbgnJvWEL/9Ukn4DcFSHuOviwfilP
         kdQMCWfwzPsTyiJC8rI6O6dzhZM5xMKfEGYnruE4e0NoyXhBZL33JSWBVW1YnibxzGN8
         Ok4j5IorTPo3O3tRnKtkr8Fl1QE2J90pUygObaP+AlwEARK9HUD0ZlVpfAq2ikE86Cev
         m/7DDE+nKCq4vyc1P5vOw7M1VN+/y9Ew6hpoG86ipSgp8z1ur+NlEY5ksq8jXuYu3MgD
         PHS/YtSsBWgndi2w1KYzLfIcpkE1tr4O/SoxnoobC6a71jmxKvTGfCTwHGwHxkI0LFN9
         rXZQ==
X-Gm-Message-State: AOJu0YyPCTepCVeedKcF9vsJk59Xq03phMZ8evEUYnuMme210of8rflm
	mEcbSSmFm+leDO3WZ17c1eKT
X-Google-Smtp-Source: AGHT+IHMFv7ea+ri9j2Lk4lgvEVAZAgfdiFod8vIDyronbyefRRKuGz3zr5i5tNUCJD5HLllMa3b9A==
X-Received: by 2002:a17:906:101e:b0:a01:ae9a:c1d3 with SMTP id 30-20020a170906101e00b00a01ae9ac1d3mr7916013ejm.11.1702456614326;
        Wed, 13 Dec 2023 00:36:54 -0800 (PST)
Message-ID: <3f5f7df0-d7e5-4540-b01b-9b2cde9dcc55@suse.com>
Date: Wed, 13 Dec 2023 09:36:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] xen/spinlock: make struct lock_profile
 rspinlock_t aware
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-7-jgross@suse.com>
 <ba842318-0d5e-4b8f-99f9-f0f1e2dda1ab@xen.org>
 <3895f5bb-354c-4ada-a14d-83537dd5d119@suse.com>
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
In-Reply-To: <3895f5bb-354c-4ada-a14d-83537dd5d119@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.12.2023 07:05, Juergen Gross wrote:
> On 12.12.23 19:42, Julien Grall wrote:
>> On 12/12/2023 09:47, Juergen Gross wrote:
>>> --- a/xen/include/xen/spinlock.h
>>> +++ b/xen/include/xen/spinlock.h
>>> @@ -76,13 +76,19 @@ union lock_debug { };
>>>   */
>>>   struct spinlock;
>>> +/* Temporary hack until a dedicated struct rspinlock is existing. */
>>> +#define rspinlock spinlock
>>>   struct lock_profile {
>>>       struct lock_profile *next;       /* forward link */
>>>       const char          *name;       /* lock name */
>>> -    struct spinlock     *lock;       /* the lock itself */
>>> +    union {
>>> +        struct spinlock *lock;       /* the lock itself */
>>> +        struct rspinlock *rlock;     /* the recursive lock itself */
>>> +    };
>>>       uint64_t            lock_cnt;    /* # of complete locking ops */
>>> -    uint64_t            block_cnt;   /* # of complete wait for lock */
>>> +    uint64_t            block_cnt:63; /* # of complete wait for lock */
>>> +    uint64_t            is_rlock:1;  /* use rlock pointer */
>>
>> This is meant to act like a bool. So I would prefer if we use:
>>
>> bool is_rwlock:1;
>>
>> And then use true/false when set.
> 
> Do we want to do that? AFAIK it would depend on the compiler what the size of
> the struct is when mixing types in bitfields (in this case: bool and uint64_t).

I thought in a similar way as you did when Andrew introduced similar
patterns (see Julien's reply for an example), and was then convinced
that the compiler really is supposed to be doing what we want here.
So yes, I second Julien's desire to have bool used when boolean is
meant.

Jan

