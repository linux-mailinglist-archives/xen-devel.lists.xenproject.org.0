Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA1C88149A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696001.1086469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxtR-0004tE-N1; Wed, 20 Mar 2024 15:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696001.1086469; Wed, 20 Mar 2024 15:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxtR-0004rS-Jg; Wed, 20 Mar 2024 15:30:17 +0000
Received: by outflank-mailman (input) for mailman id 696001;
 Wed, 20 Mar 2024 15:30:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmxtQ-0004pR-33
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:30:16 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf974059-e6ce-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 16:30:14 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-568a53d2ce0so8646401a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:30:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g14-20020a170906198e00b00a46d049ff63sm2795901ejd.21.2024.03.20.08.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 08:30:14 -0700 (PDT)
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
X-Inumbo-ID: bf974059-e6ce-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710948614; x=1711553414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VApuDQqrgJvlwg9vBixJseS5JxGZrA4GOg7tCwIYp50=;
        b=N5vTfkdBEqO0/UmaQI43YE2msaKEgawKsBWBMmiynCgRSwB4k62WK6OBxQBGwHRcYG
         /xkR5BXg0lvPWW++UCcuSbeVbu+9sUAHISLt8iJLnERdlsHAXH9aBheT6ycmoqjaAGlp
         +sYkQ6j3LGv4xBmN4guDdK+uBYkkkwDADezKssDEJME+Qk6fO74EV/P5zkkC39FOuECH
         E8LxtslbDB4Ugs+whm4MmZTc3z0mXBH1OIAdjaoDtOtt5Mv8VOnRahXy60oU15yXtBbL
         x2kkLRAJUJ9P6iTaM0gt0dOSnEyy1O3VYyEjum1yQ3aWc0ZlrZwaNcP6PQStc3IO7wXt
         cCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710948614; x=1711553414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VApuDQqrgJvlwg9vBixJseS5JxGZrA4GOg7tCwIYp50=;
        b=XPM7UoDb1t7Ezlhjx6a6YxbVAfjPybmTPMJ0xPTt9qE13rdrmYbY8zhIqzZLxkWQHV
         WLnvTXus/9lWTIJ4NXDKPDJJnoafo7V2sF7K36cVnTJ4Z5L0i86lr1XXZs+4L9qnop4/
         yIy5cAFa+IQ8Z9SomU4ehSzkXxeTjBTs3B53YW+9IME4UbAndX0f0/7+5hmvp2cw+MsB
         98nBpO2CdPSgjjc1p+1Da450/NohtJ94FUxcrjEKZKHBl376C6rfCNmY66bNpIP+xR5O
         SH3KT1uHFW5pbpcxByYp+gmrMQO05HCj2VC7X21FMnM8SS5JODOR86sUeitUCpIVwjMJ
         zbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZoRWsaKXyyNJtBxxshTndiUqbWKZqCO/t74PY0HNo/S4QlH2CNj95kDneo3UqPXdWOQMU04zW6pGz1hpfZf8S7CsxOcN8ZHtivqlsboQ=
X-Gm-Message-State: AOJu0YxWmaje9Vu5uMhvKacDAVdndXEVVQL3Vd7B9QknZbxEav7rrG+d
	1C+iWDRRnLkR9Mhr5rxw1u6cvfDvLgzRR/nBoWpYd1GR7HiaXBvQkvtu14DOow==
X-Google-Smtp-Source: AGHT+IFAXmqkup65W+d2WEBHewlDJCDwRawBfEuFXa3BWXr+TKrRNA2v9pUYN9Rk03v+h0Gux4aq+g==
X-Received: by 2002:a17:906:34ca:b0:a46:1d4b:d81 with SMTP id h10-20020a17090634ca00b00a461d4b0d81mr11170474ejb.62.1710948614309;
        Wed, 20 Mar 2024 08:30:14 -0700 (PDT)
Message-ID: <bf7266c7-659b-4503-97b8-3458384ae299@suse.com>
Date: Wed, 20 Mar 2024 16:30:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/20] xen/asm-generic: introduce generic non-atomic
 test_*bit()
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <48b7dfafccc7a0ed814b5dfb0f109a0473a1b4b4.1710517542.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <48b7dfafccc7a0ed814b5dfb0f109a0473a1b4b4.1710517542.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 19:06, Oleksii Kurochko wrote:
> The patch introduces the following generic functions:
> * test_bit
> * generic___test_and_set_bit
> * generic___test_and_clear_bit
> * generic___test_and_change_bit
> 
> Also, the patch introduces the following generics which are
> used by the functions mentioned above:
> * BITOP_BITS_PER_WORD
> * BITOP_MASK
> * BITOP_WORD
> * BITOP_TYPE
> 
> These functions and macros can be useful for architectures
> that don't have corresponding arch-specific instructions.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

First of all: How much syncing has there been versus Andrew's plans?
I don't want to end up in the middle of two entirely different
approaches to the same generalization goal.

> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/bitops-bits.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_BITS_H_
> +#define _ASM_GENERIC_BITOPS_BITS_H_
> +
> +#ifndef BITOP_BITS_PER_WORD
> +#define BITOP_BITS_PER_WORD     32
> +#endif
> +
> +#ifndef BITOP_MASK
> +#define BITOP_MASK(nr)          (1U << ((nr) % BITOP_BITS_PER_WORD))
> +#endif
> +
> +#ifndef BITOP_WORD
> +#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
> +#endif
> +
> +#ifndef BITOP_TYPE
> +typedef uint32_t bitops_uint_t;
> +#endif

Is it of practical use to permit overriding of one of BITOP_TYPE and
BITOP_BITS_PER_WORD? I think both want tying together.

Is it further of any use to allow overriding of BITOP_{MASK,WORD}?
There's minimal generalization needed to allow an override of
BITOP_TYPE, though:

#define BITOP_MASK(nr)          ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))

Note that I've omitted the 's' from the typedef name - the macros
all having no 'S', imo the type also shouldn't (or the other way
around).

> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/generic-non-atomic.h
> @@ -0,0 +1,89 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * The file is based on Linux ( 6.4.0 ) header:
> + *   include/asm-generic/bitops/generic-non-atomic.h
> + * 
> + * Only functions that can be reused in Xen were left; others were removed.
> + * 
> + * Also, the following changes were done:
> + *  - it was updated the message inside #ifndef ... #endif.
> + *  - __always_inline -> always_inline to be align with definition in
> + *    xen/compiler.h.
> + *  - update function prototypes from
> + *    generic___test_and_*(unsigned long nr nr, volatile unsigned long *addr) to
> + *    generic___test_and_*(unsigned long nr, volatile void *addr) to be

What's the point of having a whopping 3 successive inner underscores?
Which btw ...

> + *    consistent with other related macros/defines.
> + *  - convert identations from tabs to spaces.
> + *  - inside generic__test_and_* use 'bitops_uint_t' instead of 'unsigned long'
> + *    to be generic.

... shrink to just 2 here.

Oh, and there's no generic__test_bit(), but just test_bit() in a separate
header.

> + */
> +
> +#ifndef __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H
> +#define __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H
> +
> +#include <xen/compiler.h>
> +
> +#include <asm-generic/bitops/bitops-bits.h>
> +
> +#ifndef XEN_BITOPS_H
> +#error only <xen/bitops.h> can be included directly
> +#endif
> +
> +/*
> + * Generic definitions for bit operations, should not be used in regular code
> + * directly.
> + */
> +
> +/**
> + * generic___test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */
> +static always_inline bool
> +generic___test_and_set_bit(unsigned long nr, volatile void *addr)
> +{
> +    bitops_uint_t mask = BITOP_MASK(nr);
> +    bitops_uint_t *p = ((bitops_uint_t *)addr) + BITOP_WORD(nr);

If you cast away the volatile here, what's the point of having it in
the parameter declaration? Also such a cast doesn't need an outer
pair of parentheses.

> +    bitops_uint_t old = *p;
> +
> +    *p = old | mask;
> +    return (old & mask) != 0;

Minor: The function returning bool, the "!= 0" (and then also the
parentheses) could be omitted.

> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/test-bit.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_TESTBIT_H_
> +#define _ASM_GENERIC_BITOPS_TESTBIT_H_
> +
> +#include <asm-generic/bitops/bitops-bits.h>
> +
> +/**
> + * test_bit - Determine whether a bit is set
> + * @nr: bit number to test
> + * @addr: Address to start counting from
> + */
> +static inline int test_bit(int nr, const volatile void *addr)
> +{
> +    const volatile bitops_uint_t *p = addr;
> +    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
> +}

Interestingly you don't lose the volatile here. Overall the way this
is written would likely benefit the other functions too. There's no
cast needed here and thus also not there.

Jan

