Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B935FF9B7
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 12:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423384.670087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojesW-00085i-IY; Sat, 15 Oct 2022 10:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423384.670087; Sat, 15 Oct 2022 10:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojesW-00082s-Fo; Sat, 15 Oct 2022 10:58:52 +0000
Received: by outflank-mailman (input) for mailman id 423384;
 Sat, 15 Oct 2022 10:58:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ojesV-00082m-8z
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 10:58:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojesV-0007mR-0M; Sat, 15 Oct 2022 10:58:51 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojesU-0002P4-Qv; Sat, 15 Oct 2022 10:58:50 +0000
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
	bh=Bo71Qu2V1PLwI6LPnJOP9xQaEnMSMOyVj95DghF2hAo=; b=eoVHQc427+Ijov0jxvFj6FPLli
	K20URcp/lwtr+lJqFS0d/QHbihI5f4oLZtfTdzkKIGTFMwviMsOXOZzz1bCecPxUmX/Asuk2UXkZ2
	cq+tGdffVi411J6kCUpkEOjlVXYDWU9QkcaNoLGmuEakLuXZ6azGOnUKXJpAh+eOB+k0=;
Message-ID: <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
Date: Sat, 15 Oct 2022 11:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
In-Reply-To: <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/10/2022 12:19, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>>>        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>        unsigned long count = 0;
>>> @@ -1716,7 +1716,7 @@ int p2m_teardown(struct domain *d)
>>>            p2m_free_page(p2m->domain, pg);
>>>            count++;
>>>            /* Arbitrarily preempt every 512 iterations */
>>> -        if ( !(count % 512) && hypercall_preempt_check() )
>>> +        if ( allow_preemption && !(count % 512) &&
>> hypercall_preempt_check() )
>>>            {
>>>                rc = -ERESTART;
>>>                break;
>>> @@ -1736,6 +1736,17 @@ void p2m_final_teardown(struct domain *d)
>>>        if ( !p2m->domain )
>>>            return;
>>>
>>> +    if ( !page_list_empty(&p2m->pages) )
>>
>> Did you add this check to avoid the clean & invalidate if the list is empty?
> 
> Yep. I think we only need the p2m_teardown() if we actually have something
> in p2m->pages list.

How about adding the check in p2m_teardown()? So it will be easier to 
remember that the check can be dropped if we move the zeroing outside of 
the function.

> 
>>
>>> +        p2m_teardown(d, false);
>>
>> Today, it should be fine to ignore p2m_teardown(). But I would prefer if
>> we add an ASSERT()/BUG_ON() (or else) to make confirm this is the case.
> 
> Sorry I do not really understand why we can ignore the p2m_teardown()
> probably because of my English.

No, I forgot a word in my sentence. I was meant to say that the return 
of p2m_teardown() can be ignored in our situation because it only return 
0 or -ERESTART. The latter cannnot happen when the preemption is not 
enabled.

But I would like to add some code (either ASSERT() or BUG_ON()) to 
confirm that p2m_teardown() will always return 0.

> Let's talk a bit more in C if you don't mind :))
> Do you mean p2m_teardown() should be called here unconditionally without
> the if ( !page_list_empty(&p2m->pages) ) check?

See above.

> 
>>
>> This also wants to be documented on top of p2m_teardown() as it would be
>> easier to know that the function should always return 0 when
>> !allow_preemption is not set.
> 
> Ok, will do.
> 
>>
>> I also noticed that relinquish_p2m_mapping() is not called. This should
>> be fine for us because arch_domain_create() should never create a
>> mapping that requires p2m_put_l3_page() to be called.
>>
>> I think it would be good to check it in __p2m_set_entry(). So we don't
>> end up to add such mappings by mistake.
> 
> I thought for a while but failed to translate the above requirements
> to proper if conditions in __p2m_set_entry()...

For checking the mapping, we can do:

if ( !removing_mapping && (p2m_is_foreign(t) || (p2m_is_ram(t) && 
is_xenheap_mfn(mfn) )
     return -EINVAL;

We also need a way to check whether we are called from 
arch_domain_create(). I think we would need a field in the domain 
structure to indicate whether it is still initializating.

This is a bit ugly though. Any other suggestions?

> 
>>
>> I would have suggested to add a comment only for version and send a
>> follow-up patch. But I don't exactly know where to put it.
> 
> ...how about p2m_final_teardown(), we can use a TODO to explain why
> we don't need to call relinquish_p2m_mapping() and a following patch
> can fix this?

To me the TODO would make more sense on top of p2m_set_entry() because 
this is where the issue should be fixed. This is also where most of the 
reader will likely look if they want to understand how p2m_set_entry() 
can be used.

We could also have a comment in p2m_final_teardown() stating that the 
relinquish function is not called because the P2M should not contain any 
mapping that requires specific operation when removed. This could point 
to the comment in p2m_set_entry().

Cheers,

-- 
Julien Grall

