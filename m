Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8C82DD462
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 16:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55981.97690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQO-0004Lu-2J; Thu, 17 Dec 2020 15:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55981.97690; Thu, 17 Dec 2020 15:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQN-0004LK-Tq; Thu, 17 Dec 2020 15:42:39 +0000
Received: by outflank-mailman (input) for mailman id 55981;
 Thu, 17 Dec 2020 15:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xKjN=FV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kpvQL-0004G9-S9
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 15:42:37 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d4cbdaf9-5fdb-4233-8850-c7547c976cfc;
 Thu, 17 Dec 2020 15:42:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D45330E;
 Thu, 17 Dec 2020 07:42:35 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BD273F66B;
 Thu, 17 Dec 2020 07:42:34 -0800 (PST)
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
X-Inumbo-ID: d4cbdaf9-5fdb-4233-8850-c7547c976cfc
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 4/8] xen/arm: create a cpuinfo structure for guest
Date: Thu, 17 Dec 2020 15:38:04 +0000
Message-Id: <8a93d20d20fae570c83c4d7bea0c882735496f34.1608214355.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>

Create a cpuinfo structure for guest and mask into it the features that
we do not support in Xen or that we do not want to publish to guests.

Modify some values in the cpuinfo structure for guests to mask some
features which we do not want to allow to guests (like AMU) or we do not
support (like SVE).
Modify some values in the guest cpuinfo structure to guests to hide some
processor features:
- SVE as this is not supported by Xen and guest are not allowed to use
this features (ZEN is set to 0 in CPTR_EL2).
- AMU as HCPTR_TAM is set in CPTR_EL2 so AMU cannot be used by guests
All other bits are left untouched.
- RAS as this is not supported by Xen.

The code is trying to group together registers modifications for the
same feature to be able in the long term to easily enable/disable a
feature depending on user parameters or add other registers modification
in the same place (like enabling/disabling HCR bits).

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in V2: Rebase
Changes in V3:
  Use current_cpu_data info instead of recalling identify_cpu
Changes in V4:
  Use boot_cpu_data instead of current_cpu_data
  Use "hide XX support" instead of disable as this part of the code is
  actually only hidding feature to guests but not disabling them (this
  is done through the HCR register).
  Modify commit message to be more clear about what is done in
  guest_cpuinfo.

---
 xen/arch/arm/cpufeature.c        | 51 ++++++++++++++++++++++++++++++++
 xen/include/asm-arm/cpufeature.h |  2 ++
 2 files changed, 53 insertions(+)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 86b99ee960..1f6a85aafe 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -24,6 +24,8 @@
 
 DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
 
+struct cpuinfo_arm __read_mostly guest_cpuinfo;
+
 void update_cpu_capabilities(const struct arm_cpu_capabilities *caps,
                              const char *info)
 {
@@ -151,6 +153,55 @@ void identify_cpu(struct cpuinfo_arm *c)
         c->mvfr.bits[2] = READ_SYSREG(MVFR2_EL1);
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
+    guest_cpuinfo = boot_cpu_data;
+
+#ifdef CONFIG_ARM_64
+    /* Hide MPAM support as xen does not support it */
+    guest_cpuinfo.pfr64.mpam = 0;
+    guest_cpuinfo.pfr64.mpam_frac = 0;
+
+    /* Hide SVE as Xen does not support it */
+    guest_cpuinfo.pfr64.sve = 0;
+    guest_cpuinfo.zfr64.bits[0] = 0;
+
+    /* Hide MTE support as Xen does not support it */
+    guest_cpuinfo.pfr64.mte = 0;
+#endif
+
+    /* Hide AMU support */
+#ifdef CONFIG_ARM_64
+    guest_cpuinfo.pfr64.amu = 0;
+#endif
+    guest_cpuinfo.pfr32.amu = 0;
+
+    /* Hide RAS support as Xen does not support it */
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
index 74139be1cc..6058744c18 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -283,6 +283,8 @@ extern void identify_cpu(struct cpuinfo_arm *);
 extern struct cpuinfo_arm cpu_data[];
 #define current_cpu_data cpu_data[smp_processor_id()]
 
+extern struct cpuinfo_arm guest_cpuinfo;
+
 #endif /* __ASSEMBLY__ */
 
 #endif
-- 
2.17.1


