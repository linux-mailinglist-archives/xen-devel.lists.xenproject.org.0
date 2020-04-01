Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A494519B503
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 20:00:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJhbR-0006rD-1i; Wed, 01 Apr 2020 17:56:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=46oD=5R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJhbP-0006r8-NF
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 17:56:35 +0000
X-Inumbo-ID: 205c7d22-7442-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 205c7d22-7442-11ea-9e09-bc764e2007e4;
 Wed, 01 Apr 2020 17:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ksTC+u7gQ1FJKIeMQAsNPrZmU5yDR8+00nALcVx2r3U=; b=nz7d3RvzzDui4VKNV4Rd7rC164
 VoGfGwTx4axWSE4km2l00C3ewqKZnUM/ForhaRkHv7QnqZHQu6b8+Q7bA/ouwWoe7I3V1CoTGOFVj
 DY6ST7VIRuuWnIay/SPO5+N1O26KLn4Ccs0HOgw28QT3aJQW54biuTBoEu8i+/+AXDBM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJhbM-0000W8-JK; Wed, 01 Apr 2020 17:56:32 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJhbM-0002RV-6f; Wed, 01 Apr 2020 17:56:32 +0000
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
To: George Dunlap <dunlapg@umich.edu>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <A33FEB65-F844-4CA6-BAE0-F0C881CFD381@arm.com>
 <CAFLBxZYYWOS8D2-YPFWZ2n4RdPTOjfmzMpYby4JYSQ_rJM_zBw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <145579e0-d0d1-b12a-a84f-7698d76d2c04@xen.org>
Date: Wed, 1 Apr 2020 18:56:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFLBxZYYWOS8D2-YPFWZ2n4RdPTOjfmzMpYby4JYSQ_rJM_zBw@mail.gmail.com>
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
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Wei Xu <xuwei5@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 01/04/2020 18:02, George Dunlap wrote:
> 
> 
> On Wed, Apr 1, 2020 at 10:54 AM Bertrand Marquis 
> <Bertrand.Marquis@arm.com <mailto:Bertrand.Marquis@arm.com>> wrote:
> 
> 
> 
>>     On 1 Apr 2020, at 09:30, Julien Grall <julien@xen.org
>>     <mailto:julien@xen.org>> wrote:
>>
>>
>>
>>     On 01/04/2020 01:57, Stefano Stabellini wrote:
>>>     On Mon, 30 Mar 2020, Julien Grall wrote:
>>>>     Hi Stefano,
>>>>
>>>>     On 30/03/2020 17:35, Stefano Stabellini wrote:
>>>>>     On Sat, 28 Mar 2020, Julien Grall wrote:
>>>>>>     qHi Stefano,
>>>>>>
>>>>>>     On 27/03/2020 02:34, Stefano Stabellini wrote:
>>>>>>>     This is a simple implementation of GICD_ICACTIVER /
>>>>>>>     GICD_ISACTIVER
>>>>>>>     reads. It doesn't take into account the latest state of
>>>>>>>     interrupts on
>>>>>>>     other vCPUs. Only the current vCPU is up-to-date. A full
>>>>>>>     solution is
>>>>>>>     not possible because it would require synchronization among
>>>>>>>     all vCPUs,
>>>>>>>     which would be very expensive in terms or latency.
>>>>>>
>>>>>>     Your sentence suggests you have number showing that correctly
>>>>>>     emulating
>>>>>>     the
>>>>>>     registers would be too slow. Mind sharing them?
>>>>>
>>>>>     No, I don't have any numbers. Would you prefer a different
>>>>>     wording or a
>>>>>     better explanation? I also realized there is a typo in there
>>>>>     (or/of).
>>>>     Let me start with I think correctness is more important than speed.
>>>>     So I would have expected your commit message to contain some
>>>>     fact why
>>>>     synchronization is going to be slow and why this is a problem.
>>>>
>>>>     To give you a concrete example, the implementation of set/way
>>>>     instructions are
>>>>     really slow (it could take a few seconds depending on the
>>>>     setup). However,
>>>>     this was fine because not implementing them correctly would have
>>>>     a greater
>>>>     impact on the guest (corruption) and they are not used often.
>>>>
>>>>     I don't think the performance in our case will be in same order
>>>>     magnitude. It
>>>>     is most likely to be in the range of milliseconds (if not less)
>>>>     which I think
>>>>     is acceptable for emulation (particularly for the vGIC) and the
>>>>     current uses.
>>>     Writing on the mailing list some of our discussions today.
>>>     Correctness is not just in terms of compliance to a specification
>>>     but it
>>>     is also about not breaking guests. Introducing latency in the
>>>     range of
>>>     milliseconds, or hundreds of microseconds, would break any latency
>>>     sensitive workloads. We don't have numbers so we don't know for
>>>     certain
>>>     the effect that your suggestion would have.
>>
>>     You missed part of the discussion. I don't disagree that latency
>>     is important. However, if an implementation is only 95% reliable,
>>     then it means 5% of the time your guest may break (corruption,
>>     crash, deadlock...). At which point the latency is the last of
>>     your concern.
>>
>>>     It would be interesting to have those numbers, and I'll add to my
>>>     TODO
>>>     list to run the experiments you suggested, but I'll put it on the
>>>     back-burner (from a Xilinx perspective it is low priority as no
>>>     customers are affected.)
>>
>>     How about we get a correct implementation merge first and then
>>     discuss about optimization? This would allow the community to
>>     check whether there are actually noticeable latency in their workload.
> 
>     Hi,
> 
>     I am not sure that pushing something with a performance impact to
>     later fix it is the right approach here.
> 
>     The patch is an improvement compared to the current code and it can
>     be further improved later to handle more cases (other cores).
> 
>     If we really have to sync all vCPUs here, this will cost a lot and
>     the result will still be the status in the past in fact because
>     nothing will make sure that at the point the guest gets back the
>     value it is still valid.
> 
> 
> The same is true on real hardware, right?
> 
> Looking at this discussion as a non-ARM person, it sounds a bit like ARM 
> specified this in a way that was 
> useless-but-easy-to-implement-so-why-not; but it turns out to be 
> useless-but-hard-to-implement virtualized.
> 
> On the one hand, I'm sympathetic to Julien's point of view; I very much 
> don't like the idea of silently changing behavior just because the 
> specified behavior is inconvenient for us.
> 
> On the other hand, I'm sympathetic to Stefano's point of view, that it's 
> pointless to introduce a load of overhead and jitter to implement 
> behavior which nobody in their right mind would even want to use (at 
> least virtualized).
> 
> What I think would be *ideal* would be for ARM to change the 
> specification to make it easier virtualize.  For instance:, by 
> specifying that the register *may* contain information about other 
> cores, but may not; or, that the register will contain information on 
> other cores on real hardware, but not virtualized.

The goal of those registers is to give you a picture of the interrupts 
activated on your HW. For instance, this is used by Linux to properly 
synchronize pending interrupts as there would be a race otherwise.

I wrote a long e-mail a few months ago explaining why Linux is using it 
and why we should implement correctly [1].

Even on real HW, the value you read may already be incorrect (i.e an 
interrupt may have become pending).

What Stefano implemented is using a snapshot of what Xen thinks is the 
state of the vGIC. I think this is inline with the existing specification.

However, this has a major flaw because this relies on the vCPUs to exit 
for synchronization the HW state and what Xen thinks of the vGIC. We 
have configured the vGIC to not exit when the virtual interrupt is 
backed by an HW interrupt. So we need to rely on another trap for the 
synchronization.

With the NULL scheduler (and even credit2 with only 1 vCPU running per 
pCPU), the number of traps is very limited. So read the I*ACTIVER 
registers may report that an interrupt is actived for a really long time.

The result here is a thread in the guest may be blocked for a long-time.

To be brutally honest, this totally defeat the argument that "this patch 
has a better latency".

> 
> Barring that, I think we should have a centralized place to document 
> deviations from the spec; and I think changes to this spec should be 
> coordinated with KVM (and maybe ACRN?), to minimize hypervisor-specific 
> deviations.

AFAIK, KVM is implementing the ACTIVER registers the same way as 
Stefano's patch. It might be harder (or not possible) to hit the 
deadlock depending on how they configure the vGIC (i.e trap the active 
state) and the scheduling.

As I discussed with Stefano yesterday, I can accept that the state is 
not up-to-date. But I can't ignore the fact this patch is introducing a 
deadlock in some circumstance.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/7289f75f-1ab2-2d42-cd88-1be5306b3072@xen.org/

-- 
Julien Grall

