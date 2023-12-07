Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE84808B74
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 16:08:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649952.1015138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFy5-0000Df-W2; Thu, 07 Dec 2023 15:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649952.1015138; Thu, 07 Dec 2023 15:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFy5-0000Ao-SC; Thu, 07 Dec 2023 15:07:13 +0000
Received: by outflank-mailman (input) for mailman id 649952;
 Thu, 07 Dec 2023 15:07:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBFy4-00006c-7R
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 15:07:12 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b9f7abc-9512-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 16:07:10 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c2c65e6aaso5060765e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 07:07:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b0040b538047b4sm2271079wmq.3.2023.12.07.07.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 07:07:09 -0800 (PST)
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
X-Inumbo-ID: 4b9f7abc-9512-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701961630; x=1702566430; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iKTI/TFjXfgWUryG2bg7p8YcsAi9nj1/38/wFvw/Qxs=;
        b=diauUZgpD4oCWfnubtsCth4cFUEJig+mC9fsdvXKxcOOMqpciF8+fMMmJKmeME/woo
         dz/limB6MVc2eC8+GkYoth451Ua1bC5aLW0ZS0c912ZlW9+wXs/JZfU/FBfQnEHSht1n
         XknVgsfAa7mnCR7PLwTQzkwGj5X3/ROcvLnm7n5J3R69QpHGLKy62qbRE6FTB8xlRwJ2
         XnvKZWt6mczcEfcfNaFdLq8xOEAarsHdRcOfatdlq9z5KLj7K3eBCYHb/NASmgA9fSvG
         ZhvAu9o3JyEdbxEu69/KbHwatNXsVj+oMQMEkZc5d8DXr+XbgwVSatvSXMH986Z11fV4
         MQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701961630; x=1702566430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iKTI/TFjXfgWUryG2bg7p8YcsAi9nj1/38/wFvw/Qxs=;
        b=F8XJDNgpE8bcyvcZ2UYgI/LGYXJOOAGdkRdGOSPdQUd4xuTz1yCP4MeLAxu7M4PUci
         amK4XJyJigz5KiYeLve2VFK/VkiepMu6xKw+UUvWJkAMOHOpl80x/QPGluCZneY1PskW
         KmAr1ZGpPV1yMVcY5Wg0WkCdt3C4j5zco0w5FrHSYKnT6LyQp5G3CFSarUqrSRJvnMqN
         4MwycXDRg8YW790v1VOzadTLYW5PUq+50v9GZFxUNXlqfeGBLXeyMOnqkINXwhb8ZG7X
         1/NolvUMsYt3z6+r7NKzQrfMBKUHNzCSkHh5Hp3aav9m7cpyPf2IPAvwbDCpjSA9SiuT
         +yiQ==
X-Gm-Message-State: AOJu0YxpnGTuG9X30TrxB2dsbR7NwP9Wp1SvOP64S+I2M9J7YBgALMaY
	nPR0mJPfFqZnMy14inufLMD3
X-Google-Smtp-Source: AGHT+IEJ/E4R3HCZX+gy52Tr/VRRRRf2akFO4VGqiR5FZQh1Z1u7llyepPaycoYG5wxEVWSuuxvnSA==
X-Received: by 2002:a05:600c:1d8c:b0:40c:335:5544 with SMTP id p12-20020a05600c1d8c00b0040c03355544mr1583149wms.230.1701961630103;
        Thu, 07 Dec 2023 07:07:10 -0800 (PST)
Message-ID: <671d903b-8135-4b30-a197-36bffed180da@suse.com>
Date: Thu, 7 Dec 2023 16:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/39] xen/riscv: introduce asm/system.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <3007fb3d841dbaa078bb5b7af699c883356badca.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3007fb3d841dbaa078bb5b7af699c883356badca.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/system.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_RISCV_BARRIER_H
> +#define _ASM_RISCV_BARRIER_H
> +
> +#include <asm/csr.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +#define RISCV_FENCE(p, s) \
> +    __asm__ __volatile__ ("fence " #p "," #s : : : "memory")

Nit (style): Missing blanks immediately inside the parentheses.

> +/* These barriers need to enforce ordering on both devices or memory. */
> +#define mb()                    RISCV_FENCE(iorw,iorw)
> +#define rmb()                   RISCV_FENCE(ir,ir)
> +#define wmb()                   RISCV_FENCE(ow,ow)

Nit (style): Missing blanks after the commas (also again below).

> +/* These barriers do not need to enforce ordering on devices, just memory. */
> +#define smp_mb()                RISCV_FENCE(rw,rw)
> +#define smp_rmb()               RISCV_FENCE(r,r)
> +#define smp_wmb()               RISCV_FENCE(w,w)
> +#define smp_mb__before_atomic() smp_mb()
> +#define smp_mb__after_atomic()  smp_mb()
> +
> +/*
> +#define __smp_store_release(p, v)       \

Is there a need for the double underscores here? We try to not
introduce new instances of undue leading underscores, but there might
be e.g. a strong desire to stay in sync with, say, Linux.

> +do {                                    \
> +	compiletime_assert_atomic_type(*p); \
> +	RISCV_FENCE(rw,w);                  \
> +	WRITE_ONCE(*p, v);                  \

Nit: Can the trailing backslashes be aligned, please?

> +} while (0)
> +
> +#define __smp_load_acquire(p)           \
> +({                                      \
> +    typeof(*p) ___p1 = READ_ONCE(*p);   \

Hmm, yet more leading underscores, and here surely not needed.

> +    compiletime_assert_atomic_type(*p); \
> +    RISCV_FENCE(r,rw);                  \
> +    ___p1;                              \
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
> +static inline int local_irq_is_enabled(void)
> +{
> +    unsigned long flags = local_save_flags();
> +
> +    return flags & SSTATUS_SIE;

SSTATUS_SIE doesn't even happen to be 1, so I think you're better off
adding != 0, unless you would do as I think I had suggested before and
have the function return bool right away.

Jan

