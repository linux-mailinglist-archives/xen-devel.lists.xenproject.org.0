Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO2HNzBzB2pZ4AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:25:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF1556C43
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310386.1581319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyA2-0003nf-K6; Fri, 15 May 2026 19:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310386.1581319; Fri, 15 May 2026 19:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyA2-0003kG-D5; Fri, 15 May 2026 19:25:26 +0000
Received: by outflank-mailman (input) for mailman id 1310386;
 Fri, 15 May 2026 19:25:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3MHIHagYKCYk5rn0wpt11tyr.p1zAr0-qr8ryyv565.Ar0241wrp6.14t@flex--seanjc.bounces.google.com>)
 id 1wNyA0-0003bh-Du
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:25:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy9z-001IhQ-QF
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:25:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3MHIHagYKCYk5rn0wpt11tyr.p1zAr0-qr8ryyv565.Ar0241wrp6.14t@flex--seanjc.bounces.google.com>)
 id 6a0772b6-bab6-0a2a0a5309dd-0a2a4505e824-30
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:25:23 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3MHIHagYKCYk5rn0wpt11tyr.p1zAr0-qr8ryyv565.Ar0241wrp6.14t@flex--seanjc.bounces.google.com>)
 id 6a077231-aaa8-0a2a45050019-d155d2caec93-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:21:23 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-83ef22f8e8bso177177b3a.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:21:22 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872881; x=1779477681; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rGCW9kF5gS8wHa+YnUvDY3DL62KvWmhRkotZ7eduTfw=;
        b=GsR+04cvbRlBhziiw8jqNxR98tTcwQIJHhEEoK5+uJrZ+PqD0zm7Vp5/+n9oP1aKix
         YG+8eCanHgG8BKl6CfvjaGXQJ5W1CfL8lFKuJrF6Z0bai67spIbE98X1IN2xw8CUcw2R
         VcocUIaLd0X32x7+P7XGBB75vASngjbqzylvxKiq3o+P04hluG2scGC/bEa4lQO6wnEY
         jOf4UC9dPB51Kt7RchgykcHuN1C8bN+NSg0yM/7rvsR60OFl/3B6USf9aXeN8FALI5/E
         XRtYcnRJcv8Az+B6vytymcSykdr5eNYXVGbMYjVuT2swImK8LGFDKSq4oY5tMiVEgbfO
         zdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872881; x=1779477681;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGCW9kF5gS8wHa+YnUvDY3DL62KvWmhRkotZ7eduTfw=;
        b=BOSpU+FQVxSB5L5aeKHeYq3LxEI9gzvWGC9BJBqWZjTcSl/tTx6syLyvrthogkF717
         OyUuQZzRg9GqODXFf8IFPwRtSIR7qVB22CuA+i4/vI9llj1XFXeTx0/kGk8YzW6rbsvc
         fP6FbYVPs/dFu2mg3KJhw6cIN9vxedhWFRv7zLK3CzoIaI5L9zJ2Io3kQFedVrYntZIr
         Rk1yTdMpgrTpPAjs8cMgAe6ks63lifBfpEoxzTKTqdZTAus0xVMZKr1d9fY4DjSgh6mh
         1Gp4oqM3M8puJZkoq1w5CVwpcFAvnvS31LgcWMK6fDQDbWWram6oeeJ6JdpbTdCSl3EX
         aZiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cMMO303UZg2RAnA1l/Cz6sq1uRqUjr99BrPql16Ogxwl2hrL0K4nsDl6jySOqP94xYYGwTqxqzvU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsL5X307ZnFUFCBJKbmMBA2QGfVSb68D6yYbBuYcmO1bYhAn+4
	ajzr8vO5IUbwUMTn0/j/Ys4U0vrZkUaJMH998OxGuKWDbsMYwrZ9PiO+gi+Qd1A2ipYbGD+PMgG
	02oXv5Q==
X-Received: from pfkq14.prod.google.com ([2002:a05:6a00:84e:b0:839:4a33:c354])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:12e4:b0:835:405a:7e68
 with SMTP id d2e1a72fcca58-83f33d9dd83mr5938852b3a.32.1778872880815; Fri, 15
 May 2026 12:21:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:39 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-39-seanjc@google.com>
Subject: [PATCH v3 38/41] x86/paravirt: kvmclock: Setup kvmclock early iff
 it's sched_clock
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
X-purgate-ID: tlsNG-c201ff/1778872883-D9D77443-5B95A635/0/0
X-purgate-type: clean
X-purgate-size: 6218
X-Rspamd-Queue-Id: 95AF1556C43
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

Rework the seemingly generic x86_cpuinit_ops.early_percpu_clock_init hook
into a dedicated PV sched_clock hook, as the only reason the hook exists
is to allow kvmclock to enable its PV clock on secondary CPUs before the
kernel tries to reference sched_clock, e.g. when grabbing a timestamp for
printk.

Rearranging the hook doesn't exactly reduce complexity; arguably it does
the opposite.  But as-is, it's practically impossible to understand *why*
kvmclock needs to do early configuration.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h    |  8 ++++++--
 arch/x86/include/asm/x86_init.h |  2 --
 arch/x86/kernel/kvmclock.c      | 13 ++++++-------
 arch/x86/kernel/smpboot.c       |  3 ++-
 arch/x86/kernel/tsc.c           | 16 +++++++++++++++-
 arch/x86/kernel/x86_init.c      |  1 -
 6 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index ca5c95d48c03..ab1271bd9c3b 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -15,14 +15,18 @@ extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				      void (*save)(void), void (*restore)(void));
+				      void (*save)(void), void (*restore)(void),
+				      void (*start_secondary));
 
 static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
 						     void (*save)(void),
 						     void (*restore)(void))
 {
-	(void)__paravirt_set_sched_clock(func, true, save, restore);
+	(void)__paravirt_set_sched_clock(func, true, save, restore, NULL);
 }
+void paravirt_sched_clock_start_secondary(void);
+#else
+static inline void paravirt_sched_clock_start_secondary(void) { }
 #endif
 
 /*
diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
index 6c8a6ead84f6..d1b3f18ea41f 100644
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -187,13 +187,11 @@ struct x86_init_ops {
 /**
  * struct x86_cpuinit_ops - platform specific cpu hotplug setups
  * @setup_percpu_clockev:	set up the per cpu clock event device
- * @early_percpu_clock_init:	early init of the per cpu clock event device
  * @fixup_cpu_id:		fixup function for cpuinfo_x86::topo.pkg_id
  * @parallel_bringup:		Parallel bringup control
  */
 struct x86_cpuinit_ops {
 	void (*setup_percpu_clockev)(void);
-	void (*early_percpu_clock_init)(void);
 	void (*fixup_cpu_id)(struct cpuinfo_x86 *c, int node);
 	bool parallel_bringup;
 };
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 0578bc448b1b..62c8ea2e6769 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -127,12 +127,13 @@ static void kvm_save_sched_clock_state(void)
 	kvmclock_disable();
 }
 
-#ifdef CONFIG_SMP
-static void kvm_setup_secondary_clock(void)
+static void kvm_setup_secondary_sched_clock(void)
 {
+	if (WARN_ON_ONCE(!IS_ENABLED(CONFIG_SMP)))
+		return;
+
 	kvm_register_clock("secondary cpu, sched_clock setup");
 }
-#endif
 
 static void kvm_restore_sched_clock_state(void)
 {
@@ -352,7 +353,8 @@ static __init void kvm_sched_clock_init(bool stable)
 {
 	if (__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
 				       kvm_save_sched_clock_state,
-				       kvm_restore_sched_clock_state))
+				       kvm_restore_sched_clock_state,
+				       kvm_setup_secondary_sched_clock))
 		return;
 
 	kvm_sched_clock_offset = kvm_clock_read();
@@ -437,9 +439,6 @@ void __init kvmclock_init(void)
 
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
-#ifdef CONFIG_SMP
-	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
-#endif
 	kvm_get_preset_lpj();
 
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 294a8ea60298..318ae70e5e7b 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -78,6 +78,7 @@
 #include <asm/io_apic.h>
 #include <asm/fpu/api.h>
 #include <asm/setup.h>
+#include <asm/timer.h>
 #include <asm/uv/uv.h>
 #include <asm/microcode.h>
 #include <asm/i8259.h>
@@ -275,7 +276,7 @@ static void notrace __noendbr start_secondary(void *unused)
 	cpu_init();
 	fpu__init_cpu();
 	rcutree_report_cpu_starting(raw_smp_processor_id());
-	x86_cpuinit.early_percpu_clock_init();
+	paravirt_sched_clock_start_secondary();
 
 	ap_starting();
 
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 7a261214fa3e..f78e86494dec 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,8 +280,19 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
+#ifdef CONFIG_SMP
+static void (*pv_sched_clock_start_secondary)(void) __ro_after_init;
+
+void paravirt_sched_clock_start_secondary(void)
+{
+	if (pv_sched_clock_start_secondary)
+		pv_sched_clock_start_secondary();
+}
+#endif
+
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				      void (*save)(void), void (*restore)(void))
+				      void (*save)(void), void (*restore)(void),
+				      void (*start_secondary))
 {
 	/*
 	 * Don't replace TSC with a PV clock when running as a CoCo guest and
@@ -298,6 +309,9 @@ int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 	static_call_update(pv_sched_clock, func);
 	x86_platform.save_sched_clock_state = save;
 	x86_platform.restore_sched_clock_state = restore;
+#ifdef CONFIG_SMP
+	pv_sched_clock_start_secondary = start_secondary;
+#endif
 	return 0;
 }
 #else
diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
index ebefb77c37bb..cbb5ee613ed5 100644
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@ -128,7 +128,6 @@ struct x86_init_ops x86_init __initdata = {
 };
 
 struct x86_cpuinit_ops x86_cpuinit = {
-	.early_percpu_clock_init	= x86_init_noop,
 	.setup_percpu_clockev		= setup_secondary_APIC_clock,
 	.parallel_bringup		= true,
 };
-- 
2.54.0.563.g4f69b47b94-goog


