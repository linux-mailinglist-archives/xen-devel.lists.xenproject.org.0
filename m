Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FC61A1246
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 18:57:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLrWp-0005sl-5C; Tue, 07 Apr 2020 16:56:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SCBO=5X=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLrWn-0005sg-N6
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 16:56:45 +0000
X-Inumbo-ID: c3279e58-78f0-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3279e58-78f0-11ea-b58d-bc764e2007e4;
 Tue, 07 Apr 2020 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DPJefoKUrnvkPnUtarwCC5UV8bsQZr+MpiHqDI2k2hg=; b=hCraj/nVWgiaOlpSRtnhN7eiqk
 DT30uhU97+M5mrPwVjfwI53qR6edSQ39FIjAnMBCU/t/CYSFt+180DSd/T0Elg5Q2VQU6KrVkl79q
 m2/QKgVlwOwTVOxQCcH/PeQKA+UQ5SRzLIhoghqzmZmS2zDrKBENBFk10FztY8olp99w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLrWi-0007vE-LF; Tue, 07 Apr 2020 16:56:40 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLrWi-00054v-Dl; Tue, 07 Apr 2020 16:56:40 +0000
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
From: Julien Grall <julien@xen.org>
To: George Dunlap <George.Dunlap@citrix.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2LdC-nSMUEjLhGp_4PAkcRkp4wJKXiAy0ftt34T8LAVg@mail.gmail.com>
 <D048CA76-8C9F-4F44-B05C-D834A6D0D37D@citrix.com>
 <9de763c9-19f2-2163-d5db-95176dbce3cc@xen.org>
 <082584BF-3837-48A7-A0C2-9582BA3379C0@citrix.com>
 <a29cb044-7e78-a47b-f842-327373e0ec9f@xen.org>
Message-ID: <50c565ed-801b-76bd-5e53-af92fdd5d116@xen.org>
Date: Tue, 7 Apr 2020 17:56:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a29cb044-7e78-a47b-f842-327373e0ec9f@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "maz@kernel.org" <maz@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 07/04/2020 17:50, Julien Grall wrote:
> 
> 
> On 07/04/2020 17:16, George Dunlap wrote:
>>
>>
>>> On Apr 6, 2020, at 7:47 PM, Julien Grall <julien@xen.org> wrote:
>>>
>>> On 06/04/2020 18:58, George Dunlap wrote:
>>>>> On Apr 3, 2020, at 9:27 PM, Julien Grall 
>>>>> <julien.grall.oss@gmail.com> wrote:
>>>>>
>>>>> On Fri, 3 Apr 2020 at 20:41, Stefano Stabellini 
>>>>> <sstabellini@kernel.org> wrote:
>>>>>>
>>>>>> On Thu, 2 Apr 2020, Julien Grall wrote:
>>>>>>> As we discussed on Tuesday, the cost for other vCPUs is only 
>>>>>>> going to be a
>>>>>>> trap to the hypervisor and then back again. The cost is likely 
>>>>>>> smaller than
>>>>>>> receiving and forwarding an interrupt.
>>>>>>>
>>>>>>> You actually agreed on this analysis. So can you enlighten me as 
>>>>>>> to why
>>>>>>> receiving an interrupt is a not problem for latency but this is?
>>>>>>
>>>>>> My answer was that the difference is that an operating system can
>>>>>> disable interrupts, but it cannot disable receiving this special IPI.
>>>>>
>>>>> An OS can *only* disable its own interrupts, yet interrupts will still
>>>>> be received by Xen even if the interrupts are masked at the processor
>>>>> (e.g local_irq_disable()).
>>>>>
>>>>> You would need to disable interrupts one by one as the GIC level (use
>>>>> ICENABLER) in order to not receive any interrupts. Yet, Xen may still
>>>>> receive interrupts for operational purposes (e.g serial, console,
>>>>> maintainance IRQ...). So trap will happen.
>>>> I think Stefano’s assertion is that the users he has in mind will be 
>>>> configuring the system such that RT workloads get a minimum number 
>>>> of hypervisor-related interrupts possible.  On a 4-core system, you 
>>>> could  have non-RT workloads running on cores 0-1, and RT workloads 
>>>> running with the NULL scheduler on cores 2-3.  In such a system, 
>>>> you’d obviously arrange that serial and maintenance IRQs are 
>>>> delivered to cores 0-1.
>>> Well maintenance IRQs are per pCPU so you can't route to another one...
>>>
>>> But, I think you missed my point that local_irq_disable() from the 
>>> guest will not prevent the hypervisor to receive interrupts *even* 
>>> the one routed to the vCPU itself. They will just not be delivered to 
>>> the guest context until local_irq_enable() is called.
>>
>> My understanding, from Stefano was that what his customers are 
>> concerned about is the time between the time a physical IRQ is 
>> delivered to the guest and the time the guest OS can respond 
>> appropriately.  The key thing here isn’t necessarily speed, but 
>> predictability — system designers need to know that, with a high 
>> probability, their interrupt routines will complete within X amount of 
>> cycles.
>>
>> Further interrupts delivered to a guest are not a problem in this 
>> scenario, if the guest can disable them until the critical IRQ has 
>> been handled.
> 
> You keep saying a guest can disable interrupts, but it can't do it via 
> local_irq_disable(). So what method are you thinking? Disabling at the 
> GIC level? That is involving traps and most likely not going to help 
> with predictability...

Just to clear I meant interrupts to be received by Xen including the one 
routed to that vCPU.

Cheers,

-- 
Julien Grall

