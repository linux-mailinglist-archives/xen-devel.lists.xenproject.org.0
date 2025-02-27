Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81949A47296
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897536.1306316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbL-00043E-Ff; Thu, 27 Feb 2025 02:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897536.1306316; Thu, 27 Feb 2025 02:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbL-0003vF-3l; Thu, 27 Feb 2025 02:26:15 +0000
Received: by outflank-mailman (input) for mailman id 897536;
 Thu, 27 Feb 2025 02:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txKR=VS=flex--seanjc.bounces.google.com=3q8u_ZwYKCYY2okxtmqyyqvo.myw7ox-no5ovvs232.7oxz1ytom3.y1q@srs-se1.protection.inumbo.net>)
 id 1tnTUl-00063X-3L
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:27 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4332d8c7-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:25 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-220f0382404so8343695ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:25 -0800 (PST)
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
X-Inumbo-ID: 4332d8c7-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622764; x=1741227564; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pWgviwpmhKNHN5XYXpAWmYugB+1r1OlVvpsKGRVLlVs=;
        b=1cgV3pK4eenyNCaGDAOC/Stcw0hfyELiiY3mAK85SF5KPap1ePmkS7Av7MMEj1971C
         0/Lo1LptvSlzBCJooYgahaZyXKO+d8l1G41C99nxvWlejyG5aOPVzSuOx1/Zne8Z8+hv
         F7SNrX2ueq9yux0daD3zPEB18DMCK7LfLshzY8LEp/fkfZrlG7j+12DJM5Nj1MFBUhGK
         JcorCzgTlePw9FMJnhzDKxNG2c2ugKjnF/25zQd5nAWLEeiooeYKOiEcfm68LD89ZOYT
         70lrK5Du9ysZWvskw8/zdVBCLMt14QomZxJpmsGBi0WpC+zsYN4/BuNuUjVoi494CJxr
         iYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622764; x=1741227564;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWgviwpmhKNHN5XYXpAWmYugB+1r1OlVvpsKGRVLlVs=;
        b=ozw4cXFRXocNqE4iYXTGO3V8ZRTdjd8rac0iDa+osg7HI4eDByPdJJvaUgiTTP4PNF
         NvdLSZ3qwvMO29XDHpaANI45SLgf1OkYaP6lO1TY9sQl1F4jfN/zblw51bf9h/2PGqPx
         z4bgNBkYnuowcKm12AYLcEqv58DOLXljH0FO5EcXxDJhE17NvoBzYQO3Iau6w0dcO2zp
         2BVTza1hIADN9SDPWKLiVcNEiywUkvbjPDAZMoU1RmN9EUEroy1fgZbs4PinrFT6/JF4
         sfuiuV0hySxGzODGHRGoRUwhquCNPHjBjgHfJIKJFjvqJSmxH5HCXjSeC6w/Qp8365+6
         9qkg==
X-Forwarded-Encrypted: i=1; AJvYcCUP5pG15656jlsjP3AqUSlCUeBrgM6b9dBYXV5JybSHUf3J6DRpZ+mEreTXxbpV9qyc7gUdcwl1gTg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpnZ8DE/Cp+B4V3WmmdW1NzDCtKrTacqRORVpUYmkoo9JLZbQs
	XZOYadgXioX2WNJ4NpbYpUTnz64UY/748Y1ZNgnlY68+dwQhUtZWusDUk81jJ/L66n8eVhz4EUT
	Tvw==
X-Google-Smtp-Source: AGHT+IGQazOm0zxmui59w45JCda9qTDjxRSvZp9ylt3tyNT0rDqeQIE65vrdsSLJOsVjaLh1NupfPRbt/dc=
X-Received: from plblo7.prod.google.com ([2002:a17:903:4347:b0:21f:429a:36ae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ecca:b0:220:f06b:318
 with SMTP id d9443c01a7336-22320080b32mr91766195ad.14.1740622763961; Wed, 26
 Feb 2025 18:19:23 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:28 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-13-seanjc@google.com>
Subject: [PATCH v2 12/38] x86/kvm: Don't disable kvmclock on BSP in syscore_suspend()
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

Don't disable kvmclock on the BSP during syscore_suspend(), as the BSP's
clock is NOT restored during syscore_resume(), but is instead restored
earlier via the sched_clock restore callback.  If suspend is aborted, e.g.
due to a late wakeup, the BSP will run without its clock enabled, which
"works" only because KVM-the-hypervisor is kind enough to not clobber the
shared memory when the clock is disabled.  But over time, the BSP's view
of time will drift from APs.

Plumb in an "action" to KVM-as-a-guest and kvmclock code in preparation
for additional cleanups to kvmclock's suspend/resume logic.

Fixes: c02027b5742b ("x86/kvm: Disable kvmclock on all CPUs on shutdown")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_para.h |  8 +++++++-
 arch/x86/kernel/kvm.c           | 15 ++++++++-------
 arch/x86/kernel/kvmclock.c      | 31 +++++++++++++++++++++++++------
 3 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/kvm_para.h b/arch/x86/include/asm/kvm_para.h
index 57bc74e112f2..8708598f5b8e 100644
--- a/arch/x86/include/asm/kvm_para.h
+++ b/arch/x86/include/asm/kvm_para.h
@@ -118,8 +118,14 @@ static inline long kvm_sev_hypercall3(unsigned int nr, unsigned long p1,
 }
 
 #ifdef CONFIG_KVM_GUEST
+enum kvm_guest_cpu_action {
+	KVM_GUEST_BSP_SUSPEND,
+	KVM_GUEST_AP_OFFLINE,
+	KVM_GUEST_SHUTDOWN,
+};
+
 void kvmclock_init(void);
-void kvmclock_disable(void);
+void kvmclock_cpu_action(enum kvm_guest_cpu_action action);
 bool kvm_para_available(void);
 unsigned int kvm_arch_para_features(void);
 unsigned int kvm_arch_para_hints(void);
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 7a422a6c5983..866b061ee0d9 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -447,7 +447,7 @@ static void __init sev_map_percpu_data(void)
 	}
 }
 
-static void kvm_guest_cpu_offline(bool shutdown)
+static void kvm_guest_cpu_offline(enum kvm_guest_cpu_action action)
 {
 	kvm_disable_steal_time();
 	if (kvm_para_has_feature(KVM_FEATURE_PV_EOI))
@@ -455,9 +455,10 @@ static void kvm_guest_cpu_offline(bool shutdown)
 	if (kvm_para_has_feature(KVM_FEATURE_MIGRATION_CONTROL))
 		wrmsrl(MSR_KVM_MIGRATION_CONTROL, 0);
 	kvm_pv_disable_apf();
-	if (!shutdown)
+	if (action != KVM_GUEST_SHUTDOWN)
 		apf_task_wake_all();
-	kvmclock_disable();
+
+	kvmclock_cpu_action(action);
 }
 
 static int kvm_cpu_online(unsigned int cpu)
@@ -713,7 +714,7 @@ static int kvm_cpu_down_prepare(unsigned int cpu)
 	unsigned long flags;
 
 	local_irq_save(flags);
-	kvm_guest_cpu_offline(false);
+	kvm_guest_cpu_offline(KVM_GUEST_AP_OFFLINE);
 	local_irq_restore(flags);
 	return 0;
 }
@@ -724,7 +725,7 @@ static int kvm_suspend(void)
 {
 	u64 val = 0;
 
-	kvm_guest_cpu_offline(false);
+	kvm_guest_cpu_offline(KVM_GUEST_BSP_SUSPEND);
 
 #ifdef CONFIG_ARCH_CPUIDLE_HALTPOLL
 	if (kvm_para_has_feature(KVM_FEATURE_POLL_CONTROL))
@@ -751,7 +752,7 @@ static struct syscore_ops kvm_syscore_ops = {
 
 static void kvm_pv_guest_cpu_reboot(void *unused)
 {
-	kvm_guest_cpu_offline(true);
+	kvm_guest_cpu_offline(KVM_GUEST_SHUTDOWN);
 }
 
 static int kvm_pv_reboot_notify(struct notifier_block *nb,
@@ -775,7 +776,7 @@ static struct notifier_block kvm_pv_reboot_nb = {
 #ifdef CONFIG_CRASH_DUMP
 static void kvm_crash_shutdown(struct pt_regs *regs)
 {
-	kvm_guest_cpu_offline(true);
+	kvm_guest_cpu_offline(KVM_GUEST_SHUTDOWN);
 	native_machine_crash_shutdown(regs);
 }
 #endif
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 80d1a06609c8..223e5297f5ee 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -177,8 +177,22 @@ static void kvm_register_clock(char *txt)
 	pr_debug("kvm-clock: cpu %d, msr %llx, %s", smp_processor_id(), pa, txt);
 }
 
+static void kvmclock_disable(void)
+{
+	if (msr_kvm_system_time)
+		native_write_msr(msr_kvm_system_time, 0, 0);
+}
+
 static void kvm_save_sched_clock_state(void)
 {
+	/*
+	 * Stop host writes to kvmclock immediately prior to suspend/hibernate.
+	 * If the system is hibernating, then kvmclock will likely reside at a
+	 * different physical address when the system awakens, and host writes
+	 * to the old address prior to reconfiguring kvmclock would clobber
+	 * random memory.
+	 */
+	kvmclock_disable();
 }
 
 static void kvm_restore_sched_clock_state(void)
@@ -186,6 +200,17 @@ static void kvm_restore_sched_clock_state(void)
 	kvm_register_clock("primary cpu clock, resume");
 }
 
+void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
+{
+	/*
+	 * Don't disable kvmclock on the BSP during suspend.  If kvmclock is
+	 * being used for sched_clock, then it needs to be kept alive until the
+	 * last minute, and restored as quickly as possible after resume.
+	 */
+	if (action != KVM_GUEST_BSP_SUSPEND)
+		kvmclock_disable();
+}
+
 #ifdef CONFIG_SMP
 static void kvm_setup_secondary_clock(void)
 {
@@ -193,12 +218,6 @@ static void kvm_setup_secondary_clock(void)
 }
 #endif
 
-void kvmclock_disable(void)
-{
-	if (msr_kvm_system_time)
-		native_write_msr(msr_kvm_system_time, 0, 0);
-}
-
 static void __init kvmclock_init_mem(void)
 {
 	unsigned long ncpus;
-- 
2.48.1.711.g2feabab25a-goog


