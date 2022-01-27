Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1772649E365
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 14:31:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261478.452799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4rt-0002Hn-37; Thu, 27 Jan 2022 13:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261478.452799; Thu, 27 Jan 2022 13:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4rt-0002Et-0E; Thu, 27 Jan 2022 13:31:17 +0000
Received: by outflank-mailman (input) for mailman id 261478;
 Thu, 27 Jan 2022 13:31:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nD4rs-0002En-BE
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 13:31:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD4rr-0000NJ-Hm; Thu, 27 Jan 2022 13:31:15 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.9.172]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD4rr-0003zP-B3; Thu, 27 Jan 2022 13:31:15 +0000
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
	bh=ebWfG6Jpi5FW+COuScfdM4cJGCUbuaf+nVcYzONzqpI=; b=rEBSoCMOaqss07UmmjgEEK511/
	9c2XWMR6sYQ3QByQzgM0/sJir/V5A6WR5vF6eTM6PzHKKoR8Y8MmF3vZwOo76eET8pikVePcLLEWT
	mkSkpbK3MyjdKh5CbEqRebZw1N12bd0Hyo48YKn4zYyRhoTZv1n262i4Ip7R8RwKQ5jE=;
Message-ID: <55c8e510-8b8d-ca27-f635-e2109fff9c5d@xen.org>
Date: Thu, 27 Jan 2022 13:31:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-2-sstabellini@kernel.org>
 <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org>
 <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
 <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com>
 <alpine.DEB.2.22.394.2201251435030.27308@ubuntu-linux-20-04-desktop>
 <a992cf74-a75a-43d0-f83a-cd9549f586a8@xen.org>
 <alpine.DEB.2.22.394.2201251530400.27308@ubuntu-linux-20-04-desktop>
 <aa7aee5b-71cf-78c3-f8a2-f8d166f22ecb@suse.com>
 <966ac15d-e91f-e812-1021-296ef60a9a06@xen.org>
 <alpine.DEB.2.22.394.2201261727550.27308@ubuntu-linux-20-04-desktop>
 <33d1c1eb-7d6d-21c6-8ed4-3daef5be90d3@xen.org>
 <b2edac13-f019-f615-0655-8510bfffedbe@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b2edac13-f019-f615-0655-8510bfffedbe@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/01/2022 12:07, Jan Beulich wrote:
> On 27.01.2022 10:51, Julien Grall wrote:
>> On 27/01/2022 01:50, Stefano Stabellini wrote:
>>> On Wed, 26 Jan 2022, Julien Grall wrote:
>>>> On 26/01/2022 07:30, Jan Beulich wrote:
>>>>> On 26.01.2022 02:03, Stefano Stabellini wrote:
>>>>>> Are you guys OK with something like this?
>>>>>
>>>>> With proper proof that this isn't going to regress anything else, maybe.
>>>>
>>>> That's why I sugested to also gate with system_state < SYS_STATE_boot so we
>>>> reduce the potential regression (the use of hypercall should be limited at
>>>> boot).
>>>>
>>>> FWIW, there was a thread [1] to discuss the same issue as Stefano is facing
>>>> (but in the context of Live-Update).
>>>>
>>>>> But ...
>>>>>
>>>>>> --- a/xen/include/xsm/dummy.h
>>>>>> +++ b/xen/include/xsm/dummy.h
>>>>>> @@ -92,7 +92,9 @@ static always_inline int xsm_default_action(
>>>>>>                 return 0;
>>>>>>             /* fall through */
>>>>>>         case XSM_PRIV:
>>>>>> -        if ( is_control_domain(src) )
>>>>>> +        if ( is_control_domain(src) ||
>>>>>> +             src->domain_id == DOMID_IDLE ||
>>>>>> +             src->domain_id == DOMID_XEN )
>>>>>>                 return 0;
>>>>>
>>>>> ... my first question would be under what circumstances you might observe
>>>>> DOMID_XEN here and hence why this check is there.
>>>
>>> For simplicity I'll answer all the points here.
>>>
>>> I added both DOMID_IDLE and DOMID_XEN because I thought it "made sense",
>>> but there is no need for DOMID_XEN. We only need DOMID_IDLE. Also adding
>>> a system_state <= SYS_STATE_boot is fine (but it needs to be <= instead
>>> of <). The patch appended below works without issues.
>>>
>>> Alternatively, I am also quite happy with Jan's suggestion of passing an
>>> extra parameter to evtchn_alloc_unbound, it could be:
>>>
>>> int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool disable_xsm);
>>>
>>> So that XSM is enabled by default.
>>>
>>> Adding the bool parameter to evtchn_alloc_unbound has the advantage of
>>> having only a very minor impact.
>>
>> We will likely need similar approach for other hypercalls in the future
>> if we need to call them from Xen context (e.g. when restoring domain
>> state during Live-Update).
>>
>> So my preference would be to directly go with modifying the
>> xsm_default_action().
> 
> How would this help when a real XSM policy is in use? Already in SILO
> mode I think you wouldn't get past the check, as the idle domain
> doesn't satisfy silo_mode_dom_check()'s use of is_control_domain().
> Actually I'm not even sure you'd get that far - I was under the
> impression that the domain at other side of the channel may not even
> be around at that time, in which case silo_evtchn_unbound() would
> return -ESRCH.

This would not help for real XSM policy. We would either need to bypass 
XSM completely or decide what to do depending on the mode (e.g. SILO, 
FLASK...).

> 
> Additionally relaxing things at a central place like this one comes
> with the risk of relaxing too much. As said in reply to Stefano - if
> this is to be done, proof will need to be provided that this doesn't
> and won't permit operations which aren't supposed to be permitted. I
> for one would much prefer relaxation on a case-by-case basis.

The problem is you will end up to modify a lot of code. This will be 
quite tedious when the policy is likely going to be the same (e.g. if we 
are booting, then allow to use the hypercall).

So I think it makes more sense to do the modification at central place. 
That said, this is not strictly necessary for what Stefano needs. So I 
am OK if we go with local hack and deferred the debate to when a wider 
solution is needed.

Cheers,

-- 
Julien Grall

