Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490A9333B47
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 12:25:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96011.181409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwxK-0008EQ-5x; Wed, 10 Mar 2021 11:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96011.181409; Wed, 10 Mar 2021 11:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwxK-0008E1-2P; Wed, 10 Mar 2021 11:24:46 +0000
Received: by outflank-mailman (input) for mailman id 96011;
 Wed, 10 Mar 2021 11:24:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJwxI-0008Dw-AY
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 11:24:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac18573e-4364-42a0-8835-e54714e63de5;
 Wed, 10 Mar 2021 11:24:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F2EFAE78;
 Wed, 10 Mar 2021 11:24:42 +0000 (UTC)
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
X-Inumbo-ID: ac18573e-4364-42a0-8835-e54714e63de5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615375482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85m8fftSYrclN47stYnbq7WvpYpQUDAkyCj2JKHHa58=;
	b=SYAQ7z0QQEjFkQtkoddQOu+y8BxnAlyofd2Q8Yb4xjIz7k92twwEZObUDFnXBm/HHJnPf6
	YozAsAjqHeaNGp4QswwcnaQWjpOjNM7r1O9Zw9kMYSnQewM9FlFyG/rIRBhJdDFisfLE8N
	Q/b9Aa2u28g7RF/sjivU/0JfbUrwS04=
Subject: Re: Hit ASSERT in credit2 code with NR_CPUS=1 build
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <YEehTbVVjWMaqjCV@Air-de-Roger>
 <5ac80ae8be856e49fd83245eee4baae986beafa9.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d44b90fc-3fc5-7df4-672b-980cca41f776@suse.com>
Date: Wed, 10 Mar 2021 12:24:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <5ac80ae8be856e49fd83245eee4baae986beafa9.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.03.2021 12:13, Dario Faggioli wrote:
> On Tue, 2021-03-09 at 17:24 +0100, Roger Pau Monné wrote:
>> Hello,
>>
> Hey,
> 
>> While looking at the NR_CPUS == 1 build I realized I could reliable
>> trigger the following ASSERT by creating a guest (note that dom0
>> seems
>> to be fine):
>>
> Yes, I'm (somewhat, not sure if exactly though) able to reproduce.
> 
>> (XEN) Assertion 'i != cpu' failed at credit2.c:1725
>> (XEN) ----[ Xen-4.15.0-rc  x86_64  debug=y  Tainted:   C   ]----
>> (XEN) CPU:    0
>> (XEN) RIP:    e008:[<ffff82d040249399>]
>> common/sched/credit2.c#runq_tickle+0x469/0x571
>> (XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor (d4v0)
>> (XEN) rax: ffffffffffffffff   rbx: 0000000000000000   rcx:
>> 0000000000000000
>> (XEN) rdx: ffff83086c62feb0   rsi: 0000012774fba66c   rdi:
>> ffff8307e11d5d40
>> (XEN) rbp: ffff83008c8c7cf8   rsp: ffff83008c8c7c68   r8: 
>> ffff83086c66d6c0
>> (XEN) r9:  ffff82d0405d1218   r10: 0000000000000000   r11:
>> ffff83086c631000
>> (XEN) r12: ffff83086c6437c0   r13: 0000000000000000   r14:
>> ffff83086c62fe20
>> (XEN) r15: ffff82d0405d0320   cr0: 0000000080050033   cr4:
>> 00000000003526e0
>> (XEN) cr3: 00000007e130d000   cr2: ffff88826910cb38
>> (XEN) fsb: 00007efee038b780   gsb: ffff888273400000   gss:
>> 0000000000000000
>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
>> (XEN) Xen code around <ffff82d040249399>
>> (common/sched/credit2.c#runq_tickle+0x469/0x571):
>> (XEN)  ac ff 75 3d 0f 0b 0f 0b <0f> 0b c7 45 ac 00 00 00 00 48 8d 05
>> 6f 7e 38 00
>> (XEN) Xen stack trace from rsp=ffff83008c8c7c68:
>> [...]
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) Assertion 'i != cpu' failed at credit2.c:1725
>> (XEN) ****************************************
>>
> Interesting... So, how do cpumasks look like/work, with NR_CPUS=1
> (sorry, I couldn't follow all the aspects of it too closely) ?
> 
> I'm asking because, what we're doing here is the following. First of
> all we put together a cpumask (in `mask`) out of the intersection of
> the CPUs that are in the vcpu's hard/soft affinity, are part of this
> runqueue, are idle and have not been tickled (where tickled == they've
> been poked and will go through schedule() soon):
> 
>     cpumask_andnot(&mask, &rqd->active, &rqd->idle);
>     cpumask_andnot(&mask, &mask, &rqd->tickled);
>     cpumask_and(&mask, &mask, cpumask_scratch_cpu(cpu));
> 
> Now, I would very much expect for `mask` to have at most one bit set
> (i.e., the one of our only CPU). Actually, considering how unlikely it
> would be that our only CPU is both idle and not-tickled, I expect mask
> to be empty most of the times.
> 
> Anyway, let's say the cpumask has 1 bit set (in which case, it must be
> the one associated to CPU 0, I presume?). What we do now is this:
> 
> if ( __cpumask_test_and_clear_cpu(cpu, &mask) )
> {
>     ...
> }
> 
> Which I think means that, no matter whether or not we enter the loop,
> we clear the bit. Of course, which bit depends on the value of `cpu`...
> But with NR_CPUS=1, I don't see how `cpu` can have a value different
> than the ID of the one and only CPU we have.
> 
> So, in my mind, now `mask` is empty. Therefore, I'm currently clueless
> about why we enter this loop...
> 
>>     for_each_cpu(i, &mask)
>>     {
>>         s_time_t score;
>>
>>         /* Already looked at this one above */
>>         ASSERT(i != cpu); <====
>>
> ... and we reach this point.

from xen/cpumask.h:

#define for_each_cpu(cpu, mask)			\
	for ((cpu) = 0; (cpu) < 1; (cpu)++, (void)(mask))

I'm struggling though why this is this way.

Jan

