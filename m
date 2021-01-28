Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7328307314
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 10:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76825.138770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l53tS-0006s5-Fa; Thu, 28 Jan 2021 09:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76825.138770; Thu, 28 Jan 2021 09:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l53tS-0006rg-CG; Thu, 28 Jan 2021 09:47:14 +0000
Received: by outflank-mailman (input) for mailman id 76825;
 Thu, 28 Jan 2021 09:47:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l53tR-0006rb-HH
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 09:47:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 867ca0c7-525f-453c-bb6f-ab0e57772b12;
 Thu, 28 Jan 2021 09:47:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64C5DAC97;
 Thu, 28 Jan 2021 09:47:11 +0000 (UTC)
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
X-Inumbo-ID: 867ca0c7-525f-453c-bb6f-ab0e57772b12
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611827231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwc5OkPO83z49Hn0zhDabkZ4NKVMGsAduwW78GzGxlM=;
	b=FvA+tRM4fIJs2W72sZdVrGEUj+pOMNWLjL8kogn305ceFKAWnbgjX19f3mTf+uIAYAL8w3
	/JywfkSEuaS8DmqQnza7f1a/GKviSORa3JYbNGvcGBa5zJhJYtQnWgo33v4tRja5GhSWdo
	wxqe/wxnvQkl5mY14URd2+qm8f/8cEE=
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Claudemir Todo Bom <claudemir@todobom.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8837c3fb-1e0c-5941-258c-e76551a9e02b@suse.com>
Date: Thu, 28 Jan 2021 10:47:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CANyqHYeDR_NUKzPtbfLiUzxAUzerKepbU4B-_6=U-7Y6uy8gpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.01.2021 14:03, Claudemir Todo Bom wrote:
> If this information is good for more tests, please send the patch and
> I will test it!

Here you go. For simplifying analysis it may be helpful if you
could limit the number of CPUs in use, e.g. by "maxcpus=4" or
at least "smt=0". Provided the problem still reproduces with
such options, of course.

Jan

--- unstable.orig/xen/arch/x86/time.c
+++ unstable/xen/arch/x86/time.c
@@ -1574,6 +1574,12 @@ static void local_time_calibration(void)
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
@@ -1582,6 +1588,7 @@ static void check_tsc_warp(unsigned long
 {
     static DEFINE_SPINLOCK(sync_lock);
     static cycles_t last_tsc;
+unsigned idx, cpu = smp_processor_id();//temp
 
     cycles_t start, now, prev, end;
     int i;
@@ -1592,6 +1599,15 @@ static void check_tsc_warp(unsigned long
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
@@ -1626,7 +1642,14 @@ static void check_tsc_warp(unsigned long
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
@@ -1663,6 +1686,12 @@ static void tsc_check_reliability(void)
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
@@ -1677,6 +1706,7 @@ struct calibration_rendezvous {
     u64 master_tsc_stamp;
 };
 
+static bool rdzv_log;//temp
 static void
 time_calibration_rendezvous_tail(const struct calibration_rendezvous *r)
 {
@@ -1686,6 +1716,7 @@ time_calibration_rendezvous_tail(const s
     c->local_stime  = get_s_time_fixed(c->local_tsc);
     c->master_stime = r->master_stime;
 
+if(rdzv_log) printk("RDZV[%2u] t=%016lx(%016lx) s=%012lx(%012lx)\n", smp_processor_id(), c->local_tsc, r->master_tsc_stamp, c->local_stime, r->master_stime);//temp
     raise_softirq(TIME_CALIBRATE_SOFTIRQ);
 }
 
@@ -1699,6 +1730,7 @@ static void time_calibration_tsc_rendezv
     struct calibration_rendezvous *r = _r;
     unsigned int total_cpus = cpumask_weight(&r->cpu_calibration_map);
 
+if(rdzv_log) printk("RDZV[%2u] t=%016lx\n", smp_processor_id(), rdtsc_ordered());//temp
     /* Loop to get rid of cache effects on TSC skew. */
     for ( i = 4; i >= 0; i-- )
     {
@@ -1788,6 +1820,12 @@ static void time_calibration(void *unuse
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
@@ -1802,6 +1840,10 @@ static void time_calibration(void *unuse
     on_selected_cpus(&r.cpu_calibration_map,
                      time_calibration_rendezvous_fn,
                      &r, 1);
+if(rdzv_log || system_state <= SYS_STATE_smp_boot) {//temp
+ rdzv_log = false;
+ printk("TSC: end rendezvous\n");
+}
 }
 
 static struct cpu_time_stamp ap_bringup_ref;
@@ -1898,6 +1940,7 @@ void init_percpu_time(void)
     }
     t->stamp.local_tsc   = tsc;
     t->stamp.local_stime = now;
+printk("INIT[%2u] t=%016lx s=%012lx m=%012lx\n", smp_processor_id(), tsc, now, t->stamp.master_stime);//temp
 }
 
 /*
@@ -2043,6 +2086,7 @@ static int __init verify_tsc_reliability
      * While with constant-rate TSCs the scale factor can be shared, when TSCs
      * are not marked as 'reliable', re-sync during rendezvous.
      */
+printk("TSC: c=%d r=%d\n", !!boot_cpu_has(X86_FEATURE_CONSTANT_TSC), !!boot_cpu_has(X86_FEATURE_TSC_RELIABLE));//temp
     if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
          !boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
         time_calibration_rendezvous_fn = time_calibration_tsc_rendezvous;
@@ -2056,6 +2100,7 @@ int __init init_xen_time(void)
 {
     tsc_check_writability();
 
+printk("TSC: c=%d r=%d\n", !!boot_cpu_has(X86_FEATURE_CONSTANT_TSC), !!boot_cpu_has(X86_FEATURE_TSC_RELIABLE));//temp
     open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
 
     /* NB. get_wallclock_time() can take over one second to execute. */

