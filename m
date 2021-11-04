Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0BC4454B2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 15:14:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221552.383322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1midV2-0003N2-AY; Thu, 04 Nov 2021 14:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221552.383322; Thu, 04 Nov 2021 14:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1midV2-0003LA-7C; Thu, 04 Nov 2021 14:13:52 +0000
Received: by outflank-mailman (input) for mailman id 221552;
 Thu, 04 Nov 2021 14:13:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t6+c=PX=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1midV0-0003L4-Pi
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:13:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6d99cb18-3d79-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 15:13:48 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9435B1FB;
 Thu,  4 Nov 2021 07:13:47 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 520F83F7D7;
 Thu,  4 Nov 2021 07:13:46 -0700 (PDT)
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
X-Inumbo-ID: 6d99cb18-3d79-11ec-9787-a32c541c8605
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	iwj@xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
Date: Thu,  4 Nov 2021 14:12:06 +0000
Message-Id: <20211104141206.25153-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
Taking the occasion to update the comment in handle_module_node(...)
to explain why we return success even if xen,uefi-binary is not found.

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

Changes in v2:
 - Changed comment on DeviceHandle NULL (Jan)
 - Removed fatal condition on handle NULL (Jan)
 - Add more info about the EDK2+Grub2 issue to the commit msg (Jan)
 - Removed modules_found from function signature and pass everything
   on return (Stefano)
 - Improved comment in handle_module_node

---
 xen/arch/arm/efi/efi-boot.h | 34 +++++++++++++++++++++++-----------
 xen/common/efi/boot.c       | 28 +++++++++++++++++++++++++---
 2 files changed, 48 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 8b88dd26a5..c3ae9751ab 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -702,6 +702,7 @@ static int __init allocate_module_file(EFI_FILE_HANDLE dir_handle,
  * This function checks for the presence of the xen,uefi-binary property in the
  * module, if found it loads the binary as module and sets the right address
  * for the reg property into the module DT node.
+ * Returns 1 if module is multiboot,module, 0 if not, < 0 on error
  */
 static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
                                      int module_node_offset,
@@ -730,8 +731,8 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
                                  &uefi_name_len);
 
     if ( !uefi_name_prop )
-        /* Property not found */
-        return 0;
+        /* Property not found, but signal this is a multiboot,module */
+        return 1;
 
     file_idx = get_module_file_index(uefi_name_prop, uefi_name_len);
     if ( file_idx < 0 )
@@ -795,19 +796,20 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
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
 static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
                                               int domain_node)
 {
     int module_node, addr_cells, size_cells, len;
     const struct fdt_property *prop;
+    unsigned int mb_modules_found = 0;
 
     /* Get #address-cells and #size-cells from domain node */
     prop = fdt_get_property(fdt, domain_node, "#address-cells", &len);
@@ -837,20 +839,22 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
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
 static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
 {
     int chosen, node, addr_len, size_len;
-    unsigned int i = 0;
+    unsigned int i = 0, modules_found = 0;
 
     /* Check for the chosen node in the current DTB */
     chosen = setup_chosen_node(fdt, &addr_len, &size_len);
@@ -865,15 +869,23 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
           node > 0;
           node = fdt_next_subnode(fdt, node) )
     {
+        int ret;
+
         if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
         {
             /* Found a node with compatible xen,domain; handle this node. */
-            if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
+            ret = handle_dom0less_domain_node(dir_handle, node);
+            if ( ret < 0 )
                 return ERROR_DT_MODULE_DOMU;
         }
-        else if ( handle_module_node(dir_handle, node, addr_len, size_len,
-                                     false) < 0 )
+        else
+        {
+            ret = handle_module_node(dir_handle, node, addr_len, size_len,
+                                     false);
+            if ( ret < 0 )
                  return ERROR_DT_MODULE_DOM0;
+        }
+        modules_found += ret;
     }
 
     /* Free boot modules file names if any */
@@ -883,7 +895,7 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
         efi_bs->FreePool(modules[i].name);
     }
 
-    return modules_idx;
+    return modules_found;
 }
 
 static void __init efi_arch_cpu(void)
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 392ff3ac9b..112b7e7571 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -449,6 +449,15 @@ static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
     CHAR16 *pathend, *ptr;
     EFI_STATUS ret;
 
+    /*
+     * Grub2 running on top of EDK2 has been observed to supply a NULL
+     * DeviceHandle. We can't use that to gain access to the filesystem.
+     * However the system can still boot if it doesn’t require access to the
+     * filesystem.
+     */
+    if ( !loaded_image->DeviceHandle )
+        return NULL;
+
     do {
         EFI_FILE_IO_INTERFACE *fio;
 
@@ -581,6 +590,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     EFI_STATUS ret;
     const CHAR16 *what = NULL;
 
+    if ( !dir_handle )
+        blexit(L"Error: No access to the filesystem");
     if ( !name )
         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
     ret = dir_handle->Open(dir_handle, &FileHandle, name,
@@ -1333,8 +1344,18 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
             EFI_FILE_HANDLE handle = get_parent_handle(loaded_image,
                                                        &file_name);
 
-            handle->Close(handle);
-            *argv = file_name;
+            if ( !handle )
+            {
+                PrintErr(L"Error retrieving image name: no filesystem access."
+                         L" Setting default to xen.efi");
+                PrintErr(newline);
+                *argv = L"xen.efi";
+            }
+            else
+            {
+                handle->Close(handle);
+                *argv = file_name;
+            }
         }
 
         name.s = get_value(&cfg, section.s, "options");
@@ -1369,7 +1390,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     /* Get the number of boot modules specified on the DT or an error (<0) */
     dt_modules_found = efi_check_dt_boot(dir_handle);
 
-    dir_handle->Close(dir_handle);
+    if ( dir_handle )
+        dir_handle->Close(dir_handle);
 
     if ( dt_modules_found < 0 )
         /* efi_check_dt_boot throws some error */
-- 
2.17.1


