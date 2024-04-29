Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA98B5A68
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 15:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714092.1115100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1RKO-0008Kd-MF; Mon, 29 Apr 2024 13:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714092.1115100; Mon, 29 Apr 2024 13:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1RKO-0008J7-I4; Mon, 29 Apr 2024 13:45:56 +0000
Received: by outflank-mailman (input) for mailman id 714092;
 Mon, 29 Apr 2024 13:45:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1RKN-0008Iu-0v
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 13:45:55 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca492b50-062e-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 15:45:50 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2e0933d3b5fso9578271fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 06:45:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b004186f979543sm45733733wms.33.2024.04.29.06.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 06:45:49 -0700 (PDT)
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
X-Inumbo-ID: ca492b50-062e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714398350; x=1715003150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=npgRm/il250DGBtQl0/foIbFoH+2f7sUn/Rdpdevxc0=;
        b=YUva6QljurBg3udIUiG/leVmmRzBeWiWRE9a9qasid4/xEpozk2lWkdGUa2flcq8Wj
         1KVBUewLiCE0TZ4la0YieJdKr4KzKa/VMjjTvtSRUZUsRyif/eVGIxGUM3bGMHwtCGTd
         7xDjI4baNHPP0dpXdmZK8VxQFIKVKcqSBjWFWy/w4uLNcmDDMFr8gwartNt0e/p3NYhL
         yZ/y+PUY9/1R1snyo/I1L9tbV4fgtYYOoZk4jC/ap0kqiuHiwLvsEYcQw3cBViJN44Y6
         9lS9zeJJynxxpN4BSCzwrg5oVOQwpyJYeDxJ+W891IHmMDc2H5Un4oBAyxKuyGiWfse0
         OtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714398350; x=1715003150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=npgRm/il250DGBtQl0/foIbFoH+2f7sUn/Rdpdevxc0=;
        b=k9Lz+vwhT+NrzvyBnngS2lFqhosTPBKOq/1GOKEZ4sq1FoLGTmPwgKmtxswcR/49zv
         +Xho9uW32fS5tZ/RYPKS+1QaB08KRuPpQgjrTc5EbISXBdcowMCS4oWdf4oUT6Y4Edki
         rNuX2/OHU8qP76GvtXpPM0wX+EGkvrjGKiaLDslZAUunkUICMpr5dcQ4+RxKTwMdWMxW
         vBNa9QOMo/uqBxe8cok0OEfq0qYqjWkXmrdi54uDhxHbIxqoMWhPn9dIXRv/Ea4rj36V
         0C3rhXZsEPA9jvTErZpn4ITzSi7kAQmkb8VNpvj6ulnos0QYY5UMvA4RUTSGOvVVu+ar
         RIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmq7aBvUmTMxlCqTu4LUx8ZAUGhTGJvALsZeLxidMC1YxVIGlEkaIJSjE97M2m6poch8aHjx8QfUQi6wJoqT1lpdzkUdMz7CgisQHNgg4=
X-Gm-Message-State: AOJu0Yzu5c+5pbJNcv6lRAiLlDpPRijEh+S399KB0nt7Ki9qiqSMscq9
	zowLul7X9xo2mkpGiApwFSXlNu9tOzf/+xH+5oMty8+A7N+H+ZNHVjQT1fx06g==
X-Google-Smtp-Source: AGHT+IETS/ryuTlwFgkOSzY9pVpqqfGOYOkl/LWRYpfxYn/va+AVfFBV+s/9LNxJgtd+g7jDjOvvYQ==
X-Received: by 2002:a05:651c:b95:b0:2dd:93a9:123f with SMTP id bg21-20020a05651c0b9500b002dd93a9123fmr6115026ljb.15.1714398349865;
        Mon, 29 Apr 2024 06:45:49 -0700 (PDT)
Message-ID: <d40ec2a0-fb14-48f1-804b-9ef18f35b7d5@suse.com>
Date: Mon, 29 Apr 2024 15:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/17] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
 <4967a5fcbef0901ef34d8954a48ded369b1ea2b1.1713347222.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4967a5fcbef0901ef34d8954a48ded369b1ea2b1.1713347222.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2024 12:04, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/atomic.h
> @@ -0,0 +1,281 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Taken and modified from Linux.
> + *
> + * The following changes were done:
> + * - * atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n) were updated
> + *     to use__*xchg_generic()
> + * - drop casts in write_atomic() as they are unnecessary
> + * - drop introduction of WRITE_ONCE() and READ_ONCE().
> + *   Xen provides ACCESS_ONCE()
> + * - remove zero-length array access in read_atomic()
> + * - drop defines similar to pattern
> + *   #define atomic_add_return_relaxed   atomic_add_return_relaxed
> + * - move not RISC-V specific functions to asm-generic/atomics-ops.h
> + * 
> + * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + * Copyright (C) 2024 Vates SAS
> + */
> +
> +#ifndef _ASM_RISCV_ATOMIC_H
> +#define _ASM_RISCV_ATOMIC_H
> +
> +#include <xen/atomic.h>
> +
> +#include <asm/cmpxchg.h>
> +#include <asm/fence.h>
> +#include <asm/io.h>
> +#include <asm/system.h>
> +
> +void __bad_atomic_size(void);
> +
> +/*
> + * Legacy from Linux kernel. For some reason they wanted to have ordered
> + * read/write access. Thereby read* is used instead of read*_cpu()
> + */
> +static always_inline void read_atomic_size(const volatile void *p,
> +                                           void *res,
> +                                           unsigned int size)
> +{
> +    switch ( size )
> +    {
> +    case 1: *(uint8_t *)res = readb(p); break;
> +    case 2: *(uint16_t *)res = readw(p); break;
> +    case 4: *(uint32_t *)res = readl(p); break;
> +#ifndef CONFIG_RISCV_32
> +    case 8: *(uint32_t *)res = readq(p); break;
> +#endif
> +    default: __bad_atomic_size(); break;
> +    }
> +}
> +
> +#define read_atomic(p) ({                                   \
> +    union { typeof(*(p)) val; char c[sizeof(*(p))]; } x_;   \
> +    read_atomic_size(p, x_.c, sizeof(*(p)));                \
> +    x_.val;                                                 \
> +})
> +
> +static always_inline void _write_atomic(volatile void *p,
> +                                       unsigned long x, unsigned int size)
> +{
> +    switch ( size )
> +    {
> +    case 1: writeb(x, p); break;
> +    case 2: writew(x, p); break;
> +    case 4: writel(x, p); break;
> +#ifndef CONFIG_RISCV_32
> +    case 8: writeq(x, p); break;
> +#endif
> +    default: __bad_atomic_size(); break;
> +    }
> +}
> +
> +#define write_atomic(p, x)                              \
> +({                                                      \
> +    typeof(*(p)) x_ = (x);                              \
> +    _write_atomic((p), x_, sizeof(*(p)));               \

Nit: There are still excess parentheses here.

> +    x_;                                                 \

Why is this? The macro isn't supposed to "return" a value, is it?

> +})
> +
> +static always_inline void _add_sized(volatile void *p,
> +                                     unsigned long x, unsigned int size)
> +{
> +    switch ( size )
> +    {
> +    case 1:
> +    {
> +        volatile uint8_t *ptr = (volatile uint8_t *)p;

Here and below: Why the casts?

Jan

