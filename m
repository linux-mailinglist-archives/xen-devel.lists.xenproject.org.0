Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 576A9A8A374
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 17:55:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954207.1348526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4idA-000347-JS; Tue, 15 Apr 2025 15:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954207.1348526; Tue, 15 Apr 2025 15:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4idA-00030Y-Fz; Tue, 15 Apr 2025 15:55:24 +0000
Received: by outflank-mailman (input) for mailman id 954207;
 Tue, 15 Apr 2025 15:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4id8-00030M-C2
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 15:55:22 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07418be9-1a12-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 17:55:18 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so46009335e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 08:55:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43d046sm15003825f8f.63.2025.04.15.08.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 08:55:17 -0700 (PDT)
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
X-Inumbo-ID: 07418be9-1a12-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744732518; x=1745337318; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9IA0YI+idxqGLu+s7xKtxiAjeQwtDC0sy0XeaFT3Y44=;
        b=OKI3VWXzSWKsjxw/G5k2Xxba4CPkLYPYxlF1JK5grmwsYLooyKCGpMpF2R1HLIP733
         ZJijJC0gvvQoE94kYLOEpx3nqulVamM7uN5KXPTJb6LFgkqbQRdtHmDBqCKwX8Z57QDz
         kyvRmRhabQuhCzSQdRr9tmJMkf+CFAQ6aQeS5ywWxs2Cu8gll8vhecb9tZizR6HjhjI+
         jMt2H93qVuRiExFR9Addpg5B6ACU5FCl0UnC3jnO5hglJGyl1dliX1q51VO69Bvr/mbv
         j+znbrFO27dM0i4CMeUi/46I5LPYUuJjRrMMIoz7PxM/j6yiK7VGXZJ/W5+6rQDeLcGW
         xsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744732518; x=1745337318;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IA0YI+idxqGLu+s7xKtxiAjeQwtDC0sy0XeaFT3Y44=;
        b=B+4ZAfKczNh3b3skgbOiMqNh/uNbRJGTXuhbtWAPfIXQ2zTKcyB/IMIWUnvEbIUHT3
         e/gvQxK38LSXSQe4uEYrrOWej5ZRFlndxC/zPujNKxP07wo9I8C5nZ5eUYROx9g+YgMo
         SxYg/0bds7n/Io4TcxWtApFvaSdrIoZJ5vt4JhWgnuiQPsSJ502NfYS3NYqHkOhfzNJ7
         0vDi+AGJOu2/b5ymN71vw+Ji6dXKVeP9Ck7MPNNDAlLowHWx2WWXnbfIfenDQm4SjGkZ
         FXJDCNQNab19RShRoFoRVT6uzlpVh046DY865JHLKMI+LgPedsvLD0jKuaTuMqCvZmNK
         ibfA==
X-Forwarded-Encrypted: i=1; AJvYcCX7DtkLJ5xqtC0Ut5VA3AJgBa+naMtVZWBWhBMx66YgcirolDhu9/fQlMiBjELtWcmJpigVv+2JrJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGlrvQGWVtrBN3+XOmCymsyjBa7G+GWiihS0c9yARSayOVy32/
	iXfa5jfHbEsRRBGgk0VoDd1w3dwIG0rq8e/GBgbdGhFPLb+AR7czeRWv8lEgtQ==
X-Gm-Gg: ASbGncuZTjwaJjWKdcBdoozju6NuUnbt4LkN0iJFIm3Wt2HcuGpA95x+mzogkm0n1mi
	nckm+8Putc2SqOh6PrJANcok7WyqksTA0waAA9Z73UlbnYT7nJfR9AEDGTx9mB3IqJ1CgGbRjMP
	x71foPOCH7Ld/PqFkbjLCsiiJ83VO7mRlQvvXIaRKj2DuPELXrldI6RVg9K0qqKtGMA0J5YvuK1
	3KZ6wykZ0AxVYmQo8A8PFLFuD7ossOsifxQ/3AMBHlqy12aYmmWzearcdo59GMpYKk5FGLJa993
	v1rTeC3Pj4LZgyJNgEznBQjSw2aLXDPWnphR6TG9w72RCLqCjnmk/6AlecsvApKdynW9K/Ejhu8
	vTeV+xDrdpzYTCkkgefMFFhZDyJtCg/8c4dYl
X-Google-Smtp-Source: AGHT+IH/kRjvLf7QkBTEzrE2Igih059QqB3JN2wNCdEE6o6TW98/9jUTYFRFIHMRxHbRyUFkULU+XA==
X-Received: by 2002:a05:6000:40d9:b0:39c:1258:2dc9 with SMTP id ffacd0b85a97d-39eaaeca292mr14486414f8f.58.1744732517682;
        Tue, 15 Apr 2025 08:55:17 -0700 (PDT)
Message-ID: <47492663-5832-49e7-af4d-ee536206e641@suse.com>
Date: Tue, 15 Apr 2025 17:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/14] xen/riscv: implement setup_irq()
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
 <2bc37c3996978129a5b2c888917307ea32448651.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2bc37c3996978129a5b2c888917307ea32448651.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/irq.h
> +++ b/xen/arch/riscv/include/asm/irq.h
> @@ -26,6 +26,8 @@
>  #define IRQ_TYPE_SENSE_MASK     DT_IRQ_TYPE_SENSE_MASK
>  #define IRQ_TYPE_INVALID        DT_IRQ_TYPE_INVALID
>  
> +#define IRQ_NO_PRIORITY 0
> +
>  /* TODO */
>  #define nr_static_irqs 0
>  #define arch_hwdom_irqs(domid) 0U
> @@ -54,6 +56,10 @@ void init_IRQ(void);
>  struct cpu_user_regs;

Seeing this and ...

>  void do_IRQ(struct cpu_user_regs *regs, unsigned int irq);
>  
> +struct irq_desc;
> +struct cpumask_t;

... now these - all of such forward decls may want to collectively live in a
central place higher up in the file.

> @@ -57,6 +59,99 @@ int platform_get_irq(const struct dt_device_node *device, int index)
>      return dt_irq.irq;
>  }
>  
> +static int __setup_irq(struct irq_desc *desc, unsigned int irqflags,
> +                       struct irqaction *new)

Irrespective of you possibly having found it like this elsewhere, may I
suggest that in new code we avoid leading double underscores? A single one
will do here.

> +{
> +    bool shared = irqflags & IRQF_SHARED;
> +
> +    ASSERT(new != NULL);
> +
> +    /* Sanity checks:

Nit: Comment style (and there are many more issues below).

> +     *  - if the IRQ is marked as shared
> +     *  - dev_id is not NULL when IRQF_SHARED is set
> +     */
> +    if ( desc->action != NULL && (!test_bit(_IRQF_SHARED, &desc->status)
> +         || !shared) )

Nit: Operator placement and indentation.

You're probably better off this way anyway:

    if ( desc->action != NULL &&
         (!test_bit(_IRQF_SHARED, &desc->status) || !shared) )

> +        return -EINVAL;
> +    if ( shared && new->dev_id == NULL )
> +        return -EINVAL;
> +
> +    if ( shared )
> +        set_bit(_IRQF_SHARED, &desc->status);

See comments on earlier patches.

> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
> +    new->next = desc->action;
> +    smp_mb();
> +#endif
> +
> +    desc->action = new;
> +    smp_mb();

Aren't smp_wmb() sufficient on both places? If not, I think comments
want adding.

> +    return 0;
> +}
> +
> +void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask)
> +{
> +    if ( desc != NULL )

Can desc really be NULL here? Isn't desc->lock required to be held?

> +        desc->handler->set_affinity(desc, cpu_mask);
> +}
> +
> +int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
> +{
> +    int rc;
> +    unsigned long flags;
> +    struct irq_desc *desc;
> +    bool disabled;
> +
> +    desc = irq_to_desc(irq);

Make this the variable's initializer?

> +    spin_lock_irqsave(&desc->lock, flags);
> +
> +    disabled = (desc->action == NULL);
> +
> +    if ( test_bit(_IRQ_GUEST, &desc->status) )
> +    {
> +        spin_unlock_irqrestore(&desc->lock, flags);
> +        /*
> +         * TODO: would be nice to have functionality to print which domain owns
> +         *       an IRQ.
> +         */
> +        printk(XENLOG_ERR "ERROR: IRQ %u is already in use by a domain\n", irq);
> +        return -EBUSY;
> +    }
> +
> +    rc = __setup_irq(desc, irqflags, new);
> +    if ( rc )
> +        goto err;
> +
> +    /* First time the IRQ is setup */
> +    if ( disabled )
> +    {
> +        /* disable irq by default */
> +        set_bit(_IRQ_DISABLED, &desc->status);

Shouldn't this be set when we make it here?

> +        /* route interrupt to xen */
> +        intc_route_irq_to_xen(desc, IRQ_NO_PRIORITY);
> +
> +        /*
> +         * we don't care for now which CPU will receive the
> +         * interrupt
> +         *
> +         * TODO: Handle case where IRQ is setup on different CPU than
> +         * the targeted CPU and the priority.
> +         */
> +        irq_set_affinity(desc, cpumask_of(smp_processor_id()));
> +        desc->handler->startup(desc);
> +        /* enable irq */
> +        clear_bit(_IRQ_DISABLED, &desc->status);

Now it turns out this is really done twice: Once in aplic_irq_enable(),
and once here.

> +    }
> +
> +err:

Nit (yet once again).

Jan

