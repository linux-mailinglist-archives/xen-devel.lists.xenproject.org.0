Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18240881525
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 17:04:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696021.1086523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmyPW-0005lm-6r; Wed, 20 Mar 2024 16:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696021.1086523; Wed, 20 Mar 2024 16:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmyPW-0005jY-2x; Wed, 20 Mar 2024 16:03:26 +0000
Received: by outflank-mailman (input) for mailman id 696021;
 Wed, 20 Mar 2024 16:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmyPU-0005jS-7L
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 16:03:24 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 602120b0-e6d3-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 17:03:22 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a4644bde1d4so909826166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 09:03:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ci20-20020a170906c35400b00a46e92e583bsm1618788ejb.149.2024.03.20.09.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 09:03:21 -0700 (PDT)
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
X-Inumbo-ID: 602120b0-e6d3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710950601; x=1711555401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMvK7/6i67x0qkuVoW3pX3tce7WnIPgWNejXMRkH5FU=;
        b=DlS6SkAFK4mGgTr3dNbRpAIAx5xFAyKAxirdM3PO7+gj/fv57C3Da9bEowg7+sOkqy
         DClwvI/x5nltFV/nbtw6Jp1fTiu6W94MSCfRR9MmLYFJeVL8ubcG5atJ+mhwZe7Tn2uD
         5jPHIr9Jh3WQuR4apQqeAolDeObE3pQ9K6DZoxyyqDAhCppGYjA2+8Hj2HmSdB/AGkBz
         sX6yS73w2p537cAwefCBpsyP6qCDaLn2jDCRf6jLExA4ioSPmAHdMqjgUbnaephENeZB
         OHTMvuxf7MwRagUy+FVXakS9/lr317sAxmLC2QCKpVllymB+qgtUNo82ILnakDWZZ1S5
         dBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710950601; x=1711555401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMvK7/6i67x0qkuVoW3pX3tce7WnIPgWNejXMRkH5FU=;
        b=K2ZvEKR5pEqcc9uAkZhBTVJNyP6xQC0DhuhmLevscVfIr40UlDaPqaHXYcUwa16Rc9
         Ev6kmxqvB5IKkbs1g2vRM0S5YEHan5WZB4Ln5aGBqzcff1qqZg1UtCl3MkFMk/emxjnI
         4ExoTfqJkZZeXYCDed+JQWOTZ26dTF1v1ylDOr+Y/T3HLsf986gBlJ3PjM80CWOUK8LI
         pvX/AzqG4mJ0X298sytLVX7hh2qK3ViqRsSET74JLty8GFCW4Zo3tjZufxK4ytW+Clyd
         piHOassKVppevuzwy6mW2WYHmqzRgOsFnE26k+beCx6Ta2kcS1Y0OrCmoDIqvHEH9iQ7
         1mEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa2COl0lUMj66/AURpUP/EGapO+Zox4BcB+ttTUleLOWJpWW4xOqjAypo+4q4S0/51jZzy/5nR56EWLV9ZTDiB4mbyywKg9mox5geLPyU=
X-Gm-Message-State: AOJu0YxKk1ewR63dxs7audx9x9OA8Ayq+1NFv9KmyQJngLXikNUtL4iq
	nZsFOfq++i81ErTdvl/d3amZJc+QEaWvWl7dWzQaIRGcSNrIdngx1yeLWpphRw==
X-Google-Smtp-Source: AGHT+IH6hfmAu3XclXRlBMeFca4507gglRkvQQc/eTLSJnCEyTGap3d51QYhQPQ8vx6NcIoAbXOolQ==
X-Received: by 2002:a17:906:aacb:b0:a46:2a47:6f4c with SMTP id kt11-20020a170906aacb00b00a462a476f4cmr1538623ejb.60.1710950601637;
        Wed, 20 Mar 2024 09:03:21 -0700 (PDT)
Message-ID: <9724aa80-106d-45ea-bad0-f0f2b83632eb@suse.com>
Date: Wed, 20 Mar 2024 17:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/20] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <14c91e2ba2aeb6e49f9f7e549232244719fa6959.1710517542.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <14c91e2ba2aeb6e49f9f7e549232244719fa6959.1710517542.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 19:06, Oleksii Kurochko wrote:
> Taken from Linux-6.4.0-rc1
> 
> Xen's bitops.h consists of several Linux's headers:
> * linux/arch/include/asm/bitops.h:
>   * The following function were removed as they aren't used in Xen:
>         * test_and_set_bit_lock
>         * clear_bit_unlock
>         * __clear_bit_unlock
>   * The following functions were renamed in the way how they are
>     used by common code:
>         * __test_and_set_bit
>         * __test_and_clear_bit
>   * The declaration and implementation of the following functios
>     were updated to make Xen build happy:
>         * clear_bit
>         * set_bit
>         * __test_and_clear_bit
>         * __test_and_set_bit
>   * linux/include/asm-generic/bitops/generic-non-atomic.h with the
>     following changes:
>      * Only functions that can be reused in Xen were left;
>        others were removed.
>      * it was updated the message inside #ifndef ... #endif.
>      * __always_inline -> always_inline to be align with definition in
>        xen/compiler.h.
>      * update function prototypes from
>        generic___test_and_*(unsigned long nr nr, volatile unsigned long *addr)
>        to
>        generic___test_and_*(unsigned long nr, volatile void *addr) to be
>        consistent with other related macros/defines.
>      * convert identations from tabs to spaces.
>      * inside generic__test_and_* use 'bitops_uint_t' instead of 'unsigned long'
>         to be generic.

This last middle level bullet point looks stale here here, with that header
now being introduced in a separate patch.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bitops.h
> @@ -0,0 +1,144 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2012 Regents of the University of California */
> +
> +#ifndef _ASM_RISCV_BITOPS_H
> +#define _ASM_RISCV_BITOPS_H
> +
> +#include <asm/system.h>
> +
> +#define BITOP_BITS_PER_WORD BITS_PER_LONG
> +
> +#define BITOP_TYPE
> +typedef uint64_t bitops_uint_t;
> +
> +#include <asm-generic/bitops/bitops-bits.h>
> +
> +#define __set_bit(n, p)      set_bit(n, p)
> +#define __clear_bit(n, p)    clear_bit(n, p)

If these cam with a TODO, I wouldn't say anything. But without I take it
they're meant to remain that way, at which point I'd like to ask about
the performance aspect: Surely the AMO insns are more expensive than
whatever more basic insns could be used instead? I'd even go as far as
wondering whether

#define __set_bit(n, p)      ((void)__test_and_set_bit(n, p))
#define __clear_bit(n, p)    ((void)__test_and_clear_bit(n, p))

wouldn't be cheaper (the compiler would recognize the unused result
and eliminate its calculation, I'm pretty sure).

> +/* Based on linux/arch/include/asm/bitops.h */
> +
> +#if BITS_PER_LONG == 64
> +#define __AMO(op)   "amo" #op ".d"
> +#elif BITS_PER_LONG == 32
> +#define __AMO(op)   "amo" #op ".w"

This isn't in line with bitops_uint_t above. With BITOP_BITS_PER_WORD 
also expanding to BITS_PER_LONG, I think you mean to use unsigned long
there. Or else you could move stuff into the conditional here (or
really move the conditional here further up).

However, if you look at Arm64 and x86 code, you will notice that they
avoid 64-bit operations here. I'm afraid I can't easily tell whether
the reason(s) for this have meanwhile disappeared; I fear some of that
is still around.

> +#else
> +#error "Unexpected BITS_PER_LONG"
> +#endif
> +
> +#define test_and_op_bit_ord(op, mod, nr, addr, ord)     \
> +({                                                      \
> +    unsigned long res, mask;                            \
> +    mask = BITOP_MASK(nr);                              \
> +    __asm__ __volatile__ (                              \
> +        __AMO(op) #ord " %0, %2, %1"                    \
> +        : "=r" (res), "+A" (addr[BITOP_WORD(nr)])       \
> +        : "r" (mod(mask))                               \
> +        : "memory");                                    \
> +    ((res & mask) != 0);                                \
> +})
> +
> +#define __op_bit_ord(op, mod, nr, addr, ord)    \
> +    __asm__ __volatile__ (                      \
> +        __AMO(op) #ord " zero, %1, %0"          \
> +        : "+A" (addr[BITOP_WORD(nr)])           \
> +        : "r" (mod(BITOP_MASK(nr)))             \
> +        : "memory");
> +
> +#define test_and_op_bit(op, mod, nr, addr)    \
> +    test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
> +#define __op_bit(op, mod, nr, addr) \
> +    __op_bit_ord(op, mod, nr, addr, )

Why are double underscores left on the non-test_and_ macros? Even
without name space considerations that looks odd here, when talk
is of the atomic forms of the operations, which by convention have
no (double) underscore at their front.

> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -113,6 +113,8 @@
>  # error "Unsupported RISCV variant"
>  #endif
>  
> +#define BITS_PER_BYTE 8
> +
>  #define BYTES_PER_LONG (1 << LONG_BYTEORDER)
>  #define BITS_PER_LONG  (BYTES_PER_LONG << 3)
>  #define POINTER_ALIGN  BYTES_PER_LONG

How's this addition related to the change at hand?

Jan

