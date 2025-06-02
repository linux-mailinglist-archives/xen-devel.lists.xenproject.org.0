Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89335ACAB26
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002943.1382381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16I-0008U1-36; Mon, 02 Jun 2025 09:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002943.1382381; Mon, 02 Jun 2025 09:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16H-0008RZ-Uy; Mon, 02 Jun 2025 09:04:57 +0000
Received: by outflank-mailman (input) for mailman id 1002943;
 Mon, 02 Jun 2025 09:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM16G-0007kh-Gw
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:04:56 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6756e62-3f90-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 11:04:55 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-551fe46934eso4789596e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:04:54 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cdc3sm1507541e87.176.2025.06.02.02.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:04:53 -0700 (PDT)
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
X-Inumbo-ID: a6756e62-3f90-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748855094; x=1749459894; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqPcozH5cY7WTdc/VNhtz0ZQbmCe6X/v3JhqZHPKizE=;
        b=ZVxmGu10AD80T/aX8tjvpkfnwdwwNWZ1Q5QtVFlL6jgZf9h6HEaAP7nSLceSVp8sTw
         e103hUe2USC7pmv4VDkpRZpFFXktKXXa9/tEt7Ba5NuqBCw2I6ZZwONAQ8CAulhsusjf
         8KEqhmp+azMXiYIiDtmjI6UiYBZc1Mp3TIH8+yVGc+BbN5gA8yw0kGlqxc8t3QSyIrl0
         yoikQn8JbkdOg1smVhMpdz1M1JxDzgtV5Fg2JfGGlc/BkmmRq7aZPtQwlSZfWQRkJJpl
         d4MXRyGm/lysnhMC90IfhbaAyUQEC78wcP2k6wsPtnmZPTydHPM22TI3jpUaLguvGk8F
         87Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855094; x=1749459894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqPcozH5cY7WTdc/VNhtz0ZQbmCe6X/v3JhqZHPKizE=;
        b=RBIdOQIuGB0gx4Ma8CcNhGaI/6c24zsFlH8+yWWzKMM/KegRY3CZ5Nb9VPkZlxM3fF
         5u2QuDOqDI8Zm4LFDUcOxrP6EiZYfFjlujYyoEPp/rUFQndtYA7p1ogUwvMHkuD8pWwv
         CprKs7P2XAjXorkFehmyQAw4ouMdyIGrnUkPLWU7GFF38GeN2Ou+TSv+FSr0MN0r2RJK
         66mdyFzCQtRe8nz3CQWJh4SD0zFqOFtKVsyyErnJserqSm654Q6J8Glj973hbp2FFIPd
         kM7irSGe6an848BML4u9MMKaeLaJiYP46A6SxO4B3vCykB9gtrFqVFUOG0yncWXeJtQs
         4WvA==
X-Gm-Message-State: AOJu0YyXrwYTaMcazVjQwp4YFb0yfdt8vHOp+4sb5UxHwrhm6a6AXeRL
	1KPegG17nCoHzSYCtGVM4a8I9YkDg0HYab2ZzS6QaTOmlYBqgBcG4Tw+NM7MmvCr
X-Gm-Gg: ASbGncut6InjXlKY7uekZRyCE5Hd+zwA7HiAV7BQBdKf3lyKnCrz2vfwJqGXSpdF0il
	0xkR6lCYWLH/gedE2XKDpsiOleia8zu0UL966hEZspyCgnpsn4Kq1k12XoaBpcvf/1WgAGgcyvt
	p47y1fDqvRuHQczh40DOyBd3R/KJh2dybNSu51DN4pi+zqCEAf8/gB64hIk6z/3I3PY7Z0HhY+T
	7pbOtw7dSyrrj2VW3SsNDg/yI0909egj26v78oB4sOCT9aKW3iyFwMj5w+8w+JSgaIVGXqoUrQS
	K25eDyLLmHFMuIQaDFtcHp7p5QTWofJYFmpKUjKW1sf+4Imq3ri2cyWwvWkdsYIzJjpK8qMiaPn
	Z3CyleiTAZ7Wt9gI=
X-Google-Smtp-Source: AGHT+IFEWk5B09gxMmpBvB5cg/vxGWxO+XS2KdbPTd/vJrhO5L40I2jeOSWpJi89b7J3UM5ZWg5JqQ==
X-Received: by 2002:a05:6512:3b86:b0:54a:c4af:15 with SMTP id 2adb3069b0e04-5533ba8be3emr3554424e87.19.1748855093947;
        Mon, 02 Jun 2025 02:04:53 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xakep.amatop@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4][PART 2 02/10] xen/arm: Add suspend and resume timer helpers
Date: Mon,  2 Jun 2025 12:04:13 +0300
Message-ID: <d57cba4cfc0944c5483e68440a5675db735805be.1748848482.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748848482.git.mykola_kvach@epam.com>
References: <cover.1748848482.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Timer interrupts must be disabled while the system is suspended to prevent
spurious wake-ups. Suspending the timers involves disabling both the EL1
physical timer and the EL2 hypervisor timer. Resuming consists of raising
the TIMER_SOFTIRQ, which prompts the generic timer code to reprogram the
EL2 timer as needed. Re-enabling of the EL1 timer is left to the entity
that uses it.

Introduce a new helper, disable_physical_timers, to encapsulate disabling
of the physical timers.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V4:
  - Rephrased comment and commit message for better clarity
  - Created separate function for disabling physical timers

Changes in V3:
  - time_suspend and time_resume are now conditionally compiled
    under CONFIG_SYSTEM_SUSPEND
---
 xen/arch/arm/include/asm/time.h |  5 +++++
 xen/arch/arm/time.c             | 38 +++++++++++++++++++++++++++------
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
index 49ad8c1a6d..f4fd0c6af5 100644
--- a/xen/arch/arm/include/asm/time.h
+++ b/xen/arch/arm/include/asm/time.h
@@ -108,6 +108,11 @@ void preinit_xen_time(void);
 
 void force_update_vcpu_system_time(struct vcpu *v);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+void time_suspend(void);
+void time_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #endif /* __ARM_TIME_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index e74d30d258..ad984fdfdd 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -303,6 +303,14 @@ static void check_timer_irq_cfg(unsigned int irq, const char *which)
            "WARNING: %s-timer IRQ%u is not level triggered.\n", which, irq);
 }
 
+/* Disable physical timers for EL1 and EL2 on the current CPU */
+static inline void disable_physical_timers(void)
+{
+    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
+    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
+    isb();
+}
+
 /* Set up the timer interrupt on this CPU */
 void init_timer_interrupt(void)
 {
@@ -310,9 +318,7 @@ void init_timer_interrupt(void)
     WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
     /* Do not let the VMs program the physical timer, only read the physical counter */
     WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
-    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
-    isb();
+    disable_physical_timers();
 
     request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
                 "hyptimer", NULL);
@@ -330,9 +336,7 @@ void init_timer_interrupt(void)
  */
 static void deinit_timer_interrupt(void)
 {
-    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Disable physical timer */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
-    isb();
+    disable_physical_timers();
 
     release_irq(timer_irq[TIMER_HYP_PPI], NULL);
     release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
@@ -372,6 +376,28 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
     /* XXX update guest visible wallclock time */
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+void time_suspend(void)
+{
+    disable_physical_timers();
+}
+
+void time_resume(void)
+{
+    /*
+     * Raising the timer softirq triggers generic code to call reprogram_timer
+     * with the correct timeout (not known here).
+     *
+     * No further action is needed to restore timekeeping after power down,
+     * since the system counter is unaffected. See ARM DDI 0487 L.a, D12.1.2
+     * "The system counter must be implemented in an always-on power domain."
+     */
+    raise_softirq(TIMER_SOFTIRQ);
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int cpu_time_callback(struct notifier_block *nfb,
                              unsigned long action,
                              void *hcpu)
-- 
2.48.1


