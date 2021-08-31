Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1B3FC745
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 14:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175651.319900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL2uE-0006aH-RP; Tue, 31 Aug 2021 12:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175651.319900; Tue, 31 Aug 2021 12:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL2uE-0006YH-Nu; Tue, 31 Aug 2021 12:30:22 +0000
Received: by outflank-mailman (input) for mailman id 175651;
 Tue, 31 Aug 2021 12:30:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mL2uD-0006YB-Jf
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 12:30:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mL2uC-0005W0-BU; Tue, 31 Aug 2021 12:30:20 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mL2uC-0002ji-52; Tue, 31 Aug 2021 12:30:20 +0000
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
	bh=PivWykOJJJsuu+hCcF3sLO5j2kRFAoB7VaiJJ90v7fA=; b=SCiN8TUIFdH/7DjbUozTE/Iwa5
	NxBmk2SPuQJPspJV+ysnk87ASKnVR/dH/9phPEZz4QwrJRjnKGSK0UIXmMuLo9/6DKA0JfsB2cJuM
	Py9o2/unr0MKhXoSxCjHfYUFQI1zKxDX2Kvg026r0V5rc7Hu2jrpCC4u5XdcvZoCjlVQ=;
Subject: Re: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
To: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20210730122643.2043-1-jgross@suse.com>
 <20210730122643.2043-3-jgross@suse.com>
 <24836.28.655841.510063@mariner.uk.xensource.com>
 <81a39ab5-5588-65ad-f1a1-7bfe0379b394@xen.org>
 <6ced9858-d425-887c-0045-1aad8521b826@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c0a6bb5a-3bd8-b1cf-9973-7a95b347befc@xen.org>
Date: Tue, 31 Aug 2021 13:30:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6ced9858-d425-887c-0045-1aad8521b826@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 31/08/2021 13:11, Juergen Gross wrote:
> On 30.07.21 19:14, Julien Grall wrote:
>> Hi Ian,
>>
>> On 30/07/2021 14:35, Ian Jackson wrote:
>>> Juergen Gross writes ("[PATCH v3 2/2] tools/xenstore: set open file 
>>> descriptor limit for xenstored"):
>>>> Add a configuration item for the maximum number of domains xenstored
>>>> should support and set the limit of open file descriptors accordingly.
>>>>
>>>> For HVM domains there are up to 5 socket connections per domain (2 by
>>>> the xl daemon process, and 3 by qemu). So set the ulimit for xenstored
>>>> to 5 * XENSTORED_MAX_DOMAINS + 100 (the "+ 100" is for some headroom,
>>>> like logging, event channel device, etc.).
>>> ...
>>>> +## Type: integer
>>>> +## Default: 32768
>>>> +#
>>>> +# Select maximum number of domains supported by xenstored.
>>>> +# Only evaluated if XENSTORETYPE is "daemon".
>>>> +#XENSTORED_MAX_N_DOMAINS=32768
>>>
>>> I approve of doing something about the fd limit.  I have some qualms
>>> about the documentation.
>>>
>>> The documentation doesn't say what happens if this limit is exceeded.
>>> Also the default of 32758 suggests that we actually support that many
>>> domains.  I don't think we do...
>>>
>>> I didn't find anything in SUPPORT.md about how many guests we support
>>> but I wouldn't want this setting here to imply full support for 32768
>>> domains.
>>>
>>> If you don't want to tackle this can of works, maybe add this:
>>>
>>>    # This just controls some resource limits for xenstored; if the
>>>    # limit is exceeded, xenstored will stop being able to function
>>>    # properly for additional guests.  The default value is so large
>>>    # that it won't be exceeded in a supported configuration, but
>>>    # should not be taken to mean that the whole Xen system is
>>>    # guaranteed to work properly with that many guests.
>>>
>>> Julien, did you ask for this to be made configurable ?  Having written
>>> the text above, I wonder if it wouldn't just be better to
>>> unconditionally set it to "unlimited" rather than offering footgun
>>> dressed up like a tuneable...
>>
>> So in v1 (see [1]), Juergen wanted to raise the limit. I assumed this 
>> meant that the default limit (configured by the system may not be 
>> enough).
>>
>> I felt this was wrong to impose an higher limit on everyone when an 
>> admin may know the maximum number of domains.
>>
>> By "unlimited", do you mean the calling "ulimit" (or whatever is used 
>> for configuring FDs) with unlimited?
>>
>> If so, I would be OK with that. My main was was to move the raising 
>> the limit outside Xenstored because:
>>   1) This is easier for an admin to tweak it (in particular the OOM)
>>   2) It feels wrong to me that the daemon chose the limits
>>   3) An admin can enforce it
> 
> Coming back to this series, I'm puzzled now.
> 
> Julien, you didn't want me to raise the limit to a specific number
> covering the maximum possible number of domains, because you thought
> this might result in xenstored hogging huge numbers of file descriptors
> in case of a bug. Why is unlimited better then? This will make the
> possible number even larger.

I don't think I suggested the unlimited number is better... My main 
objection in your original approach is you set an arbitrary limit you in 
Xenstored (which may not apply at all) and don't offer a way to the 
admin to tweak it.

If the limit is set outside of Xenstored, then it becomes much easier 
for someone to just tweak the init script. I don't have a strong opinion 
on whether the default limit should be "unlimited" or a fixed number.

Cheers,

-- 
Julien Grall

