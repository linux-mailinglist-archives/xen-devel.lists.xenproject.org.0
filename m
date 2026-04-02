Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJVxK11JzmknmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B10387DA1
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271546.1559738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaS-0006xn-7k; Thu, 02 Apr 2026 10:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271546.1559738; Thu, 02 Apr 2026 10:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaR-0006sC-J4; Thu, 02 Apr 2026 10:47:43 +0000
Received: by outflank-mailman (input) for mailman id 1271546;
 Thu, 02 Apr 2026 10:47:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w8FaP-0006V5-2R
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:47:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8FaO-009qA7-Ef
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:47:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4948-e002-0a2a0a5209dd-0a2a450c8ce0-20
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:40 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce494c-f40c-0a2a450c0019-d155da2db009-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:40 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b8f97c626aaso122290666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:47:40 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3d028955sm76392366b.61.2026.04.02.03.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 03:47:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775126860; x=1775731660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNu7eJ7Z0b3llwWlHGEbTagm+9rNR0YOT8JLveV1JGo=;
        b=KbGPLCldm1ssHRBbB1PjHxZV4J4qieBqYD1xDaTjCJl7e/yJ//qd0XEpJR2zRdSocS
         ZQAWJrK5m0bDoHP/uXSNJcZ8y/o6gJmTEVvTu1iTsOPqTkLYcZsBE1qgj9jxspDQz1L4
         5krMpNBx/Gd8K4HFKZ8ZPKTMWHQvWIWY2lUQ0mz94SVgV5Y9KtvggPCt1vduNCVSArA7
         D2CcmNA5n9YAR/z1kWbyR/THqBftvr5xnIb5ONiyndhVwgwBwfJ/HVqX1J2/HYAQDT4o
         rdP2ap/v7LySDZn7g7IDeOati7/MKyRR7OQtmNjg/L7A5ThJl5FWnsxAgaLZWhQLoHyE
         emCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126860; x=1775731660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNu7eJ7Z0b3llwWlHGEbTagm+9rNR0YOT8JLveV1JGo=;
        b=YNat4XG4aWdaWH4ArFu/kAToUf/pXRrJZBWnvxoTo3yNXtNgTF6COzGO6hMxrudAjo
         9XnmXlU8NzIWR+1d7UDFUGXwY+ZTWoLIwKzZQ7HdWeH5Df+NtgQmw1JAGr4xHEnCg8H0
         NsCOBggaawCAdWTIW9V01dPrfn0pUg+gqJgmJMYG+jABVuCohhK5miN684YQEBxa+FQ+
         qKr43TcwMVR+h/r0QqZsyi7QcUUZ3JKcett6rysAREs70Gg8dcl6MSDjfoQH6Z2YIVG1
         Zq1bcHr3nospWcJJdwLgCQ0s79hFaj5K0zypZWvHH6VcnPOWVp1N7pN3yaqtAb+TFuyQ
         TqDQ==
X-Gm-Message-State: AOJu0YxOKPtSQmRzA9cWSgOCOVuPGrqOgFX3tsP4L/gnHgMf3BKVWXkG
	nV248zl47P3pUHLnGI0C3csMi6tRqugP+OUEHlZsmuzkowiBRRPBQzNQtnr26ejn
X-Gm-Gg: ATEYQzxnLd9O2cxo0RJ9n88S8VczcX1T+qFGxTSocNYiZzM57/bHoO04XGNf9irtKk5
	iq1T3rbl2HEeTyqfbdcQevZKcdSnYljRZLX+C/3LUoESMmYTdPMP65rEB+a49vV5ryxQza5syRA
	NV7xQbssNwLG5HWjwW5T8AuKQejS/m8z5cuFVOt34jjPq9KL++/SfGX44t6AAhtcPRFlLScTZEd
	sTQ1AhHPKxQFx9LmMJzpQZ0/Doh2QW4Be4zsdO4CK5VFbyzYNClDVDrJhrdXkiW7a58E036GS8T
	lQkez+/rnFNLoFu+raeKr5OI7UauNIvevYnFAaDLp6DpGz1gokEa7hQibHSrp81nHB8oovsAm15
	jei8vtho8CTtJL67kCdxQmoNq3C2i+BMYmWJqGGlao7Vixow9bYdeV9asyVBnJKln7YjnCoVff9
	Z/XQPh3KrD7aoGhsflb2EHg8z5d1CkHSynLZM1
X-Received: by 2002:a17:907:6d16:b0:b9c:4248:7773 with SMTP id a640c23a62f3a-b9c42487e4amr138809366b.26.1775126859321;
        Thu, 02 Apr 2026 03:47:39 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v8 13/13] xen/arm: Add support for system suspend triggered by hardware domain
Date: Thu,  2 Apr 2026 13:45:14 +0300
Message-ID: <9b0f8922cd33df2b8e8038d639c1b8d8d73ce401.1775125380.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775125380.git.mykola_kvach@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775126860-FFF42A3D-F1949B49/0/0
X-purgate-type: clean
X-purgate-size: 14142
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:rahul.singh@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:mid,aggios.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 18B10387DA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Trigger Xen suspend when the hardware domain initiates suspend via
SHUTDOWN_suspend. Redirect system suspend to CPU#0 to ensure the
suspend logic runs on the boot CPU, as required.

Introduce full suspend/resume infrastructure gated by CONFIG_SYSTEM_SUSPEND,
including logic to:
 - disable and enable non-boot physical CPUs
 - freeze and thaw domains
 - suspend and resume the GIC, timer, iommu and console
 - maintain system state before and after suspend

On boot, init_ttbr is normally initialized during secondary CPU hotplug.
On uniprocessor systems, this would leave init_ttbr uninitialized,
causing resume to fail. To address this, the boot CPU now sets init_ttbr
during suspend.

Remove the restriction in the vPSCI interface preventing suspend from the
hardware domain.

Select HAS_SYSTEM_SUSPEND for ARM_64.

Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
capability for platforms where the hardware domain survives
SHUTDOWN_suspend without hwdom_shutdown(). ARM_64 selects it with
SYSTEM_SUSPEND enabled; other architectures keep the existing behaviour.

Note: the code is behind CONFIG_HAS_SYSTEM_SUSPEND, which is currently only
selected when UNSUPPORTED is set and when MPU isn't set, so the functionality
is built but disabled by default.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V8:
- Add a pre-suspend check in system_suspend() after scheduler_disable()
  to require all domains to be in the shut down state with
  SHUTDOWN_suspend before proceeding with the global suspend flow.
- Drop the common-level depends on !ARM_64 || !SYSTEM_SUSPEND from
  CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND and model the ARM64 suspend
  case with an arch-selected capability instead.
- Rename CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND to CONFIG_HAS_HWDOM_SYSTEM_SUSPEND.
- Rename need_hwdom_shutdown() to want_hwdom_shutdown().

Changes in V7:
- Control domain is responsible for host suspend
- Move the is_hardware_domain check into host_system_suspend()
- Add an empty inline host_system_suspend() function when SYSTEM_SUSPEND
  config is disabled
- Use IS_ENABLED() for config checking instead of #ifdef
- Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simplify
  control flow.
- Factor hardware domain shutdown condition into a helper
  (need_hwdom_shutdown()) to avoid preprocessor directives inside the function.
- Squash with iommu suspend/resume commit
---
 xen/arch/arm/Kconfig               |   2 +
 xen/arch/arm/include/asm/mm.h      |   2 +
 xen/arch/arm/include/asm/suspend.h |   7 +-
 xen/arch/arm/mmu/smpboot.c         |   2 +-
 xen/arch/arm/suspend.c             | 181 +++++++++++++++++++++++++++++
 xen/arch/arm/vpsci.c               |  12 +-
 xen/common/Kconfig                 |   3 +
 xen/common/domain.c                |   7 +-
 xen/drivers/passthrough/arm/smmu.c |  10 ++
 9 files changed, 220 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2f2b501fda..c2e63ce8ff 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -8,6 +8,8 @@ config ARM_64
 	depends on !ARM_32
 	select 64BIT
 	select HAS_FAST_MULTIPLY
+	select HAS_HWDOM_SYSTEM_SUSPEND if SYSTEM_SUSPEND
+	select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
 
 config ARM
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 72a6928624..87b54a55dc 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -360,6 +360,8 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
     } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
 }
 
+void set_init_ttbr(lpae_t *root);
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index c127fa3d78..c36ba23b10 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -38,7 +38,12 @@ extern struct cpu_context cpu_context;
 
 int prepare_resume_ctx(struct cpu_context *ptr);
 void hyp_resume(void);
-#endif /* CONFIG_SYSTEM_SUSPEND */
+void host_system_suspend(struct domain *d);
+
+#else /* !CONFIG_SYSTEM_SUSPEND */
+
+static inline void host_system_suspend(struct domain *d) { (void)d; }
+#endif
 
 #endif /* ARM_SUSPEND_H */
 
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index 37e91d72b7..ff508ecf40 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
     clear_table(boot_third);
 }
 
-static void set_init_ttbr(lpae_t *root)
+void set_init_ttbr(lpae_t *root)
 {
     /*
      * init_ttbr is part of the identity mapping which is read-only. So
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index e38566b0b7..4d1289776b 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,9 +1,190 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/psci.h>
 #include <asm/suspend.h>
 
+#include <public/sched.h>
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/errno.h>
+#include <xen/iommu.h>
+#include <xen/sched.h>
+#include <xen/tasklet.h>
+
 struct cpu_context cpu_context = {};
 
+static int can_system_suspend(void)
+{
+    int ret = 0;
+    struct domain *d;
+
+    rcu_read_lock(&domlist_read_lock);
+
+    for_each_domain ( d )
+    {
+        bool domain_suspended;
+
+        spin_lock(&d->shutdown_lock);
+        domain_suspended = d->is_shut_down &&
+                           d->shutdown_code == SHUTDOWN_suspend;
+        spin_unlock(&d->shutdown_lock);
+
+        if ( domain_suspended )
+            continue;
+
+        printk(XENLOG_ERR
+               "System suspend requires all domains to be shut down for suspend (dom%d: isn't in suspend state)\n",
+               d->domain_id);
+
+        ret = -EBUSY;
+        break;
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+
+    return ret;
+}
+
+/* Xen suspend. data identifies the domain that initiated suspend. */
+static void system_suspend(void *data)
+{
+    int status;
+    unsigned long flags;
+    struct domain *d = (struct domain *)data;
+
+    BUG_ON(system_state != SYS_STATE_active);
+
+    system_state = SYS_STATE_suspend;
+
+    printk("Xen suspending...\n");
+
+    freeze_domains();
+    scheduler_disable();
+
+    status = can_system_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_scheduler;
+    }
+
+    /*
+     * Non-boot CPUs have to be disabled on suspend and enabled on resume
+     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to PSCI
+     * CPU_OFF to be called by each non-boot CPU. Depending on the underlying
+     * platform capabilities, this may lead to the physical powering down of
+     * CPUs.
+     */
+    status = disable_nonboot_cpus();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_nonboot_cpus;
+    }
+
+    time_suspend();
+
+    status = iommu_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_time;
+    }
+
+    console_start_sync();
+    status = console_suspend();
+    if ( status )
+    {
+        dprintk(XENLOG_ERR, "Failed to suspend the console, err=%d\n", status);
+        system_state = SYS_STATE_resume;
+        goto resume_end_sync;
+    }
+
+    local_irq_save(flags);
+    status = gic_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_irqs;
+    }
+
+    set_init_ttbr(xen_pgtable);
+
+    /*
+     * Enable identity mapping before entering suspend to simplify
+     * the resume path
+     */
+    update_boot_mapping(true);
+
+    if ( prepare_resume_ctx(&cpu_context) )
+    {
+        status = call_psci_system_suspend();
+        /*
+         * If suspend is finalized properly by above system suspend PSCI call,
+         * the code below in this 'if' branch will never execute. Execution
+         * will continue from hyp_resume which is the hypervisor's resume point.
+         * In hyp_resume CPU context will be restored and since link-register is
+         * restored as well, it will appear to return from prepare_resume_ctx.
+         * The difference in returning from prepare_resume_ctx on system suspend
+         * versus resume is in function's return value: on suspend, the return
+         * value is a non-zero value, on resume it is zero. That is why the
+         * control flow will not re-enter this 'if' branch on resume.
+         */
+        if ( status )
+            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=%d\n",
+                    status);
+    }
+
+    system_state = SYS_STATE_resume;
+    update_boot_mapping(false);
+
+    gic_resume();
+
+ resume_irqs:
+    local_irq_restore(flags);
+
+    console_resume();
+ resume_end_sync:
+    console_end_sync();
+
+    iommu_resume();
+
+ resume_time:
+    time_resume();
+
+ resume_nonboot_cpus:
+    /*
+     * The rcu_barrier() has to be added to ensure that the per cpu area is
+     * freed before a non-boot CPU tries to initialize it (_free_percpu_area()
+     * has to be called before the init_percpu_area()). This scenario occurs
+     * when non-boot CPUs are hot-unplugged on suspend and hotplugged on resume.
+     */
+    rcu_barrier();
+    enable_nonboot_cpus();
+
+ resume_scheduler:
+    scheduler_enable();
+    thaw_domains();
+
+    system_state = SYS_STATE_active;
+
+    printk("Resume (status %d)\n", status);
+
+    domain_resume(d);
+}
+
+static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL);
+
+void host_system_suspend(struct domain *d)
+{
+    system_suspend_tasklet.data = (void *)d;
+    /*
+     * The suspend procedure has to be finalized by the pCPU#0 (non-boot pCPUs
+     * will be disabled during the suspend).
+     */
+    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index bd87ec430d..8fb9172186 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -5,6 +5,7 @@
 
 #include <asm/current.h>
 #include <asm/domain.h>
+#include <asm/suspend.h>
 #include <asm/vgic.h>
 #include <asm/vpsci.h>
 #include <asm/event.h>
@@ -232,8 +233,7 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     if ( is_64bit_domain(d) && is_thumb )
         return PSCI_INVALID_ADDRESS;
 
-    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
-    if ( is_hardware_domain(d) )
+    if ( !IS_ENABLED(CONFIG_SYSTEM_SUSPEND) && is_hardware_domain(d) )
         return PSCI_NOT_SUPPORTED;
 
     /* Ensure that all CPUs other than the calling one are offline */
@@ -266,6 +266,9 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
             "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
             epoint, cid);
 
+    if ( is_control_domain(d) )
+        host_system_suspend(d);
+
     return rc;
 }
 
@@ -290,7 +293,10 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
         return 0;
     case PSCI_1_0_FN32_SYSTEM_SUSPEND:
     case PSCI_1_0_FN64_SYSTEM_SUSPEND:
-        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTED : 0;
+        if ( IS_ENABLED(CONFIG_SYSTEM_SUSPEND) ||
+             !is_hardware_domain(current->domain) )
+            return 0;
+        fallthrough;
     default:
         return PSCI_NOT_SUPPORTED;
     }
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0a20aa0a12..feb1336f46 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -137,6 +137,9 @@ config HAS_EX_TABLE
 config HAS_FAST_MULTIPLY
 	bool
 
+config HAS_HWDOM_SYSTEM_SUSPEND
+	bool
+
 config HAS_IOPORTS
 	bool
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index bb9e210c28..d3edfb2a13 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1375,6 +1375,11 @@ void __domain_crash(struct domain *d)
     domain_shutdown(d, SHUTDOWN_crash);
 }
 
+static inline bool want_hwdom_shutdown(uint8_t reason)
+{
+    return !IS_ENABLED(CONFIG_HAS_HWDOM_SYSTEM_SUSPEND) ||
+           reason != SHUTDOWN_suspend;
+}
 
 int domain_shutdown(struct domain *d, u8 reason)
 {
@@ -1391,7 +1396,7 @@ int domain_shutdown(struct domain *d, u8 reason)
         d->shutdown_code = reason;
     reason = d->shutdown_code;
 
-    if ( is_hardware_domain(d) )
+    if ( is_hardware_domain(d) && want_hwdom_shutdown(reason) )
         hwdom_shutdown(reason);
 
     if ( d->is_shutting_down )
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 22d306d0cb..45f29ef8ec 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2947,6 +2947,13 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
 	xfree(xen_domain);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+static int arm_smmu_suspend(void)
+{
+	return -ENOSYS;
+}
+#endif
+
 static const struct iommu_ops arm_smmu_iommu_ops = {
     .page_sizes = PAGE_SIZE_4K,
     .init = arm_smmu_iommu_domain_init,
@@ -2960,6 +2967,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .map_page = arm_iommu_map_page,
     .unmap_page = arm_iommu_unmap_page,
     .dt_xlate = arm_smmu_dt_xlate_generic,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend = arm_smmu_suspend,
+#endif
 };
 
 static struct arm_smmu_device *find_smmu(const struct device *dev)
-- 
2.43.0


