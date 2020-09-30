Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220FA27E3F6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 10:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.493.1580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXgF-0005Qt-Ik; Wed, 30 Sep 2020 08:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493.1580; Wed, 30 Sep 2020 08:41:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXgF-0005QU-Fd; Wed, 30 Sep 2020 08:41:43 +0000
Received: by outflank-mailman (input) for mailman id 493;
 Wed, 30 Sep 2020 08:41:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNXgD-0005QP-Pw
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:41:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f24b9c6f-2f57-4b51-b76c-593640b66fad;
 Wed, 30 Sep 2020 08:41:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85CE9B2E0;
 Wed, 30 Sep 2020 08:41:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNXgD-0005QP-Pw
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:41:41 +0000
X-Inumbo-ID: f24b9c6f-2f57-4b51-b76c-593640b66fad
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f24b9c6f-2f57-4b51-b76c-593640b66fad;
	Wed, 30 Sep 2020 08:41:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601455300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K6RlJBpbGy9g+6rSsuOsBzSxm+CkzRz7lMr0onfEVqM=;
	b=ZmrZVWxoI4ZC7qilB+a93R0Ya//hy6EnV9a4nv8vIUQxJPnzGgEWjgoM6Zuk/dMDDv7jLR
	nk1o9uAO9N/NI3MIN0cCml5WqMX7z0IaqQSu6/NeSedbnL8+UrTH2vFS9Yf2NWmYbsgtLA
	BWvINUPK6gopLTnfkm4zRK+o3QNL/Lo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 85CE9B2E0;
	Wed, 30 Sep 2020 08:41:39 +0000 (UTC)
Subject: Re: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the
 per-channel lock
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Stefano Stabellini' <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <5b1700a8-7900-9450-1c21-323bcde1fccc@suse.com>
 <004201d696fb$a5bd90b0$f138b210$@xen.org>
 <7b2c9760-63d4-ce3c-b47f-20827f2049fc@suse.com>
 <005f01d69704$c0c11130$42433390$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d2eb462-bd0e-a467-19a9-2bf2d55adcd8@suse.com>
Date: Wed, 30 Sep 2020 10:41:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <005f01d69704$c0c11130$42433390$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 10:36, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 30 September 2020 09:32
>>
>> On 30.09.2020 09:31, Paul Durrant wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 30 September 2020 07:42
>>>>
>>>> On 29.09.2020 18:31, Paul Durrant wrote:
>>>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
>>>>>> Sent: 28 September 2020 11:58
>>>>>>
>>>>>> evtchn_fifo_set_pending() (invoked with the per-channel lock held) has
>>>>>> two uses of the channel's priority field.
>>>>>
>>>>> AFAICT it is invoked with only the sending end's lock held...
>>>>>
>>>>>> The field gets updated by
>>>>>> evtchn_fifo_set_priority() with only the per-domain event_lock held,
>>>>>> i.e. the two reads may observe two different values. While the 2nd use
>>>>>> could - afaict - in principle be replaced by q->priority, I think
>>>>>> evtchn_set_priority() should acquire the per-channel lock in any event.
>>>>>>
>>>>>
>>>>> ... so how is this going to help?
>>>>
>>>> I guess the reasoning needs to change here - it should focus solely
>>>> on using the finer grained lock here (as holding the per-domain one
>>>> doesn't help anyway). It would then be patch 10 which addresses the
>>>> (FIFO-specific) concern of possibly reading inconsistent values.
>>>>
>>>
>>> Yes, it looks like patch #10 should ensure consistency.
>>>
>>> Prior to ad34d0656fc at least the first layer of calls done in evtchn_send() didn't take the evtchn
>> itself as an arg. Of course, evtchn_set_pending() then looked up the evtchn and passed it to
>> evtchn_port_set_pending() without any locking in the interdomain case. I wonder whether, to make
>> reasoning easier, there ought to be a rule that ABI entry points are always called with the evtchn
>> lock held?
>>
>> What do you mean by "ABI entry points" here? To me this would sound
>> like what's directly accessible to guests, but that's hardly what
>> you mean. Do you perhaps mean the hooks in struct evtchn_port_ops?
> 
> Yes, by ABI I mean 'fifo' or '2l'. (I guess that 'ABI' is just the name I chose to refer to them in the Windows PV driver code).
> 
>> As per the comment that got added there recently, the locking
>> unfortunately is less consistent there.
>>
> 
> I looked to me that most functions were entered with channel lock
> held so wondered whether it could be a rule.

Well - especially for the sending paths it may be _a_ per-channel lock,
not _the_ one. While putting together the XSA fixed I had looked some at
the possibility of having a simple rule here, but acquiring _the_ lock
on the interdomain sending path looked to be complicating this path
quite a bit, when it specifically should be as lightweight as possible.

Jan

