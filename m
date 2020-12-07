Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5812D1773
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 18:23:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46864.83040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKDg-0008L7-HX; Mon, 07 Dec 2020 17:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46864.83040; Mon, 07 Dec 2020 17:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKDg-0008Ki-EG; Mon, 07 Dec 2020 17:22:40 +0000
Received: by outflank-mailman (input) for mailman id 46864;
 Mon, 07 Dec 2020 17:22:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kmKDf-0008KZ-0n
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 17:22:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmKDc-0006KD-L3; Mon, 07 Dec 2020 17:22:36 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmKDc-0003yK-Aj; Mon, 07 Dec 2020 17:22:36 +0000
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
	bh=pZn28BFSU+9QlmOhqKIMuQNIB92uM9LdjTAh4FV+EuI=; b=JsM9ELQtljR6yGWPURl6bfk1IC
	7RyI6yInKzbJcGOlIFeYdw+fjF6TRY1y7Ybf2PMonHXsuuwa9ZEhRYaq+mSD4QDmK7vjDbXscuggt
	ircvSrW80GYI3+gSBCCIJQScVRg+60heFtk5N+rpMsHSDEXe3H+rk2h2e/cRgq7fWG5U=;
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <lengyelt@ainfosec.com>,
 Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com>
 <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
 <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com>
 <1a8250f5-ea49-ac3a-e992-be7ec40deba9@xen.org>
 <269f9a2d-7a8d-cba2-801f-6d3b12f9455f@suse.com>
 <02a2b77f-27a9-b1b6-1acf-1f136cffdf30@xen.org>
 <48395363-ea47-9139-011e-233d92581a71@suse.com>
 <2edfc711-d8d9-4854-94a2-2d9e4d9902ec@xen.org>
 <381cbc5b-29e8-d84d-0b7c-e84de82bc1a4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <90ace303-b0a9-7d83-098d-ec01c3b308ad@xen.org>
Date: Mon, 7 Dec 2020 17:22:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <381cbc5b-29e8-d84d-0b7c-e84de82bc1a4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 07/12/2020 08:02, Jan Beulich wrote:
> On 04.12.2020 16:09, Julien Grall wrote:
>> On 04/12/2020 12:01, Jan Beulich wrote:
>>> On 04.12.2020 12:51, Julien Grall wrote:
>>>> On 04/12/2020 11:48, Jan Beulich wrote:
>>>>> On 04.12.2020 12:28, Julien Grall wrote:
>>>>>> On 03/12/2020 10:09, Jan Beulich wrote:
>>>>>>> On 02.12.2020 22:10, Julien Grall wrote:
>>>>>>>> So shouldn't we handle this issue properly in VM event?
>>>>>>>
>>>>>>> I suppose that's a question to the VM event folks rather than me?
>>>>>>
>>>>>> Yes. From my understanding of Tamas's e-mail, they are relying on the
>>>>>> monitoring software to do the right thing.
>>>>>>
>>>>>> I will refrain to comment on this approach. However, given the race is
>>>>>> much wider than the event channel, I would recommend to not add more
>>>>>> code in the event channel to deal with such problem.
>>>>>>
>>>>>> Instead, this should be fixed in the VM event code when someone has time
>>>>>> to harden the subsystem.
>>>>>
>>>>> Are effectively saying I should now undo the addition of the
>>>>> refcounting, which was added in response to feedback from you?
>>>>
>>>> Please point out where I made the request to use the refcounting...
>>>
>>> You didn't ask for this directly, sure, but ...
>>>
>>>> I pointed out there was an issue with the VM event code.
>>>
>>> ... this has ultimately led to the decision to use refcounting
>>> (iirc there was one alternative that I had proposed, besides
>>> the option of doing nothing).
>>
>> One other option that was discussed (maybe only on security@xen.org) is
>> to move the spinlock outside of the structure so it is always allocated.
> 
> Oh, right - forgot about that one, because that's nothing I would
> ever have taken on actually carrying out.
> 
>>>> This was latter
>>>> analysed as a wider issue. The VM event folks doesn't seem to be very
>>>> concerned on the race, so I don't see the reason to try to fix it in the
>>>> event channel code.
>>>
>>> And you won't need the refcount for vpl011 then?
>>
>> I don't believe we need it for the vpl011 as the spin lock protecting
>> the code should always be allocated. The problem today is the lock is
>> initialized too late.
>>
>>> I can certainly
>>> drop it again, but it feels odd to go back to an earlier version
>>> under the circumstances ...
>>
>> The code introduced doesn't look necessary outside of the VM event code.
>> So I think it would be wrong to merge it if it is just papering over a
>> bigger problem.
> 
> So to translate this to a clear course of action: You want me to
> go back to the earlier version by dropping the refcounting again?

Yes.

> (I don't view this as "papering over" btw, but a tiny step towards
> a solution.)

This is implying that the refcounting is part of the actual solution. I 
think you can solve it directly in the VM event code without touching 
the event channel code.

Furthermore, I see no point to add code in the common code if the 
maintainers of the affected subsystem think there code is safe (I don't 
believe it is).

Cheers,

-- 
Julien Grall

