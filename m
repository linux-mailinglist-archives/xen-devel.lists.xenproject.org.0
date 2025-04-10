Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE24FA8492A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 18:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946058.1344083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2uMG-00012e-Sj; Thu, 10 Apr 2025 16:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946058.1344083; Thu, 10 Apr 2025 16:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2uMG-0000zy-PC; Thu, 10 Apr 2025 16:02:28 +0000
Received: by outflank-mailman (input) for mailman id 946058;
 Thu, 10 Apr 2025 16:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2uME-0000zr-GP
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 16:02:26 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31d97a01-1625-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 18:02:25 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so548650f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 09:02:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb20sm60115305e9.3.2025.04.10.09.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 09:02:23 -0700 (PDT)
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
X-Inumbo-ID: 31d97a01-1625-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744300945; x=1744905745; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oXbrqxyLG3Khq8o0Q5Jjleb4/z4VA5gtTTQndqxNTRk=;
        b=PCpNRhV8dA4tvOpyioubo1NA1lf3DYzTQPGFRAe1aj+RgRXm+3xgV739TAXTftVyQw
         /ohnMxe5wmU3IgQG6L4VJBJ/cZvSUPXEXfekU7E6Zm+xLrj75F/fXpLE0dOe2IGZun0Y
         PwuNT/x+SyCR0ZomSMK22D4jZ7CYZf3xNLj0ekiWniz+cpReiz6XnpeWznzH4UTugaS8
         B65jhB3MI1qQdg0k9iBpDQvqwULzmm17rUACgj0LuFiC0qAAKXNw2Nmu/CPJ0CWwzcMg
         ALITPqhERl+3LfLMAv4RZncO8MuxX6JoKgXqBf8WivfB66ChejHwvUA6rM0nVknLO0v9
         DG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744300945; x=1744905745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXbrqxyLG3Khq8o0Q5Jjleb4/z4VA5gtTTQndqxNTRk=;
        b=SyPgCPlJvhnwrp7IZNPmmSSmbZrNGWuRDrZsga1V6Sl5Bx4Lu2X2A3g1sZflvTnz/g
         tp2/1bHfV8pgrMn+vFK2HRjMRqZLt9s36sk+ph+BrMX881B87Z3U+L10Uy9dDFN0ZNAI
         boJxiQ37v8CuOc/7lwDcxLywV8OYNpAeocN99JAMuGzO5poHHn+UYcJtcz8QbQo6oaTs
         7yOoPkiQhKnwfGkilP2vyi9OU/h3Ln3h1dgYC3vp95Em22Egrxq6SxlVnwgKv0FQwEiV
         2yNfLYAIiF16Wi1bzfuFePnquVl3fB7S1m5xDNfMQU1XMtaaR5alUDTwPWGQMecwa44p
         SmUg==
X-Forwarded-Encrypted: i=1; AJvYcCVac4a9zPQ5bG8RrcC/63hqWBC0vMcLGYn+vhJrPGUfER/JKTdEblxK+ZC7vKiyoGIXBr6TFyNBoF8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJ57a/OSsp2g8gy6Us2xRqOLfnHTwwazV52gwtHksc/B4LGoXW
	2+lMAv17mkWLty0T9KU7N6SU4MfqEHXx+dgLGZ2lzSCAkdwREWKNhvsRjqQplg==
X-Gm-Gg: ASbGncvYh0uD3iIo8MoN6NaPlJqmHmdjZ2N4R0Gv3RNLeeL5W56g/otZgh4NPLIzd99
	npYRfS4OiQJs5JlC2TfAYyUhTzKLjfFQnDHhnPnfkuXrHZOBjT/iLYl54CIY78xDVBtEiWNRPR1
	UvQBjuh6T3iPUJLSQ1GLw+KbiSZfKVp/G2UtJKQybPZUHKoLALm+bZdqZzy79AYDXkpU1AAHqWA
	kAeRa9Quklr11HFqPKD2iGp/7tz6NIMcf9vhk6/RmcC8TthV1813MRaSiqtB1cOwLJFxk0w5MAZ
	bJRXtdpQXdZAYpRDztac2YSm+Xbf2xAaxuXXYLxXSkYpAFPYnxGFD9YtGUsgf6JueaxLruqqGfn
	R4NsWA2DIR3X2mvfpHWRNSluApg==
X-Google-Smtp-Source: AGHT+IF4CqnyBVX7Z2L95TCyCfHbLn+pkNZM3mRhtI1JU39Q2cd//i6rl9CgqdrRxLJFvtHjXJ4b6g==
X-Received: by 2002:a05:6000:2906:b0:390:fbba:e65e with SMTP id ffacd0b85a97d-39d8f474ademr2624608f8f.32.1744300944272;
        Thu, 10 Apr 2025 09:02:24 -0700 (PDT)
Message-ID: <b799c1f9-16ff-4af1-8b57-6e5360f10c47@suse.com>
Date: Thu, 10 Apr 2025 18:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/14] xen/riscv: Introduce intc_hw_operations
 abstraction
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
 <139b37478b4ca7e2ec3a04b73f462197227f57fa.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <139b37478b4ca7e2ec3a04b73f462197227f57fa.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/intc.h
> +++ b/xen/arch/riscv/include/asm/intc.h
> @@ -17,6 +17,29 @@ struct intc_info {
>      const struct dt_device_node *node;
>  };
>  
> +struct intc_hw_operations {
> +    /* Hold intc hw information */
> +    const struct intc_info *info;
> +    /* Initialize the intc and the boot CPU */
> +    int (*init)(void);
> +
> +    /* hw_irq_controller to enable/disable/eoi host irq */
> +    hw_irq_controller *host_irq_type;

Pointer-to-const perhaps?

> +    /* Set IRQ type */
> +    void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
> +    /* Set IRQ priority */
> +    void (*set_irq_priority)(struct irq_desc *desc, unsigned int priority);
> +
> +};
> +
>  void intc_preinit(void);
>  
> +void intc_init(void);
> +
> +void register_intc_ops(const struct intc_hw_operations *ops);
> +
> +struct irq_desc;

If it's needed here at all, it needs to move up, as some of the hook pointers
already use the type.

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -1,9 +1,21 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
>  #include <xen/acpi.h>
> +#include <xen/bug.h>
>  #include <xen/device_tree.h>
>  #include <xen/init.h>
> +#include <xen/irq.h>
>  #include <xen/lib.h>
> +#include <xen/spinlock.h>
> +
> +#include <asm/intc.h>
> +
> +static const struct intc_hw_operations *intc_hw_ops;

__ro_after_init perhaps?

> +
> +void register_intc_ops(const struct intc_hw_operations *ops)

__init perhaps?

> +{
> +    intc_hw_ops = ops;
> +}
>  
>  void __init intc_preinit(void)
>  {
> @@ -12,3 +24,42 @@ void __init intc_preinit(void)
>      else
>          panic("ACPI interrupt controller preinit() isn't implemented\n");
>  }
> +
> +void __init intc_init(void)
> +{
> +    ASSERT(intc_hw_ops);
> +
> +    if ( intc_hw_ops->init() )
> +        panic("Failed to initialize the interrupt controller drivers\n");
> +}
> +
> +/* desc->irq needs to be disabled before calling this function */
> +static void intc_set_irq_type(struct irq_desc *desc, unsigned int type)
> +{
> +    ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
> +    ASSERT(spin_is_locked(&desc->lock));
> +    ASSERT(type != IRQ_TYPE_INVALID);
> +    ASSERT(intc_hw_ops && intc_hw_ops->set_irq_type);
> +
> +    intc_hw_ops->set_irq_type(desc, type);
> +}
> +
> +static void intc_set_irq_priority(struct irq_desc *desc, unsigned int priority)
> +{
> +    ASSERT(intc_hw_ops && intc_hw_ops->set_irq_priority);
> +
> +    intc_hw_ops->set_irq_priority(desc, priority);
> +}
> +
> +void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
> +{
> +    ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
> +    ASSERT(spin_is_locked(&desc->lock));
> +    /* Can't route interrupts that don't exist */
> +    ASSERT(intc_hw_ops && desc->irq < intc_hw_ops->info->nr_irqs);
> +
> +    desc->handler = intc_hw_ops->host_irq_type;
> +
> +    intc_set_irq_type(desc, desc->arch.type);
> +    intc_set_irq_priority(desc, priority);

If these are going to remain the sole callers of the two functions, I'd question
the need for the separate functions. Some of the assertions done there would then
actually be redundant.

If not, is there a reason intc_set_irq_priority() doesn't have a lock-held check?

Jan

