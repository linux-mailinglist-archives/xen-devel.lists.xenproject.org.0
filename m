Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF0446E334
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 08:29:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242715.419774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDro-00079w-Pj; Thu, 09 Dec 2021 07:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242715.419774; Thu, 09 Dec 2021 07:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDro-00077M-M5; Thu, 09 Dec 2021 07:29:24 +0000
Received: by outflank-mailman (input) for mailman id 242715;
 Thu, 09 Dec 2021 07:29:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5bTN=Q2=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mvDrn-0006rO-7C
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 07:29:23 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba7edfec-58c1-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 08:29:22 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id bu18so10413276lfb.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 23:29:22 -0800 (PST)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f13sm445069lfe.297.2021.12.08.23.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 23:29:21 -0800 (PST)
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
X-Inumbo-ID: ba7edfec-58c1-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/2Tjqi32B79jJFV5dYcHCJZi26dI5310xuMMTpxHeck=;
        b=XWZJBqluQ3NPKGVk25PLZ7QuEeaH1JDENGEiWOpz6crNOBOsrq8HovLQsDDhqAeml7
         rvlBOyn1z2MypTZRZ52bTX2cTxsAB38TIv/wSrqjgy8KT9qu5/0cpGaObt9buUUyb1tC
         tjpDSnNy9UUOBtweuOaQ0pSNRJkWKTn9e/abTcFVQ55NZirn1scyS789koraHCj5rg8o
         vnKIr45dq84BcPYD/uS/2RwKi2vrTn3hlmV2lffhu5Sj2VwikeCUpg9S7//qDVM/jGwC
         5WTjV9gkaHjzhfnlyp0WVklFwoig82Rv30jUaEyTqkWbnu4DZD6O13MLa8SzYdjOkGZq
         WNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/2Tjqi32B79jJFV5dYcHCJZi26dI5310xuMMTpxHeck=;
        b=04nMiJe2JQiPnOmFasZSdyRYgubAP4XAFzafWVLtxVUTFpPxthudhx8VEQUBSRzKDw
         ULyymTeHroskv4FBG2WMjX6VDyD8WeFp3jXf2FniVSxuHvbGWAS3gTqw7T4+kTmBSdI1
         3bbqNlafJyfWiZw91xEAWWFutrudUL8zUUA6sfijq1o3AgP5ho76c/U6CtVVlG/gxcOW
         jA2BMenj5biSIpOM6zVGE+54p92iZdUTgTlSdk0xfRwHiahap/YM7xJbwo65qbyS8CgV
         dVpvv/Vvxq8wiq4toRx8wombykzu6GZSUDjgVGL2Zeuhm2kpZYQ1Ukhw3TI3JgUd9ZwX
         z7cQ==
X-Gm-Message-State: AOAM532WY4mf7vbBO079iTtY7N2x0eHS2mgcbadT3BGraHqUv9TxgN1y
	nrJor5B/9jTgCZRP7jWTeDujfjW5YxQODw==
X-Google-Smtp-Source: ABdhPJz7R3UwMpl1RO5xA5oeeyQIc7DzXdSawwJPV1/vH2zpQkLuZTgviFe6bKKLCwE6gs6Fr1Zg7A==
X-Received: by 2002:a05:6512:159d:: with SMTP id bp29mr4160681lfb.257.1639034961730;
        Wed, 08 Dec 2021 23:29:21 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 1/4] xen/arm: add pci-domain for disabled devices
Date: Thu,  9 Dec 2021 09:29:15 +0200
Message-Id: <20211209072918.460902-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209072918.460902-1-andr2000@gmail.com>
References: <20211209072918.460902-1-andr2000@gmail.com>
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
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
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
index d02bacbcd1ed..6c5d22d9be1a 100644
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
index ae79a0c19b93..40e779b5d803 100644
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
index 9736d6816da3..c313423cdcb2 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -109,6 +109,8 @@ static always_inline bool is_pci_passthrough_enabled(void)
 
 void arch_pci_init_pdev(struct pci_dev *pdev);
 
+int pci_get_new_domain_nr(void);
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
@@ -129,5 +131,11 @@ static inline int pci_get_host_bridge_segment(const struct dt_device_node *node,
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


