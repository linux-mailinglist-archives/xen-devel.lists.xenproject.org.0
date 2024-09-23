Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B267097ED3B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 16:36:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802083.1212200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskAZ-0003AM-CW; Mon, 23 Sep 2024 14:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802083.1212200; Mon, 23 Sep 2024 14:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskAZ-000389-92; Mon, 23 Sep 2024 14:36:07 +0000
Received: by outflank-mailman (input) for mailman id 802083;
 Mon, 23 Sep 2024 14:36:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Zw7=QV=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sskAX-000383-Da
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 14:36:05 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 294727c3-79b9-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 16:36:04 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so332367966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 07:36:04 -0700 (PDT)
Received: from EMEAENGAAD91498 ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3f62sm1237059066b.137.2024.09.23.07.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 07:36:03 -0700 (PDT)
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
X-Inumbo-ID: 294727c3-79b9-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727102163; x=1727706963; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Caw0OhZmLSvMLMqx8WNB2nioCHyuvq4qLWaYxjfehg=;
        b=UMQh1TMM/P1aB6PiJyrPwoRcJUa1QE0XraZ0idfT6n8K4shZXJ34NVCtWoVHDaz7Ld
         oX/fyD6zFQaDhYW38ZvCeuqC1ePsaewUwNYUI2Vl3aqIGO96KUh16KPRennrp3VwX8XM
         pNMG3hdVPmtGUOGNKs2FdxBEY6K5K2iyuas9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727102163; x=1727706963;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Caw0OhZmLSvMLMqx8WNB2nioCHyuvq4qLWaYxjfehg=;
        b=ZbfifJvSMdCAJh4QZn7wadce4vEejDz80rzEWHMcb+oek39B7tk3lVsEUuC+P4uIQ1
         ZD7vm1tDzd4NlxhI3/DmMSkdJhkT9qCR89kws6jLzJLwyA2Ic/gaSZiVKk/lS+SpLAz+
         czDQ+weOVFvTqwdtD3nuAAMg9Q4FK+5RVuPmTjwMX47k884Ym3IoKkefiF8K/iLzmL2k
         zQgN5aQIb3CejiC/B07Y/d8bfwpHY+cbzoiIdkptsPfEECASmDWCMp/6+9jvAunO6G/H
         iV4Vr8Z4htbtF0b/aEGak6Aaip6GXwd/XmBp01pAiJa6EMvEekU+DnSymSVPyT8PnXZn
         sXxw==
X-Gm-Message-State: AOJu0Ywy1/U5SsxJ8OgOATWwo6DHIEpR4cphV4fC3kHUwyzhjubxC/D+
	l2h+xMwhhzm6Iw/5/vSYw1lKERdQNm40zKCZuMM38nH3vMMpO++x+WK89Jq1optk/OEYSVtZ4f9
	d
X-Google-Smtp-Source: AGHT+IHVfK24RtDDriCuKxune6jvprFVD0cG1C28GfBJtUBqOztOkrBDBOSuYtHtWIFIXwQe1EEInA==
X-Received: by 2002:a17:907:d85f:b0:a80:d913:be07 with SMTP id a640c23a62f3a-a90d56d3d84mr1128927766b.36.1727102163396;
        Mon, 23 Sep 2024 07:36:03 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:35:59 +0100
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Community Manager <community.manager@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: [PATCH] x86/APIC: Remove x2APIC pure cluster mode
Message-ID: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

With the introduction of mixed x2APIC mode (using cluster addressing for
IPIs and physical for external interrupts) the use of pure cluster mode
doesn't have any benefit.

Remove the mode itself, leaving only the code required for logical
addressing when sending IPIs.

Implements: https://gitlab.com/xen-project/xen/-/issues/189

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 CHANGELOG.md                      |  1 +
 docs/misc/xen-command-line.pandoc |  4 +--
 xen/arch/x86/Kconfig              | 12 --------
 xen/arch/x86/genapic/x2apic.c     | 50 +++----------------------------
 4 files changed, 7 insertions(+), 60 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 26e7d8dd2ac4..335e98b2e1a7 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
  - On x86:
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
+   - Remove x2APIC cluster mode, leaving only physical and mixed modes.
 
 ### Added
 
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 959cf45b55d9..5ce63044ade8 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2842,10 +2842,10 @@ the watchdog.
 Permit use of x2apic setup for SMP environments.
 
 ### x2apic-mode (x86)
-> `= physical | cluster | mixed`
+> `= physical | mixed`
 
 > Default: `physical` if **FADT** mandates physical mode, otherwise set at
->          build time by CONFIG_X2APIC_{PHYSICAL,LOGICAL,MIXED}.
+>          build time by CONFIG_X2APIC_{PHYSICAL,MIXED}.
 
 In the case that x2apic is in use, this option switches between modes to
 address APICs in the system as interrupt destinations.
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 62f0b5e0f4c5..ab862b083fce 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -275,18 +275,6 @@ config X2APIC_PHYSICAL
 	  destination inter processor interrupts (IPIs) slightly slower than
 	  Logical Destination mode.
 
-config X2APIC_CLUSTER
-	bool "Cluster Destination mode"
-	help
-	  When using this mode APICs are addressed using the Cluster Logical
-	  Destination mode.
-
-	  Cluster Destination has the benefit of sending IPIs faster since
-	  multiple APICs can be targeted as destinations of a single IPI.
-	  However the vector space is shared between all CPUs on the cluster,
-	  and hence using this mode reduces the number of available vectors
-	  when compared to Physical mode.
-
 config X2APIC_MIXED
 	bool "Mixed Destination mode"
 	help
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index d531035fa42c..c277f4f79b0a 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -63,26 +63,6 @@ static void cf_check init_apic_ldr_x2apic_cluster(void)
     cpumask_set_cpu(this_cpu, per_cpu(cluster_cpus, this_cpu));
 }
 
-static const cpumask_t *cf_check vector_allocation_cpumask_x2apic_cluster(
-    int cpu)
-{
-    return per_cpu(cluster_cpus, cpu);
-}
-
-static unsigned int cf_check cpu_mask_to_apicid_x2apic_cluster(
-    const cpumask_t *cpumask)
-{
-    unsigned int cpu = cpumask_any(cpumask);
-    unsigned int dest = per_cpu(cpu_2_logical_apicid, cpu);
-    const cpumask_t *cluster_cpus = per_cpu(cluster_cpus, cpu);
-
-    for_each_cpu ( cpu, cluster_cpus )
-        if ( cpumask_test_cpu(cpu, cpumask) )
-            dest |= per_cpu(cpu_2_logical_apicid, cpu);
-
-    return dest;
-}
-
 static void cf_check send_IPI_self_x2apic(uint8_t vector)
 {
     apic_wrmsr(APIC_SELF_IPI, vector);
@@ -169,17 +149,6 @@ static const struct genapic __initconst_cf_clobber apic_x2apic_phys = {
     .send_IPI_self = send_IPI_self_x2apic
 };
 
-static const struct genapic __initconst_cf_clobber apic_x2apic_cluster = {
-    APIC_INIT("x2apic_cluster", NULL),
-    .int_delivery_mode = dest_LowestPrio,
-    .int_dest_mode = 1 /* logical delivery */,
-    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
-    .vector_allocation_cpumask = vector_allocation_cpumask_x2apic_cluster,
-    .cpu_mask_to_apicid = cpu_mask_to_apicid_x2apic_cluster,
-    .send_IPI_mask = send_IPI_mask_x2apic_cluster,
-    .send_IPI_self = send_IPI_self_x2apic
-};
-
 /*
  * Mixed x2APIC mode: use physical for external (device) interrupts, and
  * cluster for inter processor interrupts.  Such mode has the benefits of not
@@ -252,15 +221,13 @@ static int8_t __initdata x2apic_phys = -1;
 boolean_param("x2apic_phys", x2apic_phys);
 
 enum {
-   unset, physical, cluster, mixed
+   unset, physical, mixed
 } static __initdata x2apic_mode = unset;
 
 static int __init cf_check parse_x2apic_mode(const char *s)
 {
     if ( !cmdline_strcmp(s, "physical") )
         x2apic_mode = physical;
-    else if ( !cmdline_strcmp(s, "cluster") )
-        x2apic_mode = cluster;
     else if ( !cmdline_strcmp(s, "mixed") )
         x2apic_mode = mixed;
     else
@@ -274,7 +241,7 @@ const struct genapic *__init apic_x2apic_probe(void)
 {
     /* Honour the legacy cmdline setting if it's the only one provided. */
     if ( x2apic_mode == unset && x2apic_phys >= 0 )
-        x2apic_mode = x2apic_phys ? physical : cluster;
+        x2apic_mode = x2apic_phys ? physical : mixed;
 
     if ( x2apic_mode == unset )
     {
@@ -286,21 +253,12 @@ const struct genapic *__init apic_x2apic_probe(void)
         else
             x2apic_mode = IS_ENABLED(CONFIG_X2APIC_MIXED) ? mixed
                           : (IS_ENABLED(CONFIG_X2APIC_PHYSICAL) ? physical
-                                                                : cluster);
+                                                                : mixed);
     }
 
     if ( x2apic_mode == physical )
         return &apic_x2apic_phys;
 
-    if ( x2apic_mode == cluster && iommu_intremap != iommu_intremap_full )
-    {
-        printk("WARNING: x2APIC cluster mode is not supported %s interrupt remapping -"
-               " forcing mixed mode\n",
-               iommu_intremap == iommu_intremap_off ? "without"
-                                                    : "with restricted");
-        x2apic_mode = mixed;
-    }
-
     if ( !this_cpu(cluster_cpus) )
     {
         update_clusterinfo(NULL, CPU_UP_PREPARE,
@@ -309,7 +267,7 @@ const struct genapic *__init apic_x2apic_probe(void)
         register_cpu_notifier(&x2apic_cpu_nfb);
     }
 
-    return x2apic_mode == cluster ? &apic_x2apic_cluster : &apic_x2apic_mixed;
+    return &apic_x2apic_mixed;
 }
 
 void __init check_x2apic_preenabled(void)
-- 
2.34.1


