Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0E9A472A1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897611.1306342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbn-0007SL-Oo; Thu, 27 Feb 2025 02:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897611.1306342; Thu, 27 Feb 2025 02:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbn-0007QW-KL; Thu, 27 Feb 2025 02:26:43 +0000
Received: by outflank-mailman (input) for mailman id 897611;
 Thu, 27 Feb 2025 02:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/a/g=VS=flex--seanjc.bounces.google.com=3xcu_ZwYKCaASEANJCGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@srs-se1.protection.inumbo.net>)
 id 1tnTVB-0005qU-GT
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:53 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 529c7166-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:51 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc0bc05afdso1130504a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:51 -0800 (PST)
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
X-Inumbo-ID: 529c7166-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622790; x=1741227590; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=QzXAit3+eiuwe2E434PEIcPVDj3bfcCBW02+u03qap4=;
        b=jOs9cCCVzGV/8vYkXZYZYFtS7XhUN5G9gvf0y2CpkxdjepZ+8zvrKbymut8LypWtaU
         WMAOvlpysiX2wiUraFjYLAEqcZYlbunKQ2bPBv483AZdPHJKdoTwiCoM8hfK6eCDY0KC
         w4+d4pVT29XYoEe/L9B+nCORBfZSERsqDnPNk/lnhx8O7aAy68MC1FxFuVFlRtYsMvFo
         B0mVe2Zzmsn3OK5XPIeADmWco6CwppLoG56VNUgRt0LC2ZLRAOVfLvh0aW72nRSFvomV
         oUG3er57sTQkaL0vJScxfBNh9ZTu7Vb9+ioEP/lWFb9SIFdKm1jpkeVlL/2g5GOhLCYe
         whSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622790; x=1741227590;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzXAit3+eiuwe2E434PEIcPVDj3bfcCBW02+u03qap4=;
        b=EwMqwS7tUbCo/A4A58kiqF5+yId9prBY3sEZk0BoLM95sVlYmraYIaCKtXWQ6wxbxi
         GgNwETnb3TIaZdREC1GvvcmUUDUHStTb5fDQVTO+KJKctC39m18f0xlZ7+IdWHkuQk5t
         5SSA0dEWeGzkSe0xx7KRo0qcp/KD8iQHKKFOC+YWkWWQIeUkIAbDpQXKvBjqScFkejV1
         HqO3nlu/p/AyySNylfyztxuUBSvtOBYPsQAijsv4sK6V+lV2V3BKdzGpkKKXuuzWdlJ9
         g0iaPO3ucx20EgTVu1eR22pbhH7h73+gHtAc/GwWc5eNRq1D01pprkDQjJbBTyaagPWG
         n1CA==
X-Forwarded-Encrypted: i=1; AJvYcCXjiwdj8EQxFMjGCQ9F/mf/eNO+PWFhNlyNLUEMwHFfU94yNagywog+NdT+RoV0XuVB8JD+ozy5YDw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPkgf+2+SRhFU1KcrULSdFrccPLyqoJQOadrG7aCdbrXVZNg9R
	TFUiY4Z7wws0X/lfxHewpnx7kALO0QFgZWvi9k7BNtqOa7g7I30BLD1oYT9x9ZtW9gwBb+KF4j7
	plA==
X-Google-Smtp-Source: AGHT+IEy19UXAGhpZ6BooyEkiFGbgvHpy57ZvxRHzoGzPaLhW9PSe6CovWEb42HIAZDNRdCcii7axkfnXfc=
X-Received: from pjbsh13.prod.google.com ([2002:a17:90b:524d:b0:2ee:53fe:d0fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5385:b0:2f5:63a:449c
 with SMTP id 98e67ed59e1d1-2fe68cf4000mr14888818a91.28.1740622789852; Wed, 26
 Feb 2025 18:19:49 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:43 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-28-seanjc@google.com>
Subject: [PATCH v2 27/38] x86/kvmclock: Enable kvmclock on APs during onlining
 if kvmclock isn't sched_clock
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"

In anticipation of making x86_cpuinit.early_percpu_clock_init(), i.e.
kvm_setup_secondary_clock(), a dedicated sched_clock hook that will be
invoked if and only if kvmclock is set as sched_clock, ensure APs enable
their kvmclock during CPU online.  While a redundant write to the MSR is
technically ok, skip the registration when kvmclock is sched_clock so that
it's somewhat obvious that kvmclock *needs* to be enabled during early
bringup when it's being used as sched_clock.

Plumb in the BSP's resume path purely for documentation purposes.  Both
KVM (as-a-guest) and timekeeping/clocksource hook syscore_ops, and it's
not super obvious that using KVM's hooks would be flawed.  E.g. it would
work today, because KVM's hooks happen to run after/before timekeeping's
hooks during suspend/resume, but that's sheer dumb luck as the order in
which syscore_ops are invoked depends entirely on when a subsystem is
initialized and thus registers its hooks.

Opportunsitically make the registration messages more precise to help
debug issues where kvmclock is enabled too late.

Opportunstically WARN in kvmclock_{suspend,resume}() to harden against
future bugs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_para.h |  2 ++
 arch/x86/kernel/kvm.c           | 24 +++++++++++-------
 arch/x86/kernel/kvmclock.c      | 44 +++++++++++++++++++++++++++------
 3 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/kvm_para.h b/arch/x86/include/asm/kvm_para.h
index 8708598f5b8e..42d90bf8fde9 100644
--- a/arch/x86/include/asm/kvm_para.h
+++ b/arch/x86/include/asm/kvm_para.h
@@ -120,6 +120,8 @@ static inline long kvm_sev_hypercall3(unsigned int nr, unsigned long p1,
 #ifdef CONFIG_KVM_GUEST
 enum kvm_guest_cpu_action {
 	KVM_GUEST_BSP_SUSPEND,
+	KVM_GUEST_BSP_RESUME,
+	KVM_GUEST_AP_ONLINE,
 	KVM_GUEST_AP_OFFLINE,
 	KVM_GUEST_SHUTDOWN,
 };
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 866b061ee0d9..5f093190df17 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -461,18 +461,24 @@ static void kvm_guest_cpu_offline(enum kvm_guest_cpu_action action)
 	kvmclock_cpu_action(action);
 }
 
+static int __kvm_cpu_online(unsigned int cpu, enum kvm_guest_cpu_action action)
+{
+	unsigned long flags;
+
+	local_irq_save(flags);
+	kvmclock_cpu_action(action);
+	kvm_guest_cpu_init();
+	local_irq_restore(flags);
+	return 0;
+}
+
+#ifdef CONFIG_SMP
+
 static int kvm_cpu_online(unsigned int cpu)
 {
-	unsigned long flags;
-
-	local_irq_save(flags);
-	kvm_guest_cpu_init();
-	local_irq_restore(flags);
-	return 0;
+	return __kvm_cpu_online(cpu, KVM_GUEST_AP_ONLINE);
 }
 
-#ifdef CONFIG_SMP
-
 static DEFINE_PER_CPU(cpumask_var_t, __pv_cpu_mask);
 
 static bool pv_tlb_flush_supported(void)
@@ -737,7 +743,7 @@ static int kvm_suspend(void)
 
 static void kvm_resume(void)
 {
-	kvm_cpu_online(raw_smp_processor_id());
+	__kvm_cpu_online(raw_smp_processor_id(), KVM_GUEST_BSP_RESUME);
 
 #ifdef CONFIG_ARCH_CPUIDLE_HALTPOLL
 	if (kvm_para_has_feature(KVM_FEATURE_POLL_CONTROL) && has_guest_poll)
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 0ce23f862cbd..76884dfc77f4 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -52,6 +52,7 @@ static struct pvclock_vsyscall_time_info *hvclock_mem;
 DEFINE_PER_CPU(struct pvclock_vsyscall_time_info *, hv_clock_per_cpu);
 EXPORT_PER_CPU_SYMBOL_GPL(hv_clock_per_cpu);
 
+static bool kvmclock_is_sched_clock;
 static bool kvmclock_suspended;
 
 /*
@@ -128,7 +129,7 @@ static void kvm_save_sched_clock_state(void)
 #ifdef CONFIG_SMP
 static void kvm_setup_secondary_clock(void)
 {
-	kvm_register_clock("secondary cpu clock");
+	kvm_register_clock("secondary cpu, sched_clock setup");
 }
 #endif
 
@@ -140,25 +141,51 @@ static void kvm_restore_sched_clock_state(void)
 
 static void kvmclock_suspend(struct clocksource *cs)
 {
+	if (WARN_ON_ONCE(kvmclock_is_sched_clock))
+		return;
+
 	kvmclock_suspended = true;
 	kvmclock_disable();
 }
 
 static void kvmclock_resume(struct clocksource *cs)
 {
+	if (WARN_ON_ONCE(kvmclock_is_sched_clock))
+		return;
+
 	kvmclock_suspended = false;
 	kvm_register_clock("primary cpu, clocksource resume");
 }
 
 void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
 {
-	/*
-	 * Don't disable kvmclock on the BSP during suspend.  If kvmclock is
-	 * being used for sched_clock, then it needs to be kept alive until the
-	 * last minute, and restored as quickly as possible after resume.
-	 */
-	if (action != KVM_GUEST_BSP_SUSPEND)
+	switch (action) {
+		/*
+		 * The BSP's clock is managed via clocksource suspend/resume,
+		 * to ensure it's enabled/disabled when timekeeping needs it
+		 * to be, e.g. before reading wallclock (which uses kvmclock).
+		 */
+	case KVM_GUEST_BSP_SUSPEND:
+	case KVM_GUEST_BSP_RESUME:
+		break;
+	case KVM_GUEST_AP_ONLINE:
+		/*
+		 * Secondary CPUs use dedicated sched_clock hooks to enable
+		 * kvmclock early during bringup, there's nothing to be done
+		 * when during CPU online.
+		 */
+		if (kvmclock_is_sched_clock)
+			break;
+		kvm_register_clock("secondary cpu, online");
+		break;
+	case KVM_GUEST_AP_OFFLINE:
+	case KVM_GUEST_SHUTDOWN:
 		kvmclock_disable();
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		break;
+	}
 }
 
 /*
@@ -313,6 +340,7 @@ static void __init kvm_sched_clock_init(bool stable)
 	kvm_sched_clock_offset = kvm_clock_read();
 	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
 				   kvm_save_sched_clock_state, kvm_restore_sched_clock_state);
+	kvmclock_is_sched_clock = true;
 
 	/*
 	 * The BSP's clock is managed via dedicated sched_clock save/restore
@@ -356,7 +384,7 @@ void __init kvmclock_init(void)
 		msr_kvm_system_time, msr_kvm_wall_clock);
 
 	this_cpu_write(hv_clock_per_cpu, &hv_clock_boot[0]);
-	kvm_register_clock("primary cpu clock");
+	kvm_register_clock("primary cpu, online");
 	pvclock_set_pvti_cpu0_va(hv_clock_boot);
 
 	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE_STABLE_BIT)) {
-- 
2.48.1.711.g2feabab25a-goog


