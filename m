Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307D4898A5D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 16:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700932.1094774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsONN-0002i9-IH; Thu, 04 Apr 2024 14:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700932.1094774; Thu, 04 Apr 2024 14:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsONN-0002fZ-F0; Thu, 04 Apr 2024 14:47:37 +0000
Received: by outflank-mailman (input) for mailman id 700932;
 Thu, 04 Apr 2024 14:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsONL-0002fT-Vp
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 14:47:36 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45a946ad-f292-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 16:47:34 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41629b9b85eso6546125e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 07:47:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 je6-20020a05600c1f8600b0041496734318sm2909565wmb.24.2024.04.04.07.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 07:47:33 -0700 (PDT)
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
X-Inumbo-ID: 45a946ad-f292-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712242054; x=1712846854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocnjGzbf4RlWMuT89XLMJ6yY1XlHfJksG1nVkIy6ric=;
        b=IxwB4dpWEWdNemScqJbquL8zT9fCOoz6xXetN2Y12sYc63TaZ84OM+FzTKIsCgx/4L
         rF/bCzVVDY6K2pTZ8zmgMnZidUaZqlMKZPsr5fSZ9kGVhz8Gsdx5X9rKF+E6ZWgI1aGB
         ZrDXZFigUF7052fY6HReD7CpBnyB7ohG68LTk8z8EBmZuQpHjl1pLixULvr74es+MyL6
         3XTO9ZKRx72zCBBY7ev2/eozb5KeoWQbZVAr7wG1ez/aihcCYANUy9NJ8K3bFL/dslgY
         0JJWv2izCDKB5TKXr2+Vsxq4BDxu7jCFY1RO1ybgGZHM/zH1gzNg0VxE3s/3BbruhsE2
         nwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712242054; x=1712846854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ocnjGzbf4RlWMuT89XLMJ6yY1XlHfJksG1nVkIy6ric=;
        b=VBcze5TOjF/W/DskYL80BZJ35KGwdsTY1brmfUKccakt2C1Vmj4o1U+M7H4nIviuJC
         jCdGh6Xy3LEFF8HOj7RUp8jbJBK0OQQ53OxQ3apRLnLUjlXNkzuqoEXnk0VLYxNAme4W
         iibq53URj4V5nj1uRa7PW2GgH2zu/q+Kj0+ajdjgsG7LclzZhSdOJj9cE4I8t7RFwE5z
         rs5u/p0RHoXLnFeoFncS5hmdgDUISXHENwaGvgAT4U12283ovV9kRnyu3OMmhoqfQiMh
         /iQxj4wg8A7FF+3yM6ZoEaUAQK2R9Ywa+TiRhQy6sWQont1YMduTjVGY+MCPI2rK+ikt
         scMA==
X-Forwarded-Encrypted: i=1; AJvYcCXT0jMqygPtFV2uEb2lu4pJzfojYI6g8mez/LIm3GiTgSm/9S6bq9tHbm6KGOfULA3s4NHpmg0VOqhuLe6bO4+x+7NvMaAO55rRNf4uZl4=
X-Gm-Message-State: AOJu0Yz82BmIUotefvpEg2EYJcNk7NQCif+MCet7QOI6VOOhu1zAQ2OM
	J2t1LnC+RnhvRo9lc355F4Ih5kJGz1nVfsRBdaVOkYb1zmQoziYHbTADgm/Vsw==
X-Google-Smtp-Source: AGHT+IGVI4HKpQf019bLxOWollgn9yV0MSOlhyowf/KrQ5TwfEmrY73NFNquFeuI3GKt9W8dnMTNBw==
X-Received: by 2002:a05:600c:3b08:b0:416:2b3c:2861 with SMTP id m8-20020a05600c3b0800b004162b3c2861mr1262812wms.30.1712242053862;
        Thu, 04 Apr 2024 07:47:33 -0700 (PDT)
Message-ID: <dd2a03f9-f72b-4947-8c7d-1c1345b4b31e@suse.com>
Date: Thu, 4 Apr 2024 16:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/19] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <3d8a46946a37ca499e962aa6504fa453326e5ad0.1712137031.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3d8a46946a37ca499e962aa6504fa453326e5ad0.1712137031.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 12:20, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bitops.h
> @@ -0,0 +1,146 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2012 Regents of the University of California */
> +
> +#ifndef _ASM_RISCV_BITOPS_H
> +#define _ASM_RISCV_BITOPS_H
> +
> +#include <asm/system.h>
> +
> +#undef BITOP_BITS_PER_WORD
> +#undef bitop_uint_t
> +
> +#define BITOP_BITS_PER_WORD BITS_PER_LONG
> +#define bitop_uint_t unsigned long
> +
> +#if BITS_PER_LONG == 64
> +#define __AMO(op)   "amo" #op ".d"
> +#elif BITS_PER_LONG == 32
> +#define __AMO(op)   "amo" #op ".w"
> +#else
> +#error "Unexpected BITS_PER_LONG"
> +#endif
> +
> +#define __set_bit(n, p)      set_bit(n, p)
> +#define __clear_bit(n, p)    clear_bit(n, p)

First without comment and then ...

> +/* Based on linux/arch/include/asm/bitops.h */
> +
> +/*
> + * Non-atomic bit manipulation.
> + *
> + * Implemented using atomics to be interrupt safe. Could alternatively
> + * implement with local interrupt masking.
> + */
> +#define __set_bit(n, p)      set_bit(n, p)
> +#define __clear_bit(n, p)    clear_bit(n, p)

... with one?

> +/* Based on linux/arch/include/asm/bitops.h */

Does this really need repeating?

> +#define test_and_op_bit_ord(op, mod, nr, addr, ord)     \
> +({                                                      \
> +    unsigned long res, mask;                            \

bitop_uint_t?

> +    mask = BITOP_MASK(nr);                              \
> +    asm volatile (                                       \

Nit: One too many padding blanks.

> +        __AMO(op) #ord " %0, %2, %1"                    \
> +        : "=r" (res), "+A" (addr[BITOP_WORD(nr)])       \
> +        : "r" (mod(mask))                               \
> +        : "memory");                                    \
> +    ((res & mask) != 0);                                \
> +})
> +
> +#define op_bit_ord(op, mod, nr, addr, ord)      \
> +    asm volatile (                              \
> +        __AMO(op) #ord " zero, %1, %0"          \
> +        : "+A" (addr[BITOP_WORD(nr)])           \
> +        : "r" (mod(BITOP_MASK(nr)))             \
> +        : "memory");
> +
> +#define test_and_op_bit(op, mod, nr, addr)    \
> +    test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
> +#define op_bit(op, mod, nr, addr) \
> +    op_bit_ord(op, mod, nr, addr, )
> +
> +/* Bitmask modifiers */
> +#define NOP(x)    (x)
> +#define NOT(x)    (~(x))
> +
> +/**
> + * test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
> + * @addr: Address to count from
> + */
> +static inline int test_and_set_bit(int nr, volatile void *p)

In patch 4 you switched to bool. Any reason you didn't here, too?

> +{
> +    volatile bitop_uint_t *addr = p;
> +
> +    return test_and_op_bit(or, NOP, nr, addr);
> +}
> +
> +/**
> + * test_and_clear_bit - Clear a bit and return its old value
> + * @nr: Bit to clear
> + * @addr: Address to count from
> + */
> +static inline int test_and_clear_bit(int nr, volatile void *p)
> +{
> +    volatile bitop_uint_t *addr = p;
> +
> +    return test_and_op_bit(and, NOT, nr, addr);
> +}
> +
> +/**
> + * set_bit - Atomically set a bit in memory
> + * @nr: the bit to set
> + * @addr: the address to start counting from
> + *
> + * Note that @nr may be almost arbitrarily large; this function is not
> + * restricted to acting on a single-word quantity.
> + */
> +static inline void set_bit(int nr, volatile void *p)
> +{
> +    volatile bitop_uint_t *addr = p;
> +
> +    op_bit(or, NOP, nr, addr);
> +}
> +
> +/**
> + * clear_bit - Clears a bit in memory
> + * @nr: Bit to clear
> + * @addr: Address to start counting from
> + */
> +static inline void clear_bit(int nr, volatile void *p)
> +{
> +    volatile bitop_uint_t *addr = p;
> +
> +    op_bit(and, NOT, nr, addr);
> +}
> +
> +/**
> + * test_and_change_bit - Toggle (change) a bit and return its old value
> + * @nr: Bit to change
> + * @addr: Address to count from
> + *
> + * This operation is atomic and cannot be reordered.
> + * It also implies a memory barrier.
> + */
> +static inline int test_and_change_bit(int nr, volatile unsigned long *addr)

unsigned long?

> +{
> +	return test_and_op_bit(xor, NOP, nr, addr);
> +}

Perhaps better to move up a little, next to the other test_and-s?

Also - nit: Hard tab used for indentation.

> +#undef test_and_op_bit
> +#undef __op_bit

This no longer has any effect in this shape.

Jan

