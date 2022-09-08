Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7345B1AF0
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 13:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403123.645126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWFPT-0001Br-1Z; Thu, 08 Sep 2022 11:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403123.645126; Thu, 08 Sep 2022 11:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWFPS-000187-UU; Thu, 08 Sep 2022 11:09:26 +0000
Received: by outflank-mailman (input) for mailman id 403123;
 Thu, 08 Sep 2022 11:09:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymCA=ZL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWFPS-00017c-5B
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 11:09:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b284f159-2f66-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 13:09:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 639481516;
 Thu,  8 Sep 2022 04:09:30 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A3AD3F71A;
 Thu,  8 Sep 2022 04:09:21 -0700 (PDT)
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
X-Inumbo-ID: b284f159-2f66-11ed-a31c-8f8a9ae3403f
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 1/4] xen/arm: bootfdt: Make process_chosen_node() return int
Date: Thu,  8 Sep 2022 11:09:07 +0000
Message-Id: <20220908110910.17108-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908110910.17108-1-Henry.Wang@arm.com>
References: <20220908110910.17108-1-Henry.Wang@arm.com>

At the boot time, it is saner to stop booting early if an error occurs
when parsing the device tree chosen node, rather than seeing random
behavior afterwards. Therefore, this commit changes the return type of
the process_chosen_node() from void to int, and return correct errno
based on the error type.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from v5 to v6:
- No changes.
Changes from v4 to v5:
- No changes.
Changes from v3 to v4:
- Add Reviewed-by from Michal and Acked-by from Julien.
Changes from v2 to v3:
- Adjust the order of this patch, make it the #1.
Changes from v1 to v2:
- New commit.
---
 xen/arch/arm/bootfdt.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index ec81a45de9..1a79b969af 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -293,9 +293,9 @@ static void __init process_multiboot_node(const void *fdt, int node,
                      kind, start, domU);
 }
 
-static void __init process_chosen_node(const void *fdt, int node,
-                                       const char *name,
-                                       u32 address_cells, u32 size_cells)
+static int __init process_chosen_node(const void *fdt, int node,
+                                      const char *name,
+                                      u32 address_cells, u32 size_cells)
 {
     const struct fdt_property *prop;
     paddr_t start, end;
@@ -306,11 +306,11 @@ static void __init process_chosen_node(const void *fdt, int node,
     prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
     if ( !prop )
         /* No initrd present. */
-        return;
+        return 0;
     if ( len != sizeof(u32) && len != sizeof(u64) )
     {
         printk("linux,initrd-start property has invalid length %d\n", len);
-        return;
+        return -EINVAL;
     }
     start = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
 
@@ -318,12 +318,12 @@ static void __init process_chosen_node(const void *fdt, int node,
     if ( !prop )
     {
         printk("linux,initrd-end not present but -start was\n");
-        return;
+        return -EINVAL;
     }
     if ( len != sizeof(u32) && len != sizeof(u64) )
     {
         printk("linux,initrd-end property has invalid length %d\n", len);
-        return;
+        return -EINVAL;
     }
     end = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
 
@@ -331,12 +331,14 @@ static void __init process_chosen_node(const void *fdt, int node,
     {
         printk("linux,initrd limits invalid: %"PRIpaddr" >= %"PRIpaddr"\n",
                   start, end);
-        return;
+        return -EINVAL;
     }
 
     printk("Initrd %"PRIpaddr"-%"PRIpaddr"\n", start, end);
 
     add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
+
+    return 0;
 }
 
 static int __init process_domain_node(const void *fdt, int node,
@@ -383,7 +385,7 @@ static int __init early_scan_node(const void *fdt,
               device_tree_node_compatible(fdt, node, "multiboot,module" )))
         process_multiboot_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
-        process_chosen_node(fdt, node, name, address_cells, size_cells);
+        rc = process_chosen_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
         rc = process_domain_node(fdt, node, name, address_cells, size_cells);
 
-- 
2.17.1


