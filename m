Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8458C63D9
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:38:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722108.1125979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7B5T-0006O4-Nm; Wed, 15 May 2024 09:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722108.1125979; Wed, 15 May 2024 09:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7B5T-0006LQ-Ke; Wed, 15 May 2024 09:38:15 +0000
Received: by outflank-mailman (input) for mailman id 722108;
 Wed, 15 May 2024 09:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7B5R-0006LE-Vd
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:38:13 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8f52c1d-129e-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:38:12 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5709cb80b03so1560115a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 02:38:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c2b8f7fsm8632048a12.66.2024.05.15.02.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 02:38:11 -0700 (PDT)
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
X-Inumbo-ID: d8f52c1d-129e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715765892; x=1716370692; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bbI9mjALL/Uem3MryWIJwbx0cofU2nEQgjy/50sozdc=;
        b=eZIOK1ltmRu89DDsfg61NkeNOpXSOQpgPGtBLimfwotaEkXU8povAl7vX5WEFAn/UT
         r5zfsot2Xzb5PxVQDxrQNc85NF88Mr2C/jMLpE+88dubuusLcC18o3rliI6R89XnDWTy
         chf66Z5C+kCkExDlwORsYLxKQv+kbRLrdNu8B3Q7K19Ajak1iPMITLnxUpC1goOu1SC8
         w9eOFipNQEpgoCbXIZ2IxoeRwgWntZCCdA6zYJXg9iuaCXhQYaUNM+POCWhsRd+Rt6eL
         LIX47TnLmQFlE6o3BkKkumZnuZMCGH1xKwy+lUVRDOHamzV6qk7fFE2wqGkjepWR9m6o
         Y+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715765892; x=1716370692;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbI9mjALL/Uem3MryWIJwbx0cofU2nEQgjy/50sozdc=;
        b=LIv+/w/NV3Phwau2ykeLtRLC7pRuRI6p3C7KCE+nJx65JvYQ+BRyaVOHknlYkkzboW
         pTyr6pl0GlV6DEKbItFf13ywxs60PpN1cHlEI53e6v7lXCD7Q2pwty5zn57p8gz36iVE
         AriUjA0ZvOI/u29cP/oLCipv+h8uPB9YszJpiMVS2HBCMjwV2uTFKVFUDzKU9jzoag0/
         /w+A/B/6gmmlUD2AVpXvIlze5sD6Q98ztbmvntxmLZLTrcMNcmjTEQvVCULXsWWkyfsL
         9kR/LTWlb+mUdSjKsKJQxaokOeaJ0RSKeInPAhrB4jDBbSVKzhedyHoq5bah9G2wDaCn
         kJ8w==
X-Forwarded-Encrypted: i=1; AJvYcCVZq+31rhgM6ZpOt/JdCJw6Zu9aeKhCbzlmtSNOK1stm3GE21FL41MbloYAu5xXVN8i0uI0rvmUUl28qu/Z4XpjNZEcTF3z4bf+jt74qX4=
X-Gm-Message-State: AOJu0YwzwbRGItsqTk+X1zKsBoghEs5o3/GZ0Gyl/X+rE028U9vRn/E5
	ddAGVyrJkaOYVvv9AsD49y3PGNcJ+GIJIFo9jKo5etdv1wR6KKQs7906K1e1lA==
X-Google-Smtp-Source: AGHT+IFyUN+R9hDd3Ajx0Wz0suMTh+HRvpPfDC4ugJ4DKT4m4Vnrm/laOZjxHHzTsaGAPNvUi2mWLw==
X-Received: by 2002:a50:8757:0:b0:56e:2294:e2e6 with SMTP id 4fb4d7f45d1cf-5734d67ae3dmr10688265a12.26.1715765892131;
        Wed, 15 May 2024 02:38:12 -0700 (PDT)
Message-ID: <fee5fee5-f501-4bad-8dac-934822457db8@suse.com>
Date: Wed, 15 May 2024 11:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/15] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
 <37eb9cd10cc10b84a3314039f6de6563aaabe793.1714988096.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <37eb9cd10cc10b84a3314039f6de6563aaabe793.1714988096.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2024 12:15, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> @@ -0,0 +1,239 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (C) 2014 Regents of the University of California */
> +
> +#ifndef _ASM_RISCV_CMPXCHG_H
> +#define _ASM_RISCV_CMPXCHG_H
> +
> +#include <xen/compiler.h>
> +#include <xen/lib.h>
> +
> +#include <asm/fence.h>
> +#include <asm/io.h>
> +#include <asm/system.h>
> +
> +#define _amoswap_generic(ptr, new, ret, sfx) \
> +    asm volatile ( \
> +        " amoswap" sfx " %0, %2, %1" \
> +        : "=r" (ret), "+A" (*(ptr)) \
> +        : "r" (new) \
> +        : "memory" );
> +
> +/*
> + * For LR and SC, the A extension requires that the address held in rs1 be
> + * naturally aligned to the size of the operand (i.e., eight-byte aligned
> + * for 64-bit words and four-byte aligned for 32-bit words).
> + * If the address is not naturally aligned, an address-misaligned exception
> + * or an access-fault exception will be generated.
> + *
> + * Thereby:
> + * - for 1-byte xchg access the containing word by clearing low two bits.
> + * - for 2-byte xchg access the containing word by clearing bit 1.
> + *
> + * If resulting 4-byte access is still misalgined, it will fault just as
> + * non-emulated 4-byte access would.
> + */
> +#define emulate_xchg_1_2(ptr, new, lr_sfx, sc_sfx) \
> +({ \
> +    uint32_t *aligned_ptr; \
> +    unsigned long alignment_mask = sizeof(*aligned_ptr) - sizeof(*(ptr)); \
> +    unsigned int new_val_bit = \
> +        ((unsigned long)(ptr) & alignment_mask) * BITS_PER_BYTE; \
> +    unsigned long mask = \
> +        GENMASK(((sizeof(*(ptr))) * BITS_PER_BYTE) - 1, 0) << new_val_bit; \
> +    unsigned int new_ = (new) << new_val_bit; \
> +    unsigned int old; \
> +    unsigned int scratch; \
> +    \
> +    aligned_ptr = (uint32_t *)((unsigned long)(ptr) & ~alignment_mask); \
> +    \
> +    asm volatile ( \
> +        "0: lr.w" lr_sfx " %[old], %[ptr_]\n" \
> +        "   andn  %[scratch], %[old], %[mask]\n" \
> +        "   or   %[scratch], %[scratch], %z[new_]\n" \
> +        "   sc.w" sc_sfx " %[scratch], %[scratch], %[ptr_]\n" \
> +        "   bnez %[scratch], 0b\n" \
> +        : [old] "=&r" (old), [scratch] "=&r" (scratch), \
> +          [ptr_] "+A" (*aligned_ptr) \
> +        : [new_] "rJ" (new_), [mask] "r" (mask) \
> +        : "memory" ); \
> +    \
> +    (__typeof__(*(ptr)))((old & mask) >> new_val_bit); \
> +})
> +
> +/*
> + * This function doesn't exist, so you'll get a linker error
> + * if something tries to do an invalid xchg().
> + */
> +extern unsigned long __bad_xchg(volatile void *ptr, int size);
> +
> +static always_inline unsigned long __xchg(volatile void *ptr, unsigned long new, int size)

Nit: Line too long.

I also find "int size" odd: This can't be negative, can it? Ought to
be "unsigned int" then. Same for __cmpxchg() then.

> +#define xchg(ptr, x) \
> +({ \
> +    __typeof__(*(ptr)) n_ = (x); \
> +    (__typeof__(*(ptr))) \
> +        __xchg((ptr), (unsigned long)n_, sizeof(*(ptr))); \

Nit: I'm pretty sure I mentioned before that the parentheses around
the first argument are unnecessary. Same for cmpxchg() then.

With these taken care of
Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -119,6 +119,8 @@
>  
>  #define BITS_PER_LLONG 64
>  
> +#define BITS_PER_BYTE 8
> +
>  /* xen_ulong_t is always 64 bits */
>  #define BITS_PER_XEN_ULONG 64

I'm in no way going to insist, but imo this would better be inserted
ahead of BYTES_PER_LONG.

Jan

