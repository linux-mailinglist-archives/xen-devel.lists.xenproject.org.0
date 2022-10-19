Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14459605336
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 00:34:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426056.674266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olHcY-0002qD-Rq; Wed, 19 Oct 2022 22:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426056.674266; Wed, 19 Oct 2022 22:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olHcY-0002nW-P3; Wed, 19 Oct 2022 22:33:06 +0000
Received: by outflank-mailman (input) for mailman id 426056;
 Wed, 19 Oct 2022 22:33:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olHcY-0002nN-1o
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 22:33:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olHcX-0006gL-H4; Wed, 19 Oct 2022 22:33:05 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.85.39.71])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olHcX-0005GN-76; Wed, 19 Oct 2022 22:33:05 +0000
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
	bh=+qkh3NNEHHOFAhi9bBrRrQ3He8Cc/WI9wSQ4QXa58yw=; b=hjByN9Qn47BWDkoVQmrV7v29Z5
	pdMHmYihEHeQYTwTYmMarErnEKXPlKKEQLJB5p6vjRCeLHNVDBjnZHf5P4xrBYPfJMQbUX5iT4a8J
	ur/pi3kGQxnpZcM3h8u+Q35lN+4+RmLgPnGMW332mJnjoRYT6hnXLRekiyvddjK5M1FU=;
Message-ID: <f200534c-c001-3ec0-7e05-cdbb76f456e3@xen.org>
Date: Wed, 19 Oct 2022 23:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20221017191237.11079-1-andrew.cooper3@citrix.com>
 <20221017191237.11079-3-andrew.cooper3@citrix.com>
 <0456d318-731f-8df7-297c-19ecde06ed96@xen.org>
 <cadcee69-e51b-99af-78c3-ab4a0e2e42d9@citrix.com>
 <5587f5bd-1694-a843-9e80-ad477527a576@xen.org>
 <dffdc951-91fd-2659-ec7f-5c213138d785@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dffdc951-91fd-2659-ec7f-5c213138d785@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 19/10/2022 22:30, Andrew Cooper wrote:
> On 18/10/2022 00:01, Julien Grall wrote:
>>>> ... you are hardcoding both p2m_teardown() and p2m_set_allocation().
>>>> IMO this is not an improvement at all. It is just making the code more
>>>> complex than necessary and lack all the explanation on the assumptions.
>>>>
>>>> So while I am fine with your patch #1 (already reviewed it), there is
>>>> a better patch from Henry on the ML. So we should take his (rebased)
>>>> instead of yours.
>>>
>>> If by better, you mean something that still has errors, then sure.
>>>
>>> There's a really good reason why you cannot safely repurpose
>>> p2m_teardown().  It's written expecting a fully constructed domain -
>>> which is fine because that's how it is used.  It doesn't cope safely
>>> with an partially constructed domain.
>>
>> It is not 100% clear what is the issue you are referring to as the
>> VMID is valid at this point. So what part would be wrong?
> 
> Falling over a bad root pointer from an early construction exit.

You have been mentioning that several time now but I can't see how this
can happen. If you look at Henry's second patch, p2m_teardown() starts
with the following check:
if ( page_list_empty(&p2m->pages) )
    return;

Per the logic in p2m_init(), the root pages have to be allocated (note 
they are *not* allocated from the P2M pool) and the VMID as well before 
any pages could be added in the list.

> 
>> But if there are part of p2m_teardown() that are not safe for
>> partially constructed domain, then we should split the code. This
>> would be much better that the duplication you are proposing.
> 
> You have two totally different contexts with different safety
> requirements.  c/s 55914f7fc9 is a reasonably good and clean separation
> between preemptible and non-preemptible cleanup[1].

The part you mention in [1] was decided to be delayed post 4.17 for 
development cycle reasons.

> 
> You've agreed that the introduction of the non-preemptible path to the
> preemptible path is a hack and layering violation, and will need undoing
> later.  Others have raised this concern too.

[...]

> 
> Also realise that you've now split the helper between regular hypercall
> context, and RCU context, and recall what happened when we finally
> started asserting that memory couldn't be allocated in stop-machine context.
> 
> How certain are you that the safety is the same on earlier versions of
> Xen?
I am pretty confident because the P2M code has not changed a lot.

> What is the likelihood that all of these actions will remain safe
> given future development?
Code always evolve and neither you (nor I) can claim that any work will 
stay safe forever. In your patch proposal, then the risk is a bug could 
be duplicated.

> 
> 
> Despite what is being claimed, the attempt to share cleanup logic is
> introducing fragility and risk, not removing it.

I find interesting you are saying that... If we were going to move 
p2m_teardown() in domain_teardown() then we would end up to share the code.

To me, this is not very different here because in one context it would 
be preemptible while the other it won't. At which point...

>  This is a bugfix for
> to a security fix issue which is totally dead on arrival; net safety,
> especially in older versions of the Xen, is *the highest priority*.
> 
> These two different contexts don't share any common properties of how to
> clean up the pool, save freeing the frames back to the memory
> allocator.  In a proper design, this is the hint that they shouldn't
> share logic either
... why is your design better than what Henry's proposed?

> 
> Given that you do expect someone to spend yet-more time&effort to undo
> the short term hack currently being proposed, how do you envisage the
> end result looking?

The end result will be p2m_teardown() & co to be called from 
domain_teardown().

Anyway, this discussion doesn't make us closer to come to an agreement 
on the correct approach. We have both very diverging opinion and so far 
I haven't seen any strong reasons that is showing yours is better.

So unless Bertrand or Stefano agree with you, then I will go ahead and 
merge Henry's patch tomorrow after a final review.

Cheers,

-- 
Julien Grall

