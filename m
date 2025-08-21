Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323B5B2FFCA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089017.1446714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7yk-0008Et-In; Thu, 21 Aug 2025 16:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089017.1446714; Thu, 21 Aug 2025 16:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7yk-0008Bs-FT; Thu, 21 Aug 2025 16:17:30 +0000
Received: by outflank-mailman (input) for mailman id 1089017;
 Thu, 21 Aug 2025 16:17:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8p+=3B=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1up7yi-0007da-Ef
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:17:28 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54a1599d-7eaa-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 18:17:27 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-55ce4b9c904so1354112e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 09:17:27 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55e033fc2e8sm1170025e87.59.2025.08.21.09.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 09:17:25 -0700 (PDT)
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
X-Inumbo-ID: 54a1599d-7eaa-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755793047; x=1756397847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=89T6IqPfnv7RFWXCDNCBs5SoML2g4ic7Se5imZo4w08=;
        b=W70rwt1Bm6A5lkGZaNQSlkH0cAOPzd1oECm1XQQxObHOcJ9P9SzMZ3OBNllKJHD3dH
         ZZzAZ5ZCn4lXgGwU/oJztQcLHsrV20lWW51BYPaOXGyJX4DMXPZJOcxZIFEW1ezEc3JZ
         PIdyeGvOp3YalIDn2ECPksUlaAJKlsuV1/dkE+2x8xaWHiqzMv5ksFtit58XWxaf/Bwc
         F/paSZ50v+oV+fsFshljhB82ElPOORwPGVrdm7Dqodk5i9/FSW1Spo24PqvcsuXIwJcj
         KXlaPhhPIM/lgdhaAZe8jScfo4/Jhuv+7ivxLAorYl8y6SnxaxaEkF9PgijdX7rq5PQh
         vd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755793047; x=1756397847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89T6IqPfnv7RFWXCDNCBs5SoML2g4ic7Se5imZo4w08=;
        b=Hka9B8yGfxlhtSlZYHqsxnkIseBI1DT4jIrMs2aIHUd5bGDcVRCgnMyU5hr5fh6JHH
         tbxQlaVL0pUJyxSvF68jyGyQOBMBV7U/rNkUyKrFZyPPF7m6zenk5D8dnlKZ0ARNnWP1
         0ekF4zfx3c1prx36N1OONys0YAVEKV6wdMTQH7SisMKiw0eiY16LZusCEZrfUbNYFHPX
         Fv3t/Eb9k9bre97FUIfkLRTuby4dcOhj1BJ7p/A48ywqVND4J3bmAJOh1ElqpzE8Xlhz
         PfENn1V6z01/lu4GPVLrq0Jcy4bbnD/QduBQ5bnUTZzwBGVjRvhLnuRGcm/toxNc40+E
         Mr7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdjXo7Q080TXXFQDy5J+CUc3N1jyFHuZzpo7zP+mNJJ6P0xGxgxrfN+rVwcCqCEszRiS2pdRGykHk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuAgUIxhC/jPoED+AdVNFUxPZg8bMBGgIwD3PrGtdN1Y6wEktR
	AanAUDuSUGnUtlSNvlTofytE4l8GhUZ8FbSxu70HL+/14yzMZ2gKwnJs
X-Gm-Gg: ASbGncsOnn4usVkM/OvlwXcjHaYdadP44jiXEJ2vAqXcR8lfBHYJVYn0rrZ2mI0DkY7
	xDKw7WK5/Vd4OVsdyh3GYX6WiZyO3ZrqWGYgJ0aSmV1nt006WHEMxvNubAJpna8bk0QZPHGSd9t
	xzBeHogbATDBDyDV7WarzBa23n+91X8sjBqulcfvUZYTiOslZqxrGq4oEVyyf4S/nWIGuRdu+eL
	r0/27sWOuAmBX+pw0LKFqj52/LM/71wAeHSWj07JN9xEQX7klWl6LeB6Cxcy+ThfzG7rK/77yp9
	xY1eeiS4VgQVqdE3qfjuxgupVZil/gPOBa7KHCvSHYdQSFmU/Em3ey9CPr99U4wb754P6FohQu+
	aFyRZmIC/uJkT+l06Kv44S4Ipag==
X-Google-Smtp-Source: AGHT+IFEaiXKRlNyU6o6fI8sIRDNGjGzT2luqN10miJgdQmJQjsEk0BoS9+Q6Ch4ob3Hc9Dn2CPLLQ==
X-Received: by 2002:a05:6512:1582:b0:550:e8b6:6996 with SMTP id 2adb3069b0e04-55e0da05dc5mr864674e87.2.1755793046690;
        Thu, 21 Aug 2025 09:17:26 -0700 (PDT)
Message-ID: <9b69298d-dda1-4996-a5f9-8a1b5db826b7@gmail.com>
Date: Thu, 21 Aug 2025 19:17:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <3ba2381b4c782a5187161f9418e5a35e7916c752.1754568795.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <3ba2381b4c782a5187161f9418e5a35e7916c752.1754568795.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.08.25 15:33, Leonid Komarianskyi wrote:

Hello Leonid


> Implemented support for GICv3.1 extended SPI registers for vGICv3,
> allowing the emulation of eSPI-specific behavior for guest domains.
> The implementation includes read and write emulation for eSPI-related
> registers (e.g., GICD_ISENABLERnE, GICD_IROUTERnE, and others),
> following a similar approach to the handling of regular SPIs.
> 
> The eSPI registers, previously located in reserved address ranges,
> are now adjusted to support MMIO read and write operations correctly
> when CONFIG_GICV3_ESPI is enabled.
> 
> The availability of eSPIs and the number of emulated extended SPIs
> for guest domains is reported by setting the appropriate bits in the
> GICD_TYPER register, based on the number of eSPIs requested by the
> domain and supported by the hardware. In cases where the configuration
> option is disabled, the hardware does not support eSPIs, or the domain
> does not request such interrupts, the functionality remains unchanged.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> 
> ---
> Changes in V2:
> - add missing rank index conversion for pending and inflight irqs
> ---
>   xen/arch/arm/vgic-v3.c | 248 ++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 245 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 4369c55177..1cacbb6e43 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -111,7 +111,7 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_rank *rank,
>    * Note the offset will be aligned to the appropriate boundary.
>    */
>   static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *rank,
> -                               unsigned int offset, uint64_t irouter)
> +                               unsigned int offset, uint64_t irouter, bool espi)
>   {
>       struct vcpu *new_vcpu, *old_vcpu;
>       unsigned int virq;
> @@ -123,7 +123,8 @@ static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *rank,
>        * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
>        * never call this function.
>        */
> -    ASSERT(virq >= 32);
> +    if ( !espi )
> +        ASSERT(virq >= 32);
>   
>       /* Get the index in the rank */
>       offset = virq & INTERRUPT_RANK_MASK;
> @@ -146,6 +147,11 @@ static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *rank,
>       /* Only migrate the IRQ if the target vCPU has changed */
>       if ( new_vcpu != old_vcpu )
>       {
> +#ifdef CONFIG_GICV3_ESPI
> +        /* Convert virq index to eSPI range */
> +        if ( espi )
> +            virq = ESPI_IDX2INTID(virq);
> +#endif
>           if ( vgic_migrate_irq(old_vcpu, new_vcpu, virq) )
>               write_atomic(&rank->vcpu[offset], new_vcpu->vcpu_id);
>       }
> @@ -685,6 +691,9 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>       {
>       case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>       case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +#endif
>           /* We do not implement security extensions for guests, read zero */
>           if ( dabt.size != DABT_WORD ) goto bad_width;
>           goto read_as_zero;
> @@ -710,11 +719,19 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>       /* Read the pending status of an IRQ via GICD/GICR is not supported */
>       case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
>       case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +#endif
>           goto read_as_zero;
>   
>       /* Read the active status of an IRQ via GICD/GICR is not supported */
>       case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>       case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +#endif
>           goto read_as_zero;
>   
>       case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
> @@ -752,6 +769,61 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>           return 1;
>       }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +        if ( dabt.size != DABT_WORD ) goto bad_width;


NIT: If I am not mistaken, the goto should be on the next line (here and 
in similar places throughout the added code).

> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT_WORD);
> +        if ( rank == NULL ) goto read_as_zero;
> +        vgic_lock_rank(v, rank, flags);
> +        *r = vreg_reg32_extract(rank->ienable, info);
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +        if ( dabt.size != DABT_WORD ) goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT_WORD);
> +        if ( rank == NULL ) goto read_as_zero;
> +        vgic_lock_rank(v, rank, flags);
> +        *r = vreg_reg32_extract(rank->ienable, info);
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
> +    {
> +        uint32_t ipriorityr;
> +        uint8_t rank_index;
> +
> +        if ( dabt.size != DABT_BYTE && dabt.size != DABT_WORD ) goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DABT_WORD);
> +        if ( rank == NULL ) goto read_as_zero;
> +        rank_index = REG_RANK_INDEX(8, reg - GICD_IPRIORITYRnE, DABT_WORD);
> +
> +        vgic_lock_rank(v, rank, flags);
> +        ipriorityr = ACCESS_ONCE(rank->ipriorityr[rank_index]);
> +        vgic_unlock_rank(v, rank, flags);
> +
> +        *r = vreg_reg32_extract(ipriorityr, info);
> +
> +        return 1;
> +    }
> +
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
> +    {
> +        uint32_t icfgr;
> +
> +        if ( dabt.size != DABT_WORD ) goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD);
> +        if ( rank == NULL ) goto read_as_zero;
> +        vgic_lock_rank(v, rank, flags);
> +        icfgr = rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGRnE, DABT_WORD)];
> +        vgic_unlock_rank(v, rank, flags);
> +
> +        *r = vreg_reg32_extract(icfgr, info);
> +
> +        return 1;
> +    }
> +#endif
> +
>       default:
>           printk(XENLOG_G_ERR
>                  "%pv: %s: unhandled read r%d offset %#08x\n",
> @@ -782,6 +854,9 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>       {
>       case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>       case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +#endif
>           /* We do not implement security extensions for guests, write ignore */
>           goto write_ignore_32;
>   
> @@ -871,6 +946,87 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>           vgic_unlock_rank(v, rank, flags);
>           return 1;
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +        if ( dabt.size != DABT_WORD ) goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT_WORD);
> +        if ( rank == NULL ) goto write_ignore;
> +        vgic_lock_rank(v, rank, flags);
> +        tr = rank->ienable;
> +        vreg_reg32_setbits(&rank->ienable, r, info);
> +        vgic_enable_irqs(v, (rank->ienable) & (~tr), EXT_RANK_IDX2NUM(rank->index));
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +        if ( dabt.size != DABT_WORD ) goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT_WORD);
> +        if ( rank == NULL ) goto write_ignore;
> +        vgic_lock_rank(v, rank, flags);
> +        tr = rank->ienable;
> +        vreg_reg32_clearbits(&rank->ienable, r, info);
> +        vgic_disable_irqs(v, (~rank->ienable) & tr, EXT_RANK_IDX2NUM(rank->index));
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +        if ( dabt.size != DABT_WORD ) goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISPENDRnE, DABT_WORD);
> +        if ( rank == NULL ) goto write_ignore;
> +
> +        vgic_set_irqs_pending(v, r, EXT_RANK_IDX2NUM(rank->index));
> +
> +        return 1;
> +
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +        if ( dabt.size != DABT_WORD ) goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ICPENDRnE, DABT_WORD);
> +        if ( rank == NULL ) goto write_ignore;
> +
> +        vgic_check_inflight_irqs_pending(v, EXT_RANK_IDX2NUM(rank->index), r);
> +
> +        goto write_ignore;
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +        if ( dabt.size != DABT_WORD ) goto bad_width;
> +        printk(XENLOG_G_ERR
> +               "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER%d\n",

I would use ISACTIVER%dE in the printed message to distinguish between 
normal and "extended" registers (here and in similar places throughout 
the added code).

> +               v, name, r, reg - GICD_ISACTIVERnE);
> +        return 0;
> +
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +        printk(XENLOG_G_ERR
> +               "%pv: %s: unhandled word write %#"PRIregister" to ICACTIVER%d\n",
> +               v, name, r, reg - GICD_ICACTIVER);

s/GICD_ICACTIVER/GICD_ICACTIVERnE


[snip]

