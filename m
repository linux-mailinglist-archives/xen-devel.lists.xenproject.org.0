Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E1AB3F0D8
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105398.1456328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjK-0005Cs-9L; Mon, 01 Sep 2025 22:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105398.1456328; Mon, 01 Sep 2025 22:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjK-00059E-5Y; Mon, 01 Sep 2025 22:10:26 +0000
Received: by outflank-mailman (input) for mailman id 1105398;
 Mon, 01 Sep 2025 22:10:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjJ-00055o-3U
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:25 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7483f7db-8780-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 00:10:23 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55f69cf4b77so3061750e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:23 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:21 -0700 (PDT)
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
X-Inumbo-ID: 7483f7db-8780-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764622; x=1757369422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqPcozH5cY7WTdc/VNhtz0ZQbmCe6X/v3JhqZHPKizE=;
        b=fvkpboOPpIPZqSscUPtg/Z76SMQfSVSgyWtvLFMB+e77wAGZNfS1+RTmUkI8Yh0/K0
         j/8RJZPDSfXagf4U8b6zMiT8N98eyUnjQZoLSABwSd5BYkUx0lyYWPhVE6HObDMMiU/U
         DquxnS2pm+5MmI4DXXcx2NE068a1S7ccWaPmwwCuqMnXfGzL7g4RgAzG5r/JNEN+3XHb
         3CMSWd6VVlHcEjOjkGbjnPYRFjgwUsNNVBkCLNrYodMqQaaTqjRPJiX+VdFHZcBRzHgn
         ne5TgdqAhnWGSRtuoQz46IP5nzYsZHHxlexX0kEgrCPG+pZe0qaI+jcV2sx80egOT3oG
         vSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764622; x=1757369422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqPcozH5cY7WTdc/VNhtz0ZQbmCe6X/v3JhqZHPKizE=;
        b=gKqHKcJgQ9rkGKHQxsJqkwwq044hAh4w6MYGhNELLa/Fki/JqckR/TE1rR8M52r9fF
         oGjtnuzhWwVmBkmELiJzr5gztMB/rthic3K271mRGv8uAswNlkWtwGmfUd5IDUxBHl6H
         TfR7BYK6r2wgkL7Xtt9XjC/p2m1NclM1y9tnwMwVVGMjadjedUAIOFY49YMyNtw6m74g
         b6iUYrlBWRCiMTcLjXskhE0Boz8ZoW5JJKyLtLJuwWk3twM/nz4sABs+hGJQEBsH2DKn
         6qUuytNe6LgUyGTVV6MxU2MgtN43rnaZuof64mTDCs2Ct3jDR57m/fBwKuBab2wGxWvZ
         WdRg==
X-Gm-Message-State: AOJu0YzMgqrsNEIFjvPTxqrordlfVR9y6/K/eFrC1x56DxibJT2zXhcR
	D9ms/bMNVfioVUF9/Yo72TVQHCEqstTJkfwpmK0cPcl17cW1sKIJN2oeqtd9EYEm
X-Gm-Gg: ASbGncuATfkl59L6zA4qqJSStTS2rg+1iy44bkMROeGKlPHjAoskQus7uZB7vzV3+3h
	YaJ83Sk5duw7Uf8gikViYZ+8/uQBkCR80Y29GbBDHh3h4xVc48R6XSKofw9kcNl/M4KEZ4DAxbG
	VdSiuc0wRIUviIOO1oXXK/wP+hxOMXFP8Atk4NOPiS4ujacucEOqNn9WA19E4nm8tWq5AJkpHK5
	WqyATTWSipjnlyWar3FRK76YZOOE4ivDYf3fJ1ltJtf6C9TsjKxpS/V0ImnMkNR069JFcysPxmV
	v7ykoF9IdU7bPhQM2KWK2HrAjmM3NAt1ExBcorlELQA4gW8w6Leea+y61ioU5yRw+D+86DRQR2z
	MnN6gtR7Los7wtQnv+xLJrvr4ccwTgsBKYPBR/77/9RE2EdFVHAxWQLZ1rG77y6iph2duIqeP
X-Google-Smtp-Source: AGHT+IE0nct2I3ZXnzBAVzjS0A2t7RZ46uqQlrsxxAbmvZQR2mhhoN8TLctbHGFrjJ6lWGC/3qLOrw==
X-Received: by 2002:a05:6512:1409:b0:55f:6831:6ee7 with SMTP id 2adb3069b0e04-55f708b60e7mr2174676e87.21.1756764622048;
        Mon, 01 Sep 2025 15:10:22 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v6 01/13] xen/arm: Add suspend and resume timer helpers
Date: Tue,  2 Sep 2025 01:10:05 +0300
Message-ID: <781c8e1b3a4d9b269bfde125072a84baae3f9bb3.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
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


