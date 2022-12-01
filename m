Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE49A63F521
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:20:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451056.708674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mIa-0007eC-4X; Thu, 01 Dec 2022 16:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451056.708674; Thu, 01 Dec 2022 16:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mIa-0007aO-0S; Thu, 01 Dec 2022 16:20:32 +0000
Received: by outflank-mailman (input) for mailman id 451056;
 Thu, 01 Dec 2022 16:20:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0mCF-00075z-0U
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:13:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 28c57f2a-7193-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:13:57 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1260D6E;
 Thu,  1 Dec 2022 08:14:03 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E7EC3F73B;
 Thu,  1 Dec 2022 08:13:56 -0800 (PST)
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
X-Inumbo-ID: 28c57f2a-7193-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 14/21] xen/arm: vIOMMU: IOMMU device tree node for dom0
Date: Thu,  1 Dec 2022 16:02:38 +0000
Message-Id: <544b8450c977f6d005f1d9adee8e0ff33b9bd3ec.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XEN will create an IOMMU device tree node in the device tree
to enable the dom0 to discover the virtual SMMUv3 during dom0 boot.
IOMMU device tree node will only be created when cmdline option viommu
is enabled.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/domain_build.c       | 94 +++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/viommu.h |  1 +
 2 files changed, 95 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a5295e8c3e..b82121beb5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2233,6 +2233,95 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
+#ifdef CONFIG_VIRTUAL_IOMMU
+static int make_hwdom_viommu_node(const struct kernel_info *kinfo)
+{
+    uint32_t len;
+    int res;
+    char buf[24];
+    void *fdt = kinfo->fdt;
+    const void *prop = NULL;
+    const struct dt_device_node *iommu = NULL;
+    struct host_iommu *iommu_data;
+    gic_interrupt_t intr;
+
+    if ( list_empty(&host_iommu_list) )
+        return 0;
+
+    list_for_each_entry( iommu_data, &host_iommu_list, entry )
+    {
+        if ( iommu_data->hwdom_node_created )
+            return 0;
+
+        iommu = iommu_data->dt_node;
+
+        snprintf(buf, sizeof(buf), "iommu@%"PRIx64, iommu_data->addr);
+
+        res = fdt_begin_node(fdt, buf);
+        if ( res )
+            return res;
+
+        prop = dt_get_property(iommu, "compatible", &len);
+        if ( !prop )
+        {
+            res = -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res = fdt_property(fdt, "compatible", prop, len);
+        if ( res )
+            return res;
+
+        if ( iommu->phandle )
+        {
+            res = fdt_property_cell(fdt, "phandle", iommu->phandle);
+            if ( res )
+                return res;
+        }
+
+        /* Use the same reg regions as the IOMMU node in host DTB. */
+        prop = dt_get_property(iommu, "reg", &len);
+        if ( !prop )
+        {
+            printk(XENLOG_ERR "vIOMMU: Can't find IOMMU reg property.\n");
+            res = -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res = fdt_property(fdt, "reg", prop, len);
+        if ( res )
+            return res;
+
+        prop = dt_get_property(iommu, "#iommu-cells", &len);
+        if ( !prop )
+        {
+            res = -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res = fdt_property(fdt, "#iommu-cells", prop, len);
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "interrupt-names", "combined");
+        if ( res )
+            return res;
+
+        set_interrupt(intr, iommu_data->irq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+        res = fdt_property_interrupts(kinfo, &intr, 1);
+        if ( res )
+            return res;
+
+        iommu_data->hwdom_node_created = true;
+
+        fdt_end_node(fdt);
+    }
+
+    return res;
+}
+#endif
+
 int __init map_irq_to_domain(struct domain *d, unsigned int irq,
                              bool need_mapping, const char *devname)
 {
@@ -2587,6 +2676,11 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
     if ( dt_match_node(timer_matches, node) )
         return make_timer_node(kinfo);
 
+#ifdef CONFIG_VIRTUAL_IOMMU
+    if ( device_get_class(node) == DEVICE_IOMMU && is_viommu_enabled() )
+        return make_hwdom_viommu_node(kinfo);
+#endif
+
     /* Skip nodes used by Xen */
     if ( dt_device_used_by(node) == DOMID_XEN )
     {
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
index 4de4cceeda..e6018f435b 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -19,6 +19,7 @@ struct host_iommu {
     paddr_t addr;
     paddr_t size;
     uint32_t irq;
+    bool hwdom_node_created;
 };
 
 struct viommu_ops {
-- 
2.25.1


