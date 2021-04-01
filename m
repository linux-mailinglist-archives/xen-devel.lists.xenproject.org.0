Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FDE3512C3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104261.199209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRu1h-0006P1-0i; Thu, 01 Apr 2021 09:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104261.199209; Thu, 01 Apr 2021 09:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRu1g-0006Of-Ti; Thu, 01 Apr 2021 09:54:08 +0000
Received: by outflank-mailman (input) for mailman id 104261;
 Thu, 01 Apr 2021 09:54:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRu1f-0006OW-C9
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:54:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad03d872-721a-4051-970f-b25f37750982;
 Thu, 01 Apr 2021 09:54:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7811AEA6;
 Thu,  1 Apr 2021 09:54:05 +0000 (UTC)
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
X-Inumbo-ID: ad03d872-721a-4051-970f-b25f37750982
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617270845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SRJupnLGMfszPfCGs6C2rPqjAEwXFCBQV3qorCClVzA=;
	b=KCAosS6xkauPgkpAGntfN1NQ3BkhEk3qijzYbYAZnEbC7f6X0J7Ha8TA8wzqnBu3ZlsSDI
	XPrD3il53j+BooEb/LRJjyocRLj/IWdCkcrRRX3pxADC3B/dQYoQLega5hbh/TzrZOrJJ4
	chJ5IgF8SfqgmfG34j4jFu9H7XkVVOM=
Subject: [PATCH v4 1/3] x86/time: latch to-be-written TSC value early in
 rendezvous loop
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
Message-ID: <35bbad56-d0f0-a37d-674c-e635eaf9c94c@suse.com>
Date: Thu, 1 Apr 2021 11:54:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

To reduce latency on time_calibration_tsc_rendezvous()'s last loop
iteration, read the value to be written on the last iteration at the end
of the loop body (i.e. in particular at the end of the second to last
iteration).

On my single-socket 18-core Skylake system this reduces the average loop
exit time on CPU0 (from the TSC write on the last iteration to until
after the main loop) from around 32k cycles to around 29k (albeit the
values measured on separate runs vary quite significantly).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Different approach.
v3: New.
---
Of course it would also be nice to avoid the pretty likely branch
misprediction on the last iteration. But with the static prediction
hints having been rather short-lived in the architecture, I don't see
any good means to do so.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1683,7 +1683,7 @@ static void time_calibration_tsc_rendezv
     int i;
     struct calibration_rendezvous *r = _r;
     unsigned int total_cpus = cpumask_weight(&r->cpu_calibration_map);
-    uint64_t tsc = 0;
+    uint64_t tsc = 0, master_tsc = 0;
 
     /* Loop to get rid of cache effects on TSC skew. */
     for ( i = 4; i >= 0; i-- )
@@ -1708,7 +1708,7 @@ static void time_calibration_tsc_rendezv
             atomic_inc(&r->semaphore);
 
             if ( i == 0 )
-                write_tsc(r->master_tsc_stamp);
+                write_tsc(master_tsc);
 
             while ( atomic_read(&r->semaphore) != (2*total_cpus - 1) )
                 cpu_relax();
@@ -1730,7 +1730,7 @@ static void time_calibration_tsc_rendezv
             }
 
             if ( i == 0 )
-                write_tsc(r->master_tsc_stamp);
+                write_tsc(master_tsc);
 
             atomic_inc(&r->semaphore);
             while ( atomic_read(&r->semaphore) > total_cpus )
@@ -1739,9 +1739,17 @@ static void time_calibration_tsc_rendezv
 
         /* Just in case a read above ended up reading zero. */
         tsc += !tsc;
+
+        /*
+         * To reduce latency of the TSC write on the last iteration,
+         * fetch the value to be written into a local variable. To avoid
+         * introducing yet another conditional branch (which the CPU may
+         * have difficulty predicting well) do this on all iterations.
+         */
+        master_tsc = r->master_tsc_stamp;
     }
 
-    time_calibration_rendezvous_tail(r, tsc, r->master_tsc_stamp);
+    time_calibration_rendezvous_tail(r, tsc, master_tsc);
 }
 
 /* Ordinary rendezvous function which does not modify TSC values. */


