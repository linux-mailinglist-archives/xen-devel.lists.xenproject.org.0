Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F417E26CC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 15:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628035.979048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00aW-0005tT-4t; Mon, 06 Nov 2023 14:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628035.979048; Mon, 06 Nov 2023 14:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00aW-0005qx-20; Mon, 06 Nov 2023 14:28:24 +0000
Received: by outflank-mailman (input) for mailman id 628035;
 Mon, 06 Nov 2023 14:28:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruOg=GT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r00aU-0005qR-7z
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 14:28:22 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb514086-7cb0-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 15:28:19 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50939d39d0fso5895688e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 06:28:19 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 h16-20020a05600004d000b0032dbf99bf4fsm9748253wri.89.2023.11.06.06.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 06:28:17 -0800 (PST)
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
X-Inumbo-ID: bb514086-7cb0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699280898; x=1699885698; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bggPV/g63AZVzvaMXpD354U5ftKOCvH5qww65SI6YY=;
        b=l3g6Dq4vynhq+gGj4e5e4nH3LK+qruFwplPJAiy/DfQHm513i2EzSQoZIDg5bPSPpi
         ECLrGFlXzdd5bw4R8Iraul0eXr9+bfVRaI+HSD0o8v05LVQHGe3Iip50qn+Vy0dzLGVH
         Vxz5s98bGiYKmYjauhOiVYm9VfA6D5cyE1oCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699280898; x=1699885698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bggPV/g63AZVzvaMXpD354U5ftKOCvH5qww65SI6YY=;
        b=BBbPqqx5FnYp/XlKJnI5dyd7grMBcDi5krxgn6Y03ZO2JhCzCWhDvhxAE2Y89MpMm2
         oWbMK8sskzCH0NnuW/wSCV+JAMtPBxi1uEZJeAMZMeUlQ6m5AmCzQ0FyPERxEWC51yxH
         xAjk9w4h8rXKol/uXwKULv63Tp6YvBs+2ojiePk4L2oZd7lT5Q819guM/bSfEEjuCt4R
         5mg99FO1PH2TR+GtXpcK+0rLj8E0AkZBav3+U33w1+NaIWylrOviAkuFDy6GT4Oa6XJl
         o4eSg8AIV9aMsE6n8kTYgTtniATnzZ6Ruhz4fZFObyh7gaoC3Tk8vRjxeW2DKpPXVubd
         3ZKQ==
X-Gm-Message-State: AOJu0Yzq8oD1mVQ8poktNVic5FIDCBzw3DMLBK1ujAnjnRecMDpoY2l8
	cw2GbUaY7ovZg8NxhrYP0TV+xEUDt9/8rsVlWDw=
X-Google-Smtp-Source: AGHT+IEI8jt9waQPm9QfY5EF4YHvv2xk2jebXW61g4Rqv3tkCs3fQNNBAb+wxzQPJEZqKjVGVSsLjg==
X-Received: by 2002:a05:6512:4845:b0:500:acf1:b432 with SMTP id ep5-20020a056512484500b00500acf1b432mr23568668lfb.63.1699280898163;
        Mon, 06 Nov 2023 06:28:18 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4] x86/x2apic: introduce a mixed physical/cluster mode
Date: Mon,  6 Nov 2023 15:27:39 +0100
Message-ID: <20231106142739.19650-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current implementation of x2APIC requires to either use Cluster Logical or
Physical mode for all interrupts.  However the selection of Physical vs Logical
is not done at APIC setup, an APIC can be addressed both in Physical or Logical
destination modes concurrently.

Introduce a new x2APIC mode called Mixed, which uses Logical Cluster mode for
IPIs, and Physical mode for external interrupts, thus attempting to use the
best method for each interrupt type.

Using Physical mode for external interrupts allows more vectors to be used, and
interrupt balancing to be more accurate.

Using Logical Cluster mode for IPIs allows fewer accesses to the ICR register
when sending those, as multiple CPUs can be targeted with a single ICR register
write.

A simple test calling flush_tlb_all() 10000 times on a tight loop on AMD EPYC
9754 with 512 CPUs gives the following figures in nano seconds:

x mixed
+ phys
* cluster
    N           Min           Max        Median           Avg        Stddev
x  25 3.5131328e+08 3.5716441e+08 3.5410987e+08 3.5432659e+08     1566737.4
+  12  1.231082e+09  1.238824e+09 1.2370528e+09 1.2357981e+09     2853892.9
Difference at 95.0% confidence
	8.81472e+08 +/- 1.46849e+06
	248.774% +/- 0.96566%
	(Student's t, pooled s = 2.05985e+06)
*  11 3.5099276e+08 3.5561459e+08 3.5461234e+08 3.5415668e+08     1415071.9
No difference proven at 95.0% confidence

So Mixed has no difference when compared to Cluster mode, and Physical mode is
248% slower when compared to either Mixed or Cluster modes with a 95%
confidence.

Note that Xen uses Cluster mode by default, and hence is already using the
fastest way for IPI delivery at the cost of reducing the amount of vectors
available system-wide.

Make the newly introduced mode the default one.

Note the printing of the APIC addressing mode done in connect_bsp_APIC() has
been removed, as with the newly introduced mixed mode this would require more
fine grained printing, or else would be incorrect.  The addressing mode can
already be derived from the APIC driver in use, which is printed by different
helpers.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Rename Kconfig option.
 - Cosmetic code fixes.
 - Return negative error from parse_x2apic_mode().
 - Add cf_check attribute to cmdline parsing hook.
 - Add more figures re the performance difference.

Changes since v2:
 - Split comment regarding usage of genapic fields.
 - Remove the printing of the APIC addressing mode in connect_bsp_APIC().

Changes since v1:
 - Add change log entry.
 - Fix indentation and usage of tristate in Kconfig.
 - Adjust comment regarding hooks used by external interrupts in
   apic_x2apic_mixed.
---
 CHANGELOG.md                      |  3 +
 docs/misc/xen-command-line.pandoc | 12 ++++
 xen/arch/x86/Kconfig              | 35 +++++++++--
 xen/arch/x86/apic.c               |  6 +-
 xen/arch/x86/genapic/x2apic.c     | 98 +++++++++++++++++++++++--------
 5 files changed, 119 insertions(+), 35 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index b184dde8b15f..c341c9d0bf5d 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
 
 ### Added
+ - On x86:
+   - Introduce a new x2APIC driver that uses Cluster Logical addressing mode
+     for IPIs and Physical addressing mode for external interrupts.
 
 ### Removed
 
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 9a19a04157cb..8e65f8bd18bf 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2804,6 +2804,15 @@ the watchdog.
 
 Permit use of x2apic setup for SMP environments.
 
+### x2apic-mode (x86)
+> `= physical | cluster | mixed`
+
+> Default: `physical` if **FADT** mandates physical mode, otherwise set at
+>          build time by CONFIG_X2APIC_{PHYSICAL,LOGICAL,MIXED}.
+
+In the case that x2apic is in use, this option switches between modes to
+address APICs in the system as interrupt destinations.
+
 ### x2apic_phys (x86)
 > `= <boolean>`
 
@@ -2814,6 +2823,9 @@ In the case that x2apic is in use, this option switches between physical and
 clustered mode.  The default, given no hint from the **FADT**, is cluster
 mode.
 
+**WARNING: `x2apic_phys` is deprecated and superseded by `x2apic-mode`.
+The latter takes precedence if both are set.**
+
 ### xenheap_megabytes (arm32)
 > `= <size>`
 
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index eac77573bd75..1acdffc51c22 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -228,11 +228,18 @@ config XEN_ALIGN_2M
 
 endchoice
 
-config X2APIC_PHYSICAL
-	bool "x2APIC Physical Destination mode"
+choice
+	prompt "x2APIC Driver default"
+	default X2APIC_MIXED
 	help
-	  Use x2APIC Physical Destination mode by default when available.
+	  Select APIC addressing when x2APIC is enabled.
+
+	  The default mode is mixed which should provide the best aspects
+	  of both physical and cluster modes.
 
+config X2APIC_PHYSICAL
+	bool "Physical Destination mode"
+	help
 	  When using this mode APICs are addressed using the Physical
 	  Destination mode, which allows using all dynamic vectors on each
 	  CPU independently.
@@ -242,9 +249,27 @@ config X2APIC_PHYSICAL
 	  destination inter processor interrupts (IPIs) slightly slower than
 	  Logical Destination mode.
 
-	  The mode when this option is not selected is Logical Destination.
+config X2APIC_CLUSTER
+	bool "Cluster Destination mode"
+	help
+	  When using this mode APICs are addressed using the Cluster Logical
+	  Destination mode.
+
+	  Cluster Destination has the benefit of sending IPIs faster since
+	  multiple APICs can be targeted as destinations of a single IPI.
+	  However the vector space is shared between all CPUs on the cluster,
+	  and hence using this mode reduces the number of available vectors
+	  when compared to Physical mode.
 
-	  If unsure, say N.
+config X2APIC_MIXED
+	bool "Mixed Destination mode"
+	help
+	  When using this mode APICs are addressed using the Cluster Logical
+	  Destination mode for IPIs and Physical mode for external interrupts.
+
+	  Should provide the best of both modes.
+
+endchoice
 
 config GUEST
 	bool
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index f1264ce7ed1e..6acdd0ec1468 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -229,11 +229,7 @@ void __init connect_bsp_APIC(void)
         outb(0x01, 0x23);
     }
 
-    printk("Enabling APIC mode:  %s.  Using %d I/O APICs\n",
-           !INT_DEST_MODE ? "Physical"
-                          : init_apic_ldr == init_apic_ldr_flat ? "Flat"
-                                                                : "Clustered",
-           nr_ioapics);
+    printk("Enabling APIC mode.  Using %d I/O APICs\n", nr_ioapics);
     enable_apic_mode();
 }
 
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 707deef98c27..b88c7a96fe3e 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -180,6 +180,36 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
     .send_IPI_self = send_IPI_self_x2apic
 };
 
+/*
+ * Mixed x2APIC mode: use physical for external (device) interrupts, and
+ * cluster for inter processor interrupts.  Such mode has the benefits of not
+ * sharing the vector space with all CPUs on the cluster, while still allowing
+ * IPIs to be more efficiently delivered by not having to perform an ICR write
+ * for each target CPU.
+ */
+static const struct genapic __initconstrel apic_x2apic_mixed = {
+    APIC_INIT("x2apic_mixed", NULL),
+
+    /*
+     * The following fields are exclusively used by external interrupts and
+     * hence are set to use Physical destination mode handlers.
+     */
+    .int_delivery_mode = dest_Fixed,
+    .int_dest_mode = 0 /* physical delivery */,
+    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
+    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
+
+    /*
+     * The following fields are exclusively used by IPIs and hence are set to
+     * use Cluster Logical destination mode handlers.  Note that init_apic_ldr
+     * is not used by IPIs, but the per-CPU fields it initializes are only used
+     * by the IPI hooks.
+     */
+    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
+    .send_IPI_mask = send_IPI_mask_x2apic_cluster,
+    .send_IPI_self = send_IPI_self_x2apic,
+};
+
 static int cf_check update_clusterinfo(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -220,38 +250,56 @@ static struct notifier_block x2apic_cpu_nfb = {
 static int8_t __initdata x2apic_phys = -1;
 boolean_param("x2apic_phys", x2apic_phys);
 
+enum {
+   unset, physical, cluster, mixed
+} static __initdata x2apic_mode = unset;
+
+static int __init cf_check parse_x2apic_mode(const char *s)
+{
+    if ( !cmdline_strcmp(s, "physical") )
+        x2apic_mode = physical;
+    else if ( !cmdline_strcmp(s, "cluster") )
+        x2apic_mode = cluster;
+    else if ( !cmdline_strcmp(s, "mixed") )
+        x2apic_mode = mixed;
+    else
+        return -EINVAL;
+
+    return 0;
+}
+custom_param("x2apic-mode", parse_x2apic_mode);
+
 const struct genapic *__init apic_x2apic_probe(void)
 {
-    if ( x2apic_phys < 0 )
+    /* Honour the legacy cmdline setting if it's the only one provided. */
+    if ( x2apic_mode == unset && x2apic_phys >= 0 )
+        x2apic_mode = x2apic_phys ? physical : cluster;
+
+    if ( x2apic_mode == unset )
     {
-        /*
-         * Force physical mode if there's no (full) interrupt remapping support:
-         * The ID in clustered mode requires a 32 bit destination field due to
-         * the usage of the high 16 bits to hold the cluster ID.
-         */
-        x2apic_phys = iommu_intremap != iommu_intremap_full ||
-                      (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
-                      IS_ENABLED(CONFIG_X2APIC_PHYSICAL);
-    }
-    else if ( !x2apic_phys )
-        switch ( iommu_intremap )
+        if ( acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL )
         {
-        case iommu_intremap_off:
-        case iommu_intremap_restricted:
-            printk("WARNING: x2APIC cluster mode is not supported %s interrupt remapping -"
-                   " forcing phys mode\n",
-                   iommu_intremap == iommu_intremap_off ? "without"
-                                                        : "with restricted");
-            x2apic_phys = true;
-            break;
-
-        case iommu_intremap_full:
-            break;
+            printk(XENLOG_INFO "ACPI FADT forcing x2APIC physical mode\n");
+            x2apic_mode = physical;
         }
+        else
+            x2apic_mode = IS_ENABLED(CONFIG_X2APIC_MIXED) ? mixed
+                          : (IS_ENABLED(CONFIG_X2APIC_PHYSICAL) ? physical
+                                                                : cluster);
+    }
 
-    if ( x2apic_phys )
+    if ( x2apic_mode == physical )
         return &apic_x2apic_phys;
 
+    if ( x2apic_mode == cluster && iommu_intremap != iommu_intremap_full )
+    {
+        printk("WARNING: x2APIC cluster mode is not supported %s interrupt remapping -"
+               " forcing mixed mode\n",
+               iommu_intremap == iommu_intremap_off ? "without"
+                                                    : "with restricted");
+        x2apic_mode = mixed;
+    }
+
     if ( !this_cpu(cluster_cpus) )
     {
         update_clusterinfo(NULL, CPU_UP_PREPARE,
@@ -260,7 +308,7 @@ const struct genapic *__init apic_x2apic_probe(void)
         register_cpu_notifier(&x2apic_cpu_nfb);
     }
 
-    return &apic_x2apic_cluster;
+    return x2apic_mode == cluster ? &apic_x2apic_cluster : &apic_x2apic_mixed;
 }
 
 void __init check_x2apic_preenabled(void)
-- 
2.42.0


