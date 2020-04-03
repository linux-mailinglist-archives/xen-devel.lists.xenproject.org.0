Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3305D19D2C7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 10:57:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKI7r-0001GC-0x; Fri, 03 Apr 2020 08:56:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DpjN=5T=kernel.org=maz@srs-us1.protection.inumbo.net>)
 id 1jKHym-0000W1-Cq
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 08:47:08 +0000
X-Inumbo-ID: b333f788-7587-11ea-b4f4-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b333f788-7587-11ea-b4f4-bc764e2007e4;
 Fri, 03 Apr 2020 08:47:07 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F0D2206E9;
 Fri,  3 Apr 2020 08:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585903627;
 bh=2PhW1qDopiRvO+gz50VePvN+omC3zgLGQ6Up99cw8nk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZCUaq8JHUwyGZnKgKgSoNM9lxn3yTGBjb615H8/5erNU2Ry3onT9cCs4E+F9qv25S
 re2nAvb/qfV7z9FyqbOyobIestDARMcxCMLsSCqtFQLVOnca/JyxYYgq1iJXz6LgYK
 T3eCeh5QoCIX5rQAbyJvg9MydcEQvce8bsbQiyQk=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jKHyj-000Rb4-3P; Fri, 03 Apr 2020 09:47:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 03 Apr 2020 09:47:05 +0100
From: Marc Zyngier <maz@kernel.org>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
In-Reply-To: <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
Message-ID: <85acdd9fa8248ddb93f2c5792bf5bd41@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: julien@xen.org, stefano.stabellini@xilinx.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org, xuwei5@hisilicon.com,
 peng.fan@nxp.com, George.Dunlap@citrix.com, Bertrand.Marquis@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Mailman-Approved-At: Fri, 03 Apr 2020 08:56:29 +0000
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
 George.Dunlap@citrix.com, Wei Xu <xuwei5@hisilicon.com>,
 Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-04-02 19:52, Julien Grall wrote:
> (+Marc)

Thanks for looping me in. Definitely an interesting read, but also a 
very
puzzling one.

> 
> Hi Stefano,
> 
> On 02/04/2020 18:19, Stefano Stabellini wrote:
>> On Wed, 1 Apr 2020, Julien Grall wrote:
>>> On 01/04/2020 01:57, Stefano Stabellini wrote:
>>>> On Mon, 30 Mar 2020, Julien Grall wrote:
>>>>> Hi Stefano,
>>>>> 
>>>>> On 30/03/2020 17:35, Stefano Stabellini wrote:
>>>>>> On Sat, 28 Mar 2020, Julien Grall wrote:
>>>>>>> qHi Stefano,
>>>>>>> 
>>>>>>> On 27/03/2020 02:34, Stefano Stabellini wrote:
>>>>>>>> This is a simple implementation of GICD_ICACTIVER / 
>>>>>>>> GICD_ISACTIVER
>>>>>>>> reads. It doesn't take into account the latest state of 
>>>>>>>> interrupts
>>>>>>>> on
>>>>>>>> other vCPUs. Only the current vCPU is up-to-date. A full 
>>>>>>>> solution is
>>>>>>>> not possible because it would require synchronization among all
>>>>>>>> vCPUs,
>>>>>>>> which would be very expensive in terms or latency.
>>>>>>> 
>>>>>>> Your sentence suggests you have number showing that correctly
>>>>>>> emulating
>>>>>>> the
>>>>>>> registers would be too slow. Mind sharing them?
>>>>>> 
>>>>>> No, I don't have any numbers. Would you prefer a different wording 
>>>>>> or a
>>>>>> better explanation? I also realized there is a typo in there 
>>>>>> (or/of).
>>>>> Let me start with I think correctness is more important than speed.
>>>>> So I would have expected your commit message to contain some fact 
>>>>> why
>>>>> synchronization is going to be slow and why this is a problem.
>>>>> 
>>>>> To give you a concrete example, the implementation of set/way 
>>>>> instructions
>>>>> are
>>>>> really slow (it could take a few seconds depending on the setup). 
>>>>> However,
>>>>> this was fine because not implementing them correctly would have a 
>>>>> greater
>>>>> impact on the guest (corruption) and they are not used often.
>>>>> 
>>>>> I don't think the performance in our case will be in same order 
>>>>> magnitude.
>>>>> It
>>>>> is most likely to be in the range of milliseconds (if not less) 
>>>>> which I
>>>>> think
>>>>> is acceptable for emulation (particularly for the vGIC) and the 
>>>>> current
>>>>> uses.
>>>> 
>>>> Writing on the mailing list some of our discussions today.
>>>> 
>>>> Correctness is not just in terms of compliance to a specification 
>>>> but it
>>>> is also about not breaking guests. Introducing latency in the range 
>>>> of
>>>> milliseconds, or hundreds of microseconds, would break any latency
>>>> sensitive workloads. We don't have numbers so we don't know for 
>>>> certain
>>>> the effect that your suggestion would have.
>>> 
>>> You missed part of the discussion. I don't disagree that latency is 
>>> important.
>>> However, if an implementation is only 95% reliable, then it means 5% 
>>> of the
>>> time your guest may break (corruption, crash, deadlock...). At which 
>>> point the
>>> latency is the last of your concern.
>> 
>> Yeah I missed to highlight it, also because I look at it from a 
>> slightly
>> different perspective: I think IRQ latency is part of correctness.

No. Low latency is a very desirable thing, but it doesn't matter at all 
when
you don't even have functional correctness. To use my favourite car 
analogy,
having a bigger engine doesn't help when you're about to hit the wall 
and
have no breaks... You just hit the wall faster.

>> 
>> If we have a solution that is not 100% faithful to the specification 
>> we
>> are going to break guests that rely on a faithful implementation of
>> ISACTIVER.
>> 
>> If we have a solution that is 100% faithful to the specification but
>> causes latency spikes it breaks RT guests.
>> 
>> But they are different sets of guests, it is not like one is 
>> necessarily
>> a subset of the other: there are guests that cannot tolerate any 
>> latency
>> spikes but they are OK with an imprecise implementation of ISACTIVER.

s/imprecise/massively incorrect/

>> 
>> My preference is a solution that is both spec-faithful and also 
>> doesn't
>> cause any latency spikes. If that is not possible then we'll have to
>> compromise or come up with "creative" ideas.

You want your cake and eat it. Always a good thing to want.

As long as you don't pretend you implement the GIC architecture, expose
something else altogether to the guests and have specific drivers in all
the guest operating systems under the sun, by all mean, be creative.

> I do agree that latency is important. However, this needs to be based
> on numbers or a good grasp as to why this would be an issue. Neither
> of these have been provided so far.
> 
> As we discussed on Tuesday, the cost for other vCPUs is only going to
> be a trap to the hypervisor and then back again. The cost is likely
> smaller than receiving and forwarding an interrupt.
> 
> You actually agreed on this analysis. So can you enlighten me as to
> why receiving an interrupt is a not problem for latency but this is?
> 
>> 
>>>> It would be interesting to have those numbers, and I'll add to my 
>>>> TODO
>>>> list to run the experiments you suggested, but I'll put it on the
>>>> back-burner (from a Xilinx perspective it is low priority as no
>>>> customers are affected.)
>>> 
>>> How about we get a correct implementation merge first and then 
>>> discuss about
>>> optimization? This would allow the community to check whether there 
>>> are
>>> actually noticeable latency in their workload.
>> 
>> A correct implementation to me means that it is correct from both the
>> specification point of view as well as from a latency point of view. A
>> patch that potentially introduces latency spikes could cause guest
>> breakage and I don't think it should be considered correct. The
>> tests would have to be done beforehand.

Please find anything that specifies latency in the GIC spec. Oh wait,
there is none. Because that's a quality of implementation thing, and
not a correctness issue.

> 
> In all honesty, writing and testing the implementation would have
> likely took you less than trying to push for "creative" ideas or your
> patch.
> 
>> In terms of other "creative" ideas, here are some:
> 
> "creative" ideas should really be the last resort. Correct me if I am
> wrong, but I don't think we are there yet.
> 
>> 
>> One idea, as George suggested, would be to document the interface
>> deviation. The intention is still to remove any deviation but at least
>> we would be clear about what we have. Ideally in a single place 
>> together
>> with other hypervisors. This is my preference.
> 
> It is not without saying that deviation from specification should not
> be taken lightly and has risks.
> 
> The main risk is you are never going to be able to reliably run an OS
> on Xen unless you manage to get the deviation accepted by the wider
> community and Arm.

There is just no way I'll ever accept a change to the GIC interrupt 
state
machine for Linux. Feel free to try and convince other OS maintainers.

If you want to be creative, be really creative. Implement a fully PV 
interrupt
controller that gives you simple enough semantics so that you can 
actually be
deterministic. Don't pretend you implement the GIC architecture.

>> Another idea is that we could crash the guest if GICD_ISACTIVER is 
>> read
>> from a multi-vcpu guest. It is similar to what we already do today but
>> better because we would do it purposely (not because of a typo) and
>> because it will work for single vcpu guests at least.
>> 
>> We could also leave it as is (crash all the time) but it implies that
>> vendors that are seeing issues with Linux today will have to keep
>> maintaining patches in their private trees until a better solution is
>> found. This would also be the case if we crash multi-vcpus guests as
>> previously suggested.

OK, that's just insane. Suggesting that guests should be left crashing
because the are doing *the right thing* is just barking mad. I'm all for
exposing guest bugs when they take shortcuts with the architecture, but
blaming the guest for what is just a bug in Xen?

If I was someone developing a product using Xen/ARM, I'd be very worried
about what you have written above. Because it really reads "we don't 
care
about reliability as long as we can show amazing numbers". I really hope
it isn't what you mean.

         M.
-- 
Jazz is not dead. It just smells funny...

