Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE60A30A7E0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 13:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79842.145502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6YYH-0003ZG-Hx; Mon, 01 Feb 2021 12:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79842.145502; Mon, 01 Feb 2021 12:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6YYH-0003Yq-DU; Mon, 01 Feb 2021 12:43:33 +0000
Received: by outflank-mailman (input) for mailman id 79842;
 Mon, 01 Feb 2021 12:43:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6YYF-0003Yd-JB
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 12:43:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50e4a339-9990-4a43-b796-6f872f291cb7;
 Mon, 01 Feb 2021 12:43:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43731AB92;
 Mon,  1 Feb 2021 12:43:29 +0000 (UTC)
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
X-Inumbo-ID: 50e4a339-9990-4a43-b796-6f872f291cb7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612183409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pO95WGmT9luUPpVQj5Mfxb1ngFYgSQ2HBQd/KaR67jk=;
	b=SxDTn8Yr2eNncgqM27CwVzLnQR04GX1SPvm2AuWxwmStGoz9j4HlR6Jb1v4d4ati86Jxjv
	KQVK2jp0BCFZl7Fmaeq+TEP5bLZZbBnZ6J5RzYquvxxZLX6rEM5MCnaBiPjIkuMzvoCwzq
	EN9XRLPHwXHTIEQa8vftAcYYKngFIXk=
Subject: [PATCH v2 3/3] x86/time: don't move TSC backwards in
 time_calibration_tsc_rendezvous()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Claudemir Todo Bom <claudemir@todobom.com>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
Message-ID: <80d05abb-4d53-3229-8326-21d79e32dfe4@suse.com>
Date: Mon, 1 Feb 2021 13:43:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While doing this for small amounts may be okay, the unconditional use
of CPU0's value here has been found to be a problem when the boot time
TSC of the BSP was behind that of all APs by more than a second. In
particular because of get_s_time_fixed() producing insane output when
the calculated delta is negative, we can't allow this to happen.

On the first iteration have all other CPUs sort out the highest TSC
value any one of them has read. On the second iteration, if that
maximum is higher than CPU0's, update its recorded value from that
taken in the first iteration. Use the resulting value on the last
iteration to write everyone's TSCs.

To account for the possible discontinuity, have
time_calibration_rendezvous_tail() record the newly written value, but
extrapolate local stime using the value read.

Reported-by: Claudemir Todo Bom <claudemir@todobom.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Don't update r->master_stime by calculation. Re-base over new
    earlier patch. Make time_calibration_rendezvous_tail() take two TSC
    values.
---
Since CPU0 reads its TSC last on the first iteration, if TSCs were
perfectly sync-ed there shouldn't ever be a need to update. However,
even on the TSC-reliable system I first tested this on (using
"tsc=skewed" to get this rendezvous function into use in the first
place) updates by up to several thousand clocks did happen. I wonder
whether this points at some problem with the approach that I'm not (yet)
seeing.

Considering the sufficiently modern CPU it's using, I suspect the
reporter's system wouldn't even need to turn off TSC_RELIABLE, if only
there wasn't the boot time skew. Hence another approach might be to fix
this boot time skew. Of course to recognize whether the TSCs then still
aren't in sync we'd need to run tsc_check_reliability() sufficiently
long after that adjustment. Which is besides the need to have this
"fixing" be precise enough for the TSCs to not look skewed anymore
afterwards.

As per the comment ahead of it, the original purpose of the function was
to deal with TSCs halted in deep C states. While this probably explains
why only forward moves were ever expected, I don't see how this could
have been reliable in case CPU0 was deep-sleeping for a sufficiently
long time. My only guess here is a hidden assumption of CPU0 never being
idle for long enough.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1658,17 +1658,17 @@ struct calibration_rendezvous {
     cpumask_t cpu_calibration_map;
     atomic_t semaphore;
     s_time_t master_stime;
-    u64 master_tsc_stamp;
+    uint64_t master_tsc_stamp, max_tsc_stamp;
 };
 
 static void
 time_calibration_rendezvous_tail(const struct calibration_rendezvous *r,
-                                 uint64_t tsc)
+                                 uint64_t old_tsc, uint64_t new_tsc)
 {
     struct cpu_time_stamp *c = &this_cpu(cpu_calibration);
 
-    c->local_tsc    = tsc;
-    c->local_stime  = get_s_time_fixed(c->local_tsc);
+    c->local_tsc    = new_tsc;
+    c->local_stime  = get_s_time_fixed(old_tsc ?: new_tsc);
     c->master_stime = r->master_stime;
 
     raise_softirq(TIME_CALIBRATE_SOFTIRQ);
@@ -1683,6 +1683,7 @@ static void time_calibration_tsc_rendezv
     int i;
     struct calibration_rendezvous *r = _r;
     unsigned int total_cpus = cpumask_weight(&r->cpu_calibration_map);
+    uint64_t tsc = 0;
 
     /* Loop to get rid of cache effects on TSC skew. */
     for ( i = 4; i >= 0; i-- )
@@ -1692,8 +1693,15 @@ static void time_calibration_tsc_rendezv
             while ( atomic_read(&r->semaphore) != (total_cpus - 1) )
                 cpu_relax();
 
-            if ( r->master_tsc_stamp == 0 )
-                r->master_tsc_stamp = rdtsc_ordered();
+            if ( tsc == 0 )
+                r->master_tsc_stamp = tsc = rdtsc_ordered();
+            else if ( r->master_tsc_stamp < r->max_tsc_stamp )
+                /*
+                 * We want to avoid moving the TSC backwards for any CPU.
+                 * Use the largest value observed anywhere on the first
+                 * iteration.
+                 */
+                r->master_tsc_stamp = r->max_tsc_stamp;
             else if ( i == 0 )
                 r->master_stime = read_platform_stime(NULL);
 
@@ -1712,6 +1720,16 @@ static void time_calibration_tsc_rendezv
             while ( atomic_read(&r->semaphore) < total_cpus )
                 cpu_relax();
 
+            if ( tsc == 0 )
+            {
+                uint64_t cur;
+
+                tsc = rdtsc_ordered();
+                while ( tsc > (cur = r->max_tsc_stamp) )
+                    if ( cmpxchg(&r->max_tsc_stamp, cur, tsc) == cur )
+                        break;
+            }
+
             if ( i == 0 )
                 write_tsc(r->master_tsc_stamp);
 
@@ -1719,9 +1737,12 @@ static void time_calibration_tsc_rendezv
             while ( atomic_read(&r->semaphore) > total_cpus )
                 cpu_relax();
         }
+
+        /* Just in case a read above ended up reading zero. */
+        tsc += !tsc;
     }
 
-    time_calibration_rendezvous_tail(r, r->master_tsc_stamp);
+    time_calibration_rendezvous_tail(r, tsc, r->master_tsc_stamp);
 }
 
 /* Ordinary rendezvous function which does not modify TSC values. */
@@ -1746,7 +1767,7 @@ static void time_calibration_std_rendezv
         smp_rmb(); /* receive signal /then/ read r->master_stime */
     }
 
-    time_calibration_rendezvous_tail(r, rdtsc_ordered());
+    time_calibration_rendezvous_tail(r, 0, rdtsc_ordered());
 }
 
 /*


