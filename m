Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8091082B24F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 17:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666420.1037045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNxTo-0003Np-Hh; Thu, 11 Jan 2024 16:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666420.1037045; Thu, 11 Jan 2024 16:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNxTo-0003Lb-F0; Thu, 11 Jan 2024 16:00:28 +0000
Received: by outflank-mailman (input) for mailman id 666420;
 Thu, 11 Jan 2024 16:00:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNxTn-0003LT-DN
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 16:00:27 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88086d4b-b09a-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 17:00:25 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e5f615a32so7586645e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 08:00:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c1d8200b0040e629cee7esm710630wms.35.2024.01.11.08.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 08:00:24 -0800 (PST)
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
X-Inumbo-ID: 88086d4b-b09a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704988824; x=1705593624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B/Z0ZrrZYGWgm5FHvBsUCapFzI25NOSRb1ViTJQDNVY=;
        b=RWqfYXofxkHrEe9qusidmxry6YXbPX8cQi2zG5XH4MguEbNyXLQqzeKODyYYWaUhZc
         dByxQ1nwt6vb5kqo4MtvbWQBJkr8YYLpI4inzOadaLC+xX8wMqmZpS7ttToBEYcvjrK/
         DGsLpNl4dJLOyKb9tO2uqWuX/AIqJe4dcbxRy5X6MRWC/kjXLFX5VHvx6AAfQ+8YQabS
         VrU3Q3jYQG6+WZvd1l7/1A+Sie+ztz0m6SDW65lTsm8ruzKmpPYPvp+vesyD8TfAmCHI
         UlW13qAZ9MpOXtkTWkOVPnMahyYJcLaymmwFzUDKTgAX1YvU3INoJY2jRvSID+ZuJfpi
         HjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704988824; x=1705593624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/Z0ZrrZYGWgm5FHvBsUCapFzI25NOSRb1ViTJQDNVY=;
        b=Y200o/Q+mxEsoO9PsHL4QRV57YumgFs+HMFwH+jlOhG62V8PH2rWA2Dj61da8cNDJq
         HqofruyTb/vBJ9K7KHb0k/11K0jsx+f7se5oROjkFBzXrgutePY67eI32z75jXU8G6Aw
         +QLoEjBG3n3L4NMNcBSMxbd5dimmGb6fs0HlRdRbHinXO2YvPl5ImPXslnZ57g7wXC31
         0ZcDeYZ7sMMfudX5mVj59d/ryliPWnrtJrXIr0rEys8sI4aVBmtR94K0KyheWTYI3yt7
         MHEMYkfxt0E54LXZzzsQf115DSHJTlShgfsVudGHJP53e7ovXGOaePzfV/oYEZ6maLMk
         cdRQ==
X-Gm-Message-State: AOJu0Yw+4J74NEsebanHV1QieAu18wkA7b5d68GzyvwWWRzXoL4cNoyb
	qlBJZ0JyuYoGsPqJALiAKqDkzsopHa7y
X-Google-Smtp-Source: AGHT+IEa6+7pm0ws0NE6RQola4X2im8mNjO0dRxl1I3xkbRIdmoopKysMmnbm6EBOwdwEriCKqX1Ow==
X-Received: by 2002:a05:600c:c12:b0:40e:6303:5fb3 with SMTP id fm18-20020a05600c0c1200b0040e63035fb3mr2122wmb.321.1704988824582;
        Thu, 11 Jan 2024 08:00:24 -0800 (PST)
Message-ID: <8ca3cc48-47d4-4200-b373-a92a732b59b8@suse.com>
Date: Thu, 11 Jan 2024 17:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/34] xen/riscv: introduce system.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <e577e055932d05ec34f01db57d1b2d2b1be5418d.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e577e055932d05ec34f01db57d1b2d2b1be5418d.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:12, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/system.h
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _ASM_RISCV_BARRIER_H
> +#define _ASM_RISCV_BARRIER_H

s/BARRIER/SYSTEM/ ?

With that taken care of (which I'd be happy to do while committing)
Acked-by: Jan Beulich <jbeulich@suse.com>

> +#include <xen/stdbool.h>
> +
> +#include <asm/csr.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +#define RISCV_FENCE(p, s) \
> +    __asm__ __volatile__ ( "fence " #p "," #s : : : "memory" )
> +
> +/* These barriers need to enforce ordering on both devices or memory. */
> +#define mb()                    RISCV_FENCE(iorw, iorw)
> +#define rmb()                   RISCV_FENCE(ir, ir)
> +#define wmb()                   RISCV_FENCE(ow, ow)
> +
> +/* These barriers do not need to enforce ordering on devices, just memory. */
> +#define smp_mb()                RISCV_FENCE(rw, rw)
> +#define smp_rmb()               RISCV_FENCE(r, r)
> +#define smp_wmb()               RISCV_FENCE(w, w)
> +#define smp_mb__before_atomic() smp_mb()
> +#define smp_mb__after_atomic()  smp_mb()
> +
> +/*
> +#define smp_store_release(p, v)         \
> +do {                                    \
> +    compiletime_assert_atomic_type(*p); \
> +    RISCV_FENCE(rw, w);                 \
> +    WRITE_ONCE(*p, v);                  \
> +} while (0)
> +
> +#define smp_load_acquire(p)             \
> +({                                      \
> +    typeof(*p) p1 = READ_ONCE(*p);      \
> +    compiletime_assert_atomic_type(*p); \
> +    RISCV_FENCE(r,rw);                  \
> +    p1;                                 \
> +})
> +*/
> +
> +static inline unsigned long local_save_flags(void)
> +{
> +    return csr_read(sstatus);
> +}
> +
> +static inline void local_irq_enable(void)
> +{
> +    csr_set(sstatus, SSTATUS_SIE);
> +}
> +
> +static inline void local_irq_disable(void)
> +{
> +    csr_clear(sstatus, SSTATUS_SIE);
> +}
> +
> +#define local_irq_save(x)                           \
> +({                                                  \
> +    x = csr_read_clear(CSR_SSTATUS, SSTATUS_SIE);   \
> +    local_irq_disable();                            \
> +})
> +
> +static inline void local_irq_restore(unsigned long flags)
> +{
> +	csr_set(CSR_SSTATUS, flags & SSTATUS_SIE);
> +}
> +
> +static inline bool local_irq_is_enabled(void)
> +{
> +    unsigned long flags = local_save_flags();
> +
> +    return (flags & SSTATUS_SIE) != 0;

Just as a remark - when the resulting type is bool, we generally
prefer to omit the "!= 0".

Jan

