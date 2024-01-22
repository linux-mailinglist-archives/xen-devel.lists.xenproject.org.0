Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714ED836C0C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 17:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670024.1042589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRxak-0002c6-6v; Mon, 22 Jan 2024 16:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670024.1042589; Mon, 22 Jan 2024 16:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRxak-0002aB-3Y; Mon, 22 Jan 2024 16:56:10 +0000
Received: by outflank-mailman (input) for mailman id 670024;
 Mon, 22 Jan 2024 16:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRxaj-0002a5-Bw
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 16:56:09 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21e8bfcc-b947-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 17:56:05 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cddf596321so35438681fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 08:56:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z15-20020a6bc90f000000b007bf05f618f3sm6643571iof.55.2024.01.22.08.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 08:56:04 -0800 (PST)
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
X-Inumbo-ID: 21e8bfcc-b947-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705942565; x=1706547365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRp/lGCqYXGJxDgbw21vw0U/btwbfb4OSgaAF8MF18A=;
        b=RHsYCEDs1WmR9wRKmf3tk4a0LTYB6NUREkArC3fauYKhxr8eyDyCibDLo7LdC+bLkX
         G2wTe9puR6Mkb0gddt5z8Z0K3xWT+FI5kStgMubJn6IEpkNNaIzzfXj5u95InXtLbNRh
         Bc9srzG+q92VAr3JnFceXKqhEc+hWjh+vpD8zejl6QRtqkGo+c/aaCKDy4PN9mb/LObx
         DCjAV7XbQ/1zl3Hy3qiq7TNh8xzIoSczRybO6mOIdg5PaBKtijnJtaSooEiDh6SyONMM
         gWY5IrfJKKgiHnadU+1O8N52dBJkixnTL/ew3HdK4OjWRq5KkkBltWV9ihtCAIqHAwEM
         Hqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705942565; x=1706547365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pRp/lGCqYXGJxDgbw21vw0U/btwbfb4OSgaAF8MF18A=;
        b=pOyzdzAaY5jr2oF2AptgK3n7godOWsh/BxXILzmlgDnmEqvFQHho/+uG9H8H4U5wiq
         jj0RpPGG5fenFbGvD1c/uN89+wdjDhBBM5hRgM8Rq7vcgqnNJ3OtoDCnX7Ot3TgRNRll
         k8M8JEdytXtB+TKrs6i7dWZLpdeVAVzr0rKkTZCBcEXGoFG9Q8hZjQL44k3r3MP0OgOX
         WJcwfB4xfmdDhyBYZUUTvnjxpjfRW3xK409/8vAGuMyaY/UQT6loThWAV0SGBBX/8/cn
         dlavOuTSxqLKB0Yt9Yo6+vqcHcjxmI2bKdpWsevPkT2R9PTa9BzwC6wqjaIegvGMIUD6
         5XVA==
X-Gm-Message-State: AOJu0YzB29sZSYyw5+nJJVpO/nrhpBGfcBABtIUos3GKngRKaqTwQSLR
	1bGPcvUpgjnhmPLyG5iGlaDaVn4KN8ulhgOp3r71l3TmdluSE2nNUuMVMiRi+A==
X-Google-Smtp-Source: AGHT+IGSliYbjVT1qB2AtyuC0L604r7g1UBHocATtNbWa0MOckoxkiRtPY8PUtyYqEucFMXSJaG9qA==
X-Received: by 2002:a2e:b70e:0:b0:2cd:7b5e:7358 with SMTP id j14-20020a2eb70e000000b002cd7b5e7358mr1856573ljo.25.1705942565348;
        Mon, 22 Jan 2024 08:56:05 -0800 (PST)
Message-ID: <2429395f-3ce8-4f17-aabe-78af2446ff6d@suse.com>
Date: Mon, 22 Jan 2024 17:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/34] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <54f5f13a4ee3de3c3cf4ba2b4d0347bb77bb7d08.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <54f5f13a4ee3de3c3cf4ba2b4d0347bb77bb7d08.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:12, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/atomic.h
> @@ -0,0 +1,384 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
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
> +#include <asm/fence.h>
> +#include <asm/io.h>
> +#include <asm/system.h>
> +
> +void __bad_atomic_size(void);
> +
> +static always_inline void read_atomic_size(const volatile void *p,
> +                                           void *res,
> +                                           unsigned int size)
> +{
> +    switch ( size )
> +    {
> +    case 1: *(uint8_t *)res = readb((const uint8_t *)p); break;
> +    case 2: *(uint16_t *)res = readw((const uint16_t *)p); break;
> +    case 4: *(uint32_t *)res = readl((const uint32_t *)p); break;
> +    case 8: *(uint32_t *)res  = readq((const uint64_t *)p); break;

Just like const, you should also avoid casting away volatile.

> +    default: __bad_atomic_size(); break;
> +    }
> +}
> +
> +#define read_atomic(p) ({                                               \
> +    union { typeof(*p) val; char c[0]; } x_;                            \
> +    read_atomic_size(p, x_.c, sizeof(*p));                              \
> +    x_.val;                                                             \
> +})
> +
> +

Nit: No double blank lines please.

> +#define write_atomic(p, x) ({                                           \
> +    typeof(*p) x__ = (x);                                               \
> +    switch ( sizeof(*p) )												\
> +    {                                             						\

These lines look excessively long, possibly as a result of leaving hard tabs
in place.

Overall some of the style comments on the earlier patch seem to apply here
as well.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/fence.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _ASM_RISCV_FENCE_H
> +#define _ASM_RISCV_FENCE_H
> +
> +#ifdef CONFIG_SMP
> +#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
> +#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
> +#else
> +#define RISCV_ACQUIRE_BARRIER
> +#define RISCV_RELEASE_BARRIER
> +#endif

Do you really care about the !SMP case? On x86 at least we stopped special-
casing that configuration many years ago (the few cases where for typically
build reasons it matters, using CONFIG_NR_CPUS is sufficient). If you care
about it, there needs to be somewhere you actually #define CONFIG_SMP.

Jan

