Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EEC1C3997
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 14:41:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVaPV-0000iu-PP; Mon, 04 May 2020 12:41:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WsoH=6S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jVaPT-0000in-OS
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 12:41:23 +0000
X-Inumbo-ID: 8f76f472-8e04-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f76f472-8e04-11ea-b9cf-bc764e2007e4;
 Mon, 04 May 2020 12:41:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 53199ABD0;
 Mon,  4 May 2020 12:41:23 +0000 (UTC)
Subject: Re: [PATCH v1.1 2/3] xen/sched: fix theoretical races accessing
 vcpu->dirty_cpu
To: Jan Beulich <jbeulich@suse.com>
References: <20200430152848.20275-1-jgross@suse.com>
 <d1b322c2-98d8-b3a3-1f48-2af89cf9407e@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9d4fd1cd-173f-5128-6a73-ac2c6d679f93@suse.com>
Date: Mon, 4 May 2020 14:41:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d1b322c2-98d8-b3a3-1f48-2af89cf9407e@suse.com>
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.05.20 13:51, Jan Beulich wrote:
> On 30.04.2020 17:28, Juergen Gross wrote:
>> The dirty_cpu field of struct vcpu denotes which cpu still holds data
>> of a vcpu. All accesses to this field should be atomic in case the
>> vcpu could just be running, as it is accessed without any lock held
>> in most cases.
>>
>> There are some instances where accesses are not atomically done, and
>> even worse where multiple accesses are done when a single one would
>> be mandated.
>>
>> Correct that in order to avoid potential problems.
> 
> Beyond the changes you're making, what about the assignment in
> startup_cpu_idle_loop()? And while less important, dump_domains()
> also has a use that I think would better be converted for
> completeness.

startup_cpu_idle_loop() is not important, as it is set before any
scheduling activity might occur on a cpu. But I can change both
instances.

> 
>> @@ -1844,6 +1845,7 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
>>       {
>>           /* Remote CPU calls __sync_local_execstate() from flush IPI handler. */
>>           flush_mask(cpumask_of(dirty_cpu), FLUSH_VCPU_STATE);
>> +        ASSERT(read_atomic(&next->dirty_cpu) == VCPU_CPU_CLEAN);
> 
> ASSERT(!is_vcpu_dirty_cpu(read_atomic(&next->dirty_cpu))) ?

Yes, this is better.

> 
>> @@ -1956,13 +1958,17 @@ void sync_local_execstate(void)
>>   
>>   void sync_vcpu_execstate(struct vcpu *v)
>>   {
>> -    if ( v->dirty_cpu == smp_processor_id() )
>> +    unsigned int dirty_cpu = read_atomic(&v->dirty_cpu);
>> +
>> +    if ( dirty_cpu == smp_processor_id() )
>>           sync_local_execstate();
>> -    else if ( vcpu_cpu_dirty(v) )
>> +    else if ( is_vcpu_dirty_cpu(dirty_cpu) )
>>       {
>>           /* Remote CPU calls __sync_local_execstate() from flush IPI handler. */
>> -        flush_mask(cpumask_of(v->dirty_cpu), FLUSH_VCPU_STATE);
>> +        flush_mask(cpumask_of(dirty_cpu), FLUSH_VCPU_STATE);
>>       }
>> +    ASSERT(read_atomic(&v->dirty_cpu) != dirty_cpu ||
>> +           dirty_cpu == VCPU_CPU_CLEAN);
> 
> !is_vcpu_dirty_cpu(dirty_cpu) again? Also perhaps flip both
> sides of the || (to have the cheaper one first), and maybe
> 
>      if ( is_vcpu_dirty_cpu(dirty_cpu) )
>          ASSERT(read_atomic(&v->dirty_cpu) != dirty_cpu);
> 
> as the longer assertion string literal isn't really of that
> much extra value.

I can do that, in case we can be sure the compiler will drop the
test in case of a non-debug build.

> 
> However, having stared at it for a while now - is this race
> free? I can see this being fine in the (initial) case of
> dirty_cpu == smp_processor_id(), but if this is for a foreign
> CPU, can't the vCPU have gone back to that same CPU again in
> the meantime?

This should never happen. Either the vcpu in question is paused,
or it has been forced off the cpu due to not being allowed to run
there (e.g. affinity has been changed, or cpu is about to be
removed from cpupool). I can add a comment explaining it.

> 
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -844,7 +844,7 @@ static inline bool is_vcpu_dirty_cpu(unsigned int cpu)
>>   
>>   static inline bool vcpu_cpu_dirty(const struct vcpu *v)
>>   {
>> -    return is_vcpu_dirty_cpu(v->dirty_cpu);
>> +    return is_vcpu_dirty_cpu(read_atomic((unsigned int *)&v->dirty_cpu));
> 
> As per your communication with Julien I understand the cast
> will go away again.

Yes, I think so.


Juergen

