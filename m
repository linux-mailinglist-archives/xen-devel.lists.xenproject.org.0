Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F288C9ABA
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 11:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725955.1130259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8zfM-0006b8-2e; Mon, 20 May 2024 09:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725955.1130259; Mon, 20 May 2024 09:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8zfL-0006Ye-W8; Mon, 20 May 2024 09:50:47 +0000
Received: by outflank-mailman (input) for mailman id 725955;
 Mon, 20 May 2024 09:50:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s8zfL-0006YY-Ao
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 09:50:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s8zfK-00073H-ML; Mon, 20 May 2024 09:50:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s8zfK-00017j-Gv; Mon, 20 May 2024 09:50:46 +0000
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
	bh=S+jEu/Ft9jn5gtKVP+wjkqZmA/ELJVEKPQS6jnL1OjE=; b=I+V6akTgC97xLa17Xu7d9sCfg/
	/5jO7V6C2fang3TTwyyDCCPZgMU/0WzUUrjWMpL9eHUvK8dxytB11LQ8/4yrM1jWznfCUQRGAtKRC
	ox39PryQm3rKUjLoKC6ZQuQbOD8NF41+1dp3e8zlr9BS8bMB6vuaLV/FHwaMQaEsIOCI=;
Message-ID: <30c42949-bf67-416d-9f6f-e476fb1da436@xen.org>
Date: Mon, 20 May 2024 10:50:45 +0100
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
 <9f086470-a17f-482a-ad98-814424da0ee5@xen.org>
 <c475fc50-3d30-49d4-b12d-31535cfe1306@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c475fc50-3d30-49d4-b12d-31535cfe1306@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henry,

On 20/05/2024 02:01, Henry Wang wrote:
> Hi Julien,
> 
> On 5/19/2024 7:08 PM, Julien Grall wrote:
>> Hi,
>>
>> On 17/05/2024 07:03, Henry Wang wrote:
>>>> @@ -444,14 +444,18 @@ int vgic_connect_hw_irq(struct domain *d, 
>>>> struct vcpu *v, unsigned int virq,
>>>>       {
>>>>           /* The VIRQ should not be already enabled by the guest */
>>
>> This comment needs to be updated.
> 
> Yes, sorry. I will update this and the one in the new vGIC in v3.
> 
>>>>           if ( !p->desc &&
>>>> -             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) )
>>>> +             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) &&
>>>> +             !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) &&
>>>> +             !test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
>>>>               p->desc = desc;
>>>>           else
>>>>               ret = -EBUSY;
>>>>       }
>>>>       else
>>>>       {
>>>> -        if ( desc && p->desc != desc )
>>>> +        if ( desc && p->desc != desc &&
>>>> +             (test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
>>>> +              test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status)) )
>>>
>>> This should be
>>>
>>> +        if ( (desc && p->desc != desc) ||
>>> +             test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
>>> +             test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
>> Looking at gic_set_lr(), we first check p->desc, before setting 
>> IRQ_GUEST_VISIBLE.
>>
>> I can't find a common lock, so what would guarantee that p->desc is 
>> not going to be used or IRQ_GUEST_VISIBLE set afterwards?
> 
> I think the gic_set_lr() is supposed to be called with v->arch.vgic.lock 
> taken, at least the current two callers (gic_raise_guest_irq() and 
> gic_restore_pending_irqs()) are doing it this way. Would this address 
> your concern? Thanks.

I don't think it would address my concern. AFAICT, the lock is not taken 
by vgic_connect_hw_irq().

I also haven't touched the vGIC for quite a while and didn't have much 
time to dig into the code. Hence why I didn't propose a fix.

The vGIC code was mainly written by Stefano, so maybe he will have an 
idea how this could be fixed.

Cheers,

-- 
Julien Grall

