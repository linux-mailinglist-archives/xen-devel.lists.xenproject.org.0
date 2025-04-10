Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E13CA8480F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 17:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946010.1344053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tvr-0007Kq-EL; Thu, 10 Apr 2025 15:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946010.1344053; Thu, 10 Apr 2025 15:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tvr-0007JY-Ao; Thu, 10 Apr 2025 15:35:11 +0000
Received: by outflank-mailman (input) for mailman id 946010;
 Thu, 10 Apr 2025 15:35:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2tvq-0007JS-D6
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 15:35:10 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62495709-1621-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 17:35:09 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso456275f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 08:35:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893773b6sm5138082f8f.27.2025.04.10.08.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 08:35:07 -0700 (PDT)
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
X-Inumbo-ID: 62495709-1621-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744299308; x=1744904108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HIA5sWh6Y0ceJnTmeADu8j738HgVYYEGj8eBEzCdEYY=;
        b=epgwfj33qdjURK3WnHMz4OzBl6P5PsH0XMkcoYiIeqeXNpplAHy4LbKlPpDrt85LR4
         xDZBNjEIqzwdrRM54GNTLbGYAfYrbqMKlf6wjB/EJm+SG/VDFCCJyQfxEyqam6QCo8WN
         hIHiTHWYTIne1Kwdz2+vFm+t2N687c0Ratbg2oHNc0NCr1iqaWC1HXYeM53eEojnyUoY
         0f6TDvKPmkjcgdV3m+IHUYcd72MZozcawvGG9WDtTnKOp+ijH72A5eJVCLhXnzb+WjLV
         fLvVpV5iPO1vObTP4DE+GvlKC0FfEnXH9s+nk/22MZIL8F5ie3IHnQtKMM+hfp9M8zvu
         9uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744299308; x=1744904108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIA5sWh6Y0ceJnTmeADu8j738HgVYYEGj8eBEzCdEYY=;
        b=PCGU/RN5NchtK6dFOg9Z9IioTCpl3wROhAV4CHWr0qodkAOOr9Dc5mmbCX3V24wfPV
         aJexSPWtscIAt47HbAiLmPV7IED5EjaHiwep93mtFMtuWlU7VwxOlES6o0evhSGNHq8M
         Dpn6ZdagP5ZefKSA48uR98f17eZqh/xW1xUqQa9l6UjYKpJnYt0ZZyGJVnCnEY38Bv03
         Mho5vmLE6pkr+lz35gpAsBHSQgF0/a9qavEMgVwpsxsKn782OE1yPRxEVmLsA11LiwIR
         vcjXbYvxijquptzHYHu4zcZu1zuAc0E8yMGn4Gy/15Orw9+hN81EzQqrKK06w1MYgqfb
         9a9A==
X-Forwarded-Encrypted: i=1; AJvYcCWID9LOU4xoLYoPhak6iMDETkgI89bY1vYNmb6NV2MnaWOxPas/QPeWtzFEwM8nyNi0GsLVEP0/uN0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBeeDcysQzzgGH2I9fMV+3Mq6wt6wA5zh5YtNjZ9gmVxk2Rd1F
	+yYC6z1LCSYVK5f68EoExkwhw6PAgjdUdC3ftHcbJeiF2ZQ787l8CqupwZHfgA==
X-Gm-Gg: ASbGncsro196LQWQT+QyjnCzj7ezfOa4+2CWfCApt2qwKAF4QuU0vnSqSMkDhEskfB6
	ClHJHPiVb7Tp+M/ePPbBN6HNndOEFAcdS9KmGkHhd99TEF0Cu8aL2lzrVTUIa2y/8CNSxfMcJ7G
	FToQOrQYMiofHcymtjdDYGvT7q3H5VhWsadHWomD8HaZq5zDR+B/M1KwgP761MNZH9wFhmw0Aor
	mvG+LJ0EyllH5kHW0T9VKbYS0Clj3HXbPjIbgjpoNYYCzlLa43QQeFV2lmg30SLhPa22ojRycAL
	BcKsDg5rwk+/1K36ddd618EgO7PYNEYJcI7egDYdJPU+7yUmlRjrAq6kTdw+XXQqx/wQ+IZuWgy
	KzlMRi/aQE5WpGhHSQneAOoUi+h4iWOMNqi5+
X-Google-Smtp-Source: AGHT+IFGzG8Mfy5FdYKmOnJsiPL6isuXs46HLwYZoFJAbv0f4EnVM1fMb3QlUXzCBUXP+cyOHhorxQ==
X-Received: by 2002:a5d:64aa:0:b0:39d:8128:978 with SMTP id ffacd0b85a97d-39d8f473b76mr3123945f8f.34.1744299308068;
        Thu, 10 Apr 2025 08:35:08 -0700 (PDT)
Message-ID: <31de00cb-b3b4-4d15-a128-930dc1c7ccdf@suse.com>
Date: Thu, 10 Apr 2025 17:35:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/14] xen/riscv: introduce platform_get_irq()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <6c6e7482cc3b0332f5724c80bf16931fe2d793ae.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6c6e7482cc3b0332f5724c80bf16931fe2d793ae.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> @@ -21,6 +22,22 @@ static struct intc_info __ro_after_init aplic_info = {
>      .hw_version = INTC_APLIC,
>  };
>  
> +static int aplic_irq_xlate(const uint32_t *intspec, unsigned int intsize,

As you start adding functions calling indirectly, please consider adding cf_check
right away, even if right now this has no effect on RISC-V. That'll save you from
going through the entire RISC-V subtree later on to find them all.

> +                           unsigned int *out_hwirq,
> +                           unsigned int *out_type)
> +{
> +    if ( intsize < 2 )
> +        return -EINVAL;
> +
> +    /* Mapping 1:1 */
> +    *out_hwirq = intspec[0];
> +
> +    if ( out_type )
> +        *out_type = intspec[1] & IRQ_TYPE_SENSE_MASK;
> +
> +    return 0;
> +}
> +
>  static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
>  {
>      if ( aplic_info.node )
> @@ -35,6 +52,8 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
>  
>      aplic_info.node = node;
>  
> +    dt_irq_xlate = aplic_irq_xlate;
> +
>      return 0;
>  }
>  
> --- a/xen/arch/riscv/include/asm/irq.h
> +++ b/xen/arch/riscv/include/asm/irq.h
> @@ -47,6 +47,9 @@ static inline void arch_move_irqs(struct vcpu *v)
>      BUG_ON("unimplemented");
>  }
>  
> +struct dt_device_node;
> +int platform_get_irq(const struct dt_device_node *device, int index);

And I assume callers of this will appear later in the series.

> --- a/xen/arch/riscv/irq.c
> +++ b/xen/arch/riscv/irq.c
> @@ -7,11 +7,52 @@
>   */
>  
>  #include <xen/bug.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/irq.h>
>  
>  static irq_desc_t irq_desc[NR_IRQS];
>  
> +static bool irq_validate_new_type(unsigned int curr, unsigned int new)
> +{
> +    return (curr == IRQ_TYPE_INVALID || curr == new );
> +}
> +
> +static int irq_set_type(unsigned int irq, unsigned int type)
> +{
> +    unsigned long flags;
> +    struct irq_desc *desc = irq_to_desc(irq);
> +    int ret = -EBUSY;
> +
> +    spin_lock_irqsave(&desc->lock, flags);
> +
> +    if ( !irq_validate_new_type(desc->arch.type, type) )
> +        goto err;
> +
> +    desc->arch.type = type;
> +
> +    ret = 0;
> +
> +err:

Labels indented by at least one blank please.

> +    spin_unlock_irqrestore(&desc->lock, flags);
> +
> +    return ret;
> +}
> +
> +int platform_get_irq(const struct dt_device_node *device, int index)
> +{
> +    struct dt_irq dt_irq;
> +
> +    if ( dt_device_get_irq(device, index, &dt_irq) )
> +        return -1;
> +
> +    if ( irq_set_type(dt_irq.irq, dt_irq.type) )
> +        return -1;

Can you please return proper -E... values, perhaps ones coming back from the
functions called?

Jan

