Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5152C8690
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 15:23:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41179.74324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjk52-00027X-9W; Mon, 30 Nov 2020 14:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41179.74324; Mon, 30 Nov 2020 14:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjk52-00026n-3F; Mon, 30 Nov 2020 14:23:04 +0000
Received: by outflank-mailman (input) for mailman id 41179;
 Mon, 30 Nov 2020 14:23:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DnPL=FE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kjk50-00022w-AC
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 14:23:02 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 68dbe204-06ab-4ef6-a8e6-cfc63250b524;
 Mon, 30 Nov 2020 14:23:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81EFB1042;
 Mon, 30 Nov 2020 06:23:01 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D23CF3F71F;
 Mon, 30 Nov 2020 06:23:00 -0800 (PST)
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
X-Inumbo-ID: 68dbe204-06ab-4ef6-a8e6-cfc63250b524
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/7] xen/arm: create a cpuinfo structure for guest
Date: Mon, 30 Nov 2020 14:21:39 +0000
Message-Id: <539cc9c817a80e35a2532dba5bc01e9b2533ff56.1606742184.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606742184.git.bertrand.marquis@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1606742184.git.bertrand.marquis@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>

Create a cpuinfo structure for guest and mask into it the features that
we do not support in Xen or that we do not want to publish to guests.

Modify some values in the cpuinfo structure for guests to mask some
features which we do not want to allow to guests (like AMU) or we do not
support (like SVE).

The code is trying to group together registers modifications for the
same feature to be able in the long term to easily enable/disable a
feature depending on user parameters or add other registers modification
in the same place (like enabling/disabling HCR bits).

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in V2: rebase
---
 xen/arch/arm/cpufeature.c        | 51 ++++++++++++++++++++++++++++++++
 xen/include/asm-arm/cpufeature.h |  2 ++
 2 files changed, 53 insertions(+)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 204be9b084..309941ff37 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -24,6 +24,8 @@
 
 DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
 
+struct cpuinfo_arm __read_mostly guest_cpuinfo;
+
 void update_cpu_capabilities(const struct arm_cpu_capabilities *caps,
                              const char *info)
 {
@@ -156,6 +158,55 @@ void identify_cpu(struct cpuinfo_arm *c)
 #endif
 }
 
+/*
+ * This function is creating a cpuinfo structure with values modified to mask
+ * all cpu features that should not be published to guest.
+ * The created structure is then used to provide ID registers values to guests.
+ */
+static int __init create_guest_cpuinfo(void)
+{
+    /*
+     * TODO: The code is currently using only the features detected on the boot
+     * core. In the long term we should try to compute values containing only
+     * features supported by all cores.
+     */
+    identify_cpu(&guest_cpuinfo);
+
+#ifdef CONFIG_ARM_64
+    /* Disable MPAM as xen does not support it */
+    guest_cpuinfo.pfr64.mpam = 0;
+    guest_cpuinfo.pfr64.mpam_frac = 0;
+
+    /* Disable SVE as Xen does not support it */
+    guest_cpuinfo.pfr64.sve = 0;
+    guest_cpuinfo.zfr64.bits[0] = 0;
+
+    /* Disable MTE as Xen does not support it */
+    guest_cpuinfo.pfr64.mte = 0;
+#endif
+
+    /* Disable AMU */
+#ifdef CONFIG_ARM_64
+    guest_cpuinfo.pfr64.amu = 0;
+#endif
+    guest_cpuinfo.pfr32.amu = 0;
+
+    /* Disable RAS as Xen does not support it */
+#ifdef CONFIG_ARM_64
+    guest_cpuinfo.pfr64.ras = 0;
+    guest_cpuinfo.pfr64.ras_frac = 0;
+#endif
+    guest_cpuinfo.pfr32.ras = 0;
+    guest_cpuinfo.pfr32.ras_frac = 0;
+
+    return 0;
+}
+/*
+ * This function needs to be run after all smp are started to have
+ * cpuinfo structures for all cores.
+ */
+__initcall(create_guest_cpuinfo);
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 64354c3f19..0ab6dd42a0 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -290,6 +290,8 @@ extern void identify_cpu(struct cpuinfo_arm *);
 extern struct cpuinfo_arm cpu_data[];
 #define current_cpu_data cpu_data[smp_processor_id()]
 
+extern struct cpuinfo_arm guest_cpuinfo;
+
 #endif /* __ASSEMBLY__ */
 
 #endif
-- 
2.17.1


