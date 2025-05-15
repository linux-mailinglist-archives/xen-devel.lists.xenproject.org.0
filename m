Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA5AB7EDD
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 09:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984837.1370776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFT66-0006Z5-GU; Thu, 15 May 2025 07:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984837.1370776; Thu, 15 May 2025 07:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFT66-0006WI-DA; Thu, 15 May 2025 07:33:42 +0000
Received: by outflank-mailman (input) for mailman id 984837;
 Thu, 15 May 2025 07:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFT64-0006Vu-TD
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 07:33:40 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaf13d1f-315e-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 09:33:39 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad238c68b35so112684766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 00:33:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21934d4acsm1066120766b.71.2025.05.15.00.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 00:33:37 -0700 (PDT)
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
X-Inumbo-ID: eaf13d1f-315e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747294418; x=1747899218; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=couxgbisf2m6uHPvhGCaE8zKqYTKOdns6VUmWWn2dLU=;
        b=HiBg+AN5VIDrLLKIJD6FUFy0OOhDPibff9kBopUGgbP+23ZMrI57wDX3asTq7JkYJo
         S/VIdW46TOz4tPV8yYLJEfQLhoBuWX3eiYojhzvqXdgdA1/6CQKffjDZnYIzc3nePjz0
         iJrzkFBIVWHktHOsVQW8Rd6LmQGWCtpq6ybV3BdNnS6UREPObEEf6UKm2mkbnBzBmViF
         esQMImE8QyrqCv6nb4xQUcxbyQBTtceRS+Hg6m6de/Oz2mhvu2gh/yTYvkEiBYvUSGzx
         sm/FPnAONrzXfG+NAXBuNmp6gYJyjiTXNPVgyuTH+eWrSMA+gOsbF7He5NxCpGQSwPHn
         joXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747294418; x=1747899218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=couxgbisf2m6uHPvhGCaE8zKqYTKOdns6VUmWWn2dLU=;
        b=auHku5ovxGI/ToQqAJAdK2r/pNhdQPrvEGB/sKR64dYuFae6hFJ7GH8BDiUWfSvC2G
         W6EeTjlxsf29eK/xGbug5yEjWy7WEYNyJLxDoiyPrwwOUlSaMJB3bK5euI97FvraJl2K
         LqDGe0pNs0O+A4q8tgRidizeu45L6+4DRFrkHk/tjWCW4cJ7CRTOKDkvP6GDhy+fFSrO
         CIXTSKhiyquKxNtgccpoQ21D7iIRS2aDIXtX1qWXTCGRgtTi9ZBaTJSX4pxELFazz7Le
         ZP6xmM2Vmlq53mPsJunyEQty7gUrCooo5HTl+B2Y+3wk8QPvoTVElHI3u45WyXYrTw0a
         mzLw==
X-Forwarded-Encrypted: i=1; AJvYcCU6SVFCUThGE/M82Jjx1kh5oqbKX4bdxWH3AzT3xH96cQ87cYFU1rMpFnoDl8I38gTyaItvbwzj8gM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWOzzNpyb2qDWIjkjoYG+1aQGLUHwZS8xWHNH3RIqKwgFLgKYa
	17WGQwDr2k4cGfQ8aHJgRu20w9e3MthhwxHuiuwdeqiROitDQMj3xY5bS4hJEA==
X-Gm-Gg: ASbGnctRb00CJUdbOpx5TYx/8AcG5Dt2XNYhCV+MInHX3sph2hPVWOJiAZw1o6L9GVp
	H2eAg714pDzacGKNCN6Spa+0udOO/oLzEKzjcYxIuL7kv4zK+Xwvq+GFaGWTQ5xt+NEJ9QRHV2i
	SDavbSQbe8WJJDwIQhjqn3m+K2m1Y/SLpR6zRmFBEWSSLCzBfrCklgTS1rPIEUaM8qwOdbyqZlk
	R9O9MQc8RVdo6z52NRsOb9TfXlTcoCc2Rib8CjKSFXrRsxJnKFD4ZWm5bmiB0kjCx07W/vb+zzM
	LWTWaObeCWjMtLw0Sl3l65H4A6EZsNmR6cCUDvLe+ctNdU8FiO1xdNVf/wJQ9sdGs2k+yqiZurY
	lBzD0PofRhjw7Pp2B2CsKl4WtO+mMNB7ozH4C
X-Google-Smtp-Source: AGHT+IHSHEBDxdtvOPJwOIi00oUOn1o25/sTjMRu5u+rb8iNbV5tCOqBGG2z3xOfpWaAn4IYzHoV5A==
X-Received: by 2002:a17:907:6c14:b0:ad4:f5ed:add2 with SMTP id a640c23a62f3a-ad516050d15mr101164666b.38.1747294418175;
        Thu, 15 May 2025 00:33:38 -0700 (PDT)
Message-ID: <f2d61436-739c-4e41-95a5-22a5176d9415@suse.com>
Date: Thu, 15 May 2025 09:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] xen/riscv: introduce platform_get_irq()
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
 <a6198571b19be1f10b549e68a1b712a6653429e6.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a6198571b19be1f10b549e68a1b712a6653429e6.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> platform_get_irq() recieves information about device's irq ( type
> and irq number ) from device tree node and using this information
> update irq descriptor in irq_desc[] array.
> 
> Introduce dt_irq_xlate and initialize with aplic_irq_xlate() as
> it is used by dt_device_get_irq() which is called by
> platform_get_irq().
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  - Add cf_check for aplic_irq_xlate().
>  - Ident label in irq_set_type().
>  - Return proper -E... values for platform_get_irq().
> ---
>  xen/arch/riscv/aplic.c           | 20 +++++++++++++++
>  xen/arch/riscv/include/asm/irq.h |  3 +++
>  xen/arch/riscv/irq.c             | 42 ++++++++++++++++++++++++++++++++
>  3 files changed, 65 insertions(+)
> 
> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> index caba8f8993..10ae81f7ac 100644
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -11,6 +11,7 @@
>  
>  #include <xen/errno.h>
>  #include <xen/init.h>
> +#include <xen/irq.h>
>  #include <xen/sections.h>
>  #include <xen/types.h>
>  
> @@ -21,6 +22,23 @@ static struct intc_info __ro_after_init aplic_info = {
>      .hw_version = INTC_APLIC,
>  };
>  
> +static int cf_check aplic_irq_xlate(const uint32_t *intspec,
> +                                    unsigned int intsize,
> +                                    unsigned int *out_hwirq,
> +                                    unsigned int *out_type)
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
> @@ -35,6 +53,8 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
>  
>      aplic_info.node = node;
>  
> +    dt_irq_xlate = aplic_irq_xlate;
> +
>      return 0;
>  }
>  
> diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
> index f609df466e..6223bbbed5 100644
> --- a/xen/arch/riscv/include/asm/irq.h
> +++ b/xen/arch/riscv/include/asm/irq.h
> @@ -30,6 +30,9 @@ static inline void arch_move_irqs(struct vcpu *v)
>      BUG_ON("unimplemented");
>  }
>  
> +struct dt_device_node;
> +int platform_get_irq(const struct dt_device_node *device, int index);
> +
>  void init_IRQ(void);
>  
>  #endif /* ASM__RISCV__IRQ_H */
> diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
> index 26a8556b2c..4c518bbd97 100644
> --- a/xen/arch/riscv/irq.c
> +++ b/xen/arch/riscv/irq.c
> @@ -7,11 +7,53 @@
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

Nit: Stray blank. In fact you could omit the parentheses as well.

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
> + err:
> +    spin_unlock_irqrestore(&desc->lock, flags);
> +
> +    return ret;
> +}
> +
> +int platform_get_irq(const struct dt_device_node *device, int index)
> +{
> +    struct dt_irq dt_irq;
> +    int ret;
> +
> +    if ( (ret = dt_device_get_irq(device, index, &dt_irq)) != 0 )
> +        return ret;
> +
> +    if ( (ret = irq_set_type(dt_irq.irq, dt_irq.type)) != 0 )
> +        return ret;
> +
> +    return dt_irq.irq;

What guarantees the value to be at most INT_MAX (i.e. no silent conversion to
a negative value, signaling an error to the caller)? Actually, looking at
irq_set_type(), what guarantees irq_to_desc() there to not overrun irq_desc[]?
There are no bounds checks in aplic_irq_xlate().

Jan

