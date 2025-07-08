Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D26AFCCD5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036603.1408861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8qU-0005GI-Ln; Tue, 08 Jul 2025 13:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036603.1408861; Tue, 08 Jul 2025 13:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8qU-0005El-Hn; Tue, 08 Jul 2025 13:58:54 +0000
Received: by outflank-mailman (input) for mailman id 1036603;
 Tue, 08 Jul 2025 13:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ8qT-0005Ed-M8
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:58:53 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae2aab62-5c03-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 15:58:52 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso34531565e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:58:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359d315sm11849561b3a.23.2025.07.08.06.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:58:51 -0700 (PDT)
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
X-Inumbo-ID: ae2aab62-5c03-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751983132; x=1752587932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f/CQhPmoXpmsT9AYNUbjaB5qv7IEjZWzbI7mY86U3pg=;
        b=ccSYAfmn2C9tC20yhSI079LkijnW+rl4fvvdrTqnlVdEy3nhKbxaEWRZ2LYzS6Z5x2
         RzOODWoKi+uVv+x5iA39/0REkWCyP/8Chm2cDIj8U9yGuID6FHy9ZoK+2UbTwkf4VrrB
         6cQitgGd9Nj8wBRMoCcINBP+3ZxODbf1bJoRuXHMuI64wxtiQCGQDDAGAbE2vVRPZwH0
         STDhi5dK1bDIzLzA7zQXhoNwV+LxatDPMs3G+txAUuFQ9qgEtOlWCQnFbt9fOwFtGFsm
         Fls3SsPJEO6eahEmlr70+tzkT+iZOskgZvA14PihLYtxCGrZvhNh5eDV7OuvaqCF4oJN
         z7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751983132; x=1752587932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/CQhPmoXpmsT9AYNUbjaB5qv7IEjZWzbI7mY86U3pg=;
        b=g9gMlOhVNnQIunGQu7Vrr2/H5f0mlAv/FVIb5d6r8qOizi+EixmqFL+SYQ/sAulS/Z
         BFdlpVPmvhkliy8vLEw8qkJSp/wIHnboH4/OHw2JozskLoJshj230RyRqk2d8k59AlJ6
         2xs/WBBdT0bsZyxy8BJGGXCxp1q8a7Kio1iOKgSOOE9eFPhkX2LYSJfECHkfEgMZE1uy
         TnnH6prfvSJRl9ooAqxtTwa6vRF+Ulf73EUbNsj4sIwABwXrtC5s7dxsYBPqfu200pZv
         0PwDNpvyW4uxEIXv06oazAZHUsT++ba8vXP9vTcnWt6as+te/WDPpHlPquw+gP/0gI5v
         EhGA==
X-Forwarded-Encrypted: i=1; AJvYcCUBSNfAJPkS+1yD2y3dqBa6hb+pV3ZznBgDrC02AVd07LS8pvCZuAyDXTT/8G8/ICuIbmYAp2GR7/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/jgpd6Uh5vuysPNb4Mn0UsFkFIv0y9uTUo4kNfcUsmq9UAi6m
	DWc9sjnYQKAsa1kIYf7loCCZjEkRMdp0EmDwBy1tiIbFj6tzGW4/0vN3wznpOKSeQA==
X-Gm-Gg: ASbGnctee3aGMM5DYdffQ8wvqakTEWcL4lBNEuQULPhm8U4NWRaocjxkpQRgcQvWz9w
	xwVgT7u45pQZMFFRJUlqq2DpBRupPl5L4qPrwdC8n4I03Kqhok/s5l+dPJKHbWgK5DgXQ9wWv9b
	FLbui5bLvgi3Cjy6c6DkdHsUkKYXwaN48gCh8TgxkQEzyy1Td0FYGDo7JxBZhchwFY3/7LqYW4M
	4L6vU4JumVeP9LN6GjwfaG0qFYL7pp0Yqkhd+CFIWvZ55nVEBxQS8A8MH1nGcoDCpWER6NmVtMM
	w9wl4JEDthhP9zDdNHyVnXyTY/qcyypL2Vng0BNxYdavJpCHU7eC7ryFGStMCzNOKBmOuRAhXJA
	aWXD2QSzRxrQt4VbTGu2tJU7FCGfcMMj2N0dB7RoD8Am8eYg=
X-Google-Smtp-Source: AGHT+IGPIoeTvRjNEIBYRCy28zJpaHJ7q6dCk+pBbXxKJrNdceq/EMcSfLCy0THTykr/j69Ta021mw==
X-Received: by 2002:adf:9dcb:0:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3b5dde84890mr2110115f8f.7.1751983131927;
        Tue, 08 Jul 2025 06:58:51 -0700 (PDT)
Message-ID: <c49cf7bd-fbff-45b0-ab0a-ee8020d910f0@suse.com>
Date: Tue, 8 Jul 2025 15:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] xen/riscv: aplic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1751876912.git.oleksii.kurochko@gmail.com>
 <a15b1426f14bb8f7f6385db9c13e584b55e4c91a.1751876912.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a15b1426f14bb8f7f6385db9c13e584b55e4c91a.1751876912.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 11:01, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/aplic-priv.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/aplic-priv.h
> + *
> + * Private part of aplic.h header.
> + *
> + * RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) Microchip.
> + * Copyright (c) Vates.
> + */
> +
> +#ifndef ASM_RISCV_PRIV_APLIC_H
> +#define ASM_RISCV_PRIV_APLIC_H
> +
> +#include <xen/types.h>
> +
> +#include <asm/aplic.h>
> +#include <asm/imsic.h>

Why is the latter one needed here? Certainly not for ...

> +struct aplic_priv {
> +    /* Base physical address and size */
> +    paddr_t paddr_start;
> +    size_t  size;
> +
> +    /* Registers */
> +    volatile struct aplic_regs __iomem *regs;
> +
> +    /* IMSIC configuration */
> +    const struct imsic_config *imsic_cfg;

... this field decl (which itself serves as a forward decl of the struct
tag).

> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -9,19 +9,118 @@
>   * Copyright (c) 2024-2025 Vates
>   */
>  
> +#include <xen/device_tree.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/irq.h>
> +#include <xen/mm.h>
>  #include <xen/sections.h>
>  #include <xen/types.h>
> +#include <xen/vmap.h>
> +
> +#include "aplic-priv.h"
>  
>  #include <asm/device.h>
> +#include <asm/imsic.h>
>  #include <asm/intc.h>
> +#include <asm/riscv_encoding.h>
> +
> +#define APLIC_DEFAULT_PRIORITY  1
> +
> +static struct aplic_priv aplic;

Is this altered post-init? IOW can it be __ro_after_init? Or otherwise at
least __read_mostly?

With these two taken care of (one way or another):
Acked-by: Jan Beulich <jbeulich@suse.com>
If you clarify what is wanted / needed, I'm also happy to make adjustments
while committing.

Jan

