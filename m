Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C8D1E3749
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 06:28:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdneD-0007FJ-6j; Wed, 27 May 2020 04:26:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hL2n=7J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jdneB-0007FE-K9
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 04:26:31 +0000
X-Inumbo-ID: 3bb9f283-9fd2-11ea-a6e5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bb9f283-9fd2-11ea-a6e5-12813bfff9fa;
 Wed, 27 May 2020 04:26:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 25BAEAAC7;
 Wed, 27 May 2020 04:26:31 +0000 (UTC)
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <3db33b8a-ba97-f302-a325-e989ff0e7084@suse.com>
 <7b34b1b2c4b36399ad16f6e72a872e15d949f4bf.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5939e797-09be-53d1-b87f-d6c6c97ea3a3@suse.com>
Date: Wed, 27 May 2020 06:26:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7b34b1b2c4b36399ad16f6e72a872e15d949f4bf.camel@suse.com>
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.05.20 00:00, Dario Faggioli wrote:
> Hey,
> 
> thanks for the review, and sorry for replying late... I was busy with
> something and then was trying to implement a better balancing logic, as
> discussed with Juergen, but with only partial success...
> 
> On Thu, 2020-04-30 at 08:45 +0200, Jan Beulich wrote:
>> On 29.04.2020 19:36, Dario Faggioli wrote:
>>> @@ -852,14 +862,61 @@ cpu_runqueue_match(const struct
>>> [...]
>>> +        ASSERT(rcpu != cpu);
>>> +        if ( !cpumask_test_cpu(rcpu, cpumask_scratch_cpu(cpu)) )
>>> +        {
>>> +            /*
>>> +             * For each CPU already in the runqueue, account for
>>> it and for
>>> +             * its sibling(s), independently from whether such
>>> sibling(s) are
>>> +             * in the runqueue already or not.
>>> +             *
>>> +             * Of course, if there are sibling CPUs in the
>>> runqueue already,
>>> +             * only count them once.
>>> +             */
>>> +            cpumask_or(cpumask_scratch_cpu(cpu),
>>> cpumask_scratch_cpu(cpu),
>>> +                       per_cpu(cpu_sibling_mask, rcpu));
>>> +            nr_smts += nr_sibl;
>>
>> This being common code, is it appropriate to assume all CPUs having
>> the same number of siblings?
>>
> You mention common code because you are thinking of differences between
> x86 and ARM? In ARM --althought there might be (I'm not sure)-- chips
> that have SMT, or that we may want to identify and treat like if it was
> SMT, we currently have no support for that, so I don't think it is a
> problem.
> 
> On x86, I'm not sure I am aware of cases where the number of threads is
> different among cores or sockets... are there any?
> 
> Besides, we have some SMT specific code around (especially in
> scheduling) already.
> 
>> Even beyond that, iirc the sibling mask
>> represents the online or parked siblings, but not offline ones. For
>> the purpose here, don't you rather care about the full set?
>>
> This is actually a good point. I indeed care about the number of
> siblings a thread has, in general, not only about the ones that are
> currently online.
> 
> In v2, I'll be using boot_cpu_data.x86_num_siblings, of course wrapped
> in an helper that just returns 1 for ARM. What do you think, is this
> better?
> 
>> What about HT vs AMD Fam15's CUs? Do you want both to be treated
>> the same here?
>>
> Are you referring to the cores that, AFAIUI, share the L1i cache? If
> yes, I thought about it, and ended up _not_ dealing with them here, but
> I'm still a bit unsure.
> 
> Cache oriented runqueue organization will be the subject of another
> patch series, and that's why I kept them out. However, that's a rather
> special case with a lot in common to SMT... Just in case, is there a
> way to identify them easily, like with a mask or something, in the code
> already?
> 
>> Also could you outline the intentions with this logic in the
>> description, to be able to match the goal with what gets done?
>>
> Sure, I will try state it more clearly.
> 
>>> @@ -900,6 +990,12 @@ cpu_add_to_runqueue(struct csched2_private
>>> *prv, unsigned int cpu)
>>>           rqd->pick_bias = cpu;
>>>           rqd->id = rqi;
>>>       }
>>> +    else
>>> +        rqd = rqd_valid;
>>> +
>>> +    printk(XENLOG_INFO "CPU %d (sibling={%*pbl}) will go to
>>> runqueue %d with {%*pbl}\n",
>>> +           cpu, CPUMASK_PR(per_cpu(cpu_sibling_mask, cpu)), rqd-
>>>> id,
>>> +           CPUMASK_PR(&rqd->active));
>>
>> Iirc there's one per-CPU printk() already. On large systems this
>> isn't
>> very nice, so I'd like to ask that their total number at least not
>> get
>> further grown. Ideally there would be a less verbose summary after
>> all
>> CPUs have been brought up at boot, with per-CPU info be logged only
>> during CPU hot online.
>>
> Understood. Problem is that, here in the scheduling code, I don't see
> an easy way to tell when we have finished bringing up CPUs... And it's
> probably not worth looking too hard (even less adding logic) only for
> the sake of printing this message.

cpupool_init() is the perfect place for that.


Juergen

