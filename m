Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D33A8C9458
	for <lists+xen-devel@lfdr.de>; Sun, 19 May 2024 13:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725577.1130043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8eOj-0003Rm-3q; Sun, 19 May 2024 11:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725577.1130043; Sun, 19 May 2024 11:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8eOj-0003P7-1F; Sun, 19 May 2024 11:08:13 +0000
Received: by outflank-mailman (input) for mailman id 725577;
 Sun, 19 May 2024 11:08:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s8eOh-0003P1-D0
 for xen-devel@lists.xenproject.org; Sun, 19 May 2024 11:08:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s8eOh-0006rh-2W; Sun, 19 May 2024 11:08:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s8eOg-0008QL-Ry; Sun, 19 May 2024 11:08:10 +0000
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
	bh=nvX8Y+OXmTeJ95NkoYRik+bu86UoFfz7aKvwtb4C8XI=; b=3uKHlZrBbVqQIVTUhhoOHjxH2j
	LaiGpBgjUAxsWiYST6p9T30E+XVc625oEtlbAXjm5WdLie4Xo/lPGmPI76HX36IukH7ZP+bjtsdc9
	+PqL0hcRnahNhrjXzWN75Zc6PtKRJcsQWDDhNgtJHnSoLZakGaYMLLDg+99x/MZy58j0=;
Message-ID: <9f086470-a17f-482a-ad98-814424da0ee5@xen.org>
Date: Sun, 19 May 2024 12:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/arm/gic: Allow routing/removing interrupt to
 running VMs
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-6-xin.wang2@amd.com>
 <59e72623-00a7-4b19-9240-fb8c4982a381@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <59e72623-00a7-4b19-9240-fb8c4982a381@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 17/05/2024 07:03, Henry Wang wrote:
> 
> 
> On 5/16/2024 6:03 PM, Henry Wang wrote:
>> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>>
>> Currently, routing/removing physical interrupts are only allowed at
>> the domain creation/destroy time. For use cases such as dynamic device
>> tree overlay adding/removing, the routing/removing of physical IRQ to
>> running domains should be allowed.
>>
>> Removing the above-mentioned domain creation/dying check. Since this
>> will introduce interrupt state unsync issues for cases when the
>> interrupt is active or pending in the guest, therefore for these cases
>> we simply reject the operation. Do it for both new and old vGIC
>> implementations.
>>
>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>> v2:
>> - Reject the case where the IRQ is active or pending in guest.
>> ---
>>   xen/arch/arm/gic-vgic.c  |  8 ++++++--
>>   xen/arch/arm/gic.c       | 15 ---------------
>>   xen/arch/arm/vgic/vgic.c |  5 +++--
>>   3 files changed, 9 insertions(+), 19 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
>> index 56490dbc43..d1608415f8 100644
>> --- a/xen/arch/arm/gic-vgic.c
>> +++ b/xen/arch/arm/gic-vgic.c
>> @@ -444,14 +444,18 @@ int vgic_connect_hw_irq(struct domain *d, struct 
>> vcpu *v, unsigned int virq,
>>       {
>>           /* The VIRQ should not be already enabled by the guest */

This comment needs to be updated.

>>           if ( !p->desc &&
>> -             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) )
>> +             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) &&
>> +             !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) &&
>> +             !test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
>>               p->desc = desc;
>>           else
>>               ret = -EBUSY;
>>       }
>>       else
>>       {
>> -        if ( desc && p->desc != desc )
>> +        if ( desc && p->desc != desc &&
>> +             (test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
>> +              test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status)) )
> 
> This should be
> 
> +        if ( (desc && p->desc != desc) ||
> +             test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
> +             test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
Looking at gic_set_lr(), we first check p->desc, before setting 
IRQ_GUEST_VISIBLE.

I can't find a common lock, so what would guarantee that p->desc is not 
going to be used or IRQ_GUEST_VISIBLE set afterwards?



>> @@ -887,7 +887,8 @@ int vgic_connect_hw_irq(struct domain *d, struct 
>> vcpu *vcpu,
>>       }
>>       else                                /* remove a mapped IRQ */
>>       {
>> -        if ( desc && irq->hwintid != desc->irq )
>> +        if ( desc && irq->hwintid != desc->irq &&
>> +             (irq->active || irq->pending_latch) )
> 
> Same here, this should be
> 
> +        if ( (desc && irq->hwintid != desc->irq) ||
> +             irq->active || irq->pending_latch )

I think the new vGIC doesn't have the same problem because it looks like 
the IRQ lock will be taken for any access to 'irq'.

Cheers,

-- 
Julien Grall

