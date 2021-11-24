Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7D145B60F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 09:00:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230145.397897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC2-0006cI-Q2; Wed, 24 Nov 2021 07:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230145.397897; Wed, 24 Nov 2021 07:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC2-0006a4-Lg; Wed, 24 Nov 2021 07:59:50 +0000
Received: by outflank-mailman (input) for mailman id 230145;
 Wed, 24 Nov 2021 07:59:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYi7=QL=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mpnC0-000641-Mm
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:59:48 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e5b02be-4cfc-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 08:59:47 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id k23so3673807lje.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Nov 2021 23:59:47 -0800 (PST)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i24sm1750358ljm.135.2021.11.23.23.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 23:59:46 -0800 (PST)
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
X-Inumbo-ID: 7e5b02be-4cfc-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KkHhYh1NWjHxEjAv0HXlf2QneLzqhRUOgxfD/xwWw+c=;
        b=bzykV/sO60cjghsFXeouZeeZQ2FfzEexc7UGsAx2Ekc2ogaKJgY8/Dty5JjDxgb2IE
         oVEi9IvxGBkmhMCOjZbPRp0WK8/Yazp0wqiNmonSwZBrRzi3YOO2+lw7MvzvgpdmqWRV
         JplXAXJ24uWJ1y6m8Ojw36irTyiLdwrLI1EHG9eFDvBLO3kvvjZD+9TM3daq9B69nZ01
         b+DvDVJvEk1palt7/m9Xw5eE6ujvvGFDFBCApkI6R6urJrd2qPY5Aic2PuXlX7M+mDHw
         eK2AeXE7JvIbf1jYQz53QHEAtLlsR0lm3NfPzijHgKevo6WTvF9DnHsq1Ld4e7hYXeye
         qMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KkHhYh1NWjHxEjAv0HXlf2QneLzqhRUOgxfD/xwWw+c=;
        b=Vrjg6N2vszq1K6Gc63horJJlCfirwYZx370qIEi839DsM9/3PV3FF2HVOlE3MuTuy3
         D/CPi7vZ1IcH4Fs/Up5v2csfegOihGDZf/vv93h3pHHNbq3elF0s7WzQ4rfAcvZAWhuv
         RFQ/Mgot35t6us0n1ENmkWufrFPDHtcuKdyXZuROyMkv1HrscH/AsHNzlRv87qdXQTWn
         jj/1BxP7cokRiJ3ITj78Dz/Nsh6ppKbtQZUlcvYyQLA6IdxDHBg7QPAUIuFg/q6t5oBn
         LAoWrAEVkJmwOBEzPs+zvRvfhlSh/KpheBCoYIJv+JXwbUUXG1K5IlUzZOlO71+ludBO
         V+fw==
X-Gm-Message-State: AOAM533spHxbXQFLOlU4L7/DJKgha/SbHCbCD2+06yTAiFunWGgDTKnA
	28qp5uxRfTYfdvDxLsuTYxhmJXVR+o0vAw==
X-Google-Smtp-Source: ABdhPJx9nN49TFsQ5xzG50EnhxC+e1pVOXpjLxq1E6VNokclR+ruBOUEqt3ZGSMOkA3LaBsYV1UyIg==
X-Received: by 2002:a05:651c:514:: with SMTP id o20mr13414786ljp.393.1637740787221;
        Tue, 23 Nov 2021 23:59:47 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v7 2/7] xen/arm: add pci-domain for disabled devices
Date: Wed, 24 Nov 2021 09:59:37 +0200
Message-Id: <20211124075942.2645445-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124075942.2645445-1-andr2000@gmail.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

If a PCI host bridge device is present in the device tree, but is
disabled, then its PCI host bridge driver was not instantiated.
This results in the failure of the pci_get_host_bridge_segment()
and the following panic during Xen start:

(XEN) Device tree generation failed (-22).
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Could not set up DOM0 guest OS
(XEN) ****************************************

Fix this by adding "linux,pci-domain" property for all device tree nodes
which have "pci" device type, so we know which segments will be used by
the guest for which bridges.

Fixes: 4cfab4425d39 ("xen/arm: Add linux,pci-domain property for hwdom if not available.")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v6:
- use use_dt_domains in pci_get_new_domain_nr and return -1 if set
- do not set "linux,pci-domain" if parent device is "pci"
- move the code to a new helper handle_linux_pci_domain (Julien)
New in v6
---
 xen/arch/arm/domain_build.c        | 66 +++++++++++++++++++++++-------
 xen/arch/arm/pci/pci-host-common.c |  8 +++-
 xen/include/asm-arm/pci.h          |  8 ++++
 3 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e76cee3caccf..c83c02ab8ac6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -654,6 +654,55 @@ static void __init allocate_static_memory(struct domain *d,
 }
 #endif
 
+/*
+ * When PCI passthrough is available we want to keep the
+ * "linux,pci-domain" in sync for every host bridge.
+ *
+ * Xen may not have a driver for all the host bridges. So we have
+ * to write an heuristic to detect whether a device node describes
+ * a host bridge.
+ *
+ * The current heuristic assumes that a device is a host bridge
+ * if the type is "pci" and then parent type is not "pci".
+ */
+static int handle_linux_pci_domain(struct kernel_info *kinfo,
+                                   const struct dt_device_node *node)
+{
+    uint16_t segment;
+    int res;
+
+    if ( !is_pci_passthrough_enabled() )
+        return 0;
+
+    if ( !dt_device_type_is_equal(node, "pci") )
+        return 0;
+
+    if ( node->parent && dt_device_type_is_equal(node->parent, "pci") )
+        return 0;
+
+    if ( dt_find_property(node, "linux,pci-domain", NULL) )
+        return 0;
+
+    /* Allocate and create the linux,pci-domain */
+    res = pci_get_host_bridge_segment(node, &segment);
+    if ( res < 0 )
+    {
+        res = pci_get_new_domain_nr();
+        if ( res < 0 )
+        {
+            printk(XENLOG_DEBUG "Can't assign PCI segment to %s\n",
+                   node->full_name);
+            return -FDT_ERR_NOTFOUND;
+        }
+
+        segment = res;
+        printk(XENLOG_DEBUG "Assigned segment %d to %s\n",
+               segment, node->full_name);
+    }
+
+    return fdt_property_cell(kinfo->fdt, "linux,pci-domain", segment);
+}
+
 static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                                    const struct dt_device_node *node)
 {
@@ -755,21 +804,10 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
             return res;
     }
 
-    if ( is_pci_passthrough_enabled() && dt_device_type_is_equal(node, "pci") )
-    {
-        if ( !dt_find_property(node, "linux,pci-domain", NULL) )
-        {
-            uint16_t segment;
-
-            res = pci_get_host_bridge_segment(node, &segment);
-            if ( res < 0 )
-                return res;
+    res = handle_linux_pci_domain(kinfo, node);
 
-            res = fdt_property_cell(kinfo->fdt, "linux,pci-domain", segment);
-            if ( res )
-                return res;
-        }
-    }
+    if ( res )
+        return res;
 
     /*
      * Override the property "status" to disable the device when it's
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index cdeb3a283a77..9653b92b5b2e 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -30,6 +30,8 @@ static LIST_HEAD(pci_host_bridges);
 
 static atomic_t domain_nr = ATOMIC_INIT(-1);
 
+static int use_dt_domains = -1;
+
 static inline void __iomem *pci_remap_cfgspace(paddr_t start, size_t len)
 {
     return ioremap_nocache(start, len);
@@ -137,14 +139,16 @@ void pci_add_host_bridge(struct pci_host_bridge *bridge)
     list_add_tail(&bridge->node, &pci_host_bridges);
 }
 
-static int pci_get_new_domain_nr(void)
+int pci_get_new_domain_nr(void)
 {
+    if ( use_dt_domains )
+        return -1;
+
     return atomic_inc_return(&domain_nr);
 }
 
 static int pci_bus_find_domain_nr(struct dt_device_node *dev)
 {
-    static int use_dt_domains = -1;
     int domain;
 
     domain = dt_get_pci_domain_nr(dev);
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 81273e0d87ac..c20eba643d86 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -108,6 +108,8 @@ static always_inline bool is_pci_passthrough_enabled(void)
 
 void arch_pci_init_pdev(struct pci_dev *pdev);
 
+int pci_get_new_domain_nr(void);
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
@@ -128,5 +130,11 @@ static inline int pci_get_host_bridge_segment(const struct dt_device_node *node,
     return -EINVAL;
 }
 
+static inline int pci_get_new_domain_nr(void)
+{
+    ASSERT_UNREACHABLE();
+    return -1;
+}
+
 #endif  /*!CONFIG_HAS_PCI*/
 #endif /* __ARM_PCI_H__ */
-- 
2.25.1


