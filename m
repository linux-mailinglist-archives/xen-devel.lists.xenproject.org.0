Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B115DA472A6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897625.1306382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbw-0000WW-2r; Thu, 27 Feb 2025 02:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897625.1306382; Thu, 27 Feb 2025 02:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbv-0000Te-Vf; Thu, 27 Feb 2025 02:26:51 +0000
Received: by outflank-mailman (input) for mailman id 897625;
 Thu, 27 Feb 2025 02:26:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MnEX=VS=flex--seanjc.bounces.google.com=3tsu_ZwYKCZEDzv84x19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@srs-se1.protection.inumbo.net>)
 id 1tnTUv-00063X-EP
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:37 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 496bb26a-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:35 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2f2a9f056a8so981926a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:35 -0800 (PST)
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
X-Inumbo-ID: 496bb26a-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622774; x=1741227574; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+aPHxZSdvUlWxMuV2uSxypL8fcuaMUyvD+y52Dh+Bv8=;
        b=kjDYok3pJb1MNFl2cwY+zlq7YQhE6taTODPI0KST9ttvSlTFVbeSk/QHQ4HjD8GhaE
         IOQy/V1yo2q9atYR3iLyI3AcWU+OechjrgC7mHdQZdNML5idoY3tHqhrUgdnIm88/MBx
         cd/EvKQnLwYLol3PpyDHIegq3x3rITBg+Vx9K79XcoqhoLRxNWt2Tr+O+wn9TIQFtT1J
         /AuNz/0wNA0gEVLd3BfRKwcHthtXW99MkzErDBsRni4vF6wDTmvnbuVoMx8H1hIeYmqU
         FZNmDi3wqaWxVUbDS445hFyE6wbAxP27UqirLTNlJXTd/0BtiD+L5tN1Op8uE0k+A4jD
         uoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622774; x=1741227574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aPHxZSdvUlWxMuV2uSxypL8fcuaMUyvD+y52Dh+Bv8=;
        b=j+t22CqbERUtWdFGH6suI8J8uuftmrKAN3VEGOvgb3wCpMEB3+8Qc4PoekiSb8BjUo
         +nRrBEW9Ioxu9aEyfBetOzWxT7ZPzJFlCztGYpqS9M/Y7NsDbrS9CxsQSaussWXDKpgd
         JpOVr3TWf5btrRTMX5kPGrw0BTCH6faBD/TxLRzd+eja08lFdOmZveBnci6Ko9R1k1z8
         LwoGCYsGVj/bMMGQrcYfTC6LiUc4QGlUXrSHiP+8ES9PHerADQa+IobJUdkjwqenNDBf
         1Us6Wu/lB5T8gTMQIVCM0Zc6bfMMEj3jA0eznpyCBYXgasKH3QhA3++5DLG9FrindFwr
         B38g==
X-Forwarded-Encrypted: i=1; AJvYcCVKk/+HucoMj8d9+ZHeYLDyYCi/d/KQDtKhbD6S1LPaxBWeD3uVDSYl9VbzHmOSf1K+KBjc7Py7MRU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+cvfA+sHCLanlYTlJhawoJElxpc0gSSCL5Ypg4zKJwv+XVGF7
	kJwzyFttjiXnupXYpkAK3sWbzX0QZ8aaUmaL/1FZ2g6dsBGkt8rBcKmskNZ5CuqBagWckr8cCUv
	8bA==
X-Google-Smtp-Source: AGHT+IGtJhSaBP2AlM0Njvk3g8X/xMhIC1fqVJrfdIV8pKqmQJT6ad+58HkgFke1VLmpWg41h8WiiOdBO04=
X-Received: from pjbta3.prod.google.com ([2002:a17:90b:4ec3:b0:2ea:448a:8cd1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5483:b0:2ee:f076:20f1
 with SMTP id 98e67ed59e1d1-2fe7e218ab9mr10711632a91.0.1740622774461; Wed, 26
 Feb 2025 18:19:34 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:34 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-19-seanjc@google.com>
Subject: [PATCH v2 18/38] x86/paravirt: Pass sched_clock save/restore helpers
 during registration
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

Pass in a PV clock's save/restore helpers when configuring sched_clock
instead of relying on each PV clock to manually set the save/restore hooks.
In addition to bringing sanity to the code, this will allow gracefully
"rejecting" a PV sched_clock, e.g. when running as a CoCo guest that has
access to a "secure" TSC.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/paravirt.h    | 8 +++++---
 arch/x86/kernel/cpu/vmware.c       | 7 ++-----
 arch/x86/kernel/kvmclock.c         | 5 ++---
 arch/x86/kernel/paravirt.c         | 5 ++++-
 arch/x86/xen/time.c                | 5 ++---
 drivers/clocksource/hyperv_timer.c | 6 ++----
 6 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index cfceabd5f7e1..dc26a3c26527 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -28,11 +28,13 @@ u64 dummy_sched_clock(void);
 DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
 DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);
 
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable);
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				void (*save)(void), void (*restore)(void));
 
-static inline void paravirt_set_sched_clock(u64 (*func)(void))
+static inline void paravirt_set_sched_clock(u64 (*func)(void),
+					    void (*save)(void), void (*restore)(void))
 {
-	__paravirt_set_sched_clock(func, true);
+	__paravirt_set_sched_clock(func, true, save, restore);
 }
 
 static __always_inline u64 paravirt_sched_clock(void)
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index d6eadb5b37fd..399cf3286a60 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -344,11 +344,8 @@ static void __init vmware_paravirt_ops_setup(void)
 
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
index c78db52ae399..1ad3878cc1d9 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -136,7 +136,8 @@ static void kvm_restore_sched_clock_state(void)
 static inline void kvm_sched_clock_init(bool stable)
 {
 	kvm_sched_clock_offset = kvm_clock_read();
-	__paravirt_set_sched_clock(kvm_sched_clock_read, stable);
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
+				   kvm_save_sched_clock_state, kvm_restore_sched_clock_state);
 
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
@@ -343,8 +344,6 @@ void __init kvmclock_init(void)
 #ifdef CONFIG_SMP
 	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
 #endif
-	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
-	x86_platform.restore_sched_clock_state = kvm_restore_sched_clock_state;
 	kvm_get_preset_lpj();
 
 	/*
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 55c819673a9d..9673cd3a3f0a 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -86,12 +86,15 @@ static u64 native_steal_clock(int cpu)
 DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
 DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
 
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
 
 /* These are in entry.S */
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 51eba986cd18..3179f850352d 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -564,13 +564,12 @@ static void __init xen_init_time_common(void)
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
index 4a21874e91b9..1c4ed9995cb2 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -550,10 +550,8 @@ static void hv_restore_sched_clock_state(void)
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
2.48.1.711.g2feabab25a-goog


