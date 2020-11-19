Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D874B2B98F5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 18:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31210.61523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnQC-0007iv-0g; Thu, 19 Nov 2020 17:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31210.61523; Thu, 19 Nov 2020 17:08:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnQB-0007iW-TW; Thu, 19 Nov 2020 17:08:35 +0000
Received: by outflank-mailman (input) for mailman id 31210;
 Thu, 19 Nov 2020 17:08:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfnQA-0007hU-5l
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:08:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfnQ9-0000ur-Nh; Thu, 19 Nov 2020 17:08:33 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfnQA-0000U1-DT; Thu, 19 Nov 2020 17:08:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfnQA-0007hU-5l
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=Svrds4fjq26e/xBeepsLn7GM+LTQUjWZi4AUjhu+NNc=; b=F7FE+1ymFhHucWhrTjgG7Yq1x
	yAm9CdYzA3GaNseWuMaPq4j72+KyEF50J6e4fqB2qB0Qf9mKUh4xPzoKbapPwQIAx2vOz9cljFUqU
	C37+DNiGyurxwkUqtjjsJUNlPZJSwiZ6ARLBfc7K1qkUUYyhAKpfO5MqDPDliha7PMWc4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfnQ9-0000ur-Nh; Thu, 19 Nov 2020 17:08:33 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfnQA-0000U1-DT; Thu, 19 Nov 2020 17:08:34 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 1/3] xen/arm: gic: acpi: Guard helpers to build the MADT with CONFIG_ACPI
Date: Thu, 19 Nov 2020 17:08:27 +0000
Message-Id: <20201119170829.9923-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119170829.9923-1-julien@xen.org>
References: <20201119170829.9923-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

gic_make_hwdom_madt() and gic_get_hwdom_madt_size() are ACPI specific.

While they build fine today, this will change in a follow-up patch.
Rather than trying to fix the build on ACPI, it is best to avoid
compiling the helpers and the associated callbacks when CONFIG_ACPI=n.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v4:
        - Patch added
---
 xen/arch/arm/gic-v2.c     |  8 +++-----
 xen/arch/arm/gic-v3.c     | 11 ++---------
 xen/arch/arm/gic.c        |  2 ++
 xen/include/asm-arm/gic.h | 10 ++++++++--
 4 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 0f747538dbcd..581ea5ba6b2c 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1114,12 +1114,12 @@ static int gicv2_iomem_deny_access(const struct domain *d)
     return iomem_deny_access(d, mfn, mfn + nr);
 }
 
+#ifdef CONFIG_ACPI
 static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain *d)
 {
     return 0;
 }
 
-#ifdef CONFIG_ACPI
 static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
 {
     struct acpi_subtable_header *header;
@@ -1248,10 +1248,6 @@ static void __init gicv2_acpi_init(void)
 }
 #else
 static void __init gicv2_acpi_init(void) { }
-static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
-{
-    return 0;
-}
 #endif
 
 static int __init gicv2_init(void)
@@ -1357,8 +1353,10 @@ const static struct gic_hw_operations gicv2_ops = {
     .read_apr            = gicv2_read_apr,
     .read_pending_state  = gicv2_read_pending_state,
     .make_hwdom_dt_node  = gicv2_make_hwdom_dt_node,
+#ifdef CONFIG_ACPI
     .make_hwdom_madt     = gicv2_make_hwdom_madt,
     .get_hwdom_extra_madt_size = gicv2_get_hwdom_extra_madt_size,
+#endif
     .map_hwdom_extra_mappings = gicv2_map_hwdown_extra_mappings,
     .iomem_deny_access   = gicv2_iomem_deny_access,
     .do_LPI              = gicv2_do_LPI,
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 0f6cbf6224e9..2a344393a0e4 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1735,15 +1735,6 @@ static void __init gicv3_acpi_init(void)
 }
 #else
 static void __init gicv3_acpi_init(void) { }
-static int gicv3_make_hwdom_madt(const struct domain *d, u32 offset)
-{
-    return 0;
-}
-
-static unsigned long gicv3_get_hwdom_extra_madt_size(const struct domain *d)
-{
-    return 0;
-}
 #endif
 
 static bool gic_dist_supports_lpis(void)
@@ -1858,8 +1849,10 @@ static const struct gic_hw_operations gicv3_ops = {
     .read_pending_state  = gicv3_read_pending_state,
     .secondary_init      = gicv3_secondary_cpu_init,
     .make_hwdom_dt_node  = gicv3_make_hwdom_dt_node,
+#ifdef CONFIG_ACPI
     .make_hwdom_madt     = gicv3_make_hwdom_madt,
     .get_hwdom_extra_madt_size = gicv3_get_hwdom_extra_madt_size,
+#endif
     .iomem_deny_access   = gicv3_iomem_deny_access,
     .do_LPI              = gicv3_do_LPI,
 };
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index d623c57cb9fa..fe60619e99cf 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -443,6 +443,7 @@ int gic_make_hwdom_dt_node(const struct domain *d,
     return gic_hw_ops->make_hwdom_dt_node(d, gic, fdt);
 }
 
+#ifdef CONFIG_ACPI
 int gic_make_hwdom_madt(const struct domain *d, u32 offset)
 {
     return gic_hw_ops->make_hwdom_madt(d, offset);
@@ -459,6 +460,7 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d)
 
     return madt_size;
 }
+#endif
 
 int gic_iomem_deny_access(const struct domain *d)
 {
diff --git a/xen/include/asm-arm/gic.h b/xen/include/asm-arm/gic.h
index ba870523bb2a..ad0f7452d005 100644
--- a/xen/include/asm-arm/gic.h
+++ b/xen/include/asm-arm/gic.h
@@ -378,12 +378,14 @@ struct gic_hw_operations {
     /* Create GIC node for the hardware domain */
     int (*make_hwdom_dt_node)(const struct domain *d,
                               const struct dt_device_node *gic, void *fdt);
+#ifdef CONFIG_ACPI
     /* Create MADT table for the hardware domain */
     int (*make_hwdom_madt)(const struct domain *d, u32 offset);
-    /* Map extra GIC MMIO, irqs and other hw stuffs to the hardware domain. */
-    int (*map_hwdom_extra_mappings)(struct domain *d);
     /* Query the size of hardware domain madt table */
     unsigned long (*get_hwdom_extra_madt_size)(const struct domain *d);
+#endif
+    /* Map extra GIC MMIO, irqs and other hw stuffs to the hardware domain. */
+    int (*map_hwdom_extra_mappings)(struct domain *d);
     /* Deny access to GIC regions */
     int (*iomem_deny_access)(const struct domain *d);
     /* Handle LPIs, which require special handling */
@@ -435,8 +437,12 @@ void register_gic_ops(const struct gic_hw_operations *ops);
 int gic_make_hwdom_dt_node(const struct domain *d,
                            const struct dt_device_node *gic,
                            void *fdt);
+
+#ifdef CONFIG_ACPI
 int gic_make_hwdom_madt(const struct domain *d, u32 offset);
 unsigned long gic_get_hwdom_madt_size(const struct domain *d);
+#endif
+
 int gic_map_hwdom_extra_mappings(struct domain *d);
 int gic_iomem_deny_access(const struct domain *d);
 
-- 
2.17.1


