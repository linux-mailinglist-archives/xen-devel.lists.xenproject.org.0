Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6712830A7DF
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 13:43:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79840.145490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6YXs-0003Se-8q; Mon, 01 Feb 2021 12:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79840.145490; Mon, 01 Feb 2021 12:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6YXs-0003SD-53; Mon, 01 Feb 2021 12:43:08 +0000
Received: by outflank-mailman (input) for mailman id 79840;
 Mon, 01 Feb 2021 12:43:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6YXq-0003Rw-Eh
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 12:43:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69894d35-6bd9-4c1c-aaea-8908e3e09a16;
 Mon, 01 Feb 2021 12:43:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9DC19AC45;
 Mon,  1 Feb 2021 12:43:04 +0000 (UTC)
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
X-Inumbo-ID: 69894d35-6bd9-4c1c-aaea-8908e3e09a16
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612183384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DnYSxTzJBDvOfiz9wcen1XbR/0uoT6XyzGIZOo8FU/0=;
	b=sh+nbL0yu7qztUDe5BYyZVRiJLK4UzCa3t5KRokxVQ/2hbl4jQHrs7HZDCyHuAwNrhyKqR
	VdRlWaxgZqz5/LE+rq7L1pef+SZ7CJ/rj7yG0NlU3dESUuyMjylj/7QBXdyNW/5/O/7raA
	UsJHeoN6i+vRZ3n4+LH3kQdaZLXQE7Q=
Subject: [PATCH v2 2/3] x86/time: adjust time recording
 time_calibration_tsc_rendezvous()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Claudemir Todo Bom <claudemir@todobom.com>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
Message-ID: <26b71f94-d1c7-d906-5b2a-4e7994d6f7c0@suse.com>
Date: Mon, 1 Feb 2021 13:43:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The (stime,tsc) tuple is the basis for extrapolation by get_s_time().
Therefore the two better get taken as close to one another as possible.
This means two things: First, reading platform time is too early when
done on the first iteration. The closest we can get is on the last
iteration, immediately before telling other CPUs to write their TSCs
(and then also writing CPU0's). While at the first glance it may seem
not overly relevant when exactly platform time is read (when assuming
that only stime is ever relevant anywhere, and hence the association
with the precise TSC values is of lower interest), both CPU frequency
changes and the effects of SMT make it unpredictable (between individual
rendezvous instances) how long the loop iterations will take. This will
in turn lead to higher an error than neccesary in how close to linear
stime movement we can get.

Second, re-reading the TSC for local recording is increasing the overall
error as well, when we already know a more precise value - the one just
written.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1662,11 +1662,12 @@ struct calibration_rendezvous {
 };
 
 static void
-time_calibration_rendezvous_tail(const struct calibration_rendezvous *r)
+time_calibration_rendezvous_tail(const struct calibration_rendezvous *r,
+                                 uint64_t tsc)
 {
     struct cpu_time_stamp *c = &this_cpu(cpu_calibration);
 
-    c->local_tsc    = rdtsc_ordered();
+    c->local_tsc    = tsc;
     c->local_stime  = get_s_time_fixed(c->local_tsc);
     c->master_stime = r->master_stime;
 
@@ -1691,11 +1692,11 @@ static void time_calibration_tsc_rendezv
             while ( atomic_read(&r->semaphore) != (total_cpus - 1) )
                 cpu_relax();
 
-            if ( r->master_stime == 0 )
-            {
-                r->master_stime = read_platform_stime(NULL);
+            if ( r->master_tsc_stamp == 0 )
                 r->master_tsc_stamp = rdtsc_ordered();
-            }
+            else if ( i == 0 )
+                r->master_stime = read_platform_stime(NULL);
+
             atomic_inc(&r->semaphore);
 
             if ( i == 0 )
@@ -1720,7 +1721,7 @@ static void time_calibration_tsc_rendezv
         }
     }
 
-    time_calibration_rendezvous_tail(r);
+    time_calibration_rendezvous_tail(r, r->master_tsc_stamp);
 }
 
 /* Ordinary rendezvous function which does not modify TSC values. */
@@ -1745,7 +1746,7 @@ static void time_calibration_std_rendezv
         smp_rmb(); /* receive signal /then/ read r->master_stime */
     }
 
-    time_calibration_rendezvous_tail(r);
+    time_calibration_rendezvous_tail(r, rdtsc_ordered());
 }
 
 /*


