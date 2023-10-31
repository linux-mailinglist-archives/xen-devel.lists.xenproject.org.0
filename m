Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89547DCFD0
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 16:00:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625877.975618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxqDh-00086G-Cs; Tue, 31 Oct 2023 14:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625877.975618; Tue, 31 Oct 2023 14:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxqDh-00084I-AA; Tue, 31 Oct 2023 14:59:53 +0000
Received: by outflank-mailman (input) for mailman id 625877;
 Tue, 31 Oct 2023 14:59:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G+CR=GN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxqDf-00084C-Gf
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 14:59:51 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23dc02ce-77fe-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 15:59:50 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so889356466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 07:59:50 -0700 (PDT)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 lh8-20020a170906f8c800b009b9a1714524sm1120553ejb.12.2023.10.31.07.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 07:59:49 -0700 (PDT)
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
X-Inumbo-ID: 23dc02ce-77fe-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698764389; x=1699369189; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KuzpbS4fwfRka9b9tPPjC0VNVS6l0XU92FJciA9DmYI=;
        b=cMagSHhDrHMh9BBG8HkzCSTgmUOxR7Cu+mz1PFx8/m0wv2Q7tOFOnEU6kBtYq8fPPM
         z8YiJJ/Iwn4qzKC7LbpV4sfFJGRImcG67aDZwsi8PSmryzUE36MSxTtrnIyxi6d9ThpK
         c1MUGXpLh4HuOZHZG8FC+OOI8yHHcoxJ2S514=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698764389; x=1699369189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuzpbS4fwfRka9b9tPPjC0VNVS6l0XU92FJciA9DmYI=;
        b=WElt7PK3SqX084+kC6SOYbmYoVXZjxNpcBAuFaZX13C5BIxF6IwLWx6nldCGra5Jlp
         ob4pqzrNPo/GhztB4Lp1jycLbinTVK8uZz75i7orZ0VB9xaFE534l/rkxdAPgiFZwSK3
         OopD1sH2k0x6luolgo5/QS1Uy3iQchke7GqeXnXoNzAlHIHivHvVHSG8omwMzpFXVCIU
         QCfFPvKhh3HqTcE4DMoaW6L2cIhY5DLk+DlME06mFusESLPHxvVQhg8fcRgduzbBZyDr
         6ZjrMKkC53VOvwkHKGEQtNuFjT/OS1KRgo57rxtttIvrSpYs2NlxWnHX80OuFIiZdP4d
         pziA==
X-Gm-Message-State: AOJu0YyQkcJNNKjf6/2jSUAGiHwXWQLiZQoNZsu4gtk4t0+oLP0GQV4M
	KCfc3pHc20uGTVmLPFBBJjdsDErWBBc1l1M8MSs=
X-Google-Smtp-Source: AGHT+IHRM3ANT4HmLWz0pLruGFoi2Ue6wtq1mf8hRII6GHCwBjEs1jinPMEiPFaiBg7YkVhOPzFs7A==
X-Received: by 2002:a17:907:9496:b0:9a5:a0c6:9e8e with SMTP id dm22-20020a170907949600b009a5a0c69e8emr11149460ejc.31.1698764389483;
        Tue, 31 Oct 2023 07:59:49 -0700 (PDT)
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
Subject: [PATCH v2] x86/x2apic: introduce a mixed physical/cluster mode
Date: Tue, 31 Oct 2023 15:52:59 +0100
Message-ID: <20231031145259.77199-1-roger.pau@citrix.com>
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

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Add change log entry.
 - Fix indentation and usage of tristate in Kconfig.
 - Adjust comment regarding hooks used by external interrupts in
   apic_x2apic_mixed.
---
 CHANGELOG.md                      |  6 ++
 docs/misc/xen-command-line.pandoc | 12 ++++
 xen/arch/x86/Kconfig              | 35 ++++++++++--
 xen/arch/x86/genapic/x2apic.c     | 91 ++++++++++++++++++++++---------
 4 files changed, 114 insertions(+), 30 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 3ca796969990..9b04849b0336 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,6 +4,12 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
+## [unstable UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+
+### Added
+ - On x86 introduce a new x2APIC driver that uses Cluster Logical addressing
+   mode for IPIs and Physical addressing mode for external interrupts.
+
 ## [4.18.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-XX-XX
 
 ### Changed
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6b07d0f3a17f..cbe9b4802c61 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2802,6 +2802,15 @@ the watchdog.
 
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
 
@@ -2812,6 +2821,9 @@ In the case that x2apic is in use, this option switches between physical and
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
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 707deef98c27..7af1a21308b6 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -180,6 +180,29 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
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
+     * NB: IPIs use the send_IPI_{mask,self} hooks only, other fields are
+     * exclusively used by external interrupts and hence are set to use
+     * Physical destination mode handlers.
+     */
+    .int_delivery_mode = dest_Fixed,
+    .int_dest_mode = 0 /* physical delivery */,
+    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
+    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
+    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
+    .send_IPI_mask = send_IPI_mask_x2apic_cluster,
+    .send_IPI_self = send_IPI_self_x2apic
+};
+
 static int cf_check update_clusterinfo(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -220,38 +243,56 @@ static struct notifier_block x2apic_cpu_nfb = {
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
@@ -260,7 +301,7 @@ const struct genapic *__init apic_x2apic_probe(void)
         register_cpu_notifier(&x2apic_cpu_nfb);
     }
 
-    return &apic_x2apic_cluster;
+    return x2apic_mode == cluster ? &apic_x2apic_cluster : &apic_x2apic_mixed;
 }
 
 void __init check_x2apic_preenabled(void)
-- 
2.42.0


