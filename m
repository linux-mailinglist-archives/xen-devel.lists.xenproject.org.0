Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A8741B3EF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 18:32:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198139.351486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVG1w-0007kH-Q6; Tue, 28 Sep 2021 16:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198139.351486; Tue, 28 Sep 2021 16:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVG1w-0007h5-N6; Tue, 28 Sep 2021 16:32:32 +0000
Received: by outflank-mailman (input) for mailman id 198139;
 Tue, 28 Sep 2021 16:32:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUli=OS=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mVG1u-0007R9-UI
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 16:32:30 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ac33e685-2079-11ec-bcab-12813bfff9fa;
 Tue, 28 Sep 2021 16:32:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D682101E;
 Tue, 28 Sep 2021 09:32:29 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.199.61])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B20413F718;
 Tue, 28 Sep 2021 09:32:27 -0700 (PDT)
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
X-Inumbo-ID: ac33e685-2079-11ec-bcab-12813bfff9fa
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/3] arm/efi: Introduce uefi,cfg-load DT property
Date: Tue, 28 Sep 2021 17:32:07 +0100
Message-Id: <20210928163209.49611-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210928163209.49611-1-luca.fancellu@arm.com>
References: <20210928163209.49611-1-luca.fancellu@arm.com>

Introduce the uefi,cfg-load DT property of /chosen
node for ARM whose presence decide whether to force
the load of the UEFI Xen configuration file.

The logic is that if any multiboot,module is found in
the DT, then the uefi,cfg-load property is used to see
if the UEFI Xen configuration file is needed.

Modify a comment in efi_arch_use_config_file, removing
the part that states "dom0 required" because it's not
true anymore with this commit.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3 changes:
- add documentation to misc/arm/device-tree/booting.txt
- Modified variable name and logic from skip_cfg_file to
load_cfg_file
- Add in the commit message that I'm modifying a comment.
v2 changes:
- Introduced uefi,cfg-load property
- Add documentation about the property
---
 docs/misc/arm/device-tree/booting.txt |  8 ++++++++
 docs/misc/efi.pandoc                  |  2 ++
 xen/arch/arm/efi/efi-boot.h           | 28 ++++++++++++++++++++++-----
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 44cd9e1a9a..cf878b478e 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -121,6 +121,14 @@ A Xen-aware bootloader would set xen,xen-bootargs for Xen, xen,dom0-bootargs
 for Dom0 and bootargs for native Linux.
 
 
+UEFI boot and DT
+================
+
+When Xen is booted using UEFI, it doesn't read the configuration file if any
+multiboot module is specified. To force Xen to load the configuration file, the
+boolean property uefi,cfg-load must be declared in the /chosen node.
+
+
 Creating Multiple Domains directly from Xen
 ===========================================
 
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
index cf9c37153f..4f1b01757d 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -581,22 +581,40 @@ static void __init efi_arch_load_addr_check(EFI_LOADED_IMAGE *loaded_image)
 
 static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
 {
+    bool load_cfg_file = true;
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
+                load_cfg_file = false;
+        }
+    }
+
+    if ( !fdt || load_cfg_file )
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


