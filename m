Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC9E401C54
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179912.326354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEkc-00080Y-VV; Mon, 06 Sep 2021 13:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179912.326354; Mon, 06 Sep 2021 13:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEkc-0007yE-SS; Mon, 06 Sep 2021 13:33:30 +0000
Received: by outflank-mailman (input) for mailman id 179912;
 Mon, 06 Sep 2021 13:33:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNEkc-0007y8-1C
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:33:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNEka-0004oI-Is; Mon, 06 Sep 2021 13:33:28 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNEka-00057U-CS; Mon, 06 Sep 2021 13:33:28 +0000
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
	bh=APik1CbMbgF6wJTSvB432A/CGZAYI0LBfC+hISwtP1Y=; b=63RDQMgBCf/ln7NWRC2xpZ64S2
	KlkhERBFLjEhXiRn5exhoxEEX8ugn8IPls5vlAQxiNgdmUzMQi+aAwsFy8vcvksAtu+6QOpPgbzdC
	31yt9Kr4ens/sAyQGPVSjIsZdaRtCyg+veQ5X6JdM68OI9loOmzCh3PCGTkOJfcr7chY=;
Subject: Re: [PATCH 1/9] gnttab: defer allocation of maptrack frames table
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <062bcbd3-420e-e1c0-3aa0-0dfb229e6ae9@suse.com>
 <7b8fba1a-767e-87f8-d0eb-5af5e5427bb4@xen.org>
 <60acd486-1641-6db4-4451-247edcc11522@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <26669864-09e2-a026-67f6-1f6dc48267db@xen.org>
Date: Mon, 6 Sep 2021 14:33:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <60acd486-1641-6db4-4451-247edcc11522@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/09/2021 14:29, Jan Beulich wrote:
> On 06.09.2021 15:13, Julien Grall wrote:
>> On 26/08/2021 11:09, Jan Beulich wrote:
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -633,6 +633,34 @@ get_maptrack_handle(
>>>        if ( likely(handle != INVALID_MAPTRACK_HANDLE) )
>>>            return handle;
>>>    
>>> +    if ( unlikely(!read_atomic(&lgt->maptrack)) )
>>> +    {
>>> +        struct grant_mapping **maptrack = NULL;
>>> +
>>> +        if ( lgt->max_maptrack_frames )
>>> +            maptrack = vzalloc(lgt->max_maptrack_frames * sizeof(*maptrack));
>>
>> While I understand that allocating with a lock is bad idea, I don't like
>> the fact that multiple vCPUs racing each other would result to
>> temporarily allocate more memory.
>>
>> If moving the call within the lock is not a solution, would using a loop
>> with a cmpxchg() a solution to block the other vCPU?
> 
> As with any such loop the question then is for how long to retry. No matter
> what (static) loop bound you choose, if you exceed it you would return an
> error to the caller for no reason.

I was thinking to have an unbound loop. This would be no better no worth 
than the current implementation because of the existing lock.

> 
> As to the value to store by cmpxchg() - were you thinking of some "alloc in
> progress" marker?

Yes.

> You obviously can't store the result of the allocation
> before actually doing the allocation, yet it is unnecessary allocations
> that you want to avoid (i.e. to achieve your goal the allocation would need
> to come after the cmpxchg()). A marker would further complicate the other
> code here, even if (maybe) just slightly ...

Right, the code will be a bit more complicated (although it would not be 
that bad if moved in a separate function...) but I feel it is better 
than the multiple vzalloc().

Cheers,

-- 
Julien Grall

