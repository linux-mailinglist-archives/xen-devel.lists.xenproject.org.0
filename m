Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BK3OEpzB2r03wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:26:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80066556C59
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310444.1581352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyAU-0006Tn-Fl; Fri, 15 May 2026 19:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310444.1581352; Fri, 15 May 2026 19:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyAU-0006NF-BM; Fri, 15 May 2026 19:25:54 +0000
Received: by outflank-mailman (input) for mailman id 1310444;
 Fri, 15 May 2026 19:25:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3EnIHagYKCWsbNJWSLPXXPUN.LXVgNW-MNeNUURbcb.gNWYaXSNLc.XaP@flex--seanjc.bounces.google.com>)
 id 1wNyAT-0006KA-It
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:25:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNyAS-001Io4-VT
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:25:52 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3EnIHagYKCWsbNJWSLPXXPUN.LXVgNW-MNeNUURbcb.gNWYaXSNLc.XaP@flex--seanjc.bounces.google.com>)
 id 6a07733e-bab6-0a2a0a5309dd-0a2a450a9760-6
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:25:52 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3EnIHagYKCWsbNJWSLPXXPUN.LXVgNW-MNeNUURbcb.gNWYaXSNLc.XaP@flex--seanjc.bounces.google.com>)
 id 6a077213-56b3-0a2a450a0019-d155d6caa87b-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:52 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2ba054e0304so10111925ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:20:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872850; x=1779477650; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HxeaHaxP6KnUzzL58lskoB535u+ahD+SqcMQMaRjbjY=;
        b=NTtCVGxyvgwDRv81Z7w9LdgVUcC/B2MFo0Jk785AlYXIIzbH7Os0GJKWW8qeHOEwN0
         /cT3h0BPB7t0UC/NwWv3yJ6d+r1iRfS444XHRzXtOEelLIF5us0DpVySkwf65GAQZH2Z
         mJo3MxCamWRR4FXps72k9PS7sqYI0ICcC10pavD3bn7D5T7DZSzEatBr7Txtw9pJqlNr
         6YaRptOt8jE6FTfcEiBhHbBGHj/yXqBKa/Hc66XihBrax+AKz2MhzvVfBdO5B37xcsbX
         gqZD2oLaGhPVbFnn2eiYo0ROkTmT4pK4+NgV9ERK92yJqUg1A02KCE/0tneSdtxjxFXW
         lslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872850; x=1779477650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxeaHaxP6KnUzzL58lskoB535u+ahD+SqcMQMaRjbjY=;
        b=DhbcQ40R86yB/c+hkH/liYLlfxzoy06PlLkuXuW7Z8GCLLjxN923mdzHZNkT35uSq4
         er8ix1YGw+w9QD6Q9nokooW/tuoyCVSAzqynESiESY8AMk5lpjI0jEmKWyyXZLR+is5/
         o6Pyt0r7UHQ41jJc58KtJSdvxgQhpvS2DhznzO27xjuNQvR3TZor59Y6g1b11qpncAMa
         j5BVbLcnWsyRG6jCbq1S10Ne3UuBLzCwVvNshIGyz96OZbXdfOq2mxAgHQd3deKznpFx
         +1g/Q8mF08QBuBSXYJCi+9Is1xp+mNxkfdBt6PW1VcPOXldUiGQsDSl45VhzfdB7UwSp
         kJlg==
X-Forwarded-Encrypted: i=1; AFNElJ+d4RVRlYjJo3ICfOrfYeDk50O92FP48EgjfbTwIUjOVpd+2IHlaPBVHDhmddaFUn05UjiVjmIgdH4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOgYS5pCFARTt2ocVHRX2nkAkPFPxRBQMIVoDzOT48elBmeH7Q
	G5aS4e5sCIx45YSEstcqPWUAzWZBJjWq399Oa2hmYqOxCekqGd6/0mIkD55raHCJfORLh/Gwl9q
	402FDcA==
X-Received: from plhl17.prod.google.com ([2002:a17:903:1211:b0:2ba:73fd:6d36])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:943:b0:2ba:5e99:93e8
 with SMTP id d9443c01a7336-2bd52b6d778mr87428535ad.29.1778872850277; Fri, 15
 May 2026 12:20:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:19 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-19-seanjc@google.com>
Subject: [PATCH v3 18/41] x86/paravirt: Pass sched_clock save/restore helpers
 during registration
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1778872852-7D1848B7-56E99130/0/0
X-purgate-type: clean
X-purgate-size: 5585
X-Rspamd-Queue-Id: 80066556C59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,redhat.com,broadcom.com,oracle.com,kernel.org,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de,amazon.co.uk];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kas@kernel.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,m:dwmw@amazon.co.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

Pass in a PV clock's save/restore helpers when configuring sched_clock
instead of relying on each PV clock to manually set the save/restore hooks.
In addition to bringing sanity to the code, this will allow gracefully
"rejecting" a PV sched_clock, e.g. when running as a CoCo guest that has
access to a "secure" TSC.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h       | 9 ++++++---
 arch/x86/kernel/cpu/vmware.c       | 7 ++-----
 arch/x86/kernel/kvmclock.c         | 6 +++---
 arch/x86/kernel/tsc.c              | 5 ++++-
 arch/x86/xen/time.c                | 5 ++---
 drivers/clocksource/hyperv_timer.c | 6 ++----
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index fe41d40a9ae6..e97cd1ae03d1 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -14,11 +14,14 @@ extern int no_timer_check;
 extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable);
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				void (*save)(void), void (*restore)(void));
 
-static inline void paravirt_set_sched_clock(u64 (*func)(void))
+static inline void paravirt_set_sched_clock(u64 (*func)(void),
+					    void (*save)(void),
+					    void (*restore)(void))
 {
-	__paravirt_set_sched_clock(func, true);
+	__paravirt_set_sched_clock(func, true, save, restore);
 }
 #endif
 
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index b5cb66ca022b..968de002975f 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -347,11 +347,8 @@ static void __init vmware_paravirt_ops_setup(void)
 
 	vmware_cyc2ns_setup();
 
-	if (vmw_sched_clock) {
-		paravirt_set_sched_clock(vmware_sched_clock);
-		x86_platform.save_sched_clock_state = NULL;
-		x86_platform.restore_sched_clock_state = NULL;
-	}
+	if (vmw_sched_clock)
+		paravirt_set_sched_clock(vmware_sched_clock, NULL, NULL);
 
 	if (vmware_is_stealclock_available()) {
 		has_steal_clock = true;
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 800c3d65f0af..962b6fcb5c60 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -137,7 +137,9 @@ static void kvm_restore_sched_clock_state(void)
 static inline void kvm_sched_clock_init(bool stable)
 {
 	kvm_sched_clock_offset = kvm_clock_read();
-	__paravirt_set_sched_clock(kvm_sched_clock_read, stable);
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
+				   kvm_save_sched_clock_state,
+				   kvm_restore_sched_clock_state);
 
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
@@ -344,8 +346,6 @@ void __init kvmclock_init(void)
 #ifdef CONFIG_SMP
 	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
 #endif
-	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
-	x86_platform.restore_sched_clock_state = kvm_restore_sched_clock_state;
 	kvm_get_preset_lpj();
 
 	/*
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index b14c4ada89a3..0114c63dfdd9 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,12 +280,15 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable)
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				void (*save)(void), void (*restore)(void))
 {
 	if (!stable)
 		clear_sched_clock_stable();
 
 	static_call_update(pv_sched_clock, func);
+	x86_platform.save_sched_clock_state = save;
+	x86_platform.restore_sched_clock_state = restore;
 }
 #else
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 21d366d01985..ee7095febfd1 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -567,13 +567,12 @@ static void __init xen_init_time_common(void)
 {
 	xen_sched_clock_offset = xen_clocksource_read();
 	static_call_update(pv_steal_clock, xen_steal_clock);
-	paravirt_set_sched_clock(xen_sched_clock);
+
 	/*
 	 * Xen has paravirtualized suspend/resume and so doesn't use the common
 	 * x86 sched_clock save/restore hooks.
 	 */
-	x86_platform.save_sched_clock_state = NULL;
-	x86_platform.restore_sched_clock_state = NULL;
+	paravirt_set_sched_clock(xen_sched_clock, NULL, NULL);
 
 	tsc_register_calibration_routines(xen_tsc_khz, NULL);
 	x86_platform.get_wallclock = xen_get_wallclock;
diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index ac1d9f9c381c..dee59ce61c29 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -553,10 +553,8 @@ static void hv_restore_sched_clock_state(void)
 static __always_inline void hv_setup_sched_clock(void *sched_clock)
 {
 	/* We're on x86/x64 *and* using PV ops */
-	paravirt_set_sched_clock(sched_clock);
-
-	x86_platform.save_sched_clock_state = hv_save_sched_clock_state;
-	x86_platform.restore_sched_clock_state = hv_restore_sched_clock_state;
+	paravirt_set_sched_clock(sched_clock, hv_save_sched_clock_state,
+				 hv_restore_sched_clock_state);
 }
 #else /* !CONFIG_GENERIC_SCHED_CLOCK && !CONFIG_PARAVIRT */
 static __always_inline void hv_setup_sched_clock(void *sched_clock) {}
-- 
2.54.0.563.g4f69b47b94-goog


