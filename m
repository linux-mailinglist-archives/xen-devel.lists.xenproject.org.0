Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 528DDB4557E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 13:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111744.1460337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuUAq-0004g9-Py; Fri, 05 Sep 2025 11:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111744.1460337; Fri, 05 Sep 2025 11:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuUAq-0004du-NP; Fri, 05 Sep 2025 11:00:08 +0000
Received: by outflank-mailman (input) for mailman id 1111744;
 Fri, 05 Sep 2025 11:00:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwIt=3Q=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uuUAo-0004Y9-I4
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 11:00:06 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79b86be9-8a47-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 13:00:03 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-55f6aef1a7dso2104857e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 04:00:03 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm1724233e87.85.2025.09.05.04.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 04:00:02 -0700 (PDT)
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
X-Inumbo-ID: 79b86be9-8a47-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757070003; x=1757674803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ATHxwcXpiDoyxqeD5LGIv8Hu24v++edbEYnNg5KOn8=;
        b=ZgPtM04DG3R8A9SN1cK3zpOoZME+dojT2ZBZSr/AwsFD2JzUR0CYSxIdJRoyrwZefU
         LlTIuNjfYcpSdO0+gg3UKaWO5XzWddhqhmNtLmPQwdpIFowtmNZNYJ/HIpRApE2M8N9G
         kjVz2h5w2ZAo+0DbbmvmrIydSWV7BtLhKwvrYQUD868Qg1McmJ15669KF9fO0XM+zSTt
         P+gffjXq5557jNba+jJS/L8pevfmHNeDXp96PebU1Nmr2g5fk/qkJSJOhFFLty5Vi3rt
         HGpQUchIpsNR9n2XD54OD20oPPpGdHwkBKb5S54NUluyRqp6I7mjP4tThAKiaIPStJG8
         2gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757070003; x=1757674803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ATHxwcXpiDoyxqeD5LGIv8Hu24v++edbEYnNg5KOn8=;
        b=VKGuEkrSw6e0aceXMsP6RxgJix9nBA+XUmrXkqxPtgWpOWSlV60cQEzNtQ0js6alYG
         tdeqbrJ6N7hZiV3ThPvfexXZB+zx197ObHdD4WP6YDsDCptNgimmxinnJ9oK2xgzf2v1
         QTXubY7Dub+Qog5O8Q4R8aGsTtbEz/YrrcpgqiWngB0Pe79RILeEWjhnn9dTXawqkY2N
         IOYpuFYASCGsJzcv3wybdvuG/fdLS0YVhNvSZUUXSmj08YCifzxrrpIFksmTaChgTgAJ
         d0AWObBTJbsrp+g+lA6zA9vnsB+GaCrugMREoqml+H/lLYldZWfsj87ex4aexSAL6kCc
         WHWg==
X-Forwarded-Encrypted: i=1; AJvYcCWoXY4o7dxeiK+OqQTaoiqH8fv9s9iT0XI2VqF+Fp14ooxEFjJIfQNHEwaXfJNJCAdN2OU8aqbikNw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzScYPThBItlnIKZ0x+TjI8UTj3u+lN1Rpd9NuvfpvxObv16aa
	38valChIu1dFWs9/V/OBabhIt8Xx3DIKXBfvVMYQFk3QkIvjk+F1quz+
X-Gm-Gg: ASbGnctq7V5lO17G+aC/BxKqB7CjuaiQ0U9ZIqo1AviE4Gh6gLXcSdOWMbMs3ID4gQK
	4Rkl2mGWGkHL4CSvLBLw0gy1/E9eiLljxeXgLj4f+xedDgoIBESCdIPD5QMC0Q7Q7EBNnl8IHYO
	8HAGjpbZrn1fKi68/L7Ps68V35n2B6oEoDyOp5RegbquQ9dhVAS9dIG9q2y69GE0M3rA9LXfGH5
	mg+qjgEdpC3e7608eethks5mWvBC5u7EOl7jiAZxlM8kQVman6AF//wQi6PSEHx/vvgvBG6mJmd
	s8IW74ocDbsHXhrmLmqf2ftmEKvpzBT6dfAjUx/CcEmxPJbOasW0UkfSzZejnqMFZT6a/UmKw4q
	3pJFfz8GbEznUfsOo1cixvU/8TA==
X-Google-Smtp-Source: AGHT+IH9c+ItgqW7/BDbWjmuw+5+iGZksBfSYHlZUobtJnQI5qjDF290FD9AjHSO75BZ+Gz5Fq8lOQ==
X-Received: by 2002:ac2:51c5:0:b0:55f:6d28:bcee with SMTP id 2adb3069b0e04-55f70995b0amr6640820e87.34.1757070002828;
        Fri, 05 Sep 2025 04:00:02 -0700 (PDT)
Message-ID: <67b05b3e-becc-419b-b960-ac39c785118c@gmail.com>
Date: Fri, 5 Sep 2025 14:00:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
 <8b43ad89380261c3a3bbd0bc943461226d9cf0ce.1757015865.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <8b43ad89380261c3a3bbd0bc943461226d9cf0ce.1757015865.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04.09.25 23:01, Leonid Komarianskyi wrote:

Hello Leonid

> Currently, Xen does not support eSPI interrupts, leading
> to a data abort when such interrupts are defined in the DTS.
> 
> This patch introduces a separate array to initialize up to
> 1024 interrupt descriptors in the eSPI range and adds the
> necessary defines and helper function. These changes lay the
> groundwork for future implementation of full eSPI interrupt
> support. As this GICv3.1 feature is not required by all vendors,
> all changes are guarded by ifdefs, depending on the corresponding
> Kconfig option.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>


Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Initially I was slightly worried about ...

> 
> ---
> Changes in V7:
> - fixed the condition in the is_espi assert for non-eSPI builds: the
>    previous condition was mistakenly added with a wrong check and led to
>    triggering asserts for all non-eSPI INTIDs, when it should be triggered
>    in this case in the other way around
> - minor: used is_espi() in the espi_intid_to_idx() ASSERT, as is_espi
>    performs the same verification
> 
> Changes in V6:
> - added an assert in is_espi() when CONFIG_GICV3_ESPI=n to ensure that
>    out-of-range array resources are not accessed, e.g., in __irq_to_desc()
> - removed unnecessary parentheses in is_espi()
> - converted helper macro to inline functions and added sanity checks
>    with ASSERTs to them
> - defined espi_to_desc for non-eSPI builds as a prototype
> - updates the comments
> - used the IS_ENABLED(CONFIG_GICV3_ESPI) macro to initialize nr_irqs
> 
> Changes in V5:
> - no functional changes introduced by this version compared with V4, only
>    minor fixes and removal of ifdefs for macroses
> - added TODO comment, suggested by Oleksandr Tyshchenko
> - changed int to unsigned int for irqs
> - removed ifdefs for eSPI-specific defines and macros to reduce the
>    number of ifdefs and code duplication in further changes
> - removed reviewed-by as moving defines from ifdefs requires additional
>    confirmation from reviewers
> 
> Changes in V4:
> - removed redundant line with 'default n' in Kconfig, as it is disabled
>    by default, without explicit specification
> - added reviewed-by from Volodymyr Babchuk
> 
> Changes in V3:
> - introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
>    case of using NR_IRQS for espi_desc array
> - implemented helper functions espi_to_desc and init_espi_data to make
>    it possible to add stubs with the same name, and as a result, reduce
>    the number of #ifdefs
> - disable CONFIG_GICV3_ESPI default value to n
> 
> Changes in V2:
> - use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
> - remove unnecessary comment for nr_irqs initialization
> ---
>   xen/arch/arm/Kconfig           |  8 +++++
>   xen/arch/arm/include/asm/irq.h | 37 ++++++++++++++++++++++++
>   xen/arch/arm/irq.c             | 53 ++++++++++++++++++++++++++++++++--
>   3 files changed, 96 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 17df147b25..43b05533b1 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -135,6 +135,14 @@ config GICV3
>   	  Driver for the ARM Generic Interrupt Controller v3.
>   	  If unsure, use the default setting.
>   
> +config GICV3_ESPI
> +	bool "Extended SPI range support"
> +	depends on GICV3 && !NEW_VGIC
> +	help
> +	  Allow Xen and domains to use interrupt numbers from the extended SPI
> +	  range, from 4096 to 5119. This feature is introduced in GICv3.1
> +	  architecture.
> +
>   config HAS_ITS
>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>           depends on GICV3 && !NEW_VGIC && !ARM_32
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> index 5bc6475eb4..2ff2d07d6d 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -32,6 +32,10 @@ struct arch_irq_desc {
>   #define SPI_MAX_INTID   1019
>   #define LPI_OFFSET      8192
>   
> +#define ESPI_BASE_INTID 4096
> +#define ESPI_MAX_INTID  5119
> +#define NR_ESPI_IRQS    1024
> +
>   /* LPIs are always numbered starting at 8192, so 0 is a good invalid case. */
>   #define INVALID_LPI     0
>   
> @@ -39,7 +43,12 @@ struct arch_irq_desc {
>   #define INVALID_IRQ     1023
>   
>   extern const unsigned int nr_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +/* This will cover the eSPI range, to allow asignmant of eSPIs to domains. */
> +#define nr_static_irqs (ESPI_MAX_INTID + 1)
> +#else
>   #define nr_static_irqs NR_IRQS
> +#endif
>   
>   struct irq_desc;
>   struct irqaction;
> @@ -55,6 +64,34 @@ static inline bool is_lpi(unsigned int irq)
>       return irq >= LPI_OFFSET;
>   }
>   
> +static inline bool is_espi(unsigned int irq)
> +{
> +#ifdef CONFIG_GICV3_ESPI
> +    return irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID;
> +#else
> +    /*
> +     * The function should not be called for eSPIs when CONFIG_GICV3_ESPI is
> +     * disabled. Returning false allows the compiler to optimize the code
> +     * when the config is disabled, while the assert ensures that out-of-range
> +     * array resources are not accessed, e.g., in __irq_to_desc().
> +     */
> +    ASSERT(!(irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID));
> +    return false;
> +#endif
> +}
> +
> +static inline unsigned int espi_intid_to_idx(unsigned int intid)
> +{
> +    ASSERT(is_espi(intid));
> +    return intid - ESPI_BASE_INTID;
> +}
> +
> +static inline unsigned int espi_idx_to_intid(unsigned int idx)
> +{
> +    ASSERT(idx <= NR_ESPI_IRQS);

  ... this assert.

The system defines that there are only 1024 (NR_ESPI_IRQS) eSPIs, which 
map to indices 0 through 1023. An idx of 1024 is an invalid eSPI index. 
The assert would allow idx = 1024 to pass, and the helper would then 
return an invalid interrupt ID of 5120 (1024 + 4096). But, as I 
understand, you chose "<=" instead of "<" to be able to also pass 
NR_ESPI_IRQS/gic_number_espis() to calculate a "one-past-the-end" 
interrupt ID, which can then be used as an exclusive upper bound for 
range checks in the code.

By looking at how it is used within the series, I did not notice obvious 
issues.

> +    return idx + ESPI_BASE_INTID;
> +}
> +
>   #define domain_pirq_to_irq(d, pirq) (pirq)
>   
>   bool is_assignable_irq(unsigned int irq);
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index b8eccfc924..c934d39bf6 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -19,7 +19,9 @@
>   #include <asm/gic.h>
>   #include <asm/vgic.h>
>   
> -const unsigned int nr_irqs = NR_IRQS;
> +const unsigned int nr_irqs = IS_ENABLED(CONFIG_GICV3_ESPI) ?
> +                                        (ESPI_MAX_INTID + 1) :
> +                                        NR_IRQS;
>   
>   static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>   static DEFINE_SPINLOCK(local_irqs_type_lock);
> @@ -46,6 +48,50 @@ void irq_end_none(struct irq_desc *irq)
>   }
>   
>   static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
> +#ifdef CONFIG_GICV3_ESPI
> +/* TODO: Consider allocating an array dynamically */
> +static irq_desc_t espi_desc[NR_ESPI_IRQS];
> +
> +static struct irq_desc *espi_to_desc(unsigned int irq)
> +{
> +    return &espi_desc[espi_intid_to_idx(irq)];
> +}
> +
> +static int __init init_espi_data(void)
> +{
> +    unsigned int irq;
> +
> +    for ( irq = ESPI_BASE_INTID; irq <= ESPI_MAX_INTID; irq++ )
> +    {
> +        struct irq_desc *desc = irq_to_desc(irq);
> +        int rc = init_one_irq_desc(desc);
> +
> +        if ( rc )
> +            return rc;
> +
> +        desc->irq = irq;
> +        desc->action  = NULL;
> +    }
> +
> +    return 0;
> +}
> +#else
> +/*
> + * Defined as a prototype as it should not be called if CONFIG_GICV3_ESPI=n.
> + * Without CONFIG_GICV3_ESPI, the additional 1024 IRQ descriptors will not
> + * be defined, and thus, they cannot be used. Unless INTIDs from the eSPI
> + * range are mistakenly defined in Xen DTS when the appropriate config is
> + * disabled, this function will not be reached because is_espi will return
> + * false for non-eSPI INTIDs.
> + */
> +struct irq_desc *espi_to_desc(unsigned int irq);
> +
> +static int __init init_espi_data(void)
> +{
> +    return 0;
> +}
> +#endif
> +
>   static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
>   
>   struct irq_desc *__irq_to_desc(unsigned int irq)
> @@ -53,6 +99,9 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
>       if ( irq < NR_LOCAL_IRQS )
>           return &this_cpu(local_irq_desc)[irq];
>   
> +    if ( is_espi(irq) )
> +        return espi_to_desc(irq);
> +
>       return &irq_desc[irq-NR_LOCAL_IRQS];
>   }
>   
> @@ -79,7 +128,7 @@ static int __init init_irq_data(void)
>           desc->action  = NULL;
>       }
>   
> -    return 0;
> +    return init_espi_data();
>   }
>   
>   static int init_local_irq_data(unsigned int cpu)


