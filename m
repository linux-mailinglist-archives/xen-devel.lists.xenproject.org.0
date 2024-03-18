Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E0887EC4C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 16:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694807.1083942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmF59-0001ff-AR; Mon, 18 Mar 2024 15:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694807.1083942; Mon, 18 Mar 2024 15:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmF59-0001ci-6M; Mon, 18 Mar 2024 15:39:23 +0000
Received: by outflank-mailman (input) for mailman id 694807;
 Mon, 18 Mar 2024 15:39:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmF57-0001cc-NB
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 15:39:21 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0119930-e53d-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 16:39:20 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so9612481a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 08:39:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1709067d5400b00a46bed423a0sm1206029ejp.23.2024.03.18.08.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 08:39:19 -0700 (PDT)
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
X-Inumbo-ID: b0119930-e53d-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710776360; x=1711381160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DDTDpfEiXD+aZF0PiU/LCyHoU9KWxY8KaDB5BaW2EyA=;
        b=KnsolgRC7QdO+YerUANanQEe5DwgD+tN6SGc7/1cmqbpgumKpRczzNAdk6GDp27y9a
         j4XxC5Gsy7arNv4ZFrnaIFn3y2t0o7f4fAINp9tRZyZX5KsKnoFBB5tu7bQWkj+GcjtI
         DzNgfjv6uCRL2pux9GeC8rCKUBb4BIsEau+q0icMy1hPNVgPJDFhcNTKhNvahdm1c1Jx
         MbfX3ppWbR/WOU2yJ4/bId8zz3wPMQF7lQ+1KNzEfFBfTD924jRU3bP4iVghdwdgQHsg
         oOfkcim8WAIPxL3ZvSM0HnDAtWd2S9Kt/K9xJA5/NlB8snpQOsVa5sd1XVBlxn/q2DoK
         O6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710776360; x=1711381160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDTDpfEiXD+aZF0PiU/LCyHoU9KWxY8KaDB5BaW2EyA=;
        b=F30OdWCJj15Xc7my9oow5kYN3SJyfQ+b8WrYI0h+eN/8gmwKrA7sOA5Rssca4bCzY4
         sGRqZ9vYtrwCnWbkWUTl3yX/QnbckODVlibwuSszp7S/c8cF55OMxnLtm1rapDxuigtw
         T2YxRehZfVqfp5Y8LORfZ2IRsYicfZO8fQwJIvi960VoWe/Z6sZuESkJs5Al07MqJ7A+
         an92a1M4DbDpStui1kBCmyKJhLwf8ntpRh4HT2ktrrOsdlRKDbdu2Nmpq5yEDdmInLrx
         je3/8ILqh1335ex2V3GhMFHSZWlY8Z9FQoZL7xjSwMu1pNNgYms5bBdLQEZISGjpZxtW
         IEnw==
X-Forwarded-Encrypted: i=1; AJvYcCXAC9yG0BeZvQ2xmxR0h+7wh6L0PrXPj5vqE57zke0a6II9W8ujIINcUXET0xE6z3EHjWF5+bB8H2W+LHT4hav5VM2dUjj5PL2H8gQMqw0=
X-Gm-Message-State: AOJu0YzK3oWa66VUmIscCW55SEk76smcKhOdZgUIpG3sSwx9dNMbZhrF
	59eRtWcUmx3BxwU+y7rO/hhI6iyBWSLw1qRcGsN8ssAeKVd/e52+KZ83bM7sMA==
X-Google-Smtp-Source: AGHT+IHFZKroyKBiKJeJgdK3makNuOOPD2WCAaFhKctkbvI1gCAIvw8tqUdLKsTfsmGkqaYQsZcqdQ==
X-Received: by 2002:a17:907:2d26:b0:a46:8a8c:6075 with SMTP id gs38-20020a1709072d2600b00a468a8c6075mr9323772ejc.5.1710776360022;
        Mon, 18 Mar 2024 08:39:20 -0700 (PDT)
Message-ID: <fc1b15e7-8ffc-4bc5-90dd-9f501a0e169d@suse.com>
Date: Mon, 18 Mar 2024 16:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] xen/rwlock: raise the number of possible cpus
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-13-jgross@suse.com>
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
In-Reply-To: <20240314072029.16937-13-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 08:20, Juergen Gross wrote:
> The rwlock handling is limiting the number of cpus to 4095 today. The
> main reason is the use of the atomic_t data type for the main lock
> handling, which needs 2 bits for the locking state (writer waiting or
> write locked), 12 bits for the id of a possible writer, and a 12 bit
> counter for readers. The limit isn't 4096 due to an off by one sanity
> check.
> 
> The atomic_t data type is 32 bits wide, so in theory 15 bits for the
> writer's cpu id and 15 bits for the reader count seem to be fine, but
> via read_trylock() more readers than cpus are possible.

As a result, afaict you choose to use just 14 bits for the CPU, but
still 15 bits (with the 16th to deal with overflow) for the reader count.
That could do with making explicit here, as a question is whether we
deem as sufficient that there is just one extra bit for the reader
count.

> --- a/xen/include/xen/rwlock.h
> +++ b/xen/include/xen/rwlock.h
> @@ -23,12 +23,12 @@ typedef struct {
>  #define rwlock_init(l) (*(l) = (rwlock_t)RW_LOCK_UNLOCKED)
>  
>  /* Writer states & reader shift and bias. */
> -#define    _QW_CPUMASK  0xfffU             /* Writer CPU mask */
> -#define    _QW_SHIFT    12                 /* Writer flags shift */
> -#define    _QW_WAITING  (1U << _QW_SHIFT)  /* A writer is waiting */
> -#define    _QW_LOCKED   (3U << _QW_SHIFT)  /* A writer holds the lock */
> -#define    _QW_WMASK    (3U << _QW_SHIFT)  /* Writer mask */
> -#define    _QR_SHIFT    14                 /* Reader count shift */
> +#define    _QW_SHIFT    14                      /* Writer flags shift */
> +#define    _QW_CPUMASK  ((1U << _QW_SHIFT) - 1) /* Writer CPU mask */
> +#define    _QW_WAITING  (1U << _QW_SHIFT)       /* A writer is waiting */
> +#define    _QW_LOCKED   (3U << _QW_SHIFT)       /* A writer holds the lock */
> +#define    _QW_WMASK    (3U << _QW_SHIFT)       /* Writer mask */
> +#define    _QR_SHIFT    (_QW_SHIFT + 2)         /* Reader count shift */
>  #define    _QR_BIAS     (1U << _QR_SHIFT)

Btw, seeing all the uppercase U suffixes here, I think you had some
lowercase ones earlier in the series. While Misra doesn't demand
uppercase for U, it does for L and iirc we decided to use all
uppercase suffixes as a result. Would be nice if what goes in could
have this correct right away.

> @@ -36,14 +36,16 @@ void queue_write_lock_slowpath(rwlock_t *lock);
>  
>  static inline bool _is_write_locked_by_me(unsigned int cnts)
>  {
> -    BUILD_BUG_ON(_QW_CPUMASK < NR_CPUS);
> +    BUILD_BUG_ON((_QW_CPUMASK + 1) < NR_CPUS);
> +    BUILD_BUG_ON(NR_CPUS * _QR_BIAS > INT_MAX);
>      return (cnts & _QW_WMASK) == _QW_LOCKED &&
>             (cnts & _QW_CPUMASK) == smp_processor_id();
>  }
>  
>  static inline bool _can_read_lock(unsigned int cnts)
>  {
> -    return !(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts);
> +    return cnts <= INT_MAX &&
> +           (!(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts));
>  }

I view this as problematic: Code knowing that a write lock is being held
may invoke a function using read_trylock() and expect the lock to be
available there.

Jan

