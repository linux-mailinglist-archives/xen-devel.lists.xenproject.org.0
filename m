Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E819C92D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 20:53:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK4xV-0004On-Ck; Thu, 02 Apr 2020 18:52:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B+pF=5S=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jK4xU-0004Oi-Jt
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 18:52:56 +0000
X-Inumbo-ID: 284769e4-7513-11ea-bc3a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 284769e4-7513-11ea-bc3a-12813bfff9fa;
 Thu, 02 Apr 2020 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nqOwJGrRRu1XmAzvLt99qGVo8a2WMoL6w01/Bt0wwX8=; b=szdqRl8tteJ9bfXffDNBSLPFWO
 zHQmrAe5aMMOfltSxh0nx7+IMh8bquqDXQ+kCQmxLmcbsM0KVujLbHDcyct+v3KV3621VSLTLDfw6
 Ux/J7LmnAq/JCGx9xhzIYU7OLrceX618zTaBGKQ8bZIW+SYebCwtl147kWECsIAb/92s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jK4xK-0004lk-Po; Thu, 02 Apr 2020 18:52:46 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jK4xK-0000ZW-EX; Thu, 02 Apr 2020 18:52:46 +0000
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
Date: Thu, 2 Apr 2020 19:52:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
 maz@kernel.org, George.Dunlap@citrix.com, Wei Xu <xuwei5@hisilicon.com>,
 Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(+Marc)

Hi Stefano,

On 02/04/2020 18:19, Stefano Stabellini wrote:
> On Wed, 1 Apr 2020, Julien Grall wrote:
>> On 01/04/2020 01:57, Stefano Stabellini wrote:
>>> On Mon, 30 Mar 2020, Julien Grall wrote:
>>>> Hi Stefano,
>>>>
>>>> On 30/03/2020 17:35, Stefano Stabellini wrote:
>>>>> On Sat, 28 Mar 2020, Julien Grall wrote:
>>>>>> qHi Stefano,
>>>>>>
>>>>>> On 27/03/2020 02:34, Stefano Stabellini wrote:
>>>>>>> This is a simple implementation of GICD_ICACTIVER / GICD_ISACTIVER
>>>>>>> reads. It doesn't take into account the latest state of interrupts
>>>>>>> on
>>>>>>> other vCPUs. Only the current vCPU is up-to-date. A full solution is
>>>>>>> not possible because it would require synchronization among all
>>>>>>> vCPUs,
>>>>>>> which would be very expensive in terms or latency.
>>>>>>
>>>>>> Your sentence suggests you have number showing that correctly
>>>>>> emulating
>>>>>> the
>>>>>> registers would be too slow. Mind sharing them?
>>>>>
>>>>> No, I don't have any numbers. Would you prefer a different wording or a
>>>>> better explanation? I also realized there is a typo in there (or/of).
>>>> Let me start with I think correctness is more important than speed.
>>>> So I would have expected your commit message to contain some fact why
>>>> synchronization is going to be slow and why this is a problem.
>>>>
>>>> To give you a concrete example, the implementation of set/way instructions
>>>> are
>>>> really slow (it could take a few seconds depending on the setup). However,
>>>> this was fine because not implementing them correctly would have a greater
>>>> impact on the guest (corruption) and they are not used often.
>>>>
>>>> I don't think the performance in our case will be in same order magnitude.
>>>> It
>>>> is most likely to be in the range of milliseconds (if not less) which I
>>>> think
>>>> is acceptable for emulation (particularly for the vGIC) and the current
>>>> uses.
>>>
>>> Writing on the mailing list some of our discussions today.
>>>
>>> Correctness is not just in terms of compliance to a specification but it
>>> is also about not breaking guests. Introducing latency in the range of
>>> milliseconds, or hundreds of microseconds, would break any latency
>>> sensitive workloads. We don't have numbers so we don't know for certain
>>> the effect that your suggestion would have.
>>
>> You missed part of the discussion. I don't disagree that latency is important.
>> However, if an implementation is only 95% reliable, then it means 5% of the
>> time your guest may break (corruption, crash, deadlock...). At which point the
>> latency is the last of your concern.
> 
> Yeah I missed to highlight it, also because I look at it from a slightly
> different perspective: I think IRQ latency is part of correctness.
> 
> If we have a solution that is not 100% faithful to the specification we
> are going to break guests that rely on a faithful implementation of
> ISACTIVER.
> 
> If we have a solution that is 100% faithful to the specification but
> causes latency spikes it breaks RT guests.
> 
> But they are different sets of guests, it is not like one is necessarily
> a subset of the other: there are guests that cannot tolerate any latency
> spikes but they are OK with an imprecise implementation of ISACTIVER.
> 
> My preference is a solution that is both spec-faithful and also doesn't
> cause any latency spikes. If that is not possible then we'll have to
> compromise or come up with "creative" ideas.

I do agree that latency is important. However, this needs to be based on 
numbers or a good grasp as to why this would be an issue. Neither of 
these have been provided so far.

As we discussed on Tuesday, the cost for other vCPUs is only going to be 
a trap to the hypervisor and then back again. The cost is likely smaller 
than receiving and forwarding an interrupt.

You actually agreed on this analysis. So can you enlighten me as to why 
receiving an interrupt is a not problem for latency but this is?

> 
>>> It would be interesting to have those numbers, and I'll add to my TODO
>>> list to run the experiments you suggested, but I'll put it on the
>>> back-burner (from a Xilinx perspective it is low priority as no
>>> customers are affected.)
>>
>> How about we get a correct implementation merge first and then discuss about
>> optimization? This would allow the community to check whether there are
>> actually noticeable latency in their workload.
> 
> A correct implementation to me means that it is correct from both the
> specification point of view as well as from a latency point of view. A
> patch that potentially introduces latency spikes could cause guest
> breakage and I don't think it should be considered correct. The
> tests would have to be done beforehand.

In all honesty, writing and testing the implementation would have likely 
took you less than trying to push for "creative" ideas or your patch.

> In terms of other "creative" ideas, here are some:

"creative" ideas should really be the last resort. Correct me if I am 
wrong, but I don't think we are there yet.

> 
> One idea, as George suggested, would be to document the interface
> deviation. The intention is still to remove any deviation but at least
> we would be clear about what we have. Ideally in a single place together
> with other hypervisors. This is my preference.

It is not without saying that deviation from specification should not be 
taken lightly and has risks.

The main risk is you are never going to be able to reliably run an OS on 
Xen unless you manage to get the deviation accepted by the wider 
community and Arm.

> 
> Another idea is that we could crash the guest if GICD_ISACTIVER is read
> from a multi-vcpu guest. It is similar to what we already do today but
> better because we would do it purposely (not because of a typo) and
> because it will work for single vcpu guests at least.
> 
> We could also leave it as is (crash all the time) but it implies that
> vendors that are seeing issues with Linux today will have to keep
> maintaining patches in their private trees until a better solution is
> found. This would also be the case if we crash multi-vcpus guests as
> previously suggested.

The crash only happened when using vGICv3 not vGICv2. But did you look 
at Xen recently? Particularly at the following patch:

xen/arm: Handle unimplemented VGICv3 registers as RAZ/WI

Per the ARM Generic Interrupt Controller Architecture Specification (ARM
IHI 0069E), reserved registers should generally be treated as RAZ/WI.
To simplify the VGICv3 design and improve guest compatibility, treat the
default case for GICD and GICR registers as read_as_zero/write_ignore.

Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Acked-by: Julien Grall <julien@xen.org>

I actually pointed the patch to you during one of our weekly calls. Yet 
we agreed it would still be good to implement the register properly and 
you said you will write a patch.

Anyway, I gave you a solution and also why I think it would still be 
fine in term of IRQ latency. The ball is now in your court.

Cheers,

-- 
Julien Grall

