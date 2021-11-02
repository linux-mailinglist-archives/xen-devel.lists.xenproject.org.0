Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DFA442FC7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 15:05:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220262.381453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuPq-0001b7-Rq; Tue, 02 Nov 2021 14:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220262.381453; Tue, 02 Nov 2021 14:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuPq-0001ZO-Oo; Tue, 02 Nov 2021 14:05:30 +0000
Received: by outflank-mailman (input) for mailman id 220262;
 Tue, 02 Nov 2021 14:05:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zwst=PV=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mhuPp-0001ZI-PS
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 14:05:29 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id eed45d2a-3be5-11ec-8557-12813bfff9fa;
 Tue, 02 Nov 2021 14:05:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0033D6E;
 Tue,  2 Nov 2021 07:05:27 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DED173FA1D;
 Tue,  2 Nov 2021 07:05:26 -0700 (PDT)
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
X-Inumbo-ID: eed45d2a-3be5-11ec-8557-12813bfff9fa
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/efi: Fix Grub2 boot on arm64
Date: Tue,  2 Nov 2021 14:05:11 +0000
Message-Id: <20211102140511.5542-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b882
("arm/efi: Use dom0less configuration when using EFI boot") is
introducing a problem to boot Xen using Grub2 on ARM machine using EDK2.

The problem comes from the function get_parent_handle(...) that inside
uses the HandleProtocol on loaded_image->DeviceHandle, but the last
is NULL, making Xen stop the UEFI boot.

Before the commit above, the function was never called because the
logic was skipping the call when there were multiboot modules in the
DT because the filesystem was never used and the bootloader had
put in place all the right modules in memory and the addresses
in the DT.

To fix the problem we allow the get_parent_handle(...) function to
return a NULL handle on error and we check the usage of the function
to handle the new use case. The function in fact should not prevent
the boot even if the filesystem can't be used, because the DT and
the modules could be put in place by the bootloader before running
Xen and if xen,uefi-binary property is not used, there is no need
for the filesystem.

Another problem is found when the UEFI stub tries to check if Dom0
image or DomUs are present.
The logic doesn't work when the UEFI stub is not responsible to load
any modules, so the efi_check_dt_boot(...) return value is modified
to return the number of multiboot module found and not only the number
of module loaded by the stub.

Fixes: a1743fc3a9 ("arm/efi: Use dom0less configuration when using EFI boot")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Justification for integration in 4.16:
Upside: allow booting xen from grub on arm64 when the stub doesn't load
        any module.
Downside: It's affecting the EFI boot path.
Risk: It's not affecting x86 arch that works the same way as before.
      If something is wrong it creates a problem on early boot and not at
      runtime, so risk is low.

Tested in this configurations:
 - Bootloader loads modules and specify them as multiboot modules in DT:
   * combination of Dom0, DomUs, Dom0 and DomUs
 - DT specifies multiboot modules in DT using xen,uefi-binary property:
   * combination of Dom0, DomUs, Dom0 and DomUs
 - Bootloader loads a Dom0 module and appends it as multiboot module in DT,
   other multiboot modules are listed for DomUs using xen,uefi-binary
 - No multiboot modules in DT and no kernel entry in cfg file:
   * proper error thrown

---
 xen/arch/arm/efi/efi-boot.h | 28 ++++++++++++++++++----------
 xen/common/efi/boot.c       | 15 ++++++++++++++-
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 8b88dd26a5..e714b2b44c 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -51,9 +51,11 @@ static int handle_module_node(EFI_FILE_HANDLE dir_handle,
                               int module_node_offset,
                               int reg_addr_cells,
                               int reg_size_cells,
-                              bool is_domu_module);
+                              bool is_domu_module,
+                              unsigned int *modules_found);
 static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
-                                       int domain_node);
+                                       int domain_node,
+                                       unsigned int *modules_found);
 static int efi_check_dt_boot(EFI_FILE_HANDLE dir_handle);
 
 #define DEVICE_TREE_GUID \
@@ -707,7 +709,8 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
                                      int module_node_offset,
                                      int reg_addr_cells,
                                      int reg_size_cells,
-                                     bool is_domu_module)
+                                     bool is_domu_module,
+                                     unsigned int *modules_found)
 {
     const void *uefi_name_prop;
     char mod_string[24]; /* Placeholder for module@ + a 64-bit number + \0 */
@@ -725,6 +728,9 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
         /* Module is not a multiboot,module */
         return 0;
 
+    /* Count the multiboot module as found */
+    (*modules_found)++;
+
     /* Read xen,uefi-binary property to get the file name. */
     uefi_name_prop = fdt_getprop(fdt, module_node_offset, "xen,uefi-binary",
                                  &uefi_name_len);
@@ -804,7 +810,8 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
  * Returns 0 on success, negative number on error.
  */
 static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
-                                              int domain_node)
+                                              int domain_node,
+                                              unsigned int *modules_found)
 {
     int module_node, addr_cells, size_cells, len;
     const struct fdt_property *prop;
@@ -834,7 +841,7 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
           module_node = fdt_next_subnode(fdt, module_node) )
     {
         int ret = handle_module_node(dir_handle, module_node, addr_cells,
-                                     size_cells, true);
+                                     size_cells, true, modules_found);
         if ( ret < 0 )
             return ret;
     }
@@ -845,12 +852,12 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
 /*
  * This function checks for xen domain nodes under the /chosen node for possible
  * dom0 and domU guests to be loaded.
- * Returns the number of modules loaded or a negative number for error.
+ * Returns the number of multiboot modules found or a negative number for error.
  */
 static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
 {
     int chosen, node, addr_len, size_len;
-    unsigned int i = 0;
+    unsigned int i = 0, modules_found = 0;
 
     /* Check for the chosen node in the current DTB */
     chosen = setup_chosen_node(fdt, &addr_len, &size_len);
@@ -868,11 +875,12 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
         if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
         {
             /* Found a node with compatible xen,domain; handle this node. */
-            if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
+            if ( handle_dom0less_domain_node(dir_handle, node,
+                                             &modules_found) < 0 )
                 return ERROR_DT_MODULE_DOMU;
         }
         else if ( handle_module_node(dir_handle, node, addr_len, size_len,
-                                     false) < 0 )
+                                     false, &modules_found) < 0 )
                  return ERROR_DT_MODULE_DOM0;
     }
 
@@ -883,7 +891,7 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
         efi_bs->FreePool(modules[i].name);
     }
 
-    return modules_idx;
+    return modules_found;
 }
 
 static void __init efi_arch_cpu(void)
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 392ff3ac9b..495e7a4096 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -449,6 +449,13 @@ static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
     CHAR16 *pathend, *ptr;
     EFI_STATUS ret;
 
+    /*
+     * If DeviceHandle is NULL, we can't use the SIMPLE_FILE_SYSTEM_PROTOCOL
+     * to have access to the filesystem.
+     */
+    if ( !loaded_image->DeviceHandle )
+        return NULL;
+
     do {
         EFI_FILE_IO_INTERFACE *fio;
 
@@ -581,6 +588,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     EFI_STATUS ret;
     const CHAR16 *what = NULL;
 
+    if ( !dir_handle )
+        blexit(L"Error: No access to the filesystem");
     if ( !name )
         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
     ret = dir_handle->Open(dir_handle, &FileHandle, name,
@@ -1333,6 +1342,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
             EFI_FILE_HANDLE handle = get_parent_handle(loaded_image,
                                                        &file_name);
 
+            if ( !handle )
+                blexit(L"Error retrieving image name: no filesystem access");
+
             handle->Close(handle);
             *argv = file_name;
         }
@@ -1369,7 +1381,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     /* Get the number of boot modules specified on the DT or an error (<0) */
     dt_modules_found = efi_check_dt_boot(dir_handle);
 
-    dir_handle->Close(dir_handle);
+    if ( dir_handle )
+        dir_handle->Close(dir_handle);
 
     if ( dt_modules_found < 0 )
         /* efi_check_dt_boot throws some error */
-- 
2.17.1


