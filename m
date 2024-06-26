Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D246917B03
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 10:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748500.1156228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMO3x-0005pr-8z; Wed, 26 Jun 2024 08:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748500.1156228; Wed, 26 Jun 2024 08:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMO3x-0005ni-6N; Wed, 26 Jun 2024 08:31:33 +0000
Received: by outflank-mailman (input) for mailman id 748500;
 Wed, 26 Jun 2024 08:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMO3v-0005XU-Hr
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 08:31:31 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c738c41-3396-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 10:31:29 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso68418221fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 01:31:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb2f2690sm95018495ad.40.2024.06.26.01.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 01:31:28 -0700 (PDT)
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
X-Inumbo-ID: 7c738c41-3396-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719390689; x=1719995489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G7ekgQKX93qfJG/dFfwSl4UE5JEKUSRbD+bTgzlbsBc=;
        b=NzrY5q3IZufmj/rTEM4WKEuJL7wA1wUY0YR5kCYISt+HEvGM0HlFyjbGwuA9xH4lqO
         o6dpt24+jrcAKTVQuLAOvLSwb9MHNX6S6csAp5mHqCPH6cHBhhxT4KPrp6t0/Z4Cs27R
         15rwkqD627XRZF0eLAuL5PDz/GmegT0EluicFKek6IUcjrYUFTiZRaZUUUqnrd+JZqQG
         8wh+0rNulPqkYAgg8hLBlx96mA+yKZSmED00Ob8mroIELj+yrj08Q23RAsIJPyh9jMbH
         jYrQbkkM5epUjv2XcHlwVoNsuZftYK0XdGjsHTG1pNya+sMdVC2VdoTp3IAuwLBKeL65
         5tQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719390689; x=1719995489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7ekgQKX93qfJG/dFfwSl4UE5JEKUSRbD+bTgzlbsBc=;
        b=nyokOVEpFbMXu/Vaq7k0kN3AK4H4FeV9qwJELohhwlB8BQHaSUjAV8bNQo6Vv7b4MY
         OM2NyxpsGgAww1A6Wl6VSO3fX0yhC8Z90XHVUDC0dU9QFAHIoElPx/Y707jQSD+HsTrJ
         dUe3kyyV6qVYaifs31dTmcbplPZcwyLO1yo8KbfP/oFzdLEv63RKJCw2qx7T0pIYrehB
         pZRQQXE8F+/Wyh//PVpKzUDGA/AmMTI18eF/CAvvN5jW5WDrJYsr8itiMTaaAnbEVzNI
         sFvwbZZo7NgmUNAiAkkYrdiUOvhNx5kDe/ezqrU16DPFbbGj4SDudjtQfnuI4tLJaV9w
         4kTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3Khci19LZ/pUDIpW9p9P3kEoUto0QrCu+4amH37LuM1P2Er4QzAxwB1fQ7g3AXYQFrnON07Xdz7+7XHCu/mZfiecEKHINKqcOB0olzvY=
X-Gm-Message-State: AOJu0YxBuTjptXAuhod0XDG1gNUqRPU15NbEea2in/49j856M907LwZS
	1znQ+jXFMQz14wVuIFhwPVXhHjUxwWZ14qJW7DGKvl/FUSMD4/Kqp9N9HWk/uCBOk/ytElmDKxw
	=
X-Google-Smtp-Source: AGHT+IG+NO58TX9FjEtExCZlYdN0aA58F9fGy8HtEgYqL5MS8aVED1fzWmHGQ2zexRFksC6p3y+HDg==
X-Received: by 2002:a2e:98c4:0:b0:2ec:4df7:8cef with SMTP id 38308e7fff4ca-2ec5b2a00a3mr53317991fa.15.1719390689263;
        Wed, 26 Jun 2024 01:31:29 -0700 (PDT)
Message-ID: <bb103587-546d-4613-bcb8-df10f5d05388@suse.com>
Date: Wed, 26 Jun 2024 10:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 02/10] xen/riscv: introduce bitops.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <0e4441eee82b0545e59099e2f62e3a01fa198d08.1719319093.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0e4441eee82b0545e59099e2f62e3a01fa198d08.1719319093.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 15:51, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bitops.h
> @@ -0,0 +1,137 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2012 Regents of the University of California */
> +
> +#ifndef _ASM_RISCV_BITOPS_H
> +#define _ASM_RISCV_BITOPS_H
> +
> +#include <asm/system.h>
> +
> +#if BITOP_BITS_PER_WORD == 64
> +#define __AMO(op)   "amo" #op ".d"
> +#elif BITOP_BITS_PER_WORD == 32
> +#define __AMO(op)   "amo" #op ".w"
> +#else
> +#error "Unexpected BITOP_BITS_PER_WORD"
> +#endif
> +
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
> +
> +#define test_and_op_bit_ord(op, mod, nr, addr, ord)     \
> +({                                                      \
> +    bitop_uint_t res, mask;                             \
> +    mask = BITOP_MASK(nr);                              \
> +    asm volatile (                                      \
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

Since elsewhere you said we would use Zbb in bitops, I wanted to come back
on that: Up to here all we use is AMO.

And further down there's no asm() anymore. What were you referring to?

Jan

