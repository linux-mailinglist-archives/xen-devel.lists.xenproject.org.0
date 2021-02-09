Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49076314F89
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 13:55:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83221.154320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SY8-0007lA-6V; Tue, 09 Feb 2021 12:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83221.154320; Tue, 09 Feb 2021 12:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SY8-0007ko-3I; Tue, 09 Feb 2021 12:55:24 +0000
Received: by outflank-mailman (input) for mailman id 83221;
 Tue, 09 Feb 2021 12:55:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9SY6-0007kd-39
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 12:55:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e30d3eeb-2174-45f1-8bad-e6cc0e4db328;
 Tue, 09 Feb 2021 12:55:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36B88AF7B;
 Tue,  9 Feb 2021 12:55:20 +0000 (UTC)
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
X-Inumbo-ID: e30d3eeb-2174-45f1-8bad-e6cc0e4db328
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612875320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wj3LF6N3hDpyMxGowUzNE8QQ+tNIwy9wVm4fwaEKDOE=;
	b=vHpsQ5Aw3nml/+0jP8BUWaK7WUZklTEIBFXQy//AlIp4Tz0krwYW650znhIxTqU3UVo/6G
	vat7dW0J0gMTpYXSp4cMmVREXTQxSzOzmQ5NZGABwINBmH8cTtLi4CJMoOyOfRT2RCxi7s
	Z32QdGSq6yNxYkGGg/X45DkRyfA9uVU=
Subject: [PATCH v3 2/4] x86/time: adjust time recording in
 time_calibration_tsc_rendezvous()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Claudemir Todo Bom <claudemir@todobom.com>, Ian Jackson <iwj@xenproject.org>
References: <bb7494b9-f4d1-f0c0-2fb2-5201559c1962@suse.com>
Message-ID: <834b2d29-2589-f2b7-b496-7f1b35d35cff@suse.com>
Date: Tue, 9 Feb 2021 13:55:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bb7494b9-f4d1-f0c0-2fb2-5201559c1962@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

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
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
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


