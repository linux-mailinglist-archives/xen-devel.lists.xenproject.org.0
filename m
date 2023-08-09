Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F31775600
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 11:00:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580794.909210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTf3N-0003La-C9; Wed, 09 Aug 2023 09:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580794.909210; Wed, 09 Aug 2023 09:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTf3N-0003JV-9K; Wed, 09 Aug 2023 09:00:29 +0000
Received: by outflank-mailman (input) for mailman id 580794;
 Wed, 09 Aug 2023 09:00:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTf3L-0003JF-JJ
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 09:00:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTf3I-0003CE-77; Wed, 09 Aug 2023 09:00:24 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTf3H-0005Jl-UQ; Wed, 09 Aug 2023 09:00:24 +0000
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
	bh=ZpyrlDtSAaBmGeL8uwVxOFxS5efcTJ6IEwKkh8xyLW8=; b=w2Nq+mlzvqECg1iZM9d8ThDA7j
	4PFcoyyySIpCw9g5zsEH0RA+ltJR5eU3Uz2aPGpD5vB+tSmQC9mKpE5bVl3mhk6yZgEbMpuZQhwAd
	vFzRZOQC5kTtC7sQ/PPnKV/WbNMy5x3eh+q+330m1F6e//u7zmlIMM7/XltJr44VVtHY=;
Message-ID: <a0af425e-3e61-43c5-b071-227c7f8437bc@xen.org>
Date: Wed, 9 Aug 2023 10:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/6] capabilities: introduce console io as a domain
 capability
Content-Language: en-GB
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-5-dpsmith@apertussolutions.com>
 <alpine.DEB.2.22.394.2308011757400.2127516@ubuntu-linux-20-04-desktop>
 <14346689-8276-3c26-91e1-59bc2328518e@apertussolutions.com>
 <423f86e7-10ee-134e-7683-e15f7e2c64ed@xen.org>
 <3decc6de-8d82-a862-36a8-9ddcd94fac4f@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3decc6de-8d82-a862-36a8-9ddcd94fac4f@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 08/08/2023 23:31, Daniel P. Smith wrote:
> 
> 
> On 8/3/23 17:24, Julien Grall wrote:
>> Hi Daniel,
>>
>> On 03/08/2023 16:41, Daniel P. Smith wrote:
>>> On 8/1/23 21:01, Stefano Stabellini wrote:
>>>> On Tue, 1 Aug 2023, Daniel P. Smith wrote:
>>>>> patch the field is renamed to capabilities to encapsulate the 
>>>>> capabilities a
>>>>> domain has been granted. The first capability being the ability to 
>>>>> read/write
>>>>> the Xen console.
>>>>>
>>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>>
>>>> Patch looks fine to me aside the two minor nits. I am not sure I
>>>> understand 100% the difference between capabilities and roles but I am
>>>> OK with the patch. I'd like to hear Julien's feedback on this as well.
>>>
>>> This might be worth a section in the hypervisor-guide. As mentioned 
>>> in the cover letter, this was originally proposed as being under XSM. 
>>> A challenge I ran into is that, depending on your view, the 
>>> `is_privileged` field and `hardware_domain` global were either abused 
>>> as a function check and a non-resource privilege check or are just 
>>> multifaceted variables. This is why the concept of the role was 
>>> struck upon, it is more intuitive (for me at least) that have a role 
>>> is something that imparts accesses (privilege checks) and dictates 
>>> hypervisor behaviors when handling the domain (function checks). This 
>>> then brings us to an access or behavior that may be inherent to some 
>>> role(s) but may want to grant on an individually to a guest. A prime 
>>> example of this is console_io, for which it is inherent that the 
>>> hardware domain role will have access but may want to grant to a 
>>> guest without granting it an entire role. This is why I provided for 
>>> identifying these capabilities so that they may be assigned 
>>> individually to a domain.
>>
>> Thanks for the explanation. Just to confirm my understanding, what you 
>> are suggesting is that for a given role, a domain will at least have 
>> the matching capabilities (more could be granted). Is that correct?
>>
>> If so, this wouldn't this mean we can remove d->role and simply use 
>> d->capabilities?
> 
> We could start out with CAP_CTRL and CAP_HW, but it is a little 
> illogical. For instance, control domain has many capabilities, they just 
> have never been fully broken out. XSM did some, but the focus there was 
> just on system resources. Similar with the hardware domain. You are 
> right that it would better deal with the limited number of bits 
> currently available.
> 
>>>
>>> While the role/capability is a natural progression from how the 
>>> hypervisor currently operates. Another approach that could be 
>>> consider to deliver a similar experience would be to break down every 
>>> access and function into a capability and then define the standard 
>>> roles as a conglomeration of certain capabilities.
>>
>> At least from the explanation above, I think it would make sense to 
>> break down role to multiple capabilities.
> 
> Would it be acceptable to do this incrementally over time as we are able 
> to determine what needs to be broken out as a distinct capability?

I would be fine with that. Note that some care will be needed for the 
Device-Tree to either version the capabilities or at least not break 
boot when using an old DT on a new Xen.

Cheers,

-- 
Julien Grall

