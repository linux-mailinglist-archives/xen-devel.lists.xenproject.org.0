Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777963130A0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 12:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82790.153022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l94cf-0006Rf-Sp; Mon, 08 Feb 2021 11:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82790.153022; Mon, 08 Feb 2021 11:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l94cf-0006RG-PT; Mon, 08 Feb 2021 11:22:29 +0000
Received: by outflank-mailman (input) for mailman id 82790;
 Mon, 08 Feb 2021 11:22:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l94ce-0006RB-GK
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 11:22:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9604af4-abe1-4b18-9b29-cf1a4040d86d;
 Mon, 08 Feb 2021 11:22:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1504EB0C6;
 Mon,  8 Feb 2021 11:22:26 +0000 (UTC)
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
X-Inumbo-ID: c9604af4-abe1-4b18-9b29-cf1a4040d86d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612783346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1qHMnyRAoM3fpQV+JMy2aLPq/a6GbDNY/AmiuDukVn0=;
	b=NTH+f+ZYkI9TZkDeUo4kqj3Gi0Pe5pWNBKovGlXOuaijRph/LeEwUdZv4n6xpg0NWABYwE
	LevwdaMDwwxbl3jgCnB6s48yqz2+8a545CVMvTfRWvmGeEhEcwWnRWocRMBgMsorqsMJvt
	gpJhE9nbvSRfsDnGrYSoioxWqQ7v9Bw=
Subject: Re: [PATCH v2 3/3] x86/time: don't move TSC backwards in
 time_calibration_tsc_rendezvous()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Claudemir Todo Bom <claudemir@todobom.com>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
 <80d05abb-4d53-3229-8326-21d79e32dfe4@suse.com>
 <YCEGshHDEH9bJU7y@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae8d8e02-9d2e-a26e-9321-cae0640a0dee@suse.com>
Date: Mon, 8 Feb 2021 12:22:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCEGshHDEH9bJU7y@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.02.2021 10:38, Roger Pau Monné wrote:
> On Mon, Feb 01, 2021 at 01:43:28PM +0100, Jan Beulich wrote:
>> ---
>> Since CPU0 reads its TSC last on the first iteration, if TSCs were
>> perfectly sync-ed there shouldn't ever be a need to update. However,
>> even on the TSC-reliable system I first tested this on (using
>> "tsc=skewed" to get this rendezvous function into use in the first
>> place) updates by up to several thousand clocks did happen. I wonder
>> whether this points at some problem with the approach that I'm not (yet)
>> seeing.
> 
> I'm confused by this, so on a system that had reliable TSCs, which
> you forced to remove the reliable flag, and then you saw big
> differences when doing the rendezvous?
> 
> That would seem to indicate that such system doesn't really have
> reliable TSCs?

I don't think so, no. This can easily be a timing effect from the
heavy cache line bouncing involved here.

What I'm worried here seeing these updates is that I might still
be moving TSCs backwards in ways observable to the rest of the
system (i.e. beyond the inherent property of the approach), and
this then getting corrected by a subsequent rendezvous. But as
said - I can't see what this could result from, and hence I'm
inclined to assume these are merely effects I've not found a
good explanation for so far.

>> Considering the sufficiently modern CPU it's using, I suspect the
>> reporter's system wouldn't even need to turn off TSC_RELIABLE, if only
>> there wasn't the boot time skew. Hence another approach might be to fix
>> this boot time skew. Of course to recognize whether the TSCs then still
>> aren't in sync we'd need to run tsc_check_reliability() sufficiently
>> long after that adjustment. Which is besides the need to have this
>> "fixing" be precise enough for the TSCs to not look skewed anymore
>> afterwards.
> 
> Maybe it would make sense to do a TSC counter sync after APs are up
> and then disable the rendezvous if the next calibration rendezvous
> shows no skew?

Yes, that's what I was hinting at with the above. For the next
rendezvous to not observe any skew, our adjustment would need to
be far more precise than it is today, though.

> I also wonder, we test for skew just after the APs have been booted,
> and decide at that point whether we need a calibration rendezvous.
> 
> Maybe we could do a TSC sync just after APs are up (to hopefully bring
> them in sync), and then do the tsc_check_reliability just before Xen
> ends booting (ie: before handing control to dom0?)
> 
> What we do right now (ie: do the tsc_check_reliability so early) is
> also likely to miss small skews that will only show up after APs have
> been running for a while?

The APs' TSCs will have been running for about as long as the
BSP's, as INIT does not affect them (and in fact they ought to
be running for _exactly_ as long, or else tsc_check_reliability()
would end up turning off TSC_RELIABLE). So I expect skews to be
large enough at this point to be recognizable.

>> @@ -1712,6 +1720,16 @@ static void time_calibration_tsc_rendezv
>>              while ( atomic_read(&r->semaphore) < total_cpus )
>>                  cpu_relax();
>>  
>> +            if ( tsc == 0 )
>> +            {
>> +                uint64_t cur;
>> +
>> +                tsc = rdtsc_ordered();
>> +                while ( tsc > (cur = r->max_tsc_stamp) )
>> +                    if ( cmpxchg(&r->max_tsc_stamp, cur, tsc) == cur )
>> +                        break;
> 
> I think you could avoid reading cur explicitly for each loop and
> instead do?
> 
> cur = ACCESS_ONCE(r->max_tsc_stamp)
> while ( tsc > cur )
>     cur = cmpxchg(&r->max_tsc_stamp, cur, tsc);

Ah yes. I tried something similar, but not quite the same,
and it looked wrong, so I gave up re-arranging.

>> @@ -1719,9 +1737,12 @@ static void time_calibration_tsc_rendezv
>>              while ( atomic_read(&r->semaphore) > total_cpus )
>>                  cpu_relax();
>>          }
>> +
>> +        /* Just in case a read above ended up reading zero. */
>> +        tsc += !tsc;
> 
> Won't that be worthy of an ASSERT_UNREACHABLE? I'm not sure I see how
> tsc could be 0 on a healthy system after the loop above.

It's not forbidden for the firmware to set the TSCs to some
huge negative value. Considering the effect TSC_ADJUST has on
the actual value read by RDTSC, I think I did actually observe
a system coming up this way, because of (not very helpful)
TSC_ADJUST setting by firmware. So no, no ASSERT_UNREACHABLE()
here.

Jan

