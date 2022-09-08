Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366895B18BF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 11:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403034.644998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDst-0001gf-4A; Thu, 08 Sep 2022 09:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403034.644998; Thu, 08 Sep 2022 09:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDst-0001dx-1F; Thu, 08 Sep 2022 09:31:43 +0000
Received: by outflank-mailman (input) for mailman id 403034;
 Thu, 08 Sep 2022 09:31:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymCA=ZL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWDsq-0001dr-OC
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 09:31:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0a1f2033-2f59-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 11:31:39 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CEB514BF;
 Thu,  8 Sep 2022 02:31:44 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 32B2A3F73D;
 Thu,  8 Sep 2022 02:31:35 -0700 (PDT)
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
X-Inumbo-ID: 0a1f2033-2f59-11ed-a31c-8f8a9ae3403f
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm, device-tree: Make static-mem use #{address,size}-cells
Date: Thu,  8 Sep 2022 09:31:29 +0000
Message-Id: <20220908093129.30124-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1

In order to keep consistency in the device tree binding, there is
no need for static memory allocation feature to define a specific
set of address and size cells for "xen,static-mem" property.

Therefore, this commit reuses the regular #{address,size}-cells
for parsing the device tree "xen,static-mem" property. Update
the documentation accordingly.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 13 ++++++-------
 docs/misc/arm/passthrough-noiommu.txt |  7 +++----
 xen/arch/arm/bootfdt.c                |  5 -----
 xen/arch/arm/domain_build.c           | 16 ++--------------
 4 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 98253414b8..12d77e3b26 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -339,15 +339,15 @@ kernel will be able to discover the device.
 
 
 Static Allocation
-=============
+=================
 
 Static Allocation refers to system or sub-system(domains) for which memory
 areas are pre-defined by configuration using physical address ranges.
 
 Memory can be statically allocated to a domain using the property "xen,static-
 mem" defined in the domain configuration. The number of cells for the address
-and the size must be defined using respectively the properties
-"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
+and the size must be defined respectively by the parent node properties
+"#address-cells" and "#size-cells".
 
 The property 'memory' is still needed and should match the amount of memory
 given to the guest. Currently, it either comes from static memory or lets Xen
@@ -362,14 +362,13 @@ device-tree:
 
     / {
         chosen {
+            #address-cells = <0x1>;
+            #size-cells = <0x1>;
+            ...
             domU1 {
                 compatible = "xen,domain";
-                #address-cells = <0x2>;
-                #size-cells = <0x2>;
                 cpus = <2>;
                 memory = <0x0 0x80000>;
-                #xen,static-mem-address-cells = <0x1>;
-                #xen,static-mem-size-cells = <0x1>;
                 xen,static-mem = <0x30000000 0x20000000>;
                 ...
             };
diff --git a/docs/misc/arm/passthrough-noiommu.txt b/docs/misc/arm/passthrough-noiommu.txt
index 3e2ef21ad7..69b8de1975 100644
--- a/docs/misc/arm/passthrough-noiommu.txt
+++ b/docs/misc/arm/passthrough-noiommu.txt
@@ -33,14 +33,13 @@ on static allocation in the device-tree:
 
 / {
 	chosen {
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		...
 		domU1 {
 			compatible = "xen,domain";
-			#address-cells = <0x2>;
-			#size-cells = <0x2>;
 			cpus = <2>;
 			memory = <0x0 0x80000>;
-			#xen,static-mem-address-cells = <0x1>;
-			#xen,static-mem-size-cells = <0x1>;
 			xen,static-mem = <0x30000000 0x20000000>;
 			direct-map;
 			...
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index ec81a45de9..cd264793d5 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -352,11 +352,6 @@ static int __init process_domain_node(const void *fdt, int node,
         /* No "xen,static-mem" present. */
         return 0;
 
-    address_cells = device_tree_get_u32(fdt, node,
-                                        "#xen,static-mem-address-cells", 0);
-    size_cells = device_tree_get_u32(fdt, node,
-                                     "#xen,static-mem-size-cells", 0);
-
     return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
                                    size_cells, &bootinfo.reserved_mem, true);
 }
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b76a84e8f5..258d74699d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -563,21 +563,9 @@ static int __init parse_static_mem_prop(const struct dt_device_node *node,
     const struct dt_property *prop;
 
     prop = dt_find_property(node, "xen,static-mem", NULL);
-    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
-                               addr_cells) )
-    {
-        printk(XENLOG_ERR
-               "failed to read \"#xen,static-mem-address-cells\".\n");
-        return -EINVAL;
-    }
 
-    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
-                               size_cells) )
-    {
-        printk(XENLOG_ERR
-               "failed to read \"#xen,static-mem-size-cells\".\n");
-        return -EINVAL;
-    }
+    *addr_cells = dt_n_addr_cells(node);
+    *size_cells = dt_n_size_cells(node);
 
     *cell = (const __be32 *)prop->value;
     *length = prop->length;
-- 
2.17.1


