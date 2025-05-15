Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BAFAB831D
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:44:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985100.1371038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFV8h-0001he-Ef; Thu, 15 May 2025 09:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985100.1371038; Thu, 15 May 2025 09:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFV8h-0001g6-AY; Thu, 15 May 2025 09:44:31 +0000
Received: by outflank-mailman (input) for mailman id 985100;
 Thu, 15 May 2025 09:44:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFV8f-0001g0-CS
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:44:29 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 316f2d77-3171-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 11:44:28 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5f62d3ed994so1424045a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:44:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d700e7csm9901963a12.64.2025.05.15.02.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 02:44:27 -0700 (PDT)
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
X-Inumbo-ID: 316f2d77-3171-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747302267; x=1747907067; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XnaLqIzvB2VepRjJNZ921o6jCIyEtyXOvZEYuyCEd6I=;
        b=Nz9bH4hSSH65NyXfHM4Ua6OQvfy4kPGi5ofxMb1bCKPXV/3EKN7XFalQaCPEUed1V0
         AZBUBRjslBkQ1wb5XsCKYozKAZA9dpygM00wyOmRqugE+uRtsB7KqLJDhjQAbNGv9mce
         66CO2mDqbzl3cU8rAKzcVUtMrxPv8WaMJcrj781nMQSbB36RjlQetj43nqHRaFUmi7H/
         RGPBkl6+PMKDUrJpBdYLBxWSDgVCVoDc1/ba6tU6utTD8qS7BZuzkCJlbtrZfyRmqPxU
         60/slFt7k0oxAxLLQ7BrWCqCpONRAvMTuCLxbgKHXeup3+gNDwTIHRX+VlGcog4CHEHp
         GHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747302267; x=1747907067;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnaLqIzvB2VepRjJNZ921o6jCIyEtyXOvZEYuyCEd6I=;
        b=uuGbM1Co9ZmbqQrOsyoLfD3oNzWHVGBDl6LmRlaWPt3YZEHyOqsDnDqUoInEA0J+/p
         +SoHmFJypkrHQnavmO2Z7wMUKq2E+c5FpiXYeyFTgsF3QU53mHS+XxhTEUqJmRWOKS0k
         /Jr19uy8FlLH4ASGh8THEJ1D1HLxE+/m+divPAKKfC21l6g/7EM6vY/6RT5qy2x92Oky
         anV8vkFSZSdfHPk6uegxAiRodZW8xDxG+/BJNyeLq2MuapNxNQCQhQEEMyjLXbLdyIqZ
         oiLBfgm32iwJPc37B8e43GzSi+S1PSEJBUBNQz+AUCM3abHVQu8hRe2stNGSmdl7S1pV
         aD1w==
X-Forwarded-Encrypted: i=1; AJvYcCUv5X3ajsWWWdtofWrsh7/aKOSJn6H1T/hg7cgT2tLxehldLp6shFHELSlEGsINyVZlBO8SILFUuyo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjlbGRvh1tj8tfmM6qkkhQwsk92OqGgPsqPPgAx2KG0JEYdVaZ
	vo882Z9Wf24vJcaVxR3ljNsPn43+E8yp4eM1ThsIQnvf7Oh/WjseKAq5K240vg==
X-Gm-Gg: ASbGnct5XXXffidrFZ5G3r2N4s1mpu/gNiN8moKmqa3dVcbJO0dpsQdoNvomSrQpFx0
	EIPkXgpqr5BrKh+Z/sV/cmNvdzhbTjki1NWS2uRUEwnjhZ1OyHfp2RKHSRp2E4xkRpJCMQO/s1V
	rCHmREM98F8h3bXXv60Qr+3XinVuw7+LNknJAlgl1aFvl4EVzIrLl+NGOjk1r3e9kEv6j+9FZxu
	MUv4tp/m7iEYCZ2BJIyvhPZtJ4gkhvnKmlXKeIjfZgquEl1najoKg5J0aLmZkIsmxlNPnemTlY9
	CeoXDKJKRs0YRq2SdBsxn7vnWheujwGHecGM2IBtgZ1Xtw6AT4guoztQcN5E4vPDTpkn5fizOM8
	J1gPUR6/3XJ0lHzM/K52suaOm1vwvbNWjhRyf
X-Google-Smtp-Source: AGHT+IHIEyqVQ02tIp0rP3KTcCckfA4od3Hg57J4f/Z0Rkvp3UTfRi0HWsLPb48Q90jV66fhXH6seA==
X-Received: by 2002:a05:6402:d0e:b0:5fb:206f:784e with SMTP id 4fb4d7f45d1cf-5ff988a1ed8mr5121327a12.9.1747302267390;
        Thu, 15 May 2025 02:44:27 -0700 (PDT)
Message-ID: <bf9f3fb0-91df-4c00-af4b-87b9157e10fe@suse.com>
Date: Thu, 15 May 2025 11:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] xen/riscv: implementation of aplic and imsic
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
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <37d309520a0adb8bb3f4e51a985a2d56b669ba9e.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <37d309520a0adb8bb3f4e51a985a2d56b669ba9e.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/aplic-priv.h
> +++ b/xen/arch/riscv/aplic-priv.h
> @@ -14,6 +14,7 @@
>  #ifndef ASM__RISCV_PRIV_APLIC_H
>  #define ASM__RISCV_PRIV_APLIC_H
>  
> +#include <xen/spinlock.h>
>  #include <xen/types.h>
>  
>  #include <asm/aplic.h>
> @@ -27,6 +28,9 @@ struct aplic_priv {
>      /* registers */
>      volatile struct aplic_regs *regs;
>  
> +    /* lock */
> +    spinlock_t lock;

Nit: I don't see much value in such entirely redundant comments. Useful
contents might be to say what the lock actually is intended to guard.

> @@ -119,9 +121,118 @@ static int __init cf_check aplic_init(void)
>      return 0;
>  }
>  
> +static void aplic_irq_enable(struct irq_desc *desc)
> +{
> +    unsigned long flags;
> +
> +    /*
> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
> +     *       If APLIC without MSI interrupts is required in the future,
> +     *       this function will need to be updated accordingly.
> +     */
> +    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
> +
> +    ASSERT(spin_is_locked(&desc->lock));

Iirc I said so before: This being an IRQ-safe lock, ...

> +    spin_lock_irqsave(&aplic.lock, flags);

... there's no need to use spin_lock_irqsave() here; plain spin_lock()
will do (and avoid the need for the local variable). Same elsewhere,
obviously.

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
> +    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
> +
> +    ASSERT(!cpumask_empty(mask));
> +
> +    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
> +    hhxw = imsic->group_index_bits;
> +    lhxw = imsic->hart_index_bits;
> +    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
> +    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
> +
> +    /* Update hart and EEID in the target register */
> +    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) & (BIT(hhxw, UL) - 1);
> +    value = desc->irq;
> +    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
> +    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT) ;
> +
> +    spin_lock(&aplic.lock);
> +
> +    writel(value, &aplic.regs->target[desc->irq - 1]);
> +
> +    spin_unlock(&aplic.lock);

Hmm, interesting, here you use the plain functions, but there's no
assertion as to desc->lock being held. Such aspects would better be
consistent throughout all hooks.

> @@ -159,6 +270,8 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
>  
>      dt_irq_xlate = aplic_irq_xlate;
>  
> +    spin_lock_init(&aplic.lock);

Can't you have the struct field have a suitable initializer?

> +static void imsic_local_eix_update(unsigned long base_id, unsigned long num_id,
> +                                   bool pend, bool val)
> +{
> +    unsigned long id = base_id, last_id = base_id + num_id;
> +
> +    while ( id < last_id )
> +    {
> +        unsigned long isel, ireg;
> +        unsigned long start_id = id & (__riscv_xlen - 1);
> +        unsigned long chunk = __riscv_xlen - start_id;
> +        unsigned long count = (last_id - id < chunk) ? last_id - id : chunk;
> +
> +        isel = id / __riscv_xlen;
> +        isel *= __riscv_xlen / IMSIC_EIPx_BITS;
> +        isel += pend ? IMSIC_EIP0 : IMSIC_EIE0;
> +
> +        ireg = GENMASK(start_id + count - 1, start_id);
> +
> +        id += count;
> +
> +        if ( val )
> +            imsic_csr_set(isel, ireg);
> +        else
> +            imsic_csr_clear(isel, ireg);
> +    }
> +}
> +
> +void imsic_irq_enable(unsigned int irq)
> +{
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&imsic_cfg.lock, flags);
> +    /*
> +     * There is no irq - 1 here (look at aplic_set_irq_type()) because:
> +     * From the spec:
> +     *   When an interrupt file supports distinct interrupt identities,
> +     *   valid identity numbers are between 1 and inclusive. The identity
> +     *   numbers within this range are said to be implemented by the interrupt
> +     *   file; numbers outside this range are not implemented. The number zero
> +     *   is never a valid interrupt identity.
> +     *   ...
> +     *   Bit positions in a valid eiek register that don’t correspond to a
> +     *   supported interrupt identity (such as bit 0 of eie0) are read-only zeros.
> +     *
> +     * So in EIx registers interrupt i corresponds to bit i in comparison wiht
> +     * APLIC's sourcecfg which starts from 0. (l)

What's this 'l' in parentheses here to indicate?

> +     */
> +    imsic_local_eix_update(irq, 1, false, true);
> +    spin_unlock_irqrestore(&imsic_cfg.lock, flags);
> +}
> +
> +void imsic_irq_disable(unsigned int irq)
> +{
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&imsic_cfg.lock, flags);
> +    imsic_local_eix_update(irq, 1, false, false);
> +    spin_unlock_irqrestore(&imsic_cfg.lock, flags);
> +}

The sole caller of the function has doubly turned off IRQs already; perhaps
no need to it a 3rd time, unless other callers are to appear? Same for
imsic_irq_enable() as it looks.

> @@ -274,6 +373,11 @@ int __init imsic_init(const struct dt_device_node *node)
>          goto imsic_init_err;
>      }
>  
> +    spin_lock_init(&imsic_cfg.lock);

Again - suitable initializer for the field instead?

> --- a/xen/arch/riscv/include/asm/aplic.h
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: MIT */
>  
>  /*
> - * xen/arch/riscv/asm/include/aplic.h
> + * xen/arch/riscv/aplic.h

Please get this right when/where the file is introduced.

Jan

