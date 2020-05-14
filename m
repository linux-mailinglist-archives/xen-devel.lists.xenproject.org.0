Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF51D31FA
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 15:58:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZENp-0005Kn-W9; Thu, 14 May 2020 13:58:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZENo-0005Kf-Kq
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 13:58:44 +0000
X-Inumbo-ID: 05adc89e-95eb-11ea-a490-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05adc89e-95eb-11ea-a490-12813bfff9fa;
 Thu, 14 May 2020 13:58:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2AFDDAAD0;
 Thu, 14 May 2020 13:58:45 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] xen/sched: fix latent races accessing
 vcpu->dirty_cpu
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200511112829.5500-1-jgross@suse.com>
 <20200511112829.5500-4-jgross@suse.com>
 <eaa891af-697d-bb30-8e34-470102a98561@suse.com>
 <35440630-c065-8d3f-94d2-e01c6a5df2a2@suse.com>
 <b5173d4a-437a-fe21-be4b-842dad960f81@suse.com>
 <8c37fd91-2d97-e30a-700c-141c86c5745a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41215616-ca7e-7448-3d5c-908d06943d91@suse.com>
Date: Thu, 14 May 2020 15:58:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8c37fd91-2d97-e30a-700c-141c86c5745a@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.2020 11:29, Jürgen Groß wrote:
> On 14.05.20 11:24, Jan Beulich wrote:
>> On 14.05.2020 10:50, Jürgen Groß wrote:
>>> On 14.05.20 09:10, Jan Beulich wrote:
>>>> On 11.05.2020 13:28, Juergen Gross wrote:
>>>>> @@ -1956,13 +1958,17 @@ void sync_local_execstate(void)
>>>>>      void sync_vcpu_execstate(struct vcpu *v)
>>>>>    {
>>>>> -    if ( v->dirty_cpu == smp_processor_id() )
>>>>> +    unsigned int dirty_cpu = read_atomic(&v->dirty_cpu);
>>>>> +
>>>>> +    if ( dirty_cpu == smp_processor_id() )
>>>>>            sync_local_execstate();
>>>>> -    else if ( vcpu_cpu_dirty(v) )
>>>>> +    else if ( is_vcpu_dirty_cpu(dirty_cpu) )
>>>>>        {
>>>>>            /* Remote CPU calls __sync_local_execstate() from flush IPI handler. */
>>>>> -        flush_mask(cpumask_of(v->dirty_cpu), FLUSH_VCPU_STATE);
>>>>> +        flush_mask(cpumask_of(dirty_cpu), FLUSH_VCPU_STATE);
>>>>>        }
>>>>> +    ASSERT(!is_vcpu_dirty_cpu(dirty_cpu) ||
>>>>> +           read_atomic(&v->dirty_cpu) != dirty_cpu);
>>>>
>>>> Repeating my v1.1 comments:
>>>>
>>>> "However, having stared at it for a while now - is this race
>>>>    free? I can see this being fine in the (initial) case of
>>>>    dirty_cpu == smp_processor_id(), but if this is for a foreign
>>>>    CPU, can't the vCPU have gone back to that same CPU again in
>>>>    the meantime?"
>>>>
>>>> and later
>>>>
>>>> "There is a time window from late in flush_mask() to the assertion
>>>>    you add. All sorts of things can happen during this window on
>>>>    other CPUs. IOW what guarantees the vCPU not getting unpaused or
>>>>    its affinity getting changed yet another time?"
>>>>
>>>> You did reply that by what is now patch 2 this race can be
>>>> eliminated, but I have to admit I don't see why this would be.
>>>> Hence at the very least I'd expect justification in either the
>>>> description or a code comment as to why there's no race left
>>>> (and also no race to be expected to be re-introduced by code
>>>> changes elsewhere - very unlikely races are, by their nature,
>>>> unlikely to be hit during code development and the associated
>>>> testing, hence I'd like there to be sufficiently close to a
>>>> guarantee here).
>>>>
>>>> My reservations here may in part be due to not following the
>>>> reasoning for patch 2, which therefore I'll have to rely on the
>>>> scheduler maintainers to judge on.
>>>
>>> sync_vcpu_execstate() isn't called for a running or runnable vcpu any
>>> longer. I can add an ASSERT() and a comment explaining it if you like
>>> that better.
>>
>> This would help (hopefully people adding new uses of the function
>> would run into this assertion/comment), but for example the uses
>> in mapcache_current_vcpu() or do_tasklet_work() look to be pretty
>> hard to prove they can't happen for a runnable vCPU.
> 
> Those call sync_local_execstate(), not sync_vcpu_execstate().

Ouch, as said on the other sub-thread - I'm sorry for mixing those up.

Jan

