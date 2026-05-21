Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCvNKoRFD2qNIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452B65AA8EB
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315662.1585462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VX-00041c-Qv; Thu, 21 May 2026 17:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315662.1585462; Thu, 21 May 2026 17:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VX-0003u3-Fn; Thu, 21 May 2026 17:48:31 +0000
Received: by outflank-mailman (input) for mailman id 1315662;
 Thu, 21 May 2026 17:48:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ7VU-0003M8-E1
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:48:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ7VT-00HNF5-Q1
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:48:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f4551-5cb7-0a2a0a5109dd-0a2a4503b258-18
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:27 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f456b-672d-0a2a45030019-d155802ad8d0-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:27 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso47876575e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 10:48:27 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d8e24bsm74565925e9.10.2026.05.21.10.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 10:48:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779385707; x=1779990507; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xH+CdyKs4JSeNRtHkAqySvPXuG95ECPS3iRUPK1CuT4=;
        b=nYgklPOz6MJnn5IShbCtfiy9XtYB3nxnUHCRapavg59xlsP3dYol77pHGGOMPuIqWt
         rFKKaS7D6/xB1Bfbr1RhMCImqAdzhruj++qMDA0ymMX58slPaZnqrBWez3tjd6DuDxHG
         wRapnx3xIbat/Jdy1sGXdicjsll9Arr9x/3zr4nGdnyqiYi3dUCRF48POQVW0lrbjqYa
         mdB/7ysr/eEejJ8RTe0X9zafLvNqwrjGsNTW07PR7qt5ysB78v9pGspIm7A/MnRrFRK4
         NeCItqeiDcGoFI8+ls3pM2ycmvnGo3Rt2V1ut343kVo9cDRRCeEBB2XX201yR1BeHVto
         +xoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385707; x=1779990507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xH+CdyKs4JSeNRtHkAqySvPXuG95ECPS3iRUPK1CuT4=;
        b=UVyYQiNRquysV2VIDxyzkQqXg4ncRw3UyqFfC31hUubeiXiFThP+ftjnSWi9spb+Bf
         /5pXpdvOasYvhDaRpb2QxzWu3Q3yeAWsfmEljDFveuC01bhkZCrU8rkMQeXbMYTojdkh
         DwFBqFIhgurXBW/p6ghLYZJ/T3nZKgvfs66AHvBU8YnFeiI6c0SKUMIZWpfOIFUCqMKi
         ytHJnRc3MYIfiSel/4SzflQ9LJfznh3XDA/if1+LflHvmAKDtLxa1UlctPHF/btYlWfM
         9CBugP6S3Yo8zDejZuKa12BXHM2ZK391b+L+7Dk8gHq1jyU2tex0eTC+zBULr1xWgUEI
         Brjg==
X-Gm-Message-State: AOJu0YxwMtF2W3mJ1g4VfeikFOgldvdp0kOiBsT8vGrihXYHMvur+fbh
	vyy9s+7BcD1DD0b7BLyCBvTFH54IFNMmqnpSUNZb9vdb1x7JvGuoKq5i4DoquekK
X-Gm-Gg: Acq92OFrFSM52+M6B+RjDPt5N+U05gfbU7GtCpV47P5nhHmd5jfyEhtq1reiBz9XkPx
	EFzRN2uU/qZ+aR6cHaMMqPBXLxftFx5wrEhxsQI6PjQZq5Pow+Y2cHIQkLY6iXLG/3gBgKD1uXB
	e23BBmbgQI/gCy5ZA443+roldcHiPzwsOhPOE74gCHztt2qzKJh8g5CAu75tMf/fdSebD2Zv0/1
	KxO+jHe1SlhvjS2nRWbtkd1xI2AhNFJbsyxo7YUzM1Dqn3ISPX3f1OiQrlNzMn+7ohFfZGZIWUl
	gYU5rKlaLYD2z/HO/OfxRgD9kqafRNIyRXJu/in22Dy+DLWnJtM9ufQvt088CPPndSRFbsP1cCp
	sZhURNR6XdSfLhaGbljvC9wO6xOIgd+OtcqpjEY1DDY9ivtQP5by7Musd5PB3Hhm6RnmHv6alFY
	gSloVrhepQOphZl/xPUVId/93lAykNdyzh0SE9
X-Received: by 2002:a05:600c:3513:b0:490:32da:30d with SMTP id 5b1f17b1804b1-4903605f0edmr56575805e9.9.1779385707107;
        Thu, 21 May 2026 10:48:27 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
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
Subject: [PATCH v10 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
Date: Thu, 21 May 2026 20:45:30 +0300
Message-ID: <1d49511fff3ef5f77bc2d4daac00e6895c1359b1.1779385072.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779385072.git.mykola_kvach@epam.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779385707-4086B938-8B9365E2/0/0
X-purgate-type: clean
X-purgate-size: 17397
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:luca.fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:rahul.singh@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 452B65AA8EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
capability for platforms where the hardware domain can be parked with
SHUTDOWN_suspend without calling hwdom_shutdown().

Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
non-control domains, including the hardware domain when it is not acting
as a control domain, the call is handled as a guest/domain suspend request
and parks the domain in SHUTDOWN_suspend.

Control domains need additional sequencing because their SYSTEM_SUSPEND
request is used to coordinate host-wide suspend. A non-last awake control
domain may be parked in SHUTDOWN_suspend without requiring the host
suspend path to be available. The last awake control domain is treated as
the point where the request becomes a host-suspend request, and it may
only proceed when all non-control domains are already in SHUTDOWN_suspend
and the host suspend path is available.

Keep the control-domain sequencing and domain-readiness checks out of
PSCI_FEATURES. They are per-attempt runtime conditions rather than stable
PSCI function availability. Advertise SYSTEM_SUSPEND as implemented by
vPSCI and report attempt-time policy failures as PSCI_DENIED.

Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND
so that SHUTDOWN_suspend from the hardware domain can be treated as a
domain suspend state rather than as a hardware-domain initiated host
shutdown. This does not by itself imply that host-wide suspend is
available.

Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPEND
capability with runtime blockers reported by Xen-owned subsystems. Add
runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ
paths lacking suspend/resume support. These blockers are runtime based,
so they only apply to drivers or paths that Xen actually uses on the
platform. For SMMUv3, the blocker applies only when Xen actually uses the
MSI IRQ path, since resume does not restore the SMMU *_IRQ_CFGn MSI
registers yet.

Add a struct domain forward declaration to xen/suspend.h so the generic
header can expose arch_domain_resume() without requiring a full domain.h
include.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V10:
- Return PSCI_DENIED rather than PSCI_NOT_SUPPORTED when the last awake
  control domain cannot proceed to host suspend, keeping PSCI_FEATURES
  stable once SYSTEM_SUSPEND is advertised.
- Shorten SYSTEM_SUSPEND blocker messages and use %pd when logging the
  control domain.
- Mark serial_suspend_available as __ro_after_init.
- Mention the struct domain forward declaration added to xen/suspend.h.

Changes in V9:
- Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND
  so that hardware-domain SHUTDOWN_suspend support is not tied to
  host-wide system suspend availability.
- Add runtime host suspend blockers for Xen-owned subsystems lacking
  suspend/resume support.
- Keep vPSCI SYSTEM_SUSPEND advertised through PSCI_FEATURES and enforce
  control-domain sequencing in the call handler.
---
 xen/arch/arm/Kconfig                  |   1 +
 xen/arch/arm/gic.c                    |   6 ++
 xen/arch/arm/include/asm/psci.h       |   3 +
 xen/arch/arm/include/asm/suspend.h    |  10 ++-
 xen/arch/arm/psci.c                   |   7 ++
 xen/arch/arm/suspend.c                |  40 +++++++++
 xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++++---
 xen/common/Kconfig                    |   3 +
 xen/common/domain.c                   |   7 +-
 xen/drivers/char/serial.c             |  12 +++
 xen/drivers/passthrough/arm/iommu.c   |   4 +
 xen/drivers/passthrough/arm/smmu-v3.c |   4 +
 xen/include/xen/serial.h              |   1 +
 xen/include/xen/suspend.h             |   2 +
 14 files changed, 201 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 79622b46a1..54a5bfb9ae 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -19,6 +19,7 @@ config ARM
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_DOM0LESS
+	select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 7727ffed5a..60488c95b4 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -26,6 +26,7 @@
 #include <asm/device.h>
 #include <asm/io.h>
 #include <asm/gic.h>
+#include <asm/suspend.h>
 #include <asm/vgic.h>
 #include <asm/acpi.h>
 
@@ -44,6 +45,11 @@ static void __init __maybe_unused build_assertions(void)
 void register_gic_ops(const struct gic_hw_operations *ops)
 {
     gic_hw_ops = ops;
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( !ops->suspend || !ops->resume )
+        host_system_suspend_disable("GIC driver lacks suspend support");
+#endif
 }
 
 static void clear_cpu_lr_mask(void)
diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index bb3c73496e..142fa1bfe5 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -24,6 +24,9 @@ void call_psci_cpu_off(void);
 void call_psci_system_off(void);
 void call_psci_system_reset(void);
 int call_psci_system_suspend(void);
+#ifdef CONFIG_SYSTEM_SUSPEND
+bool psci_system_suspend_allowed(void);
+#endif
 
 /* Range of allocated PSCI function numbers */
 #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index c848fc6340..50dc6e9fdf 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -39,7 +39,15 @@ extern struct resume_cpu_context resume_cpu_context;
 
 int prepare_resume_ctx(void);
 void hyp_resume(void);
-#endif /* CONFIG_SYSTEM_SUSPEND */
+bool host_system_suspend_allowed(void);
+void host_system_suspend_disable(const char *reason);
+
+#else /* !CONFIG_SYSTEM_SUSPEND */
+
+static inline bool host_system_suspend_allowed(void) { return false; }
+static inline void host_system_suspend_disable(const char *reason) {}
+
+#endif
 
 #endif /* ARM_SUSPEND_H */
 
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index e05dae1133..e9d78668fd 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -41,6 +41,13 @@ static bool __ro_after_init has_psci_system_suspend;
 
 #define PSCI_RET(res)   ((int32_t)(res).a0)
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+bool psci_system_suspend_allowed(void)
+{
+    return has_psci_system_suspend;
+}
+#endif
+
 int call_psci_cpu_on(int cpu)
 {
     struct arm_smccc_res res;
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 6ea4a0f9cc..98ddd46a47 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,9 +1,49 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/psci.h>
 #include <asm/suspend.h>
 
+#include <xen/lib.h>
+#include <xen/serial.h>
+
 struct resume_cpu_context resume_cpu_context;
 
+/*
+ * Non-PSCI infrastructure can make host suspend impossible even when the PSCI
+ * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has no valid
+ * suspend/resume path.
+ *
+ * This gate is checked only when the last awake control domain attempts to
+ * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
+ */
+static bool host_system_suspend_runtime_allowed = true;
+
+static bool host_serial_suspend_allowed(void)
+{
+    if ( serial_suspend_supported() )
+        return true;
+
+    printk_once(XENLOG_INFO
+                "Host SYSTEM_SUSPEND blocked: serial unsupported\n");
+
+    return false;
+}
+
+bool host_system_suspend_allowed(void)
+{
+    return psci_system_suspend_allowed() &&
+           host_serial_suspend_allowed() &&
+           host_system_suspend_runtime_allowed;
+}
+
+void host_system_suspend_disable(const char *reason)
+{
+    host_system_suspend_runtime_allowed = false;
+
+    printk(XENLOG_INFO "Host SYSTEM_SUSPEND blocked: %s\n",
+           reason ? reason : "unsupported suspend/resume path");
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index ac6af6118f..0bae42c1bd 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -5,6 +5,7 @@
 
 #include <asm/current.h>
 #include <asm/domain.h>
+#include <asm/suspend.h>
 #include <asm/vgic.h>
 #include <asm/vpsci.h>
 #include <asm/event.h>
@@ -219,6 +220,89 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
 
+/*
+ * Serialise SYSTEM_SUSPEND policy decisions with the domain suspend transition,
+ * so multiple control domains cannot all observe each other as still awake.
+ */
+static DEFINE_SPINLOCK(vpsci_system_suspend_lock);
+
+static bool domain_in_suspend_state(struct domain *d)
+{
+    bool suspended;
+
+    spin_lock(&d->shutdown_lock);
+    suspended = d->is_shut_down && d->shutdown_code == SHUTDOWN_suspend;
+    spin_unlock(&d->shutdown_lock);
+
+    return suspended;
+}
+
+static int32_t domain_psci_system_suspend_policy(struct domain *d)
+{
+    struct domain *other;
+    bool last_awake_control_domain = true;
+    bool awake_non_control_domain = false;
+
+    /* Only control domains participate in sequencing policy. */
+    if ( !is_control_domain(d) )
+        return 0;
+
+    rcu_read_lock(&domlist_read_lock);
+
+    for_each_domain ( other )
+    {
+        bool suspended;
+
+        if ( other == d )
+            continue;
+
+        suspended = domain_in_suspend_state(other);
+        if ( suspended )
+            continue;
+
+        if ( is_control_domain(other) )
+        {
+            last_awake_control_domain = false;
+            break;
+        }
+
+        awake_non_control_domain = true;
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+
+    /*
+     * Another control domain is still awake. This request is only the first
+     * phase of the sequencing: park this control domain and leave the host
+     * running. Host-wide suspend gates must not block this intermediate state.
+     */
+    if ( !last_awake_control_domain )
+        return 0;
+
+    /*
+     * This is the last awake control domain. It must not be parked unless the
+     * request can proceed as a host-suspend request; otherwise Xen would lose
+     * the last domain that can coordinate the system suspend.
+     */
+    if ( awake_non_control_domain )
+    {
+        printk(XENLOG_DEBUG
+               "SYSTEM_SUSPEND denied for %pd: non-control domains awake\n",
+               d);
+        return PSCI_DENIED;
+    }
+
+    /*
+     * Host-wide gates are relevant only for the last-control-domain case. They
+     * must not block parking of a non-last control domain, but they must deny
+     * the last control domain when host suspend is not currently available.
+     */
+    if ( !host_system_suspend_allowed() )
+        return PSCI_DENIED;
+
+    return 0;
+}
+
 static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
 {
     int32_t rc;
@@ -232,10 +316,6 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     if ( is_64bit_domain(d) && is_thumb )
         return PSCI_INVALID_ADDRESS;
 
-    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
-    if ( is_hardware_domain(d) )
-        return PSCI_NOT_SUPPORTED;
-
     /* Ensure that all CPUs other than the calling one are offline */
     domain_lock(d);
     for_each_vcpu ( d, v )
@@ -252,16 +332,29 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     if ( rc )
         return PSCI_DENIED;
 
-    rc = domain_shutdown(d, SHUTDOWN_suspend);
+    spin_lock(&vpsci_system_suspend_lock);
+
+    rc = domain_psci_system_suspend_policy(d);
+    if ( !rc )
+    {
+        rc = domain_shutdown(d, SHUTDOWN_suspend);
+        if ( rc )
+            rc = PSCI_DENIED;
+        else
+        {
+            rctx->ctxt = ctxt;
+            rctx->wake_cpu = current;
+        }
+    }
+
+    spin_unlock(&vpsci_system_suspend_lock);
+
     if ( rc )
     {
         free_vcpu_guest_context(ctxt);
-        return PSCI_DENIED;
+        return rc;
     }
 
-    rctx->ctxt = ctxt;
-    rctx->wake_cpu = current;
-
     gprintk(XENLOG_DEBUG,
             "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
             epoint, cid);
@@ -287,10 +380,9 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
     case PSCI_0_2_FN32_SYSTEM_RESET:
     case PSCI_1_0_FN32_PSCI_FEATURES:
     case ARM_SMCCC_VERSION_FID:
-        return 0;
     case PSCI_1_0_FN32_SYSTEM_SUSPEND:
     case PSCI_1_0_FN64_SYSTEM_SUSPEND:
-        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTED : 0;
+        return 0;
     default:
         return PSCI_NOT_SUPPORTED;
     }
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480ee..816a1a4ecb 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -140,6 +140,9 @@ config HAS_EX_TABLE
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
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index adb312d796..e5348b5445 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -497,6 +497,8 @@ const struct vuart_info *serial_vuart_info(int idx)
 
 #ifdef CONFIG_SYSTEM_SUSPEND
 
+static bool __ro_after_init serial_suspend_available = true;
+
 void serial_suspend(void)
 {
     int i;
@@ -513,6 +515,11 @@ void serial_resume(void)
             com[i].driver->resume(&com[i]);
 }
 
+bool serial_suspend_supported(void)
+{
+    return serial_suspend_available;
+}
+
 #endif /* CONFIG_SYSTEM_SUSPEND */
 
 void __init serial_register_uart(int idx, struct uart_driver *driver,
@@ -521,6 +528,11 @@ void __init serial_register_uart(int idx, struct uart_driver *driver,
     /* Store UART-specific info. */
     com[idx].driver = driver;
     com[idx].uart   = uart;
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( !driver->suspend || !driver->resume )
+        serial_suspend_available = false;
+#endif
 }
 
 void __init serial_async_transmit(struct serial_port *port)
diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/arm/iommu.c
index 100545e23f..547048af05 100644
--- a/xen/drivers/passthrough/arm/iommu.c
+++ b/xen/drivers/passthrough/arm/iommu.c
@@ -19,6 +19,7 @@
 #include <xen/device_tree.h>
 #include <xen/iommu.h>
 #include <xen/lib.h>
+#include <xen/suspend.h>
 
 #include <asm/device.h>
 
@@ -46,6 +47,9 @@ void __init iommu_set_ops(const struct iommu_ops *ops)
     }
 
     iommu_ops = ops;
+
+    if ( !ops->suspend || !ops->resume )
+        host_system_suspend_disable("IOMMU driver lacks suspend support");
 }
 
 int __init iommu_hardware_setup(void)
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index be8028c036..1b6bb1bc5f 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -91,6 +91,7 @@
 #include <asm/io.h>
 #include <asm/iommu_fwspec.h>
 #include <asm/platform.h>
+#include <asm/suspend.h>
 
 #include "smmu-v3.h"
 
@@ -1903,6 +1904,9 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 		}
 	}
 
+	host_system_suspend_disable(
+		"SMMUv3 MSI IRQ path is unsupported for host suspend");
+
 	/* Add callback to free MSIs on teardown */
 	devm_add_action(dev, arm_smmu_free_msis, dev);
 }
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 8e18445552..418b00ead0 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -137,6 +137,7 @@ const struct vuart_info* serial_vuart_info(int idx);
 /* Serial suspend/resume. */
 void serial_suspend(void);
 void serial_resume(void);
+bool serial_suspend_supported(void);
 #endif
 
 /*
diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
index 6f94fd53b0..a941331035 100644
--- a/xen/include/xen/suspend.h
+++ b/xen/include/xen/suspend.h
@@ -6,6 +6,8 @@
 #if __has_include(<asm/suspend.h>)
 #include <asm/suspend.h>
 #else
+struct domain;
+
 static inline void arch_domain_resume(struct domain *d) {}
 #endif
 
-- 
2.43.0


