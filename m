Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60486453539
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 16:07:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226348.391129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn02g-0000mg-3C; Tue, 16 Nov 2021 15:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226348.391129; Tue, 16 Nov 2021 15:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn02f-0000jP-Uk; Tue, 16 Nov 2021 15:06:37 +0000
Received: by outflank-mailman (input) for mailman id 226348;
 Tue, 16 Nov 2021 15:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogMK=QD=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1mn02e-0000jJ-9k
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:06:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c994e066-46ee-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 16:06:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88C006D;
 Tue, 16 Nov 2021 07:06:33 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 873B53F766;
 Tue, 16 Nov 2021 07:06:32 -0800 (PST)
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
X-Inumbo-ID: c994e066-46ee-11ec-9787-a32c541c8605
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	iwj@xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH-4.16] arm/efi: Improve performance requesting filesystem handle
Date: Tue, 16 Nov 2021 15:06:24 +0000
Message-Id: <20211116150624.7720-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Currently, the code used to handle and possibly load from the filesystem
modules defined in the DT is allocating and closing the filesystem handle
for each module to be loaded.

To improve the performance, the filesystem handle pointer is passed
through the call stack, requested when it's needed only once and closed
if it was allocated.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Justification for integration in 4.16:
Upside:   Fixes a performance issue only on arm that would be really useful
          for ARM users using the release, no functional changes.
Downside: It's affecting the EFI boot path (only on ARM).
Risk:     Risk is low given the small changes.

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
 xen/arch/arm/efi/efi-boot.h | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 458cfbbed4..c4ed412845 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -45,14 +45,17 @@ void __flush_dcache_area(const void *vaddr, unsigned long size);
 static int get_module_file_index(const char *name, unsigned int name_len);
 static void PrintMessage(const CHAR16 *s);
 static int allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
+                                EFI_FILE_HANDLE *dir_handle,
                                 const char *name,
                                 unsigned int name_len);
 static int handle_module_node(EFI_LOADED_IMAGE *loaded_image,
+                              EFI_FILE_HANDLE *dir_handle,
                               int module_node_offset,
                               int reg_addr_cells,
                               int reg_size_cells,
                               bool is_domu_module);
 static int handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
+                                       EFI_FILE_HANDLE *dir_handle,
                                        int domain_node);
 static int efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image);
 
@@ -648,10 +651,10 @@ static void __init PrintMessage(const CHAR16 *s)
  * index of the file in the modules array or a negative number on error.
  */
 static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
+                                       EFI_FILE_HANDLE *dir_handle,
                                        const char *name,
                                        unsigned int name_len)
 {
-    EFI_FILE_HANDLE dir_handle;
     module_name *file_name;
     CHAR16 *fname;
     union string module_name;
@@ -686,12 +689,11 @@ static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
     file_name->name_len = name_len;
 
     /* Get the file system interface. */
-    dir_handle = get_parent_handle(loaded_image, &fname);
+    if ( !*dir_handle )
+        *dir_handle = get_parent_handle(loaded_image, &fname);
 
     /* Load the binary in memory */
-    read_file(dir_handle, s2w(&module_name), &module_binary, NULL);
-
-    dir_handle->Close(dir_handle);
+    read_file(*dir_handle, s2w(&module_name), &module_binary, NULL);
 
     /* Save address and size */
     file_name->addr = module_binary.addr;
@@ -712,6 +714,7 @@ static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
  * Returns 1 if module is multiboot,module, 0 if not, < 0 on error
  */
 static int __init handle_module_node(EFI_LOADED_IMAGE *loaded_image,
+                                     EFI_FILE_HANDLE *dir_handle,
                                      int module_node_offset,
                                      int reg_addr_cells,
                                      int reg_size_cells,
@@ -744,8 +747,8 @@ static int __init handle_module_node(EFI_LOADED_IMAGE *loaded_image,
     file_idx = get_module_file_index(uefi_name_prop, uefi_name_len);
     if ( file_idx < 0 )
     {
-        file_idx = allocate_module_file(loaded_image, uefi_name_prop,
-                                        uefi_name_len);
+        file_idx = allocate_module_file(loaded_image, dir_handle,
+                                        uefi_name_prop, uefi_name_len);
         if ( file_idx < 0 )
             return file_idx;
     }
@@ -812,6 +815,7 @@ static int __init handle_module_node(EFI_LOADED_IMAGE *loaded_image,
  * Returns number of multiboot,module found or negative number on error.
  */
 static int __init handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
+                                              EFI_FILE_HANDLE *dir_handle,
                                               int domain_node)
 {
     int module_node, addr_cells, size_cells, len;
@@ -842,8 +846,8 @@ static int __init handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
           module_node > 0;
           module_node = fdt_next_subnode(fdt, module_node) )
     {
-        int ret = handle_module_node(loaded_image, module_node, addr_cells,
-                                     size_cells, true);
+        int ret = handle_module_node(loaded_image, dir_handle, module_node,
+                                     addr_cells, size_cells, true);
         if ( ret < 0 )
             return ret;
 
@@ -862,6 +866,7 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
 {
     int chosen, node, addr_len, size_len;
     unsigned int i = 0, modules_found = 0;
+    EFI_FILE_HANDLE dir_handle = NULL;
 
     /* Check for the chosen node in the current DTB */
     chosen = setup_chosen_node(fdt, &addr_len, &size_len);
@@ -881,20 +886,24 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
         if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
         {
             /* Found a node with compatible xen,domain; handle this node. */
-            ret = handle_dom0less_domain_node(loaded_image, node);
+            ret = handle_dom0less_domain_node(loaded_image, &dir_handle, node);
             if ( ret < 0 )
                 return ERROR_DT_MODULE_DOMU;
         }
         else
         {
-            ret = handle_module_node(loaded_image, node, addr_len, size_len,
-                                     false);
+            ret = handle_module_node(loaded_image, &dir_handle, node, addr_len,
+                                     size_len, false);
             if ( ret < 0 )
                  return ERROR_DT_MODULE_DOM0;
         }
         modules_found += ret;
     }
 
+    /* dir_handle can be allocated in allocate_module_file, free it if exists */
+    if ( dir_handle )
+        dir_handle->Close(dir_handle);
+
     /* Free boot modules file names if any */
     for ( ; i < modules_idx; i++ )
     {
-- 
2.17.1


