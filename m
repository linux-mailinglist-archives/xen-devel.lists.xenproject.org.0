Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC259B216C2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077944.1438959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZRs-0005tG-7z; Mon, 11 Aug 2025 20:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077944.1438959; Mon, 11 Aug 2025 20:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZRs-0005qU-38; Mon, 11 Aug 2025 20:48:52 +0000
Received: by outflank-mailman (input) for mailman id 1077944;
 Mon, 11 Aug 2025 20:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZRq-0005co-7n
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:48:50 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 951bccd6-76f4-11f0-a327-13f23c93f187;
 Mon, 11 Aug 2025 22:48:49 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-adfb562266cso656737066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:48:49 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:48:47 -0700 (PDT)
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
X-Inumbo-ID: 951bccd6-76f4-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945329; x=1755550129; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqPcozH5cY7WTdc/VNhtz0ZQbmCe6X/v3JhqZHPKizE=;
        b=PKounsQ3qXQ1uXh7Cbt4dJu7ffgtpXdtjQ+7V4KK6ZGNyB3NhFpoCg41AjVYBVEzpc
         +ywX2UVGek4uR0DL0LkJLbAKb+UOZ8IUFVi4tdaj2t4v4f1q5FPQvwG2m0HqLt63nq8D
         yw17SwtqVb0RqgGecgN8w+foOmsTzeAe4r/6c221uGQp5tlcHmHoFoq8vHl7IYC9FTCG
         9K0dKSfgf56S6morcmuYKl5twUwZhlQ5f1M5kbvwHNN3BMQ94UVwZ5gQNI5lNPkiWJD8
         K9UIg38vt4RzWlsUzLy0lutUutZSeIFu/QnPbWbdz/I2aLLiwJ+1Y0M8jjJsQuQAsn6g
         ziqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945329; x=1755550129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqPcozH5cY7WTdc/VNhtz0ZQbmCe6X/v3JhqZHPKizE=;
        b=X5AGP83O8PdhaiJJsCvu9YA141H3cwIKs+Vh0zd3NtUK6V+CHRG4bMuGPjj5kof4CP
         OCD06j9fdcaBPkoU+HgZoBnYnbPRyD7hkTnGNT03v9ptzoUvwforuvatwSak+7kflFoX
         AkXhe1cGP8PG53C3v3BC7nhbBcbAQ52LXYkLYZ3J8H/YEZg0fCl11uK7HyHgT0qbpGAb
         wUTc+8Kc+03KWgVMUBOpM4BZGRv/Q3U+NW69jt1sf9V97GqczdZE/mG0vxv5sxG1iqYh
         nqhdDhVvC5lN/+9DW+amVNxiWeTlcgKkBBr5cegzDpomdbMlKUSALHPNKpkmlBVGCP4p
         Uu/w==
X-Gm-Message-State: AOJu0YznO+I0Wr02zk2LZc4hJuNd9MCF6Ks/l3dRUvlTAeWahpGbZN1c
	IXCdrHdNaiqPG1nv3Qkzio9oP8/G7VhAt6QwnzP8VAWoB+FzWHrpSKQqPjA2rQ==
X-Gm-Gg: ASbGncuGNSj/sUYmymIn8gtikiOL4o7wgXwC/1U1MZ6cSf/QhcYRRH/00vCyd7j1LGO
	6o34Yj91rWuGdkMew1Jv+9r8R4rW8ge3KRR34e6hEJqzMYhY9o1z7yfoe7Hk8Sy4cMbqweChySo
	MIgKWBdRe8/yFCL82UEq6QlWOaVcsyL/8a9ChT1rBNBJkbvv+Kcm5dMRS2ugxEHMTF09HntBf3X
	y8p5ffYBr97mW899gHee5rN4AoaqRZZCjZXCWHP8CmlSIRfeE6Uyk4P57IlhxFe7tOtur5biF3O
	o6zaDHai6a5kSzcwhCvCgKAh1TvMX6PXcvKa5yEgdffovWlG1TE4JMu0LPhYBBln+UM2QFdbW9X
	6K+WkSpTZiYYD7QbZZaPJoWoYuC94Nbnexzudm00QRFiEqGFMzrbG96QKnnGrrSc7Qdo=
X-Google-Smtp-Source: AGHT+IEu3D0gEmW80fyDtMme/VtHa6WjaROJtkDiDayImRqcZBL5eh09kXVI5SF+mCQWOVhf9h9k5Q==
X-Received: by 2002:a17:906:794a:b0:af6:3194:f024 with SMTP id a640c23a62f3a-afa1dff3b08mr83862166b.13.1754945328309;
        Mon, 11 Aug 2025 13:48:48 -0700 (PDT)
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
Subject: [PATCH v5 01/12] xen/arm: Add suspend and resume timer helpers
Date: Mon, 11 Aug 2025 23:47:57 +0300
Message-ID: <412e0f48636feda1825885a8aed92386f694c8ca.1754943874.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
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


