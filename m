Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B74529E07
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 11:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330705.554089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqtVe-0004qn-PT; Tue, 17 May 2022 09:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330705.554089; Tue, 17 May 2022 09:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqtVe-0004o1-Ln; Tue, 17 May 2022 09:28:54 +0000
Received: by outflank-mailman (input) for mailman id 330705;
 Tue, 17 May 2022 09:28:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqtVd-0004nv-3B
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 09:28:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqtVc-0007Pw-KF; Tue, 17 May 2022 09:28:52 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.95.147.55])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqtVc-0004of-Dz; Tue, 17 May 2022 09:28:52 +0000
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
	bh=ISx1RozKUre99XMm5HKBkqDpV3Tc2zcGV/k2qw3prZY=; b=euRuilHGevu4j/FDLZcgzaZpC3
	zoShuLLMag/s2t8sqoYmQtqiuq7XWTVzclgO34O/9G9g0cyV/HpTGi7/+ck+q1g1CbC85z27CQXcn
	UFVW9Xt92LLIJG0Gt/wW4mrvoyIF26sG56xYzR6vvWY/cEVE+mw6kcxrfLfPKLDfCchM=;
Message-ID: <511fd0cb-348f-b65d-cb7b-effd822c7f20@xen.org>
Date: Tue, 17 May 2022 10:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 1/6] xen: do not free reserved memory into heap
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-2-Penny.Zheng@arm.com>
 <2ebda9bb-8045-56ec-619b-d0178d57ee17@xen.org>
 <DU2PR08MB73255BBF708979822747FF2DF7CE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB73255BBF708979822747FF2DF7CE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/05/2022 09:21, Penny Zheng wrote:
> Yes,  I remembered that asynchronous is still on the to-do list for static memory.
> 
> If it doesn't bother too much to you, I would like to ask some help on this issue, ;).
> I only knew basic knowledge on the scrubbing, 
My kwnoledge on the scrubbing code is not much better than yours :).

> I knew that dirty pages is placed at the
> end of list heap(node, zone, order) for scrubbing and "first_dirty" is used to track down
> the dirty pages. IMO, Both two parts are restricted to the heap thingy,  not reusable for
> static memory, 

That's correct.

> so maybe I need to re-write scrub_free_page for static memory, and also
> link the need-to-scrub reserved pages to a new global list e.g.  dirty_resv_list for aync
> scrubbing?

So I can foresee two problems with scrubbing static memory:
   1) Once the page is scrubbed, we need to know which domain it belongs 
so we can link the page again
   2) A page may still wait for scrubbing when the domain allocate 
memory (IOW the reserved list may be empty). So we need to find a page 
belonging to the domain and then scrubbed.

The two problems above would indicate that a per-domain scrub list would 
be the best here. We would need to deal with initial scrubbing 
differently (maybe a global list as you suggested).

I expect it will take some times to implement it properly. While writing 
this, I was wondering if there is actually any point to scrub pages when 
the domain is releasing them. Even if they are free they are still 
belonging to the domain, so scrubbing them is technically not necessary.

Any thoughts?

>>>    {
>>>        mfn_t mfn = page_to_mfn(pg);
>>>        unsigned long i;
>>> @@ -2653,7 +2657,8 @@ void __init free_staticmem_pages(struct page_info
>> *pg, unsigned long nr_mfns,
>>>            }
>>>
>>>            /* In case initializing page of static memory, mark it PGC_reserved. */
>>> -        pg[i].count_info |= PGC_reserved;
>>> +        if ( !(pg[i].count_info & PGC_reserved) )
>>
>> NIT: I understand the flag may have already been set, but I am not convinced if
>> it is worth checking it and then set.
>>
> 
> Jan suggested that since we remove the __init from free_staticmem_pages, it's now in preemptable
> state at runtime, so better be adding this check here.

Well, count_info is already modified within that loop (see 
mark_page_free()). So I think the impact of setting PGC_reserved is 
going to be meaningless.

However... mark_page_free() is going to set count_info to PGC_state_free 
and by consequence clear PGC_reserved. Theferore, in the current 
implementation we always need to re-set PGC_reserved.

So effectively, the "if" is pointless here.

Cheers,

-- 
Julien Grall

