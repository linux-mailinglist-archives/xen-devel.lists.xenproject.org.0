Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16662A04D6
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 12:56:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15714.38800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYT0A-0001ug-W8; Fri, 30 Oct 2020 11:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15714.38800; Fri, 30 Oct 2020 11:55:26 +0000
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
	id 1kYT0A-0001uH-Se; Fri, 30 Oct 2020 11:55:26 +0000
Received: by outflank-mailman (input) for mailman id 15714;
 Fri, 30 Oct 2020 11:55:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYT08-0001u7-TQ
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 11:55:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e19e9d48-e24c-4f41-8803-612f4a50ca6b;
 Fri, 30 Oct 2020 11:55:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0C49AC65;
 Fri, 30 Oct 2020 11:55:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYT08-0001u7-TQ
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 11:55:24 +0000
X-Inumbo-ID: e19e9d48-e24c-4f41-8803-612f4a50ca6b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e19e9d48-e24c-4f41-8803-612f4a50ca6b;
	Fri, 30 Oct 2020 11:55:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604058923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PVYKfbprZc9tQbMTNw+ObjaU0eW6IiywFqtHh4qY80I=;
	b=EHQARCdBo5+9wHj2fq95QYQqzowbZ4n07d2IjH+1QbAO1HL9TYTmAcuNwZ5whVfekpFMBq
	gtr6Cj4cvmt0WIE7BSISAIWOx/Xvu1H5YeMH9ucA/IdhhEB155yPz12hCK2t1zoEunB1YX
	u38D9jFqCL0kH10Y9SGm705MQt0Re/w=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F0C49AC65;
	Fri, 30 Oct 2020 11:55:22 +0000 (UTC)
Subject: Re: [PATCH v2 5/8] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <53eb30ca-9b3f-0ef4-bc90-e1c196b716b3@suse.com>
 <20201022160055.nlucvj2bsxolxd5o@Air-de-Roger>
 <dc7de861-a94c-3ef9-8dbd-ee7a5ba293c4@suse.com>
 <dbb776ad-5b0c-c0a7-8f01-66e60fd7fad9@xen.org>
 <2cfcda4c-4115-e057-f401-5103f5b5b8e8@suse.com>
 <08108cd3-530f-3fe9-e1b2-41c7da9f98b7@xen.org>
 <693bb422-ed13-9327-5f22-12bd6f192916@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <46d5f9cf-c01d-c0c2-777a-c97736633120@suse.com>
Date: Fri, 30 Oct 2020 12:55:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <693bb422-ed13-9327-5f22-12bd6f192916@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.10.2020 12:15, Jürgen Groß wrote:
> On 30.10.20 11:57, Julien Grall wrote:
>>
>>
>> On 30/10/2020 10:49, Jan Beulich wrote:
>>> On 30.10.2020 11:38, Julien Grall wrote:
>>>> On 22/10/2020 17:17, Jan Beulich wrote:
>>>>> On 22.10.2020 18:00, Roger Pau Monné wrote:
>>>>>> On Tue, Oct 20, 2020 at 04:10:09PM +0200, Jan Beulich wrote:
>>>>>>> --- a/xen/include/xen/event.h
>>>>>>> +++ b/xen/include/xen/event.h
>>>>>>> @@ -177,9 +177,16 @@ int evtchn_reset(struct domain *d, bool
>>>>>>>     * Low-level event channel port ops.
>>>>>>>     *
>>>>>>>     * All hooks have to be called with a lock held which prevents 
>>>>>>> the channel
>>>>>>> - * from changing state. This may be the domain event lock, the 
>>>>>>> per-channel
>>>>>>> - * lock, or in the case of sending interdomain events also the 
>>>>>>> other side's
>>>>>>> - * per-channel lock. Exceptions apply in certain cases for the PV 
>>>>>>> shim.
>>>>>>> + * from changing state. This may be
>>>>>>> + * - the domain event lock,
>>>>>>> + * - the per-channel lock,
>>>>>>> + * - in the case of sending interdomain events the other side's 
>>>>>>> per-channel
>>>>>>> + *   lock,
>>>>>>> + * - in the case of sending non-global vIRQ-s the per-vCPU 
>>>>>>> virq_lock (in
>>>>>>> + *   combination with the ordering enforced through how the vCPU's
>>>>>>> + *   virq_to_evtchn[] gets updated),
>>>>>>> + * - in the case of sending global vIRQ-s vCPU 0's virq_lock.
>>>>>>> + * Exceptions apply in certain cases for the PV shim.
>>>>>>
>>>>>> Having such a wide locking discipline looks dangerous to me, it's easy
>>>>>> to get things wrong without notice IMO.
>>>>>
>>>>> It is effectively only describing how things are (or were before
>>>>> XSA-343, getting restored here).
>>>>
>>>> I agree with Roger here, the new/old locking discipline is dangerous and
>>>> it is only a matter of time before it will bite us again.
>>>>
>>>> I think we should consider Juergen's series because the locking for the
>>>> event channel is easier to understand.
>>>
>>> We should, yes. The one thing I'm a little uneasy with is the
>>> new lock "variant" that gets introduced. Custom locking methods
>>> also are a common source of problems (which isn't to say I see
>>> any here).
>>
>> I am also unease with a new lock "variant". However, this is the best 
>> proposal I have seen so far to unblock the issue.
>>
>> I am open to other suggestion with simple locking discipline.
> 
> In theory my new lock variant could easily be replaced by a rwlock and
> using the try-variant for the readers only.

Well, only until we would add check_lock() there, which I think
we should really have (not just on the slow paths, thanks to
the use of spin_lock() there). The read-vs-write properties
you're utilizing aren't applicable in the general case afaict,
and hence such checking would get in the way.

> The disadvantage of that approach would be a growth of struct evtchn.

Wasn't it you who had pointed out to me the aligned(64) attribute
on the struct (in a different context), which afaict would subsume
any possible growth?

Jan

