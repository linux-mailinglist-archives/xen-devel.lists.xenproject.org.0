Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917DB808CC6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 16:58:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650022.1015227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBGl0-0004AA-Kp; Thu, 07 Dec 2023 15:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650022.1015227; Thu, 07 Dec 2023 15:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBGl0-000482-Hi; Thu, 07 Dec 2023 15:57:46 +0000
Received: by outflank-mailman (input) for mailman id 650022;
 Thu, 07 Dec 2023 15:57:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBGky-00046Q-RV
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 15:57:44 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a85e43a-9519-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 16:57:42 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40b27726369so12330765e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 07:57:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020a5d5552000000b003332faefd86sm1774234wrw.0.2023.12.07.07.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 07:57:41 -0800 (PST)
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
X-Inumbo-ID: 5a85e43a-9519-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701964661; x=1702569461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/YOZzONOa1915WtEAK5MR1LS6lwGZuhG727bdz++o/w=;
        b=PLf1l1WcNRLMlQyHoe+ehWYliVnYAyDR8GQRl3oHIieonW+cqHfhD8N8o7KSY/rVJY
         xH8f6hJOAFYT8DAOqVUpgZ6CLEKEFj9J0sNZenNNxkFEGdk9mOQbYt5A+GbCzW0/SCcj
         OTDA7JdNmWMfFCZl8vVxahnv73smyW8VmadbrmsPhag0sKEXXX1xmXxEaAhUXzLHZVlM
         bI1JsgtUi3ynDwD25D95Rbmo4/nHYJ/8gsffUEq+7MWwhtZI44sDod3Swx7ELZ5J1nH7
         xioQmshCLGIo+XHl84IdeQENgSDqtDl9untwJcB13YWJCJNAOD65qaEHNs+GkRKcgyQt
         ySqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701964661; x=1702569461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YOZzONOa1915WtEAK5MR1LS6lwGZuhG727bdz++o/w=;
        b=fZeMPI1a/MZLMzs6MsdE/7YIHU8ojmu/wCYCrszgaMeEuRB52ddb8U2dOD61PUXlRE
         Zm/sM9sC+kTwiPVP5R0aQcfDIFNqkUhQAFJfT+Z8Sk+kCGYWR9CbaNbBpOfsZXLJ7FoX
         l4OdQ5r8XSo6KLrPZjOoX5GLkBBeC5x8sHSxqwOTVvWJsX60lALLZjo65Otp6mSuYKRg
         0cFFwUNhaVePhgjvM8aJaHNM8Xcq2GoVdUkBwMdhB8rnx+9HFfhM1oU/j22fPOltAaLr
         bH09ttXcx1Mc1u6cN/TFX271Zkr+cab/gpKl1fFYAVqwiKjgAVW6/Fomvmcr8uqBMbmr
         H+xQ==
X-Gm-Message-State: AOJu0YxJnlVj4nPs4ov7ap+Mlz9Z04ixnPxwPbwOV7GHg64LjiDMQTwC
	hTa0wy9wvc70MquLgXba5Zzp
X-Google-Smtp-Source: AGHT+IGfu4ooyHEB9GA6OZ7f8YOkI32RQgqCvMdta3vi2GONiw3pns2d1WQfudtdpjRJGflwoE6F3A==
X-Received: by 2002:a05:600c:4444:b0:40b:5464:b241 with SMTP id v4-20020a05600c444400b0040b5464b241mr1578704wmn.4.1701964661682;
        Thu, 07 Dec 2023 07:57:41 -0800 (PST)
Message-ID: <c2f65a29-5e8e-4d18-be26-0d07edcd0bf2@suse.com>
Date: Thu, 7 Dec 2023 16:57:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/39] xen/riscv: introduce asm/atomic.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <e9ead40abe380cf768a2a0150dc4c9e479a75307.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e9ead40abe380cf768a2a0150dc4c9e479a75307.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> From: Bobby Eshleman <bobbyeshleman@gmail.com>
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  - Change an author of commit. I got this header from Bobby's old repo.

Not sure how to deal with that when there's not also an S-o-b.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/atomic.h
> @@ -0,0 +1,375 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Taken and modified from Linux.
> + * 
> + * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + * Copyright (C) 2021 Vates SAS
> + */
> +
> +#ifndef _ASM_RISCV_ATOMIC_H
> +#define _ASM_RISCV_ATOMIC_H
> +
> +#include <xen/atomic.h>
> +#include <asm/cmpxchg.h>

This and ...

> +#include <asm/fence.h>
> +#include <asm/io.h>

.. this header are only introduced later. Bad ordering of the series?

> +#include <asm/system.h>
> +
> +void __bad_atomic_size(void);
> +
> +static always_inline void read_atomic_size(const volatile void *p,
> +                                           void *res,
> +                                           unsigned int size)
> +{
> +    switch ( size ) {

Nit (style): Brace on its own line (again further down).

> +    case 1: *(uint8_t *)res = readb((uint8_t *)p); break;
> +    case 2: *(uint16_t *)res = readw((uint16_t *)p); break;
> +    case 4: *(uint32_t *)res = readl((uint32_t *)p); break;
> +    case 8: *(uint32_t *)res  = readq((uint64_t *)p); break;

Please don't cast away const-ness.

> +    default: __bad_atomic_size(); break;
> +    }
> +}
> +
> +#define read_atomic(p) ({                                               \
> +    union { typeof(*p) val; char c[0]; } x_;                            \

Hmm, you avoid leading underscores here, but then ...

> +    read_atomic_size(p, x_.c, sizeof(*p));                              \
> +    x_.val;                                                             \
> +})
> +
> +
> +#define write_atomic(p, x) ({                                           \
> +    typeof(*p) __x = (x);                                               \

... they're still there here.

> +    switch ( sizeof(*p) ) {                                             \
> +    case 1: writeb((uint8_t)__x,  (uint8_t *)  p); break;              \
> +    case 2: writew((uint16_t)__x, (uint16_t *) p); break;              \
> +    case 4: writel((uint32_t)__x, (uint32_t *) p); break;              \
> +    case 8: writeq((uint64_t)__x, (uint64_t *) p); break;              \
> +    default: __bad_atomic_size(); break;                                \
> +    }                                                                   \
> +    __x;                                                                \
> +})
> +
> +/* TODO: Fix this */
> +#define add_sized(p, x) ({                                              \
> +    typeof(*(p)) __x = (x);                                             \
> +    switch ( sizeof(*(p)) )                                             \
> +    {                                                                   \
> +    case 1: writeb(read_atomic(p) + __x, (uint8_t *)(p)); break;        \
> +    case 2: writew(read_atomic(p) + __x, (uint16_t *)(p)); break;       \
> +    case 4: writel(read_atomic(p) + __x, (uint32_t *)(p)); break;       \

Instead of this, considering the comment perhaps better just BUG()?

> +    default: __bad_atomic_size(); break;                                \
> +    }                                                                   \
> +})
> +
> +/*
> + *  __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leaving
> + *               non-scalar types unchanged.
> + *
> + * Prefer C11 _Generic for better compile-times and simpler code. Note: 'char'
> + * is not type-compatible with 'signed char', and we define a separate case.
> + */
> +#define __scalar_type_to_expr_cases(type)               \
> +    unsigned type:  (unsigned type)0,                   \
> +    signed type:    (signed type)0
> +
> +#define __unqual_scalar_typeof(x) typeof(               \
> +    _Generic((x),                                       \

I think you still owe us an update to ./README, clarifying what compiler versions
may be used for building RISC-V. Unless of course all that exist support _Generic
(which then would be nice to say in the description).

> +        char:  (char)0,                                 \
> +        __scalar_type_to_expr_cases(char),              \
> +        __scalar_type_to_expr_cases(short),             \
> +        __scalar_type_to_expr_cases(int),               \
> +        __scalar_type_to_expr_cases(long),              \
> +        __scalar_type_to_expr_cases(long long),         \
> +        default: (x)))
> +
> +#define READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
> +#define WRITE_ONCE(x, val)                                      \
> +    do {                                                        \
> +            *(volatile typeof(x) *)&(x) = (val);                \

Nit (style): Too deep indentation.

> +    } while (0)
> +
> +#define __atomic_acquire_fence()					\
> +	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")

Suddenly using tab indentation here and below? And missing blanks again.

Jan

