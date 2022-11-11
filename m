Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6086260B1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 18:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442686.697109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otYDK-00038I-4h; Fri, 11 Nov 2022 17:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442686.697109; Fri, 11 Nov 2022 17:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otYDK-00035N-1u; Fri, 11 Nov 2022 17:53:14 +0000
Received: by outflank-mailman (input) for mailman id 442686;
 Fri, 11 Nov 2022 17:53:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1otYDJ-00035H-49
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 17:53:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1otYDI-0005m6-N5; Fri, 11 Nov 2022 17:53:12 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.11.31]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1otYDI-0002Gs-G5; Fri, 11 Nov 2022 17:53:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=7x4fSVNoFVXEjjkkkEI9Pyq+oOD42XESGGKw/cmc6BM=; b=InBXtNR6qEQ7FVPnqY4aW6PGS2
	300p46B0qIwAKCC6Yp5BRq4cQbuotbQfRn/vPgeepsU/yTNMc2lD1JeagKiiOEWifGOAwAtJ2sdnv
	FmAQS0+JDG0gbPDn+Qua9Snt3JRgSTjvzEn0+UrzYz5Qa83KftpNbdUjgYzlQ1MEPu/Y=;
Message-ID: <36c7f27d-10c7-b4fd-c775-a247660ec125@xen.org>
Date: Fri, 11 Nov 2022 17:53:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v3 11/12] xen/Arm: GICv3: Define macros to read/write 64 bit
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-12-ayan.kumar.halder@amd.com>
 <3ea29174-abb4-0fe9-fde8-28d4d62f2f67@gmail.com>
 <96e799be-fc98-3457-2243-c979162e8a79@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <96e799be-fc98-3457-2243-c979162e8a79@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/11/2022 17:37, Ayan Kumar Halder wrote:
> 
> On 11/11/2022 16:17, Xenia Ragiadakou wrote:
>> Hi Ayan,
> Hi Xenia,
>>
>> On 11/11/22 16:17, Ayan Kumar Halder wrote:
>>> On AArch32, ldrd/strd instructions are not atomic when used to access 
>>> MMIO.
>>> Furthermore, ldrd/strd instructions are not decoded by Arm when 
>>> running as
>>> a guest to access emulated MMIO region.
>>> Thus, we have defined 
>>> readq_relaxed_non_atomic()/writeq_relaxed_non_atomic()
>>> which in turn calls readl_relaxed()/writel_relaxed() for the lower 
>>> and upper
>>> 32 bits.
>>> As GICv3 registers (GICD_IROUTER, GICR_TYPER) can be accessed in a 
>>> non atomic
>>> fashion, so we have used {read/write}q_relaxed_non_atomic() on Arm32.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>
>>> Changes from :-
>>> v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
>>> 2. No need to use le64_to_cpu() as the returned byte order is already 
>>> in cpu
>>> endianess.
>>>
>>> v2 - 1. Replace {read/write}q_relaxed with 
>>> {read/write}q_relaxed_non_atomic().
>>>
>>>   xen/arch/arm/gic-v3.c               | 12 ++++++++++++
>>>   xen/arch/arm/include/asm/arm32/io.h |  9 +++++++++
>>>   2 files changed, 21 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>> index 6457e7033c..a5bc549765 100644
>>> --- a/xen/arch/arm/gic-v3.c
>>> +++ b/xen/arch/arm/gic-v3.c
>>> @@ -651,7 +651,11 @@ static void __init gicv3_dist_init(void)
>>>       affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
>>>         for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
>>> +#ifdef CONFIG_ARM_32
>>> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i 
>>> * 8);
>>> +#else
>>>           writeq_relaxed(affinity, GICD + GICD_IROUTER + i * 8);
>>> +#endif

I would have been OK if there was one place needed a #ifdef. But 2 is a 
bit too much.

Please provide a wrapper writeq_relaxed_non_atomic() for arm64. The 
implementation would call writeq(). The same stands for...

>>>   }
>>>     static int gicv3_enable_redist(void)
>>> @@ -745,7 +749,11 @@ static int __init gicv3_populate_rdist(void)
>>>           }
>>>             do {
>>> +#ifdef CONFIG_ARM_32
>>> +            typer = readq_relaxed_non_atomic(ptr + GICR_TYPER);
>>> +#else
>>>               typer = readq_relaxed(ptr + GICR_TYPER);
>>> +#endif

... here.

>>>                 if ( (typer >> 32) == aff )
>>>               {
>>> @@ -1265,7 +1273,11 @@ static void gicv3_irq_set_affinity(struct 
>>> irq_desc *desc, const cpumask_t *mask)
>>>       affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
>>>         if ( desc->irq >= NR_GIC_LOCAL_IRQS )
>>> +#ifdef CONFIG_ARM_32
>>> +        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + 
>>> desc->irq * 8));
>>> +#else
>>>           writeq_relaxed(affinity, (GICD + GICD_IROUTER + desc->irq * 
>>> 8));
>>> +#endif
>>>         spin_unlock(&gicv3.lock);
>>>   }
>>> diff --git a/xen/arch/arm/include/asm/arm32/io.h 
>>> b/xen/arch/arm/include/asm/arm32/io.h
>>> index 73a879e9fb..4ddfbea5c2 100644
>>> --- a/xen/arch/arm/include/asm/arm32/io.h
>>> +++ b/xen/arch/arm/include/asm/arm32/io.h
>>> @@ -80,17 +80,26 @@ static inline u32 __raw_readl(const volatile void 
>>> __iomem *addr)
>>>                                           __raw_readw(c)); __r; })
>>>   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
>>>                                           __raw_readl(c)); __r; })
>>> +#define readq_relaxed_non_atomic(c) \
>>> +                         ({ u64 __r = (((u64)readl_relaxed((c) + 4)) 
>>> << 32) | \
>>> +                                             readl_relaxed(c); __r; })
>>
>> As Julien pointed out, the expression c will be evaluated twice and if 
>> it produces side effects they will be performed twice.
>> To prevent this, you can either assign the expression to a local 
>> variable and pass this one to readl_relaxed() 
> 
> Just to make sure I understand you correctly, you are suggesting this :-
> 
> #define readq_relaxed_non_atomic(c) \
> 
>                          ({ void _iomem *__addr = (c); \
> 
>                              u64 __r = (((u64)readl_relaxed(__addr + 4)) 
> << 32) | \
> 
> readl_relaxed(__addr); __r; })
> 
> #define writeq_relaxed_non_atomic(v,c) \
> 
>                         (( u64 __v = (v); \
> 
>                            void _iomem *__addr = (c); \
> 
>                            writel_relaxed((u32)__v, __addr); \
> 
>                            writel_relaxed((u32)((__v) >> 32), (__addr + 
> 4); })


> 
> Is this correct understanding ?
> 
>> or use a static inline function instead of a macro, for implementing 
>> readq_relaxed_non_atomic().
>> The latter is the MISRA C recommended (not strictly required) approach 
>> according to Dir 4.9 "A function should be used in preference to a 
>> function-like macro where
>>  they are interchangeable".
> 
> I have mixed opinion about this.
> 
> On one hand, there will be a performance penalty when invoking a 
> function (compared to macro).

Most of the compilers are nowadays clever enough to inline small 
functions. But we can force the compiler with the attribute always_inline.

> 
> On the other hand {readq/writeq}_relaxed_non_atomic() are called during 
> init (gicv3 initialization, setting up the interrupt handlers), so the 
> impact will not be bad.
> 
> I am fine with whatever you and any maintainer suggest.

Project wide, we are trying to use "static inline" whenever it is 
possible because it adds a bit more type-safety (the error you made 
wouldn't have happened) and the code is clearer (no slash).

So my preference is to use static line.

Cheers,

-- 
Julien Grall

