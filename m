Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68145314F8E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 13:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83225.154360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SZo-00088Y-91; Tue, 09 Feb 2021 12:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83225.154360; Tue, 09 Feb 2021 12:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SZo-000888-5O; Tue, 09 Feb 2021 12:57:08 +0000
Received: by outflank-mailman (input) for mailman id 83225;
 Tue, 09 Feb 2021 12:57:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9SZm-00087u-5T
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 12:57:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 279d4154-5031-449e-842b-7b4652fc68ce;
 Tue, 09 Feb 2021 12:57:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78800AF57;
 Tue,  9 Feb 2021 12:57:04 +0000 (UTC)
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
X-Inumbo-ID: 279d4154-5031-449e-842b-7b4652fc68ce
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612875424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FDe1jUzRfbbh7+YuIc5yGiZBwFURovh6CEvEftGqGYw=;
	b=S3/TWOADLqQR2nKGj5HFEPFdKZxPTyk+Xw+ZRLaMAKmUwrIaPIGXaD12RG9NWrB/qjwijr
	1A2IglhliX5W9ILvav41xKsxqTVOQK+Wv1k+GxMbTkF6ap5QpbfTum7eteNr8gYgaore8U
	rpN26Ghp/9Y896HOb3jD3i+5CPEBITQ=
Subject: [PATCH RFC v3 4/4] x86/time: re-arrange struct calibration_rendezvous
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bb7494b9-f4d1-f0c0-2fb2-5201559c1962@suse.com>
Message-ID: <56d70757-a887-6824-18f4-93b1f244e44b@suse.com>
Date: Tue, 9 Feb 2021 13:57:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bb7494b9-f4d1-f0c0-2fb2-5201559c1962@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

To reduce latency on time_calibration_tsc_rendezvous()'s last loop
iteration, separate fields written on the last iteration enough from the
crucial field read by all CPUs on the last iteration such that they end
up in distinct cache lines. Prefetch this field on an earlier iteration.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.
---
While readability would likely suffer, we may want to consider avoiding
the prefetch on at least the first two iterations (where the field still
gets / may get written to by CPU0). Could e.g. be

    switch ( i )
    {
    case 0:
        write_tsc(r->master_tsc_stamp);
        break;
    case 1:
        prefetch(&r->master_tsc_stamp);
        break;
    }

Of course it would also be nice to avoid the pretty likely branch
misprediction on the last iteration. But with the static prediction
hints having been rather short-lived in the architecture, I don't see
any good means to do so.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1655,10 +1655,20 @@ static void tsc_check_reliability(void)
  * All CPUS snapshot their local TSC and extrapolation of system time.
  */
 struct calibration_rendezvous {
-    cpumask_t cpu_calibration_map;
     atomic_t semaphore;
     s_time_t master_stime;
-    uint64_t master_tsc_stamp, max_tsc_stamp;
+    cpumask_t cpu_calibration_map;
+    /*
+     * All CPUs want to read master_tsc_stamp on the last iteration.  If
+     * cpu_calibration_map isn't large enough to push the field into a cache
+     * line different from the one used by semaphore (written by all CPUs on
+     * every iteration) and master_stime (written by CPU0 on the last
+     * iteration), align the field suitably.
+     */
+    uint64_t __aligned(BITS_TO_LONGS(NR_CPUS) * sizeof(long) +
+                       sizeof(atomic_t) + sizeof(s_time_t) < SMP_CACHE_BYTES
+                       ? SMP_CACHE_BYTES : 1) master_tsc_stamp;
+    uint64_t max_tsc_stamp;
 };
 
 static void
@@ -1709,6 +1719,8 @@ static void time_calibration_tsc_rendezv
 
             if ( i == 0 )
                 write_tsc(r->master_tsc_stamp);
+            else
+                prefetch(&r->master_tsc_stamp);
 
             while ( atomic_read(&r->semaphore) != (2*total_cpus - 1) )
                 cpu_relax();
@@ -1731,6 +1743,8 @@ static void time_calibration_tsc_rendezv
 
             if ( i == 0 )
                 write_tsc(r->master_tsc_stamp);
+            else
+                prefetch(&r->master_tsc_stamp);
 
             atomic_inc(&r->semaphore);
             while ( atomic_read(&r->semaphore) > total_cpus )


