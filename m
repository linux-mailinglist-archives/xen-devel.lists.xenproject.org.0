Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011101C3BC5
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 15:54:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVbXN-0007iz-PU; Mon, 04 May 2020 13:53:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WsoH=6S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jVbXN-0007is-0B
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 13:53:37 +0000
X-Inumbo-ID: a54d28fd-8e0e-11ea-9d23-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a54d28fd-8e0e-11ea-9d23-12813bfff9fa;
 Mon, 04 May 2020 13:53:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7DABFACD8;
 Mon,  4 May 2020 13:53:36 +0000 (UTC)
Subject: Re: [PATCH v1.1 2/3] xen/sched: fix theoretical races accessing
 vcpu->dirty_cpu
To: Jan Beulich <jbeulich@suse.com>
References: <20200430152848.20275-1-jgross@suse.com>
 <d1b322c2-98d8-b3a3-1f48-2af89cf9407e@suse.com>
 <9d4fd1cd-173f-5128-6a73-ac2c6d679f93@suse.com>
 <eafd8c4a-26a1-9db9-97d7-e78c629e9a0a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <03e06725-a8ae-dfc1-04b3-44963871ee3a@suse.com>
Date: Mon, 4 May 2020 15:53:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <eafd8c4a-26a1-9db9-97d7-e78c629e9a0a@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.05.20 14:48, Jan Beulich wrote:
> On 04.05.2020 14:41, Jürgen Groß wrote:
>> On 04.05.20 13:51, Jan Beulich wrote:
>>> On 30.04.2020 17:28, Juergen Gross wrote:
>>>> @@ -1956,13 +1958,17 @@ void sync_local_execstate(void)
>>>>      void sync_vcpu_execstate(struct vcpu *v)
>>>>    {
>>>> -    if ( v->dirty_cpu == smp_processor_id() )
>>>> +    unsigned int dirty_cpu = read_atomic(&v->dirty_cpu);
>>>> +
>>>> +    if ( dirty_cpu == smp_processor_id() )
>>>>            sync_local_execstate();
>>>> -    else if ( vcpu_cpu_dirty(v) )
>>>> +    else if ( is_vcpu_dirty_cpu(dirty_cpu) )
>>>>        {
>>>>            /* Remote CPU calls __sync_local_execstate() from flush IPI handler. */
>>>> -        flush_mask(cpumask_of(v->dirty_cpu), FLUSH_VCPU_STATE);
>>>> +        flush_mask(cpumask_of(dirty_cpu), FLUSH_VCPU_STATE);
>>>>        }
>>>> +    ASSERT(read_atomic(&v->dirty_cpu) != dirty_cpu ||
>>>> +           dirty_cpu == VCPU_CPU_CLEAN);
>>>
>>> !is_vcpu_dirty_cpu(dirty_cpu) again? Also perhaps flip both
>>> sides of the || (to have the cheaper one first), and maybe
>>>
>>>       if ( is_vcpu_dirty_cpu(dirty_cpu) )
>>>           ASSERT(read_atomic(&v->dirty_cpu) != dirty_cpu);
>>>
>>> as the longer assertion string literal isn't really of that
>>> much extra value.
>>
>> I can do that, in case we can be sure the compiler will drop the
>> test in case of a non-debug build.
> 
> Modern gcc will afaik; no idea about clang though.

I'll go with both tests inside the ASSERT(), as this will hurt debug
build only.

> 
>>> However, having stared at it for a while now - is this race
>>> free? I can see this being fine in the (initial) case of
>>> dirty_cpu == smp_processor_id(), but if this is for a foreign
>>> CPU, can't the vCPU have gone back to that same CPU again in
>>> the meantime?
>>
>> This should never happen. Either the vcpu in question is paused,
>> or it has been forced off the cpu due to not being allowed to run
>> there (e.g. affinity has been changed, or cpu is about to be
>> removed from cpupool). I can add a comment explaining it.
> 
> There is a time window from late in flush_mask() to the assertion
> you add. All sorts of things can happen during this window on
> other CPUs. IOW what guarantees the vCPU not getting unpaused or
> its affinity getting changed yet another time?

Hmm, very unlikely, but not impossible (especially in nested virt case).

This makes me wonder whether adding the call to sync_vcpu_execstate() to
sched_unit_migrate_finish() was really a good idea. There might be cases
where it is not necessary (e.g. in the case you are mentioning, but with
a much larger time window), or where it is more expensive than doing it
the lazy way.

Dropping this call of sync_vcpu_execstate() will remove the race you are
mentioning completely.


Juergen

