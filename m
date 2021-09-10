Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B85406D42
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 16:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184477.333133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOh7z-0000Im-Lv; Fri, 10 Sep 2021 14:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184477.333133; Fri, 10 Sep 2021 14:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOh7z-0000Fc-IL; Fri, 10 Sep 2021 14:03:39 +0000
Received: by outflank-mailman (input) for mailman id 184477;
 Fri, 10 Sep 2021 14:03:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mOh7x-0000FW-TQ
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 14:03:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOh7w-0008LG-Us; Fri, 10 Sep 2021 14:03:36 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOh7w-0000HJ-Oz; Fri, 10 Sep 2021 14:03:36 +0000
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
	bh=CQkUy1jyoCfZBRkpSONeHxayYSAoRhIwcbH7AUT4PdU=; b=tSTo0TZufbsoR6rOHN00vjOIcu
	dL/EDE7S9VUkcc7ibU6l6Y8fcZ5A5sZ2av6yTzks2/dCoC3Cz+65qPTSqoX5eq0zKSlBMxoU4z36t
	wBFAK+nftuw6KVIeHxf0TYoXY+VD60SYRPivuDOmFCGSmjM5mrT/KYAQJysVHxupSYdc=;
Subject: Re: Introduction of stable interface between Xenstore and hypervisor
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7c54683-75d1-ded1-54d6-823dd76db030@suse.com>
 <a192a226-bdfe-6db2-c501-5e5e17c74de0@suse.com>
 <fbb173f8-f8a9-7eef-0e7d-f18dcbb422f3@suse.com>
 <f8c0e296-a942-dd95-6dfc-dc8569386bd9@xen.org>
 <a96ea57e-ab7b-c9ce-02c1-2061a43ee72b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <25e17c13-4774-8523-cc41-1fd9117e5349@xen.org>
Date: Fri, 10 Sep 2021 15:03:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a96ea57e-ab7b-c9ce-02c1-2061a43ee72b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 10/09/2021 14:51, Juergen Gross wrote:
> On 10.09.21 15:49, Julien Grall wrote:
>>
>>
>> On 10/09/2021 14:46, Juergen Gross wrote:
>>> On 10.09.21 15:22, Jan Beulich wrote:
>>>> On 09.09.2021 08:27, Juergen Gross wrote:
>>>>> - Addition of a new stable hypercall ("get domain state") returning 
>>>>> the
>>>>>     following information:
>>>>>     + domid of a domain having the bit set in above bitmap
>>>>>     + state of that domain (existing, dying)
>>>>>     + sequence count of that domain
>>>>>     The related bit is reset in the bitmap as a side effect of the 
>>>>> call.
>>>>
>>>> What I'd like us to consider up front is whether xenstored is going
>>>> to remain only entity interested in this kind of information. The
>>>> entire design looks to leverage that there's only a single consumer
>>>> in the system.
>>>
>>> Right. I'm just writing some RFC patches, and I have coded this
>>> interface to be usable only for the domain having VIRQ_DOM_EXC
>>> registered.
>>>
>>> The alternative (IMO) would have been to expose the domain-state
>>> bitmap to Xenstore (and/or other interested parties).
>>
>> If we do that, let's do in such way that guest_*_bit() helpers are not 
>> necessary because they are a massive hammer on Arm. This means the 
>> bitmap would have to be read-only for the domain.
> 
> I strongly prefer my current approach not needing a shared memory page.

That wasn't a way to say I prefer the shared bitmap. I wanted to point 
out that if this is the chosen approach then we ought to avoid using 
guest_*_bit().

I will be away for the next 4 weeks, so I preferred to mention it now to 
avoid the surprise of having yet another interface using guest_*_bit() 
when I am back :).

Cheers,

-- 
Julien Grall

