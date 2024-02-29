Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F6286CD08
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:32:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687216.1070328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiOT-0006qr-4a; Thu, 29 Feb 2024 15:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687216.1070328; Thu, 29 Feb 2024 15:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiOT-0006oz-1Y; Thu, 29 Feb 2024 15:32:21 +0000
Received: by outflank-mailman (input) for mailman id 687216;
 Thu, 29 Feb 2024 15:32:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfiOR-0006ot-KF
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:32:19 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b908e2de-d717-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 16:32:18 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3122b70439so191127266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 07:32:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 tj7-20020a170907c24700b00a413d1eda4bsm789972ejc.87.2024.02.29.07.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 07:32:17 -0800 (PST)
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
X-Inumbo-ID: b908e2de-d717-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709220738; x=1709825538; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xrC7QPOJE9dPLFEXGY/QD3AwNupVDWNAcYL77MydVgI=;
        b=Ej4+ridFvusv1lWXL8rPuXY0FBrdNNl7AJW1kzbbo9D7Ld49zRu8luvcTSjqnc001t
         cq/zUvhhm8YcB/zFlyrmFLF/8vxeouSjLaq5V3e0hOyNzYLPXP3jsxR+fW0d3jKlskfT
         vrmrCsQVuPPhnV1PZJU3zPS3I+RqOm0Nshbe9pwtwl/MFdJ93cGC+Lq24FJMikL9wF2X
         O2Kv0so8PM40NSY4SQ130lDdmZQWO2HXsTvB+uEuX3PH73cjsE5wwIktFccd4uOWUDRc
         Fr4/wfMaZ1PQuunCCIy1hcwP8j4Az7YDMmunMXetHpBx2c5vjVOjFjiex/Li5eqxkd2E
         hP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709220738; x=1709825538;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xrC7QPOJE9dPLFEXGY/QD3AwNupVDWNAcYL77MydVgI=;
        b=izpx3yndlV90SUg8i3CcPR8LL61p3f6ai+i/I6ljGS+Isdr4SvEO2uIpqlCYd95lJq
         Ok1E5l9mcxvRp9IIDUOF2UPKmxJ4qYeAZL4ONMFvQAZE2DJndCf/h3QbujTD/BzQ0dvn
         7driV+M/NCcQbxN0+XnE/4EujjreTUGXIbXEYT0+iSba2hKunONA7BpQYdRpz76Gd/T9
         3zQ4rb67izolwJoNhdeJa/iysIyNI+d3tsraylt+AH+4UWwi7kjQwZVmx+g3HydzH+uS
         mdWH7zoTwq6kK3Xcz/fBW/IYdUDk/0idiASi3ZHWIHV4IHYeVBHhMo/Om3nHCQVgZ5XW
         IESA==
X-Forwarded-Encrypted: i=1; AJvYcCVFZMxlKWpzzV86uUwNSmaN1AfA5mo94s8IgnOWbdpwIyZZpq35ObGx59i6i3x1meglXIyj7SD27h+9a9D+XO/fT3mtV5MCgF74y8GUTJk=
X-Gm-Message-State: AOJu0YwNUveRBsuSg4MUiX6eFpGdo5X9AU+9+jYUWF6njs75x9I6wEvK
	wvZmWvXM7kOZmudSFwih5pb1OAiXW3Q9t8ounNStohPnUuhQDkZZ7YalmCqCww==
X-Google-Smtp-Source: AGHT+IGARFwoa5UH0HPSKNdPrSOO4KJU7cEPAU/hvgniIIUms646HVf396WwLqeEeunP1DRnH/pHiA==
X-Received: by 2002:a17:906:d8b4:b0:a42:615:1395 with SMTP id qc20-20020a170906d8b400b00a4206151395mr1930469ejb.11.1709220737946;
        Thu, 29 Feb 2024 07:32:17 -0800 (PST)
Message-ID: <a037facf-c4d9-491f-b39f-56ed4221abf1@suse.com>
Date: Thu, 29 Feb 2024 16:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] xen/spinlock: split recursive spinlocks from
 normal ones
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-11-jgross@suse.com>
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
In-Reply-To: <20231212094725.22184-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 10:47, Juergen Gross wrote:
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -541,6 +541,55 @@ void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags)
>      local_irq_restore(flags);
>  }
>  
> +int nrspin_trylock(rspinlock_t *lock)
> +{
> +    check_lock(&lock->debug, true);
> +
> +    if ( unlikely(lock->recurse_cpu != SPINLOCK_NO_CPU) )
> +        return 0;
> +
> +    return spin_trylock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
> +}

I wonder if we shouldn't take the opportunity and stop having trylock
functions have "int" return type. Perhaps already spin_trylock_common()
when introduced could use "bool" instead, then here following suit.

> +void nrspin_lock(rspinlock_t *lock)
> +{
> +    spin_lock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR, NULL,
> +                     NULL);
> +}
> +
> +void nrspin_unlock(rspinlock_t *lock)
> +{
> +    spin_unlock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
> +}
> +
> +void nrspin_lock_irq(rspinlock_t *lock)
> +{
> +    ASSERT(local_irq_is_enabled());
> +    local_irq_disable();
> +    nrspin_lock(lock);
> +}
> +
> +void nrspin_unlock_irq(rspinlock_t *lock)
> +{
> +    nrspin_unlock(lock);
> +    local_irq_enable();
> +}
> +
> +unsigned long __nrspin_lock_irqsave(rspinlock_t *lock)
> +{
> +    unsigned long flags;
> +
> +    local_irq_save(flags);
> +    nrspin_lock(lock);
> +    return flags;

Nit: Strictly speaking we want a blank line ahead of this "return".

> @@ -166,11 +172,15 @@ struct lock_profile_qhead { };
>  struct lock_profile { };
>  
>  #define SPIN_LOCK_UNLOCKED {                                                  \
> +    .debug =_LOCK_DEBUG,                                                      \
> +}
> +#define RSPIN_LOCK_UNLOCKED {                                                 \
> +    .debug =_LOCK_DEBUG,                                                      \
>      .recurse_cpu = SPINLOCK_NO_CPU,                                           \
>      .debug =_LOCK_DEBUG,                                                      \
>  }

Initializing .debug twice?

> @@ -180,7 +190,6 @@ struct lock_profile { };
>  
>  #endif
>  
> -
>  typedef union {
>      uint32_t head_tail;
>      struct {

Looks like this might be undoing what the earlier patch isn't going to
do anymore?

> @@ -242,6 +257,19 @@ void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
>  int rspin_is_locked(const rspinlock_t *lock);
>  void rspin_barrier(rspinlock_t *lock);
>  
> +int nrspin_trylock(rspinlock_t *lock);
> +void nrspin_lock(rspinlock_t *lock);
> +void nrspin_unlock(rspinlock_t *lock);
> +void nrspin_lock_irq(rspinlock_t *lock);
> +void nrspin_unlock_irq(rspinlock_t *lock);
> +#define nrspin_lock_irqsave(l, f)                               \
> +    ({                                                          \
> +        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
> +        ((f) = __nrspin_lock_irqsave(l));                       \

I don't think the outer pair of parentheses is needed here. As to the
leading double underscores, see comments elsewhere.

Jan

