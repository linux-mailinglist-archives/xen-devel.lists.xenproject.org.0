Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071CDAC1070
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 17:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994350.1377390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI8H4-0003iL-Mn; Thu, 22 May 2025 15:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994350.1377390; Thu, 22 May 2025 15:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI8H4-0003fj-Ji; Thu, 22 May 2025 15:56:02 +0000
Received: by outflank-mailman (input) for mailman id 994350;
 Thu, 22 May 2025 15:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI8H3-0003fb-0D
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 15:56:01 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40cb1305-3725-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 17:55:59 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac34257295dso1320341266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 08:55:58 -0700 (PDT)
Received: from [10.0.5.8] ([213.235.133.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d498914sm1081890666b.151.2025.05.22.08.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 08:55:58 -0700 (PDT)
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
X-Inumbo-ID: 40cb1305-3725-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747929358; x=1748534158; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6N45kppNUXEw61TvIEL2O5MfJPLFBwbUFCC1akRvRg=;
        b=ZM07FmeIl0qsSkuyrf/UZhsZ2gVu7tEgSDIjthd7yS00mF6Q78za5usPr4BQiIgG3g
         LG+SVMJRtk8pUMGcvbSz32AuUW+QDo1xD3pch0tCRLoUDikhqusbRFdjym0twHtoFIsa
         vWW4QJEob1Qc0RGCgmMlBdL2wsSeKhogaTcd0QQDAgbHKbRHZ6TYa92OAEVhyrEYVVBr
         YCVny1iYdUOZo6YfUefjKzj4EuDvSO1ccmvUwp/FN9qbcqLM6qTGCyU7mrlldQMs/iAH
         B2i8t8slZjICz7gzeu9/Kfq+2gfHLthIrutT8Tg8VRA1xV2/EnpPpa0Abueyw7dCOLYB
         gv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747929358; x=1748534158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6N45kppNUXEw61TvIEL2O5MfJPLFBwbUFCC1akRvRg=;
        b=RGRFBd4spntOqokU9wq6tCO0Rce77JgCmoxaHZSx5qkjCQNRJDAO7DnqodwgZAVwd5
         P3DMEdP4mVIWHWTYwyYxt7JmBOdRZEhe2qdQTtFwIeH/mSNoFpnBP+RmNHgy9jvB8voB
         1vM5qaJXcv6OVQ7ONCIzo5IVyKLb4UZDGHtpay9o1F/3XTzyoVY0bcG5sdJ9EvyRU69D
         FTzT+aQHR4F/2E4x25a39aPYRQISDTQgYyi16ygXkspo+YQtZAjQBknWlv9el7acp2D2
         mLfWjVk8GfLJ+6NkyuvVjloEbnpoKaRFrL0fMQoP+ay2WRzw+lzEpID/bZ8+NXOk86OG
         zd4g==
X-Forwarded-Encrypted: i=1; AJvYcCWJfIX8W7J7laApAbsSEYyy7Ng8borS4bXC3bfwowk+A6KObwbQEC6mqbw8LZYRz8a1xYsmNqN0+hM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQh5MDsvRpIWfwVbknE8CD1eQqUT8yxA3c8VnIMeorV2OOhO9T
	2CzxpwybxJeW09Ko9yuVeGipC1LF8j3cAkgEY0OArObgp5O1d5pvcxco3hUv9MUjwA==
X-Gm-Gg: ASbGnctmrK6d3YeHXfALjiOZKwtk9pHMEAjYczsNhjFOVK78kgqgDBfRry/amOlBFwG
	efKU3WHvPzlyIXJ0BbMpv5dQI1pwPljeQTo5l2E2wpD8lymJIvLmFJMWS2MLsJmq7WtnNA1F6A7
	gwdO2Qr8qCQbjUleoZj+pdGsa3D6D6icIttbf6o9Gfk2pKaOfpEYlC5rXIoEtW4toPV2D0g2jtL
	nzTfRh2lJxdEt/xHVVC7PhmV+dt1f/ARvGsuWpKpx99vUDlcOv+m+rRE8GRO8ERPed7bWG99wpH
	pN41HIdQnk/jg8+2G+Q=
X-Google-Smtp-Source: AGHT+IHuAfzgm88bWv6ns1K507Hufo1vcHk3/ptzembOI0UZj1Kkzp1h9jOBUYAPUX+1tEAHqhycoA==
X-Received: by 2002:a17:907:7b99:b0:ad5:2719:f6ae with SMTP id a640c23a62f3a-ad52d4cc604mr2475527366b.20.1747929358267;
        Thu, 22 May 2025 08:55:58 -0700 (PDT)
Message-ID: <26893680-4467-4e42-89e5-b9020529f03d@suse.com>
Date: Thu, 22 May 2025 17:55:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] xen/riscv: implementation of aplic and imsic
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
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <33f0952f0d05e4fe8fff926df31987e006c6eacf.1747843009.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <33f0952f0d05e4fe8fff926df31987e006c6eacf.1747843009.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.05.2025 18:03, Oleksii Kurochko wrote:
> +static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
> +{
> +    unsigned int cpu;
> +    uint64_t group_index, base_ppn;
> +    uint32_t hhxw, lhxw ,hhxs, value;

Nit: Comma vs blank placement.

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
> +    ASSERT(spin_is_locked(&desc->lock));
> +
> +    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
> +    hhxw = imsic->group_index_bits;
> +    lhxw = imsic->hart_index_bits;
> +    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
> +    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
> +
> +    /* Update hart and EEID in the target register */
> +    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) & (BIT(hhxw, UL) - 1);

Nit: Line length.

I'm also puzzled by the various uses of IMSIC_MMIO_PAGE_SHIFT. Why do you
subtract double the value when calculating hhxs, just to add the value
back in here? There's no other usee of the variable afaics.

> +    value = desc->irq;
> +    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
> +    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT) ;

Nit: Stray blank.

> +    spin_lock(&aplic.lock);
> +
> +    writel(value, &aplic.regs->target[desc->irq - 1]);
> +
> +    spin_unlock(&aplic.lock);
> +}
> +
> +static const hw_irq_controller aplic_xen_irq_type = {
> +    .typename     = "aplic",
> +    .startup      = aplic_irq_startup,
> +    .shutdown     = aplic_irq_disable,
> +    .enable       = aplic_irq_enable,
> +    .disable      = aplic_irq_disable,
> +    .set_affinity = aplic_set_irq_affinity,

As indicated before, for functions you use as hooks you want to save
yourself (or someone else) future work by marking them cf_check right
away.

> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -22,7 +22,124 @@
>  
>  #include <asm/imsic.h>
>  
> -static struct imsic_config imsic_cfg;
> +static struct imsic_config imsic_cfg = {
> +    .lock = SPIN_LOCK_UNLOCKED,
> +};
> +
> +#define IMSIC_DISABLE_EIDELIVERY    0
> +#define IMSIC_ENABLE_EIDELIVERY     1
> +#define IMSIC_DISABLE_EITHRESHOLD   1
> +#define IMSIC_ENABLE_EITHRESHOLD    0
> +
> +#define imsic_csr_write(c, v)   \
> +do {                            \
> +    csr_write(CSR_SISELECT, c); \
> +    csr_write(CSR_SIREG, v);    \
> +} while (0)
> +
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
> +void __init imsic_ids_local_delivery(bool enable)
> +{
> +    if ( enable )
> +    {
> +        imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_ENABLE_EITHRESHOLD);
> +        imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_ENABLE_EIDELIVERY);
> +    }
> +    else
> +    {
> +        imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_DISABLE_EITHRESHOLD);
> +        imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_DISABLE_EIDELIVERY);
> +    }
> +}
> +
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

Any reason you open-code min() here?

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
> +    /*
> +    * The only caller of imsic_irq_enable() is aplic_irq_enable(), which
> +    * already runs with IRQs disabled. Therefore, there's no need to use
> +    * spin_lock_irqsave() in this function.
> +    *
> +    * This ASSERT is added as a safeguard: if imsic_irq_enable() is ever
> +    * called from a context where IRQs are not disabled,
> +    * spin_lock_irqsave() should be used instead of spin_lock().
> +    */
> +    ASSERT(!local_irq_is_enabled());
> +
> +    spin_lock(&imsic_cfg.lock);
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
> +     * APLIC's sourcecfg which starts from 0.
> +     */
> +    imsic_local_eix_update(irq, 1, false, true);
> +    spin_unlock(&imsic_cfg.lock);
> +}
> +
> +void imsic_irq_disable(unsigned int irq)
> +{
> +   /*
> +    * The only caller of imsic_irq_disable() is aplic_irq_enable(), which

s/enable/disable/ ?

Jan

