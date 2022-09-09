Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB7E5B2E0A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 07:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403803.646033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWWUv-0000sh-Dh; Fri, 09 Sep 2022 05:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403803.646033; Fri, 09 Sep 2022 05:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWWUv-0000qF-BA; Fri, 09 Sep 2022 05:24:13 +0000
Received: by outflank-mailman (input) for mailman id 403803;
 Fri, 09 Sep 2022 05:24:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xTTi=ZM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWWUt-0000q9-BN
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 05:24:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a086d9fb-2fff-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 07:24:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B0F2153B;
 Thu,  8 Sep 2022 22:24:13 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE9673F73D;
 Thu,  8 Sep 2022 22:24:32 -0700 (PDT)
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
X-Inumbo-ID: a086d9fb-2fff-11ed-a31c-8f8a9ae3403f
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm, device-tree: Make static-mem use #{address,size}-cells
Date: Fri,  9 Sep 2022 05:23:57 +0000
Message-Id: <20220909052357.49349-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1

In order to keep consistency in the device tree binding, there is
no need for static memory allocation feature to define a specific
set of address and size cells for "xen,static-mem" property.

Therefore, this commit reuses the regular #{address,size}-cells
for parsing the device tree "xen,static-mem" property. Update
the documentation accordingly.

Also, take the chance to remove the unnecessary "#address-cells"
and "#size-cells" in the domU1 node of the device tree to only
emphasize the related part that the example is showing.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
Changes from v1 to v2:
- Remove the "----" addition, as it is unnecessary to this patch.
- Mention the removal of #address-cells and #size-cells in domU1
  node in the commit message.
---
 docs/misc/arm/device-tree/booting.txt | 11 +++++------
 docs/misc/arm/passthrough-noiommu.txt |  7 +++----
 xen/arch/arm/bootfdt.c                |  5 -----
 xen/arch/arm/domain_build.c           | 16 ++--------------
 4 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 5395a1077c..10caf4f1af 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -350,8 +350,8 @@ areas are pre-defined by configuration using physical address ranges.
 
 Memory can be statically allocated to a domain using the property "xen,static-
 mem" defined in the domain configuration. The number of cells for the address
-and the size must be defined using respectively the properties
-"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
+and the size must be defined respectively by the parent node properties
+"#address-cells" and "#size-cells".
 
 The property 'memory' is still needed and should match the amount of memory
 given to the guest. Currently, it either comes from static memory or lets Xen
@@ -366,14 +366,13 @@ device-tree:
 
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
index 9e1ea60094..59675f086b 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -370,11 +370,6 @@ static int __init process_domain_node(const void *fdt, int node,
         /* No "xen,static-mem" present. */
         return 0;
 
-    address_cells = device_tree_get_u32(fdt, node,
-                                        "#xen,static-mem-address-cells", 0);
-    size_cells = device_tree_get_u32(fdt, node,
-                                     "#xen,static-mem-size-cells", 0);
-
     return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
                                    size_cells, &bootinfo.reserved_mem,
                                    MEMBANK_STATIC_DOMAIN);
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7412303d20..9040a8c6cb 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -565,21 +565,9 @@ static int __init parse_static_mem_prop(const struct dt_device_node *node,
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


