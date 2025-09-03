Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108B4B429D5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 21:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108939.1458874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utt8T-0001Xo-Ko; Wed, 03 Sep 2025 19:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108939.1458874; Wed, 03 Sep 2025 19:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utt8T-0001VH-HU; Wed, 03 Sep 2025 19:27:13 +0000
Received: by outflank-mailman (input) for mailman id 1108939;
 Wed, 03 Sep 2025 19:27:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+jY=3O=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1utt8R-0001VB-QS
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 19:27:11 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc369ff3-88fb-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 21:27:10 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-55f78e3cdf9so226366e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 12:27:09 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad2c3adsm681780e87.131.2025.09.03.12.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 12:27:08 -0700 (PDT)
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
X-Inumbo-ID: fc369ff3-88fb-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756927629; x=1757532429; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYl2fq/xKQo6MRXjhA6xisl1n5IPmDm1Ug6zNjVIlT8=;
        b=m98qtnIBwHDAILljcflvEs2aAfOr94yUJMAKf0LRP3Sw0EA6HbEKY7ENYlrkmVFdi9
         sGDX+c8p/kF5OY+8Ncp9YagwPI6w3GO1boBkRZZqMBr7r6iFjP+ngYH9Ms+VN+xkGIWI
         kUPIcBG1adS7x3yOfFEp6IyCjZCn7EIC9kYalFpl+Rv+7PKJGGfsO87XMxv/oKe5oSY3
         ZL/pK6mTXbtt/Oji9uklqWXQbTuMyl9oTEpLgmo2VHGzBA3poH86PLvwjPtlG4MUy0BK
         qFraSVrQ3NwYoauCvhATPhyCb6ga3cLKr9DbHFSMPk5t1NEO+BrWDT6BSvNF3nGvRvX+
         YJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756927629; x=1757532429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYl2fq/xKQo6MRXjhA6xisl1n5IPmDm1Ug6zNjVIlT8=;
        b=RVJyoGS7IVT3B4Js+Nt5qVtf87BXUwWyu5JHHePmrP9R3oXdQ9b5BP6wzWPqDJbJMD
         8zMQydXVACNDuwoNcDRIK2KdJkL0+VpPX/gtjT0U+5LNm+YNuEokop0o6HHDWGM9eK97
         8QwsOosRcK/Yn1pYKV24wyI3flb0sTAwOrnblIibuLf5GJVEGYjPCIyGv0eCd1Zoc5Q4
         xQnqKgpYXXhzF12fvR0odVtz9jEauN+lkb4BF2AZkBiEVlkY+iJWChIYpEFENLv2IkSu
         KSxZfsEfDvGSa/1JILxSqg+Gladp4ctEj3EruwzeizlXkBzRav8yxfc2w4g35LWm3Sx2
         pUcg==
X-Forwarded-Encrypted: i=1; AJvYcCWGIONJivqpb7/s2FzyxjKlrt3xToGc+cteIGbXFg8Bk9ESxSj3kI1ctjcJ4jFv43oyOmQjNRN4DmI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/97J1edUAaVkNfcGzHmGJK3KL1pzd+ieNTY1A5hPPZqXFwnwk
	TiGYzK3h+jt0AI+5T/gaS7nTrvnRSNqnEKfLIbULGbrnOIdnPtJuLRps
X-Gm-Gg: ASbGncs7dZ9awNxM5v3blxyHMyARUXVrSdsi/gYipvVtQaY7nKvigUNCVzpH+3pmTkk
	aOEmocZtKmSgpzg2TFo00XzzkIAQv15EapqtpeAIdi1xDmDW4JtcAYw2BDTgKKZbddDw2sOLnoP
	ZlG74yyDMNgD89/tv0t/8A36++e4Ee/R+5w520/RQvuijkEKqrIgmCMuOLm7deFTtm4QEEkBK5+
	VBMKEATbIAjtxL25AfuKybqAeyMm4tRje+mGPp7PkM1cl+2AcoApOaba74dLaD3PXYMKfp42hkL
	HnKj+4TXw1X3xVy+cUR+mWpXbWt8C02GTXzY962r+gjqkYw/6ywdkW99WEKS9iVwUl7BLnztOGt
	9RDdM84xm/2wdND5k9mVN82eiHpPMlQFWHZeM
X-Google-Smtp-Source: AGHT+IF4iciau66j/+aZXTYHO8UW0frcJixHK4Xt5y+gIGkGG6g1mputXC3M5SkSqPU4hPcGLhQ9Wg==
X-Received: by 2002:a05:6512:3ca4:b0:55f:6b76:e7f7 with SMTP id 2adb3069b0e04-55f709bdd91mr4829403e87.56.1756927628844;
        Wed, 03 Sep 2025 12:27:08 -0700 (PDT)
Message-ID: <cb34378c-95c7-4618-8aeb-a7b7c5c97f2d@gmail.com>
Date: Wed, 3 Sep 2025 22:27:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
 <345da260fcb3bb400834f8a59dacfda8b37440a1.1756908472.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <345da260fcb3bb400834f8a59dacfda8b37440a1.1756908472.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03.09.25 17:30, Leonid Komarianskyi wrote:

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
> Changes in V6:
> - introduced helper functions: vgic_get_rank and vgic_get_reg_offset to
>    avoid boilerplate code and simplify changes
> - fixed index initialization in the previous patch ([08/12] xen/arm:
>    vgic: add resource management for extended SPIs) and removed index
>    conversion for vgic_enable_irqs(), vgic_disable_irqs(),
>    vgic_set_irqs_pending(), and vgic_check_inflight_irqs_pending()
> - grouped SPI and eSPI registers
> - updated the comment for vgic_store_irouter to reflect parameter
>    changes
> - minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
>    into appropriate inline functions introduced in the previous patch

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

preferably with the comments below

> 
> Changes in V5:
> - since eSPI-specific defines and macros are now available even when the
>    appropriate config is disabled, this allows us to remove many
>    #ifdef guards and reuse the existing code for regular SPIs for eSPIs as
>    well, as eSPIs are processed similarly. This improves code readability
>    and consolidates the register ranges for SPIs and eSPIs in a single
>    place, simplifying future changes or fixes for SPIs and their
>    counterparts from the extended range
> - moved vgic_ext_rank_offset() from
>    [08/12] xen/arm: vgic: add resource management for extended SPIs
>    as the function was unused before this patch
> - added stub implementation of vgic_ext_rank_offset() when CONFIG_GICV3_ESPI=n
> - removed unnecessary defines for reserved ranges, which were introduced in
>    V4 to reduce the number of #ifdefs. The issue is now resolved by
>    allowing the use of SPI-specific offsets and reworking the logic
> 
> Changes in V4:
> - added missing RAZ and write ignore eSPI-specific registers ranges:
>    GICD_NSACRnE and GICD_IGRPMODRnE
> - changed previously reserved range to cover GICD_NSACRnE and
>    GICD_IGRPMODRnE
> - introduced GICD_RESERVED_RANGE<n>_START/END defines to remove
>    hardcoded values and reduce the number of ifdefs
> - fixed reserved ranges with eSPI option enabled: added missing range
>    0x0F30-0x0F7C
> - updated the logic for domains that do not support eSPI, but Xen is
>    compiled with the eSPI option. Now, prior to other MMIO checks, we
>    verify whether eSPI is available for the domain or not. If not, it
>    behaves as it does currently - RAZ and WI
> - fixed print for GICD_ICACTIVERnE
> - fixed new lines formatting for switch-case
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
> 
> Changes in V2:
> - add missing rank index conversion for pending and inflight irqs
> ---
>   xen/arch/arm/include/asm/vgic.h |   4 +
>   xen/arch/arm/vgic-v3.c          | 198 +++++++++++++++++++++++++-------
>   xen/arch/arm/vgic.c             |  22 ++++
>   3 files changed, 180 insertions(+), 44 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index c52bbcb115..dec08a75a4 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -314,6 +314,10 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v,
>                                                 unsigned int b,
>                                                 unsigned int n,
>                                                 unsigned int s);
> +extern struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v,
> +                                                  unsigned int b,
> +                                                  unsigned int n,
> +                                                  unsigned int s);
>   extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq);
>   extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
>   extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 4369c55177..27af247d30 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -107,17 +107,12 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_rank *rank,
>   /*
>    * Store an IROUTER register in a convenient way and migrate the vIRQ
>    * if necessary. This function only deals with IROUTER32 and onwards.
> - *
> - * Note the offset will be aligned to the appropriate boundary.
>    */
>   static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *rank,
> -                               unsigned int offset, uint64_t irouter)
> +                               unsigned int virq, uint64_t irouter)
>   {
>       struct vcpu *new_vcpu, *old_vcpu;
> -    unsigned int virq;
> -
> -    /* There is 1 vIRQ per IROUTER */

You seem to have dropped a comment, but not just moved it to virq 
calculation outside of the vgic_store_irouter() in "case 
VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):". If the comment is valid (I 
assume so), it would be better to retain it.

> -    virq = offset / NR_BYTES_PER_IROUTER;
> +    unsigned int offset;
>   
>       /*
>        * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
> @@ -673,6 +668,34 @@ write_reserved:
>       return 1;
>   }
>   
> +/*
> + * Since all eSPI counterparts of SPI registers belong to lower offsets,
> + * we can check whether the register offset is less than espi_base and,
> + * if so, return the rank for regular SPI. Otherwise, return the rank
> + * for eSPI.
> + */

NIT: I would just write the following:

The assumption is that offsets below espi_base are for regular SPI, 
while those at or above are for eSPI.

> +static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
> +                                                  unsigned int b,
> +                                                  uint32_t reg,
> +                                                  unsigned int s,
> +                                                  uint32_t spi_base,
> +                                                  uint32_t espi_base)

I find the name "vgic_get_rank" a bit confusing since the vgic.c already 
contains the helper with the same name:

static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
                                                   unsigned int rank)

So what we have for regular SPIs is:
vgic_get_rank()->vgic_rank_offset()->vgic_get_rank()
and for eSPIs is:
vgic_get_rank()->vgic_ext_rank_offset()->vgic_get_rank()

I would rename it, e.g. vgic_common_rank_offset (not ideal though)


> +{
> +    if ( reg < espi_base )
> +        return vgic_rank_offset(v, b, reg - spi_base, s);
> +    else
> +        return vgic_ext_rank_offset(v, b, reg - espi_base, s);
> +}
> +
> +static inline uint32_t vgic_get_reg_offset(uint32_t reg, uint32_t spi_base,
> +                                           uint32_t espi_base)
> +{
> +    if ( reg < espi_base )
> +        return reg - spi_base;
> +    else
> +        return reg - espi_base;
> +}

I am wondering (I do not request a change) whether vgic_get_reg_offset() 
is really helpfull,
e.g. is
  offset = vgic_get_reg_offset(reg, GICD_IPRIORITYR, GICD_IPRIORITYRnE);
much better than:
  offset = reg < GICD_IPRIORITYRnE ? reg - GICD_IPRIORITYR : reg - 
GICD_IPRIORITYRnE;

?

[snip]

