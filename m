Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D0A69F0B6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 09:52:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499279.770359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUkrR-0003XR-Gs; Wed, 22 Feb 2023 08:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499279.770359; Wed, 22 Feb 2023 08:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUkrR-0003VH-DK; Wed, 22 Feb 2023 08:52:25 +0000
Received: by outflank-mailman (input) for mailman id 499279;
 Wed, 22 Feb 2023 08:52:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pUkrQ-0003Th-3o
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 08:52:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUkrP-0004jk-8E; Wed, 22 Feb 2023 08:52:23 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.17.136]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUkrP-0001qR-2i; Wed, 22 Feb 2023 08:52:23 +0000
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
	bh=xJ5HQcprTiac3L/UXci5ULvA395COXHkhHUBx1COmsI=; b=L9xkSgmzkWFZjUGXtcG1wSVS/K
	SoBM6VUjhmRhQi3LdfvEh3toZvoH2QHHBkef+AkVSrKGoy/Sj9q/uM5iANxZpdZfWRGTHReyYLJVB
	qyyy6lqIl/A18IXxkOa/wFVhhTjSbihaU+bsL21nMvJwjDmI5bQwY+0WIZLbLNzXLULY=;
Message-ID: <f73142d0-d550-78e3-6119-a963560d0b12@xen.org>
Date: Wed, 22 Feb 2023 08:52:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
 <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
 <32a517cf-4448-2208-4877-83c7a7531635@suse.com>
 <20151614-96ca-0875-29a0-8099953b7e61@xen.org>
 <e90591bd-1242-0721-242b-5db2565349f8@suse.com>
 <5fc2636e-45b0-e515-d901-18dc5fc214eb@xen.org>
 <28c5c478-b1b6-c8e1-ce9c-287e8afc604a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <28c5c478-b1b6-c8e1-ce9c-287e8afc604a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 22/02/2023 08:36, Juergen Gross wrote:
> On 21.02.23 23:36, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 21/02/2023 08:10, Juergen Gross wrote:
>>> On 20.02.23 19:01, Julien Grall wrote:
>>>> So I have recreated an XTF test which I think match what you wrote [1].
>>>>
>>>> It is indeed failing without your patch. But then there are still 
>>>> some weird behavior here.
>>>>
>>>> I would expect the creation of the node would also fail if instead 
>>>> of removing the node if removed outside of the transaction.
>>>>
>>>> This is not the case because we are looking at the current quota. So 
>>>> shouldn't we snapshot the global count?
>>>
>>> As we don't do a global snapshot of the data base for a transaction 
>>> (this was
>>> changed due to huge memory needs, bad performance, and a higher 
>>> transaction
>>> failure rate), 
>>
>> I am a bit surprised that the only way to do proper transaction is to 
>> have a global snapshot. Instead, you could have an overlay.
> 
> I didn't say that a global snapshot is the only way. And we are using an
> overlay.
> 
>>
>>> I don't think we should snapshot the count either.
>>
>> But that would mean that the quota will change depending on 
>> modification of the global database while the transaction is inflight.
> 
> I really don't see the problem with that. But it seems our views are 
> different
> in this case.

See below.

> 
>> I guess this is not better nor worse that the current situation. But 
>> it is still really confusing for a client because:
>>    1) The error could happen at random point
> 
> Yes, like without a transaction.
> 
>>    2) You may see an inconsistent database as nodes are only cached 
>> when they are first accessed
> 
> It isn't inconsistent at all. The same could happen if such other nodes are
> added/modified/removed just a microsecond before you start the transaction.
> You won't be able to tell the difference. You can only reason about nodes
> being accessed in the transaction, and those are transaction-local.

I am not talking about the case a node is added/modified/removed outside 
of a transaction. I am talking about the in-transaction case. For 
example, let say we have a transaction A that remove node 1, 2 and 
transaction B to access 1, 2 (it may do more).

Now let's imagine the following sequence with the initial state is node 
1 and 2 exists:

  - TA started
  - TA remove 1
  - TA remove 2
  - TA remove 3
  - TB started
  - TB read 1
  - TA ended
  - TB read 2

With the above, one would expect that transaction B can read 2 as 
transaction A didn't commit before B started. But this is not what's 
happening.

My point here is that a protocol could require that if 1 is present then 
2 is. So it would be valid for a client to error out because the other 
side was considered to have misbehaved. However, here this is just how 
Xenstored behave and AFAICT it is undocumented.

Cheers,

-- 
Julien Grall

