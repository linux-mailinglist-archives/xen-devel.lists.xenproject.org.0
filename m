Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 183CB2D149E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:28:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46715.82822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIQs-0002Sg-K8; Mon, 07 Dec 2020 15:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46715.82822; Mon, 07 Dec 2020 15:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIQs-0002Re-F8; Mon, 07 Dec 2020 15:28:10 +0000
Received: by outflank-mailman (input) for mailman id 46715;
 Mon, 07 Dec 2020 15:28:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmIQq-0002QU-Fn
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:28:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e031b65-33ee-4af9-a51f-591451357b0d;
 Mon, 07 Dec 2020 15:28:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6861ABE9;
 Mon,  7 Dec 2020 15:28:06 +0000 (UTC)
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
X-Inumbo-ID: 1e031b65-33ee-4af9-a51f-591451357b0d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607354886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjN23h87VAmxj756ADXTtOqjPfVg45T7K9PwtwT1L+o=;
	b=WGYAfZnaY0j9dFXHlj3mNNmo4uGG5MytVOBM7BtHleS13j+HQOsNr7KH7cO18LXveGoKlY
	9aMTaK3EQK7gc+7qPbqnrHodlas8Bi7B6Vfwm7VATrZGiqrJl3dvyp9wxxsIg6PxSoev/9
	PfE6Q9ih+/IvCjLHkhGP2i/laqny9+Y=
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <lengyelt@ainfosec.com>,
 Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com>
 <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
 <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com>
 <1a8250f5-ea49-ac3a-e992-be7ec40deba9@xen.org>
 <CABfawhkQcUD4f62zpg0cyrdQgG82XtpYRZZ_-50hjagooT530A@mail.gmail.com>
 <5862eb24-d894-455a-13ac-61af54f949e7@xen.org>
 <CABfawhkWQiOhLL8f3NzoWbeuag-f+YOOK0i_LJzZq5Yvoh=oHQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fd384990-376e-40f4-f0b8-1a889b3a0c51@suse.com>
Date: Mon, 7 Dec 2020 16:28:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CABfawhkWQiOhLL8f3NzoWbeuag-f+YOOK0i_LJzZq5Yvoh=oHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.12.2020 20:15, Tamas K Lengyel wrote:
> On Fri, Dec 4, 2020 at 10:29 AM Julien Grall <julien@xen.org> wrote:
>> On 04/12/2020 15:21, Tamas K Lengyel wrote:
>>> On Fri, Dec 4, 2020 at 6:29 AM Julien Grall <julien@xen.org> wrote:
>>>> On 03/12/2020 10:09, Jan Beulich wrote:
>>>>> On 02.12.2020 22:10, Julien Grall wrote:
>>>>>> On 23/11/2020 13:30, Jan Beulich wrote:
>>>>>>> While there don't look to be any problems with this right now, the lock
>>>>>>> order implications from holding the lock can be very difficult to follow
>>>>>>> (and may be easy to violate unknowingly). The present callbacks don't
>>>>>>> (and no such callback should) have any need for the lock to be held.
>>>>>>>
>>>>>>> However, vm_event_disable() frees the structures used by respective
>>>>>>> callbacks and isn't otherwise synchronized with invocations of these
>>>>>>> callbacks, so maintain a count of in-progress calls, for evtchn_close()
>>>>>>> to wait to drop to zero before freeing the port (and dropping the lock).
>>>>>>
>>>>>> AFAICT, this callback is not the only place where the synchronization is
>>>>>> missing in the VM event code.
>>>>>>
>>>>>> For instance, vm_event_put_request() can also race against
>>>>>> vm_event_disable().
>>>>>>
>>>>>> So shouldn't we handle this issue properly in VM event?
>>>>>
>>>>> I suppose that's a question to the VM event folks rather than me?
>>>>
>>>> Yes. From my understanding of Tamas's e-mail, they are relying on the
>>>> monitoring software to do the right thing.
>>>>
>>>> I will refrain to comment on this approach. However, given the race is
>>>> much wider than the event channel, I would recommend to not add more
>>>> code in the event channel to deal with such problem.
>>>>
>>>> Instead, this should be fixed in the VM event code when someone has time
>>>> to harden the subsystem.
>>>
>>> I double-checked and the disable route is actually more robust, we
>>> don't just rely on the toolstack doing the right thing. The domain
>>> gets paused before any calls to vm_event_disable. So I don't think
>>> there is really a race-condition here.
>>
>> The code will *only* pause the monitored domain. I can see two issues:
>>     1) The toolstack is still sending event while destroy is happening.
>> This is the race discussed here.
>>     2) The implement of vm_event_put_request() suggests that it can be
>> called with not-current domain.
>>
>> I don't see how just pausing the monitored domain is enough here.
> 
> Requests only get generated by the monitored domain. So if the domain
> is not running you won't get more of them. The toolstack can only send
> replies.

Julien,

does this change your view on the refcounting added by the patch
at the root of this sub-thread?

Jan

