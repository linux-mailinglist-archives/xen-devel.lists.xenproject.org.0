Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9227E04EC
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 15:48:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627192.978094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyvSM-000188-W6; Fri, 03 Nov 2023 14:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627192.978094; Fri, 03 Nov 2023 14:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyvSM-00015X-T5; Fri, 03 Nov 2023 14:47:30 +0000
Received: by outflank-mailman (input) for mailman id 627192;
 Fri, 03 Nov 2023 14:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUT0=GQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qyvSL-00015Q-Vm
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 14:47:30 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7aee650-7a57-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 15:47:26 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5094727fa67so2795525e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 07:47:26 -0700 (PDT)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c4f9400b00407efbc4361sm2762616wmq.9.2023.11.03.07.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 07:47:24 -0700 (PDT)
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
X-Inumbo-ID: e7aee650-7a57-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699022845; x=1699627645; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r9Pur53aXX6Bxw6RU57qyCCoNZ2sEuITX/v8qmBWqSI=;
        b=LTiTiY5ie5xV27aRlLRe1iO6WGaiDLQjBjxM5rP4+WRCHbPJXpLtUFARutQx97/DCc
         h8puwFoJNyoK9hzUCKj9hxiw8ikqxXdmBQ+EevF1+lO9W5OLHbradqkm32/4Mz1fvliX
         BnDZ/ja5ZBzi6+mDfZRD75tFQqW03WSNrZeOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699022845; x=1699627645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9Pur53aXX6Bxw6RU57qyCCoNZ2sEuITX/v8qmBWqSI=;
        b=FTCBp9J+mNL2fj4W/rnXICvr3/Ft+bIbSnEIZM3lL9rPCM8lwBzCjwJWsnSjSmw+wl
         5TKsO6WbcktAYoLiXwiDZfBc1vuETqELFqeF/gkM0IAl7Af3qFa9qlCAHy04khmtkUMH
         pUEgiY4xa5YjIbqwNySMqxveq07fa9Oat4Vo2oRz8xXGA4YBmJgpDms13YIV6Fcu/t0y
         IshaTBM3oCe6ZQ3cyMkMN+c2kvlymSKWsd53/H8eDivrd415+yffHmB5SDSXFJ0P+GsC
         PP6OYrY9vzqcxOrOmCv1LMNiy+h3h+QuH6ZKv/r6yS5/ngNZVJyjr9VaFo451qvKZgBl
         etLg==
X-Gm-Message-State: AOJu0YzRccXsR8dllT1WmbXrKKdp2dPX4wPn1pnX3+uHu8nmByr8jgBp
	B+65pHKPrCGB8XJbUiP4yhDSTdbLlBZ8slxbUXE=
X-Google-Smtp-Source: AGHT+IFRxypOoorYIqtQeJBu2jXYtex7/pCAcyY3jsu4/Dwx6EhK8G3WdpT3jpIhJkNt1SDErNB3mw==
X-Received: by 2002:ac2:47f4:0:b0:507:9784:644d with SMTP id b20-20020ac247f4000000b005079784644dmr15160042lfp.15.1699022845035;
        Fri, 03 Nov 2023 07:47:25 -0700 (PDT)
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
Subject: [PATCH v3] x86/x2apic: introduce a mixed physical/cluster mode
Date: Fri,  3 Nov 2023 15:45:37 +0100
Message-ID: <20231103144537.90914-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current implementation of x2APIC requires to either use Cluster Logical or
Physical mode for all interrupts.  However the selection of Physical vs Logical
is not done at APIC setup, an APIC can be addressed both in Physical or Logical
destination modes concurrently.

Introduce a new x2APIC mode called mixed, which uses Logical Cluster mode for
IPIs, and Physical mode for external interrupts, thus attempting to use the
best method for each interrupt type.

Using Physical mode for external interrupts allows more vectors to be used, and
interrupt balancing to be more accurate.

Using Logical Cluster mode for IPIs allows less accesses to the ICR register
when sending those, as multiple CPUs can be targeted with a single ICR register
write.

A simple test calling flush_tlb_all() 10000 times in a tight loop on a 96 CPU
box gives the following average figures:

Physical mode: 26617931ns
Mixed mode:    23865337ns

So ~10% improvement versus plain Physical mode.  Note that Xen uses Cluster
mode by default, and hence is already using the fastest way for IPI delivery at
the cost of reducing the amount of vectors available system-wide.

Make the newly introduced mode the default one.

Note the printing of the APIC addressing mode done in connect_bsp_APIC() has
been removed, as with the newly introduced mixed mode this would require more
fine grained printing, or else would be incorrect.  The addressing mode can
already be derived from the APIC driver in use, which is printed by different
helpers.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Split comment regarding usage of genapic fields.
 - Remove the printing of the APIC addressing mode in connect_bsp_APIC().

Changes since v1:
 - Add change log entry.
 - Fix indentation and usage of tristate in Kconfig.
 - Adjust comment regarding hooks used by external interrupts in
   apic_x2apic_mixed.
---
 CHANGELOG.md                      |  2 +
 docs/misc/xen-command-line.pandoc | 12 ++++
 xen/arch/x86/Kconfig              | 35 +++++++++--
 xen/arch/x86/apic.c               |  6 +-
 xen/arch/x86/genapic/x2apic.c     | 96 +++++++++++++++++++++++--------
 5 files changed, 116 insertions(+), 35 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index b184dde8b15f..80deba5d2550 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
 
 ### Added
+ - On x86 introduce a new x2APIC driver that uses Cluster Logical addressing
+   mode for IPIs and Physical addressing mode for external interrupts.
 
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
index eac77573bd75..cd9286f295e5 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -228,11 +228,18 @@ config XEN_ALIGN_2M
 
 endchoice
 
-config X2APIC_PHYSICAL
-	bool "x2APIC Physical Destination mode"
+choice
+	prompt "x2APIC Destination mode"
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
index 707deef98c27..875952adc42d 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -180,6 +180,34 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
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
+    /*
+     * The following fields are exclusively used by external interrupts and
+     * hence are set to use Physical destination mode handlers.
+     */
+    .int_delivery_mode = dest_Fixed,
+    .int_dest_mode = 0 /* physical delivery */,
+    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
+    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
+    /*
+     * The following fields are exclusively used by IPIs and hence are set to
+     * use Cluster Logical destination mode handlers.  Note that init_apic_ldr
+     * is not used by IPIs, but the per-CPU fields it initializes are only used
+     * by the IPI hooks.
+     */
+    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
+    .send_IPI_mask = send_IPI_mask_x2apic_cluster,
+    .send_IPI_self = send_IPI_self_x2apic
+};
+
 static int cf_check update_clusterinfo(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -220,38 +248,56 @@ static struct notifier_block x2apic_cpu_nfb = {
 static int8_t __initdata x2apic_phys = -1;
 boolean_param("x2apic_phys", x2apic_phys);
 
+enum {
+   unset, physical, cluster, mixed
+} static __initdata x2apic_mode = unset;
+
+static int __init parse_x2apic_mode(const char *s)
+{
+    if ( !cmdline_strcmp(s, "physical") )
+        x2apic_mode = physical;
+    else if ( !cmdline_strcmp(s, "cluster") )
+        x2apic_mode = cluster;
+    else if ( !cmdline_strcmp(s, "mixed") )
+        x2apic_mode = mixed;
+    else
+        return EINVAL;
+
+    return 0;
+}
+custom_param("x2apic-mode", parse_x2apic_mode);
+
 const struct genapic *__init apic_x2apic_probe(void)
 {
-    if ( x2apic_phys < 0 )
+    /* x2apic-mode option has preference over x2apic_phys. */
+    if ( x2apic_phys >= 0 && x2apic_mode == unset )
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
@@ -260,7 +306,7 @@ const struct genapic *__init apic_x2apic_probe(void)
         register_cpu_notifier(&x2apic_cpu_nfb);
     }
 
-    return &apic_x2apic_cluster;
+    return x2apic_mode == cluster ? &apic_x2apic_cluster : &apic_x2apic_mixed;
 }
 
 void __init check_x2apic_preenabled(void)
-- 
2.42.0


