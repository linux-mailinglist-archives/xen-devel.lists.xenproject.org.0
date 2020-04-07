Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F6E1A120F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 18:51:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLrQr-0005by-6g; Tue, 07 Apr 2020 16:50:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SCBO=5X=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLrQq-0005bt-62
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 16:50:36 +0000
X-Inumbo-ID: e64bf416-78ef-11ea-8106-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e64bf416-78ef-11ea-8106-12813bfff9fa;
 Tue, 07 Apr 2020 16:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jTtR1Tdu/+D8Lt6sLyo0KquOKG38GAh856s/Ck7xiII=; b=w484DSlpuppmbvykPQP9b+X/6y
 wwoRRXoShrmEYgTierX5+6CHw3q65BwhJAzU9oEmJS0dwWXbQYdFS+YcEFVDQ1clZvna7RZmLCi8/
 ta4AgLRzA0uygXNX9Rv3H/+ps6ZpHQNDh3HnEbGPaxP3Ks5Kc8p/YlxYrmvsBhIJuYho=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLrQg-0007nN-Vo; Tue, 07 Apr 2020 16:50:26 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLrQg-0004X7-Jh; Tue, 07 Apr 2020 16:50:26 +0000
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
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
From: Julien Grall <julien@xen.org>
Message-ID: <a29cb044-7e78-a47b-f842-327373e0ec9f@xen.org>
Date: Tue, 7 Apr 2020 17:50:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <082584BF-3837-48A7-A0C2-9582BA3379C0@citrix.com>
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



On 07/04/2020 17:16, George Dunlap wrote:
> 
> 
>> On Apr 6, 2020, at 7:47 PM, Julien Grall <julien@xen.org> wrote:
>>
>> On 06/04/2020 18:58, George Dunlap wrote:
>>>> On Apr 3, 2020, at 9:27 PM, Julien Grall <julien.grall.oss@gmail.com> wrote:
>>>>
>>>> On Fri, 3 Apr 2020 at 20:41, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>>
>>>>> On Thu, 2 Apr 2020, Julien Grall wrote:
>>>>>> As we discussed on Tuesday, the cost for other vCPUs is only going to be a
>>>>>> trap to the hypervisor and then back again. The cost is likely smaller than
>>>>>> receiving and forwarding an interrupt.
>>>>>>
>>>>>> You actually agreed on this analysis. So can you enlighten me as to why
>>>>>> receiving an interrupt is a not problem for latency but this is?
>>>>>
>>>>> My answer was that the difference is that an operating system can
>>>>> disable interrupts, but it cannot disable receiving this special IPI.
>>>>
>>>> An OS can *only* disable its own interrupts, yet interrupts will still
>>>> be received by Xen even if the interrupts are masked at the processor
>>>> (e.g local_irq_disable()).
>>>>
>>>> You would need to disable interrupts one by one as the GIC level (use
>>>> ICENABLER) in order to not receive any interrupts. Yet, Xen may still
>>>> receive interrupts for operational purposes (e.g serial, console,
>>>> maintainance IRQ...). So trap will happen.
>>> I think Stefano’s assertion is that the users he has in mind will be configuring the system such that RT workloads get a minimum number of hypervisor-related interrupts possible.  On a 4-core system, you could  have non-RT workloads running on cores 0-1, and RT workloads running with the NULL scheduler on cores 2-3.  In such a system, you’d obviously arrange that serial and maintenance IRQs are delivered to cores 0-1.
>> Well maintenance IRQs are per pCPU so you can't route to another one...
>>
>> But, I think you missed my point that local_irq_disable() from the guest will not prevent the hypervisor to receive interrupts *even* the one routed to the vCPU itself. They will just not be delivered to the guest context until local_irq_enable() is called.
> 
> My understanding, from Stefano was that what his customers are concerned about is the time between the time a physical IRQ is delivered to the guest and the time the guest OS can respond appropriately.  The key thing here isn’t necessarily speed, but predictability — system designers need to know that, with a high probability, their interrupt routines will complete within X amount of cycles.
> 
> Further interrupts delivered to a guest are not a problem in this scenario, if the guest can disable them until the critical IRQ has been handled.

You keep saying a guest can disable interrupts, but it can't do it via 
local_irq_disable(). So what method are you thinking? Disabling at the 
GIC level? That is involving traps and most likely not going to help 
with predictability...

> 
> Xen-related IPIs, however, could potentially cause a problem if not mitigated.  Consider a guest where vcpu 1 loops over the register, while vcpu 2 is handling a latency-critical IRQ.  A naive implementation might send an IPI every time vcpu 1 does a read, spamming vcpu 2 with dozens of IPIs.  Then an IRQ routine which reliably finishes well within the required time normally suddenly overruns and causes an issue.

I never suggested the naive implementation would be perfect. That's why 
I said it can be optimized...

> 
> I don’t know what maintenance IRQs are, but if they only happen intermittently, it’s possible that you’d never get more than a single one in a latency-critical IRQ routine; and as such, the variatibility in execution time (jitter) wouldn’t be an issue in practice.  But every time you add a new unblockable IPI, you increase this jitter; particularly if this unblockable IPI might be repeated an arbitrary number of times.
> 
> (Stefano, let me know if I’ve misunderstood something.)
> 
> So stepping back a moment, here’s all the possible ideas that I think have been discussed (or are there implicitly) so far.
> 
> 1. [Default] Do nothing; guests using this register continue crashing
> 
> 2. Make the I?ACTIVER registers RZWI.
> 
> 3. Make I?ACTIVER return the most recent known value; i.e. KVM’s current behavior (as far as we understand it)
> 
> 4. Use a simple IPI with do_noop to update I?ACTIVER
> 
> 4a.  Use an IPI, but come up with clever tricks to avoid interrupting guests handling IRQs.
> 
> 5. Trap to Xen on guest EOI, so that we know when the
> 
> 6. Some clever paravirtualized option

7. Use an IPI if we are confident the interrupts may be active.

> 
> Obviously nobody wants #1, and #3 is clearly not really an option now either.
> 
> #2 is not great, but it’s simple and quick to implement for now.  Julien, I’m not sure your position on this one: You rejected the idea back in v1 of this patch series, but seemed to refer to it again earlier in this thread.
> 
> #4 is relatively quick to implement a “dumb” version, but such a “dumb” version has a high risk of causing unacceptable jitter (or at least, so Stefano believes).
> 
> #4a or #6 are further potential lines to explore, but would require a lot of additional design to get working right.
> 
> I think if I understand Stefano’s PoV, then #5 would actually be acceptable — the overall amount of time spent in the hypervisor would probably be greater, but it would be bounded and predictable: once someone got their IRQ handler working reliably, it would likely continue to work.
> It sounds like #5 might be pretty quick to implement; and then at some point in the future if someone wants to improve performance, they can work on 4a or 6.
With the existing solution, you may only trap when receiving the next 
interrupts. But with your approach you are now trapping once when 
deactivate and potentially trapping soon after when receiving an 
interrupts. So you increase cost per-interrupts.

While I agree this is going to make Stefano's customers happy, you are 
also going to make unhappy anyone with workload using an high numbers of 
interrupts (e.g media).

Given that none of Stefano's customer are actually using ISACTIVER 
today, it feels to me it is wrong to add pain for everyone else.

It feels to me we want to either implement 4. or 7. and then optimize it 
based on feedback.

Cheers,

-- 
Julien Grall

