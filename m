Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714F8313428
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 15:00:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82881.153260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9755-0005Y6-NL; Mon, 08 Feb 2021 13:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82881.153260; Mon, 08 Feb 2021 13:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9755-0005Xj-KN; Mon, 08 Feb 2021 13:59:59 +0000
Received: by outflank-mailman (input) for mailman id 82881;
 Mon, 08 Feb 2021 13:59:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9754-0005Xd-8I
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 13:59:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19fbceb2-5a12-4518-99b3-44d21bc3e3aa;
 Mon, 08 Feb 2021 13:59:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0D3EAE3C;
 Mon,  8 Feb 2021 13:59:55 +0000 (UTC)
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
X-Inumbo-ID: 19fbceb2-5a12-4518-99b3-44d21bc3e3aa
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612792796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UaGZetiNDTKaxGviBuwA0NF4AUjf8OxPPuyiL4EVj8=;
	b=AnSfa2sMGCwaATsDOwWFAJKCcmbMr+YWwrs9qd5rYCDMijIB29eclZDThwvpmwczH3J5GW
	6W4/KHDj5eAeWa1G7xloMGYd+EcDFfq4KAp3+OsSYYjnOLsAvkHtuOOyrKWzVEf2Bv8Pwm
	W4kCcEDV70uKTDgfThGSfzl4sq3V6K8=
Subject: Re: [PATCH v2 3/3] x86/time: don't move TSC backwards in
 time_calibration_tsc_rendezvous()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Claudemir Todo Bom <claudemir@todobom.com>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
 <80d05abb-4d53-3229-8326-21d79e32dfe4@suse.com>
 <YCEGshHDEH9bJU7y@Air-de-Roger>
 <ae8d8e02-9d2e-a26e-9321-cae0640a0dee@suse.com>
 <YCE6XlA14A2Qsq8H@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <391c4c6f-6213-ac7a-8871-a0c138f6b29f@suse.com>
Date: Mon, 8 Feb 2021 14:59:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCE6XlA14A2Qsq8H@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.02.2021 14:19, Roger Pau Monné wrote:
> On Mon, Feb 08, 2021 at 12:22:25PM +0100, Jan Beulich wrote:
>> On 08.02.2021 10:38, Roger Pau Monné wrote:
>>> On Mon, Feb 01, 2021 at 01:43:28PM +0100, Jan Beulich wrote:
>>>> ---
>>>> Since CPU0 reads its TSC last on the first iteration, if TSCs were
>>>> perfectly sync-ed there shouldn't ever be a need to update. However,
>>>> even on the TSC-reliable system I first tested this on (using
>>>> "tsc=skewed" to get this rendezvous function into use in the first
>>>> place) updates by up to several thousand clocks did happen. I wonder
>>>> whether this points at some problem with the approach that I'm not (yet)
>>>> seeing.
>>>
>>> I'm confused by this, so on a system that had reliable TSCs, which
>>> you forced to remove the reliable flag, and then you saw big
>>> differences when doing the rendezvous?
>>>
>>> That would seem to indicate that such system doesn't really have
>>> reliable TSCs?
>>
>> I don't think so, no. This can easily be a timing effect from the
>> heavy cache line bouncing involved here.
>>
>> What I'm worried here seeing these updates is that I might still
>> be moving TSCs backwards in ways observable to the rest of the
>> system (i.e. beyond the inherent property of the approach), and
>> this then getting corrected by a subsequent rendezvous. But as
>> said - I can't see what this could result from, and hence I'm
>> inclined to assume these are merely effects I've not found a
>> good explanation for so far.
> 
> I'm slightly worried by this, maybe because I'm misunderstanding part
> of the TSC sync stuff.
> 
> So you forced a system that Xen would otherwise consider to have a
> reliable TSC (one that doesn't need a calibration rendezvous) into
> doing the calibration rendezvous, and then the skew seen is quite big.
> I would expect such skew to be minimal? As we would otherwise consider
> the system to not need calibration at all.
> 
> This makes me wonder if the system does indeed need such calibration
> (which I don't think so), or if the calibration that we actually try
> to do is quite bogus?

I wouldn't call it bogus, but it's not very precise. Hence me
saying that if we wanted to make the problematic system seen as
TSC_RELIABLE (and hence be able to switch from "tsc" to "std"
rendezvous), we'd first need to improve accuracy here quite a bit.
(I suspect sufficient accuracy can only be achieved by making use
of TSC_ADJUST, but that's not available on the reporter's hardware,
so of no immediate interest here.)

>>>> @@ -1719,9 +1737,12 @@ static void time_calibration_tsc_rendezv
>>>>              while ( atomic_read(&r->semaphore) > total_cpus )
>>>>                  cpu_relax();
>>>>          }
>>>> +
>>>> +        /* Just in case a read above ended up reading zero. */
>>>> +        tsc += !tsc;
>>>
>>> Won't that be worthy of an ASSERT_UNREACHABLE? I'm not sure I see how
>>> tsc could be 0 on a healthy system after the loop above.
>>
>> It's not forbidden for the firmware to set the TSCs to some
>> huge negative value. Considering the effect TSC_ADJUST has on
>> the actual value read by RDTSC, I think I did actually observe
>> a system coming up this way, because of (not very helpful)
>> TSC_ADJUST setting by firmware. So no, no ASSERT_UNREACHABLE()
>> here.
> 
> But then the code here will loop 5 times, and it's not possible for
> those 5 loops to read a TSC value of 0? I could see it reading 0 on
> one of the iterations but not in all of them.

Sure, we can read zero at most once here. Yet the "if ( tsc == 0 )"
conditionals get executed on every iteration, while they must yield
"true" only on the first (from the variable's initializer); we
absolutely need to go the "else if()" path on CPU0 on the 2nd
iteration, and we also need to skip that part on later iterations
on the other CPUs (for CPU0 to then take the 2nd "else if()" path
from no later than the 3rd iteration onwards; the body of this of
course will only be executed on the last iteration).

The arrangement of all of this could be changed of course, but I'd
prefer to retain the property of there not being any dependency on
the exact number of iterations the loop header specifies, as long as
it's no less than 2 (before this series) / 3 (after this series).
I.e. I wouldn't want to identify e.g. the 1st iteration by "i == 4".

Jan

