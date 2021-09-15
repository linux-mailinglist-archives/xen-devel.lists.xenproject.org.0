Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B1440C76B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 16:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187704.336668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVrg-0002wz-IX; Wed, 15 Sep 2021 14:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187704.336668; Wed, 15 Sep 2021 14:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVrg-0002r8-EL; Wed, 15 Sep 2021 14:26:20 +0000
Received: by outflank-mailman (input) for mailman id 187704;
 Wed, 15 Sep 2021 14:26:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Uy1=OF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mQVre-0002oh-5f
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 14:26:18 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e3319440-1630-11ec-b535-12813bfff9fa;
 Wed, 15 Sep 2021 14:26:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 839F71042;
 Wed, 15 Sep 2021 07:26:16 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D5A43F719;
 Wed, 15 Sep 2021 07:26:15 -0700 (PDT)
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
X-Inumbo-ID: e3319440-1630-11ec-b535-12813bfff9fa
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/efi: Restrict check for DT boot modules on EFI boot
Date: Wed, 15 Sep 2021 15:26:01 +0100
Message-Id: <20210915142602.42862-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210915142602.42862-1-luca.fancellu@arm.com>
References: <20210915142602.42862-1-luca.fancellu@arm.com>

When Xen is started as EFI application, it is checking
the presence of multiboot,module in the DT, if any is
found, the configuration file is skipped.
Restrict this check to just any multiboot,module that
is a direct child of the /chosen node.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/efi/efi-boot.h | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index cf9c37153f..5ff626c6a0 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -581,6 +581,8 @@ static void __init efi_arch_load_addr_check(EFI_LOADED_IMAGE *loaded_image)
 
 static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
 {
+    int node;
+    bool dom0_module_found = false;
     /*
      * For arm, we may get a device tree from GRUB (or other bootloader)
      * that contains modules that have already been loaded into memory.  In
@@ -592,11 +594,35 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
     fdt = lookup_fdt_config_table(SystemTable);
     dtbfile.ptr = fdt;
     dtbfile.need_to_free = false; /* Config table memory can't be freed. */
-    if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") < 0 )
+
+    /* Locate chosen node */
+    node = fdt_subnode_offset(fdt, 0, "chosen");
+
+    /* Cycle through every node inside chosen having multiboot,module */
+    do {
+        int depth = 0;
+        node = fdt_node_offset_by_compatible(fdt, node, "multiboot,module");
+        /*
+         * If the multiboot,module just found is placed at depth less than 3,
+         * it means that it is here: /chosen/<module> so it is a module to
+         * start dom0. (root is counted as 0)
+         */
+        if ( node > 0 )
+        {
+            depth = fdt_node_depth(fdt, node);
+            if ( (depth >= 0) && (depth < 3) )
+            {
+                dom0_module_found = true;
+                break;
+            }
+        }
+    } while(node > 0);
+
+    if ( !fdt || !dom0_module_found )
     {
         /*
          * We either have no FDT, or one without modules, so we must have a
-         * Xen EFI configuration file to specify modules.  (dom0 required)
+         * Xen EFI configuration file to specify modules.
          */
         return true;
     }
-- 
2.17.1


