Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF4DAB829B
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:29:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985039.1370968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUuR-0003kF-Id; Thu, 15 May 2025 09:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985039.1370968; Thu, 15 May 2025 09:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUuR-0003hp-FV; Thu, 15 May 2025 09:29:47 +0000
Received: by outflank-mailman (input) for mailman id 985039;
 Thu, 15 May 2025 09:29:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFUuQ-0003hj-1w
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:29:46 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 230dd234-316f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 11:29:45 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5fc7edf00b2so1137678a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:29:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fd20468681sm6949032a12.72.2025.05.15.02.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 02:29:43 -0700 (PDT)
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
X-Inumbo-ID: 230dd234-316f-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747301384; x=1747906184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w0fEFJI2iPu7OcostgjGGnqne2GJ06gyFujB+O+5/yI=;
        b=d20V5bidGyFVRNWtFjqZBL5rO2M2Oyi3SYYoHsl615N3M3lU6BKm4eQf5CGjTQZJPz
         YmPEYth2XuBnU1yz6TK5ZnVyuPqqkY8f3msBN1qe5iUVSsW8qq6FuXMAvKZtC8rH6nAF
         DKmSu58G7RC7MGnM8jPS5hqaXc5HSA56rXWCgW46NcVBLGbEjaT1lgcuazBSotdpipMF
         AJ5NkSEpPOXPe/HBwh1EtxPKyx/rxrT3TEmT5bEdcJ/efRU0h9fgJsUm1nmF9DAIFDve
         R6g1VDKMWnfHAmUVuOvgrmrhJK+nJZ20Au3z9QMP39ESz9ngE3oXnFdwegEjnOYj3p/h
         RNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301384; x=1747906184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0fEFJI2iPu7OcostgjGGnqne2GJ06gyFujB+O+5/yI=;
        b=B2Tx8VfHtRSgkjPDvNAJrBRKp1aqjOfB5WXie6kjAAEl6M/PifBB8NN+ReOU0Wqjd/
         OrpiA0VArdgae1bNNQpxpr7E9r7X9sEVSnUk2mvFdIaGBICrJUmXqTc/hSqCKUw81gy3
         n3qG7wc3pog0SIWXBA18DBJ4q3UOcUCY4RHis75xMPwAPef+Pda2UOKOcYiHUigML9h0
         0/j+/YHt17pjtELbr4w+Owg2OC9AeW3V2CANZRpOspVmTHyEX1sfKLlMBQrTGPKONqsM
         UrBkSGFE/EWfGcsBNxNVGa0iEJHuyM03RNUXQ0AJATKoomkcAFqKtjvOXLw6EaPE6VE2
         I0sA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Jm3LuelNpJmUMeVLIJJFXZ4b4Myt+w/eS4KOue1lEa1nAxRYHMQxLLYChS5B4bkk6fLs+F/QPBI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyey5z/QI1feKpLb9FHCNCPw0NyGaoiWnoFEM32jjo2mL3yjg+6
	KknOxNfvPapRzxTYYPCKh+bZIQKznGkFWUTRpRhbU8VmsNtLLRL5pL+vwJlwOA==
X-Gm-Gg: ASbGnct0gHFdh/VJwN1Fs4LWeuZEIwKyWLto5ULWcheepdZm46V82IdcVQHecyRHIKE
	5zi8OvC1vYnBu2T/OIPUbTHTipKzdwlYuSr2GBrT0wjyWDGnCu5TTRvKpBP++V1CgMFD0CvPCvt
	bjdmL1OdLDYiT2nC8bFWeqir3uS/yE1GsqtdPLjAj8dz6eEPxbLIoy35SFy9KLdb2lBWtjS9ddj
	n6D78N7LddzehJ+1q2fGK1FgQYjynhq48QuGYf8KsyxvZOB7lfyRMXZ3rRQK66iDjB81tV7wc8h
	lth63KTs7D+GZdzgTLamAp7XY3ElFB8v+lSRAilJqAK4z5bHUa/VsGyh5bZBUo6IZejEfXrZkOt
	38vvoR5dPjrPKgjuv2UIdZOjuvWT3GPmTnwcG
X-Google-Smtp-Source: AGHT+IH4wZXXZhQ0rneHsIMCpKJSrTeJph8jVsntOfPNb1rRahc3PkxNznxpKEwxDCc3gEhoZz336A==
X-Received: by 2002:a05:6402:1e94:b0:5f4:9017:c6a1 with SMTP id 4fb4d7f45d1cf-5ffd065a7a0mr1412682a12.25.1747301384254;
        Thu, 15 May 2025 02:29:44 -0700 (PDT)
Message-ID: <6883f364-fc29-4c43-897d-c24207b64b26@suse.com>
Date: Thu, 15 May 2025 11:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] xen/riscv: introduce intc_init() and helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <13ce98ce580b6d1a38dcdcd711a6bcf92f4eb0cd.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <13ce98ce580b6d1a38dcdcd711a6bcf92f4eb0cd.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> Introduce intc_init() to initialize the interrupt controller using the
> registered hardware ops.
> Also add intc_route_irq_to_xen() to route IRQs to Xen, with support for
> setting IRQ type and priority via new internal helpers intc_set_irq_type()
> and intc_set_irq_priority().
> 
> Call intc_init() to do basic initialization steps for APLIC and IMSIC.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  - This patch was part of "xen/riscv: Introduce intc_hw_operations abstraction"
>    and splitted to have ability to merge patch "xen/riscv: initialize interrupt
>    controller" to the current patch (where intc_init() call is actually
>    introduced).
>  - Add checks of that callbacks aren't set to NULL in intc_set_irq_priority()
>    and intc_set_irq_type().
>  - add num_irqs member to struct intc_info as it is used now in
>    intc_route_irq_to_xen().
>  - Add ASSERT(spin_is_locked(&desc->lock)) to intc_set_irq_priority() in
>    the case this function will be called outside intc_route_irq_to_xen().
> ---
>  xen/arch/riscv/include/asm/intc.h |  4 +++
>  xen/arch/riscv/intc.c             | 45 +++++++++++++++++++++++++++++++
>  xen/arch/riscv/setup.c            |  2 ++
>  3 files changed, 51 insertions(+)
> 
> diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
> index 2d55d74a2e..45a41147a6 100644
> --- a/xen/arch/riscv/include/asm/intc.h
> +++ b/xen/arch/riscv/include/asm/intc.h
> @@ -44,4 +44,8 @@ void intc_preinit(void);
>  
>  void register_intc_ops(struct intc_hw_operations *ops);
>  
> +void intc_init(void);
> +
> +void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
> +
>  #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
> diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
> index 122e7b32b5..15f358601d 100644
> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -1,9 +1,12 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
>  #include <xen/acpi.h>
> +#include <xen/bug.h>
>  #include <xen/device_tree.h>
>  #include <xen/init.h>
> +#include <xen/irq.h>
>  #include <xen/lib.h>
> +#include <xen/spinlock.h>
>  
>  #include <asm/intc.h>
>  
> @@ -21,3 +24,45 @@ void __init intc_preinit(void)
>      else
>          panic("ACPI interrupt controller preinit() isn't implemented\n");
>  }
> +
> +void __init intc_init(void)
> +{
> +    ASSERT(intc_hw_ops);

What's the goal of this check (also elsewhere below)? You'll crash anyway ...

> +    if ( intc_hw_ops->init() )

... here if the point is still NULL, just like you will if the function
pointer is unpopulated (and hence NULL).

Preferably with all of these (but not the other assertions) dropped
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

