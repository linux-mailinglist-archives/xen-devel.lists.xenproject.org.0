Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6D9AB6E78
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 16:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984411.1370551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDQp-0007Id-TO; Wed, 14 May 2025 14:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984411.1370551; Wed, 14 May 2025 14:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDQp-0007FT-QR; Wed, 14 May 2025 14:50:03 +0000
Received: by outflank-mailman (input) for mailman id 984411;
 Wed, 14 May 2025 14:50:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFDQo-0006zF-KU
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 14:50:02 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af01ce12-30d2-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 16:49:48 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5fc5bc05f99so13264941a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 07:49:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2192c8535sm945119366b.8.2025.05.14.07.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 07:49:47 -0700 (PDT)
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
X-Inumbo-ID: af01ce12-30d2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747234188; x=1747838988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pXyJ5Bzu0ZDjZyDZyQpx3cuxULLT79rv8reETj6Wz4U=;
        b=ZNFnM8CN6tkknng5ltyFmNo/wke/x3AXQfmK20WhQqDPdanFASAhm/ltLiTF16t6m9
         8D8OsGTMk4l7k33LDHCT56iY1CVBg3DNjCH+vr4zGDn5U8/Ur6ZTZZLQZbWk+wjyTJCa
         ylUoH9AQXQzQttnxto1ojVGEy8k55IjxgL2BUNLsg1z6oDxsYr7PgKHBtoD6jLuNe8LU
         gzCPPZ8eExvqxFQjdrEFf+3myL8sQ1lwTrVrsXLEX9qIN5jWkp2uHIRETzuBGmQL+6WZ
         NnQTPj1SbXvfg7H/tD/FY4ZVpYAH8+97VX4lO5+Oq7/dPorpK8B8ksgZVtJlxwOpqu9c
         fCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747234188; x=1747838988;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXyJ5Bzu0ZDjZyDZyQpx3cuxULLT79rv8reETj6Wz4U=;
        b=sqYiFvPjVjZQCthhghdwYBwNlQPGtnDDQE/gfDcHyODMQBbivXIvN/lFsHfVyFLRxt
         +LaiItRFl7GGeQSGNDbg3K6vRuENO9Fv4UZu0NPMGCZ33MuTaVbaIoF3XP8gyRT5EtRp
         3xFodw71+mwUlP9GFC4Oh8GUMB3i3b2/uq04yntxuBcI10nMmGGEi0xeTiOlOHujeebN
         U02HaDtR5D1isCB1TK+q6n9oYt/+EmwfXJ+vfCzviBrcP5XlAAnxEN38SY03bAoZE/mx
         JE6t/Dzvsqpk0jSmpjkmeIuu/lRLHMV6hl0VubWnxIYlb98aTSYcd9ewULKQflXTACZn
         Q1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWe4c3ZCfVu+O2KtY900tbOHhz1krytUYvzSm6NpEH55pkfI25eoCKY74ink5EyzffiJafV4LM5cNw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5bUaNZQLFYjabrIqGeyoumq7FKO/pa7ZXLHK35XAz5cEr9RF0
	oJNHIhvq3a0iH3qhLK9UcAlgAqOm+aLWjic5eFkiKDW1piMdoorwkXIGs//m+A==
X-Gm-Gg: ASbGncvzsTs2t9TlkggSHbIeqHYodVMpRjPfzO7DXTJfUy7B259/dp2Eegg+3dji3TK
	+DwMhKWRG/45CfCfRe1XZeqqZB6/mj95PIgY+b5tsMPx+QjTmNNMGPdCdbKI2+2VvNM/idrvAqR
	1yfi/RPB4Md4Lu1CdeXOsfTCMM47NdMos04B9blY/eN8J/rn54dT1BfTQXlNnHgWkbGDExigOfS
	8KFF9QYQSw1MMciCGS0JwAwYfF02xUQ0tQc9EJ2S39E+5HFe6OqPzOdfEMP9EGCQKBLGEIpsTpJ
	cZrWrHQ180HRoG+SIdzRk3k6jSx8lIsrqdL4OGk1vGXcAsGYIYNVSQm6PcWLFwEXesEp2EXy8wM
	LmAJ2hghGbGY+SGm+XI3pGow4U7V8Jb00vCfu
X-Google-Smtp-Source: AGHT+IHsw0WfsUy/w9cMXj2QwWU4GQZcK+c+nDG7sVKsmseDqIFEX02mW66t04Gc7f5N4mK8CrtfqA==
X-Received: by 2002:a17:906:9c87:b0:ad2:2e45:41ac with SMTP id a640c23a62f3a-ad4f74d0782mr329738866b.50.1747234188132;
        Wed, 14 May 2025 07:49:48 -0700 (PDT)
Message-ID: <86738265-1137-45f0-ae9e-0db7f0451c08@suse.com>
Date: Wed, 14 May 2025 16:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] xen/riscv: introduce init_IRQ()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <2a57200785c710a5203a116bf9a933b4ea12d112.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2a57200785c710a5203a116bf9a933b4ea12d112.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/irq.h
> +++ b/xen/arch/riscv/include/asm/irq.h
> @@ -3,6 +3,11 @@
>  #define ASM__RISCV__IRQ_H
>  
>  #include <xen/bug.h>
> +#include <xen/device_tree.h>
> +
> +#include <asm/irq-dt.h>
> +
> +#define NR_IRQS 1024

Is this arbitrary or arch-induced? Imo it wants saying in a brief comment either
way. Then again maybe it's entirely obvious for a RISC-V person ...

> --- /dev/null
> +++ b/xen/arch/riscv/irq.c
> @@ -0,0 +1,45 @@
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
> +
> +    return 0;
> +}
> +
> +static int __init init_irq_data(void)
> +{
> +    unsigned int irq;
> +
> +    for ( irq = 0; irq < NR_IRQS; irq++ )
> +    {
> +        struct irq_desc *desc = irq_to_desc(irq);
> +        int rc = init_one_irq_desc(desc);
> +
> +        if ( rc )
> +            return rc;
> +
> +        desc->irq = irq;
> +        desc->action  = NULL;

Nit: You copied a stray blank from Arm code. Actually I wonder why it isn't
init_one_irq_desc() that clears this field. It also feels like ->irq would
better be set ahead of calling that function, like x86 has it.

Jan

