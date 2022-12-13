Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1603964B697
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 14:49:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460649.718596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p55dn-0006pC-Fr; Tue, 13 Dec 2022 13:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460649.718596; Tue, 13 Dec 2022 13:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p55dn-0006mb-Bu; Tue, 13 Dec 2022 13:48:15 +0000
Received: by outflank-mailman (input) for mailman id 460649;
 Tue, 13 Dec 2022 13:48:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p55dl-0006mV-SQ
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 13:48:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p55di-0000hr-LO; Tue, 13 Dec 2022 13:48:10 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.2.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p55di-0002Zn-Ex; Tue, 13 Dec 2022 13:48:10 +0000
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
	bh=uOESWWIKmK6bxwYl+Ee6HfcUlH3PQL4zACendaGs7Ro=; b=MWYNQVg1vHOBVxsNx3lNHume+j
	TsHvIzyWowOpK7eq8FRi4jiNg0IpiUw1E1q2lVriXySpEzVLRynCTuUzJN22RlunTIeiJuL6mFz9U
	MbdWr06/PzYExDVzGdAVGHtndr1K3hkK6UU1ZDnsGTHvGQExlqLzf7RiPgWmgPrqQJAM=;
Message-ID: <3911cb46-e691-5539-b2d5-04de1a119329@xen.org>
Date: Tue, 13 Dec 2022 13:48:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] NUMA: replace phys_to_nid()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
 <670b7017-4a6e-fa9e-9d65-65013bd4ad80@suse.com>
 <520abcb0-0edd-bb09-f3a2-bb3d96c569b3@xen.org>
 <76e1edfd-07d8-1d02-788b-bd9e6beb49fd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <76e1edfd-07d8-1d02-788b-bd9e6beb49fd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/12/2022 12:46, Jan Beulich wrote:
> On 13.12.2022 13:06, Julien Grall wrote:
>> On 13/12/2022 11:38, Jan Beulich wrote:
>>> All callers convert frame numbers (perhaps in turn derived from struct
>>> page_info pointers) to an address, just for the function to convert it
>>> back to a frame number (as the first step of paddr_to_pdx()). Replace
>>> the function by mfn_to_nid() plus a page_to_nid() wrapper macro. Replace
>>> call sites by the respectively most suitable one.
>>>
>>> While there also introduce a !NUMA stub, eliminating the need for Arm
>>> (and potentially other ports) to carry one individually.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> At the top of free_heap_pages() mfn_to_nid() could also be used, since
>>> the MFN is calculated immediately ahead. The choice of using
>>> page_to_nid() (for now at least) was with the earlier patch's RFC in
>>> mind, addressing of which may require to make mfn_to_nid() do weaker
>>> checking than page_to_nid().
>>
>> I haven't looked in details at the previous patch. However, I don't like
>> the idea of making mfn_to_nid() do weaker checking because this could
>> easily confuse the reader/developper.
>>
>> If you want to use weaker check, then it would be better if a separate
>> helper is provided with a name reflecting its purpose.
> 
> Well, the purpose then still is the very same conversion, so the name
> is quite appropriate. I don't view mfn_to_nid_bug_dont_look_very_closely()
> (exaggerating) as very sensible a name.

I understand they are both doing the same conversion. But the checks 
will be different. With your proposal, we are now going to say if the 
caller is "buggy" then use mfn_to_nid() if not then you can use any.

I think this is wrong to hide the "bug" just because the name is longer. 
In fact, it means that any non-buggy caller will still have relaxed 
check. The risk if we are going to introduce more "buggy" caller in the 
future.

So from my perspective there are only two acceptable solutions:
   1. Provide a different helper that will be used for just "buggy" 
caller. This will make super clear that the helper should only be used 
in very limited circumstances.
   2. Fix the "buggy" callers.

 From your previous e-mails, it wasn't clear whether 2) is possible. So 
that's leave us only with 1).

>>> --- a/xen/common/numa.c
>>> +++ b/xen/common/numa.c
>>> @@ -671,15 +671,15 @@ static void cf_check dump_numa(unsigned
>>>    
>>>        for_each_online_node ( i )
>>>        {
>>> -        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
>>> +        mfn_t mfn = _mfn(node_start_pfn(i) + 1);
>>>    
>>>            printk("NODE%u start->%lu size->%lu free->%lu\n",
>>>                   i, node_start_pfn(i), node_spanned_pages(i),
>>>                   avail_node_heap_pages(i));
>>> -        /* Sanity check phys_to_nid() */
>>> -        if ( phys_to_nid(pa) != i )
>>> -            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
>>> -                   pa, phys_to_nid(pa), i);
>>> +        /* Sanity check mfn_to_nid() */
>>> +        if ( node_spanned_pages(i) && mfn_to_nid(mfn) != i )
>>
>>
>>   From the commit message, I would have expected that we would only
>> replace phys_to_nid() with either mfn_to_nid() or page_to_nid().
>> However, here you added node_spanned_pages(). Can you explain why?
> 
> Oh, indeed, I meant to say a word on this but then forgot. This
> simply is because the adding of 1 to the start PFN (which by
> itself is imo a little funny) makes it so that the printk()
> inside the conditional would be certain to be called for an
> empty (e.g. CPU-only) node.

Ok. I think this wants to be a separate patch as this sounds like bug 
and we should avoid mixing code conversion with bug fix.

Cheers,

-- 
Julien Grall

