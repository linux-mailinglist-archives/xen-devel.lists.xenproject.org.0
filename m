Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C232AB7FC6
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 10:07:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984874.1370807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFTcA-0003oC-Fx; Thu, 15 May 2025 08:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984874.1370807; Thu, 15 May 2025 08:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFTcA-0003lu-DM; Thu, 15 May 2025 08:06:50 +0000
Received: by outflank-mailman (input) for mailman id 984874;
 Thu, 15 May 2025 08:06:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFTc8-0003lo-UU
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 08:06:48 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c6d3400-3163-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 10:06:47 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5f62d3ed994so1258834a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 01:06:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad251f4c04fsm650927166b.171.2025.05.15.01.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 01:06:46 -0700 (PDT)
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
X-Inumbo-ID: 8c6d3400-3163-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747296407; x=1747901207; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f0WAsoHkiPEv93dWwVsjrvRhTOkvhP/JrXk89RJOIw8=;
        b=eu056mshuIiVz1tZprmZtwPFbWC4KHNtcvr0mdi4/7SKW6DxKIlKt4ZH1T7eSnMQ0Y
         yWLqKCJpp/NLtr7m0L3cKDVyjGnt6WTK7R+pagxJrJeiN5YmHmvkUUTMXDk39lwKwTbS
         mkoM1pW7+Ii1j5iw0P0PHp8CNdx0IQhuuKCOJs8xxI9G82Fg7ezd3M0WeJAsZObTCHqK
         CnGq7i6Oqe1uD13p1DHtUO9a9ftyPTWDBwsgBm4ULxYf6VT9vWIF1KURCIfdyrIlAPTE
         ly4pGsdYeQnCTdku9+ke6cwTz2XMuY9xHYymFCofDmtnhsx5ylPj7L5147N7DDgezbXd
         Af3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296407; x=1747901207;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0WAsoHkiPEv93dWwVsjrvRhTOkvhP/JrXk89RJOIw8=;
        b=jsRykeCpmJX1NZP87l6h+en6X6hwmgQSO4jwsU+aMM0nxc4F3d8XuQ7wQtv1pbaFHR
         rgLm2jW6gBrdeIVgZu4ObLASUGzQr2Qd5PrlFP/JzERl5u7hmcLnOIynb2cPfn0UNYwK
         2kWBJ/Z6HGanhryeuHGqtoCmh1ERzEyapa8hNyQdVlXSWeHJSfz6TzI0EmV+Lj/fO42U
         VBodLgWTfimaU4esH7dsCxLkCdOwDAl1y1FklF1bdwOq32mXjHEWzI/6JlLZ4dvFRIdw
         cnDxxN0tXuduaiwZ6oJVkTTysnlkDG6umpPB5TPdXdPI4xw1usmfGcabFAmlSLfjx2F0
         WxXg==
X-Forwarded-Encrypted: i=1; AJvYcCUABIqX7WfAJKEuUyL3g08Zf007MXtK/kXUeYyfY5zL4D9col3Sl44FFrwsP5IFClciFpPVkEQ4lok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMZVQyA0UT8Pg4gYwQ3ods4cKJ8pTwXK5fygMq5uOUBgKD0Oqf
	6sLK6MSBMdAotMOUcivtndgcvV+W0tEh1NRGh543RZBnF/NFyB32sSfb0SizXA==
X-Gm-Gg: ASbGnctYk7aaCtrbRrpl5IZQsIztcnWcOoXpZAL8lJ0+FqFSe72nsLwRBWlZe3bPykA
	FFUqmdE/3mvE7xn2tT8kn88aEwB/OMRSrC4jvxX21cmzTRpmZCJvwA9QJi1hbfIqmy+ERFZTSBy
	I9fzs5EMdXa4rTILPNih/xFhcZdOhcgM4LQqVqc9bJd7XwzEsSTFq9z0snNpup7aTHjni6opzkv
	sYHEMqFz/I/XG2ofPxhkItATIRMRC/DzCCG2SzV8p7jrvozX5wtvk5wQZwQNqQ2Nja85hgq8nZu
	HPgiyEpQetEGO8n+D4398fM/GLWnu2OReHO816xH5BbIXiBPnBKk8mulVi7sxJ6wxjaV4iFsDxX
	jdK8FGBOGHQ2iFsVaj6KFkDbrp/NcEjTjEpgm
X-Google-Smtp-Source: AGHT+IHkAuX3C9u2vEITuY2mp7ttsyPlPZGcxcI8rQDmzZg5pcb+259xXCdUXT61dga7amCVfsysbQ==
X-Received: by 2002:a17:907:9997:b0:ad1:8dde:5b7a with SMTP id a640c23a62f3a-ad4f747da01mr602790066b.43.1747296407105;
        Thu, 15 May 2025 01:06:47 -0700 (PDT)
Message-ID: <2436be2e-28d4-4e48-a391-84b21651b339@suse.com>
Date: Thu, 15 May 2025 10:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] xen/riscv: introduce register_intc_ops() and
 intc_hw_ops.
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
 <7cd7d3780bb6db45b92c971ff8bcf2634570431f.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7cd7d3780bb6db45b92c971ff8bcf2634570431f.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/intc.h
> +++ b/xen/arch/riscv/include/asm/intc.h
> @@ -8,6 +8,8 @@
>  #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
>  #define ASM__RISCV__INTERRUPT_CONTOLLER_H
>  
> +#include <xen/irq.h>

If you need this include anyway, why ...

> @@ -17,6 +19,26 @@ struct intc_info {
>      const struct dt_device_node *node;
>  };
>  
> +struct irq_desc;

... this "forward" decl for something that's then already fully defined?
I can't, however, spot why xen/irq.h would be needed for anything ...

> +struct intc_hw_operations {
> +    /* Hold intc hw information */
> +    const struct intc_info *info;
> +    /* Initialize the intc and the boot CPU */
> +    int (*init)(void);
> +
> +    /* hw_irq_controller to enable/disable/eoi host irq */
> +    const hw_irq_controller *host_irq_type;
> +
> +    /* Set IRQ type */
> +    void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
> +    /* Set IRQ priority */
> +    void (*set_irq_priority)(struct irq_desc *desc, unsigned int priority);
> +
> +};
> +
>  void intc_preinit(void);
>  
> +void register_intc_ops(struct intc_hw_operations *ops);
> +
>  #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */

... throughout here.

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -5,6 +5,15 @@
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  
> +#include <asm/intc.h>
> +
> +static struct __ro_after_init intc_hw_operations *intc_hw_ops;

Nit: Attributes between type and identifier please. Also shouldn't both
this and ...

> +void __init register_intc_ops(struct intc_hw_operations *ops)

... the parameter here be pointer-to-const?

Jan

