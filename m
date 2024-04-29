Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D468B5A3A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 15:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714075.1115060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1RD0-000557-7J; Mon, 29 Apr 2024 13:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714075.1115060; Mon, 29 Apr 2024 13:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1RD0-00052P-4a; Mon, 29 Apr 2024 13:38:18 +0000
Received: by outflank-mailman (input) for mailman id 714075;
 Mon, 29 Apr 2024 13:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1RCz-00052H-9k
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 13:38:17 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb6ae1cb-062d-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 15:38:16 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-346b96f1483so2399092f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 06:38:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b0041c7ac6b0ffsm1124181wmb.37.2024.04.29.06.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 06:38:15 -0700 (PDT)
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
X-Inumbo-ID: bb6ae1cb-062d-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714397895; x=1715002695; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qnaB0ScdITi7wiStqPk3K/EL5SZNLMoz01hmUmnGLlY=;
        b=SajM7PZOzUx2FJOQE4/lIzZFb+Hs6pCdFekfY/VpbtvFS7OLYStK3G4izg0LvTgwRB
         tMs7qLbzFbSncZEl1LtT0VUgQlKUDofYyhi1m7eKnWtBUvZjArQwLbq/0zesqvBVOGzb
         /bmQe+EmY4OpsZkUy30+oLc+Cq3Zv4hAdouOfGvnFUceAS+tfn1rYe0qRI2Fsb0H5+pk
         PifJlYgJ5YENjzF+xUWfoy2Hx3fVO7CUJGuMOJLc5o/ns1AywlXQcy5JKEqbNiSSoJWg
         VjI4WOc+huh79dO4PdKMGNlfWFbu3uVJ7M/QxeiEMeNhEKYR1+6R46H7slqrLF7xBm6c
         SsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714397895; x=1715002695;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qnaB0ScdITi7wiStqPk3K/EL5SZNLMoz01hmUmnGLlY=;
        b=djk3gSVQ3ovi8GJXFvhyPqCXjK4qlVON/QuMLJ6zCVvpjtVnjOpdHNnVICAL/SvIel
         wmYzTV8bA8MCFJAtJh1FK2JvxUNVK7v2p0dymcBuIEuImXK+rqg4B7jnuTBAnMwzkKfL
         4sKe/pw7ewOHuTUZzORvDht7mpmxH/K69BQRnI4jLYgqdIeLqNtlZpP1E7IrIQ4GPByd
         UqpbZHreCNLi64Nela5a8GMp1D1nFPpIqL+36ApUnY4c3CzkEe3bnW3+OkPquij22XSg
         BI/myfR8gpk8ya88lCzOcZPl8VrGGwL3MrGpL7QSnSnBjdKeqvTY00nb5koQikZKw4m1
         LMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzBZlEERfecl29LlU/X3UdBVElQbYlPSVa5s9V69OZrzv0ZctfgYi7neRTcBNFwES0J3o1SGSqxeSnsMBKgrrGyO0SIEHkGWkgHua6JAE=
X-Gm-Message-State: AOJu0YzgcRYheUAMf6V23g1GHl+zxLtCvYx/dC8Mup0Xc5szzJfF9swR
	5+w6n/vtj5SGlKGFs9IMPpw1tZiYEhqU8CrmjKD7GLwbRfEBfouN7U00nHINpA==
X-Google-Smtp-Source: AGHT+IEINkQqDGS6GjgZvVjKKgOmCJLUrXaGFogUcLrWsu+yVpe/xWxRHGX8rj/TzrIjVka5zZJHQw==
X-Received: by 2002:a05:6000:70e:b0:34c:b7e7:cac0 with SMTP id bs14-20020a056000070e00b0034cb7e7cac0mr6896004wrb.20.1714397895490;
        Mon, 29 Apr 2024 06:38:15 -0700 (PDT)
Message-ID: <31f2dd75-4217-4110-8577-78fb77082299@suse.com>
Date: Mon, 29 Apr 2024 15:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/17] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
 <6e068a2531f3ecbb7858739ecb5249d22ee01fff.1713347222.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6e068a2531f3ecbb7858739ecb5249d22ee01fff.1713347222.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2024 12:04, Oleksii Kurochko wrote:
> +/*
> + * This function doesn't exist, so you'll get a linker error
> + * if something tries to do an invalid xchg().
> + */
> +extern void __bad_xchg(volatile void *ptr, int size);
> +
> +static always_inline unsigned long __xchg(volatile void *ptr, unsigned long new, int size)
> +{
> +    unsigned long ret;
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        ret = emulate_xchg_1_2((volatile uint8_t *)ptr, new, ".aq", ".aqrl");
> +        break;
> +    case 2:
> +        ret = emulate_xchg_1_2((volatile uint16_t *)ptr, new, ".aq", ".aqrl");
> +        break;
> +    case 4:
> +        _amoswap_generic((volatile uint32_t *)ptr, new, ret, ".w.aqrl");
> +        break;
> +#ifndef CONFIG_RISCV_32
> +    case 8:
> +        _amoswap_generic((volatile uint64_t *)ptr, new, ret, ".d.aqrl");
> +        break;
> +#endif
> +    default:
> +        __bad_xchg(ptr, size), ret = 0;
> +    }

I see no real reason to use a comma expression here, the more that "break"
needs adding anyway. I wonder why here you don't use ...

> +/* This function doesn't exist, so you'll get a linker error
> +   if something tries to do an invalid cmpxchg().  */
> +extern unsigned long __bad_cmpxchg(volatile void *ptr, int size);
> +
> +/*
> + * Atomic compare and exchange.  Compare OLD with MEM, if identical,
> + * store NEW in MEM.  Return the initial value in MEM.  Success is
> + * indicated by comparing RETURN with OLD.
> + */
> +static always_inline unsigned long __cmpxchg(volatile void *ptr,
> +                                             unsigned long old,
> +                                             unsigned long new,
> +                                             int size)
> +{
> +    unsigned long ret;
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        ret = emulate_cmpxchg_1_2((volatile uint8_t *)ptr, old, new,
> +                                  ".aq", ".aqrl");
> +        break;
> +    case 2:
> +        ret = emulate_cmpxchg_1_2((volatile uint16_t *)ptr, old, new,
> +                                   ".aq", ".aqrl");
> +        break;
> +    case 4:
> +        ret = _generic_cmpxchg((volatile uint32_t *)ptr, old, new,
> +                          ".w.aq", ".w.aqrl");
> +        break;
> +#ifndef CONFIG_32BIT
> +    case 8:
> +        ret = _generic_cmpxchg((volatile uint64_t *)ptr, old, new,
> +                           ".d.aq", ".d.aqrl");
> +        break;
> +#endif
> +    default:
> +        return __bad_cmpxchg(ptr, size);

... the approach used here.

Also (style nit) the comment on __bad_cmpxchg() is malformed, unlike that
ahead of __bad_xchg().

Jan

