Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86608B43E09
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 16:07:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110243.1459511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAbX-0001wB-Mr; Thu, 04 Sep 2025 14:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110243.1459511; Thu, 04 Sep 2025 14:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAbX-0001t2-Jn; Thu, 04 Sep 2025 14:06:23 +0000
Received: by outflank-mailman (input) for mailman id 1110243;
 Thu, 04 Sep 2025 14:06:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uuAbW-0001sw-4K
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 14:06:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuAbQ-006HlP-1F;
 Thu, 04 Sep 2025 14:06:16 +0000
Received: from [15.248.2.239] (helo=[10.24.66.11])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuAbQ-00FiYY-1F;
 Thu, 04 Sep 2025 14:06:16 +0000
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
	bh=kfFkrV1cOs3OOH0TuC/ydb3Fc5DnfzmsIo91t8WmrP4=; b=uw4Bw9zKO55t4T6jTKyKfa+r3M
	w6+6KaWopfTEMHwX9RbFiVLP/s1xO2PhufXdqpFxNrcePAkzE6lfuT4iZW3xADTjpfF/7ZkY+tgtO
	8CCvcWOycm4wFciDnNTJqBS7+Z+WknhzqymZn+6Q1vwFBHqeuqKamLJf+36JxW2nfAUw=;
Message-ID: <10c41b57-d02b-44d4-af48-ac3ed2f416b5@xen.org>
Date: Thu, 4 Sep 2025 15:06:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
 <bdaec9b9704a6f21325b507365a165cce89cca16.1756908472.git.leonid_komarianskyi@epam.com>
 <aa9456c8-f997-4aad-96ba-db8fb7659b5d@xen.org>
 <eb80f8b5-b36f-4ebb-a2ce-72eb2fb02927@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <eb80f8b5-b36f-4ebb-a2ce-72eb2fb02927@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Leonid,

On 04/09/2025 14:09, Leonid Komarianskyi wrote:
> On 04.09.25 15:27, Julien Grall wrote:
>> Hi Leonid,
>>
>> On 03/09/2025 15:29, Leonid Komarianskyi wrote:
>>> ---
>>>    xen/arch/arm/Kconfig           |  8 +++++
>>>    xen/arch/arm/include/asm/irq.h | 37 ++++++++++++++++++++++++
>>>    xen/arch/arm/irq.c             | 53 ++++++++++++++++++++++++++++++++--
>>>    3 files changed, 96 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 17df147b25..43b05533b1 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -135,6 +135,14 @@ config GICV3
>>>          Driver for the ARM Generic Interrupt Controller v3.
>>>          If unsure, use the default setting.
>>> +config GICV3_ESPI
>>> +    bool "Extended SPI range support"
>>> +    depends on GICV3 && !NEW_VGIC
>>> +    help
>>> +      Allow Xen and domains to use interrupt numbers from the
>>> extended SPI
>>> +      range, from 4096 to 5119. This feature is introduced in GICv3.1
>>> +      architecture.
>>> +
>>>    config HAS_ITS
>>>            bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if
>>> UNSUPPORTED
>>>            depends on GICV3 && !NEW_VGIC && !ARM_32
>>> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/
>>> asm/irq.h
>>> index 5bc6475eb4..f4d0997651 100644
>>> --- a/xen/arch/arm/include/asm/irq.h
>>> +++ b/xen/arch/arm/include/asm/irq.h
>>> @@ -32,6 +32,10 @@ struct arch_irq_desc {
>>>    #define SPI_MAX_INTID   1019
>>>    #define LPI_OFFSET      8192
>>> +#define ESPI_BASE_INTID 4096
>>> +#define ESPI_MAX_INTID  5119
>>> +#define NR_ESPI_IRQS    1024
>>> +
>>>    /* LPIs are always numbered starting at 8192, so 0 is a good invalid
>>> case. */
>>>    #define INVALID_LPI     0
>>> @@ -39,7 +43,12 @@ struct arch_irq_desc {
>>>    #define INVALID_IRQ     1023
>>>    extern const unsigned int nr_irqs;
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +/* This will cover the eSPI range, to allow asignmant of eSPIs to
>>> domains. */
>>> +#define nr_static_irqs (ESPI_MAX_INTID + 1)
>>> +#else
>>>    #define nr_static_irqs NR_IRQS
>>> +#endif
>>>    struct irq_desc;
>>>    struct irqaction;
>>> @@ -55,6 +64,34 @@ static inline bool is_lpi(unsigned int irq)
>>>        return irq >= LPI_OFFSET;
>>>    }
>>> +static inline unsigned int espi_intid_to_idx(unsigned int intid)
>>> +{
>>> +    ASSERT(intid >= ESPI_BASE_INTID && intid <= ESPI_MAX_INTID);
>>
>> Can we use is_espi()?
>>
> 
> Yes, sure. I just need to change the function declaration order and then
> I can use is_espi() here. I will do this in V7.
> 
>>> +    return intid - ESPI_BASE_INTID;
>>> +}
>>> +
>>> +static inline unsigned int espi_idx_to_intid(unsigned int idx)
>>> +{
>>> +    ASSERT(idx <= NR_ESPI_IRQS);
>>> +    return idx + ESPI_BASE_INTID;
>>> +}
>>> +
>>> +static inline bool is_espi(unsigned int irq)
>>> +{
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +    return irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID;
>>> +#else
>>> +    /*
>>> +     * The function should not be called for eSPIs when
>>> CONFIG_GICV3_ESPI is
>>> +     * disabled. Returning false allows the compiler to optimize the
>>> code
>>> +     * when the config is disabled, while the assert ensures that
>>> out-of-range
>>> +     * array resources are not accessed, e.g., in __irq_to_desc().
>>> +     */
>>> +    ASSERT(irq >= ESPI_BASE_INTID);
>>
>> Regardless what Volodymyr mentioned about the assert!(), I am a bit
>> unsure where we guarantee is_espi() will not be called with an irq <=
>> ESPI_BASE_INTID. In fact, we could have the following code in Xen:
>>
>> if (is_espi(irq))
>> {
>> }
>> else if (is_lpi(irq))
>> {
>> }
>> else
>> {
>> }
>>
>> We could replace the check with "!(irq >= ESPI_BASE_INTID && irq <=
>> ESPI_MAX_INTID)". But I would actually prefer if there is no check
>> because I don't see the value.
>>
> 
> The main reason to add ASSERT here is to trigger it if the config is
> disabled but an eSPI INTID is defined in Xen DTS. 

I will not insist on remove the ASSERT(). However, it could correct and 
we should avoid relying on ASSERT() to catch DTS bugs. Because...

> In this case, instead
> of triggering an ASSERT (as proposed), the following will occur in
> __irq_to_desc:
> 
> // Assume we have irq = 4096
> struct irq_desc *__irq_to_desc(unsigned int irq)
> {
>       // This check will return false
>       if ( irq < NR_LOCAL_IRQS )
>           return &this_cpu(local_irq_desc)[irq];
> 
>       /*
>        * This check will also return false because is_espi()
>        * will always return false when CONFIG_GICV3_ESPI=n.
>        */
>       if ( is_espi(irq) )
>           return espi_to_desc(irq);
> 
>       /*
>        * We will fall through to this point and attempt to access 4064,
>        * which does not exist
>        */
>       return &irq_desc[irq-NR_LOCAL_IRQS];
> }
> 
> So, I think it's better to use ASSERT to simplify error detection in
> debug builds.

... no everyone will use debug build. So if this is the purpose of the 
ASSERT() then we need to have another runtime check during the parsing 
of the DTS.

Cheers,

-- 
Julien Grall


