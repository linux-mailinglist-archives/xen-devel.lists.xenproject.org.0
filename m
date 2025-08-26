Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0A3B37381
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 21:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095040.1450187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqzna-00040S-34; Tue, 26 Aug 2025 19:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095040.1450187; Tue, 26 Aug 2025 19:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqzna-0003yF-0K; Tue, 26 Aug 2025 19:57:42 +0000
Received: by outflank-mailman (input) for mailman id 1095040;
 Tue, 26 Aug 2025 19:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33Xc=3G=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uqznY-0003y9-M2
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 19:57:40 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb2504f9-82b6-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 21:57:39 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-333f7ebc44dso2854951fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 12:57:38 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e5ed227sm24523431fa.61.2025.08.26.12.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 12:57:36 -0700 (PDT)
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
X-Inumbo-ID: eb2504f9-82b6-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756238258; x=1756843058; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OEWv1oHUlLID01nZ0mkWBkPpWlqJrxdfqoHmsDxWk9w=;
        b=FxxFk5SQQF6D+s9k04hZM36VLPTtQmqm7Kr5rLA2f/8c/hi8yf/kZWwyH5ZqUJDzcd
         rh6KQJwWvFdurp+aV2F+uHyJXnOf9Vj8aIUZFI8aIx5LiwnqTKvERtrxqAReEzcZelSy
         USiherb2o9UGB0XrtREcItU50jP0eu3cA8n+nfk/3iTj+/sBJ2XSTnvOa123mmX2ldoj
         g+k9BrU8vvnN5dLutYp2y7O/ci9kOQ4zQwd23Rowk/c0qbbMImiPpHosnv9wCyfzNYg4
         M5nwQXLboEmwNBPnDJbalKgd0Y9y/us/cVzKZ4cLbVQzLdZ17SJa4ooUUhUXQ3C4ANjA
         kUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756238258; x=1756843058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OEWv1oHUlLID01nZ0mkWBkPpWlqJrxdfqoHmsDxWk9w=;
        b=tpY4V5xCL60R+UX+AwWwDaYENWuqT29wZWyuira6fiISPx9oQrMFYXVjonhN9ntIb4
         zX8/lyJjjfjtUTzfJX981p1GDVNXnGuMqtySEKXVmwvmfdkDCVW+zMy3/js0Busswdy5
         9xB2KqS5C21XSw/Ty30nX0wzXZ+A0/YKlaz3QRn6hr6D2Wtaf58BB5PEePlMjbwgyO9o
         ZD5Gnad4gRlu1zYukTXN8N/OGitAKE2jTWhsNQ35430sHFEsdOYuPLxL2d1ztEEtH55p
         EKadfW5YlzS9LO+bSbfkkGq/gMW3JGb667Pxf7hlXKvvgMBHZUnkKOnqzdYtmUhRuswk
         /ZIA==
X-Forwarded-Encrypted: i=1; AJvYcCWzTayx4R3J/GspCUzR/fls4nooMkxgsw5fFbcfUIOcNpSBaMIdQYQwui0SmIQP6mD+r/TSWIuSPLk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvkBklmBDtoHr7BolqS4k5RNZ2yqNd22KZKQ7FcogZ/BeCzz7e
	2v3X41itVNoQ5eav6pLKGBOUy/lYtp20LB5Wi9aaQ2hX9eRtGYPr19op
X-Gm-Gg: ASbGncsAbdIaPoBe89Uwci5YyKYYaZxhmVTSsG5jL9tDplVm8uME0ygH1FH0kMjTio6
	+GWUBtaJGMR1X4vMedy2U+lkNPaJQnc+sRZskW3YFPli8rFGzFUd90NOMGfAgDW6gDkwreSsecN
	eBdIh9OVMx27sOl16ZpVMtAL8IYgzoijFBhBEnbCgnYAY5YTKxiktdxO/DTaafHbmvxBU7m1tg+
	y9C4jsSJJyV5zmho5hGguhJtSYIS7e33HPlWS22SxMy3p48dyEy2Zft+xolC4U0056fo1p6jGND
	xoKpeIQQZM7fQkTKkfW1F2uX/OZF6Qkud7aV2GpKydv2ECEU4Q98hDGtCKAl21uat1n138NlyYB
	QLvBXLcNeK2m18WEL+R73nPkqVA==
X-Google-Smtp-Source: AGHT+IGVdW5vNitdEHivwcbHsEKa9dLaX2ny7Nnj5YWNzJmwcyL40OP//vmvKci8NMfC84/3DoyAkQ==
X-Received: by 2002:a05:651c:41cc:b0:336:5d7d:f034 with SMTP id 38308e7fff4ca-3368b720edbmr8149261fa.1.1756238257985;
        Tue, 26 Aug 2025 12:57:37 -0700 (PDT)
Message-ID: <5a84d20c-5136-4151-8801-b0fbccaf23d7@gmail.com>
Date: Tue, 26 Aug 2025 22:57:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
 <642a994d712a8c9df7aed9dec22124564db83c7e.1756216943.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <642a994d712a8c9df7aed9dec22124564db83c7e.1756216943.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26.08.25 17:05, Leonid Komarianskyi wrote:

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
> 
> Changes in V3:
> - changed vgic_store_irouter parameters - instead of offset virq is
>    used, to remove the additional bool espi parameter and simplify
>    checks. Also, adjusted parameters for regular SPI. Since the offset
>    parameter was used only for calculating virq number and then reused for
>    finding rank offset, it will not affect functionality.
> - fixed formatting for goto lables - added newlines after condition
> - fixed logs for GICD_ISACTIVERnE and GICD_ICACTIVERnE handlers
> - removed #ifdefs in 2 places where they were adjacent and could be merged
> ---
>   xen/arch/arm/vgic-v3.c | 275 +++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 266 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 4369c55177..56c539bb1b 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -111,13 +111,10 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_rank *rank,
>    * Note the offset will be aligned to the appropriate boundary.
>    */
>   static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *rank,
> -                               unsigned int offset, uint64_t irouter)
> +                               unsigned int virq, uint64_t irouter)
>   {
>       struct vcpu *new_vcpu, *old_vcpu;
> -    unsigned int virq;
> -
> -    /* There is 1 vIRQ per IROUTER */
> -    virq = offset / NR_BYTES_PER_IROUTER;
> +    unsigned int offset;
>   
>       /*
>        * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
> @@ -685,6 +682,9 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>       {
>       case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>       case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +#endif
>           /* We do not implement security extensions for guests, read zero */
>           if ( dabt.size != DABT_WORD ) goto bad_width;
>           goto read_as_zero;
> @@ -710,11 +710,19 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
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
> @@ -752,6 +760,69 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>           return 1;
>       }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +        if ( dabt.size != DABT_WORD )
> +            goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT_WORD);
> +        if ( rank == NULL )
> +            goto read_as_zero;
> +        vgic_lock_rank(v, rank, flags);
> +        *r = vreg_reg32_extract(rank->ienable, info);
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +        if ( dabt.size != DABT_WORD )
> +            goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT_WORD);
> +        if ( rank == NULL )
> +            goto read_as_zero;
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
> +        if ( dabt.size != DABT_BYTE && dabt.size != DABT_WORD )
> +            goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DABT_WORD);
> +        if ( rank == NULL )
> +            goto read_as_zero;
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
> +        if ( dabt.size != DABT_WORD )
> +            goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD);
> +        if ( rank == NULL )
> +            goto read_as_zero;
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
> @@ -782,6 +853,9 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>       {
>       case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>       case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +#endif
>           /* We do not implement security extensions for guests, write ignore */
>           goto write_ignore_32;
>   
> @@ -871,6 +945,99 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>           vgic_unlock_rank(v, rank, flags);
>           return 1;
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +        if ( dabt.size != DABT_WORD )
> +            goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT_WORD);
> +        if ( rank == NULL )
> +            goto write_ignore;
> +        vgic_lock_rank(v, rank, flags);
> +        tr = rank->ienable;
> +        vreg_reg32_setbits(&rank->ienable, r, info);
> +        vgic_enable_irqs(v, (rank->ienable) & (~tr), EXT_RANK_IDX2NUM(rank->index));
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +        if ( dabt.size != DABT_WORD )
> +            goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT_WORD);
> +        if ( rank == NULL )
> +            goto write_ignore;
> +        vgic_lock_rank(v, rank, flags);
> +        tr = rank->ienable;
> +        vreg_reg32_clearbits(&rank->ienable, r, info);
> +        vgic_disable_irqs(v, (~rank->ienable) & tr, EXT_RANK_IDX2NUM(rank->index));
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +        if ( dabt.size != DABT_WORD )
> +            goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISPENDRnE, DABT_WORD);
> +        if ( rank == NULL )
> +            goto write_ignore;
> +
> +        vgic_set_irqs_pending(v, r, EXT_RANK_IDX2NUM(rank->index));
> +
> +        return 1;
> +
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +        if ( dabt.size != DABT_WORD )
> +            goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ICPENDRnE, DABT_WORD);
> +        if ( rank == NULL )
> +            goto write_ignore;
> +
> +        vgic_check_inflight_irqs_pending(v, EXT_RANK_IDX2NUM(rank->index), r);
> +
> +        goto write_ignore;
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +        if ( dabt.size != DABT_WORD )
> +            goto bad_width;
> +        printk(XENLOG_G_ERR
> +               "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER%dE\n",
> +               v, name, r, reg - GICD_ISACTIVERnE);
> +        return 0;

Guest write access to GICD_ISACTIVER<n>E will lead to abort. But, I know 
you just repeated the logic for regular GICD_ISACTIVER<n>.


> +
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +        printk(XENLOG_G_ERR
> +               "%pv: %s: unhandled word write %#"PRIregister" to ICACTIVER%dE\n",
> +               v, name, r, reg - GICD_ICACTIVER);

s/GICD_ICACTIVER/GICD_ICACTIVERnE


> +        goto write_ignore_32;
> +
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
> +    {
> +        uint32_t *ipriorityr, priority;
> +
> +        if ( dabt.size != DABT_BYTE && dabt.size != DABT_WORD )
> +            goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DABT_WORD);
> +        if ( rank == NULL ) goto write_ignore;
> +        vgic_lock_rank(v, rank, flags);
> +        ipriorityr = &rank->ipriorityr[REG_RANK_INDEX(8, reg - GICD_IPRIORITYRnE,
> +                                                      DABT_WORD)];
> +        priority = ACCESS_ONCE(*ipriorityr);
> +        vreg_reg32_update(&priority, r, info);
> +        ACCESS_ONCE(*ipriorityr) = priority;
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +    }

NIT: emply line please (and in similar places)

> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
> +        if ( dabt.size != DABT_WORD )
> +            goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD);
> +        if ( rank == NULL )
> +            goto write_ignore;
> +        vgic_lock_rank(v, rank, flags);
> +        vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGRnE,
> +                                                     DABT_WORD)],
> +                          r, info);
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +#endif
> +
>       default:
>           printk(XENLOG_G_ERR
>                  "%pv: %s: unhandled write r%d=%"PRIregister" offset %#08x\n",
> @@ -1129,6 +1296,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>               typer |= GICD_TYPE_LPIS;
>   
>           typer |= (v->domain->arch.vgic.intid_bits - 1) << GICD_TYPE_ID_BITS_SHIFT;
> +#ifdef CONFIG_GICV3_ESPI
> +        if ( v->domain->arch.vgic.nr_espis > 0 )
> +        {
> +            /* Set eSPI support bit for the domain */
> +            typer |= GICD_TYPER_ESPI;
> +            /* Set ESPI range bits */
> +            typer |= (DIV_ROUND_UP(v->domain->arch.vgic.nr_espis, 32) - 1)
> +                       << GICD_TYPER_ESPI_RANGE_SHIFT;
> +        }
> +#endif
>   
>           *r = vreg_reg32_extract(typer, info);
>   
> @@ -1194,6 +1371,18 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>       case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>       case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
>       case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
> +#endif

GICD_IGRPMODR<n>E is missed? I guess, it should be RAZ as regular 
GICD_IGRPMODR<n>.

Also GICD_NSACR<n>E is missed, although the case for regular 
GICD_NSACR<n> is present (not visible in patch context).

>           /*
>            * Above all register are common with GICR and GICD
>            * Manage in common
> @@ -1216,7 +1405,11 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>           /* Replaced with GICR_ISPENDR0. So ignore write */
>           goto read_as_zero_32;
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(0x3100, 0x60FC):
> +#else
>       case VRANGE32(0x0F30, 0x60FC):
> +#endif
>           goto read_reserved;
>   
>       case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
> @@ -1235,8 +1428,30 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>   
>           return 1;
>       }
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
> +    {
> +        uint64_t irouter;
> +
> +        if ( !vgic_reg64_check_access(dabt) )
> +            goto bad_width;
> +        rank = vgic_ext_rank_offset(v, 64, gicd_reg - GICD_IROUTERnE,
> +                                DABT_DOUBLE_WORD);
> +        if ( rank == NULL )
> +            goto read_as_zero;
> +        vgic_lock_rank(v, rank, flags);
> +        irouter = vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTERnE);
> +        vgic_unlock_rank(v, rank, flags);
>   
> +        *r = vreg_reg64_extract(irouter, info);
> +
> +        return 1;
> +    }
> +
> +    case VRANGE32(0xA004, 0xBFFC):
> +#else
>       case VRANGE32(0x7FE0, 0xBFFC):
> +#endif
>           goto read_reserved;
>   
>       case VRANGE32(0xC000, 0xFFCC):
> @@ -1382,6 +1597,18 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
>       case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>       case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
>       case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
> +#endif

GICD_IGRPMODR<n>E is missed? I guess, it should be WI as regular 
GICD_IGRPMODR<n>.


Also GICD_NSACR<n>E is missed, although the case for regular 
GICD_NSACR<n> is present (not visible in patch context).

>           /* Above registers are common with GICR and GICD
>            * Manage in common */
>           return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
> @@ -1405,26 +1632,56 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
>           if ( dabt.size != DABT_WORD ) goto bad_width;
>           return 0;
>   
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(0x3100, 0x60FC):
> +#else
>       case VRANGE32(0x0F30, 0x60FC):
> +#endif

I wonder, can we have #defines for these magics (at least for the start 
of the reserved range)?

>           goto write_reserved;
>   
>       case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
>       {
>           uint64_t irouter;
> +        unsigned int offset, virq;
>   
>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
> -        rank = vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
> -                                DABT_DOUBLE_WORD);
> +        offset = gicd_reg - GICD_IROUTER;
> +        rank = vgic_rank_offset(v, 64, offset, DABT_DOUBLE_WORD);
>           if ( rank == NULL ) goto write_ignore;
>           vgic_lock_rank(v, rank, flags);
> -        irouter = vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
> +        irouter = vgic_fetch_irouter(rank, offset);
> +        vreg_reg64_update(&irouter, r, info);
> +        virq = offset / NR_BYTES_PER_IROUTER;
> +        vgic_store_irouter(v->domain, rank, virq, irouter);
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +    }
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
> +    {
> +        uint64_t irouter;
> +        unsigned int offset, virq;
> +
> +        if ( !vgic_reg64_check_access(dabt) )
> +            goto bad_width;
> +        offset = gicd_reg - GICD_IROUTERnE;
> +        rank = vgic_ext_rank_offset(v, 64, offset, DABT_DOUBLE_WORD);
> +        if ( rank == NULL )
> +            goto write_ignore;
> +        vgic_lock_rank(v, rank, flags);
> +        irouter = vgic_fetch_irouter(rank, offset);
>           vreg_reg64_update(&irouter, r, info);
> -        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, irouter);
> +        virq = ESPI_IDX2INTID(offset / NR_BYTES_PER_IROUTER);
> +        vgic_store_irouter(v->domain, rank, virq, irouter);
>           vgic_unlock_rank(v, rank, flags);
>           return 1;
>       }
>   
> +    case VRANGE32(0xA004, 0xBFFC):
> +#else
>       case VRANGE32(0x7FE0, 0xBFFC):
> +#endif
>           goto write_reserved;
>   
>       case VRANGE32(0xC000, 0xFFCC):


