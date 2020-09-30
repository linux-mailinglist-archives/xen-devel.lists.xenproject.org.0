Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6822E27E3CA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 10:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.478.1496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXWW-0003n5-Q8; Wed, 30 Sep 2020 08:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478.1496; Wed, 30 Sep 2020 08:31:40 +0000
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
	id 1kNXWW-0003mi-Mv; Wed, 30 Sep 2020 08:31:40 +0000
Received: by outflank-mailman (input) for mailman id 478;
 Wed, 30 Sep 2020 08:31:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNXWW-0003mc-5e
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:31:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec55021b-d95e-45fe-b563-c2667067b847;
 Wed, 30 Sep 2020 08:31:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 014DBACC6;
 Wed, 30 Sep 2020 08:31:38 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNXWW-0003mc-5e
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:31:40 +0000
X-Inumbo-ID: ec55021b-d95e-45fe-b563-c2667067b847
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ec55021b-d95e-45fe-b563-c2667067b847;
	Wed, 30 Sep 2020 08:31:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601454698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jJJ3hfQhRvfOKxh1KTUthxxiNtZBRbBa5xJ/hSy3mQ=;
	b=nCbocpk9yAN209pcagC69UBZHYyHVGZktAO82Jw68JI9aCPPJmF57/jPzBNAc24OiUEWI+
	IHl3WdNYFDt/VKBcGjrYnf7Ja2k7trjAIje+rITGRLTHecqcxXHFWb3AbUqsGtrrD+W0K1
	GpdsbOLjqgh3g3EGQ0iQmRcy6N9Bi4s=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 014DBACC6;
	Wed, 30 Sep 2020 08:31:38 +0000 (UTC)
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7b2c9760-63d4-ce3c-b47f-20827f2049fc@suse.com>
Date: Wed, 30 Sep 2020 10:31:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <004201d696fb$a5bd90b0$f138b210$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 09:31, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 30 September 2020 07:42
>> To: paul@xen.org
>> Cc: xen-devel@lists.xenproject.org; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap'
>> <George.Dunlap@eu.citrix.com>; 'Ian Jackson' <iwj@xenproject.org>; 'Julien Grall' <julien@xen.org>;
>> 'Wei Liu' <wl@xen.org>; 'Stefano Stabellini' <sstabellini@kernel.org>
>> Subject: Re: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the per-channel lock
>>
>> On 29.09.2020 18:31, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
>>>> Sent: 28 September 2020 11:58
>>>> To: xen-devel@lists.xenproject.org
>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
>>>> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano
>> Stabellini
>>>> <sstabellini@kernel.org>
>>>> Subject: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the per-channel lock
>>>>
>>>> evtchn_fifo_set_pending() (invoked with the per-channel lock held) has
>>>> two uses of the channel's priority field.
>>>
>>> AFAICT it is invoked with only the sending end's lock held...
>>>
>>>> The field gets updated by
>>>> evtchn_fifo_set_priority() with only the per-domain event_lock held,
>>>> i.e. the two reads may observe two different values. While the 2nd use
>>>> could - afaict - in principle be replaced by q->priority, I think
>>>> evtchn_set_priority() should acquire the per-channel lock in any event.
>>>>
>>>
>>> ... so how is this going to help?
>>
>> I guess the reasoning needs to change here - it should focus solely
>> on using the finer grained lock here (as holding the per-domain one
>> doesn't help anyway). It would then be patch 10 which addresses the
>> (FIFO-specific) concern of possibly reading inconsistent values.
>>
> 
> Yes, it looks like patch #10 should ensure consistency.
> 
> Prior to ad34d0656fc at least the first layer of calls done in evtchn_send() didn't take the evtchn itself as an arg. Of course, evtchn_set_pending() then looked up the evtchn and passed it to evtchn_port_set_pending() without any locking in the interdomain case. I wonder whether, to make reasoning easier, there ought to be a rule that ABI entry points are always called with the evtchn lock held?

What do you mean by "ABI entry points" here? To me this would sound
like what's directly accessible to guests, but that's hardly what
you mean. Do you perhaps mean the hooks in struct evtchn_port_ops?
As per the comment that got added there recently, the locking
unfortunately is less consistent there.

Jan

