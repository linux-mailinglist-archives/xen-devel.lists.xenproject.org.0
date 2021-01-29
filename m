Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D82B308A2C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 17:21:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78293.142376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WW3-0007v7-34; Fri, 29 Jan 2021 16:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78293.142376; Fri, 29 Jan 2021 16:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WW2-0007ui-VS; Fri, 29 Jan 2021 16:20:58 +0000
Received: by outflank-mailman (input) for mailman id 78293;
 Fri, 29 Jan 2021 16:20:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5WW0-0007ua-LM
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 16:20:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d96cb176-aa03-47de-9071-f3f2eb94037e;
 Fri, 29 Jan 2021 16:20:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC542B040;
 Fri, 29 Jan 2021 16:20:54 +0000 (UTC)
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
X-Inumbo-ID: d96cb176-aa03-47de-9071-f3f2eb94037e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611937255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ssquy+rPe4/EYFAhCpT7dpYV2lE6HH4TbsIX6MEXDQ=;
	b=hfDCTMUNBHa9X4gPjChjFJafBb0+t//RulpOegDOWCSp+p5EWwmDPQnfuJt4SkR28t1gGq
	jxweFJvDf181TFJnAANvkucx7IQe3VUOiI2mLWXYeRQKuljSx6/gDYVV1tm7Qq+IyJFzuk
	NFnsH82ezAcqDVK1okQGwIi0IJiGNV4=
Subject: [PATCH RFC 2/2] x86/time: don't move TSC backwards in
 time_calibration_tsc_rendezvous()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Claudemir Todo Bom <claudemir@todobom.com>
References: <35443b5a-1410-7099-a937-e9f537bbe989@suse.com>
Message-ID: <d0f1f249-293c-5a7f-4b6c-1caeb275e7b9@suse.com>
Date: Fri, 29 Jan 2021 17:20:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <35443b5a-1410-7099-a937-e9f537bbe989@suse.com>
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
taken in the first iteration, along with the system time. Use the
resulting value on the last iteration to write everyone's TSCs.

Reported-by: Claudemir Todo Bom <claudemir@todobom.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Since CPU0 reads its TSC last on the first iteration, if TSCs were
perfectly sync-ed there shouldn't ever be a need to update. However,
even on the TSC-reliable system I first tested this on (using
"tsc=skewed" to get this rendezvous function into use in the first
place) updates by up to several thousand clocks did happen. I wonder
whether this points at some problem with the approach that I'm not (yet)
seeing.

Considering the sufficiently modern CPU it's using, I suspect the system
wouldn't even need to turn off TSC_RELIABLE, if only there wasn't the
boot time skew. Hence another approach might be to fix this boot time
skew. Of course to recognize whether the TSCs then still aren't in sync
we'd need to run tsc_check_reliability() sufficiently long after that
adjustment.

The above and the desire to have the change tested by the reporter are
the reasons for the RFC.

As per the comment ahead of it, the original purpose of the function was
to deal with TSCs halted in deep C states. While this probably explains
why only forward moves were ever expected, I don't see how this could
have been reliable in case CPU0 was deep-sleeping for a sufficiently
long time. My only guess here is a hidden assumption of CPU0 never being
idle for long enough.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1658,7 +1658,7 @@ struct calibration_rendezvous {
     cpumask_t cpu_calibration_map;
     atomic_t semaphore;
     s_time_t master_stime;
-    u64 master_tsc_stamp;
+    uint64_t master_tsc_stamp, max_tsc_stamp;
 };
 
 static void
@@ -1696,6 +1696,21 @@ static void time_calibration_tsc_rendezv
                 r->master_stime = read_platform_stime(NULL);
                 r->master_tsc_stamp = rdtsc_ordered();
             }
+            else if ( r->master_tsc_stamp < r->max_tsc_stamp )
+            {
+                /*
+                 * We want to avoid moving the TSC backwards for any CPU.
+                 * Use the largest value observed anywhere on the first
+                 * iteration and bump up our previously recorded system
+                 * accordingly.
+                 */
+                uint64_t delta = r->max_tsc_stamp - r->master_tsc_stamp;
+
+                r->master_stime += scale_delta(delta,
+                                               &this_cpu(cpu_time).tsc_scale);
+                r->master_tsc_stamp = r->max_tsc_stamp;
+            }
+
             atomic_inc(&r->semaphore);
 
             if ( i == 0 )
@@ -1711,6 +1726,17 @@ static void time_calibration_tsc_rendezv
             while ( atomic_read(&r->semaphore) < total_cpus )
                 cpu_relax();
 
+            if ( _r )
+            {
+                uint64_t tsc = rdtsc_ordered(), cur;
+
+                while ( tsc > (cur = r->max_tsc_stamp) )
+                    if ( cmpxchg(&r->max_tsc_stamp, cur, tsc) == cur )
+                        break;
+
+                _r = NULL;
+            }
+
             if ( i == 0 )
                 write_tsc(r->master_tsc_stamp);
 


