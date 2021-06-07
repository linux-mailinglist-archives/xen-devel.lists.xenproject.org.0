Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8CC39E642
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 20:13:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138128.255784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqJk5-0002Tp-TM; Mon, 07 Jun 2021 18:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138128.255784; Mon, 07 Jun 2021 18:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqJk5-0002Rr-QK; Mon, 07 Jun 2021 18:12:53 +0000
Received: by outflank-mailman (input) for mailman id 138128;
 Mon, 07 Jun 2021 18:12:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lqJk4-0002Rl-2N
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 18:12:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lqJk3-0006BL-0H; Mon, 07 Jun 2021 18:12:51 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lqJk2-0002aI-QQ; Mon, 07 Jun 2021 18:12:50 +0000
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
	bh=4kloaPrlNBIxK3w/O7f0xVZinn0chaMi3g+JATOnGic=; b=c5cTD50YUkLB81y533t8xyHfIf
	5ddPrVqWqJwhwhuYoRwTdKQeTBTzwTa7OSCOlCFowgpjcc4q24oMLOSogJAw3sK/TPuSv+uVz1odn
	SXo4HxJ7Y+3CLQfnI2w43oJNfbKc6/x1nqhoIKDevYJ83uEIC4l4qQmLorMSWTBMjpHc=;
Subject: Re: [PATCH v2 07/12] mm: allow page scrubbing routine(s) to be arch
 controlled
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <49c46d4d-4eaa-16a8-ccc8-c873b0b1d092@suse.com>
 <b1c10ad9-2cef-031d-39c2-8d2013b3e0b5@xen.org>
 <e805e525-f024-8b5f-3814-0c1346a227f8@suse.com>
 <ccdc7909-9ef2-470e-fefd-bc6523fcdf73@xen.org>
 <403746c0-1b36-f782-3f71-2a1cd129aa6e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7e5a09ba-3b47-4d8a-0bcf-a3933e049df1@xen.org>
Date: Mon, 7 Jun 2021 19:12:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <403746c0-1b36-f782-3f71-2a1cd129aa6e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/06/2021 14:23, Jan Beulich wrote:
> On 03.06.2021 11:39, Julien Grall wrote:
>> On 27/05/2021 14:58, Jan Beulich wrote:
>>> On 27.05.2021 15:06, Julien Grall wrote:
>>>> On 27/05/2021 13:33, Jan Beulich wrote:
>>>>> @@ -1046,12 +1051,14 @@ static struct page_info *alloc_heap_page
>>>>>         if ( first_dirty != INVALID_DIRTY_IDX ||
>>>>>              (scrub_debug && !(memflags & MEMF_no_scrub)) )
>>>>>         {
>>>>> +        bool cold = d && d != current->domain;
>>>>
>>>> So the assumption is if the domain is not running, then the content is
>>>> not in the cache. Is that correct?
>>>
>>> Not exactly: For one, instead of "not running" it is "is not the current
>>> domain", i.e. there may still be vCPU-s of the domain running elsewhere.
>>> And for the cache the question isn't so much of "is in cache", but to
>>> avoid needlessly bringing contents into the cache when the data is
>>> unlikely to be used again soon.
>>
>> Ok. Can this be clarified in the commit message?
> 
> I had updated it already the other day to
> 
> "Especially when dealing with large amounts of memory, memset() may not
>   be very efficient; this can be bad enough that even for debug builds a
>   custom function is warranted. We additionally want to distinguish "hot"
>   and "cold" cases (with, as initial heuristic, "hot" being for any
>   allocations a domain does for itself, assuming that in all other cases
>   the page wouldn't be accessed [again] soon). The goal is for accesses
>   of "cold" pages to not disturb caches (albeit finding a good balance
>   between this and the higher latency looks to be difficult)."
> 
> Is this good enough?

Yes. Thank you for proposing an update to the commit message!

Cheers,

-- 
Julien Grall

