Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320A8414B89
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192811.343467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT30e-0003rR-91; Wed, 22 Sep 2021 14:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192811.343467; Wed, 22 Sep 2021 14:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT30e-0003p2-4r; Wed, 22 Sep 2021 14:14:04 +0000
Received: by outflank-mailman (input) for mailman id 192811;
 Wed, 22 Sep 2021 14:14:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=btef=OM=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mT30c-0003bo-4G
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:14:02 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5536c1ea-1baf-11ec-b995-12813bfff9fa;
 Wed, 22 Sep 2021 14:14:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2607A11D4;
 Wed, 22 Sep 2021 07:14:00 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFCDB3F59C;
 Wed, 22 Sep 2021 07:13:58 -0700 (PDT)
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
X-Inumbo-ID: 5536c1ea-1baf-11ec-b995-12813bfff9fa
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/2] arm/efi: Introduce uefi,cfg-load DT property
Date: Wed, 22 Sep 2021 15:13:40 +0100
Message-Id: <20210922141341.42288-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922141341.42288-1-luca.fancellu@arm.com>
References: <20210922141341.42288-1-luca.fancellu@arm.com>

Introduce the uefi,cfg-load DT property of /chosen
node for ARM whose presence decide whether to force
the load of the UEFI Xen configuration file.

The logic is that if any multiboot,module is found in
the DT, then the uefi,cfg-load property is used to see
if the UEFI Xen configuration file is needed.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2 changes:
- Introduced uefi,cfg-load property
- Add documentation about the property
---
 docs/misc/efi.pandoc        |  2 ++
 xen/arch/arm/efi/efi-boot.h | 28 +++++++++++++++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index ac3cd58cae..e289c5e7ba 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -14,6 +14,8 @@ loaded the modules and describes them in the device tree provided to Xen.  If a
 bootloader provides a device tree containing modules then any configuration
 files are ignored, and the bootloader is responsible for populating all
 relevant device tree nodes.
+The property "uefi,cfg-load" can be specified in the /chosen node to force Xen
+to load the configuration file even if multiboot modules are found.
 
 Once built, `make install-xen` will place the resulting binary directly into
 the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index cf9c37153f..8ceeba4ad1 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -581,22 +581,40 @@ static void __init efi_arch_load_addr_check(EFI_LOADED_IMAGE *loaded_image)
 
 static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
 {
+    bool skip_cfg_file = false;
     /*
      * For arm, we may get a device tree from GRUB (or other bootloader)
      * that contains modules that have already been loaded into memory.  In
-     * this case, we do not use a configuration file, and rely on the
-     * bootloader to have loaded all required modules and appropriate
-     * options.
+     * this case, we search for the property uefi,cfg-load in the /chosen node
+     * to decide whether to skip the UEFI Xen configuration file or not.
      */
 
     fdt = lookup_fdt_config_table(SystemTable);
     dtbfile.ptr = fdt;
     dtbfile.need_to_free = false; /* Config table memory can't be freed. */
-    if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") < 0 )
+
+    if ( fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0 )
+    {
+        /* Locate chosen node */
+        int node = fdt_subnode_offset(fdt, 0, "chosen");
+        const void *cfg_load_prop;
+        int cfg_load_len;
+
+        if ( node > 0 )
+        {
+            /* Check if uefi,cfg-load property exists */
+            cfg_load_prop = fdt_getprop(fdt, node, "uefi,cfg-load",
+                                        &cfg_load_len);
+            if ( !cfg_load_prop )
+                skip_cfg_file = true;
+        }
+    }
+
+    if ( !fdt || !skip_cfg_file )
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


