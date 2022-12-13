Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB3964B278
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 10:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460325.718209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51hR-0000gZ-64; Tue, 13 Dec 2022 09:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460325.718209; Tue, 13 Dec 2022 09:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51hR-0000dm-3P; Tue, 13 Dec 2022 09:35:45 +0000
Received: by outflank-mailman (input) for mailman id 460325;
 Tue, 13 Dec 2022 09:35:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p51hP-0000dg-9H
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 09:35:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p51hO-0002cX-DC; Tue, 13 Dec 2022 09:35:42 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.2.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p51hO-0000t8-7A; Tue, 13 Dec 2022 09:35:42 +0000
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
	bh=mdkwrexcvNpKvg+Y5cwbcZrQG+99dA3JMBZzLm7u4rA=; b=I1qxGjBuq0s8lx4Ei+lkYASYtT
	WiKHRk++FO4ZBoom+gpIKd29k8+avHooAiVSYIIOshOtsI38VriP+jFN6UERAjdUiu66B8D3zLnS1
	1fGrEWIuurbMw2v0PhRn2WUVGSUzmzMwFA6f+bnIuw+vbkjc6HQ4u1YesST2tWpYrTsU=;
Message-ID: <81985efe-7335-770c-c411-55c88db26a75@xen.org>
Date: Tue, 13 Dec 2022 09:35:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 11/20] tools/xenstore: move changed domain handling
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-12-jgross@suse.com>
 <6bad7b3c-eaa2-d342-a7f2-d265bdefd54a@xen.org>
 <e2aa2c60-5d4f-06ca-153e-cdb422aa084d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e2aa2c60-5d4f-06ca-153e-cdb422aa084d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 13/12/2022 06:53, Juergen Gross wrote:
> On 01.12.22 22:58, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 01/11/2022 15:28, Juergen Gross wrote:
>>>   static bool check_indexes(XENSTORE_RING_IDX cons, XENSTORE_RING_IDX 
>>> prod)
>>> @@ -492,8 +504,12 @@ static struct domain 
>>> *find_or_alloc_existing_domain(unsigned int domid)
>>>       xc_dominfo_t dominfo;
>>>       domain = find_domain_struct(domid);
>>> -    if (!domain && get_domain_info(domid, &dominfo))
>>> -        domain = alloc_domain(NULL, domid);
>>> +    if (!domain) {
>>> +        if (!get_domain_info(domid, &dominfo))
>>> +            errno = ENOENT;
>>> +        else
>>> +            domain = alloc_domain(NULL, domid);
>>> +    }
>>
>> I don't understand how this change is related to this commit.
> 
> It is directly related to the hunk below. Returning errno in
> acc_add_dom_nbentry() requires it to be set correctly in
> find_or_alloc_existing_domain().
> 
> I'll add a remark in the commit message.
> 
>>
>> [...]
>>
>>> +int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int 
>>> val,
>>> +            unsigned int domid)
>>> +{
>>> +    struct changed_domain *cd;
>>> +
>>> +    cd = acc_get_changed_domain(ctx, head, domid);
>>> +    if (!cd)
>>> +        return errno;
>>> +
>>> +    cd->nbentry += val;
>>
>> As a future improvement, it would be worth considering to check for 
>> underflow/overflow.
> 
> Do you really think we need to make sure not to add/remove more than
> 2 billion nodes owned by a single domain?
No and that's not my point. If you look at domain_entry_fix() we have an 
assert() to check if the sum is still over 0.

This assert() was actually triggered a few times while testing the 
previous XSAs batch. So I think it would be worth to carry a similar 
check (maybe not an assert()) just in case we mess up with accounting in 
the future.

Cheers,

-- 
Julien Grall

