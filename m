Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478D5A89E86
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 14:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953792.1348209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fgq-0003TE-4P; Tue, 15 Apr 2025 12:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953792.1348209; Tue, 15 Apr 2025 12:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fgq-0003Rc-1H; Tue, 15 Apr 2025 12:47:00 +0000
Received: by outflank-mailman (input) for mailman id 953792;
 Tue, 15 Apr 2025 12:46:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4fgo-0003RD-EI
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 12:46:58 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad63111e-19f7-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 14:46:40 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso39325645e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 05:46:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf44571fsm14020031f8f.84.2025.04.15.05.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 05:46:39 -0700 (PDT)
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
X-Inumbo-ID: ad63111e-19f7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744721200; x=1745326000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6qtk1M0Fbp8pQPfS1SbanRIc9qjjYjDd3s/DuciWMk4=;
        b=bALzM/Q4fFJowHN01Y9MFdlh70RgbO3u/dyX2fcOcXj7XpSn5RORDMUTQnIDqW9ZVX
         gDNvl51MetbmFTF6tmlWJ4SFw7xJLMJPkOpMFgs01zy6j+C2RKWmab7y/IEyeUE8uD4I
         INF7yHWOq3a1R21nWcP+DpiWDghOjpsR+fPkHzNuLD9Bk7tkwQDwUnXA45MJRHdz+7YP
         TXKz/c+PhbHAJyD6gi1kHzKYGx0vXBrOA4Hfdr0S/2Wi8LYMcJeNxtTxPicYJA1qvw1V
         A90HOYNn+7erFD9x1l0gRKXW4QJqtGdoraCT1WAtGVwYoGmV6uyX5Ejd3OIhpzhrDZEF
         7NnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721200; x=1745326000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qtk1M0Fbp8pQPfS1SbanRIc9qjjYjDd3s/DuciWMk4=;
        b=UcVvW60dHtMFHY1awanHykPd2ejcw8eagZ9aKoxH3XzQMnm58STdJ4O9f80s5GQ+8I
         ce6rwzXM53OWfS4yEnUK1nA1tqlDNIZ8qaja5ThutgK9rZfxnseObvNKRjxWoJEgy75I
         SuTVhfa5Jcm2ZeXdszxZFUcnANbZDg56pGyoqy539HAQvHHmMQ1G4cFvGybUlySCTCy2
         tk7I1CLMuloEOlxWXwViJbq0ItFtDyl1AWDSzB/FlsNNETlYMYJQa9P09S/s8gN6HDcJ
         obRvwjRz6OSJ3rdIUdGzrswGfYYXf4+x2S3FK3xU2cvxLY3OOiHZbqUb5CvbM2JdXQhL
         4mxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtHqmvP2TqPsokTibakb2jpdIrSGf26F8YNYM0jLMny1E/p+fCnuJE/FKjK9F1eF/AgiVrn0Ip4sk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNqiBtXAlNdQxzmfXGDij6Tr764nuqSXtx426j6fqu338OYJXq
	r1UWH10PXVr01aS0XOLdMZXOw/gUo2YNydZVsyCERYqFIRDAOgkZiikRIWacYA==
X-Gm-Gg: ASbGnctHS7nD4+fYI7IS95RLo1/nKynmEK1e9yuNUGP+AvknJP5OyBS7A70IxUIRZ7h
	I8feqs9ViOeubvBGYTRo4vHbxjO7R0XA3zPw7fgV2HpdiNflOFpFy2PQ4nf+ItDbtCA9hgdzmxQ
	4DKDR7uw+6b/C3a5AuHADhv6Q6vTH58zDp50N9Bv4CWF9AK21LS9tPrjH18gwnzTQGeVaIZisQO
	TQ87l4fuNWzem/EzL9NvKu8cfN4btBrrXjTB9sEap6dhlNU1dsIAnApgqxPIF+e5XTA1lguP3la
	IbmQJJ0FFOKV+c246gMuSiDpihb8GWPgJQOT0uxDMXqBYqINNPdgfrAXxswcbGHknB9FhkKdVBH
	1MQg1hTFGLkmV5wFD53x4mRfABw==
X-Google-Smtp-Source: AGHT+IE2JBd2gUdQr8gAwcIkZOWfTwJSCRN8JRvJ8fzxuKUrKIR+k9cTdyDZWiVHZTU+7zqMeot2OQ==
X-Received: by 2002:a05:600c:1d1f:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-43f3a959ffamr149052575e9.16.1744721199927;
        Tue, 15 Apr 2025 05:46:39 -0700 (PDT)
Message-ID: <35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com>
Date: Tue, 15 Apr 2025 14:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/14] xen/riscv: implementation of aplic and imsic
 operations
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
 <74a07ed7c596bbcf581010685e01bfdfa19164f5.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <74a07ed7c596bbcf581010685e01bfdfa19164f5.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> Introduce interrupt controller descriptor for host APLIC to describe
> the low-lovel hardare. It includes implementation of the following functions:
>  - aplic_irq_startup()
>  - aplic_irq_shutdown()
>  - aplic_irq_enable()
>  - aplic_irq_disable()
>  - aplic_irq_ack()
>  - aplic_host_irq_end()
>  - aplic_set_irq_affinity()
> 
> As APLIC is used in MSI mode it requires to enable/disable interrupts not
> only for APLIC but also for IMSIC. Thereby for the purpose of
> aplic_irq_{enable,disable}() it is introduced imsic_irq_{enable,disable)().
> 
> For the purpose of aplic_set_irq_affinity() aplic_get_cpu_from_mask() is
> introduced to get hart id.
> 
> Also, introduce additional interrupt controller h/w operations and
> host_irq_type for APLIC:
>  - aplic_host_irq_type
>  - aplic_set_irq_priority()
>  - aplic_set_irq_type()

Yet these two functions nor the hooks they're used to populate are entirely
unused here. Since they're also outside of the common IRQ handling machinery,
it's unclear how one would sanely ack such a change.

> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -15,6 +15,7 @@
>  #include <xen/irq.h>
>  #include <xen/mm.h>
>  #include <xen/sections.h>
> +#include <xen/spinlock.h>
>  #include <xen/types.h>
>  #include <xen/vmap.h>
>  
> @@ -110,9 +111,173 @@ static int __init aplic_init(void)
>      return 0;
>  }
>  
> -static const struct intc_hw_operations __ro_after_init aplic_ops = {
> +static void aplic_set_irq_type(struct irq_desc *desc, unsigned int type)
> +{
> +    unsigned int irq = desc->irq - 1;

Why this adjustment by 1 (and yet both items being named "irq")?

> +    spin_lock(&aplic.lock);
> +    switch(type) {
> +        case IRQ_TYPE_EDGE_RISING:

Nit (style): Missing blanks, brace on its own line, case labels indented
like their containing switch().

> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_EDGE_RISE;
> +            break;
> +        case IRQ_TYPE_EDGE_FALLING:

Blank lines please between non-fall-through case blocks.

> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_EDGE_FALL;
> +            break;
> +        case IRQ_TYPE_LEVEL_HIGH:
> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_LEVEL_HIGH;
> +            break;
> +        case IRQ_TYPE_LEVEL_LOW:
> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_LEVEL_LOW;
> +            break;
> +        default:
> +            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_INACTIVE;
> +            break;

Is the default: label legitimate to be reached?

> +    }
> +    spin_unlock(&aplic.lock);
> +}
> +
> +static void aplic_set_irq_priority(struct irq_desc *desc,
> +                                   unsigned int priority)
> +{
> +    /* No priority, do nothing */
> +}

Since the function dopes nothing, wouldn't it be better to omit it and have
the (future) caller check for a NULL pointer ahead of making the (indirect)
call? Same remark for other handlers (below) which also do nothing.

> +static void aplic_irq_enable(struct irq_desc *desc)
> +{
> +    unsigned long flags;
> +
> +    /*
> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
> +     *       If APLIC without MSI interrupts is required in the future,
> +     *       this function will need to be updated accordingly.
> +     */
> +    ASSERT(aplic.imsic_cfg->is_used);

Such an extra field, used only for assertions, is pretty odd. Can't you
use any of the other fields to achieve the same effect?

> +    ASSERT(spin_is_locked(&desc->lock));

If this lock (which is an IRQ-safe one) is necessarily held, ...

> +    spin_lock_irqsave(&aplic.lock, flags);

... you can use just spin_lock() here.

> +    clear_bit(_IRQ_DISABLED, &desc->status);

Why an atomic bitop when desc is locked? (And yes, I ought to raise the same
question on Arm code also doing so.)

I'm uncertain about this bit setting anyway - on x86 we would only fiddle
with it for IRQs not in use, not while enabling/disabling one.

In any event this can be done outside of the APLIC-locked region, I think.

> +    /* enable interrupt in IMSIC */

May I remind you of Xen comment style?

> +    imsic_irq_enable(desc->irq);
> +
> +    /* enable interrupt in APLIC */
> +    aplic.regs->setienum = desc->irq;

Are you sure you want to use plain assignments for MMIO accesses? I'd have
expected writel() to be used here. (And only later I realized that I didn't
spot the same already higher up from here.)

From the vague understanding I've gained so far: Isn't the APLIC closer to
the CPU and the IMSIC closer to the device? If so, wouldn't you want to
enable at the APLIC before enabling at the IMSIC? But of course that also
depends on what exactly happens in the window while one is already enabled
and the other is still disabled. (Later) From the code you add to imsic.c
it looks like it's the other way around, as the IMSIC is accessed through
CSRs.

> +    spin_unlock_irqrestore(&aplic.lock, flags);
> +}
> +
> +static void aplic_irq_disable(struct irq_desc *desc)
> +{
> +    unsigned long flags;
> +
> +    /*
> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
> +     *       If APLIC without MSI interrupts is required in the future,
> +     *       this function will need to be updated accordingly.
> +     */
> +    ASSERT(aplic.imsic_cfg->is_used);
> +
> +    ASSERT(spin_is_locked(&desc->lock));
> +
> +    spin_lock_irqsave(&aplic.lock, flags);
> +
> +    set_bit(_IRQ_DISABLED, &desc->status);
> +
> +    /* disable interrupt in APLIC */
> +    aplic.regs->clrienum = desc->irq;
> +
> +    /* disable interrupt in IMSIC */
> +    imsic_irq_disable(desc->irq);
> +
> +    spin_unlock_irqrestore(&aplic.lock, flags);
> +}
> +
> +static unsigned int aplic_irq_startup(struct irq_desc *desc)
> +{
> +    aplic_irq_enable(desc);
> +
> +    return 0;
> +}
> +
> +static void aplic_irq_shutdown(struct irq_desc *desc)
> +{
> +    aplic_irq_disable(desc);
> +}

You don't really need a separate hook function here, do you?

> +static void aplic_irq_ack(struct irq_desc *desc)
> +{
> +    /* nothing to do */
> +}
> +
> +static void aplic_host_irq_end(struct irq_desc *desc)

What's the "host" in the identifier about?

> +{
> +    /* nothing to do */
> +}
> +
> +static unsigned int aplic_get_cpu_from_mask(const cpumask_t *cpumask)
> +{
> +    unsigned int cpu;

No real need for this variable?

> +    cpumask_t possible_mask;
> +
> +    cpumask_and(&possible_mask, cpumask, &cpu_possible_map);
> +    cpu = cpumask_any(&possible_mask);

Why would you use cpu_possible_map here? That includes any offline CPUs.
I think you need to use cpu_online_map here.

> +    return cpu;
> +}
> +
> +static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
> +{
> +    unsigned int cpu;
> +    uint64_t group_index, base_ppn;
> +    uint32_t hhxw, lhxw ,hhxs, value;
> +    const struct imsic_config *imsic = aplic.imsic_cfg;
> +
> +    /*
> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
> +     *       If APLIC without MSI interrupts is required in the future,
> +     *       this function will need to be updated accordingly.
> +     */
> +    ASSERT(aplic.imsic_cfg->is_used);

Use the local variable you have made yourself?

> +    ASSERT(!cpumask_empty(mask));
> +
> +    spin_lock(&aplic.lock);

Aiui the lock can be acquired quite a bit later. It ought to be needed only
around the actual write to the hardware register.

> +    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
> +    hhxw = imsic->group_index_bits;
> +    lhxw = imsic->hart_index_bits;
> +    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
> +    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
> +
> +    /* update hart and EEID in the target register */
> +    group_index = (base_ppn >> (hhxs + 12)) & (BIT(hhxw, UL) - 1);

What's this magic 12 in here? Not IMSIC_MMIO_PAGE_SHIFT I suppose?

> +    value = desc->irq;
> +    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
> +    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT) ;
> +    aplic.regs->target[desc->irq - 1] = value;
> +
> +    spin_unlock(&aplic.lock);
> +}
> +
> +static hw_irq_controller aplic_host_irq_type = {

const?

> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -14,12 +14,68 @@
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/macros.h>
> +#include <xen/spinlock.h>
>  #include <xen/xmalloc.h>
>  
>  #include <asm/imsic.h>
>  
>  static struct imsic_config imsic_cfg;
>  
> +#define imsic_csr_set(c, v)     \
> +do {                            \
> +    csr_write(CSR_SISELECT, c); \
> +    csr_set(CSR_SIREG, v);      \
> +} while (0)
> +
> +#define imsic_csr_clear(c, v)   \
> +do {                            \
> +    csr_write(CSR_SISELECT, c); \
> +    csr_clear(CSR_SIREG, v);    \
> +} while (0)
> +
> +static void imsic_local_eix_update(unsigned long base_id, unsigned long num_id,
> +                                   bool pend, bool val)
> +{
> +    unsigned long i, isel, ireg;

These can be constrained to inside the outer loop below.

> +    unsigned long id = base_id, last_id = base_id + num_id;
> +
> +    while ( id < last_id )
> +    {
> +        isel = id / __riscv_xlen;
> +        isel *= __riscv_xlen / IMSIC_EIPx_BITS;
> +        isel += (pend) ? IMSIC_EIP0 : IMSIC_EIE0;

Nit: Why the parentheses?

> +        ireg = 0;
> +        for ( i = id & (__riscv_xlen - 1);
> +              (id < last_id) && (i < __riscv_xlen);
> +              i++, id++ )
> +            ireg |= (1 << i);

I wonder if this calculation really needs a loop. Afaict it's just a
consecutive set of bits you mean to set.

> +        if ( val )
> +            imsic_csr_set(isel, ireg);
> +        else
> +            imsic_csr_clear(isel, ireg);
> +    }
> +}
> +
> +void imsic_irq_enable(unsigned int hwirq)
> +{
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&imsic_cfg.lock, flags);
> +    imsic_local_eix_update(hwirq, 1, false, true);

No subtraction of 1 here? Also, why "hwirq" and not just "irq"?

> +    spin_unlock_irqrestore(&imsic_cfg.lock, flags);
> +}
> +
> +void imsic_irq_disable(unsigned int hwirq)
> +{
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&imsic_cfg.lock, flags);
> +    imsic_local_eix_update(hwirq, 1, false, false);
> +    spin_unlock_irqrestore(&imsic_cfg.lock, flags);
> +}
> +
>  const struct imsic_config *imsic_get_config(void)
>  {
>      return &imsic_cfg;
> @@ -277,6 +333,13 @@ int __init imsic_init(struct dt_device_node *node)
>          goto imsic_init_err;
>      }
>  
> +    spin_lock_init(&imsic_cfg.lock);
> +
> +    /* Enable local interrupt delivery */
> +    imsic_ids_local_delivery(true);

What's this? I can't find the function/macro here, nor in patch 08, nor in
staging.

Jan

