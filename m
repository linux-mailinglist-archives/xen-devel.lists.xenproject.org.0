Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A801BF886
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 14:52:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU8g1-0002wQ-C0; Thu, 30 Apr 2020 12:52:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H9qc=6O=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jU8g0-0002wI-0N
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 12:52:28 +0000
X-Inumbo-ID: 70ac402c-8ae1-11ea-9a40-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70ac402c-8ae1-11ea-9a40-12813bfff9fa;
 Thu, 30 Apr 2020 12:52:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9791BAB3D;
 Thu, 30 Apr 2020 12:52:23 +0000 (UTC)
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <b368ccef-d3b1-1338-6325-8f81a963876d@suse.com>
 <d60d5b917d517b1dfa8292cfb456639c736ec173.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7e039c65-4532-c3ea-8707-72a86cf48e0e@suse.com>
Date: Thu, 30 Apr 2020 14:52:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d60d5b917d517b1dfa8292cfb456639c736ec173.camel@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.04.20 14:28, Dario Faggioli wrote:
> On Thu, 2020-04-30 at 09:35 +0200, Jürgen Groß wrote:
>> On 29.04.20 19:36, Dario Faggioli wrote:
>>>
>>> Therefore, let's set a limit to the max number of CPUs that can
>>> share a
>>> Credit2 runqueue. The actual value is configurable (at boot time),
>>> the
>>> default being 16. If, for instance,  there are more than 16 CPUs in
>>> a
>>> socket, they'll be split among two (or more) runqueues.
>>
>> Did you think about balancing the runqueues regarding the number of
>> cpus? E.g. in case of max being 16 and having 20 cpus to put 10 in
>> each
>> runqueue? I know this will need more logic as cpus are added one by
>> one,
>> but the result would be much better IMO.
>>
> I know. Point is, CPUs not only are added one by one, but they can,
> once the system is running, be offlined/onlined or moved among
> cpupools.
> 
> Therefore, if we have 20 CPUs, even if we put 10 in each runqueue at
> boot, if the admin removes 4 CPUs that happened to be all in the same
> runqueue, we end up in an unbalanced (6 vs 10) situation again. So we'd
> indeed need full runqueue online rebalancing logic, which will probably
> end up being quite complex and I'm not sure it's worth it.
> 
> That being said, I can try to make things a bit more fair, when CPUs
> come up and are added to the pool. Something around the line of adding
> them to the runqueue with the least number of CPUs in it (among the
> suitable ones, of course).
> 
> With that, when the user removes 4 CPUs, we will have the 6 vs 10
> situation. But we would make sure that, when she adds them back, we
> will go back to 10 vs. 10, instead than, say, 6 vs 14 or something like
> that.
> 
> Was something like this that you had in mind? And in any case, what do
> you think about it?

Yes, this would be better already.

> 
>>> --- a/xen/common/sched/cpupool.c
>>> +++ b/xen/common/sched/cpupool.c
>>> @@ -37,7 +37,7 @@ static cpumask_t cpupool_locked_cpus;
>>>    
>>>    static DEFINE_SPINLOCK(cpupool_lock);
>>>    
>>> -static enum sched_gran __read_mostly opt_sched_granularity =
>>> SCHED_GRAN_cpu;
>>> +enum sched_gran __read_mostly opt_sched_granularity =
>>> SCHED_GRAN_cpu;
>>
>> Please don't use the global option value, but the per-cpupool one.
>>
> Yep, you're right. Will do.
> 
>>> +/* Additional checks, to avoid separating siblings in different
>>> runqueues. */
>>> +static bool
>>> +cpu_runqueue_smt_match(const struct csched2_runqueue_data *rqd,
>>> unsigned int cpu)
>>> +{
>>> +    unsigned int nr_sibl =
>>> cpumask_weight(per_cpu(cpu_sibling_mask, cpu));
>>
>> Shouldn't you mask away siblings not in the cpupool?
>>
> So, point here is: if I have Pool-0 and Pool-1, each with 2 runqueues
> and CPU 0 is in Pool-1, when I add CPU 1 --which is CPU 0's sibling--
> to Pool-0, I always want to make sure that there is room for both CPUs
> 0 and 1 in the runqueue of Pool-0 where I'm putting it (CPU 0). Even if
> CPU 1 is currently in another pool.
> 
> This way if, in future, CPU 1 is removed from Pool-1 and added to
> Pool-0, I am sure it can go in the same runqueue where CPU 0 is. If I
> don't consider CPUs which currently are in another pool, we risk that
> when/if they're added to this very pool, they'll end up in a different
> runqueue.
> 
> And we don't want that.
> 
> Makes sense?

Yes.

You should add a comment in this regard.

And you should either reject the case of less cpus per queue than
siblings per core, or you should handle this situation. Otherwise you
won't ever find a suitable run-queue. :-)


Juergen

