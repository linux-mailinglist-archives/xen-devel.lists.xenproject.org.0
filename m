Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D01E630A7EC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 13:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79853.145529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Yc3-0003v4-A8; Mon, 01 Feb 2021 12:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79853.145529; Mon, 01 Feb 2021 12:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Yc3-0003uf-6m; Mon, 01 Feb 2021 12:47:27 +0000
Received: by outflank-mailman (input) for mailman id 79853;
 Mon, 01 Feb 2021 12:47:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6Yc1-0003uZ-JX
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 12:47:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6f4b139-ca82-4f3c-ae97-171bb9319dd0;
 Mon, 01 Feb 2021 12:47:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F917ABD5;
 Mon,  1 Feb 2021 12:47:23 +0000 (UTC)
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
X-Inumbo-ID: f6f4b139-ca82-4f3c-ae97-171bb9319dd0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612183643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06yv9ZhOizDTB6GSm2cGAelDEQnP+st4xtzMqlOQe3I=;
	b=VkUvoROOmD9+xeNxRTkLW6gM/4MlSbdbokzN1bBrkjNSwiNSGq1Y5zZqpuSVjDQdb7uvk9
	WElXiPpAOnRN4m+1t+sWq+dxgEXn1ZjJSBaBF50geLmp2rW8xKof0ieXxjQbUAGviZv4Ba
	m/wVN8585PqVLwTIoOAGZB6ozoGjOjA=
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
 <bd150f4d-4f7e-082e-6b10-03bf1eca7b80@suse.com>
 <CANyqHYeHf8f6G+U2z9A0JC049HPYvWQ+WXZYLCQyWyx5Jvq6BA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <803a50a9-707f-14db-b523-cd1f6f685ab4@suse.com>
Date: Mon, 1 Feb 2021 13:47:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CANyqHYeHf8f6G+U2z9A0JC049HPYvWQ+WXZYLCQyWyx5Jvq6BA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 20:31, Claudemir Todo Bom wrote:
> I've applied both patches, system didn't booted, used following parameters:
> 
> xen: dom0_mem=1024M,max:2048M dom0_max_vcpus=4 dom0_vcpus_pin=true smt=true
> kernel: loglevel=3
> 
> The screen cleared right after the initial xen messages and frozen
> there for a few minutes until I restarted the system.
> 
> I've added "vga=text-80x25,keep" to the xen command line and
> "nomodeset" to the kernel command line, hoping to get some more info
> and surprisingly this was sufficient to make system boot!
> 
> System prompt took a lot to appear, the kernel driver for the usb
> keyboard loaded after 3 minutes and the driver for the usb wifi dongle
> I am using loaded about five minutes after kernel boot, and I had to
> issue "ifup -a" to get an ip address from the dhcp server, and it took
> almost one minute to get it!

I was able to repro this behavior, by deliberately screwing up
CPU0's TSC early during boot. This of course did make it a lot
easier to find and fix the problem. I've Cc-ed you on the full
3-patch series that I've sent a minute ago, because while you
may continue to opt for ignoring the first patch, you'll now
need the latter two. And as before, the updated debugging patch
below.

Jan

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
 time_calibration_rendezvous_tail(const struct calibration_rendezvous *r,
                                  uint64_t old_tsc, uint64_t new_tsc)
@@ -1671,6 +1701,7 @@ time_calibration_rendezvous_tail(const s
     c->local_stime  = get_s_time_fixed(old_tsc ?: new_tsc);
     c->master_stime = r->master_stime;
 
+if(rdzv_log) printk("RDZV[%2u] t=%016lx(%016lx) s=%012lx(%012lx)\n", smp_processor_id(), c->local_tsc, r->master_tsc_stamp, c->local_stime, r->master_stime);//temp
     raise_softirq(TIME_CALIBRATE_SOFTIRQ);
 }
 
@@ -1684,7 +1715,9 @@ static void time_calibration_tsc_rendezv
     struct calibration_rendezvous *r = _r;
     unsigned int total_cpus = cpumask_weight(&r->cpu_calibration_map);
     uint64_t tsc = 0;
+uint64_t adj = 0;//temp
 
+if(rdzv_log) printk("RDZV[%2u] t=%016lx\n", smp_processor_id(), rdtsc_ordered());//temp
     /* Loop to get rid of cache effects on TSC skew. */
     for ( i = 4; i >= 0; i-- )
     {
@@ -1701,6 +1734,7 @@ static void time_calibration_tsc_rendezv
                  * Use the largest value observed anywhere on the first
                  * iteration.
                  */
+adj = r->max_tsc_stamp - r->master_tsc_stamp,//temp
                 r->master_tsc_stamp = r->max_tsc_stamp;
             else if ( i == 0 )
                 r->master_stime = read_platform_stime(NULL);
@@ -1743,6 +1777,13 @@ static void time_calibration_tsc_rendezv
     }
 
     time_calibration_rendezvous_tail(r, tsc, r->master_tsc_stamp);
+if(adj) {//temp
+ static unsigned long cnt, thr;
+ if(++cnt > thr) {
+  thr |= cnt;
+  printk("TSC adjusted by %lx\n", adj);
+ }
+}
 }
 
 /* Ordinary rendezvous function which does not modify TSC values. */
@@ -1794,6 +1835,12 @@ static void time_calibration(void *unuse
     struct calibration_rendezvous r = {
         .semaphore = ATOMIC_INIT(0)
     };
+static unsigned long cnt, thr;//temp
+if(++cnt > thr) {//temp
+ thr |= cnt;
+ printk("TSC: %ps\n", time_calibration_rendezvous_fn);
+ rdzv_log = true;
+}
 
     if ( clocksource_is_tsc() )
     {
@@ -1808,6 +1855,10 @@ static void time_calibration(void *unuse
     on_selected_cpus(&r.cpu_calibration_map,
                      time_calibration_rendezvous_fn,
                      &r, 1);
+if(rdzv_log) {//temp
+ rdzv_log = false;
+ printk("TSC: end rendezvous\n");
+}
 }
 
 static struct cpu_time_stamp ap_bringup_ref;
@@ -1904,6 +1955,7 @@ void init_percpu_time(void)
     }
     t->stamp.local_tsc   = tsc;
     t->stamp.local_stime = now;
+printk("INIT[%2u] t=%016lx s=%012lx m=%012lx\n", smp_processor_id(), tsc, now, t->stamp.master_stime);//temp
 }
 
 /*
@@ -2046,6 +2098,7 @@ static int __init verify_tsc_reliability
      * While with constant-rate TSCs the scale factor can be shared, when TSCs
      * are not marked as 'reliable', re-sync during rendezvous.
      */
+printk("TSC: c=%d r=%d\n", !!boot_cpu_has(X86_FEATURE_CONSTANT_TSC), !!boot_cpu_has(X86_FEATURE_TSC_RELIABLE));//temp
     if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
          !boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
         time_calibration_rendezvous_fn = time_calibration_tsc_rendezvous;
@@ -2061,6 +2114,7 @@ int __init init_xen_time(void)
 {
     tsc_check_writability();
 
+printk("TSC: c=%d r=%d\n", !!boot_cpu_has(X86_FEATURE_CONSTANT_TSC), !!boot_cpu_has(X86_FEATURE_TSC_RELIABLE));//temp
     open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
 
     /* NB. get_wallclock_time() can take over one second to execute. */

