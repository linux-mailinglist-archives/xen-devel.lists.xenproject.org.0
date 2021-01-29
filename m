Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51280308A30
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 17:24:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78304.142404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WZD-0008Ef-VS; Fri, 29 Jan 2021 16:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78304.142404; Fri, 29 Jan 2021 16:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WZD-0008EF-Rr; Fri, 29 Jan 2021 16:24:15 +0000
Received: by outflank-mailman (input) for mailman id 78304;
 Fri, 29 Jan 2021 16:24:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5WZB-0008E7-Vw
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 16:24:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 784c47d6-f666-4148-b44c-14cc4779bc44;
 Fri, 29 Jan 2021 16:24:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABFA9ABD6;
 Fri, 29 Jan 2021 16:24:11 +0000 (UTC)
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
X-Inumbo-ID: 784c47d6-f666-4148-b44c-14cc4779bc44
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611937451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9TLhE02RqafZyXte4V/BXI6ZaxpXxIJqIlr90gax3oc=;
	b=CWmniZ6/X9sZoQXFByBx9SVy0+RR62bJ5P1D1nZ3ihDYeZhcs81+D/SiCAltwBm7W/D3AN
	eDbAuzFIPCT8d1avMcVeEa0hE9eZdM7ygTJJ303FHhubSA7uaO0L1tbDESNy+51OTO26fz
	taKM6Rcj1/voaVhtW6xjmguy1wS8ssY=
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Claudemir Todo Bom <claudemir@todobom.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com>
 <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>
 <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
 <CANyqHYehUWeNfVXqVJX6nrBS_CcKL1DQjyNVa1cUbvbx+zD83w@mail.gmail.com>
 <9d04edfe-0059-6fbf-c1da-2087f6190e64@suse.com>
 <CANyqHYfOC6JY978SRPAQ8Ug3GevFD=jbT6bVVET4+QOv8mv7qA@mail.gmail.com>
 <a0a7bbd0-c4c3-cfb8-5af0-a5a4aff14b76@suse.com>
 <CANyqHYeDR_NUKzPtbfLiUzxAUzerKepbU4B-_6=U-7Y6uy8gpQ@mail.gmail.com>
 <8837c3fb-1e0c-5941-258c-e76551a9e02b@suse.com>
 <8cf69fb3-5b8c-60ea-bd1c-39a0cbd5cb5c@suse.com>
 <CANyqHYeCQc2bt836uyrtm9Eo2T1uPP-+ups-ygfACu6zK36BQg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bd150f4d-4f7e-082e-6b10-03bf1eca7b80@suse.com>
Date: Fri, 29 Jan 2021 17:24:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CANyqHYeCQc2bt836uyrtm9Eo2T1uPP-+ups-ygfACu6zK36BQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.01.2021 14:08, Claudemir Todo Bom wrote:
> Em qui., 28 de jan. de 2021 às 06:49, Jan Beulich <jbeulich@suse.com> escreveu:
>>
>> On 28.01.2021 10:47, Jan Beulich wrote:
>>> On 26.01.2021 14:03, Claudemir Todo Bom wrote:
>>>> If this information is good for more tests, please send the patch and
>>>> I will test it!
>>>
>>> Here you go. For simplifying analysis it may be helpful if you
>>> could limit the number of CPUs in use, e.g. by "maxcpus=4" or
>>> at least "smt=0". Provided the problem still reproduces with
>>> such options, of course.
>>
>> Speaking of command line options - it doesn't look like you have
>> told us what else you have on the Xen command line, and without
>> a serial log this isn't visible (e.g. in your video).
> 
> All tests are done with xen command line:
> 
> dom0_mem=1024M,max:2048M dom0_max_vcpus=4 dom0_vcpus_pin=true
> smt=false vga=text-80x50,keep
> 
> and kernel command line:
> 
> loglevel=0 earlyprintk=xen nomodeset
> 
> this way I can get all xen messages on console.
> 
> Attached are the frames I captured from a video, I manually selected
> them starting from the first readable frame.

I've just sent a pair of patches, with you Cc-ed on the 2nd one.
Please give that one a try, with or without the updated debugging
patch below. In case of problems I'd of course want to see the
output from the debugging patch as well. I think it's up to you
whether you also use the first patch from that series - afaict it
shouldn't directly affect your case, but I may be wrong.

Thanks, Jan

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1558,6 +1558,12 @@ static void local_time_calibration(void)
  * TSC Reliability check
  */
 
+static struct {//temp
+ unsigned cpu;
+ signed iter;
+ cycles_t prev, now;
+} check_log[NR_CPUS + 4];
+static unsigned check_idx;//temp
 /*
  * The Linux original version of this function is
  * Copyright (c) 2006, Red Hat, Inc., Ingo Molnar
@@ -1566,6 +1572,7 @@ static void check_tsc_warp(unsigned long
 {
     static DEFINE_SPINLOCK(sync_lock);
     static cycles_t last_tsc;
+unsigned idx, cpu = smp_processor_id();//temp
 
     cycles_t start, now, prev, end;
     int i;
@@ -1576,6 +1583,15 @@ static void check_tsc_warp(unsigned long
     end = start + tsc_khz * 20ULL;
     now = start;
 
+{//temp
+ spin_lock(&sync_lock);
+ idx = check_idx++;
+ check_log[idx].cpu = cpu;
+ check_log[idx].iter = -1;
+ check_log[idx].now = now;
+ spin_unlock(&sync_lock);
+}
+
     for ( i = 0; ; i++ )
     {
         /*
@@ -1610,7 +1626,14 @@ static void check_tsc_warp(unsigned long
         {
             spin_lock(&sync_lock);
             if ( *max_warp < prev - now )
+{//temp
                 *max_warp = prev - now;
+ idx = check_idx++;
+ check_log[idx].cpu = cpu;
+ check_log[idx].iter = i;
+ check_log[idx].prev = prev;
+ check_log[idx].now = now;
+}
             spin_unlock(&sync_lock);
         }
     }
@@ -1647,6 +1670,12 @@ static void tsc_check_reliability(void)
         cpu_relax();
 
     spin_unlock(&lock);
+{//temp
+ unsigned i;
+ printk("CHK[%2u] %lx\n", cpu, tsc_max_warp);//temp
+ for(i = 0; i < ARRAY_SIZE(check_log) && check_log[i].now; ++i)
+  printk("chk[%4u] CPU%-2u %016lx %016lx #%d\n", i, check_log[i].cpu, check_log[i].prev, check_log[i].now, check_log[i].iter);
+}
 }
 
 /*
@@ -1661,6 +1690,7 @@ struct calibration_rendezvous {
     uint64_t master_tsc_stamp, max_tsc_stamp;
 };
 
+static bool rdzv_log;//temp
 static void
 time_calibration_rendezvous_tail(const struct calibration_rendezvous *r)
 {
@@ -1670,6 +1700,7 @@ time_calibration_rendezvous_tail(const s
     c->local_stime  = get_s_time_fixed(c->local_tsc);
     c->master_stime = r->master_stime;
 
+if(rdzv_log) printk("RDZV[%2u] t=%016lx(%016lx) s=%012lx(%012lx)\n", smp_processor_id(), c->local_tsc, r->master_tsc_stamp, c->local_stime, r->master_stime);//temp
     raise_softirq(TIME_CALIBRATE_SOFTIRQ);
 }
 
@@ -1682,7 +1713,9 @@ static void time_calibration_tsc_rendezv
     int i;
     struct calibration_rendezvous *r = _r;
     unsigned int total_cpus = cpumask_weight(&r->cpu_calibration_map);
+uint64_t adj = 0;//temp
 
+if(rdzv_log) printk("RDZV[%2u] t=%016lx\n", smp_processor_id(), rdtsc_ordered());//temp
     /* Loop to get rid of cache effects on TSC skew. */
     for ( i = 4; i >= 0; i-- )
     {
@@ -1706,6 +1739,7 @@ static void time_calibration_tsc_rendezv
                  */
                 uint64_t delta = r->max_tsc_stamp - r->master_tsc_stamp;
 
+adj = delta;//temp
                 r->master_stime += scale_delta(delta,
                                                &this_cpu(cpu_time).tsc_scale);
                 r->master_tsc_stamp = r->max_tsc_stamp;
@@ -1747,6 +1781,13 @@ static void time_calibration_tsc_rendezv
     }
 
     time_calibration_rendezvous_tail(r);
+if(adj) {//temp
+ static unsigned long cnt, thr;
+ if(++cnt > thr) {
+  thr |= cnt;
+  printk("TSC adjusted by %lx\n", adj);
+ }
+}
 }
 
 /* Ordinary rendezvous function which does not modify TSC values. */
@@ -1798,6 +1839,12 @@ static void time_calibration(void *unuse
     struct calibration_rendezvous r = {
         .semaphore = ATOMIC_INIT(0)
     };
+static unsigned long cnt, thr;//temp
+if(system_state > SYS_STATE_smp_boot && ++cnt > thr) {//temp
+ thr |= cnt;
+ printk("TSC: %ps\n", time_calibration_rendezvous_fn);
+ rdzv_log = true;
+}
 
     if ( clocksource_is_tsc() )
     {
@@ -1812,6 +1859,10 @@ static void time_calibration(void *unuse
     on_selected_cpus(&r.cpu_calibration_map,
                      time_calibration_rendezvous_fn,
                      &r, 1);
+if(rdzv_log || system_state <= SYS_STATE_smp_boot) {//temp
+ rdzv_log = false;
+ printk("TSC: end rendezvous\n");
+}
 }
 
 static struct cpu_time_stamp ap_bringup_ref;
@@ -1908,6 +1959,7 @@ void init_percpu_time(void)
     }
     t->stamp.local_tsc   = tsc;
     t->stamp.local_stime = now;
+printk("INIT[%2u] t=%016lx s=%012lx m=%012lx\n", smp_processor_id(), tsc, now, t->stamp.master_stime);//temp
 }
 
 /*
@@ -2050,6 +2102,7 @@ static int __init verify_tsc_reliability
      * While with constant-rate TSCs the scale factor can be shared, when TSCs
      * are not marked as 'reliable', re-sync during rendezvous.
      */
+printk("TSC: c=%d r=%d\n", !!boot_cpu_has(X86_FEATURE_CONSTANT_TSC), !!boot_cpu_has(X86_FEATURE_TSC_RELIABLE));//temp
     if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
          !boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
         time_calibration_rendezvous_fn = time_calibration_tsc_rendezvous;
@@ -2065,6 +2118,7 @@ int __init init_xen_time(void)
 {
     tsc_check_writability();
 
+printk("TSC: c=%d r=%d\n", !!boot_cpu_has(X86_FEATURE_CONSTANT_TSC), !!boot_cpu_has(X86_FEATURE_TSC_RELIABLE));//temp
     open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
 
     /* NB. get_wallclock_time() can take over one second to execute. */

