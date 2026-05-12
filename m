Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLm/KvdeA2r55QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FC65257BE
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307294.1579095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcM-0000WN-IX; Tue, 12 May 2026 17:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307294.1579095; Tue, 12 May 2026 17:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcM-0000Oq-CU; Tue, 12 May 2026 17:10:02 +0000
Received: by outflank-mailman (input) for mailman id 1307294;
 Tue, 12 May 2026 17:10:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMqcJ-0008JG-V4
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:10:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqcJ-00HVbk-Bv
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 19:09:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ee6-5cb7-0a2a0a5109dd-0a2a4507b76a-2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:59 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ee7-229c-0a2a45070019-d1558029c526-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:59 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so33351435e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:09:59 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cccf90sm10838845e9.0.2026.05.12.10.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 10:09:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778605798; x=1779210598; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibGyBzTWotDComsaOUE0ixj57R/0uTs4BWKAvB2xeVg=;
        b=KC25qTOVAhEmuxwwYEr6lHcuM//ugu9+kW5sqVHg9zKVn6uxFZB+dvkI+csnHr1l+A
         QN8kvMClmBDEWqb9sp4Z2R2bvB+ZOZBzCnJtHScxH4jj7xKj/+i8tNW+I+VwXIPfqFrE
         /7pBR0hJuHuP7krjkiglL1bcdBcFagejA3+bRTZLCJhVrIf2hrk/y3n/aBEcFamEOtjI
         DhyY7Rqy0O0jdYUDsuB724FE7u9W8PASsPr9LtXdPok3p5AYrkHpE98T42XdnyOc0grC
         ROY0O+7n62GGw8rq5rUELY0SQpmD8F8k3yc15kXuFo3f1L739HLyIcamQHjsbvLSv4Jw
         wcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605798; x=1779210598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ibGyBzTWotDComsaOUE0ixj57R/0uTs4BWKAvB2xeVg=;
        b=aQS90JYfzd8F0UdOujDLBmZxSjCiu3GN7wyIzonZTVnIFyENrZUpOieckn8aI/jlYH
         q7WjdEklzgcqJNPkl4VluErLaVFQ6Bl28BxR6K8Cn0/ZT9+sdaVnuS44A1z3TDwAPo9T
         PYclqaJbsPYDgny6y3egawo51Ft2CGZBAHkttCmDYdBnxUF+mGSQzdhdjn3qpma1G3av
         tDfPZYxJsiX9l5nr3YSsqRmnzIMU+Xa0x23g9LM43iyVkkih5Za0lF7WFGjCwhB+kTS/
         OEwFvaACPaR/9FjEWkBgQmlw6h6VjtSDhU6E9VqPzxkyfYiG65Za/Ecu0YEBQpoLcD5H
         GhKg==
X-Gm-Message-State: AOJu0YwRh9y9Iwh0yDonJqnUNN4Srfc7osturxquVeFEtGVx+67YpwPh
	xsDlB2JjYNs7FrS/JSk73nch0n/qhn4vtbvXah4oVvJLEi7N4ig+WYh3unIhKg==
X-Gm-Gg: Acq92OHTFyxpq7iJD8zwzFUXxLn1RtuS49dAr9+esHsPBmhBOkplWEf8I3hc2a32TLX
	8DAMLehwvKmbA4lEjfJiRp9gvtmkcLJfDI6W1yWmvCb9FEIxxDyA+dSx3q5espbrM7b288R+XKd
	DS3oxGrsJ7E5lA1xFhEsmN0fM+Dz9zDHib1m9LnkD0wJl7L5rhGbBE1TTzY0I23lK8ReXk7VZwQ
	V0fRa00uj7hCljpr6MmIaxhHgP2uw7Z5WNPWbzj+Nj2Em0KwdcvQAXwy9uwer0PpY1VU/wF8pzV
	a9fEnLdHtgrYMCPmeoAxsQmls2A3eCWUiD5nT1T2p6XNjIjorqis0ocb+8J9SOzGWP2CpLHT571
	6rX2EN+G+CaN36njrNNkshFOLFkhj8NyBY5oSAnMdbhwTBNLkYqf9SO9N5yvIofQOb9zBYe5Fwx
	3XWZbwtQ1QIxEM40W6TR3eN2SD92gslHLnJdhf
X-Received: by 2002:a05:600c:3f0f:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-48e9007290cmr63915715e9.28.1778605798406;
        Tue, 12 May 2026 10:09:58 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 13/13] xen/arm: Add host system suspend backend
Date: Tue, 12 May 2026 20:07:20 +0300
Message-ID: <2268857aa7eef95444169564c17f7e9a6f59b1c5.1778605274.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778605274.git.mykola_kvach@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778605799-22772C48-87001D5D/0/0
X-purgate-type: clean
X-purgate-size: 11802
X-Rspamd-Queue-Id: 05FC65257BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Add the Xen-wide suspend/resume backend used after a control-domain
vPSCI SYSTEM_SUSPEND request has been accepted. The vPSCI policy,
runtime driver blockers and control-domain sequencing checks are handled
by the preceding commit; this change adds the code that actually drives
the host suspend attempt.

The backend runs from a tasklet scheduled on pCPU0, because non-boot CPUs
are disabled during suspend. It freezes domains, disables the scheduler
and then disables non-boot CPUs.

Host-side suspend participants are handled in phases. IOMMU and console
state are suspended first. Local IRQs are then disabled before suspending
timer and GIC state. On resume or failure, the completed suspend phases
are unwound in reverse: GIC and timer state are restored while IRQs are
still disabled, local IRQs are restored, and then console and IOMMU state
are restored.

On boot, init_ttbr is normally initialized during secondary CPU hotplug.
On uniprocessor systems this can leave init_ttbr uninitialized, so set it
from the boot CPU before entering suspend.

Note: the code is behind CONFIG_HAS_SYSTEM_SUSPEND, which is currently
only selected when UNSUPPORTED is set and MPU is not set.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V9:
- Split vPSCI availability policy, runtime host-suspend blockers and the
  domain-readiness precheck into the preceding commit.
- Trigger the host suspend backend from the control-domain SYSTEM_SUSPEND
  path.
- Reorder the host suspend/resume phases so the timer is suspended with
  local IRQs disabled and local IRQs are restored after the GIC and timer
  resume paths, before the console and IOMMU resume paths.
- Move HAS_HWDOM_SYSTEM_SUSPEND and related logic to policy patch.

Changes in V8:
- Add a pre-suspend check in system_suspend() after scheduler_disable() to
  require all domains to be in the shut down state with SHUTDOWN_suspend
  before proceeding with the global suspend flow.
- Drop the common-level depends on !ARM_64 || !SYSTEM_SUSPEND from
  CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND and model the ARM64 suspend case
  with an arch-selected capability instead.
- Rename CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND to
  CONFIG_HAS_HWDOM_SYSTEM_SUSPEND.
- Rename need_hwdom_shutdown() to want_hwdom_shutdown().

Changes in V7:
- Control domain is responsible for host suspend.
- Add an empty inline host_system_suspend() function when SYSTEM_SUSPEND
  config is disabled.
- Use IS_ENABLED() for config checking instead of #ifdef.
- Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simplify
  control flow.
- Factor hardware domain shutdown condition into a helper
  (need_hwdom_shutdown()) to avoid preprocessor directives inside the
  function.
- Squash with iommu suspend/resume commit.
---
 xen/arch/arm/Kconfig               |   1 +
 xen/arch/arm/include/asm/mm.h      |   2 +
 xen/arch/arm/include/asm/suspend.h |   2 +
 xen/arch/arm/mmu/smpboot.c         |   2 +-
 xen/arch/arm/suspend.c             | 140 +++++++++++++++++++++++++++++
 xen/arch/arm/vpsci.c               |  10 ++-
 6 files changed, 154 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 54a5bfb9ae..119bc00674 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -9,6 +9,7 @@ config ARM_64
 	select 64BIT
 	select HAS_DOMAIN_TYPE
 	select HAS_FAST_MULTIPLY
+	select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
 
 config ARM
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 2eb8465aa9..de119cad3a 100644
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
index 87db12eac3..a194dbb21a 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -40,11 +40,13 @@ int prepare_resume_ctx(void);
 void hyp_resume(void);
 bool host_system_suspend_allowed(void);
 void host_system_suspend_disable(const char *reason);
+void host_system_suspend(struct domain *d);
 
 #else /* !CONFIG_SYSTEM_SUSPEND */
 
 static inline bool host_system_suspend_allowed(void) { return false; }
 static inline void host_system_suspend_disable(const char *reason) {}
+static inline void host_system_suspend(struct domain *d) {}
 
 #endif
 
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
index a571035d2c..b1cc67fbdb 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,10 +1,16 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/gic.h>
 #include <asm/psci.h>
 #include <asm/suspend.h>
 
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/iommu.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/serial.h>
+#include <xen/tasklet.h>
 
 struct resume_cpu_context resume_cpu_context;
 
@@ -44,6 +50,140 @@ void host_system_suspend_disable(const char *reason)
            reason ? reason : "unsupported suspend/resume path");
 }
 
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
+    console_start_sync();
+    status = iommu_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_end_sync;
+    }
+
+    status = console_suspend();
+    if ( status )
+    {
+        dprintk(XENLOG_ERR, "Failed to suspend the console, err=%d\n", status);
+        system_state = SYS_STATE_resume;
+        goto resume_iommu;
+    }
+
+    local_irq_save(flags);
+
+    time_suspend();
+
+    status = gic_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_time;
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
+    if ( prepare_resume_ctx() )
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
+ resume_time:
+    time_resume();
+
+    local_irq_restore(flags);
+
+    console_resume();
+
+ resume_iommu:
+    iommu_resume();
+
+ resume_end_sync:
+    console_end_sync();
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
index 48a963ae3e..79100cbb1e 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -237,7 +237,8 @@ static bool domain_in_suspend_state(struct domain *d)
     return suspended;
 }
 
-static int32_t domain_psci_system_suspend_policy(struct domain *d)
+static int32_t domain_psci_system_suspend_policy(struct domain *d,
+                                                 bool *host_suspend)
 {
     struct domain *other;
     bool last_awake_control_domain = true;
@@ -300,6 +301,7 @@ static int32_t domain_psci_system_suspend_policy(struct domain *d)
     if ( !host_system_suspend_allowed() )
         return PSCI_NOT_SUPPORTED;
 
+    *host_suspend = true;
     return 0;
 }
 
@@ -310,6 +312,7 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     struct vcpu *v;
     struct domain *d = current->domain;
     bool is_thumb = epoint & 1;
+    bool host_suspend = false;
     struct resume_info *rctx = &d->arch.resume_ctx;
 
     /* THUMB set is not allowed with 64-bit domain */
@@ -334,7 +337,7 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
 
     spin_lock(&vpsci_system_suspend_lock);
 
-    rc = domain_psci_system_suspend_policy(d);
+    rc = domain_psci_system_suspend_policy(d, &host_suspend);
     if ( !rc )
     {
         rc = domain_shutdown(d, SHUTDOWN_suspend);
@@ -359,6 +362,9 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
             "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
             epoint, cid);
 
+    if ( host_suspend )
+        host_system_suspend(d);
+
     return rc;
 }
 
-- 
2.43.0


