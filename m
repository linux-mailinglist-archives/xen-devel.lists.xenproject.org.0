Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3C0AF9867
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 18:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033539.1406878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMh-0005V3-AO; Fri, 04 Jul 2025 16:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033539.1406878; Fri, 04 Jul 2025 16:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMh-0005Sj-7N; Fri, 04 Jul 2025 16:34:19 +0000
Received: by outflank-mailman (input) for mailman id 1033539;
 Fri, 04 Jul 2025 16:34:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FCR=ZR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXjMf-0005Ex-Aw
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 16:34:17 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c04d2f-58f4-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 18:34:15 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-453749aef9eso4031545e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 09:34:14 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9989fcesm59199345e9.16.2025.07.04.09.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:34:13 -0700 (PDT)
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
X-Inumbo-ID: b8c04d2f-58f4-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751646854; x=1752251654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5xp3+ysILd0+Q1dhc8jOc5wluMva3PMjYQseqSE5sA=;
        b=EUvRRPC7PRXenSHPzPiqmH7Bt4cDYuoNwXF/5cPbvU9E8RWG+IMVhDJZXm2vpYNpV+
         Cb7I7bI/tLbVr9qDS0gyOOOweijH6CeJwADYzbsVQpTjptcS/VYn5geK+G797ltGZaD7
         HPxcT1+sn/tepAQfRFPHk5lJZoXUlER6S4cQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646854; x=1752251654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5xp3+ysILd0+Q1dhc8jOc5wluMva3PMjYQseqSE5sA=;
        b=PkpN75cSyv9J24gToqY0cTiWJ0yMhWtNK51ULlCduUyLd1lrzqJ57fZnaXCgnRfwbm
         AYuoBe+gJ4gfomMmJBmw2k0n568j+w4eulmqZdhwQcd2fpr+xfms3M6c5zNEgPnv7V62
         UXX6Ofmor2ia8sSmBukWRBbHdNaGgPA5yY5RpklWKqn7TI1hG0nc1o/fAYHVNzLaqc0m
         qdKhMyzS51tyXdrrnFv8FtmBCTf5P5SgFIxGmHORInwOmp+OD9KdwKni3cntLW7s11fB
         SeAn4p5fCJ6chKF+7iWlPFR2FTluQC1ukoQgj3/l6KspMTPvekM+39LIRfZjT4eZM8iq
         kTyQ==
X-Gm-Message-State: AOJu0YwnYlzEfwqb7g2Zb7KOSz2rbp5RO2rOwWI8pT5eFr8E0qt26ADX
	maBveCp6/k/44Q6qkcXuOQ+i0KiYfGws0npSqJKOaE/2kir9bJaYYq2Viw0tQsQ7zRjc37ChXmx
	moU6SNuY0gQ==
X-Gm-Gg: ASbGncttg03UnJc9gYpmyR8QQLlj5DPIsF3ZnpWd9typHPDfhYur+1jK+xLn5lsvVGM
	HW0JreVHSUSRcgk+VeJnyTNsbOq29fHW6SB48a7YCelZMNhDV2q9VPiE8OfqwDdQ8vbRRkzVXom
	QBBnj4eMUuj5ganvbpnPQoFmw84VnY4065Di3tkox8xR80xnEaOOqbekK3qZqbWy15aXZVGoFIQ
	nBe19dzH4TUbloSFMN9HNS4U07bRb4BSyt0ECmI/mO6Si9+quaV80zIMTOtNwYTNY2x8PBIlPPk
	6eREmzhS7X9uLmTy/scXgW8uh1Nj/xZnWdtovE176aSVibk8zvRksaySXle0LXJeCh6AKP6Hx4U
	cXVbO/r2A/ePjLV2stkNTw0hKIdzEDNHMQDZ7mZINXSZJcA==
X-Google-Smtp-Source: AGHT+IHyMqLpnd28HHVgC5K/nTw5sErQGZLxOcUW3hBZBENFnz0HIx1Ga0NcKCFOj7ksK7q4AJLarQ==
X-Received: by 2002:a05:600c:871a:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-454b315e488mr38167375e9.16.1751646853578;
        Fri, 04 Jul 2025 09:34:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/6] x86/idle: Remove broken MWAIT implementation
Date: Fri,  4 Jul 2025 17:34:05 +0100
Message-Id: <20250704163410.1412367-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
References: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpuidle_wakeup_mwait() is a TOCTOU race.  The cpumask_and() sampling
cpuidle_mwait_flags can take a arbitrary period of time, and there's no
guarantee that the target CPUs are still in MWAIT when writing into
mwait_wakeup(cpu).

The consequence of the race is that we'll fail to IPI certain targets.  Also,
there's no guarantee that mwait_idle_with_hints() will raise a TIMER_SOFTIRQ
on it's way out.

The fundamental bug is that the "in_mwait" variable needs to be in the
monitored line, and not in a separate cpuidle_mwait_flags variable, in order
to do this in a race-free way.

Arranging to fix this while keeping the old implementation is prohibitive, so
strip the current one out in order to implement the new one cleanly.  In the
interim, this causes IPIs to be used unconditionally which is safe albeit
suboptimal.

Fixes: 3d521e933e1b ("cpuidle: mwait on softirq_pending & remove wakeup ipis")
Fixes: 1adb34ea846d ("CPUIDLE: re-implement mwait wakeup process")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
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


