Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFD01CA301
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 07:54:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWvxb-0000tQ-GR; Fri, 08 May 2020 05:54:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JXU2=6W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jWvxa-0000tL-3V
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 05:54:10 +0000
X-Inumbo-ID: 5480bf1c-90f0-11ea-9fc4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5480bf1c-90f0-11ea-9fc4-12813bfff9fa;
 Fri, 08 May 2020 05:54:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 13E08AA55;
 Fri,  8 May 2020 05:54:09 +0000 (UTC)
Subject: Re: [PATCH 1/3] xen/sched: allow rcu work to happen when syncing cpus
 in core scheduling
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20200430151559.1464-1-jgross@suse.com>
 <20200430151559.1464-2-jgross@suse.com>
 <7bdf9bd021ff4bd1131a8a41f42b37d6559f600f.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dac6bdf3-17a1-aeea-f14b-7154222589b4@suse.com>
Date: Fri, 8 May 2020 07:54:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7bdf9bd021ff4bd1131a8a41f42b37d6559f600f.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.20 20:34, Dario Faggioli wrote:
> On Thu, 2020-04-30 at 17:15 +0200, Juergen Gross wrote:
>> With RCU barriers moved from tasklets to normal RCU processing cpu
>> offlining in core scheduling might deadlock due to cpu
>> synchronization
>> required by RCU processing and core scheduling concurrently.
>>
>> Fix that by bailing out from core scheduling synchronization in case
>> of pending RCU work. Additionally the RCU softirq is now required to
>> be of higher priority than the scheduling softirqs in order to do
>> RCU processing before entering the scheduler again, as bailing out
>> from
>> the core scheduling synchronization requires to raise another softirq
>> SCHED_SLAVE, which would bypass RCU processing again.
>>
>> Reported-by: Sergey Dyasli <sergey.dyasli@citrix.com>
>> Tested-by: Sergey Dyasli <sergey.dyasli@citrix.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
> In general, I'm fine with this patch and it can have my:
> 
> Acked-by: Dario Faggioli <dfaggioli@suse.com>
> 
> I'd ask for one thing, but that doesn't affect the ack, as it's not
> "my" code. :-)
> 
>> diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
>> index b4724f5c8b..1f6c4783da 100644
>> --- a/xen/include/xen/softirq.h
>> +++ b/xen/include/xen/softirq.h
>> @@ -4,10 +4,10 @@
>>   /* Low-latency softirqs come first in the following list. */
>>   enum {
>>       TIMER_SOFTIRQ = 0,
>> +    RCU_SOFTIRQ,
>>       SCHED_SLAVE_SOFTIRQ,
>>       SCHEDULE_SOFTIRQ,
>>       NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ,
>> -    RCU_SOFTIRQ,
>>       TASKLET_SOFTIRQ,
>>       NR_COMMON_SOFTIRQS
>>   };
>>
> So, until now, it was kind of intuitive (at least, it was to me :-) )
> that the TIMER_SOFTIRQ, we want it first, and the SCHEDULE one right
> after it. And the comment above the enum ("Low-latency softirqs come
> first in the following list"), although brief, is effective.
> 
> With the introduction of SCHED_SLAVE, things became slightly more
> complex, but it still is not too far a reach to figure out the fact
> that we want it to be above SCHEDULE, and the reasons for that.
> 
> Now that we're moving RCU from (almost) the very bottom to up here, I
> think we need some more info, there in the code. Sure all the bits and
> pieces are there in the changelogs, but I think it would be rather
> helpful to have them easily available to people trying to understand or
> modifying this code, e.g., with a comment.

That's reasonable.

> 
> I was also thinking that, even better than a comment, would be a
> (build?) BUG_ON if RCU has no smaller value than SCHED_SLAVE and SLAVE.
> Not here, of course, but maybe close to some piece of code that relies
> on this assumption. Something that, if I tomorrow put the SCHED* ones
> on top again, would catch my attention and tell me that I either take
> care of that code path too, or I can't do it.
> 
> However, I'm not sure whether, e.g., the other hunk of this patch would
> be a suitable place for something like this. And I can't, out of the
> top of my head, think of a really good place for where to put it.
> Therefore, I'm "only" asking for the comment... but if you (or others)
> have ideas, that'd be cool. :-)

I think the other hunk is exactly where the BUILD_BUG_ON() should be.
And this is a perfect place for the comment, too, as its placement will
explain the context very well.


Juergen

