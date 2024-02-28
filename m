Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F2F86B2F3
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 16:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686706.1069061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLiT-0002U3-08; Wed, 28 Feb 2024 15:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686706.1069061; Wed, 28 Feb 2024 15:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLiS-0002SZ-Te; Wed, 28 Feb 2024 15:19:28 +0000
Received: by outflank-mailman (input) for mailman id 686706;
 Wed, 28 Feb 2024 15:19:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfLiR-0002R9-9h
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 15:19:27 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1bf193f-d64c-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 16:19:25 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51320536bddso137794e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 07:19:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 vx2-20020a170907a78200b00a43af1ea069sm1759193ejc.118.2024.02.28.07.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 07:19:24 -0800 (PST)
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
X-Inumbo-ID: c1bf193f-d64c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709133565; x=1709738365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yZ+PpHwHuxyIijc08+YFX/whxYqZCaXqTIzosDoQE3U=;
        b=bfDizt9qKF2qdiTrBnPZoYvLAtvhfKlIDqZ7jT2aBcWTKDvOevEeA85p9wZKDFfDP1
         X7vdSjbd48oejjpmlYOj1+4sz3iFJqG2pFM96pQRb2N+aBz0mt5W6+qgpammOKr8mUtj
         6cZU/JGgp7moBGy7YYXpuJLVWC7fi14YqgaoVdNHPvfswACF9krmSeoKCoxyOp7SahXQ
         +tmwNsssN2BcgJ3m55TrktmMR6UOiJzASm4YLMKwWH9bmltxDQZpp1tSAXWFKulMT6AS
         9gNEw8j265n3P2BxHZHG024drHF2GrS4MpBjNRHe9efsdRpkjDFiM2gPPFnCAGcKL12/
         AbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709133565; x=1709738365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZ+PpHwHuxyIijc08+YFX/whxYqZCaXqTIzosDoQE3U=;
        b=iXsFfDhEo/zHXe/43mbjfIr7dWMiXgKGJPRRhyXSSvSYvnwuAJdnufVM+1RcoEt9+A
         MZnqDwDLprmoDefPY6HXKKMMBfN1Qzv/VSFusUbIcrvAirzYFFrpEKVo/h2VcBmfUaNA
         N32XrvDoo/ZeTiPUni3kNb1QJyAWNWMWABUmiUs7/JAa3mk0GFp1WnspqoD5cUeC4qOc
         r+pNlFhkFrMT1fMVRD07zHEBAuN2NVmprJEajxgfnZDV9BbvYo88AZUwCWUh76FqTArC
         Z+UzUSReLNQbtIPPAyw7GDLALd69L4ML4c7LGRgyoKVYck/0T7BZFelbUl945poWMISy
         kS2A==
X-Forwarded-Encrypted: i=1; AJvYcCU9ehFhku+FQCJeryKmaDd9w7SkhLOYs6YZqhdinpkph6w1g7E5CkZNQ0RPXEkIyrrj8+mGeROl9Hk7F8Dz+o5ml/skwD6VhPCHFkaVEHQ=
X-Gm-Message-State: AOJu0Yw7bwUCq6ssBk0CUSBvX79J8iGf7ldXC4CPkYFlCLACjVy2xkkV
	Nnp19fO78EohH5wl53KT2vyhcGDBie3dX1rUyqc9SjR+HYoaywutOBCyEl+2VQ==
X-Google-Smtp-Source: AGHT+IFVk2Bp7m0sbV9PRMR3aOQVvbTjLBNpY3sBEoF4kecksBYzga+ZJjMaHKxPyvbIFwGmLbdL4A==
X-Received: by 2002:a19:ac4b:0:b0:513:202b:9001 with SMTP id r11-20020a19ac4b000000b00513202b9001mr12174lfc.6.1709133564656;
        Wed, 28 Feb 2024 07:19:24 -0800 (PST)
Message-ID: <b76bff63-80de-4227-bcd9-8d3aa1275858@suse.com>
Date: Wed, 28 Feb 2024 16:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] xen/spinlock: make struct lock_profile
 rspinlock_t aware
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-7-jgross@suse.com>
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
In-Reply-To: <20231212094725.22184-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 10:47, Juergen Gross wrote:
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -538,19 +538,31 @@ static void spinlock_profile_iterate(lock_profile_subfunc *sub, void *par)
>  static void cf_check spinlock_profile_print_elem(struct lock_profile *data,
>      int32_t type, int32_t idx, void *par)
>  {
> -    struct spinlock *lock = data->lock;
> +    unsigned int cpu;
> +    uint32_t lockval;

Any reason for this not being unsigned int as well? The more that ...

> +    if ( data->is_rlock )
> +    {
> +        cpu = data->rlock->debug.cpu;
> +        lockval = data->rlock->tickets.head_tail;
> +    }
> +    else
> +    {
> +        cpu = data->lock->debug.cpu;
> +        lockval = data->lock->tickets.head_tail;
> +    }
>  
>      printk("%s ", lock_profile_ancs[type].name);
>      if ( type != LOCKPROF_TYPE_GLOBAL )
>          printk("%d ", idx);
> -    printk("%s: addr=%p, lockval=%08x, ", data->name, lock,
> -           lock->tickets.head_tail);
> -    if ( lock->debug.cpu == SPINLOCK_NO_CPU )
> +    printk("%s: addr=%p, lockval=%08x, ", data->name, data->lock, lockval);

... it's then printed with plain x as the format char.

> +    if ( cpu == SPINLOCK_NO_CPU )
>          printk("not locked\n");
>      else
> -        printk("cpu=%d\n", lock->debug.cpu);
> -    printk("  lock:%" PRId64 "(%" PRI_stime "), block:%" PRId64 "(%" PRI_stime ")\n",
> -           data->lock_cnt, data->time_hold, data->block_cnt, data->time_block);
> +        printk("cpu=%u\n", cpu);
> +    printk("  lock:%" PRIu64 "(%" PRI_stime "), block:%" PRIu64 "(%" PRI_stime ")\n",
> +           data->lock_cnt, data->time_hold, (uint64_t)data->block_cnt,

I think I know why the cast is suddenly / unexpectedly needed, but imo
such wants stating in the description, when generally we aim at avoiding
casts where possible.

> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -76,13 +76,19 @@ union lock_debug { };
>  */
>  
>  struct spinlock;
> +/* Temporary hack until a dedicated struct rspinlock is existing. */
> +#define rspinlock spinlock
>  
>  struct lock_profile {
>      struct lock_profile *next;       /* forward link */
>      const char          *name;       /* lock name */
> -    struct spinlock     *lock;       /* the lock itself */
> +    union {
> +        struct spinlock *lock;       /* the lock itself */
> +        struct rspinlock *rlock;     /* the recursive lock itself */
> +    };

_LOCK_PROFILE() wants to initialize this field, unconditionally using
.lock. While I expect that problem to be taken care of in one of the
later patches, use of the macro won't work anymore with this union in
use with very old gcc that formally we still support. While a road to
generally raising the baseline requirements is still pretty unclear to
me, an option might be to require (and document) that to enable
DEBUG_LOCK_PROFILE somewhat newer gcc needs using.

>      uint64_t            lock_cnt;    /* # of complete locking ops */
> -    uint64_t            block_cnt;   /* # of complete wait for lock */
> +    uint64_t            block_cnt:63; /* # of complete wait for lock */
> +    uint64_t            is_rlock:1;  /* use rlock pointer */

bool?

Jan

