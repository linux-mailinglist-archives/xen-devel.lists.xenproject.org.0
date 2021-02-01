Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE1830AB9A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79994.146051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6bIf-0000cP-Bk; Mon, 01 Feb 2021 15:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79994.146051; Mon, 01 Feb 2021 15:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6bIf-0000c0-7z; Mon, 01 Feb 2021 15:39:37 +0000
Received: by outflank-mailman (input) for mailman id 79994;
 Mon, 01 Feb 2021 15:39:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l6bId-0000be-BA
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:39:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l6bIZ-0004sr-Qn; Mon, 01 Feb 2021 15:39:31 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l6bIZ-0006xh-Io; Mon, 01 Feb 2021 15:39:31 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=vwDt3r++4xn6rNRb7Y2vRUxUWBY36G0ldfZ6OSmnceQ=; b=pALZyd48hjQaLOfm/YRn/vgI+B
	9Dm9gIGSQfKHXUiJnEINJY47SDSFYdAbm9Uz3319Q84bZBqzaQog+iyOYwhsnmqU7xaKx72Xzo7fE
	9eveOrDgyvp8aUM5dns0Xpynqq0zTY030K+aYPnWJsL3UG6w+6pROTawEHCxdszCZnXQ=;
Subject: Re: [PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and
 CONFIG_COVERAGE=y [and 1 more messages]
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20210130152210.17503-1-julien@xen.org>
 <174a18ba-25d5-a94c-a85d-4a81b837a936@suse.com>
 <24600.5695.143342.713995@mariner.uk.xensource.com>
 <321c06d3-106a-cfab-5ac8-df629e600dfe@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <00328618-61c8-3fc7-45ce-ee99b71c85b5@xen.org>
Date: Mon, 1 Feb 2021 15:39:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <321c06d3-106a-cfab-5ac8-df629e600dfe@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 01/02/2021 15:02, Jan Beulich wrote:
> On 01.02.2021 15:54, Ian Jackson wrote:
>> Julien Grall writes ("[PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and CONFIG_COVERAGE=y"):
>>> Xen is heavily relying on the DCE stage to remove unused code so the
>>> linker doesn't throw an error because a function is not implemented
>>> yet we defined a prototype for it.
>>
>> Thanks for the clear explanation.
>>
>>> It is not entirely clear why the compiler DCE is not detecting the
>>> unused code. However, moving the permission check from do_memory_op()
>>> to xenmem_add_to_physmap_batch() does the trick.
>>
>> How unfortunate.
>>
>>> Fixes: d4f699a0df6c ("x86/mm: p2m_add_foreign() is HVM-only")
>>> Reported-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> I have reviewed the diff, but not the code in context.
>>
>>> The gitlab CI is used to provide basic testing on a per-series basis. So
>>> I would like to request this patch to be merged in Xen 4.15 in order to
>>> reduce the number of failure not related to the series tested.
>>
>> Quite so.
>>
>> Jan Beulich writes ("Re: [PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and CONFIG_COVERAGE=y"):
>>> On 30.01.2021 16:22, Julien Grall wrote:
>>>> @@ -1442,13 +1447,6 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>           if ( d == NULL )
>>>>               return -ESRCH;
>>>>   
>>>> -        rc = xatp_permission_check(d, xatpb.space);
>>>> -        if ( rc )
>>>> -        {
>>>> -            rcu_unlock_domain(d);
>>>> -            return rc;
>>>> -        }
>>>> -
>>>>           rc = xenmem_add_to_physmap_batch(d, &xatpb, start_extent);
>>>>   
>>>>           rcu_unlock_domain(d);
>>>
>>> I'd be okay with the code movement if you did so consistently,
>>> i.e. also for the other invocation. I realize this would have
>>> an effect on the dm-op call of the function, but I wonder
>>> whether this wouldn't even be a good thing. If not, I think
>>> duplicating xenmem_add_to_physmap()'s early ASSERT() into
>>> xenmem_add_to_physmap_batch() would be the better course of
>>> action.
>>
>> Jan, can you confirm whether in your opinion this patch as originally
>> posted by Julien is *correct* as is ?  In particular, Julien did not
>> intend a functional change.  Have you satisfied yourself that there is
>> no functional change here ?
> 
> Yes and yes.
> 
>> I understand your objectiion above to relate to style or neatness,
>> rather than function.  Is that correct ?
> 
> Yes.
> 
>>   And that your proposed
>> additional change would have some impact whilch would have to be
>> assessed.
> 
> The first of the proposed alternatives may need further
> investigation, yes. The second of the alternatives would
> shrink this patch to a 2-line one, i.e. far less code
> churn, and is not in need of any assessment afaia. In
> fact I believe this latter alternative was discussed as
> the approach to take here, before the patch was submitted.

Right, I chose this approach over the one discussed previously because 
it doesn't duplicate the check for auto-translated domain and I couldn't 
really find a good way to justify it in the code (you requested one).

Regarding calling the xatp_permission_check() from 
xenmem_add_to_physmap(). It would means that the DM code will have two 
XSM check (one XSM_DM_PRIV, one XSM_TARGET). It is not clear to me 
whether this is going to be introducing more headache for the XSM folks.

Therefore, for Xen 4.15, I would prefer to stick with my patch.

Cheers,

-- 
Julien Grall

