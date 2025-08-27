Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04579B38429
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 15:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096121.1450914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGeU-0001Wi-Rr; Wed, 27 Aug 2025 13:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096121.1450914; Wed, 27 Aug 2025 13:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGeU-0001Ur-Ox; Wed, 27 Aug 2025 13:57:26 +0000
Received: by outflank-mailman (input) for mailman id 1096121;
 Wed, 27 Aug 2025 13:57:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BCET=3H=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1urGeT-0001Ul-AV
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 13:57:25 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1fd8859-834d-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 15:57:24 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-3364e945ce7so50133541fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 06:57:23 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e20d2eesm27981471fa.13.2025.08.27.06.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 06:57:22 -0700 (PDT)
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
X-Inumbo-ID: c1fd8859-834d-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756303043; x=1756907843; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ygKfww93ZFknfiJ9bpkuC0SvDA9XslWxx059vdR8FDw=;
        b=VmhIGSEInM5icz1OtokX4vcMpOOOj8+LTi5ecYWTo3L3QSd6insymwBvK3nYLi+lQr
         q0wHLhTwfKdS+IZGw7GqqCyqmqFvm/jYsRu/cVpxDbs1XBtnq0cmEUr1brNZiaWgbVZi
         d+9TzkhiN2aJ5Vyo6C9P4IQILJH4jo0Ua9Mp3hi1wKmu0r5oIN8Qzzu/HqDhPu0NgkRB
         1gnZyFPFCeb5XM66HOXmolbL1T5CUCqFRzQjiAsXtGF6GrzACgs6lJP2D+4Ph0MYWQ1g
         SBwpATmzNK3Un0VF0ZVNJvKSqNGk4PvXNZbxohrPQlCN5pxzNRhbQsEuzFFq1w7fq/va
         GMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756303043; x=1756907843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygKfww93ZFknfiJ9bpkuC0SvDA9XslWxx059vdR8FDw=;
        b=d7XNcOFB5xEpKe1DyN5szsNXEmxPjCppUEn1XHFUN6/KuIhU68Tp6FdQCBDGLbfr30
         QlESLMEu1uVWSuhG6ZrIw3K9Z4IXyJhXFGqknlXLmFcQyomZM7o2o3hcb8gnNDR8edXi
         QKJNvpejbv2D4Je3Mqlk7kJjESCdz5F86sXRzAt1+sJZrO+4+aHhp+kZa2pppChkQnch
         InWm8mEWIUQ+aPdVL5up2VLQtCJR2w5FaJ7jVvYNq6UoxrikxbCYr0zkhDXvPe+kyE6y
         iT0Nl4vHo0dabfwIIxV9iNAun8DNylUpL9KIAcdcdWlVTz0UK1vKmbTWzMwmdEhykWk8
         Jx9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpFeo65pjHyTEopPerkFP/EYLALb0EZL0M2DkwtAekSch0q5U2D4/dd+bBhh61zuQVnyGlCDTil9M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxyby17TCa1fqCCRI1xstUWlDtSpRV+JCEU6uP3kygo9Noqvzya
	R7JrVCcoXEY9QsuUyyDLaAqwkq6NhX8Ph/Qt2irZv0A+q6qTtqI+pEBX
X-Gm-Gg: ASbGncuDL/mRpe+NjVKVAa18+p24DcJ/AYOQxmrSpJqOgUO38+nF9CHcCxK06Ev47SM
	lhPgp7lcAmSzDUg0yDnmUd16bL71c4QS1XZpfGctuiJarX7TQ1+eCnXz3vvOxLzvQ3sJb+OI5Mk
	4PZ73CZYsL2INNoAfAbKcNGUQtDha1uuCbM7kAoippiMsNs4pqcEsmekAVizFietzO5ETHAbdEq
	Lc1bOv6tXDi1GyfYTivlvGNLk+jwwlzG5E1cEFtlFKTLo/wqYD6U1HYIhL+pAonSL7DvR+3aFKs
	zSiULkTAqkiysYZjj0etUWjlHMPzgc4csp2CgZiCg72VHftI0NHVj+KxQIy9Y2gkL+ZnCXp26T8
	bDWmSNaRlPEPaXHgult2uP+hyWEvZV0TbbccL
X-Google-Smtp-Source: AGHT+IEant2LZmYvRCY+oCNyyVKEcQXTEpoTVYYHvhEWgWH8xM0t1X4khibDstI6vHM0KhemD29pgQ==
X-Received: by 2002:a2e:bea9:0:b0:336:94ec:5d0e with SMTP id 38308e7fff4ca-33694ec6468mr6952471fa.5.1756303042965;
        Wed, 27 Aug 2025 06:57:22 -0700 (PDT)
Message-ID: <7b1e7d3f-3893-4ddf-b352-10541638d12d@gmail.com>
Date: Wed, 27 Aug 2025 16:57:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
 <398ad09617f4f97d57d13fa9f3771bd2db83916b.1756216943.git.leonid_komarianskyi@epam.com>
 <c9ec5d69-6b2e-4226-aa8f-ee6062c84885@gmail.com>
 <bc850218-334b-407e-9008-3c1e8a61c7ba@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <bc850218-334b-407e-9008-3c1e8a61c7ba@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 27.08.25 16:38, Leonid Komarianskyi wrote:
> Hello Oleksandr,

Hello Leonid

> 
> Thank you for your good question, I was thinking about that as well.
> 
> On 27.08.25 13:25, Oleksandr Tyshchenko wrote:
>>
>>
>> On 26.08.25 17:05, Leonid Komarianskyi wrote:
>>
>>
>> Hello Leonid,
>>
>> In general patch looks good to me, just one question below ...
>>
>>> Introduced appropriate register definitions, helper macros,
>>> and initialization of required GICv3.1 distributor registers
>>> to support eSPI. This type of interrupt is handled in the
>>> same way as regular SPI interrupts, with the following
>>> differences:
>>>
>>> 1) eSPIs can have up to 1024 interrupts, starting from the
>>> beginning of the range, whereas regular SPIs use INTIDs from
>>> 32 to 1019, totaling 988 interrupts;
>>> 2) eSPIs start at INTID 4096, necessitating additional interrupt
>>> index conversion during register operations.
>>>
>>> In case if appropriate config is disabled, or GIC HW doesn't
>>> support eSPI, the existing functionality will remain the same.
>>>
>>> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>>>
>>> ---
>>> Changes in V2:
>>> - move gic_number_espis function from
>>>     [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
>>>     to use it in the newly introduced gic_is_valid_espi
>>> - add gic_is_valid_espi which checks if IRQ number is in supported
>>>     by HW eSPI range
>>> - update gic_is_valid_irq conditions to allow operations with eSPIs
>>>
>>> Changes in V3:
>>> - add __init attribute to gicv3_dist_espi_common_init
>>> - change open-codded eSPI register initialization to the appropriate
>>>     gen-mask macro
>>> - fixed formatting for lines with more than 80 symbols
>>> - introduced gicv3_dist_espi_init_aff to be able to use stubs in case of
>>>     CONFIG_GICV3_ESPI disabled
>>> - renamed parameter in the GICD_TYPER_ESPI_RANGE macro to espi_range
>>>     (name was taken from GIC specification) to avoid confusion
>>> - changed type for i variable to unsigned int since it cannot be
>>>     negative
>>> ---
>>>    xen/arch/arm/gic-v3.c                  | 80 ++++++++++++++++++++++++++
>>>    xen/arch/arm/include/asm/gic.h         | 21 +++++++
>>>    xen/arch/arm/include/asm/gic_v3_defs.h | 34 +++++++++++
>>>    3 files changed, 135 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>> index a959fefebe..3aa5cc1765 100644
>>> --- a/xen/arch/arm/gic-v3.c
>>> +++ b/xen/arch/arm/gic-v3.c
>>> @@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct
>>> irq_desc *irqd, u32 offset)
>>>            default:
>>>                break;
>>>            }
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
>>> +    {
>>> +        u32 irq_index = ESPI_INTID2IDX(irqd->irq);
>>> +
>>> +        switch ( offset )
>>> +        {
>>> +        case GICD_ISENABLER:
>>> +            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
>>> +        case GICD_ICENABLER:
>>> +            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
>>> +        case GICD_ISPENDR:
>>> +            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
>>> +        case GICD_ICPENDR:
>>> +            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
>>> +        case GICD_ISACTIVER:
>>> +            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
>>> +        case GICD_ICACTIVER:
>>> +            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
>>> +        case GICD_ICFGR:
>>> +            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
>>> +        case GICD_IROUTER:
>>> +            return (GICD + GICD_IROUTERnE + irq_index * 8);
>>> +        case GICD_IPRIORITYR:
>>> +            return (GICD + GICD_IPRIORITYRnE + irq_index);
>>> +        default:
>>> +            break;
>>> +        }
>>> +    }
>>> +#endif
>>>        default:
>>>            break;
>>>        }
>>> @@ -655,6 +685,52 @@ static void gicv3_set_irq_priority(struct
>>> irq_desc *desc,
>>>        spin_unlock(&gicv3.lock);
>>>    }
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +unsigned int gic_number_espis(void)
>>> +{
>>> +    return gic_hw_ops->info->nr_espi;
>>> +}
>>> +
>>> +static void __init gicv3_dist_espi_common_init(uint32_t type)
>>> +{
>>> +    unsigned int espi_nr, i;
>>> +
>>> +    espi_nr = min(1024U, GICD_TYPER_ESPIS_NUM(type));
>>> +    gicv3_info.nr_espi = espi_nr;
>>> +    /* The GIC HW doesn't support eSPI, so we can leave from here */
>>> +    if ( gicv3_info.nr_espi == 0 )
>>> +        return;
>>> +
>>> +    for ( i = 0; i < espi_nr; i += 16 )
>>> +        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
>>> +
>>> +    for ( i = 0; i < espi_nr; i += 4 )
>>> +        writel_relaxed(GIC_PRI_IRQ_ALL,
>>> +                       GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
>>> +
>>> +    for ( i = 0; i < espi_nr; i += 32 )
>>> +    {
>>> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLERnE + (i /
>>> 32) * 4);
>>> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVERnE + (i /
>>> 32) * 4);
>>> +    }
>>> +
>>> +    for ( i = 0; i < espi_nr; i += 32 )
>>> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i /
>>> 32) * 4);
>>> +}
>>> +
>>> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    for ( i = 0; i < gicv3_info.nr_espi; i++ )
>>> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i
>>> * 8);
>>> +}
>>> +#else
>>> +static void __init gicv3_dist_espi_common_init(uint32_t type) { }
>>> +
>>> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
>>> +#endif
>>> +
>>>    static void __init gicv3_dist_init(void)
>>>    {
>>>        uint32_t type;
>>> @@ -700,6 +776,8 @@ static void __init gicv3_dist_init(void)
>>>        for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i += 32 )
>>>            writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i /
>>> 32) * 4);
>>
>>
>> There is a banner in this function (not visible from the patch context),
>> that prints nr_lines, etc.
>>
>> E.g.:
>> (XEN) GICv3: 288 lines, (IID 0000043b).
>>
>> What do you think, would it be important/valuable to also print nr_espi
>> if non-zero (extended SPI range is supported)?
>>
>>
> 
> I think so, it will be useful. By the way, native Linux prints this
> information, so I would prefer to add a message right after checking if
> the hardware supports eSPI:
>       /* The GIC HW doesn't support eSPI, so we can leave from here */
>       if ( gicv3_info.nr_espi == 0 )
>           return;
> 
>       printk("GICv3: %d eSPI lines\n", gicv3_info.nr_espi);
> 
> This log will appear right after the common one and will look like this:
> (XEN) GICv3: 988 lines, (IID 0000043b)
> (XEN) GICv3: 1024 eSPI lines

Looks very good!

> 
>>> +    gicv3_dist_espi_common_init(type);
>>> +
>>>        gicv3_dist_wait_for_rwp();
>>>        /* Turn on the distributor *
>>> @@ -713,6 +791,8 @@ static void __init gicv3_dist_init(void)
>>>        for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
>>>            writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i
>>> * 8);
>>> +
>>> +    gicv3_dist_espi_init_aff(affinity);
>>>    }
>>>
>>
>>
>> [snip]
>>
>>
>>
> 
> Best regards,
> Leonid.


