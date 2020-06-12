Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7D31F780A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 14:42:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjj0B-0006RP-Ig; Fri, 12 Jun 2020 12:41:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=liIz=7Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jjj0A-0006RK-Ar
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 12:41:42 +0000
X-Inumbo-ID: 107212dc-acaa-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 107212dc-acaa-11ea-b7bb-bc764e2007e4;
 Fri, 12 Jun 2020 12:41:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AB4F2AC91;
 Fri, 12 Jun 2020 12:41:43 +0000 (UTC)
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
To: Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
 <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
 <88eac035-8769-24f7-45e6-11a1c4739ccb@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a5d7bbe8-a9ff-1396-bd7f-3b6143bddac7@suse.com>
Date: Fri, 12 Jun 2020 14:41:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <88eac035-8769-24f7-45e6-11a1c4739ccb@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.20 14:29, Julien Grall wrote:
> Hi Juergen,
> 
> On 12/06/2020 05:57, Jürgen Groß wrote:
>> On 12.06.20 02:22, Volodymyr Babchuk wrote:
>>> As scheduler code now collects time spent in IRQ handlers and in
>>> do_softirq(), we can present those values to userspace tools like
>>> xentop, so system administrator can see how system behaves.
>>>
>>> We are updating counters only in sched_get_time_correction() function
>>> to minimize number of taken spinlocks. As atomic_t is 32 bit wide, it
>>> is not enough to store time with nanosecond precision. So we need to
>>> use 64 bit variables and protect them with spinlock.
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> ---
>>>   xen/common/sched/core.c     | 17 +++++++++++++++++
>>>   xen/common/sysctl.c         |  1 +
>>>   xen/include/public/sysctl.h |  4 +++-
>>>   xen/include/xen/sched.h     |  2 ++
>>>   4 files changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>>> index a7294ff5c3..ee6b1d9161 100644
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -95,6 +95,10 @@ static struct scheduler __read_mostly ops;
>>>   static bool scheduler_active;
>>> +static DEFINE_SPINLOCK(sched_stat_lock);
>>> +s_time_t sched_stat_irq_time;
>>> +s_time_t sched_stat_hyp_time;
>>> +
>>>   static void sched_set_affinity(
>>>       struct sched_unit *unit, const cpumask_t *hard, const cpumask_t 
>>> *soft);
>>> @@ -994,9 +998,22 @@ s_time_t sched_get_time_correction(struct 
>>> sched_unit *u)
>>>               break;
>>>       }
>>> +    spin_lock_irqsave(&sched_stat_lock, flags);
>>> +    sched_stat_irq_time += irq;
>>> +    sched_stat_hyp_time += hyp;
>>> +    spin_unlock_irqrestore(&sched_stat_lock, flags);
>>
>> Please don't use a lock. Just use add_sized() instead which will add
>> atomically.
> 
> add_sized() is definitely not atomic. It will only prevent the compiler 
> to read/write multiple time the variable.

Oh, my bad, I let myself fool by it being defined in atomic.h.

> 
> If we expect sched_get_time_correction to be called concurrently then we 
> would need to introduce atomic64_t or a spin lock.

Or we could use percpu variables and add the cpu values up when
fetching the values.


Juergen

