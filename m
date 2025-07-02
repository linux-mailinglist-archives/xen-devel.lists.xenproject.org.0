Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6042BAF5B59
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:41:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031262.1405033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeQ-0007sS-Dx; Wed, 02 Jul 2025 14:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031262.1405033; Wed, 02 Jul 2025 14:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeQ-0007qP-BK; Wed, 02 Jul 2025 14:41:30 +0000
Received: by outflank-mailman (input) for mailman id 1031262;
 Wed, 02 Jul 2025 14:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4T1d=ZP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uWyeP-0007qI-Mg
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:41:29 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2965312-5752-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 16:41:27 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4538a2fc7ffso47191685e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:41:27 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad20bsm230946905e9.20.2025.07.02.07.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 07:41:26 -0700 (PDT)
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
X-Inumbo-ID: a2965312-5752-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751467287; x=1752072087; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugtucicsaAC7jFXi5T+e68lwTqW8PaUKQa4Xi50TDv8=;
        b=TCwRUc/UQZdQtRw2qViiFBLTFuWLofehWiBEbHoj4P1mAAI7K/3VKyxtTN03kH9r5I
         Pg8PTgQvhlhFZZi7vanmFoR4Btac5WuBkxnkNuRvoAGuz+XSQgfs1CzmKtLSj/Ji5o7I
         fQfM+whferMUZ1otO1yG4oAZqa8ISiBRd3gzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467287; x=1752072087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugtucicsaAC7jFXi5T+e68lwTqW8PaUKQa4Xi50TDv8=;
        b=ZLNQvtVY6rPKtuN6OBGbxE+daBVknaax3a1iXC98ldeM/E39CSEE3OTB6de1V3wJvU
         b/nz1uhpsorTxwtDQ4BWZOifxI2ypD+wYA9YCWeoQQwFDk6ryY7OO70ve1aZu364L8a8
         QM/L8N6yeRb3BG2/PvVJ56U1A4zTTNxmJUGtZOdv4/M6Z4uF3xPg2bE0Z4CAJs2qSZzf
         uyEAehqpGmWiXliiXYRJG4WUFEotmysWYOFbrpvhiOXTWEu8p46M/heYz4O9EcohvW2T
         9aJg9dQStinV8X4haDdYZ0tTcuQwVDMuetOsrsW7D3ZftnM3yWIuRHaCjcUb9QNE4RXT
         48jA==
X-Gm-Message-State: AOJu0YyWxHe4Y11FkUNnNeXNktEae7D4WTxeeQKl1hS1UVuEOXR1pPNQ
	dRoL6Yx+470n06qTljHCRF6UafLPYvVY9nqGUrvRG1INqga4LhI084iDxlensRBOlbKZZt48X7d
	pc1XXD/qMqQ==
X-Gm-Gg: ASbGncsdcUqW4n7qF+ipza6aq4yV0nEOlieHmmBWMpxB1llzwHfZR53pXeTMiTyZ/Gx
	5Bc3K9nd9Orq/mKVjVEmvbbBVRNo5PwqF+MenCChlZbdJ63WTYUscgFbnizDCixumfn7Q7jpv9r
	ixnRgCgJpoivHGtdZegzHn/VOq7nqKRLJSoyyGYwv6pVwPdjjmYPQyppzw0dfBqIZr7wLk77zoU
	swpuneIVmbhChFOQGyDKwbj4eHAkw2LTdv9+fC3Pzp2AKFQxflwctsLkCXiDWcvCbOmgyglYNYu
	7Le6zSHkLR6pTLUF8MQJnKxwMDsmNqH0m7nKKqvDwhpp0/84U4KRJSZT8Jsv9p8ToPGIAT/snxf
	5X9YNIoY6RjobrvDMZmPwlomQo28RGjgmECg=
X-Google-Smtp-Source: AGHT+IHkFP1J6kc1yxOu2QxL245KplXrxYDiZd6TOm8wxpelxM2CIysd2q3IjSmWrcMpQPpw+sLl1g==
X-Received: by 2002:a05:600c:c176:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-454a41609efmr32157015e9.13.1751467286716;
        Wed, 02 Jul 2025 07:41:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/6] x86/idle: Remove broken MWAIT implementation
Date: Wed,  2 Jul 2025 15:41:16 +0100
Message-Id: <20250702144121.1096448-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpuidle_wakeup_mwait() is a TOCTOU race.  The cpumask_and() sampling
cpuidle_mwait_flags can take a arbitrary period of time, and there's no
guarantee that the target CPUs are still in MWAIT when writing into
mwait_wakeup(cpu).

The consequence of the race is that we'll fail to IPI targets.  Also, there's
no guarantee that mwait_idle_with_hints() will raise a TIMER_SOFTIRQ on it's
way out.

The fundamental bug is that the "in_mwait" variable needs to be in the
monitored line in order to do this in a race-free way.

Arranging for this while keeping the old implementation is prohibitive, so
strip it out in order to implement the new one cleanly.  In the interim, this
causes IPIs to be used unconditionally which is safe albeit suboptimal.

Fixes: 3d521e933e1b ("cpuidle: mwait on softirq_pending & remove wakeup ipis")
Fixes: 1adb34ea846d ("CPUIDLE: re-implement mwait wakeup process")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/acpi/cpu_idle.c       | 48 ++++--------------------------
 xen/arch/x86/hpet.c                |  2 --
 xen/arch/x86/include/asm/hardirq.h |  9 +++---
 xen/include/xen/cpuidle.h          |  2 --
 xen/include/xen/irq_cpustat.h      |  1 -
 5 files changed, 9 insertions(+), 53 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 6c3a10e6fb4e..141f0f0facf6 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -436,27 +436,6 @@ static int __init cf_check cpu_idle_key_init(void)
 }
 __initcall(cpu_idle_key_init);
 
-/*
- * The bit is set iff cpu use monitor/mwait to enter C state
- * with this flag set, CPU can be waken up from C state
- * by writing to specific memory address, instead of sending an IPI.
- */
-static cpumask_t cpuidle_mwait_flags;
-
-void cpuidle_wakeup_mwait(cpumask_t *mask)
-{
-    cpumask_t target;
-    unsigned int cpu;
-
-    cpumask_and(&target, mask, &cpuidle_mwait_flags);
-
-    /* CPU is MWAITing on the cpuidle_mwait_wakeup flag. */
-    for_each_cpu(cpu, &target)
-        mwait_wakeup(cpu) = 0;
-
-    cpumask_andnot(mask, mask, &target);
-}
-
 /* Force sending of a wakeup IPI regardless of mwait usage. */
 bool __ro_after_init force_mwait_ipi_wakeup;
 
@@ -465,42 +444,25 @@ bool arch_skip_send_event_check(unsigned int cpu)
     if ( force_mwait_ipi_wakeup )
         return false;
 
-    /*
-     * This relies on softirq_pending() and mwait_wakeup() to access data
-     * on the same cache line.
-     */
-    smp_mb();
-    return !!cpumask_test_cpu(cpu, &cpuidle_mwait_flags);
+    return false;
 }
 
 void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
 {
     unsigned int cpu = smp_processor_id();
-    s_time_t expires = per_cpu(timer_deadline, cpu);
-    const void *monitor_addr = &mwait_wakeup(cpu);
+    const unsigned int *this_softirq_pending = &softirq_pending(cpu);
 
-    monitor(monitor_addr, 0, 0);
+    monitor(this_softirq_pending, 0, 0);
     smp_mb();
 
-    /*
-     * Timer deadline passing is the event on which we will be woken via
-     * cpuidle_mwait_wakeup. So check it now that the location is armed.
-     */
-    if ( (expires > NOW() || expires == 0) && !softirq_pending(cpu) )
+    if ( !*this_softirq_pending )
     {
         struct cpu_info *info = get_cpu_info();
 
-        cpumask_set_cpu(cpu, &cpuidle_mwait_flags);
-
         spec_ctrl_enter_idle(info);
         mwait(eax, ecx);
         spec_ctrl_exit_idle(info);
-
-        cpumask_clear_cpu(cpu, &cpuidle_mwait_flags);
     }
-
-    if ( expires <= NOW() && expires > 0 )
-        raise_softirq(TIMER_SOFTIRQ);
 }
 
 static void acpi_processor_ffh_cstate_enter(struct acpi_processor_cx *cx)
@@ -901,7 +863,7 @@ void cf_check acpi_dead_idle(void)
 
     if ( cx->entry_method == ACPI_CSTATE_EM_FFH )
     {
-        void *mwait_ptr = &mwait_wakeup(smp_processor_id());
+        void *mwait_ptr = &softirq_pending(smp_processor_id());
 
         /*
          * Cache must be flushed as the last operation before sleeping.
diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 1bca8c8b670d..192de433cfd1 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -188,8 +188,6 @@ static void evt_do_broadcast(cpumask_t *mask)
     if ( __cpumask_test_and_clear_cpu(cpu, mask) )
         raise_softirq(TIMER_SOFTIRQ);
 
-    cpuidle_wakeup_mwait(mask);
-
     if ( !cpumask_empty(mask) )
        cpumask_raise_softirq(mask, TIMER_SOFTIRQ);
 }
diff --git a/xen/arch/x86/include/asm/hardirq.h b/xen/arch/x86/include/asm/hardirq.h
index 342361cb6fdd..f3e93cc9b507 100644
--- a/xen/arch/x86/include/asm/hardirq.h
+++ b/xen/arch/x86/include/asm/hardirq.h
@@ -5,11 +5,10 @@
 #include <xen/types.h>
 
 typedef struct {
-	unsigned int __softirq_pending;
-	unsigned int __local_irq_count;
-	unsigned int nmi_count;
-	unsigned int mce_count;
-	bool __mwait_wakeup;
+    unsigned int __softirq_pending;
+    unsigned int __local_irq_count;
+    unsigned int nmi_count;
+    unsigned int mce_count;
 } __cacheline_aligned irq_cpustat_t;
 
 #include <xen/irq_cpustat.h>	/* Standard mappings for irq_cpustat_t above */
diff --git a/xen/include/xen/cpuidle.h b/xen/include/xen/cpuidle.h
index 705d0c1135f0..120e354fe340 100644
--- a/xen/include/xen/cpuidle.h
+++ b/xen/include/xen/cpuidle.h
@@ -92,8 +92,6 @@ extern struct cpuidle_governor *cpuidle_current_governor;
 bool cpuidle_using_deep_cstate(void);
 void cpuidle_disable_deep_cstate(void);
 
-extern void cpuidle_wakeup_mwait(cpumask_t *mask);
-
 #define CPUIDLE_DRIVER_STATE_START  1
 
 extern void menu_get_trace_data(u32 *expected, u32 *pred);
diff --git a/xen/include/xen/irq_cpustat.h b/xen/include/xen/irq_cpustat.h
index b9629f25c266..5f039b4b9a76 100644
--- a/xen/include/xen/irq_cpustat.h
+++ b/xen/include/xen/irq_cpustat.h
@@ -24,6 +24,5 @@ extern irq_cpustat_t irq_stat[];
   /* arch independent irq_stat fields */
 #define softirq_pending(cpu)	__IRQ_STAT((cpu), __softirq_pending)
 #define local_irq_count(cpu)	__IRQ_STAT((cpu), __local_irq_count)
-#define mwait_wakeup(cpu)	__IRQ_STAT((cpu), __mwait_wakeup)
 
 #endif	/* __irq_cpustat_h */
-- 
2.39.5


