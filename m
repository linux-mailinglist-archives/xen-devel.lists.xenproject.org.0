Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9925325F0D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 09:31:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90120.170467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYWj-0003jb-Qm; Fri, 26 Feb 2021 08:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90120.170467; Fri, 26 Feb 2021 08:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYWj-0003jC-NG; Fri, 26 Feb 2021 08:31:09 +0000
Received: by outflank-mailman (input) for mailman id 90120;
 Fri, 26 Feb 2021 08:31:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFYWh-0003j7-PR
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 08:31:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 299e8d67-cced-4d79-bb36-3d15241eebce;
 Fri, 26 Feb 2021 08:31:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F07EAAAE;
 Fri, 26 Feb 2021 08:31:02 +0000 (UTC)
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
X-Inumbo-ID: 299e8d67-cced-4d79-bb36-3d15241eebce
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614328262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zizc9mgtALmCUMLDX8SdCLIf5N1ESalejPn7NvmvnQE=;
	b=XmVTz74Y0YHUvQcuQf8EP8cDnqpZBL249xWLVnwv3o5PXCZuw6wGxv1cR7DR+1ggxPKd/D
	uMBdFe2Y+VBQ5z1x6p8ap+i3rhSKTfMdk8C/Q7KkSySm/iWJI3lP6fvJPnXJ88bCP11eYy
	xV7lPLynT913Ewtlc8fizPrHTEOiaDA=
Subject: Re: [PATCH for-next 3/6] xen/sched: Fix build when NR_CPUS == 1
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1614265718.git.connojdavis@gmail.com>
 <d0922adc698ab76223d76a0a7f328a72cedf00ad.1614265718.git.connojdavis@gmail.com>
 <b4ad0f83-e071-49f8-17a8-7fec0e226b9a@suse.com>
 <20210226030833.uugfojf5kkxhlpr7@thewall>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb19a389-d2b3-d0cc-fd25-62bbb121cf98@suse.com>
Date: Fri, 26 Feb 2021 09:31:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226030833.uugfojf5kkxhlpr7@thewall>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.02.2021 04:08, Connor Davis wrote:
> On Thu, Feb 25, 2021 at 04:50:02PM +0100, Jan Beulich wrote:
>> On 25.02.2021 16:24, Connor Davis wrote:
>>> Return from cpu_schedule_up when either cpu is 0 or
>>> NR_CPUS == 1. This fixes the following:
>>>
>>> core.c: In function 'cpu_schedule_up':
>>> core.c:2769:19: error: array subscript 1 is above array bounds
>>> of 'struct vcpu *[1]' [-Werror=array-bounds]
>>>  2769 |     if ( idle_vcpu[cpu] == NULL )
>>>       |
>>>
>>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>>> ---
>>>  xen/common/sched/core.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>>> index 9745a77eee..f5ec65bf9b 100644
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -2763,7 +2763,7 @@ static int cpu_schedule_up(unsigned int cpu)
>>>      cpumask_set_cpu(cpu, &sched_res_mask);
>>>  
>>>      /* Boot CPU is dealt with later in scheduler_init(). */
>>> -    if ( cpu == 0 )
>>> +    if ( cpu == 0 || NR_CPUS == 1 )
>>>          return 0;
>>>  
>>>      if ( idle_vcpu[cpu] == NULL )
>>
>> I'm not convinced a compiler warning is due here, and in turn
>> I'm not sure we want/need to work around this the way you do.
> 
> It seems like a reasonable warning to me, but of course I'm open
> to dealing with it in a different way.
> 
>> First question is whether that's just a specific compiler
>> version that's flawed. If it's not just a special case (e.g.
> 
> The docker container uses gcc 10.2.0 from
> https://github.com/riscv/riscv-gnu-toolchain

Ah yes, at -O2 I can observe the warning on e.g.

extern int array[N];

int test(unsigned i) {
	if(i == N - 1)
		return 0;
	return array[i];
}

when N=1. No warning appears when N=2 or higher, yet if it is
sensible to emit for N=1 then it would imo be similarly
sensible to emit in other cases. The only difference is that
when N=1, there's no i for which the array access would ever
be valid, while e.g. for N=2 there's exactly one such i.

I've tried an x86 build with NR_CPUS=1, and this hits the case
you found and a 2nd one, where behavior is even more puzzling.
For the case you've found I'd like to suggest as alternative

@@ -2769,6 +2769,12 @@ static int cpu_schedule_up(unsigned int
     if ( cpu == 0 )
         return 0;
 
+    /*
+     * Guard in particular also against the compiler suspecting out-of-bounds
+     * array accesses below when NR_CPUS=1.
+     */
+    BUG_ON(cpu >= NR_CPUS);
+
     if ( idle_vcpu[cpu] == NULL )
         vcpu_create(idle_vcpu[0]->domain, cpu);
     else

To fix the x86 build in this regard we'd additionally need
something along the lines of

--- unstable.orig/xen/arch/x86/genapic/x2apic.c
+++ unstable/xen/arch/x86/genapic/x2apic.c
@@ -54,7 +54,17 @@ static void init_apic_ldr_x2apic_cluster
     per_cpu(cluster_cpus, this_cpu) = cluster_cpus_spare;
     for_each_online_cpu ( cpu )
     {
-        if (this_cpu == cpu || x2apic_cluster(this_cpu) != x2apic_cluster(cpu))
+        if ( this_cpu == cpu )
+            continue;
+        /*
+         * Guard in particular against the compiler suspecting out-of-bounds
+         * array accesses below when NR_CPUS=1 (oddly enough with gcc 10 it
+         * is the 1st of these alone which actually helps, not the 2nd, nor
+         * are both required together there).
+         */
+        BUG_ON(this_cpu >= NR_CPUS);
+        BUG_ON(cpu >= NR_CPUS);
+        if ( x2apic_cluster(this_cpu) != x2apic_cluster(cpu) )
             continue;
         per_cpu(cluster_cpus, this_cpu) = per_cpu(cluster_cpus, cpu);
         break;

but the comment points out how strangely the compiler behaves here.
Even flipping around the two sides of the != doesn't change its
behavior. It is perhaps relevant to note here that there's no
special casing of smp_processor_id() in the NR_CPUS=1 case, so the
compiler can't infer this_cpu == 0.

Once we've settled on how to change common/sched/core.c I guess
I'll then adjust the x86-specific change accordingly and submit as
a separate fix (or I could of course also bundle both changes then).

Jan

