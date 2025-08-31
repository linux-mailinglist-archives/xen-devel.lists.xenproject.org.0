Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B023B3D3D3
	for <lists+xen-devel@lfdr.de>; Sun, 31 Aug 2025 16:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1103754.1455151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usijm-0003Xx-T9; Sun, 31 Aug 2025 14:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1103754.1455151; Sun, 31 Aug 2025 14:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usijm-0003WS-QK; Sun, 31 Aug 2025 14:08:54 +0000
Received: by outflank-mailman (input) for mailman id 1103754;
 Sun, 31 Aug 2025 14:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8SH=3L=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1usijl-0003WM-R1
 for xen-devel@lists.xenproject.org; Sun, 31 Aug 2025 14:08:53 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05afb370-8674-11f0-8adc-4578a1afcccb;
 Sun, 31 Aug 2025 16:08:52 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55f6bb0a364so2343136e87.1
 for <xen-devel@lists.xenproject.org>; Sun, 31 Aug 2025 07:08:51 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f7692f6ecsm705165e87.95.2025.08.31.07.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Aug 2025 07:08:50 -0700 (PDT)
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
X-Inumbo-ID: 05afb370-8674-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756649331; x=1757254131; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ymxuWFBdkbyelysuz+qdLUoYoIL1JRtAwBGX0twc+XI=;
        b=kEcrZuz0NDZsGCi+wXwy79wDrDhG/NAU7y08tcRZHPs0qQFDkKsqJ/KRgWcUUQxyJh
         gzN9ZdE+9LDtknd3GzRnDCn6TgYwuzcjxyKLTdrHloIFotAiQsLMqCykR1l7pKJFqeyA
         saYwjeHOexmoosgImEyP71CpkX+0pB6LItajfNS67oLY5ZpoFi91Au516kXlhE5CYwM7
         NF3VWCuGtyDgWzH9Lh0+7bUxwJQKrCOX2SuFMmScRS01AwomG6SB5ved2dlFuPMcH9nz
         orL3adJ2VQO7NNlNvAIe638RDpYA/AItpPX3dkABw/1DwGqjDtLkbCeQDkE6i3Lqz4Fw
         RTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756649331; x=1757254131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymxuWFBdkbyelysuz+qdLUoYoIL1JRtAwBGX0twc+XI=;
        b=wVbptQvilAt1FlijWSTEPSl/J2vq1kiyuK2y3yzc48cxJNGB1qdGqUOQf60r+tRQR+
         41Re58BEI0a0Dszt/KDNZ2BVgjg/mmqGkItEtKrz6RvEN/48MPQtxcJtCq38sbFlwwcU
         uJEhiTQjOzjI8szbOsH2TWCSwsihOylpktYZcTkVbEp0WO1hpFGLuYT4PRiKGbzMbkg2
         Hhbku5XFpsPaqFp0ANiAOWFUHzFJloXA631CqTy4b5ZBGc2m3wNURUJ8lrA2FUq3jXCT
         FpVHjdUGVeqOhAo6wDZrOkhyxbVSwgiNnOn6qtXPGoQwTcEuzWHrMxZvLTnmF0+0mBi3
         f8nw==
X-Forwarded-Encrypted: i=1; AJvYcCVZIOpQXrdpiPXw6vwGQNlEdCwOgmBA+bjDlEPvkRn97lGzKcqC/L0AVDv/4H31OoOLI5qix+FhRYY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuBjOtb0/M04rhBsBupAlsCEmDisQH8EDK26efDKAk+qs+Krxk
	0vlIjwcV8If4vKJwCahTPTtW4oYlONR/EUmaZGiLnHAduWzYyqQImugG
X-Gm-Gg: ASbGncvsy9lVoyxLKskcMJP+yj0RuqdpRSH8IG3NEQpenHouHhyyp2Z0mbY6+ZlPm+9
	YBEZqkBX1BBA3nbZp/WGSGWfxZdKqud2I0m8CyuY4HmQ3wWr4cuWEL3JwEhiAH1Ibayoc3OR/RM
	mEmgSHAcyB6AOBpdrBZ/bCBs6gRfgKWxMWp73R7buRbIChg8E3uQ5e2VHk6Cgot4szHgGan7+JP
	/C7Xmp3XSXTQLYYHS77GAMmnabxrsCvFcO0QzcP1/sdDzCpv6Y1G8vVmiQ5PtOjD2I0rVEKOgBl
	/DcLPjGuAhXV0+RZiCU6JnObt5sgdKMrY8m3aTXDpr6NLqQvU860MW/zgdTgVRmBMeDTxTYmu+M
	3ObWL9bKWdjqQlatxbMfQfhMIkQ==
X-Google-Smtp-Source: AGHT+IEENYWsLrPZ1v1dcAA2DkDrvl6xrWBccs2srhUoy4G98n9gjvUmL3S+PYrGsCu15J6u7jsDNA==
X-Received: by 2002:a05:6512:3c97:b0:55f:6a49:6e71 with SMTP id 2adb3069b0e04-55f708ecdadmr1159298e87.29.1756649330923;
        Sun, 31 Aug 2025 07:08:50 -0700 (PDT)
Message-ID: <c21ff32a-fc9d-4980-8d26-a3d6c1f2548c@gmail.com>
Date: Sun, 31 Aug 2025 17:08:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <e0f76a1533332cef68bfaacbdf57fd05f27764a6.1756481577.git.leonid_komarianskyi@epam.com>
 <87tt1pykqz.fsf@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <87tt1pykqz.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29.08.25 22:45, Volodymyr Babchuk wrote:
> 
> Hi Leonid,

Hello Leonid

> 
> Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:
> 
>> Currently, Xen does not support eSPI interrupts, leading
>> to a data abort when such interrupts are defined in the DTS.
>>
>> This patch introduces a separate array to initialize up to
>> 1024 interrupt descriptors in the eSPI range and adds the
>> necessary defines and helper function. These changes lay the
>> groundwork for future implementation of full eSPI interrupt
>> support. As this GICv3.1 feature is not required by all vendors,
>> all changes are guarded by ifdefs, depending on the corresponding
>> Kconfig option.
>>
>> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>>
>> ---
>> Changes in V5:
>> - no functional changes introduced by this version compared with V4, only
>>    minor fixes and removal of ifdefs for macroses
>> - added TODO comment, suggested by Oleksandr Tyshchenko
>> - changed int to unsigned int for irqs
>> - removed ifdefs for eSPI-specific defines and macros to reduce the
>>    number of ifdefs and code duplication in further changes
>> - removed reviewed-by as moving defines from ifdefs requires additional
>>    confirmation from reviewers


Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

with the following addressed ...


>>
>> Changes in V4:
>> - removed redundant line with 'default n' in Kconfig, as it is disabled
>>    by default, without explicit specification
>> - added reviewed-by from Volodymyr Babchuk
>>
>> Changes in V3:
>> - introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
>>    case of using NR_IRQS for espi_desc array
>> - implemented helper functions espi_to_desc and init_espi_data to make
>>    it possible to add stubs with the same name, and as a result, reduce
>>    the number of #ifdefs
>> - disable CONFIG_GICV3_ESPI default value to n
>>
>> Changes in V2:
>> - use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
>> - remove unnecessary comment for nr_irqs initialization
>> ---
>>   xen/arch/arm/Kconfig           |  8 +++++
>>   xen/arch/arm/include/asm/irq.h | 24 +++++++++++++++
>>   xen/arch/arm/irq.c             | 56 +++++++++++++++++++++++++++++++++-
>>   3 files changed, 87 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 17df147b25..43b05533b1 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -135,6 +135,14 @@ config GICV3
>>   	  Driver for the ARM Generic Interrupt Controller v3.
>>   	  If unsure, use the default setting.
>>   
>> +config GICV3_ESPI
>> +	bool "Extended SPI range support"
>> +	depends on GICV3 && !NEW_VGIC
>> +	help
>> +	  Allow Xen and domains to use interrupt numbers from the extended SPI
>> +	  range, from 4096 to 5119. This feature is introduced in GICv3.1
>> +	  architecture.
>> +
>>   config HAS_ITS
>>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>>           depends on GICV3 && !NEW_VGIC && !ARM_32
>> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
>> index 5bc6475eb4..4443799648 100644
>> --- a/xen/arch/arm/include/asm/irq.h
>> +++ b/xen/arch/arm/include/asm/irq.h
>> @@ -32,6 +32,13 @@ struct arch_irq_desc {
>>   #define SPI_MAX_INTID   1019
>>   #define LPI_OFFSET      8192
>>   
>> +#define ESPI_BASE_INTID 4096
>> +#define ESPI_MAX_INTID  5119
>> +#define NR_ESPI_IRQS    1024
>> +
>> +#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
>> +#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)
>> +
>>   /* LPIs are always numbered starting at 8192, so 0 is a good invalid case. */
>>   #define INVALID_LPI     0
>>   
>> @@ -39,7 +46,15 @@ struct arch_irq_desc {
>>   #define INVALID_IRQ     1023
>>   
>>   extern const unsigned int nr_irqs;
>> +#ifdef CONFIG_GICV3_ESPI
>> +/*
>> + * This will also cover the eSPI range, as some critical devices
>> + * for booting Xen (e.g., serial) may use this type of interrupts.
>> + */
>> +#define nr_static_irqs (ESPI_MAX_INTID + 1)
>> +#else
>>   #define nr_static_irqs NR_IRQS
>> +#endif
>>   
>>   struct irq_desc;
>>   struct irqaction;
>> @@ -55,6 +70,15 @@ static inline bool is_lpi(unsigned int irq)
>>       return irq >= LPI_OFFSET;
>>   }
>>   
>> +static inline bool is_espi(unsigned int irq)
>> +{
>> +#ifdef CONFIG_GICV3_ESPI
> 
> Taking into account that with CONFIG_GICV3_ESPI=n we should never have
> "irq" in eSPI range, do you really need this #ifdef? I think that
> ASSERT_UNREACHABLE in espi_to_desc() is sufficient guard.
> 
> Also, IRQ line number belongs to eSPI range regardless of CONFIG_GICV3_ESPI,
> value, so in my opinion is_espi() should always return correct value for
> a given "irq".

  ... I agree with Volodymyr's suggestion for is_espi() to always return 
correct value for a given "irq".


> 
>> +    return (irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID);
> 
> Also, you don't need parentheses here.
> 
>> +#else
>> +    return false;
>> +#endif
>> +}
>> +
>>   #define domain_pirq_to_irq(d, pirq) (pirq)
>>   
>>   bool is_assignable_irq(unsigned int irq);
>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>> index b8eccfc924..61c915c3f9 100644
>> --- a/xen/arch/arm/irq.c
>> +++ b/xen/arch/arm/irq.c
>> @@ -19,7 +19,11 @@
>>   #include <asm/gic.h>
>>   #include <asm/vgic.h>
>>   
>> +#ifdef CONFIG_GICV3_ESPI
>> +const unsigned int nr_irqs = ESPI_MAX_INTID + 1;
>> +#else
>>   const unsigned int nr_irqs = NR_IRQS;
>> +#endif
>>   
>>   static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>>   static DEFINE_SPINLOCK(local_irqs_type_lock);
>> @@ -46,6 +50,53 @@ void irq_end_none(struct irq_desc *irq)
>>   }
>>   
>>   static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
>> +#ifdef CONFIG_GICV3_ESPI
>> +/*
>> + * TODO: Consider allocating an array dynamically if
>> + * there is a need to enable GICV3_ESPI by default.
>> + */
>> +static irq_desc_t espi_desc[NR_ESPI_IRQS];
>> +
>> +static struct irq_desc *espi_to_desc(unsigned int irq)
>> +{
>> +    return &espi_desc[ESPI_INTID2IDX(irq)];
>> +}
>> +
>> +static int __init init_espi_data(void)
>> +{
>> +    unsigned int irq;
>> +
>> +    for ( irq = ESPI_BASE_INTID; irq <= ESPI_MAX_INTID; irq++ )
>> +    {
>> +        struct irq_desc *desc = irq_to_desc(irq);
>> +        int rc = init_one_irq_desc(desc);
>> +
>> +        if ( rc )
>> +            return rc;
>> +
>> +        desc->irq = irq;
>> +        desc->action  = NULL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +#else
>> +/*
>> + * This function is stub and will not be called if CONFIG_GICV3_ESPI=n,
>> + * because in this case, is_espi will always return false.

  This comment should also be updated.

>> + */
>> +static struct irq_desc *espi_to_desc(unsigned int irq)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +    return NULL;
>> +}
>> +
>> +static int __init init_espi_data(void)
>> +{
>> +    return 0;
>> +}
>> +#endif
>> +
>>   static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
>>   
>>   struct irq_desc *__irq_to_desc(unsigned int irq)
>> @@ -53,6 +104,9 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
>>       if ( irq < NR_LOCAL_IRQS )
>>           return &this_cpu(local_irq_desc)[irq];
>>   
>> +    if ( is_espi(irq) )
>> +        return espi_to_desc(irq);
>> +
>>       return &irq_desc[irq-NR_LOCAL_IRQS];
>>   }
>>   
>> @@ -79,7 +133,7 @@ static int __init init_irq_data(void)
>>           desc->action  = NULL;
>>       }
>>   
>> -    return 0;
>> +    return init_espi_data();
>>   }
>>   
>>   static int init_local_irq_data(unsigned int cpu)
> 


