Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D8D42D613
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 11:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209158.365521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1max3n-0000cZ-A7; Thu, 14 Oct 2021 09:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209158.365521; Thu, 14 Oct 2021 09:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1max3n-0000Zq-6c; Thu, 14 Oct 2021 09:29:59 +0000
Received: by outflank-mailman (input) for mailman id 209158;
 Thu, 14 Oct 2021 09:29:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1max3l-0000Zk-9t
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 09:29:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1max3l-00059L-1w; Thu, 14 Oct 2021 09:29:57 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.16.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1max3k-00083d-S4; Thu, 14 Oct 2021 09:29:57 +0000
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
	bh=2YeLQNtlnDAXgtXAupsk5ew1Qx3B8vZI/VgNN/c19Zw=; b=65lEBNyEFaAa96InwpS0ae4lhX
	/5UmrlWPwtVLtXj6lVrG2e0m24rM9j62OsEQW1OIUYE7To+jiBl85FQrO2pIqmi/wn5RnfvsHhRaQ
	gK/cfyxSot/pklbKQhDHxjwT2TxsHsKIT0vEiboLv+mqXQausIdS6cNZNQzdciTA/CSc=;
Message-ID: <e56e0ee0-2675-a746-3880-b6af48c7054b@xen.org>
Date: Thu, 14 Oct 2021 10:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2] xen/arm: vgic to ignore GICD ICPENRn registers access
To: Hongda Deng <Hongda.Deng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <20211012062449.30966-1-Hongda.Deng@arm.com>
 <2006f09d-25c3-af7a-cbea-dbc811fc8748@xen.org>
 <VE1PR08MB5677670DF19601441701380FE6B89@VE1PR08MB5677.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <VE1PR08MB5677670DF19601441701380FE6B89@VE1PR08MB5677.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/10/2021 07:55, Hongda Deng wrote:
> Hi,
Hi,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年10月13日 5:58
>> To: Hongda Deng <Hongda.Deng@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>
>> Subject: Re: [PATCH v2] xen/arm: vgic to ignore GICD ICPENRn registers access
>>
>> Hi,
>>
>> On 12/10/2021 07:24, Hongda Deng wrote:
>>> Currently, Xen will return IO unhandled when guests access GICD ICPENRn
>>> registers. This will raise a data abort inside guest. For Linux Guest,
>>> these virtual registers will not be accessed. But for Zephyr, in its
>>> GIC initialization code, these virtual registers will be accessed. And
>>> zephyr guest will get an IO data abort in initilization stage and enter
>>> fatal error. Emulating ICPENDR is not easy with the existing vGIC, so
>>> we currently ignore these virtual registers access and print a message
>>> about whether they are already pending instead of returning unhandled.
>>> More details can be found at [1].
>>
>> The link you provide only states that I am happy with the warning. This
>> doesn't seem relevant for a future reader. Did you intend to point to
>> something different?
>>
> 
> Yes, I would attach this link [1] then, which explains how zephyr accesses
> ICPENDR at its initialization. ( Though I still don't understand why zephyr
> would clear this register at initialization while linux wouldn't )

I am confused as well. From my understanding, clearing ICPENDR at 
initialization is pointless for level interrupts if you didn't quiesce 
the device beforehand.

The git history doesn't seem to give much details on the reason. But 
looking at the code, I am wondering if the intention was to clear the 
active bit rather than the pending bit.

> 
>>>
>>> [1] https://lists.xenproject.org/archives/html/xen-devel/2021-09/
>>> msg00744.html
>>>
>>> Signed-off-by: Hongda Deng <hongda.deng@arm.com>
>>> ---
>>>    xen/arch/arm/vgic-v2.c | 26 +++++++++++++++++++++++++-
>>>    xen/arch/arm/vgic-v3.c | 40 +++++++++++++++++++++++++++++++---------
>>>    2 files changed, 56 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
>>> index b2da886adc..d7ffaeeb65 100644
>>> --- a/xen/arch/arm/vgic-v2.c
>>> +++ b/xen/arch/arm/vgic-v2.c
>>> @@ -480,11 +480,35 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v,
>> mmio_info_t *info,
>>>            return 1;
>>>
>>>        case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
>>> +    {
>>> +        struct pending_irq *iter;
>>> +        unsigned int irq_start;
>>> +        unsigned int irq_end;
>>> +        uint32_t irq_pending = 0;
>>> +
>>>            if ( dabt.size != DABT_WORD ) goto bad_width;
>>>            printk(XENLOG_G_ERR
>>>                   "%pv: vGICD: unhandled word write %#"PRIregister" to
>> ICPENDR%d\n",
>>>                   v, r, gicd_reg - GICD_ICPENDR);
>>
>> As I wrote in v1, we should avoid to print a message when we know there
>> is no pending interrupts.
>>
> 
> These are not the modifications made in this patch, and same codes also exist
> for ICACTIVER. I didn't delete them for that I think they are used to give some
> useful and coherent messages to user for reference. Should we delete it for both
> or only for ICPENDR?

Looking at the implementation ICACTIVER, we simply ignore the write so 
it makes sense to print a message everytime.

This is quite different to the implementation of ICPENDR as we will 
partially emulate it. We technically emulated the register correctly 
when there is no pending interrupts, so I think it is wrong to print a 
message state this wasn't handled properly.

Therefore, I would like this message to only appear when we know the 
write wasn't handled properly.

>>> -        return 0;
>>> +
>>> +        irq_start = (gicd_reg - GICD_ICPENDR) * 32;
>>> +        irq_end = irq_start + 31;
>>> +        /* go through inflight_irqs and print specified pending irqs */
>>> +        list_for_each_entry(iter, &v->arch.vgic.inflight_irqs, inflight)
>> You need to hold v->arch.vgic.lock (with interrupt disabled) to go
>> through the list of inflight irqs. Otherwise, the list may be modified
>> while you are walking it.
>>
> 
> Ack.
> 
>> However, I am a little bit concerned with this approached (I noticed
>> Stefano suggested). The list may in theory contains a few hundreds
>> interrupts (a malicious OS May decide to never read IAR). So we are
>> potentially doing more work than necessary (we need to think about the
>> worse case scenario).
>>
>> Instead, I think it would be better to go through the 32 interrupts and
>> for each of them:
>>     1) find the pending_irq() using irq_to_pending()
>>     2) check if the IRQ in the inflight list with list_empty(&p->inflight)
>>
>> In addition to that, you want to check that the rank exists so we don't
>> do any extra work if the guest is trying to clear an interrupts above
>> the number of interrupts we support.
>>
> 
> Agreed, and that's quite helpful.

I forgot to mention that you may need to be careful with the locking. If 
I am not mistaken, "inflight" is protected with the arch.vgic.lock of 
vgic_get_target_vcpu();

>>> +        {
>>> +            if ( iter->irq < irq_start || irq_end < iter->irq )
>>> +                continue;
>>> +
>>> +            if ( test_bit(GIC_IRQ_GUEST_QUEUED, &iter->status) )
>>> +                irq_pending = irq_pending | (1 << (iter->irq - irq_start));

Looking at this code again. You want to check whether the guest 
requested to clear the interrupt. Otherwise, we may get spurious warning.

>>> +        }
>>> +
>>> +        if ( irq_pending != 0 )
>>> +            printk(XENLOG_G_ERR
>>> +                   "%pv: vGICD: ICPENDR%d=0x%08x\n",
>>> +                   v, gicd_reg - GICD_ICPENDR, irq_pending);
>>
>> This message is a bit confusing. I think it would be worth to print a
>> message for every interrupt not cleared. Maybe something like:
>>
>> "%pv trying to clear pending interrupt %u."
>>
> 
> I was thinking that there may be too many interrupts there, to print each with
> one message line would be too superfluous.
> But that worst case scenario should not be usual, and print a message for each
> interrupt would be much clearer.

In the worst case scenario, we would print 32 messages. We could 
possibly optimize to print all the interrupts on one line, but I don't 
think it is worth it. In most of the cases, you will have at most a 
couple of interrupts pending. If you have more, the XENLOG_G_ERR 
messages are ratelimited so there is no risk to flood the console.

>>> +        goto write_ignore_32;
>>> +    }
>>>
>>>        case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>>>            if ( dabt.size != DABT_WORD ) goto bad_width;
>>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>>> index cb5a70c42e..243b24e496 100644
>>> --- a/xen/arch/arm/vgic-v3.c
>>> +++ b/xen/arch/arm/vgic-v3.c
>>> @@ -816,11 +816,35 @@ static int
>> __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>>>            return 1;
>>>
>>>        case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
>>> +    {
>>> +        struct pending_irq *iter;
>>> +        unsigned int irq_start;
>>> +        unsigned int irq_end;
>>> +        uint32_t irq_pending = 0;
>>> +
>>>            if ( dabt.size != DABT_WORD ) goto bad_width;
>>>            printk(XENLOG_G_ERR
>>>                   "%pv: %s: unhandled word write %#"PRIregister" to ICPENDR%d\n",
>>>                   v, name, r, reg - GICD_ICPENDR);
>>> -        return 0;
>>> +
>>> +        irq_start = (reg - GICD_ICPENDR) * 32;
>>> +        irq_end = irq_start + 31;
>>> +        /* go through inflight_irqs and print specified pending irqs */
>>> +        list_for_each_entry(iter, &v->arch.vgic.inflight_irqs, inflight)
>>> +        {
>>> +            if ( iter->irq < irq_start || irq_end < iter->irq )
>>> +                continue;
>>> +
>>> +            if ( test_bit(GIC_IRQ_GUEST_QUEUED, &iter->status) )
>>> +                irq_pending = irq_pending | (1 << (iter->irq - irq_start));
>>> +        }
>>> +
>>> +        if ( irq_pending != 0 )
>>> +            printk(XENLOG_G_ERR
>>> +                   "%pv: %s: ICPENDR%d=0x%08x\n",
>>> +                   v, name, reg - GICD_ICPENDR, irq_pending);
>>
>> My remarks apply for GICv3 as well. Note that in the case of GICv3 v may
>> not be current.
>>
> 
> I am a bit confused why v may not be current for GICv3?

Unlike on GICv2, the ICPENDR0 is not banked. Instead, they are part of 
the re-distributor. So vCPU A could write into vCPU B re-distributor.

> Does that mean
> that for SPI we should use vgic_get_target_vcpu() to get its correct vcpu
> on GICv3 and multi cores?

You should do that for both GICv2 and GICv3 when dealing with SPIs.

>>> @@ -978,19 +1002,17 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct
>> vcpu *v, mmio_info_t *info,
>>>        case VREG32(GICR_ICFGR1):
>>>        case VRANGE32(GICR_IPRIORITYR0, GICR_IPRIORITYR7):
>>>        case VREG32(GICR_ISPENDR0):
>>> -         /*
>>> -          * Above registers offset are common with GICD.
>>> -          * So handle common with GICD handling
>>> -          */
>>> +        /*
>>> +        * Above registers offset are common with GICD.
>>> +        * So handle common with GICD handling
>>> +        */
>>
>> This looks like a spurious change.
>>
> 
> I moved this comment to the left by one space to apply format style
> to be coherent with others.

Ah yes, there is one more space. But all the * should be aligned like below:

/*
  * Foo
  * Bar
  */


> I will undo this modification and write another patch to fix it if needed.
I am usually OK with coding style change within a functional patch if 
they are around the code modified. This is not the case here, so please 
send it separately.

Cheers,

-- 
Julien Grall

