Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DDFA4727D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:25:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897451.1306144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTaf-0004oV-BE; Thu, 27 Feb 2025 02:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897451.1306144; Thu, 27 Feb 2025 02:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTaf-0004m7-52; Thu, 27 Feb 2025 02:25:33 +0000
Received: by outflank-mailman (input) for mailman id 897451;
 Thu, 27 Feb 2025 02:25:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qinq=VS=flex--seanjc.bounces.google.com=32cu_ZwYKCbQmYUhdWaiiafY.WigrYh-XYpYffcmnm.rYhjlidYWn.ila@srs-se1.protection.inumbo.net>)
 id 1tnTVU-00063X-4P
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:20:12 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e1655f0-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:20:10 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2fc0bc05c00so1509821a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:20:10 -0800 (PST)
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
X-Inumbo-ID: 5e1655f0-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622809; x=1741227609; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7QXAixlOaLHnLrPcLZCTebtwCxVmNNMI9kZmebDzK/g=;
        b=RR1cZhmPh9YcgkXBlnEpoiWzI6uPs+ZcsjKABn8RSLVv+UnRzxoL9OFQdXusrkqbG0
         zm2LNt1U2m5sec7EUyL4pqDz6WwN7slWdHnMM5IzQBdh5t4o0L4koJ2jGi2RDZDnXVlQ
         rO8YUY7qfJ9F5YcMeXBBLFgTsbRu12xpGkq0ildrIMio2rvt25ROHo2t+AhS+3CcFcaK
         Z8sy661HuGC/8jl76iA44E9UreA/0mVaR01QKy/AJADfyjq8C26nwXzI+D06r+D54NFv
         4qHbOsaIAIwey3JcS68BBY0N5CRoGpNz94G+hSvb1BTqZDT2jND5PImRtKWWq2ZrwTnK
         ls3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622809; x=1741227609;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QXAixlOaLHnLrPcLZCTebtwCxVmNNMI9kZmebDzK/g=;
        b=VGnGZLF9sxIp3zyyH9qLEdKxeDjPNu1npNvOysR4VRU43i6DwxHfj9/TidCeXbZNq5
         sPnioU8BVbKSa3GMNhtMv+k+I71nXxKKW8Ev5UGR2Ibd/mk5b/bXIJrWVTh/GAq02ErM
         OAVEwYdgwahz0flbOJDIMtpDoO7cM3RxNHUL6L2x3O1L1g8yKFeB025C+K/hcnzFm+xU
         eSpqyIuR56yVhnwty3aALezlh7HMFvgrPyI1uqFwX224MmZL0Oq5B1rN/w0G2nTfCXA5
         rbGzzc+6kDmwjoVGvxPBCX/z2A2Zb4IIw/Zes600xkaWk1daL8NzHZIREca4TIbkskQz
         y6Fw==
X-Forwarded-Encrypted: i=1; AJvYcCW/9JOsSN4Ce5TmShP1umvaUxPeSHvF2ZZC0nFNj6WXMfQmjsT8RcfkoabX/TvGxdWlJqEm7z9/rfc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBZAoOfPWprWa35s9JKaAz/lD/e/RhOSPU5EGFmNw2TiQxAqms
	j65d+p7wyktFxd/3sdR2G3HIBlSgrCEwK8WCU/T0c+lpCJav8wmhv9KJ/+56JgSocWZo0Vopj8Z
	HHw==
X-Google-Smtp-Source: AGHT+IHi4d1QOUfXEPfDRjR4DxqWNosFyXVnkFi4SDlf4Oxmtkdi3La4kP/2IDxMG83GHnzWpK766unKU5E=
X-Received: from pjz6.prod.google.com ([2002:a17:90b:56c6:b0:2fc:3022:36b8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5688:b0:2ee:d63f:d77
 with SMTP id 98e67ed59e1d1-2fe68adec61mr16362401a91.9.1740622809153; Wed, 26
 Feb 2025 18:20:09 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:54 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-39-seanjc@google.com>
Subject: [PATCH v2 38/38] x86/paravirt: kvmclock: Setup kvmclock early iff
 it's sched_clock
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
 arch/x86/include/asm/paravirt.h | 10 ++++++++--
 arch/x86/include/asm/x86_init.h |  2 --
 arch/x86/kernel/kvmclock.c      | 13 ++++++-------
 arch/x86/kernel/paravirt.c      | 18 +++++++++++++++++-
 arch/x86/kernel/smpboot.c       |  2 +-
 arch/x86/kernel/x86_init.c      |  1 -
 6 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 5de31b22aa5f..8550262fc710 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -29,13 +29,14 @@ DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
 DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);
 
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
 
 static __always_inline u64 paravirt_sched_clock(void)
@@ -43,6 +44,8 @@ static __always_inline u64 paravirt_sched_clock(void)
 	return static_call(pv_sched_clock)();
 }
 
+void paravirt_sched_clock_start_secondary(void);
+
 struct static_key;
 extern struct static_key paravirt_steal_enabled;
 extern struct static_key paravirt_steal_rq_enabled;
@@ -756,6 +759,9 @@ void native_pv_lock_init(void) __init;
 static inline void native_pv_lock_init(void)
 {
 }
+static inline void paravirt_sched_clock_start_secondary(void)
+{
+}
 #endif
 #endif /* !CONFIG_PARAVIRT */
 
diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
index 213cf5379a5a..e3456def5aea 100644
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
index 280bb964f30a..11f078b91f22 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -126,12 +126,13 @@ static void kvm_save_sched_clock_state(void)
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
@@ -367,7 +368,8 @@ static void __init kvm_sched_clock_init(bool stable)
 {
 	if (__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
 				       kvm_save_sched_clock_state,
-				       kvm_restore_sched_clock_state))
+				       kvm_restore_sched_clock_state,
+				       kvm_setup_secondary_sched_clock))
 		return;
 
 	kvm_sched_clock_offset = kvm_clock_read();
@@ -452,9 +454,6 @@ void __init kvmclock_init(void)
 
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
-#ifdef CONFIG_SMP
-	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
-#endif
 	kvm_get_preset_lpj();
 
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index c538c608d9fb..f93278ddb1d2 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -86,8 +86,13 @@ static u64 native_steal_clock(int cpu)
 DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
 DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
 
+#ifdef CONFIG_SMP
+static void (*pv_sched_clock_start_secondary)(void) __ro_after_init;
+#endif
+
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				      void (*save)(void), void (*restore)(void))
+				      void (*save)(void), void (*restore)(void),
+				      void (*start_secondary))
 {
 	/*
 	 * Don't replace TSC with a PV clock when running as a CoCo guest and
@@ -104,9 +109,20 @@ int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 	static_call_update(pv_sched_clock, func);
 	x86_platform.save_sched_clock_state = save;
 	x86_platform.restore_sched_clock_state = restore;
+#ifdef CONFIG_SMP
+	pv_sched_clock_start_secondary = start_secondary;
+#endif
 	return 0;
 }
 
+#ifdef CONFIG_SMP
+void paravirt_sched_clock_start_secondary(void)
+{
+	if (pv_sched_clock_start_secondary)
+		pv_sched_clock_start_secondary();
+}
+#endif
+
 /* These are in entry.S */
 static struct resource reserve_ioports = {
 	.start = 0,
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index c10850ae6f09..e6fff67dd264 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -278,7 +278,7 @@ static void notrace start_secondary(void *unused)
 	cpu_init();
 	fpu__init_cpu();
 	rcutree_report_cpu_starting(raw_smp_processor_id());
-	x86_cpuinit.early_percpu_clock_init();
+	paravirt_sched_clock_start_secondary();
 
 	ap_starting();
 
diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
index 0a2bbd674a6d..1d4cf071c74b 100644
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
2.48.1.711.g2feabab25a-goog


