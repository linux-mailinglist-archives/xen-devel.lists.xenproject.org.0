Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B00C601D13
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 01:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424641.672217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okZ71-0006Ay-Sl; Mon, 17 Oct 2022 23:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424641.672217; Mon, 17 Oct 2022 23:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okZ71-00068a-PT; Mon, 17 Oct 2022 23:01:35 +0000
Received: by outflank-mailman (input) for mailman id 424641;
 Mon, 17 Oct 2022 23:01:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1okZ70-00068U-TC
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 23:01:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okZ70-00022t-Du; Mon, 17 Oct 2022 23:01:34 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okZ70-00057b-7c; Mon, 17 Oct 2022 23:01:34 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=t8/Cw47LJ6fZbiYZI37iKW/Zbp9Be+z15qnNcXSA3Ng=; b=tfV5vDuD7McGWCAC/PTOQ/84qw
	VRUL7jJrtZ8CMDakyxpl0rMPePOf5F6BuxmKUpBzjRVGGW/QBChyXORVNf66PvI17o7/N1agMvU2x
	VByxKxs7qBmehoQql4zAAgEi942lQsFh72umdPrmcdUwRxty1In2jZY/QlEo4MrEEiUU=;
Message-ID: <5587f5bd-1694-a843-9e80-ad477527a576@xen.org>
Date: Tue, 18 Oct 2022 00:01:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
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
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
In-Reply-To: <cadcee69-e51b-99af-78c3-ab4a0e2e42d9@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 17/10/2022 22:50, Andrew Cooper wrote:
> On 17/10/2022 21:36, Julien Grall wrote:
>> Hi Andrew,
>>
>> On 17/10/2022 20:12, Andrew Cooper wrote:
>>> From: Henry Wang <Henry.Wang@arm.com>
>>>
>>> The XSA-409 fixes discovered that the GICv2 path tries to create P2M
>>> mappings
>>> in the domain_create() path.  This fails, as the P2M pool is empty
>>> before a
>>> XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION hypercall.
>>>
>>> As a stopgap, automatically give domains 16 pages of P2M memory.
>>> This is
>>> large enough to allow the GICv2 case to work, but small enough to not
>>> introduce a continuation worry.
>>>
>>> A consequence is that, for later error paths domain_create(), we end
>>> up in
>>> p2m_final_teardown() with a nonzero P2M pool.  Such a domain has no
>>> vCPUs, and
>>> has never been scheduled, so free the memory directly.
>>>
>>> Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the
>>> P2M pool")
>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>
>> This is not really in the spirit of my original suggestion anymore
> 
> Ok, I have dropped it.
> 
>> ... In fact, you drop all the explanations regarding how the code is
>> fragile (e.g. we are relying on early mapping to not take any extra
>> reference). Maybe you don't care, but I do as Henry and I spent ages
>> to figure out all the corner cases.
> 
> I presume you're referring to the todo?  If so, that's an statement, not
> an explanation of what is suddenly different about it.
> 
> What has XSA-409 changed in this regard?  Because it looks like the
> answer is nothing and the GICv2 path was similarly fragile beforehand.
> In which case, why it is appropriate content for a security patch?

This is explaining why the current logic (and the one you add) is still 
OK. It is not entirely related to XSA-409, but relevant to the fix 
itself (and why the issue is now "properly" closed).

> 
>>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>> CC: Henry Wang <Henry.Wang@arm.com>
>>> ---
>>>    xen/arch/arm/p2m.c | 43 +++++++++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 41 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>> index 6826f6315080..76a0e31c6c8c 100644
>>> --- a/xen/arch/arm/p2m.c
>>> +++ b/xen/arch/arm/p2m.c
>>> @@ -1736,8 +1736,36 @@ void p2m_final_teardown(struct domain *d)
>>>        if ( !p2m->domain )
>>>            return;
>>>    -    ASSERT(page_list_empty(&p2m->pages));
>>> -    ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
>>> +    /*
>>> +     * On the domain_create() error path only, we can end up here
>>> with a
>>> +     * non-zero P2M pool.
>>> +     *
>>> +     * At present, this is a maximum of 16 pages, spread between
>>> p2m->pages
>>> +     * and the free list.  The domain has never been scheduled (it
>>> has no
>>> +     * vcpus), so there is TLB maintenance to perform; just free
>>> everything.
>>> +     */
>>> +    if ( !page_list_empty(&p2m->pages) ||
>>> +         !page_list_empty(&d->arch.paging.p2m_freelist) )
>>> +    {
>>> +        struct page_info *pg;
>>> +
>>> +        /*
>>> +         * There's no sensible "in the domain_create() error path"
>>> predicate,
>>> +         * so simply sanity check that we don't have unexpected work
>>> to do.
>>> +         */
>>> +        ASSERT(d->arch.paging.p2m_total_pages <= 16);
>>> +
>>> +        spin_lock(&d->arch.paging.lock);
>>> +
>>> +        while ( (pg = page_list_remove_head(&p2m->pages)) )
>>> +            free_domheap_page(pg);
>>> +        while ( (pg =
>>> page_list_remove_head(&d->arch.paging.p2m_freelist)) )
>>> +            free_domheap_page(pg);
>>> +
>>> +        d->arch.paging.p2m_total_pages = 0;
>>> +
>>> +        spin_unlock(&d->arch.paging.lock);
>>> +    }
>>
>> ... you are hardcoding both p2m_teardown() and p2m_set_allocation().
>> IMO this is not an improvement at all. It is just making the code more
>> complex than necessary and lack all the explanation on the assumptions.
>>
>> So while I am fine with your patch #1 (already reviewed it), there is
>> a better patch from Henry on the ML. So we should take his (rebased)
>> instead of yours.
> 
> If by better, you mean something that still has errors, then sure.
> 
> There's a really good reason why you cannot safely repurpose
> p2m_teardown().  It's written expecting a fully constructed domain -
> which is fine because that's how it is used.  It doesn't cope safely
> with an partially constructed domain.

It is not 100% clear what is the issue you are referring to as the VMID 
is valid at this point. So what part would be wrong?

But if there are part of p2m_teardown() that are not safe for partially 
constructed domain, then we should split the code. This would be much 
better that the duplication you are proposing.

Cheers,

-- 
Julien Grall

