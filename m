Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83828A847BA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 17:25:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945995.1344042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tmQ-0003dC-F6; Thu, 10 Apr 2025 15:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945995.1344042; Thu, 10 Apr 2025 15:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tmQ-0003ax-By; Thu, 10 Apr 2025 15:25:26 +0000
Received: by outflank-mailman (input) for mailman id 945995;
 Thu, 10 Apr 2025 15:25:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2tmP-0003ar-OG
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 15:25:25 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 060deba0-1620-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 17:25:24 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so524274f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 08:25:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893fdf6dsm5188373f8f.90.2025.04.10.08.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 08:25:23 -0700 (PDT)
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
X-Inumbo-ID: 060deba0-1620-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744298724; x=1744903524; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zxu3SVgIp9H96/Jfns/jSUY3Ym1A7Fnc2GgfUfxwAcY=;
        b=dOzsJ4CMKufbaAUM2F70zKwD22NEMMDechC5rNw7gqBCApw66l02UCWQaKA0XjERPd
         dhUh1jtXXGGcUcEJVV0140UQlONu4zaMSBv9SyO30i1JiIY+dPZYeLgs88b7YYYS2vKd
         iT2GBv5zYQa6GgHiIe+LvIJWyduDh4sYmhRMN3b7yBgduONytX6aLt2GAzvH9RQyZ12h
         AVcbKS+YCqwvfIFNyiCH8wiGqcokhTByZHIbmkDHlnMxSjgvCWpoimjmT2mIYjEsMpiT
         l/fHPU5kAoCJ5lhxm3cZUStchyMkqXlPMseQK5tnlijscDP2wSIzAcsOYcDp6VA3jaUM
         ioNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744298724; x=1744903524;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zxu3SVgIp9H96/Jfns/jSUY3Ym1A7Fnc2GgfUfxwAcY=;
        b=tJc8FmxiG64MtUz1V3sTebV7jQxEzhd97igvl9ZrKZBwFvEwthBbEMkVFLS14Vbfvi
         kCB/rlvXw9K9FYw2kbfLSP/XhaVt1o7Ip2VPfWfOAL5TDtsMW7ezpiwBv1eqnQopOiLq
         tcayIOQSHDRoElcvpRG0a2NsCqy5/f5sPfIfSS1qOf78/Rm4ruyLTSJfBlESfZjx2pjg
         QyyqFE0ztxLowF5T0JlR0rIZFk1xAahV9PtB2TQJ2gLBOKAq2Bf+L8W4aI9FIPXf6ah8
         5tbxUbXF3ZmZS4BZYB3qTdfcANEFwVWOt/HGRpW/smRdiVNc3sNTxaNFekuCZ1JYuC6l
         HkQA==
X-Forwarded-Encrypted: i=1; AJvYcCUv4LBqLk/ySOB2MeFh+hCr3Q8gP1H9uoLbS1ycKDhXDyZEypCl+6012yXMMnkH5UHRvuRst/tD2mQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzqs2VVgCUEKvXdn4PPJpsF0G2jd7b8ezO+Qe6JyIpoFugHJRRV
	5RrVOjqxkIB5wvVRlbh8iVL39kaWJO7y8kz9wDs0qtPpvh9gbBClih7F6Y2FLw==
X-Gm-Gg: ASbGncuQjO4kh7Hgg2UF2Chx7gaJBpNhKvK5fo+YdZmoAf23yQtZCBfl+8EaXuTOwPp
	hoVDs1Aqf38aZ8qt8SY7XNKGWyxJjf/hD11vbHuntlkK103LV+hzpnrhkyv/nsNN66VawHi0sQR
	ES0o+CXs1iL9Fg4lfD/hDva0mJ/8xRC5NkcaTOC33MIv1+6QujcJsSjctUzPtWXJ5Jz6Y2Pqv5l
	vSQUE7NcWlShysmSxxJ0/MNb6o7NWOM5tmlv2G/aDj8K/7m6SYBvGO3foILUHUrH0aKvNQQLqbC
	yVzcUEmoVCoK0+2lTn5ormqfgcfGiw32M7EZeadXBK2qlxBV17kPgexb07mY5jDMnL0Vn5GU3xD
	hQQcvVTC0KywwptO8GG89mtIlgoJUn7fTVtmd
X-Google-Smtp-Source: AGHT+IHDCTzJMaNYN6jB00mMzBvxY5wSFlZC/mlFC4YMtMw/ca1HQgiUwg6foJ9rhfTaL8x5yRqCMg==
X-Received: by 2002:a05:6000:2283:b0:39c:1257:feba with SMTP id ffacd0b85a97d-39d8f4f0fa3mr2273586f8f.58.1744298724042;
        Thu, 10 Apr 2025 08:25:24 -0700 (PDT)
Message-ID: <f9e118ff-85fb-4bde-b313-740b1ea7ae4f@suse.com>
Date: Thu, 10 Apr 2025 17:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/14] xen/riscv: introduce init_IRQ()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <dff8b0a4a83fbd2b84c3427093a63fcee8a7122f.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <dff8b0a4a83fbd2b84c3427093a63fcee8a7122f.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/irq.h
> +++ b/xen/arch/riscv/include/asm/irq.h
> @@ -3,6 +3,28 @@
>  #define ASM__RISCV__IRQ_H
>  
>  #include <xen/bug.h>
> +#include <xen/device_tree.h>
> +
> +#define NR_IRQS 1024
> +
> +/*
> + * TODO: Should IRQ_TYPE_* be moved to xen/irq.h and wrapped into
> + * #ifdef CONFIG_HAS_DEVICE_TREE?
> + */

Wouldn't that be more like asm-generic/dt-irq.h (or irq-dt.h)? The field where
these values are stored is an arch-specific one, after all.

> --- /dev/null
> +++ b/xen/arch/riscv/irq.c
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/*
> + * RISC-V Trap handlers
> + *
> + * Copyright (c) 2024 Vates
> + */
> +
> +#include <xen/bug.h>
> +#include <xen/init.h>
> +#include <xen/irq.h>
> +
> +static irq_desc_t irq_desc[NR_IRQS];
> +
> +int arch_init_one_irq_desc(struct irq_desc *desc)
> +{
> +    desc->arch.type = IRQ_TYPE_INVALID;
> +    return 0;
> +}
> +
> +static int __init init_irq_data(void)
> +{
> +    int irq;
> +
> +    for ( irq = 0; irq < NR_IRQS; irq++ )

For this the variable would better be of unsigned type. I realize though that ...

> +    {
> +        struct irq_desc *desc = irq_to_desc(irq);
> +        int rc = init_one_irq_desc(desc);
> +
> +        if ( rc )
> +            return rc;
> +
> +        desc->irq = irq;

... it's a plain int field that we're storing into here. I don't think I can spot
any place where a negative value would be stored into there.

Jan

