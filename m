Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5F9314F87
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 13:54:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83220.154309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SXb-0007er-Tf; Tue, 09 Feb 2021 12:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83220.154309; Tue, 09 Feb 2021 12:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SXb-0007eS-QF; Tue, 09 Feb 2021 12:54:51 +0000
Received: by outflank-mailman (input) for mailman id 83220;
 Tue, 09 Feb 2021 12:54:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9SXZ-0007eK-TA
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 12:54:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eecf05fe-8a00-45f6-9f2a-56b6d6230b69;
 Tue, 09 Feb 2021 12:54:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D3C5ADCD;
 Tue,  9 Feb 2021 12:54:48 +0000 (UTC)
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
X-Inumbo-ID: eecf05fe-8a00-45f6-9f2a-56b6d6230b69
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612875288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ssL8YomSClhyIfhNV+3oRLDdbnJ7jLRwXkJQuCwirWw=;
	b=qNDMd4ahTwY5I4S9mSOMEuccQJ8Gk5viheOJrJQalud4LoxASbLpCRcJGfUAvctw0qZd9f
	Rb2t6qBqzt/Fw7SRHEujmDIiUFSF+eXfwjwAdvL+TwtjV8i4BKwfofD5uROmXVqlNred8S
	3jNDj/VTmQ/OqN7lQ+iqRAcAktY4VHk=
Subject: [PATCH v3 1/4] x86/time: change initiation of the calibration timer
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Claudemir Todo Bom <claudemir@todobom.com>, Ian Jackson <iwj@xenproject.org>
References: <bb7494b9-f4d1-f0c0-2fb2-5201559c1962@suse.com>
Message-ID: <9068daae-0f27-a724-5062-c02e5ebb4593@suse.com>
Date: Tue, 9 Feb 2021 13:54:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bb7494b9-f4d1-f0c0-2fb2-5201559c1962@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Setting the timer a second (EPOCH) into the future at a random point
during boot (prior to bringing up APs and prior to launching Dom0) does
not yield predictable results: The timer may expire while we're still
bringing up APs (too early) or when Dom0 already boots (too late).
Instead invoke the timer handler function explicitly at a predictable
point in time, once we've established the rendezvous function to use
(and hence also once all APs are online). This will, through the raising
and handling of TIMER_SOFTIRQ, then also have the effect of arming the
timer.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -854,9 +854,7 @@ static void resume_platform_timer(void)
 
 static void __init reset_platform_timer(void)
 {
-    /* Deactivate any timers running */
     kill_timer(&plt_overflow_timer);
-    kill_timer(&calibration_timer);
 
     /* Reset counters and stamps */
     spin_lock_irq(&platform_timer_lock);
@@ -1956,19 +1954,13 @@ static void __init reset_percpu_time(voi
     t->stamp.master_stime = t->stamp.local_stime;
 }
 
-static void __init try_platform_timer_tail(bool late)
+static void __init try_platform_timer_tail(void)
 {
     init_timer(&plt_overflow_timer, plt_overflow, NULL, 0);
     plt_overflow(NULL);
 
     platform_timer_stamp = plt_stamp64;
     stime_platform_stamp = NOW();
-
-    if ( !late )
-        init_percpu_time();
-
-    init_timer(&calibration_timer, time_calibration, NULL, 0);
-    set_timer(&calibration_timer, NOW() + EPOCH);
 }
 
 /* Late init function, after all cpus have booted */
@@ -2009,10 +2001,13 @@ static int __init verify_tsc_reliability
             time_calibration_rendezvous_fn = time_calibration_nop_rendezvous;
 
             /* Finish platform timer switch. */
-            try_platform_timer_tail(true);
+            try_platform_timer_tail();
 
             printk("Switched to Platform timer %s TSC\n",
                    freq_string(plt_src.frequency));
+
+            time_calibration(NULL);
+
             return 0;
         }
     }
@@ -2033,6 +2028,8 @@ static int __init verify_tsc_reliability
          !boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
         time_calibration_rendezvous_fn = time_calibration_tsc_rendezvous;
 
+    time_calibration(NULL);
+
     return 0;
 }
 __initcall(verify_tsc_reliability);
@@ -2048,7 +2045,11 @@ int __init init_xen_time(void)
     do_settime(get_wallclock_time(), 0, NOW());
 
     /* Finish platform timer initialization. */
-    try_platform_timer_tail(false);
+    try_platform_timer_tail();
+
+    init_percpu_time();
+
+    init_timer(&calibration_timer, time_calibration, NULL, 0);
 
     /*
      * Setup space to track per-socket TSC_ADJUST values. Don't fiddle with


