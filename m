Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111911A1659
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 22:00:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLuNK-0004LR-D2; Tue, 07 Apr 2020 19:59:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SCBO=5X=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLuNJ-0004LM-6K
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 19:59:09 +0000
X-Inumbo-ID: 3d67ce68-790a-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d67ce68-790a-11ea-b58d-bc764e2007e4;
 Tue, 07 Apr 2020 19:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jPFsBjxd3Doql0+ud0QNs2WdFtGfq29Yfg2hYU/951s=; b=5A1ZJUatge1GZKR4wHZzjFlaja
 nzBbLrJFZxNGjRNe++Y+SiGE1KOkSdXnAluErfwdAS5D1BuLYtEOuUqx1xvDKXJCtxrtKZIVbG8YN
 3WbPIzf8isRWIHFmJZRy6QB1UJIbfICC5QBi1m30EC3ImyspcwAr3k1iB76ZNx5nlOOc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLuNC-00037b-0b; Tue, 07 Apr 2020 19:59:02 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLuNB-0008EN-Ke; Tue, 07 Apr 2020 19:59:01 +0000
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
 <a29cb044-7e78-a47b-f842-327373e0ec9f@xen.org>
 <4FBF62BA-5844-4506-8C01-FE1A6F4A7ED2@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <057f48b7-84be-0bc5-773d-d01a79181b20@xen.org>
Date: Tue, 7 Apr 2020 20:58:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4FBF62BA-5844-4506-8C01-FE1A6F4A7ED2@citrix.com>
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

Hi George,

On 07/04/2020 19:16, George Dunlap wrote:
> 
> 
>> On Apr 7, 2020, at 5:50 PM, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 07/04/2020 17:16, George Dunlap wrote:
>>>> On Apr 6, 2020, at 7:47 PM, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> On 06/04/2020 18:58, George Dunlap wrote:
>>>>>> On Apr 3, 2020, at 9:27 PM, Julien Grall <julien.grall.oss@gmail.com> wrote:
>>>>>>
>>>>>> On Fri, 3 Apr 2020 at 20:41, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>>>>
>>>>>>> On Thu, 2 Apr 2020, Julien Grall wrote:
>>>>>>>> As we discussed on Tuesday, the cost for other vCPUs is only going to be a
>>>>>>>> trap to the hypervisor and then back again. The cost is likely smaller than
>>>>>>>> receiving and forwarding an interrupt.
>>>>>>>>
>>>>>>>> You actually agreed on this analysis. So can you enlighten me as to why
>>>>>>>> receiving an interrupt is a not problem for latency but this is?
>>>>>>>
>>>>>>> My answer was that the difference is that an operating system can
>>>>>>> disable interrupts, but it cannot disable receiving this special IPI.
>>>>>>
>>>>>> An OS can *only* disable its own interrupts, yet interrupts will still
>>>>>> be received by Xen even if the interrupts are masked at the processor
>>>>>> (e.g local_irq_disable()).
>>>>>>
>>>>>> You would need to disable interrupts one by one as the GIC level (use
>>>>>> ICENABLER) in order to not receive any interrupts. Yet, Xen may still
>>>>>> receive interrupts for operational purposes (e.g serial, console,
>>>>>> maintainance IRQ...). So trap will happen.
>>>>> I think Stefano’s assertion is that the users he has in mind will be configuring the system such that RT workloads get a minimum number of hypervisor-related interrupts possible.  On a 4-core system, you could  have non-RT workloads running on cores 0-1, and RT workloads running with the NULL scheduler on cores 2-3.  In such a system, you’d obviously arrange that serial and maintenance IRQs are delivered to cores 0-1.
>>>> Well maintenance IRQs are per pCPU so you can't route to another one...
>>>>
>>>> But, I think you missed my point that local_irq_disable() from the guest will not prevent the hypervisor to receive interrupts *even* the one routed to the vCPU itself. They will just not be delivered to the guest context until local_irq_enable() is called.
>>> My understanding, from Stefano was that what his customers are concerned about is the time between the time a physical IRQ is delivered to the guest and the time the guest OS can respond appropriately.  The key thing here isn’t necessarily speed, but predictability — system designers need to know that, with a high probability, their interrupt routines will complete within X amount of cycles.
>>> Further interrupts delivered to a guest are not a problem in this scenario, if the guest can disable them until the critical IRQ has been handled.
>>
>> You keep saying a guest can disable interrupts, but it can't do it via local_irq_disable(). So what method are you thinking? Disabling at the GIC level? That is involving traps and most likely not going to help with predictability...
> 
> So you’ll have to forgive me for making educated guesses here, as I’m trying to collect all the information.  On x86, if you use device pass-through on a system with a virtualized APIC and posted interrupts, then when when the device generates interrupts, those are delivered directly to the guest without involvement of Xen; and when the guest disables interrupts in the vAPIC, those interrupts will be disabled, and be delivered when the guest re-enables interrupts.  Given what Stefano said about disabling interrupts, I assumed that ARM had the same sort of functionality.  Is that not the case?

Posted interrupts are only present in GICv4 and onwards. GICv4 only 
supports direct injections for LPIs (e.g MSIs) and GICv4.1 added support 
for direct injection of SGIs (aka IPIs).

Xen on Arm does not support any posted interrupts at all and, I don't 
believe Stefano has HW (at least in production) using GICv4.

> 
>>> Xen-related IPIs, however, could potentially cause a problem if not mitigated. Consider a guest where vcpu 1 loops over the register, while vcpu 2 is handling a latency-critical IRQ.  A naive implementation might send an IPI every time vcpu 1 does a read, spamming vcpu 2 with dozens of IPIs.  Then an IRQ routine which reliably finishes well within the required time normally suddenly overruns and causes an issue.
>>
>> I never suggested the naive implementation would be perfect. That's why I said it can be optimized...
> 
> It didn’t seem to me that you understood what Stefano’s concerns were; so I was trying to explain the situation he is trying to avoid (as well as making sure that I had a clear understanding myself).  The reason I said “a naive implementation” was to make clear that I knew that’s not what you were suggesting. :-)

I know Stefano's concerns, sorry it was not clear enough :).

> 
>>> I don’t know what maintenance IRQs are, but if they only happen intermittently, it’s possible that you’d never get more than a single one in a latency-critical IRQ routine; and as such, the variatibility in execution time (jitter) wouldn’t be an issue in practice.  But every time you add a new unblockable IPI, you increase this jitter; particularly if this unblockable IPI might be repeated an arbitrary number of times.
>>> (Stefano, let me know if I’ve misunderstood something.)
>>> So stepping back a moment, here’s all the possible ideas that I think have been discussed (or are there implicitly) so far.
>>> 1. [Default] Do nothing; guests using this register continue crashing
>>> 2. Make the I?ACTIVER registers RZWI.
>>> 3. Make I?ACTIVER return the most recent known value; i.e. KVM’s current behavior (as far as we understand it)
>>> 4. Use a simple IPI with do_noop to update I?ACTIVER
>>> 4a.  Use an IPI, but come up with clever tricks to avoid interrupting guests handling IRQs.
>>> 5. Trap to Xen on guest EOI, so that we know when the
>>> 6. Some clever paravirtualized option
>>
>> 7. Use an IPI if we are confident the interrupts may be active.
> 
> I don’t understand this one.  How is it different than 4 or 4a?  And in particular, how does it evaluate on the “how much additional design work would it take” criteria?

Let me start with, if we want to have a vGIC to rule them all, then I am 
afraid you are going to have to compromise. We can discuss about 
tailoring the vGIC but I think before that we need a vGIC that is 
faithfull with the spec (e.g differentiating level vs edge interrupts, 
handling activer...). Note that Arm spent some effort to get a new vGIC 
merged but this was never made a first class citizen.

However, even if you tailor the vGIC, you are not going to be able to 
avoid IPI in some occasions. This would happen when using event 
channels, in-guest IPI... Another example is when enabling an interrupt, 
although I realize that our vGIC does not do it today meaning that a 
pending interrupt while disabled will not be forwarded until the vCPU exit.

Furthermore, implementing a write to I{C,S}ACTIVER (to 
activate/de-activate) is going to be very difficult (to not say 
impossible) to do without IPI.

If you are worry about a vCPU been interrupted in critical section, then 
I think you should tailor your guest to avoid using those registers.

An alternative would be to use spinlock/mutex within the code to prevent 
a VCPU to access the vGIC registers while another vCPU don't want to be 
interrupted.

Regarding, 4a. The only way I could think of would be to trap the 
instructions that mask/unmask interrupts. If I read correctly the Armv8 
spec, it is not possible to do it.

7. is basically 4.a the goal would be to avoid interrupts the vCPU has 
much as possible but you may be wrong sometimes. Obviously we want to be 
correct most of the times.

I understand this may not be the ideal solution, but this is probably 
the best we could come with and does not involve a lot of work because 
we have already all the information in place (we know when an interrupt 
was injected to a vCPU).

The next best solution is to prevent in your guest to modify some 
registers of the vGIC at the same time as another vCPU is in a critical 
section.

Cheers,

-- 
Julien Grall

