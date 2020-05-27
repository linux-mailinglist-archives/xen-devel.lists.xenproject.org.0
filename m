Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD741E38EB
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 08:18:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdpNv-0008RX-VI; Wed, 27 May 2020 06:17:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdpNu-0008RS-4r
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 06:17:50 +0000
X-Inumbo-ID: c95b937a-9fe1-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c95b937a-9fe1-11ea-8993-bc764e2007e4;
 Wed, 27 May 2020 06:17:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6FDBAACFE;
 Wed, 27 May 2020 06:17:50 +0000 (UTC)
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
To: Dario Faggioli <dfaggioli@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <3db33b8a-ba97-f302-a325-e989ff0e7084@suse.com>
 <7b34b1b2c4b36399ad16f6e72a872e15d949f4bf.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd566bb2-753f-b0eb-3c6a-bc2dc01cf37c@suse.com>
Date: Wed, 27 May 2020 08:17:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7b34b1b2c4b36399ad16f6e72a872e15d949f4bf.camel@suse.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.05.2020 00:00, Dario Faggioli wrote:
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

I'm not aware of any either, but in common code it should also
matter what might be, not just what there is. Unless you wrap
things in e.g. CONFIG_X86.

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

As per above, cpu_data[rcpu] then please.

>> What about HT vs AMD Fam15's CUs? Do you want both to be treated
>> the same here?
>>
> Are you referring to the cores that, AFAIUI, share the L1i cache? If
> yes, I thought about it, and ended up _not_ dealing with them here, but
> I'm still a bit unsure.
> 
> Cache oriented runqueue organization will be the subject of another
> patch series, and that's why I kept them out. However, that's a rather
> special case with a lot in common to SMT...

I didn't think of cache sharing in particular, but about the
concept of compute units vs hyperthreads in general.

> Just in case, is there a
> way to identify them easily, like with a mask or something, in the code
> already?

cpu_sibling_mask still gets used for both, so there's no mask
to use. As per set_cpu_sibling_map() you can look at
cpu_data[].compute_unit_id to tell, but that's of course x86-
specific (as is the entire compute unit concept).

>>> @@ -900,6 +990,12 @@ cpu_add_to_runqueue(struct csched2_private
>>> *prv, unsigned int cpu)
>>>          rqd->pick_bias = cpu;
>>>          rqd->id = rqi;
>>>      }
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
> 
> So I think I will demote this printk as a XENLOG_DEBUG one (and will
> also get rid of others that were already DEBUG, but not super useful,
> after some more thinking).

Having seen Jürgen's reply as well as what you further wrote below,
I'd still like to point out that even XENLOG_DEBUG isn't quiet
enough: There may be some value to such a debugging message to you,
but it may be mainly spam to e.g. me, who I still have a need to
run with loglvl=all in the common case. Let's not forget, the
context in which the underlying topic came up in was pretty-many-
core AMD CPUs.

We had this issue elsewhere as well, and as CPU counts grew we
started hiding such messages behind a command line option, besides
a log level qualification. Similarly we hide e.g. details of the
IOMMU arrangements behind a command line option.

> The idea is that, after all, exactly on which runqueue a CPU ends up is
> not an information that should matter much from an user/administrator.
> For now, it will be possible to know where they ended up via debug
> keys. And even if we feel like making it more visible, that is better
> achieved via some toolstack command that queries and prints the
> configuration of the scheduler, rather than a line like this in the
> boot log.

Good.

Jan

