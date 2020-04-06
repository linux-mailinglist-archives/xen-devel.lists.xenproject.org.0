Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B285F19FD75
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 20:48:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLWmK-0007hg-H8; Mon, 06 Apr 2020 18:47:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=glNc=5W=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLWmJ-0007hb-0s
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 18:47:23 +0000
X-Inumbo-ID: 0c84dce2-7837-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c84dce2-7837-11ea-b58d-bc764e2007e4;
 Mon, 06 Apr 2020 18:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2kMAMW9JGbdWzdSupY+MQQ3YO0zAP6olnmtHB0HOmSc=; b=fSEUM/Aa6OBwYi/jFWpWmZW0Ms
 QrWoqnZrPopokx3F/YVMIfsr/nNG+KKtGYbjmva4I5X0T7H2aYkeXuyLhig3PgmQrDgtcQwuvDa5j
 4Bou95Y09vaKR9Xyyk0qjz9/oaPmKb/zjkb5IzkkCJ3Iai1YYMFY9KeipJTeQew1cUc4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLWmD-0000es-1d; Mon, 06 Apr 2020 18:47:17 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLWmC-00088G-MA; Mon, 06 Apr 2020 18:47:16 +0000
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
To: George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>
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
From: Julien Grall <julien@xen.org>
Message-ID: <9de763c9-19f2-2163-d5db-95176dbce3cc@xen.org>
Date: Mon, 6 Apr 2020 19:47:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <D048CA76-8C9F-4F44-B05C-D834A6D0D37D@citrix.com>
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
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 06/04/2020 18:58, George Dunlap wrote:
> 
> 
>> On Apr 3, 2020, at 9:27 PM, Julien Grall <julien.grall.oss@gmail.com> wrote:
>>
>> On Fri, 3 Apr 2020 at 20:41, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>
>>> On Thu, 2 Apr 2020, Julien Grall wrote:
>>>> As we discussed on Tuesday, the cost for other vCPUs is only going to be a
>>>> trap to the hypervisor and then back again. The cost is likely smaller than
>>>> receiving and forwarding an interrupt.
>>>>
>>>> You actually agreed on this analysis. So can you enlighten me as to why
>>>> receiving an interrupt is a not problem for latency but this is?
>>>
>>> My answer was that the difference is that an operating system can
>>> disable interrupts, but it cannot disable receiving this special IPI.
>>
>> An OS can *only* disable its own interrupts, yet interrupts will still
>> be received by Xen even if the interrupts are masked at the processor
>> (e.g local_irq_disable()).
>>
>> You would need to disable interrupts one by one as the GIC level (use
>> ICENABLER) in order to not receive any interrupts. Yet, Xen may still
>> receive interrupts for operational purposes (e.g serial, console,
>> maintainance IRQ...). So trap will happen.
> 
> I think Stefano’s assertion is that the users he has in mind will be configuring the system such that RT workloads get a minimum number of hypervisor-related interrupts possible.  On a 4-core system, you could  have non-RT workloads running on cores 0-1, and RT workloads running with the NULL scheduler on cores 2-3.  In such a system, you’d obviously arrange that serial and maintenance IRQs are delivered to cores 0-1.
Well maintenance IRQs are per pCPU so you can't route to another one...

But, I think you missed my point that local_irq_disable() from the guest 
will not prevent the hypervisor to receive interrupts *even* the one 
routed to the vCPU itself. They will just not be delivered to the guest 
context until local_irq_enable() is called.

> 
> Julien, I think your argument above about interrupts somewhat undermines your point about deadlock.  Your basic argument is, that a guest will be interrupted by Xen quite frequently anyway for lots of reasons; adding one more to the list shouldn’t measurably increase the jitter.  But if it’s true that a guest will be interrupted by Xen frequently, then deadlock shouldn’t be much of an issue; and insofar as deadlock is an issue, it’s because there were no interrupts — and thus, adding an extra IPI will have a statistically significant effect on jitter.

I presented two way to disable interrupts because Stefano's e-mail was 
not clear enough which one he was referring to. So I was hoping to safe 
some round-trip, but it looks like I muddle my point.

If Stefano was referring to critical sections where interrupts are 
masked using local_irq_disable(). Then, you are not going to limit the 
numbers of traps at all (see why above). So the point here was moot.

I don't believe Stefano was referring to the second case as disabling 
interrupts at the GIC level will require to trap in the hypervisor. But 
I thought I would mention it.

Regarding the livelock (Marc pointed out it wasn't a deadlock), there 
are multiple conflicting use cases. In an ideal world, there will be 
limited reasons to interrupts the guest. And yes it will result to a 
livelock.

In a less ideal world, there will some time be interruptions. But you 
don't know when. If you look at determinism then, I am afraid that 
Stefano's implementation is not because you don't know when the vCPU 
will exit.

> 
> On the other had, Stefano’s argument about deadlock (if I understand him correctly) has been that guests shouldn’t really be spinning on that register anyway.  But it sounds from Julien’s other email that perhaps spinning on the register is exactly what newer versions of Linux do — so Linux would certainly hang on such systems if Stefano’s assertion about the low number of Xen-related interrupts is true.

Rather than playing the game "one person's word against the other 
person's word", from Linux 5.4:

do {
     unsigned long flags;

     /*
      * Wait until we're out of the critical section.  This might
      * give the wrong answer due to the lack of memory barriers.
      */
     while (irqd_irq_inprogress(&desc->irq_data))
         cpu_relax();

     /* Ok, that indicated we're done: double-check carefully. */
     raw_spin_lock_irqsave(&desc->lock, flags);
     inprogress = irqd_irq_inprogress(&desc->irq_data);

     /*
      * If requested and supported, check at the chip whether it
      * is in flight at the hardware level, i.e. already pending
      * in a CPU and waiting for service and acknowledge.
      */
     if (!inprogress && sync_chip) {
         /*
          * Ignore the return code. inprogress is only updated
          * when the chip supports it.
          */
         __irq_get_irqchip_state(irqd, IRQCHIP_STATE_ACTIVE,
                                 &inprogress);
     }
     raw_spin_unlock_irqrestore(&desc->lock, flags);
     /* Oops, that failed? */
} while (inprogress);

> 
> If the latter is true, then it sounds like addressing the deadlock issue will be necessary?  And so effort needs to be put towards figuring out how to minimize jitter due to Xen-related IPIs.
Here what I wrote before:

"
A few remarks:
     * The function do_nothing() is basically a NOP.
     * I am suggesting to use smp_call_function() rather
smp_send_event_check_cpu() is because we need to know when the vCPU has
synchronized the LRs. As the function do_nothing() will be call
afterwards, then we know the the snapshot of the LRs has been done
     * It would be possible to everything in one vCPU.
     * We can possibly optimize it for the SGIs/PPIs case

This is still not perfect, but I don't think the performance would be
that bad.
"

"
But if your concern is to disturb a vCPU which has interrupts
disabled. Then there is way to mitigate this in an implementation, you
can easily know whether there are interrupts inflight at a given point
for a given vCPU. So you can avoid to IPI if you know there is no
interrupts potentially active.
"

I am looking forward to hear about the potential improvements.

Cheers,

-- 
Julien Grall

