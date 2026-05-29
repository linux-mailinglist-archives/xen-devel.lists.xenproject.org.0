Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOSALgutGWpyyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:13:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFEF6045EA
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322544.1588855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSytV-0007kE-Hi; Fri, 29 May 2026 15:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322544.1588855; Fri, 29 May 2026 15:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSytV-0007h5-Ek; Fri, 29 May 2026 15:13:05 +0000
Received: by outflank-mailman (input) for mailman id 1322544;
 Fri, 29 May 2026 15:13:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <30KsZagYKCeUZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 1wSytT-0007cq-8V
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:13:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSytS-0013Ij-LU
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:13:02 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <30KsZagYKCeUZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 6a19ace8-e002-0a2a0a5209dd-0a2a450a9c04-28
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:13:02 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <30KsZagYKCeUZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 6a19abd0-56b3-0a2a450a0019-d155d6c9c88d-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:08:02 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2bc6899bfb1so152290565ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:08:01 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780067280; x=1780672080; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=x48EAn3xKSGkzUgWryz9swjOD88igI5uWtnxtPJbQF4=;
        b=UioIvxfrEIAx54TbwdDEuuuOPe3KEqMT8ox4nqVvvBqet91k2yZNy2JJ7H0kTpnUGe
         PVSgM1+2943wlIAIX+dDwzRtE8X4zEwkx66rixMjz57fKDr+8J/CK5OVrE7Y2agTuPBu
         N4NITzUDc6d8kTw+E2TkOuATJ0ldGR1r7R2Q4cxL79rxabS1f8wulOfXR1SyZ3DZdTwq
         cloDeiA7NdZcs+HveqfbdkDz1Txj96lXSjNUdGvfUbzLov06VhNDOFuxhsDMAr+wKfah
         n+AlnAfnqt9IiY+BVjPByeEsib90dSEaaMmlB110cOxB2H33IMVjhZpo+BYP/1Urt9U7
         e/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067280; x=1780672080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x48EAn3xKSGkzUgWryz9swjOD88igI5uWtnxtPJbQF4=;
        b=I3vwTb+hHiUAXuTiBUb1fDj7fjexPKcFEwQAMCFLTu57S6A/OJJpopkLPzB8q/sGEK
         usretsrjDxVcDjm8d199UsMiLRjknKWFbVMXQErFXYnHu4ba/oA/ncyslVFz3AP1jHgq
         oYAvtUuiOqJPWFEnTCB4Fd5zC43443OmPWOATkdWaLxiB+mgHxQoOCmNkwx1yA3v8zO2
         84d6GkSzi0T3MwrLQ5ijv41n2bMqzr6E/MFIADYQD6xeU2O9f4hjukCMfl/z767gJNrw
         NrWvZUzfie0pKTvi/p1A8KuScX+gnHWF2dLuDLK++dFnF8ZpqkMwsLZcNbYDxtXHzPTL
         T8qQ==
X-Forwarded-Encrypted: i=1; AFNElJ9g3bgbJ88TqSgEbhnyFRWGaN0iEK2FaxOoOoZKQpXijH42A+4gKNToCtTTqZDQzfWxW2oSmSojmXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnoLc0rHhBhSIrp5Tr0J5+9mFSWwt/BjJFXJn8E1j+cLNHqgLh
	o/SKGwremugFLhljLvwmYzvt3ES+5Vp6hNVDqPUdOuxJrixn/4gHrGT3KtvghouyuF940vij5by
	P9szv4A==
X-Received: from plbkk16.prod.google.com ([2002:a17:903:710:b0:2b4:62bc:c2a9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:903:b0:2bf:2e9:bd6d
 with SMTP id d9443c01a7336-2bf367be098mr3118615ad.12.1780067280044; Fri, 29
 May 2026 08:08:00 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:07:58 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150758.714420-1-seanjc@google.com>
Subject: [PATCH v4 33/47] x86/paravirt: Pass sched_clock save/restore helpers
 during registration
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1780067282-73F798B7-162069EE/13/0
X-purgate-type: clean
X-purgate-size: 5715
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
	FREEMAIL_CC(0.00)[zytor.com,intel.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amazon.co.uk,amd.com,infradead.org,outlook.com,linutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:dwmw@amazon.co.uk,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw2@infradead.org,m:mhklinux@outlook.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amazon.co.uk:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 3EFEF6045EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pass in a PV clock's save/restore helpers when configuring sched_clock
instead of relying on each PV clock to manually set the save/restore hooks.
In addition to bringing sanity to the code, this will allow gracefully
"rejecting" a PV sched_clock, e.g. when running as a CoCo guest that has
access to a "secure" TSC.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h       | 9 ++++++---
 arch/x86/kernel/cpu/vmware.c       | 8 +++-----
 arch/x86/kernel/kvmclock.c         | 6 +++---
 arch/x86/kernel/tsc.c              | 5 ++++-
 arch/x86/xen/time.c                | 5 ++---
 drivers/clocksource/hyperv_timer.c | 6 ++----
 6 files changed, 20 insertions(+), 19 deletions(-)

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
index 051ef89029a7..f3ffc05c7c53 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -347,11 +347,9 @@ static void __init vmware_paravirt_ops_setup(void)
 
 	vmware_cyc2ns_setup();
 
-	if (vmw_sched_clock) {
-		paravirt_set_sched_clock(vmware_sched_clock);
-		x86_platform.save_sched_clock_state = x86_init_noop;
-		x86_platform.restore_sched_clock_state = x86_init_noop;
-	}
+	if (vmw_sched_clock)
+		paravirt_set_sched_clock(vmware_sched_clock,
+					 x86_init_noop, x86_init_noop);
 
 	if (vmware_is_stealclock_available()) {
 		has_steal_clock = true;
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 0d4f2cf97246..05bca2be0df3 100644
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
@@ -345,8 +347,6 @@ void __init kvmclock_init(bool prefer_tsc)
 #ifdef CONFIG_SMP
 	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
 #endif
-	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
-	x86_platform.restore_sched_clock_state = kvm_restore_sched_clock_state;
 	kvm_get_preset_lpj();
 
 	/*
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 19da1a3d2126..7fbcfc2efd1d 100644
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
index 640b71d22d97..91ef83b1e540 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -577,13 +577,12 @@ static void __init xen_init_time_common(void)
 {
 	xen_sched_clock_offset = xen_clocksource_read();
 	static_call_update(pv_steal_clock, xen_steal_clock);
-	paravirt_set_sched_clock(xen_sched_clock);
+
 	/*
 	 * Xen has paravirtualized suspend/resume and so doesn't use the common
 	 * x86 sched_clock save/restore hooks.
 	 */
-	x86_platform.save_sched_clock_state = x86_init_noop;
-	x86_platform.restore_sched_clock_state = x86_init_noop;
+	paravirt_set_sched_clock(xen_sched_clock, x86_init_noop, x86_init_noop);
 
 	x86_init.hyper.get_tsc_khz = xen_tsc_khz;
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
2.54.0.823.g6e5bcc1fc9-goog


