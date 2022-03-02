Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2A4CA118
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 10:46:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282142.480740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPLYZ-0001Am-J4; Wed, 02 Mar 2022 09:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282142.480740; Wed, 02 Mar 2022 09:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPLYZ-00017T-Dv; Wed, 02 Mar 2022 09:46:03 +0000
Received: by outflank-mailman (input) for mailman id 282142;
 Wed, 02 Mar 2022 09:46:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6jXW=TN=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nPLYX-00017N-Ho
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 09:46:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 90d100f5-9a0d-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 10:45:59 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29DCD1042;
 Wed,  2 Mar 2022 01:45:59 -0800 (PST)
Received: from [10.57.71.82] (unknown [10.57.71.82])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0FF93F66F;
 Wed,  2 Mar 2022 01:45:57 -0800 (PST)
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
X-Inumbo-ID: 90d100f5-9a0d-11ec-8539-5f4723681683
Message-ID: <8ee87286-6e35-ddb7-9216-b663f3290570@arm.com>
Date: Wed, 2 Mar 2022 10:45:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen/arm: gic: Introduce GIC_PRI_{IRQ/IPI}_ALL
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220302090212.115922-1-michal.orzel@arm.com>
 <2243c7f9-b0c7-83be-9ac0-5538436e4d6c@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <2243c7f9-b0c7-83be-9ac0-5538436e4d6c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Julien,

On 3/2/22 10:40, Julien Grall wrote:
> Hi Michal,
> 
> On 02/03/2022 09:02, Michal Orzel wrote:
>> Introduce macros GIC_PRI_IRQ_ALL and GIC_PRI_IPI_ALL to be used in all
>> the places where we want to set default priority for all the offsets
>> in interrupt priority register. This will improve readability and
>> allow to get rid of introducing variables just to store this value.
>>
>> Take the opportunity to mark GIC_PRI_{IRQ/IPI} as unsigned values
>> to suppress static analyzer warnings as they are used in expressions
>> exceeding integer range (shifting into signed bit). Modify also other
>> priority related macros to be coherent.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>   xen/arch/arm/gic-v2.c          | 12 +++---------
>>   xen/arch/arm/gic-v3.c          | 16 +++-------------
>>   xen/arch/arm/include/asm/gic.h | 12 ++++++++----
>>   3 files changed, 14 insertions(+), 26 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
>> index b2adc8ec9a..2cc2f6bc18 100644
>> --- a/xen/arch/arm/gic-v2.c
>> +++ b/xen/arch/arm/gic-v2.c
>> @@ -373,9 +373,7 @@ static void __init gicv2_dist_init(void)
>>         /* Default priority for global interrupts */
>>       for ( i = 32; i < nr_lines; i += 4 )
>> -        writel_gicd(GIC_PRI_IRQ << 24 | GIC_PRI_IRQ << 16 |
>> -                    GIC_PRI_IRQ << 8 | GIC_PRI_IRQ,
>> -                    GICD_IPRIORITYR + (i / 4) * 4);
>> +        writel_gicd(GIC_PRI_IRQ_ALL, GICD_IPRIORITYR + (i / 4) * 4);
>>         /* Disable all global interrupts */
>>       for ( i = 32; i < nr_lines; i += 32 )
>> @@ -403,15 +401,11 @@ static void gicv2_cpu_init(void)
>>         /* Set SGI priorities */
>>       for ( i = 0; i < 16; i += 4 )
>> -        writel_gicd(GIC_PRI_IPI << 24 | GIC_PRI_IPI << 16 |
>> -                    GIC_PRI_IPI << 8 | GIC_PRI_IPI,
>> -                    GICD_IPRIORITYR + (i / 4) * 4);
>> +        writel_gicd(GIC_PRI_IPI_ALL, GICD_IPRIORITYR + (i / 4) * 4);
>>         /* Set PPI priorities */
>>       for ( i = 16; i < 32; i += 4 )
>> -        writel_gicd(GIC_PRI_IRQ << 24 | GIC_PRI_IRQ << 16 |
>> -                    GIC_PRI_IRQ << 8 | GIC_PRI_IRQ,
>> -                    GICD_IPRIORITYR + (i / 4) * 4);
>> +        writel_gicd(GIC_PRI_IRQ_ALL, GICD_IPRIORITYR + (i / 4) * 4);
>>         /* Local settings: interface controller */
>>       /* Don't mask by priority */
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index 9a3a175ad7..3c472ed768 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -594,7 +594,6 @@ static void gicv3_set_irq_priority(struct irq_desc *desc,
>>   static void __init gicv3_dist_init(void)
>>   {
>>       uint32_t type;
>> -    uint32_t priority;
>>       uint64_t affinity;
>>       unsigned int nr_lines;
>>       int i;
>> @@ -621,11 +620,7 @@ static void __init gicv3_dist_init(void)
>>         /* Default priority for global interrupts */
>>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i += 4 )
>> -    {
>> -        priority = (GIC_PRI_IRQ << 24 | GIC_PRI_IRQ << 16 |
>> -                    GIC_PRI_IRQ << 8 | GIC_PRI_IRQ);
>> -        writel_relaxed(priority, GICD + GICD_IPRIORITYR + (i / 4) * 4);
>> -    }
>> +        writel_relaxed(GIC_PRI_IRQ_ALL, GICD + GICD_IPRIORITYR + (i / 4) * 4);
>>         /* Disable/deactivate all global interrupts */
>>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i += 32 )
>> @@ -806,7 +801,6 @@ static int __init gicv3_populate_rdist(void)
>>   static int gicv3_cpu_init(void)
>>   {
>>       int i, ret;
>> -    uint32_t priority;
>>         /* Register ourselves with the rest of the world */
>>       if ( gicv3_populate_rdist() )
>> @@ -826,16 +820,12 @@ static int gicv3_cpu_init(void)
>>       }
>>         /* Set priority on PPI and SGI interrupts */
>> -    priority = (GIC_PRI_IPI << 24 | GIC_PRI_IPI << 16 | GIC_PRI_IPI << 8 |
>> -                GIC_PRI_IPI);
>>       for (i = 0; i < NR_GIC_SGI; i += 4)
>> -        writel_relaxed(priority,
>> +        writel_relaxed(GIC_PRI_IPI_ALL,
>>                   GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + (i / 4) * 4);
>>   -    priority = (GIC_PRI_IRQ << 24 | GIC_PRI_IRQ << 16 | GIC_PRI_IRQ << 8 |
>> -                GIC_PRI_IRQ);
>>       for (i = NR_GIC_SGI; i < NR_GIC_LOCAL_IRQS; i += 4)
>> -        writel_relaxed(priority,
>> +        writel_relaxed(GIC_PRI_IRQ_ALL,
>>                   GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + (i / 4) * 4);
>>         /*
>> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
>> index c7f0c343d1..69ceac36b1 100644
>> --- a/xen/arch/arm/include/asm/gic.h
>> +++ b/xen/arch/arm/include/asm/gic.h
>> @@ -143,10 +143,14 @@
>>    *
>>    * A GIC must support a mimimum of 16 priority levels.
>>    */
>> -#define GIC_PRI_LOWEST     0xf0
>> -#define GIC_PRI_IRQ        0xa0
>> -#define GIC_PRI_IPI        0x90 /* IPIs must preempt normal interrupts */
>> -#define GIC_PRI_HIGHEST    0x80 /* Higher priorities belong to Secure-World */
>> +#define GIC_PRI_LOWEST     0xf0U
>> +#define GIC_PRI_IRQ        0xa0U
>> +#define GIC_PRI_IRQ_ALL    ((GIC_PRI_IRQ << 24) | (GIC_PRI_IRQ << 16) |\
>> +                            (GIC_PRI_IRQ << 8) | GIC_PRI_IRQ)
>> +#define GIC_PRI_IPI        0x90U /* IPIs must preempt normal interrupts */
>> +#define GIC_PRI_IPI_ALL    ((GIC_PRI_IPI << 24) | (GIC_PRI_IPI << 16) |\
>> +                            (GIC_PRI_IPI << 8) | GIC_PRI_IPI)
> This is matter of taste. I think it would read better to keep GIC_PRI_{LOWEST, IRQ, IPI, HIGHEST} defined together and then define *_ALL separately.
> 
Ok, I will do this in v2.
>> +#define GIC_PRI_HIGHEST    0x80U /* Higher priorities belong to Secure-World */
> 
> NIT: While you are there, I would suggest to add a newline here. So we separate priority definitions from handy helpers.
> 
Ok.
>>   #define GIC_PRI_TO_GUEST(pri) (pri >> 3) /* GICH_LR and GICH_VMCR only support
>>                                               5 bits for guest irq priority */
> 
> Other than that. The patch itself looks good to me. So:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Cheers,
> 

Cheers,
Michal

