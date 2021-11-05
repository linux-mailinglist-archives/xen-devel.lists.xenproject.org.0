Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5ED44629B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 12:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222225.384302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mixIN-0000FR-Bm; Fri, 05 Nov 2021 11:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222225.384302; Fri, 05 Nov 2021 11:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mixIN-0000C6-8e; Fri, 05 Nov 2021 11:22:07 +0000
Received: by outflank-mailman (input) for mailman id 222225;
 Fri, 05 Nov 2021 11:22:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ym5/=PY=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1mixIK-0000C0-UP
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 11:22:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 96bf0de3-3e2a-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 12:22:02 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12B731FB;
 Fri,  5 Nov 2021 04:21:58 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC8553F7B4;
 Fri,  5 Nov 2021 04:21:56 -0700 (PDT)
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
X-Inumbo-ID: 96bf0de3-3e2a-11ec-9787-a32c541c8605
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	iwj@xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH-4.16 v3] xen/efi: Fix Grub2 boot on arm64
Date: Fri,  5 Nov 2021 11:21:48 +0000
Message-Id: <20211105112148.48719-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b882
("arm/efi: Use dom0less configuration when using EFI boot") is
introducing a problem to boot Xen using Grub2 on ARM machine using EDK2.

Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHandle
inside the interface given by the LOADED_IMAGE_PROTOCOL service, this
handle is used later by efi_bs->HandleProtocol(...) inside
get_parent_handle(...) when requesting the SIMPLE_FILE_SYSTEM_PROTOCOL
interface, causing Xen to stop the boot because of an EFI_INVALID_PARAMETER
error.

Before the commit above, the function was never called because the
logic was skipping the call when there were multiboot modules in the
DT because the filesystem was never used and the bootloader had
put in place all the right modules in memory and the addresses
in the DT.

To fix the problem the old logic is put back in place. Because the handle
was given to the efi_check_dt_boot(...), but the revert put the handle
out of scope, the signature of the function is changed to use an
EFI_LOADED_IMAGE handle and request the EFI_FILE_HANDLE only when
needed (module found using xen,uefi-binary).

Another problem is found when the UEFI stub tries to check if Dom0
image or DomUs are present.
The logic doesn't work when the UEFI stub is not responsible to load
any modules, so the efi_check_dt_boot(...) return value is modified
to return the number of multiboot module found and not only the number
of module loaded by the stub.
Taking the occasion to update the comment in handle_module_node(...)
to explain why we return success even if xen,uefi-binary is not found.

Fixes: a1743fc3a9 ("arm/efi: Use dom0less configuration when using EFI boot")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

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

Changes in v3:
 - Revert back to the logic that protects get_parent_handle(...) (Jan)
 - Changed efi_check_dt_boot(...) to use a EFI_LOADED_IMAGE handle and
   request, along the call stack, the parent dir handle only when needed.
Changes in v2:
 - Changed comment on DeviceHandle NULL (Jan)
 - Removed fatal condition on handle NULL (Jan)
 - Add more info about the EDK2+Grub2 issue to the commit msg (Jan)
 - Removed modules_found from function signature and pass everything
   on return (Stefano)
 - Improved comment in handle_module_node

---
 xen/arch/arm/efi/efi-boot.h | 61 ++++++++++++++++++++++++-------------
 xen/common/efi/boot.c       | 16 +++++-----
 2 files changed, 49 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 8b88dd26a5..458cfbbed4 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -44,17 +44,17 @@ void __flush_dcache_area(const void *vaddr, unsigned long size);
 
 static int get_module_file_index(const char *name, unsigned int name_len);
 static void PrintMessage(const CHAR16 *s);
-static int allocate_module_file(EFI_FILE_HANDLE dir_handle,
+static int allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
                                 const char *name,
                                 unsigned int name_len);
-static int handle_module_node(EFI_FILE_HANDLE dir_handle,
+static int handle_module_node(EFI_LOADED_IMAGE *loaded_image,
                               int module_node_offset,
                               int reg_addr_cells,
                               int reg_size_cells,
                               bool is_domu_module);
-static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
+static int handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
                                        int domain_node);
-static int efi_check_dt_boot(EFI_FILE_HANDLE dir_handle);
+static int efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image);
 
 #define DEVICE_TREE_GUID \
 {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0}}
@@ -647,11 +647,13 @@ static void __init PrintMessage(const CHAR16 *s)
  * This function allocates a binary and keeps track of its name, it returns the
  * index of the file in the modules array or a negative number on error.
  */
-static int __init allocate_module_file(EFI_FILE_HANDLE dir_handle,
+static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
                                        const char *name,
                                        unsigned int name_len)
 {
+    EFI_FILE_HANDLE dir_handle;
     module_name *file_name;
+    CHAR16 *fname;
     union string module_name;
     int ret;
 
@@ -683,9 +685,14 @@ static int __init allocate_module_file(EFI_FILE_HANDLE dir_handle,
     strlcpy(file_name->name, name, name_len + 1);
     file_name->name_len = name_len;
 
+    /* Get the file system interface. */
+    dir_handle = get_parent_handle(loaded_image, &fname);
+
     /* Load the binary in memory */
     read_file(dir_handle, s2w(&module_name), &module_binary, NULL);
 
+    dir_handle->Close(dir_handle);
+
     /* Save address and size */
     file_name->addr = module_binary.addr;
     file_name->size = module_binary.size;
@@ -702,8 +709,9 @@ static int __init allocate_module_file(EFI_FILE_HANDLE dir_handle,
  * This function checks for the presence of the xen,uefi-binary property in the
  * module, if found it loads the binary as module and sets the right address
  * for the reg property into the module DT node.
+ * Returns 1 if module is multiboot,module, 0 if not, < 0 on error
  */
-static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
+static int __init handle_module_node(EFI_LOADED_IMAGE *loaded_image,
                                      int module_node_offset,
                                      int reg_addr_cells,
                                      int reg_size_cells,
@@ -730,13 +738,13 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
                                  &uefi_name_len);
 
     if ( !uefi_name_prop )
-        /* Property not found */
-        return 0;
+        /* Property not found, but signal this is a multiboot,module */
+        return 1;
 
     file_idx = get_module_file_index(uefi_name_prop, uefi_name_len);
     if ( file_idx < 0 )
     {
-        file_idx = allocate_module_file(dir_handle, uefi_name_prop,
+        file_idx = allocate_module_file(loaded_image, uefi_name_prop,
                                         uefi_name_len);
         if ( file_idx < 0 )
             return file_idx;
@@ -795,19 +803,20 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
         }
     }
 
-    return 0;
+    return 1;
 }
 
 /*
  * This function checks for boot modules under the domU guest domain node
  * in the DT.
- * Returns 0 on success, negative number on error.
+ * Returns number of multiboot,module found or negative number on error.
  */
-static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
+static int __init handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
                                               int domain_node)
 {
     int module_node, addr_cells, size_cells, len;
     const struct fdt_property *prop;
+    unsigned int mb_modules_found = 0;
 
     /* Get #address-cells and #size-cells from domain node */
     prop = fdt_get_property(fdt, domain_node, "#address-cells", &len);
@@ -833,24 +842,26 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
           module_node > 0;
           module_node = fdt_next_subnode(fdt, module_node) )
     {
-        int ret = handle_module_node(dir_handle, module_node, addr_cells,
+        int ret = handle_module_node(loaded_image, module_node, addr_cells,
                                      size_cells, true);
         if ( ret < 0 )
             return ret;
+
+        mb_modules_found += ret;
     }
 
-    return 0;
+    return mb_modules_found;
 }
 
 /*
  * This function checks for xen domain nodes under the /chosen node for possible
  * dom0 and domU guests to be loaded.
- * Returns the number of modules loaded or a negative number for error.
+ * Returns the number of multiboot modules found or a negative number for error.
  */
-static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
+static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
 {
     int chosen, node, addr_len, size_len;
-    unsigned int i = 0;
+    unsigned int i = 0, modules_found = 0;
 
     /* Check for the chosen node in the current DTB */
     chosen = setup_chosen_node(fdt, &addr_len, &size_len);
@@ -865,15 +876,23 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
           node > 0;
           node = fdt_next_subnode(fdt, node) )
     {
+        int ret;
+
         if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
         {
             /* Found a node with compatible xen,domain; handle this node. */
-            if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
+            ret = handle_dom0less_domain_node(loaded_image, node);
+            if ( ret < 0 )
                 return ERROR_DT_MODULE_DOMU;
         }
-        else if ( handle_module_node(dir_handle, node, addr_len, size_len,
-                                     false) < 0 )
+        else
+        {
+            ret = handle_module_node(loaded_image, node, addr_len, size_len,
+                                     false);
+            if ( ret < 0 )
                  return ERROR_DT_MODULE_DOM0;
+        }
+        modules_found += ret;
     }
 
     /* Free boot modules file names if any */
@@ -883,7 +902,7 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
         efi_bs->FreePool(modules[i].name);
     }
 
-    return modules_idx;
+    return modules_found;
 }
 
 static void __init efi_arch_cpu(void)
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 392ff3ac9b..cbfa5b0f35 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -121,6 +121,8 @@ static char *get_value(const struct file *cfg, const char *section,
 static char *split_string(char *s);
 static CHAR16 *s2w(union string *str);
 static char *w2s(const union string *str);
+static EFI_FILE_HANDLE get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
+                                         CHAR16 **leaf);
 static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
                       struct file *file, const char *options);
 static bool read_section(const EFI_LOADED_IMAGE *image, const CHAR16 *name,
@@ -167,7 +169,7 @@ static void __init PrintErr(const CHAR16 *s)
 }
 
 #ifndef CONFIG_HAS_DEVICE_TREE
-static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
+static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
 {
     return 0;
 }
@@ -1225,9 +1227,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
     efi_arch_relocate_image(0);
 
-    /* Get the file system interface. */
-    dir_handle = get_parent_handle(loaded_image, &file_name);
-
     if ( use_cfg_file )
     {
         UINTN depth, cols, rows, size;
@@ -1240,6 +1239,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
         gop = efi_get_gop();
 
+        /* Get the file system interface. */
+        dir_handle = get_parent_handle(loaded_image, &file_name);
+
         /* Read and parse the config file. */
         if ( read_section(loaded_image, L"config", &cfg, NULL) )
             PrintStr(L"Using builtin config file\r\n");
@@ -1362,14 +1364,14 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
         cfg.addr = 0;
 
+        dir_handle->Close(dir_handle);
+
         if ( gop && !base_video )
             gop_mode = efi_find_gop_mode(gop, cols, rows, depth);
     }
 
     /* Get the number of boot modules specified on the DT or an error (<0) */
-    dt_modules_found = efi_check_dt_boot(dir_handle);
-
-    dir_handle->Close(dir_handle);
+    dt_modules_found = efi_check_dt_boot(loaded_image);
 
     if ( dt_modules_found < 0 )
         /* efi_check_dt_boot throws some error */
-- 
2.17.1


