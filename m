Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933862CED7A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:52:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44649.80011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9ck-0007Ni-Uw; Fri, 04 Dec 2020 11:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44649.80011; Fri, 04 Dec 2020 11:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9ck-0007NJ-RY; Fri, 04 Dec 2020 11:51:42 +0000
Received: by outflank-mailman (input) for mailman id 44649;
 Fri, 04 Dec 2020 11:51:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kl9ck-0007ND-3I
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:51:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kl9ci-0000Pl-BI; Fri, 04 Dec 2020 11:51:40 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kl9ch-0005D2-UC; Fri, 04 Dec 2020 11:51:40 +0000
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
	bh=1er+zurBPy0ur3esjX4CCRQUfXDV4JwhhAL7uyRCjd8=; b=TmFOgOSJa+vVyCjtOSPeEIdZW3
	zoeuzomOOZ6Aq4NniXE7Ri6UoMfIs00afZSjR0dJVhzz/8Kkv1mDSUaaIXBqKq98/3IN1nEJ27G6E
	6j5tmkuFrDQjeYukmGnRz8oJ4zBepBdJ/WIox4zkPBSMdF1H5iY+ZJ/3UX9KzG4NA4Yo=;
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
From: Julien Grall <julien@xen.org>
Message-ID: <02a2b77f-27a9-b1b6-1acf-1f136cffdf30@xen.org>
Date: Fri, 4 Dec 2020 11:51:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <269f9a2d-7a8d-cba2-801f-6d3b12f9455f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 04/12/2020 11:48, Jan Beulich wrote:
> On 04.12.2020 12:28, Julien Grall wrote:
>> Hi Jan,
>>
>> On 03/12/2020 10:09, Jan Beulich wrote:
>>> On 02.12.2020 22:10, Julien Grall wrote:
>>>> On 23/11/2020 13:30, Jan Beulich wrote:
>>>>> While there don't look to be any problems with this right now, the lock
>>>>> order implications from holding the lock can be very difficult to follow
>>>>> (and may be easy to violate unknowingly). The present callbacks don't
>>>>> (and no such callback should) have any need for the lock to be held.
>>>>>
>>>>> However, vm_event_disable() frees the structures used by respective
>>>>> callbacks and isn't otherwise synchronized with invocations of these
>>>>> callbacks, so maintain a count of in-progress calls, for evtchn_close()
>>>>> to wait to drop to zero before freeing the port (and dropping the lock).
>>>>
>>>> AFAICT, this callback is not the only place where the synchronization is
>>>> missing in the VM event code.
>>>>
>>>> For instance, vm_event_put_request() can also race against
>>>> vm_event_disable().
>>>>
>>>> So shouldn't we handle this issue properly in VM event?
>>>
>>> I suppose that's a question to the VM event folks rather than me?
>>
>> Yes. From my understanding of Tamas's e-mail, they are relying on the
>> monitoring software to do the right thing.
>>
>> I will refrain to comment on this approach. However, given the race is
>> much wider than the event channel, I would recommend to not add more
>> code in the event channel to deal with such problem.
>>
>> Instead, this should be fixed in the VM event code when someone has time
>> to harden the subsystem.
> 
> Are effectively saying I should now undo the addition of the
> refcounting, which was added in response to feedback from you?

Please point out where I made the request to use the refcounting...

I pointed out there was an issue with the VM event code. This was latter 
analysed as a wider issue. The VM event folks doesn't seem to be very 
concerned on the race, so I don't see the reason to try to fix it in the 
event channel code.

Cheers,

-- 
Julien Grall

