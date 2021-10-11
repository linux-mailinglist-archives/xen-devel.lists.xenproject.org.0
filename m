Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3EA4296AE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 20:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206469.362067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzpw-0008UP-Ha; Mon, 11 Oct 2021 18:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206469.362067; Mon, 11 Oct 2021 18:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzpw-0008Rk-Ck; Mon, 11 Oct 2021 18:15:44 +0000
Received: by outflank-mailman (input) for mailman id 206469;
 Mon, 11 Oct 2021 18:15:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBe3=O7=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mZzpv-0008RI-4e
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 18:15:43 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3d83d01f-2abf-11ec-80ee-12813bfff9fa;
 Mon, 11 Oct 2021 18:15:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C87F101E;
 Mon, 11 Oct 2021 11:15:41 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0298D3F66F;
 Mon, 11 Oct 2021 11:15:39 -0700 (PDT)
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
X-Inumbo-ID: 3d83d01f-2abf-11ec-80ee-12813bfff9fa
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
Subject: [PATCH v6 2/2] arm/efi: load dom0 modules from DT using UEFI
Date: Mon, 11 Oct 2021 19:15:28 +0100
Message-Id: <20211011181528.17367-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211011181528.17367-1-luca.fancellu@arm.com>
References: <20211011181528.17367-1-luca.fancellu@arm.com>

Add support to load Dom0 boot modules from
the device tree using the xen,uefi-binary property.

Update documentation about that.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v6:
- given the changes to is_boot_module() in previous patch,
a check to avoid declaration of xsm in DT and cfg file is
introduced and the call to is_boot_module is removed.
Changes in v5:
- renamed missing uefi,binary string
- used kernel.ptr instead of kernel.addr to be consistent
to the surrounding code
- Changed a comment referring to efi_arch_check_dt_boot
that now is efi_check_dt_boot
Changes in v4:
- Add check to avoid double definition of Dom0 ramdisk
from cfg file and DT
- Fix if conditions indentation in boot.c
- Moved Dom0 kernel verification code after check for
presence for Dom0 or DomU(s)
- Changed uefi,binary property to xen,uefi-binary
Changes in v3:
- new patch
---
 docs/misc/arm/device-tree/booting.txt |  8 ++++
 docs/misc/efi.pandoc                  | 64 +++++++++++++++++++++++++--
 xen/arch/arm/efi/efi-boot.h           | 52 ++++++++++++++++++++--
 xen/common/efi/boot.c                 | 16 ++++---
 4 files changed, 128 insertions(+), 12 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 7258e7e1ec..c6a775f4e8 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -70,6 +70,14 @@ Each node contains the following properties:
 	priority of this field vs. other mechanisms of specifying the
 	bootargs for the kernel.
 
+- xen,uefi-binary (UEFI boot only)
+
+	String property that specifies the file name to be loaded by the UEFI
+	boot for this module. If this is specified, there is no need to specify
+	the reg property because it will be created by the UEFI stub on boot.
+	This option is needed only when UEFI boot is used, the node needs to be
+	compatible with multiboot,kernel or multiboot,ramdisk.
+
 Examples
 ========
 
diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index 876cd55005..4abbb5bb82 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -167,6 +167,28 @@ sbsign \
 	--output xen.signed.efi \
 	xen.unified.efi
 ```
+## UEFI boot and Dom0 modules on ARM
+
+When booting using UEFI on ARM, it is possible to specify the Dom0 modules
+directly from the device tree without using the Xen configuration file, here an
+example:
+
+chosen {
+	#size-cells = <0x1>;
+	#address-cells = <0x1>;
+	xen,xen-bootargs = "[Xen boot arguments]"
+
+	module@1 {
+		compatible = "multiboot,kernel", "multiboot,module";
+		xen,uefi-binary = "vmlinuz-3.0.31-0.4-xen";
+		bootargs = "[domain 0 command line options]";
+	};
+
+	module@2 {
+		compatible = "multiboot,ramdisk", "multiboot,module";
+		xen,uefi-binary = "initrd-3.0.31-0.4-xen";
+	};
+}
 
 ## UEFI boot and dom0less on ARM
 
@@ -326,10 +348,10 @@ chosen {
 ### Boot Xen, Dom0 and DomU(s)
 
 This configuration is a mix of the two configuration above, to boot this one
-the configuration file must be processed so the /chosen node must have the
-"xen,uefi-cfg-load" property.
+the configuration file can be processed or the Dom0 modules can be read from
+the device tree.
 
-Here an example:
+Here the first example:
 
 Xen configuration file:
 
@@ -369,4 +391,40 @@ chosen {
 };
 ```
 
+Here the second example:
+
+Device tree:
+
+```
+chosen {
+	#size-cells = <0x1>;
+	#address-cells = <0x1>;
+	xen,xen-bootargs = "[Xen boot arguments]"
+
+	module@1 {
+		compatible = "multiboot,kernel", "multiboot,module";
+		xen,uefi-binary = "vmlinuz-3.0.31-0.4-xen";
+		bootargs = "[domain 0 command line options]";
+	};
+
+	module@2 {
+		compatible = "multiboot,ramdisk", "multiboot,module";
+		xen,uefi-binary = "initrd-3.0.31-0.4-xen";
+	};
+
+	domU1 {
+		#size-cells = <0x1>;
+		#address-cells = <0x1>;
+		compatible = "xen,domain";
+		cpus = <0x1>;
+		memory = <0x0 0xc0000>;
+		vpl011;
 
+		module@1 {
+			compatible = "multiboot,kernel", "multiboot,module";
+			xen,uefi-binary = "Image-domu1.bin";
+			bootargs = "console=ttyAMA0 root=/dev/ram0 rw";
+		};
+	};
+};
+```
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index f35e035b22..840728d6c0 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -32,8 +32,12 @@ static unsigned int __initdata modules_idx;
 #define ERROR_RENAME_MODULE_NAME    (-4)
 #define ERROR_SET_REG_PROPERTY      (-5)
 #define ERROR_CHECK_MODULE_COMPAT   (-6)
+#define ERROR_DOM0_ALREADY_FOUND    (-7)
+#define ERROR_DOM0_RAMDISK_FOUND    (-8)
+#define ERROR_XSM_ALREADY_FOUND     (-9)
 #define ERROR_DT_MODULE_DOMU        (-1)
 #define ERROR_DT_CHOSEN_NODE        (-2)
+#define ERROR_DT_MODULE_DOM0        (-3)
 
 void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
 void __flush_dcache_area(const void *vaddr, unsigned long size);
@@ -46,7 +50,8 @@ static int allocate_module_file(EFI_FILE_HANDLE dir_handle,
 static int handle_module_node(EFI_FILE_HANDLE dir_handle,
                               int module_node_offset,
                               int reg_addr_cells,
-                              int reg_size_cells);
+                              int reg_size_cells,
+                              bool is_domu_module);
 static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
                                        int domain_node);
 static int efi_check_dt_boot(EFI_FILE_HANDLE dir_handle);
@@ -701,7 +706,8 @@ static int __init allocate_module_file(EFI_FILE_HANDLE dir_handle,
 static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
                                      int module_node_offset,
                                      int reg_addr_cells,
-                                     int reg_size_cells)
+                                     int reg_size_cells,
+                                     bool is_domu_module)
 {
     const void *uefi_name_prop;
     char mod_string[24]; /* Placeholder for module@ + a 64-bit number + \0 */
@@ -754,6 +760,41 @@ static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
         return ERROR_SET_REG_PROPERTY;
     }
 
+    if ( !is_domu_module )
+    {
+        if ( (fdt_node_check_compatible(fdt, module_node_offset,
+                                    "multiboot,kernel") == 0) )
+        {
+            /*
+            * This is the Dom0 kernel, wire it to the kernel variable because it
+            * will be verified by the shim lock protocol later in the common
+            * code.
+            */
+            if ( kernel.addr )
+            {
+                PrintMessage(L"Dom0 kernel already found in cfg file.");
+                return ERROR_DOM0_ALREADY_FOUND;
+            }
+            kernel.need_to_free = false; /* Freed using the module array */
+            kernel.addr = file->addr;
+            kernel.size = file->size;
+        }
+        else if ( ramdisk.addr &&
+                  (fdt_node_check_compatible(fdt, module_node_offset,
+                                             "multiboot,ramdisk") == 0) )
+        {
+            PrintMessage(L"Dom0 ramdisk already found in cfg file.");
+            return ERROR_DOM0_RAMDISK_FOUND;
+        }
+        else if ( xsm.addr &&
+                  (fdt_node_check_compatible(fdt, module_node_offset,
+                                             "xen,xsm-policy") == 0) )
+        {
+            PrintMessage(L"XSM policy already found in cfg file.");
+            return ERROR_XSM_ALREADY_FOUND;
+        }
+    }
+
     return 0;
 }
 
@@ -793,7 +834,7 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
           module_node = fdt_next_subnode(fdt, module_node) )
     {
         int ret = handle_module_node(dir_handle, module_node, addr_cells,
-                                        size_cells);
+                                     size_cells, true);
         if ( ret < 0 )
             return ret;
     }
@@ -803,7 +844,7 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
 
 /*
  * This function checks for xen domain nodes under the /chosen node for possible
- * domU guests to be loaded.
+ * dom0 and domU guests to be loaded.
  * Returns the number of modules loaded or a negative number for error.
  */
 static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
@@ -830,6 +871,9 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
             if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
                 return ERROR_DT_MODULE_DOMU;
         }
+        else if ( handle_module_node(dir_handle, node, addr_len, size_len,
+                                     false) < 0 )
+                 return ERROR_DT_MODULE_DOM0;
     }
 
     /* Free boot modules file names if any */
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 7879b93f93..531975326f 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1302,11 +1302,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
         {
             read_file(dir_handle, s2w(&name), &kernel, option_str);
             efi_bs->FreePool(name.w);
-
-            if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
-                            (void **)&shim_lock)) &&
-                 (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
-                PrintErrMesg(L"Dom0 kernel image could not be verified", status);
         }
 
         if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
@@ -1384,6 +1379,17 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     if ( !dt_modules_found && !kernel.ptr )
         blexit(L"No initial domain kernel specified.");
 
+    /*
+     * The Dom0 kernel can be loaded from the configuration file or by the
+     * device tree through the efi_check_dt_boot function, in this stage
+     * verify it.
+     */
+    if ( kernel.ptr &&
+         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
+                                           (void **)&shim_lock)) &&
+         (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
+        PrintErrMesg(L"Dom0 kernel image could not be verified", status);
+
     efi_arch_edd();
 
     /* XXX Collect EDID info. */
-- 
2.17.1


