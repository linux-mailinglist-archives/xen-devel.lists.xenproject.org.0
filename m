Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F93B300C7
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 19:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089138.1446814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up8rB-0006AG-SB; Thu, 21 Aug 2025 17:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089138.1446814; Thu, 21 Aug 2025 17:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up8rB-00068n-Od; Thu, 21 Aug 2025 17:13:45 +0000
Received: by outflank-mailman (input) for mailman id 1089138;
 Thu, 21 Aug 2025 17:13:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1up8rA-00068h-Ee
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 17:13:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1up8r9-00Gpvi-2X;
 Thu, 21 Aug 2025 17:13:43 +0000
Received: from [15.248.3.91] (helo=[10.24.67.183])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1up8r9-00BuxJ-2Z;
 Thu, 21 Aug 2025 17:13:43 +0000
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
	bh=lw8lv5aup/iNhiS78j3Zz11bdRXwzlz069IIS+SQ16A=; b=qYUi3FiH6Inji9xfrnVjLalI8l
	PJo3RmyVcDWKcZDXGwi1jUj2kcl6A/vBrWsIvGtrmdfBGOnzJ3n1Wqn+6cfFtOb7TSUxghzpRVrYC
	h1gmxVOtmbDFcP/SFtfa7g9zZSkexx/4RXsPBcvEcIKdsqwvjYSAj8owhrQFFQveWu5k=;
Message-ID: <20328499-772c-4b32-815e-7527aa6b2cc7@xen.org>
Date: Thu, 21 Aug 2025 18:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <418e7e8082fa8f7b6659ff8cae3beb773803ca47.1754568795.git.leonid_komarianskyi@epam.com>
 <87ms7sekdx.fsf@epam.com> <9922f7f1-7249-424e-9bab-3aee2ce3b813@xen.org>
 <87frdkd31m.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87frdkd31m.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/08/2025 17:59, Volodymyr Babchuk wrote:
> Julien Grall <julien@xen.org> writes:
> 
>> Hi,
>>
>> On 21/08/2025 16:59, Volodymyr Babchuk wrote:
>>> Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:
>>>
>>>> Currently, Xen does not support eSPI interrupts, leading
>>>> to a data abort when such interrupts are defined in the DTS.
>>>>
>>>> This patch introduces a separate array to initialize up to
>>>> 1024 interrupt descriptors in the eSPI range and adds the
>>>> necessary defines and helper function. These changes lay the
>>>> groundwork for future implementation of full eSPI interrupt
>>>> support. As this GICv3.1 feature is not required by all vendors,
>>>> all changes are guarded by ifdefs, depending on the corresponding
>>>> Kconfig option.
>>> I don't think that it is a good idea to hide this feature under
>>> Kconfig
>>> option, as this will increase number of different build variants.
>>> I believe that runtime check for GICD_TYPER.ESPI should be
>>    sufficient,> but maintainers can correct me there.
>>
>> I haven't seen many board with ESPI available. So I think it would be
>> better if this is under a Kconfig because not everyone may want to
>> have the code.
> 
> Probably, we can expect more in the future...

Well yes. But I was under the impression this the preferred approach. 
See the discussion about disabling 32-bit support on 64-bit:

20250723075835.3993182-1-grygorii_strashko@epam.com

  Anyways, after reviewing
> all patches in the series, I can see that code will be littered with
> #ifdef CONFIG_GICV3_ESPI, which, probably, not a good thing.

The solution is to provide wrappers to reduce the number of #ifdef. I 
haven't checked all the places.
> 
>>
>> [...]
>>
>>>>    struct irq_desc;
>>>>    struct irqaction;
>>>> @@ -55,6 +71,15 @@ static inline bool is_lpi(unsigned int irq)
>>>>        return irq >= LPI_OFFSET;
>>>>    }
>>>>    +static inline bool is_espi(unsigned int irq)
>>>> +{
>>>> +#ifdef CONFIG_GICV3_ESPI
>>>> +    return (irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID);
>>>> +#else
>>>> +    return false;
>>>> +#endif
>>>> +}
>>>> +
>>>>    #define domain_pirq_to_irq(d, pirq) (pirq)
>>>>      bool is_assignable_irq(unsigned int irq);
>>>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>>>> index 50e57aaea7..9bc72fbbc9 100644
>>>> --- a/xen/arch/arm/irq.c
>>>> +++ b/xen/arch/arm/irq.c
>>>> @@ -19,7 +19,11 @@
>>>>    #include <asm/gic.h>
>>>>    #include <asm/vgic.h>
>>>>    +#ifdef CONFIG_GICV3_ESPI
>>>> +const unsigned int nr_irqs = ESPI_MAX_INTID + 1;
>>>> +#else
>>>>    const unsigned int nr_irqs = NR_IRQS;
>>>> +#endif
>>>>      static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>>>>    static DEFINE_SPINLOCK(local_irqs_type_lock);
>>>> @@ -46,6 +50,9 @@ void irq_end_none(struct irq_desc *irq)
>>>>    }
>>>>      static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
>>>> +#ifdef CONFIG_GICV3_ESPI
>>>> +static irq_desc_t espi_desc[NR_IRQS];
>>
>> By how much will this increase the Xen binary?
> 
> I am wondering this also. The struct is cache aligned, so it will take
> at least 128 bytes. The whole array will take at least 128kb. Not
> great, not terrible. As this should go to .bss, it should not increase
> the binary itself.

I guess "binary" was the wrong word. I was referring to the size of the 
Xen in memory. On my setup Xen is 1448kb. Here you would increase ~9% of 
resident size. This seems quite steep for a feature that is not often used.

> 
> Maybe it is better to allocate this dynamically? I do understand that we
> want to get rid of as many dynamic allocs as possible, but maybe in this
> case it will be okay.

This is up to Leonid. I don't think this is strictly necessary in order 
to get the eSPI support. However, until this is solved CONFIG_GICV3_EPSI 
*must not* be on by default as this is done in this patch.

> As a bonus point, we can't leave this pointer
> present even if CONFIG_GICV3_ESPI=n, which will simplify some code in
> latter patches.

Did you intend to say "We can leave" rather than "we can't leave"?

Cheers,

-- 
Julien Grall


