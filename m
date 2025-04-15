Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C65A8A16C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 16:43:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954076.1348427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4hV9-0003BB-AG; Tue, 15 Apr 2025 14:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954076.1348427; Tue, 15 Apr 2025 14:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4hV9-00038w-6v; Tue, 15 Apr 2025 14:43:03 +0000
Received: by outflank-mailman (input) for mailman id 954076;
 Tue, 15 Apr 2025 14:43:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4hV7-00038q-Nc
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 14:43:01 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed12bcd7-1a07-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 16:42:59 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso28729835e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 07:42:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075fca5sm219350995e9.32.2025.04.15.07.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 07:42:58 -0700 (PDT)
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
X-Inumbo-ID: ed12bcd7-1a07-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744728179; x=1745332979; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y0/hvRbShFtpbSF0bBT59YDOkH3dlARBr737hmFPXIA=;
        b=Mks6Mtnnd3l+6ElFR7WhnR6J3Dswek/raMExHJ2TRlCYzqs7SUk5CCPEVjuLyjQIns
         YezeNUVcvfZbypYM5G+9u/sPkKaU9Hqnm1+qCvNqStqaxMZymPSQmK4Z7Jmk1CI7sw6G
         Wq3Yzm0KcQLF4HbvfvICFuicT2dZiKhX7ECCOc3NOeREHPdPiVxruNB84QI4TQwjMCwd
         AEAxzM7XuvAVB/ZU9KURey3MogGbCIWcJceAxy2yleVNyjJfeHp1nK9HLnjVNZoMkWlx
         4u4PDxI86AvtFtFnx/DxmLRh8LpgWzcxFI2Vx3dOAtqaESoBGhWx+tEe2Ct7L8KmCkTa
         p8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744728179; x=1745332979;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0/hvRbShFtpbSF0bBT59YDOkH3dlARBr737hmFPXIA=;
        b=PtXWFBgMBCxfE8ELjKR7AseHueV/+d1iC9J9qU5wwI8Ed29WdNSNrQ5/iKt9IoLriK
         mbn+HvylyLO36u8t5pcI8PWjCjXIZZGBs12GqNoL+X6uvoZP7C2poVMwH/l+g2ccyTlm
         hReDOnxl7JQDGPB65jMwDs3JgkaKwGPiiBpMxQ42s/73rs0uLqgMpAMFcjNtNUEHoOsG
         0l9p5E5aCpP2+OyiMC8FULLMCUkmGxqPwwlg/WuRKQ7nOBxxHxDEerTOIEOatVq5ZZXR
         kYz8yg6jOxLphBiRqwuPEOyX9aTwj2zLZmXp+F55+4i42C7kP2R2IvB5E1Gx2e3Vlw0O
         jjtA==
X-Forwarded-Encrypted: i=1; AJvYcCW0X/6nDSFMb4P/1xl+wvDWD6tW/yy1ZtqTVfMLg5ZRmDnlAAmEAnJPs3rngDU0Q7NW6P0Ci5vgbK0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6u8uPoIYYtD/CL+NnPjnTM3w2gUNWHK17x4EiY5xQPicUs2L0
	bpnEot7O5c5NE1coIr1GkNzat2azPQ+vsUTMqMwtpQvpsZPw3PoOb1hQi3oknA==
X-Gm-Gg: ASbGnctzND+DYgWycNoZKKHnOtitAa3XNw+7tJ9eGgADp8Sdkn+OlRzjBKNhCzi0YWz
	DkReUNGRUQdnMZ6ByRg52ufCQbCy98UvllBf1TfQbwELs0jcPuQ17KeV9deT9x1I/AMD0KhW9c5
	gv4ErZyOJ2K8gBNHTio9lNBy1y5uUSmfuou4j1DQbjXGbtO9mlgfsx1upPi//tOAK2/LGoNHaXG
	iEUawJe1iCwTYqIDo1uXf9farqGLVpdeoV2bU+pA3s1sC2f5zzn1WC2lh2izUZqDXO96z9fh6td
	dZ7193lxz10IGLY6Q4TecslpWzrbNkT/jYJTDAWutvrq92pGo/nyJruXKchh1eyPjy7oJ7NaB1p
	rHmDoz8a9jUrDEQhj5omVR2FOk7kXD9Z8mdk3
X-Google-Smtp-Source: AGHT+IHIQqlqPd7mhrQE0J88VHPMeS+xg4dBQltXEj2H6KdkRr/kDeAt8BVUKp+gSD598Mh3PsEICQ==
X-Received: by 2002:a05:600c:3ac6:b0:43d:224:86b5 with SMTP id 5b1f17b1804b1-43f3a92713cmr154537205e9.4.1744728178811;
        Tue, 15 Apr 2025 07:42:58 -0700 (PDT)
Message-ID: <a8a23afe-ae62-4b88-bf53-db2e1ada164d@suse.com>
Date: Tue, 15 Apr 2025 16:42:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/14] xen/riscv: add external interrupt handling for
 hypervisor mode
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
 <1685488b8c1b48149e94bd3625c7b46b78c72e8e.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1685488b8c1b48149e94bd3625c7b46b78c72e8e.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> Implement functions necessarry to have working external interrupts in
> hypervisor mode. The following changes are done:
>  - Add a common function intc_handle_external_irq() to call APLIC specific
>    function to handle an interrupt.
>  - Update do_trap() function to handle IRQ_S_EXT case; add the check to catch
>    case when cause of trap is an interrupt.
>  - Add handle_interrrupt() member to intc_hw_operations structure.
>  - Enable local interrupt delivery for IMSIC by implementation and calling of
>    imsic_ids_local_delivery() in imsic_init();

Ah, here is where that call really belongs (see my question on the earlier
patch). Please make sure you series builds okay at every patch boundary.

> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -261,6 +261,21 @@ static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
>      spin_unlock(&aplic.lock);
>  }
>  
> +static void aplic_handle_interrupt(unsigned long cause, struct cpu_user_regs *regs)
> +{
> +    /* disable to avoid more external interrupts */
> +    csr_clear(CSR_SIE, 1UL << IRQ_S_EXT);

Didn't I see you use BIT() elsewhere? Would be nice to be overall consistent
at least within related code.

> +    /* clear the pending bit */
> +    csr_clear(CSR_SIP, 1UL << IRQ_S_EXT);
> +
> +    /* dispatch the interrupt */
> +    do_IRQ(regs, csr_swap(CSR_STOPEI, 0) >> TOPI_IID_SHIFT);
> +
> +    /* enable external interrupts */
> +    csr_set(CSR_SIE, 1UL << IRQ_S_EXT);
> +}

Why does "cause" need passing into here? I realize the function is used ...

> @@ -278,6 +293,7 @@ static const struct intc_hw_operations aplic_ops = {
>      .host_irq_type       = &aplic_host_irq_type,
>      .set_irq_priority    = aplic_set_irq_priority,
>      .set_irq_type        = aplic_set_irq_type,
> +    .handle_interrupt    = aplic_handle_interrupt,
>  };

... as a hook, yet it's still unclear whether (why) any other such hook
would need the cause to be passed in.

> @@ -33,6 +44,20 @@ do {                            \
>      csr_clear(CSR_SIREG, v);    \
>  } while (0)
>  
> +void imsic_ids_local_delivery(bool enable)

__init as long as the sole caller is such?

> --- a/xen/arch/riscv/include/asm/intc.h
> +++ b/xen/arch/riscv/include/asm/intc.h
> @@ -34,6 +34,8 @@ struct intc_hw_operations {
>      /* Set IRQ priority */
>      void (*set_irq_priority)(struct irq_desc *desc, unsigned int priority);
>  
> +    /* handle external interrupt */
> +    void (*handle_interrupt)(unsigned long cause, struct cpu_user_regs *regs);
>  };
>  
>  void intc_preinit(void);
> @@ -45,4 +47,7 @@ void register_intc_ops(const struct intc_hw_operations *ops);
>  struct irq_desc;
>  void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
>  
> +struct cpu_user_regs;

This is too late - you've used it above already. It either can be dropped,
or needs to move up.

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -51,6 +51,13 @@ static void intc_set_irq_priority(struct irq_desc *desc, unsigned int priority)
>      intc_hw_ops->set_irq_priority(desc, priority);
>  }
>  
> +void intc_handle_external_irqs(unsigned long cause, struct cpu_user_regs *regs)
> +{
> +    ASSERT(intc_hw_ops && intc_hw_ops->handle_interrupt);

I don't view such checks (on every interrupt) as very useful. If you checked
once early on - okay. But here you gain nothing at all ...

> +    intc_hw_ops->handle_interrupt(cause, regs);

... towards the use here, when considering a release build.


> @@ -83,3 +87,42 @@ void __init init_IRQ(void)
>      if ( init_irq_data() < 0 )
>          panic("initialization of IRQ data failed\n");
>  }
> +
> +/* Dispatch an interrupt */
> +void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
> +{
> +    struct irq_desc *desc = irq_to_desc(irq);
> +    struct irqaction *action;
> +
> +    irq_enter();
> +
> +    spin_lock(&desc->lock);
> +    desc->handler->ack(desc);
> +
> +    if ( test_bit(_IRQ_DISABLED, &desc->status) )
> +        goto out;
> +
> +    set_bit(_IRQ_INPROGRESS, &desc->status);

Same comment as on the earlier patch - atomic bitop when in a suitably
locked region?

> +    action = desc->action;
> +
> +    spin_unlock_irq(&desc->lock);
> +
> +#ifndef CONFIG_IRQ_HAS_MULTIPLE_ACTION

Stolen from Arm? What's this about?

> +    action->handler(irq, action->dev_id);
> +#else
> +    do {
> +        action->handler(irq, action->dev_id);
> +        action = action->next;
> +    } while ( action );
> +#endif /* CONFIG_IRQ_HAS_MULTIPLE_ACTION */
> +
> +    spin_lock_irq(&desc->lock);
> +
> +    clear_bit(_IRQ_INPROGRESS, &desc->status);

See above.

> +out:

Nit (you know what).

> @@ -128,6 +129,23 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>          }
>          fallthrough;
>      default:
> +        if ( cause & CAUSE_IRQ_FLAG )
> +        {
> +            /* Handle interrupt */
> +            unsigned long icause = cause & ~CAUSE_IRQ_FLAG;
> +
> +            switch ( icause )
> +            {
> +            case IRQ_S_EXT:
> +                intc_handle_external_irqs(cause, cpu_regs);
> +                break;
> +            default:

Nit: Blank line please between non-fall-through case blocks.

Jan

