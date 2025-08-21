Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1438B30061
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089095.1446784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up8Qs-0008TB-AL; Thu, 21 Aug 2025 16:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089095.1446784; Thu, 21 Aug 2025 16:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up8Qs-0008Qz-6f; Thu, 21 Aug 2025 16:46:34 +0000
Received: by outflank-mailman (input) for mailman id 1089095;
 Thu, 21 Aug 2025 16:46:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1up8Qr-0008Qt-Na
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:46:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1up8Qq-00GpQY-2w;
 Thu, 21 Aug 2025 16:46:33 +0000
Received: from [15.248.3.91] (helo=[10.24.67.183])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1up8Qq-00Bnqg-2l;
 Thu, 21 Aug 2025 16:46:32 +0000
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
	bh=+0lkCV090rIFSFmfhqeOvyqRDN9AzFMzd5/VecMNCds=; b=6cZS7SnsRwsnH95xiibQqm4+vq
	OPTOTopUuw/oF2sIdpC+ResOqCRGiVOxM8VHzc+XnNvM+g0f+IbW5y6r0Aq2hWrRAYnOfFYNCeMtK
	Pm6RwFfua3zbPzRhusYgg7XjY/l2d4KRoaveb7fsRUcibTLxE9OxXCqB5nwAsR4T0pRo=;
Message-ID: <9922f7f1-7249-424e-9bab-3aee2ce3b813@xen.org>
Date: Thu, 21 Aug 2025 17:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <418e7e8082fa8f7b6659ff8cae3beb773803ca47.1754568795.git.leonid_komarianskyi@epam.com>
 <87ms7sekdx.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87ms7sekdx.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/08/2025 16:59, Volodymyr Babchuk wrote:
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
> 
> I don't think that it is a good idea to hide this feature under Kconfig
> option, as this will increase number of different build variants.
 > I believe that runtime check for GICD_TYPER.ESPI should be 
sufficient,> but maintainers can correct me there.

I haven't seen many board with ESPI available. So I think it would be 
better if this is under a Kconfig because not everyone may want to have 
the code.

[...]

>>   struct irq_desc;
>>   struct irqaction;
>> @@ -55,6 +71,15 @@ static inline bool is_lpi(unsigned int irq)
>>       return irq >= LPI_OFFSET;
>>   }
>>   
>> +static inline bool is_espi(unsigned int irq)
>> +{
>> +#ifdef CONFIG_GICV3_ESPI
>> +    return (irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID);
>> +#else
>> +    return false;
>> +#endif
>> +}
>> +
>>   #define domain_pirq_to_irq(d, pirq) (pirq)
>>   
>>   bool is_assignable_irq(unsigned int irq);
>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>> index 50e57aaea7..9bc72fbbc9 100644
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
>> @@ -46,6 +50,9 @@ void irq_end_none(struct irq_desc *irq)
>>   }
>>   
>>   static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
>> +#ifdef CONFIG_GICV3_ESPI
>> +static irq_desc_t espi_desc[NR_IRQS];

By how much will this increase the Xen binary?

> 
> This is really confusing. Should it be something like espi_desc[NR_ESPI_IRQS]?

+1.

Cheers,

-- 
Julien Grall


