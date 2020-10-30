Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2862B2A03D8
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 12:16:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15676.38744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYSNh-0006TK-T0; Fri, 30 Oct 2020 11:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15676.38744; Fri, 30 Oct 2020 11:15:41 +0000
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
	id 1kYSNh-0006Sv-Pb; Fri, 30 Oct 2020 11:15:41 +0000
Received: by outflank-mailman (input) for mailman id 15676;
 Fri, 30 Oct 2020 11:15:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y1I6=EF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kYSNg-0006Sq-En
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 11:15:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56f29214-1a0c-4b54-ae36-6013f6f44126;
 Fri, 30 Oct 2020 11:15:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7776BB0F2;
 Fri, 30 Oct 2020 11:15:38 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=y1I6=EF=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kYSNg-0006Sq-En
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 11:15:40 +0000
X-Inumbo-ID: 56f29214-1a0c-4b54-ae36-6013f6f44126
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 56f29214-1a0c-4b54-ae36-6013f6f44126;
	Fri, 30 Oct 2020 11:15:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604056538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fD3f5AJYmd8ppqRzHwDpJ8bn+jSd9jluVgA9JqTkT9Y=;
	b=BLGpfc0q1KXnjeujxDCK9YkYCyoMgTI3aDpvasmaTUWwUOjcdV3mFNz3DFw1eXf2qEgXuN
	pw6RcfVIpSp+zSgFqTkocnQyBvKjoO+hFBGynpC2ZTvLqbvWb+f5W1rdM9MpCW5lua+OJt
	QzGKdw/Et6jcWQdJE4mZYel4GE8DBhU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7776BB0F2;
	Fri, 30 Oct 2020 11:15:38 +0000 (UTC)
Subject: Re: [PATCH v2 5/8] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <53eb30ca-9b3f-0ef4-bc90-e1c196b716b3@suse.com>
 <20201022160055.nlucvj2bsxolxd5o@Air-de-Roger>
 <dc7de861-a94c-3ef9-8dbd-ee7a5ba293c4@suse.com>
 <dbb776ad-5b0c-c0a7-8f01-66e60fd7fad9@xen.org>
 <2cfcda4c-4115-e057-f401-5103f5b5b8e8@suse.com>
 <08108cd3-530f-3fe9-e1b2-41c7da9f98b7@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <693bb422-ed13-9327-5f22-12bd6f192916@suse.com>
Date: Fri, 30 Oct 2020 12:15:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <08108cd3-530f-3fe9-e1b2-41c7da9f98b7@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.10.20 11:57, Julien Grall wrote:
> 
> 
> On 30/10/2020 10:49, Jan Beulich wrote:
>> On 30.10.2020 11:38, Julien Grall wrote:
>>> On 22/10/2020 17:17, Jan Beulich wrote:
>>>> On 22.10.2020 18:00, Roger Pau Monné wrote:
>>>>> On Tue, Oct 20, 2020 at 04:10:09PM +0200, Jan Beulich wrote:
>>>>>> --- a/xen/include/xen/event.h
>>>>>> +++ b/xen/include/xen/event.h
>>>>>> @@ -177,9 +177,16 @@ int evtchn_reset(struct domain *d, bool
>>>>>>     * Low-level event channel port ops.
>>>>>>     *
>>>>>>     * All hooks have to be called with a lock held which prevents 
>>>>>> the channel
>>>>>> - * from changing state. This may be the domain event lock, the 
>>>>>> per-channel
>>>>>> - * lock, or in the case of sending interdomain events also the 
>>>>>> other side's
>>>>>> - * per-channel lock. Exceptions apply in certain cases for the PV 
>>>>>> shim.
>>>>>> + * from changing state. This may be
>>>>>> + * - the domain event lock,
>>>>>> + * - the per-channel lock,
>>>>>> + * - in the case of sending interdomain events the other side's 
>>>>>> per-channel
>>>>>> + *   lock,
>>>>>> + * - in the case of sending non-global vIRQ-s the per-vCPU 
>>>>>> virq_lock (in
>>>>>> + *   combination with the ordering enforced through how the vCPU's
>>>>>> + *   virq_to_evtchn[] gets updated),
>>>>>> + * - in the case of sending global vIRQ-s vCPU 0's virq_lock.
>>>>>> + * Exceptions apply in certain cases for the PV shim.
>>>>>
>>>>> Having such a wide locking discipline looks dangerous to me, it's easy
>>>>> to get things wrong without notice IMO.
>>>>
>>>> It is effectively only describing how things are (or were before
>>>> XSA-343, getting restored here).
>>>
>>> I agree with Roger here, the new/old locking discipline is dangerous and
>>> it is only a matter of time before it will bite us again.
>>>
>>> I think we should consider Juergen's series because the locking for the
>>> event channel is easier to understand.
>>
>> We should, yes. The one thing I'm a little uneasy with is the
>> new lock "variant" that gets introduced. Custom locking methods
>> also are a common source of problems (which isn't to say I see
>> any here).
> 
> I am also unease with a new lock "variant". However, this is the best 
> proposal I have seen so far to unblock the issue.
> 
> I am open to other suggestion with simple locking discipline.

In theory my new lock variant could easily be replaced by a rwlock and
using the try-variant for the readers only. The disadvantage of that
approach would be a growth of struct evtchn.


Juergen

