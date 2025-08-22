Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A14DB31372
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 11:39:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089769.1447267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upOEZ-0004Ja-Sh; Fri, 22 Aug 2025 09:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089769.1447267; Fri, 22 Aug 2025 09:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upOEZ-0004HK-PE; Fri, 22 Aug 2025 09:38:55 +0000
Received: by outflank-mailman (input) for mailman id 1089769;
 Fri, 22 Aug 2025 09:38:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1upOEY-0004HE-5i
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 09:38:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1upOEX-000lQ9-0i;
 Fri, 22 Aug 2025 09:38:53 +0000
Received: from [2a02:8012:3a1:0:25b0:6b73:1ad:6d5d]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1upOEX-00CuwE-0J;
 Fri, 22 Aug 2025 09:38:53 +0000
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
	bh=Pvez49rUvGvlQz7rTJ2K17IkfnF54blBpbjKcPNQw/0=; b=IA0eYOI6pWG6bj2GkwpX3ZfB/x
	zMUadFtYa7g+kR+4mGwn30lCImvM8b4TMrF7Qo2BISdrKHoFrxIeo4u21arTEVD0qg3SLD3ToOW81
	nhFM5Et2JhRM8V0GdoNwxkONGxXFEId8YHY6awMUx+QS5tirkJUXG4a08KEjZqKA1RTU=;
Message-ID: <26a5f2dc-0eaa-49b0-b15f-482a47808051@xen.org>
Date: Fri, 22 Aug 2025 10:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] xen/arm: gicv3: refactor obtaining GIC addresses
 for common operations
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1754514206.git.leonid_komarianskyi@epam.com>
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <915641a6-8cc6-45bf-a1ee-d69b286e7d30@xen.org>
 <b2b7906c-d810-4162-b700-7f1dc2153f4b@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b2b7906c-d810-4162-b700-7f1dc2153f4b@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Leonid,

On 22/08/2025 10:09, Leonid Komarianskyi wrote:
 > Thank you for your close review.>>> ---
>>>    xen/arch/arm/gic-v3.c          | 99 ++++++++++++++++++++++------------
>>>    xen/arch/arm/include/asm/irq.h |  1 +
>>>    2 files changed, 67 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>> index cd3e1acf79..8fd78aba44 100644
>>> --- a/xen/arch/arm/gic-v3.c
>>> +++ b/xen/arch/arm/gic-v3.c
>>> @@ -445,17 +445,62 @@ static void gicv3_dump_state(const struct vcpu *v)
>>>        }
>>>    }
>>> +static void __iomem *get_addr_by_offset(struct irq_desc *irqd, u32
>>> offset)
>>> +{
>>> +    switch ( irqd->irq )
>>> +    {
>>> +    case 0 ... (NR_GIC_LOCAL_IRQS - 1):
>>> +        switch ( offset )
>>> +        {
>>> +        case GICD_ISENABLER:
>>> +        case GICD_ICENABLER:
>>> +        case GICD_ISPENDR:
>>> +        case GICD_ICPENDR:
>>> +        case GICD_ISACTIVER:
>>> +        case GICD_ICACTIVER:
>>> +            return (GICD_RDIST_SGI_BASE + offset);
>>> +        case GICD_ICFGR:
>>> +            return (GICD_RDIST_SGI_BASE + GICR_ICFGR1);
>>> +        case GICD_IPRIORITYR:
>>> +            return (GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irqd->irq);
>>> +        default:
>>> +            break;
>>> +        }
>>> +    case NR_GIC_LOCAL_IRQS ... SPI_MAX_INTID:
>>> +        switch ( offset )
>>> +        {
>>> +        case GICD_ISENABLER:
>>> +        case GICD_ICENABLER:
>>> +        case GICD_ISPENDR:
>>> +        case GICD_ICPENDR:
>>> +        case GICD_ISACTIVER:
>>> +        case GICD_ICACTIVER:
>>> +            return (GICD + offset + (irqd->irq / 32) * 4);
>>> +        case GICD_ICFGR:
>>> +            return (GICD + GICD_ICFGR + (irqd->irq / 16) * 4);
>>> +        case GICD_IROUTER:
>>> +            return (GICD + GICD_IROUTER + irqd->irq * 8);
>>> +        case GICD_IPRIORITYR:
>>> +            return (GICD + GICD_IPRIORITYR + irqd->irq);
>>> +        default:
>>> +            break;
>>> +        }
>>> +    default:
>>> +        break;
>>> +    }
>>> +
>>> +    /* Something went wrong, we shouldn't be able to reach here */
>>   > +    panic("Invalid offset 0x%x for IRQ#%d", offset, irqd->irq);
>>
>> ... I still quite concerned about using panic here. We need to try to
>> handle the error more gracefully in production.
>>
>> Cheers,
>>
> 
> I was thinking about this again, and maybe it would be better to change
> the panic into simply printing an error using printk(XENLOG_G_ERR ...)
> and adding proper checks to ensure the return value is not NULL in the
> callers.

Given the error is not meant to happen, after the printk() I would add 
an ASSERT_UNREACHABLE() so we can catch issue in DEBUG build more easily.

> Also, in the case of gicv3_peek_irq, which must return a boolean value
> (due to the generic API for gicv3_read_pending_state), we could return
> false with an additional warning message that we are unable to read the
> actual value due to incorrect parameters; therefore, we return false.
> What do you think about this approach?

It makes sense to read false as the interrupt technically doesn't exist. 
But I don't think we should add an extra warning. The one in 
get_addr_by_offset() should be sufficient.

Cheers,

-- 
Julien Grall


