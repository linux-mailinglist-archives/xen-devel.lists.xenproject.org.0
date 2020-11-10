Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 978B52AD334
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 11:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23184.49777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcQcB-0000tM-EL; Tue, 10 Nov 2020 10:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23184.49777; Tue, 10 Nov 2020 10:11:03 +0000
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
	id 1kcQcB-0000sw-Aj; Tue, 10 Nov 2020 10:11:03 +0000
Received: by outflank-mailman (input) for mailman id 23184;
 Tue, 10 Nov 2020 10:11:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcQc9-0000sq-60
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 10:11:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 913e560a-6b85-47dc-abcc-5016591c3cc0;
 Tue, 10 Nov 2020 10:11:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C6B4AF21;
 Tue, 10 Nov 2020 10:10:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcQc9-0000sq-60
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 10:11:01 +0000
X-Inumbo-ID: 913e560a-6b85-47dc-abcc-5016591c3cc0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 913e560a-6b85-47dc-abcc-5016591c3cc0;
	Tue, 10 Nov 2020 10:11:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605003059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Rr7pXcq/NxzmYm2LYglg7vbyHz1ZwB4ioLa2yxqp08=;
	b=fcbjvv4pyzWi9GMwhS8yPGwWzYc2+yASnVbZYEbnvPcSPgiXPyk4UWy/vcq1FF3/UNguUs
	LavCSLPmItBq7RN4HG8pAK+qj134NuCEnZIhCr649dpJgBvKujVhA/zhdURlPGynwz/+IK
	NMu9xcKUDlltKcLPqUjA5HBUdYpKw1I=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3C6B4AF21;
	Tue, 10 Nov 2020 10:10:59 +0000 (UTC)
Subject: Re: [PATCH v6 2/3] xen/evtchn: rework per event channel lock
To: Julien Grall <julien@xen.org>
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20201109163826.13035-1-jgross@suse.com>
 <20201109163826.13035-3-jgross@suse.com>
 <f64158af-3468-053f-7cbe-d52ab01b8bfc@suse.com>
 <7858513b-2938-5bad-0c9e-167a8472656f@xen.org>
 <c1e02f02-dfdd-33f1-0881-8632ddcba158@suse.com>
 <f32f583e-2bc8-a064-fc16-0f8661149357@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5c4b9d03-1e25-3338-46cd-c038f9c7cffb@suse.com>
Date: Tue, 10 Nov 2020 11:10:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <f32f583e-2bc8-a064-fc16-0f8661149357@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.11.2020 10:47, Julien Grall wrote:
> Hi,
> 
> On 10/11/2020 07:39, Jan Beulich wrote:
>> On 09.11.2020 18:46, Julien Grall wrote:
>>> Hi,
>>>
>>> On 09/11/2020 16:48, Jan Beulich wrote:
>>>> On 09.11.2020 17:38, Juergen Gross wrote:
>>>>> Currently the lock for a single event channel needs to be taken with
>>>>> interrupts off, which causes deadlocks in some cases.
>>>>>
>>>>> Rework the per event channel lock to be non-blocking for the case of
>>>>> sending an event and removing the need for disabling interrupts for
>>>>> taking the lock.
>>>>>
>>>>> The lock is needed for avoiding races between event channel state
>>>>> changes (creation, closing, binding) against normal operations (set
>>>>> pending, [un]masking, priority changes).
>>>>>
>>>>> Use a rwlock, but with some restrictions:
>>>>>
>>>>> - Changing the state of an event channel (creation, closing, binding)
>>>>>     needs to use write_lock(), with ASSERT()ing that the lock is taken as
>>>>>     writer only when the state of the event channel is either before or
>>>>>     after the locked region appropriate (either free or unbound).
>>>>>
>>>>> - Sending an event needs to use read_trylock() mostly, in case of not
>>>>>     obtaining the lock the operation is omitted. This is needed as
>>>>>     sending an event can happen with interrupts off (at least in some
>>>>>     cases).
>>>>>
>>>>> - Dumping the event channel state for debug purposes is using
>>>>>     read_trylock(), too, in order to avoid blocking in case the lock is
>>>>>     taken as writer for a long time.
>>>>>
>>>>> - All other cases can use read_lock().
>>>>>
>>>>> Fixes: e045199c7c9c54 ("evtchn: address races with evtchn_reset()")
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> ---
>>>>> V4:
>>>>> - switch to rwlock
>>>>> - add ASSERT() to verify correct write_lock() usage
>>>>>
>>>>> V3:
>>>>> - corrected a copy-and-paste error (Jan Beulich)
>>>>> - corrected unlocking in two cases (Jan Beulich)
>>>>> - renamed evtchn_read_trylock() (Jan Beulich)
>>>>> - added some comments and an ASSERT() for evtchn_write_lock()
>>>>> - set EVENT_WRITE_LOCK_INC to INT_MIN
>>>>>
>>>>> V2:
>>>>> - added needed barriers
>>>>>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> I'll give it overnight for others to possibly comment, but I'd
>>>> like to get this in tomorrow if at all possible.
>>>
>>> IIRC, Citrix originally reported the issues. I would like to give them
>>> an opportunity to test the patches and confirm this effectively fixed
>>> there issues.
>>
>> I would consider waiting longer, but I'd like to get staging unblocked.
> 
> So the plan is to have the patches sitting in staging for a few days and 
> then backport?

Right, the usual thing - wait at least until a push has happened.
Unless we learn of problems with the change, I definitely want to
have this in for 4.14.1.

>> Just like with 52e1fc47abc3a0123 ("evtchn/Flask: pre-allocate node on
>> send path") we can always decide to revert / fix up afterwards. The
>> patch here surely is an improvement, even if it was to turn out it
>> doesn't fix all issues yes. I'd appreciate if you would confirm you
>> don't object to the patch going in - I'll wait a few more hours,
>> perhaps until around noon.
> I would suggest to wait until noon and if you don't get any answer, then 
> merge it.

Okay.

Jan

