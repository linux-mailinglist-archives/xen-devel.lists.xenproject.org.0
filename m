Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467A9CB6F11
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184545.1506957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfk-0003LO-1O; Thu, 11 Dec 2025 18:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184545.1506957; Thu, 11 Dec 2025 18:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfj-0003IP-UJ; Thu, 11 Dec 2025 18:45:51 +0000
Received: by outflank-mailman (input) for mailman id 1184545;
 Thu, 11 Dec 2025 18:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfi-0003I8-Fb
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:45:50 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c700df4-d6c1-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 19:45:49 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b770f4accc0so77284166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:45:49 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:45:47 -0800 (PST)
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
X-Inumbo-ID: 9c700df4-d6c1-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478748; x=1766083548; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tX1Fz0zPBQzk2eDKaQqJOs/xihDeP0j+jDiBR8XzM1w=;
        b=PEYCGL9+Lc2cDiL7DCeZT2XJ+aXRajwTTz+5n5r1AELWboYLg5NIxjTX+FQJpJ0wF7
         JUIjuav4iZ4Dw6gjnvwRVm7Egxjo96FnFXvXHrCpXMB37X7/kW7myUTsctO+7fDXagj3
         bhlxmVIZOGlxmzplc3KGkY7s1nR2FZBG0H+0f8PJBdYkzTlGRPclWETNaOs4ngR/s2TD
         mqNEcqQrW99fEm0l04Lq+o07aR8Wp3HAyMJJA5pm/YOgOr3hQY+4j46cM8Q5iPR9G3Ra
         BM92/TQsVnubz4bKNw3ePnZGdHbX39NzPDnVEkzBHUOItFt2figjR7qwYuO0x9iQbCIb
         O4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478748; x=1766083548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tX1Fz0zPBQzk2eDKaQqJOs/xihDeP0j+jDiBR8XzM1w=;
        b=c/mjExmCXfk54moZ8BHEJYAFlCpGyE3/YfwnrvepRdW7fze1PPJUABwi31o+tOVFxP
         9IrV3e6cV6e4zRb+ePsupfOPVndaRp/z2HO+Z2f5ESXZHQCmrlsDeQUtbE3/Gm78jUre
         NiM6IEKlSPiLwe9cIjYuCivyg+e8qiIJlKVza3seE35HM8WUfJS/Xiy9uXaLz1mkuTgg
         3ZUjuMWJryfgWsV6ishnDYNcz8XiofwBNcVpThuR/MgFhp60Dga/M7FzqtKosGaLTaOs
         jHUv6n9IDvxtn1SUGhwvUMhC+ZmrP3iM2x5MO4P76avZOqOeWJ9buUJ3ciBymE1tqS07
         qdPA==
X-Gm-Message-State: AOJu0YwvYVAlvW9Vm0CvUsVELFtDj34Rf2ZZNpFStDx+511cflSL1v10
	y7wNxuAhSxMt3sbrVgb2JP1ew/W/EiR1xd6ahds5JHMc0KMY7Gg4jSOPzYiPYLaQ
X-Gm-Gg: AY/fxX4NGDPWvtpEUBz0nMrglyUqx91wMJJJiOp6KRy3EuF38BjQlg1urnEVscJl5tB
	6z99nBim4rk5zgB/ejBs/D3wic2eZ/hJUgTSNF9dFgk8gngiHnba/adW6iUMmYZmHwdO8xkSTny
	MGIFgf0RNiMwv9SV0+tvYeEXhGJms0YYhyCtzRgQEQYhmRXdABFhALlQZDG06tW7ujPXgXIqEyU
	OyxltFiLcK2FZs5LI8vdtlY2eqznjaUo68llfcHcjrtFBF7LmgHabAU7q/keg4Qp1dd7rMt8ge4
	wRnfvUkVTSD/cLhfL+a59pzAEtaK2zMUKUm9TdPu8D4t9Ekz/uwNrvWjazY3AqxbyV9ljckxxo1
	bfqtQ07aiTPf2TEFC0Sel77F2Z1TisXDXQUNxoozVlpDWJEyD/zCJtltXrlFPgREROIdzxmS5z/
	8CKs3WHZBKp5dKXdPHknUj8/uJ1y9X8KOg70/F4f/6
X-Google-Smtp-Source: AGHT+IFtIgtxvZQd2O4KXziacvx35KTlgnY3AYtRsNoNXddsn3jOrLbe7ti6bJQfTJv3enbKUwDNPg==
X-Received: by 2002:a17:907:9718:b0:b5c:66ce:bfe6 with SMTP id a640c23a62f3a-b7ce84d963amr692216066b.55.1765478748133;
        Thu, 11 Dec 2025 10:45:48 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Subject: [PATCH v7 01/12] xen/arm: Add suspend and resume timer helpers
Date: Thu, 11 Dec 2025 20:43:25 +0200
Message-ID: <6eb8f80c070f6b1198814df8d80dcc2e60d44ea8.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765472890.git.mykola_kvach@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Timer interrupts must be disabled while the system is suspended to prevent
spurious wake-ups. Suspending timers in Xen consists of disabling the
physical timer and the hypervisor timer on the current CPU. The virtual
timer does not need explicit handling here, as it is already disabled on
vCPU context switch and its state is restored per-vCPU on the next context
restore.

Resuming consists of raising TIMER_SOFTIRQ, which prompts the generic
timer code to reprogram the hypervisor timer with the correct timeout.

Xen does not use or expose the physical timer, so it remains disabled
across suspend/resume.

Introduce a new helper, disable_phys_hyp_timers(), to encapsulate disabling
of the physical and hypervisor timers.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V7:
  - Dropped EL1/EL2 wording; use "physical timer" and "hypervisor timer"
  - Renamed helper to disable_phys_hyp_timers() to reflect its actual scope
  - Clarified virtual timer handling (disabled on vCPU switch-out, restored on
    context restore) and added comments in suspend/resume paths
  - Added resume comment explaining which timers are restored by TIMER_SOFTIRQ
---
 xen/arch/arm/include/asm/time.h |  5 ++++
 xen/arch/arm/time.c             | 44 ++++++++++++++++++++++++++++-----
 2 files changed, 43 insertions(+), 6 deletions(-)

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
index 3710eab109..b90dc6c68c 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -306,6 +306,14 @@ static void check_timer_irq_cfg(unsigned int irq, const char *which)
 static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_hyp);
 static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_virt);
 
+/* Disable physical and hypervisor timers on the current CPU */
+static inline void disable_phys_hyp_timers(void)
+{
+    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
+    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
+    isb();
+}
+
 /* Set up the timer interrupt on this CPU */
 void init_timer_interrupt(void)
 {
@@ -316,9 +324,7 @@ void init_timer_interrupt(void)
     WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
     /* Do not let the VMs program the physical timer, only read the physical counter */
     WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
-    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
-    isb();
+    disable_phys_hyp_timers();
 
     hyp_action->name = "hyptimer";
     hyp_action->handler = htimer_interrupt;
@@ -343,9 +349,7 @@ void init_timer_interrupt(void)
  */
 static void deinit_timer_interrupt(void)
 {
-    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Disable physical timer */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
-    isb();
+    disable_phys_hyp_timers();
 
     release_irq(timer_irq[TIMER_HYP_PPI], NULL);
     release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
@@ -385,6 +389,34 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
     /* XXX update guest visible wallclock time */
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+void time_suspend(void)
+{
+    /* CNTV already disabled by virt_timer_save() during vcpu context switch. */
+    disable_phys_hyp_timers();
+}
+
+void time_resume(void)
+{
+    /*
+     * Raising TIMER_SOFTIRQ triggers generic timer code to reprogram the
+     * hypervisor timer with the correct timeout (not known here).
+     *
+     * Xen doesn't use or expose the physical timer, so it remains disabled
+     * across suspend/resume.
+     *
+     * The virtual timer state is restored per-vCPU on the next context switch.
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
2.43.0


