Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C8A1ADEC3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 15:52:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRPk-0004nc-Vt; Fri, 17 Apr 2020 13:52:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ygd1=6B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jPRPj-0004nX-K8
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 13:52:15 +0000
X-Inumbo-ID: a4ab7106-80b2-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4ab7106-80b2-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 13:52:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 38E8AAE09;
 Fri, 17 Apr 2020 13:52:13 +0000 (UTC)
Subject: Re: [PATCH] sched: print information about scheduler granularity
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200416083341.21122-1-sergey.dyasli@citrix.com>
 <d2577c4b4ff040c8f256d203e647619d9d4d6ebb.camel@suse.com>
 <3dacf98c-c4b7-a263-01d3-f8562619ff53@suse.com>
 <1587131006806.63738@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2d2fb0af-2ec3-4b2f-4427-eb13e9623111@suse.com>
Date: Fri, 17 Apr 2020 15:52:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1587131006806.63738@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.20 15:43, Sergey Dyasli wrote:
> On 17/04/2020 08:57, Jürgen Groß wrote:
>> On 16.04.20 18:43, Dario Faggioli wrote:
>>> On Thu, 2020-04-16 at 09:33 +0100, Sergey Dyasli wrote:
>>>> Currently it might be not obvious which scheduling mode is being used
>>>> by the scheduler. Alleviate this by printing additional information
>>>> about the selected granularity.
>>>>
>>> I like the idea. However, I don't like how verbose and long that line
>>> becomes.
>>>
>>>>    Messages now look like these:
>>>>
>>>> 1. boot
>>>> (XEN) [00089808f0ea7496] Using scheduler: SMP Credit Scheduler
>>>> (credit) in core-scheduling mode
>>>>
>>>> 2. xl debug-keys r
>>>> (XEN) [   45.914314] Scheduler: SMP Credit Scheduler (credit) in 2-
>>>> way core-scheduling mode
>>>>
>>> What about adding an entry, just below these ones. Something looking
>>> like, for instance (both at boot and in the debug-key dump):
>>>
>>> "Scheduling granularity: cpu"
>>>
>>> (or "core", or "socket")
> 
> I agree that the line becomes too long. I'll print the new information
> on a separate line as you suggest in v2.
> 
>>>
>>> Also
>>>
>>>> --- a/xen/common/sched/cpupool.c
>>>> +++ b/xen/common/sched/cpupool.c
>>>> @@ -38,7 +38,35 @@ static cpumask_t cpupool_locked_cpus;
>>>>    static DEFINE_SPINLOCK(cpupool_lock);
>>>>    static enum sched_gran __read_mostly opt_sched_granularity =
>>>> SCHED_GRAN_cpu;
>>>> -static unsigned int __read_mostly sched_granularity = 1;
>>>> +static unsigned int __read_mostly sched_granularity;
>>>> +
>>>> +char *sched_gran_str(char *str, size_t size)
>>>> +{
>>>> +    char *mode = "";
>>>> +
>>>> +    switch ( opt_sched_granularity )
>>>> +    {
>>>> +    case SCHED_GRAN_cpu:
>>>> +        mode = "cpu";
>>>> +        break;
>>>> +    case SCHED_GRAN_core:
>>>> +        mode = "core";
>>>> +        break;
>>>> +    case SCHED_GRAN_socket:
>>>> +        mode = "socket";
>>>> +        break;
>>>> +    default:
>>>> +        ASSERT_UNREACHABLE();
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    if ( sched_granularity )
>>>> +        snprintf(str, size, "%u-way %s", sched_granularity, mode);
>>>>
>>> I'm not sure about using the value of the enum like this.
>>
>> enum? sched_granularity holds the number of cpus per scheduling
>> resource. opt_sched_granularity is the enum.
>>
>>>
>>> E.g., in a system with 4 threads per core, enabling core scheduling
>>> granularity would mean having 4 vCPUs in the scheduling units. But this
>>> will still print "2-way core-scheduling", which I think would sound
>>> confusing.
>>
>> It would print "4-way", of course.
>>
>>>
>>> So I'd just go with "cpu", "core" and "socket" strings.
>>
>> No, this is not a good idea. With e.g. smt=0 you'll be able to have
>> "1-way core" which is much more informative than "core".
> 
> Can confirm the above. "sched-gran=core" on a Knights Mill produces:
> (XEN) [  232.018648] Scheduler: SMP Credit Scheduler (credit) in 4-way core-scheduling mode
> 
> While "sched-gran=core smt=0" gives:
> (XEN) [  259.337588] Scheduler: SMP Credit Scheduler (credit) in 1-way core-scheduling mode

You might want to consider not using the global variables
[opt_]sched_granularity, but the per-cpupool ones. Right now they have
the same value, but this might change in future...


Juergen

