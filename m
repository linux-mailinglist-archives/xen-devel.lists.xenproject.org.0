Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBE0B3D3F5
	for <lists+xen-devel@lfdr.de>; Sun, 31 Aug 2025 16:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1103839.1455202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usjU7-0003Um-Du; Sun, 31 Aug 2025 14:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1103839.1455202; Sun, 31 Aug 2025 14:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usjU7-0003SN-AB; Sun, 31 Aug 2025 14:56:47 +0000
Received: by outflank-mailman (input) for mailman id 1103839;
 Sun, 31 Aug 2025 14:56:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8SH=3L=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1usjU6-0003SH-FZ
 for xen-devel@lists.xenproject.org; Sun, 31 Aug 2025 14:56:46 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5c697a0-867a-11f0-8dd7-1b34d833f44b;
 Sun, 31 Aug 2025 16:56:44 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-336d2b0eaf8so6912331fa.2
 for <xen-devel@lists.xenproject.org>; Sun, 31 Aug 2025 07:56:44 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-336d0c8beadsm9230491fa.16.2025.08.31.07.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Aug 2025 07:56:41 -0700 (PDT)
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
X-Inumbo-ID: b5c697a0-867a-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756652204; x=1757257004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZW3tkJbkzK29MxXktZbnMlj25dwxvdDWx9xUPXf+zQo=;
        b=Gm5yoqnZlCkqAQs6uSb9iUTowTPkjR+LNzTj78o3qz39XM6cvgtHlWb0C0I38PHG8N
         GLqJse8Jq5Lf4P2H2s5TeSVyUqjVrUzV3cNa3grRywaZEwBP0p1O5COH3dvkvkX20yBO
         J2VbRmAFWUhhBZEJfvHz9ZVLdRkFZ5fWMiZBXFx5IOeU4B8P1IHLMrawoSG38UfjeqKY
         C1kA6YrKrFWqQa+qLdNbuTWxKgHQn64Mt7ZAbfExmJ5gU74HDwXd3MLSKaNCuRDfuwNo
         HIdSjglsxk9un4ut45BuwphjNo/ur9uLFkuYhKRTmRflDmfkTBJCHS0dcNghoXsDn3P4
         A1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756652204; x=1757257004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW3tkJbkzK29MxXktZbnMlj25dwxvdDWx9xUPXf+zQo=;
        b=kU36yvPQuGQswBj3akILR2g7Yepv3xkV4r/XS99N5FqpF2CGqwqmVGIA/jLbSb0Jcl
         B8arHV7sLuIEbGiact9LZbDOK5UJjReLV9Tt6tiJ5NaddoSBEevEaRBZAEa1tTJEWFzW
         qoSYI9lzR8MS31xmANstbhnOpDlfq8MAd2n3i69p+VlbPOjMjoe0o8JNW6uqmhPR/J3d
         /wAzl0N11NcbWyDEDTLwD14DXa02VdiwiVHCsBd42HqByMAoOiRwLzniFkZDXAnQmq15
         0n9uj12+3zvbuLGtWuPQ53X4TtLs8rqACksTj/INIzl2qd/uSzs+jKsEun1Vfs8Vsp6D
         L7yw==
X-Forwarded-Encrypted: i=1; AJvYcCWSpd/QSvSWU90gVewSJExEglpCa4GxfCZ1SsZWTY/jS+JlfkTCLvyJkyeI7agRDVnVlTmIe2VwTNA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywno0ff//cOl+vyAUBeuQ/b/gyYT5RBvV560LOuyT8qoruixxNy
	6M8zF1uQor3G7zj5Pbb0ifmHT3/qkpxgp03NHxKS3mhmPkVVzNGXq5qt
X-Gm-Gg: ASbGncs3N6iiQDA2zExCi3NGOYeWQOnBQPuxbmof5A7+sweZIeojQMhBcCTcom1JVCf
	/JI30E3yV5ohDA+sfRlXlDK5UI+CiPUOs3msQPekKWP9eJMZV+bTM06vlyQUtCUZz+cX6hBmsUY
	GeEASP0j1qJyMuMgjVvsXIbVMvmnjApyBH1D1NN1WbIP1ll5JILVRliI2+ca0gY9WDrMmSKrw09
	frc9YvTfWNYfAb6HNx5PJUgmIfw0XNR/wQ+cRVZCDTJA5obv8El9KNRRvFXTKNUoX97dCZczqyE
	8U9OQENuzaxA5pjlQpluzLW62PhjWRMEp1Yh9VQ2OYAWHm8wXw5+M1MZkZAPSBMOFH0qtL2JG1S
	kXRNyoeuOxlpdu2fDvbjAU+AkqMQxPOUkNfAcsAGVcVm5Cb8=
X-Google-Smtp-Source: AGHT+IGvWCdb77lx19U1iA6e7d6YB9JW3nh9hEo3HK/RA48QPkXkkiupUe0rsi6RixYjyycEWnAXxA==
X-Received: by 2002:a2e:a548:0:b0:336:b4dd:a34b with SMTP id 38308e7fff4ca-336cad1de64mr9751451fa.24.1756652203415;
        Sun, 31 Aug 2025 07:56:43 -0700 (PDT)
Message-ID: <f3fdc44c-3407-45cb-8714-eb85b9c48d78@gmail.com>
Date: Sun, 31 Aug 2025 17:56:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <edf50a95d335000cea2748301882f1bbea88d676.1756481577.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <edf50a95d335000cea2748301882f1bbea88d676.1756481577.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29.08.25 19:06, Leonid Komarianskyi wrote:

Hello Leonid


> Introduced appropriate register definitions, helper macros,
> and initialization of required GICv3.1 distributor registers
> to support eSPI. This type of interrupt is handled in the
> same way as regular SPI interrupts, with the following
> differences:
> 
> 1) eSPIs can have up to 1024 interrupts, starting from the
> beginning of the range, whereas regular SPIs use INTIDs from
> 32 to 1019, totaling 988 interrupts;
> 2) eSPIs start at INTID 4096, necessitating additional interrupt
> index conversion during register operations.
> 
> In case if appropriate config is disabled, or GIC HW doesn't
> support eSPI, the existing functionality will remain the same.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> 
> ---
> Changes in V5:
> - fixed minor nits, no functional changes: changed u32 to uint32_t and
>    added a comment noting that the configuration for eSPIs is the same as
>    for regular SPIs
> - removed ifdefs for eSPI-specific offsets to reduce the number of
>    ifdefs and code duplication in further changes
> - removed reviewed-by as moving offset from ifdefs requires additional
>    confirmation from reviewers


Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

> 
> Changes in V4:
> - added offsets for GICD_IGRPMODRnE and GICD_NSACRnE that are required
>    for vGIC emulation
> - added a log banner with eSPI information, similar to the one for
>    regular SPI
> - added newline after ifdef and before gic_is_valid_line
> - added reviewed-by from Volodymyr Babchuk
> 
> Changes in V3:
> - add __init attribute to gicv3_dist_espi_common_init
> - change open-codded eSPI register initialization to the appropriate
>    gen-mask macro
> - fixed formatting for lines with more than 80 symbols
> - introduced gicv3_dist_espi_init_aff to be able to use stubs in case of
>    CONFIG_GICV3_ESPI disabled
> - renamed parameter in the GICD_TYPER_ESPI_RANGE macro to espi_range
>    (name was taken from GIC specification) to avoid confusion
> - changed type for i variable to unsigned int since it cannot be
>    negative
> 
> Changes in V2:
> - move gic_number_espis function from
>    [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
>    to use it in the newly introduced gic_is_valid_espi
> - add gic_is_valid_espi which checks if IRQ number is in supported
>    by HW eSPI range
> - update gic_is_valid_irq conditions to allow operations with eSPIs
> ---
>   xen/arch/arm/gic-v3.c                  | 83 ++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/gic.h         | 22 +++++++
>   xen/arch/arm/include/asm/gic_v3_defs.h | 38 ++++++++++++
>   3 files changed, 143 insertions(+)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 29b7f68cba..4a7ce12f26 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_desc *irqd, u32 offset)
>           default:
>               break;
>           }
> +#ifdef CONFIG_GICV3_ESPI
> +    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
> +    {
> +        uint32_t irq_index = ESPI_INTID2IDX(irqd->irq);
> +
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
> +        case GICD_ICENABLER:
> +            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
> +        case GICD_ISPENDR:
> +            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
> +        case GICD_ICPENDR:
> +            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
> +        case GICD_ISACTIVER:
> +            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
> +        case GICD_ICACTIVER:
> +            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
> +        case GICD_ICFGR:
> +            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
> +        case GICD_IROUTER:
> +            return (GICD + GICD_IROUTERnE + irq_index * 8);
> +        case GICD_IPRIORITYR:
> +            return (GICD + GICD_IPRIORITYRnE + irq_index);
> +        default:
> +            break;
> +        }
> +    }
> +#endif
>       default:
>           break;
>       }
> @@ -655,6 +685,55 @@ static void gicv3_set_irq_priority(struct irq_desc *desc,
>       spin_unlock(&gicv3.lock);
>   }
>   
> +#ifdef CONFIG_GICV3_ESPI
> +unsigned int gic_number_espis(void)
> +{
> +    return gic_hw_ops->info->nr_espi;
> +}
> +
> +static void __init gicv3_dist_espi_common_init(uint32_t type)
> +{
> +    unsigned int espi_nr, i;
> +
> +    espi_nr = min(1024U, GICD_TYPER_ESPIS_NUM(type));
> +    gicv3_info.nr_espi = espi_nr;
> +    /* The GIC HW doesn't support eSPI, so we can leave from here */
> +    if ( gicv3_info.nr_espi == 0 )
> +        return;
> +
> +    printk("GICv3: %d eSPI lines\n", gicv3_info.nr_espi);
> +
> +    /* The configuration for eSPIs is similar to that for regular SPIs */
> +    for ( i = 0; i < espi_nr; i += 16 )
> +        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
> +
> +    for ( i = 0; i < espi_nr; i += 4 )
> +        writel_relaxed(GIC_PRI_IRQ_ALL,
> +                       GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
> +
> +    for ( i = 0; i < espi_nr; i += 32 )
> +    {
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLERnE + (i / 32) * 4);
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVERnE + (i / 32) * 4);
> +    }
> +
> +    for ( i = 0; i < espi_nr; i += 32 )
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) * 4);
> +}
> +
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < gicv3_info.nr_espi; i++ )
> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8);
> +}
> +#else
> +static void __init gicv3_dist_espi_common_init(uint32_t type) { }
> +
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
> +#endif
> +
>   static void __init gicv3_dist_init(void)
>   {
>       uint32_t type;
> @@ -700,6 +779,8 @@ static void __init gicv3_dist_init(void)
>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i += 32 )
>           writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
>   
> +    gicv3_dist_espi_common_init(type);
> +
>       gicv3_dist_wait_for_rwp();
>   
>       /* Turn on the distributor */
> @@ -713,6 +794,8 @@ static void __init gicv3_dist_init(void)
>   
>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
>           writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
> +
> +    gicv3_dist_espi_init_aff(affinity);
>   }
>   
>   static int gicv3_enable_redist(void)
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index 3fcee42675..1e747dcd99 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -306,8 +306,26 @@ extern void gic_dump_vgic_info(struct vcpu *v);
>   
>   /* Number of interrupt lines */
>   extern unsigned int gic_number_lines(void);
> +#ifdef CONFIG_GICV3_ESPI
> +extern unsigned int gic_number_espis(void);
> +
> +static inline bool gic_is_valid_espi(unsigned int irq)
> +{
> +    return (irq >= ESPI_BASE_INTID &&
> +            irq < ESPI_IDX2INTID(gic_number_espis()));
> +}
> +#else
> +static inline bool gic_is_valid_espi(unsigned int irq)
> +{
> +    return false;
> +}
> +#endif
> +
>   static inline bool gic_is_valid_line(unsigned int irq)
>   {
> +    if ( gic_is_valid_espi(irq) )
> +        return true;
> +
>       return irq < gic_number_lines();
>   }
>   
> @@ -325,6 +343,10 @@ struct gic_info {
>       enum gic_version hw_version;
>       /* Number of GIC lines supported */
>       unsigned int nr_lines;
> +#ifdef CONFIG_GICV3_ESPI
> +    /* Number of GIC eSPI supported */
> +    unsigned int nr_espi;
> +#endif
>       /* Number of LR registers */
>       uint8_t nr_lrs;
>       /* Maintenance irq number */
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
> index 2af093e774..3370b4cd52 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -37,6 +37,44 @@
>   #define GICD_IROUTER1019             (0x7FD8)
>   #define GICD_PIDR2                   (0xFFE8)
>   
> +/* Additional registers for GICv3.1 */
> +#define GICD_IGROUPRnE               (0x1000)
> +#define GICD_IGROUPRnEN              (0x107C)
> +#define GICD_ISENABLERnE             (0x1200)
> +#define GICD_ISENABLERnEN            (0x127C)
> +#define GICD_ICENABLERnE             (0x1400)
> +#define GICD_ICENABLERnEN            (0x147C)
> +#define GICD_ISPENDRnE               (0x1600)
> +#define GICD_ISPENDRnEN              (0x167C)
> +#define GICD_ICPENDRnE               (0x1800)
> +#define GICD_ICPENDRnEN              (0x187C)
> +#define GICD_ISACTIVERnE             (0x1A00)
> +#define GICD_ISACTIVERnEN            (0x1A7C)
> +#define GICD_ICACTIVERnE             (0x1C00)
> +#define GICD_ICACTIVERnEN            (0x1C7C)
> +#define GICD_IPRIORITYRnE            (0x2000)
> +#define GICD_IPRIORITYRnEN           (0x23FC)
> +#define GICD_ICFGRnE                 (0x3000)
> +#define GICD_ICFGRnEN                (0x30FC)
> +#define GICD_IGRPMODRnE              (0x3400)
> +#define GICD_IGRPMODRnEN             (0x347C)
> +#define GICD_NSACRnE                 (0x3600)
> +#define GICD_NSACRnEN                (0x36FC)
> +#define GICD_IROUTERnE               (0x8000)
> +#define GICD_IROUTERnEN              (0x9FFC)
> +
> +#ifdef CONFIG_GICV3_ESPI
> +#define GICD_TYPER_ESPI_SHIFT        8
> +#define GICD_TYPER_ESPI_RANGE_SHIFT  27
> +#define GICD_TYPER_ESPI_RANGE_MASK   (0x1F)
> +#define GICD_TYPER_ESPI              (1U << GICD_TYPER_ESPI_SHIFT)
> +#define GICD_TYPER_ESPI_RANGE(espi_range) ((((espi_range) & \
> +        GICD_TYPER_ESPI_RANGE_MASK) + 1) * 32)
> +#define GICD_TYPER_ESPIS_NUM(typer)    \
> +        (((typer) & GICD_TYPER_ESPI) ? \
> +        GICD_TYPER_ESPI_RANGE((typer) >> GICD_TYPER_ESPI_RANGE_SHIFT) : 0)
> +#endif
> +
>   /* Common between GICD_PIDR2 and GICR_PIDR2 */
>   #define GIC_PIDR2_ARCH_MASK         (0xf0)
>   #define GIC_PIDR2_ARCH_GICv3        (0x30)


