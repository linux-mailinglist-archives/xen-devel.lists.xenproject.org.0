Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76E440C769
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 16:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187705.336683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVrk-0003P3-Qa; Wed, 15 Sep 2021 14:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187705.336683; Wed, 15 Sep 2021 14:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVrk-0003MK-Ms; Wed, 15 Sep 2021 14:26:24 +0000
Received: by outflank-mailman (input) for mailman id 187705;
 Wed, 15 Sep 2021 14:26:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Uy1=OF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mQVrj-0002oh-1A
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 14:26:23 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e433f3d8-1630-11ec-b535-12813bfff9fa;
 Wed, 15 Sep 2021 14:26:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 479AE6D;
 Wed, 15 Sep 2021 07:26:18 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6D083F719;
 Wed, 15 Sep 2021 07:26:16 -0700 (PDT)
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
X-Inumbo-ID: e433f3d8-1630-11ec-b535-12813bfff9fa
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
Subject: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI boot
Date: Wed, 15 Sep 2021 15:26:02 +0100
Message-Id: <20210915142602.42862-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210915142602.42862-1-luca.fancellu@arm.com>
References: <20210915142602.42862-1-luca.fancellu@arm.com>

This patch introduces the support for dom0less configuration
when using UEFI boot on ARM, it permits the EFI boot to
continue if no dom0 kernel is specified but at least one domU
is found.

Introduce the new property "uefi,binary" for device tree boot
module nodes that are subnode of "xen,domain" compatible nodes.
The property holds a string containing the file name of the
binary that shall be loaded by the uefi loader from the filesystem.

Update efi documentation about how to start a dom0less
setup using UEFI

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misc/efi.pandoc        |  37 ++++++
 xen/arch/arm/efi/efi-boot.h | 244 +++++++++++++++++++++++++++++++++++-
 xen/common/efi/boot.c       |  20 ++-
 3 files changed, 294 insertions(+), 7 deletions(-)

diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index ac3cd58cae..db9b3273f8 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -165,3 +165,40 @@ sbsign \
 	--output xen.signed.efi \
 	xen.unified.efi
 ```
+
+## UEFI boot and dom0less on ARM
+
+Dom0less feature is supported by ARM and it is possible to use it when Xen is
+started as an EFI application.
+The way to specify the domU domains is by Device Tree as specified in the
+[dom0less](dom0less.html) documentation page under the "Device Tree
+configuration" section, but instead of declaring the reg property in the boot
+module, the user must specify the "uefi,binary" property containing the name
+of the binary file that has to be loaded in memory.
+The UEFI stub will load the binary in memory and it will add the reg property
+accordingly.
+
+An example here:
+
+    domU1 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "xen,domain";
+        memory = <0 0x20000>;
+        cpus = <1>;
+        vpl011;
+
+        module@1 {
+            compatible = "multiboot,kernel", "multiboot,module";
+            uefi,binary = "vmlinuz-3.0.31-0.4-xen";
+            bootargs = "console=ttyAMA0";
+        };
+        module@2 {
+            compatible = "multiboot,ramdisk", "multiboot,module";
+            uefi,binary = "initrd-3.0.31-0.4-xen";
+        };
+        module@3 {
+            compatible = "multiboot,ramdisk", "multiboot,module";
+            uefi,binary = "passthrough.dtb";
+        };
+    };
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 5ff626c6a0..8d7ced70f2 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -8,9 +8,39 @@
 #include <asm/setup.h>
 #include <asm/smp.h>
 
+typedef struct {
+    char* name;
+    int name_len;
+} dom0less_module_name;
+
+/*
+ * Binaries will be translated into bootmodules, the maximum number for them is
+ * MAX_MODULES where we should remove a unit for Xen and one for Xen DTB
+ */
+#define MAX_DOM0LESS_MODULES (MAX_MODULES - 2)
+static struct file __initdata dom0less_files[MAX_DOM0LESS_MODULES];
+static dom0less_module_name __initdata dom0less_bin_names[MAX_DOM0LESS_MODULES];
+static uint32_t __initdata dom0less_modules_available = MAX_DOM0LESS_MODULES;
+static uint32_t __initdata dom0less_modules_idx = 0;
+
+#define ERROR_DOM0LESS_FILE_NOT_FOUND -1
+
 void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
 void __flush_dcache_area(const void *vaddr, unsigned long size);
 
+static int __init get_dom0less_file_index(const char* name, int name_len);
+static uint32_t __init allocate_dom0less_file(EFI_FILE_HANDLE dir_handle,
+                                              const char* name, int name_len);
+static void __init handle_dom0less_module_node(EFI_FILE_HANDLE dir_handle,
+                                               int module_node_offset,
+                                               int reg_addr_cells,
+                                               int reg_size_cells);
+static void __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
+                                               int domain_node,
+                                               int addr_cells,
+                                               int size_cells);
+static bool __init check_dom0less_efi_boot(EFI_FILE_HANDLE dir_handle);
+
 #define DEVICE_TREE_GUID \
 {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0}}
 
@@ -552,8 +582,209 @@ static void __init efi_arch_handle_module(const struct file *file,
                          kernel.size) < 0 )
             blexit(L"Unable to set reg property.");
     }
-    else
+    else if ( !((file >= &dom0less_files[0]) &&
+               (file <= &dom0less_files[MAX_DOM0LESS_MODULES-1])) )
+        /*
+         * If file is not a dom0 module file and it's not any domU modules,
+         * stop here.
+         */
         blexit(L"Unknown module type");
+
+    /*
+     * dom0less_modules_available is decremented here because for each dom0
+     * file added, there will be an additional bootmodule, so the number
+     * of dom0less module files will be decremented because there is
+     * a maximum amount of bootmodules that can be loaded.
+     */
+    dom0less_modules_available--;
+}
+
+/*
+ * This function checks for a binary previously loaded with a give name, it
+ * returns the index of the file in the dom0less_files array or a negative
+ * number if no file with that name is found.
+ */
+static int __init get_dom0less_file_index(const char* name, int name_len)
+{
+    int ret = ERROR_DOM0LESS_FILE_NOT_FOUND;
+
+    for (uint32_t i = 0; i < dom0less_modules_idx; i++)
+    {
+        dom0less_module_name* mod = &dom0less_bin_names[i];
+        if ( (mod->name_len == name_len) &&
+             (strncmp(mod->name, name, name_len) == 0) )
+        {
+            ret = i;
+            break;
+        }
+    }
+    return ret;
+}
+
+/*
+ * This function allocates a binary and keeps track of its name, it
+ * returns the index of the file in the dom0less_files array.
+ */
+static uint32_t __init allocate_dom0less_file(EFI_FILE_HANDLE dir_handle,
+                                              const char* name, int name_len)
+{
+    dom0less_module_name* file_name;
+    union string module_name;
+    struct file* file;
+    uint32_t ret_idx;
+
+    /*
+     * Check if there is any space left for a domU module, the variable
+     * dom0less_modules_available is updated each time we use read_file(...)
+     * successfully.
+     */
+    if ( !dom0less_modules_available )
+        blexit(L"No space left for domU modules");
+
+    module_name.s = (char*) name;
+    ret_idx = dom0less_modules_idx;
+    file = &dom0less_files[ret_idx];
+
+    /* Save at this index the name of this binary */
+    file_name = &dom0less_bin_names[ret_idx];
+
+    if ( efi_bs->AllocatePool(EfiLoaderData, (name_len + 1) * sizeof(char),
+                              (void**)&file_name->name) != EFI_SUCCESS )
+        blexit(L"Error allocating memory for dom0less binary name");
+
+    /* Save name and length of the binary in the data structure */
+    strlcpy(file_name->name, name, name_len);
+    file_name->name_len = name_len;
+
+    /* Load the binary in memory */
+    read_file(dir_handle, s2w(&module_name), file, NULL);
+
+    /* s2w(...) allocates some memory, free it */
+    efi_bs->FreePool(module_name.w);
+
+    dom0less_modules_idx++;
+
+    return ret_idx;
+}
+
+/*
+ * This function checks for the presence of the uefi,binary property in the
+ * module, if found it loads the binary as dom0less module and sets the right
+ * address for the reg property into the module DT node.
+ */
+static void __init handle_dom0less_module_node(EFI_FILE_HANDLE dir_handle,
+                                          int module_node_offset,
+                                          int reg_addr_cells,
+                                          int reg_size_cells)
+{
+    const void* uefi_name_prop;
+    char mod_string[24]; /* Placeholder for module@ + a 64-bit number + \0 */
+    int uefi_name_len, file_idx;
+    struct file* file;
+
+    /* Read uefi,binary property to get the file name. */
+    uefi_name_prop = fdt_getprop(fdt, module_node_offset, "uefi,binary",
+                                 &uefi_name_len);
+
+    if ( NULL == uefi_name_prop )
+        /* Property not found */
+        return;
+
+    file_idx = get_dom0less_file_index(uefi_name_prop, uefi_name_len);
+    if (file_idx < 0)
+        file_idx = allocate_dom0less_file(dir_handle, uefi_name_prop,
+                                          uefi_name_len);
+
+    file = &dom0less_files[file_idx];
+
+    snprintf(mod_string, sizeof(mod_string), "module@%"PRIx64, file->addr);
+
+    /* Rename the module to be module@{address} */
+    if ( fdt_set_name(fdt, module_node_offset, mod_string) < 0 )
+        blexit(L"Unable to add domU ramdisk FDT node.");
+
+    if ( fdt_set_reg(fdt, module_node_offset, reg_addr_cells, reg_size_cells,
+                     file->addr, file->size) < 0 )
+        blexit(L"Unable to set reg property.");
+}
+
+/*
+ * This function checks for boot modules under the domU guest domain node
+ * in the DT.
+ */
+static void __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
+                                               int domain_node,
+                                               int addr_cells,
+                                               int size_cells)
+{
+    /*
+     * Check for nodes compatible with multiboot,{kernel,ramdisk,device-tree}
+     * inside this node
+     */
+    for ( int module_node = fdt_first_subnode(fdt, domain_node);
+          module_node > 0;
+          module_node = fdt_next_subnode(fdt, module_node) )
+    {
+        if ( (fdt_node_check_compatible(fdt, module_node,
+                                        "multiboot,kernel") == 0) ||
+             (fdt_node_check_compatible(fdt, module_node,
+                                        "multiboot,ramdisk") == 0) ||
+             (fdt_node_check_compatible(fdt, module_node,
+                                        "multiboot,device-tree") == 0) )
+        {
+            /* The compatible is one of the strings above, check the module */
+            handle_dom0less_module_node(dir_handle, module_node, addr_cells,
+                                        size_cells);
+        }
+    }
+}
+
+/*
+ * This function checks for xen domain nodes under the /chosen node for possible
+ * domU guests to be loaded.
+ */
+static bool __init check_dom0less_efi_boot(EFI_FILE_HANDLE dir_handle)
+{
+    int chosen;
+    int addr_len, size_len;
+
+    /* Check for the chosen node in the current DTB */
+    chosen = setup_chosen_node(fdt, &addr_len, &size_len);
+    if ( chosen < 0 )
+        blexit(L"Unable to setup chosen node");
+
+    /* Check for nodes compatible with xen,domain under the chosen node */
+    for ( int node = fdt_first_subnode(fdt, chosen);
+          node > 0;
+          node = fdt_next_subnode(fdt, node) )
+    {
+        int addr_cells, size_cells, len;
+        const struct fdt_property *prop;
+
+        if ( fdt_node_check_compatible(fdt, node, "xen,domain") != 0 )
+            continue;
+
+        /* Get or set #address-cells and #size-cells */
+        prop = fdt_get_property(fdt, node, "#address-cells", &len);
+        if ( !prop )
+            blexit(L"#address-cells not found in domain node.");
+
+        addr_cells = fdt32_to_cpu(*((uint32_t *)prop->data));
+
+        prop = fdt_get_property(fdt, node, "#size-cells", &len);
+        if ( !prop )
+            blexit(L"#size-cells not found in domain node.");
+
+        size_cells = fdt32_to_cpu(*((uint32_t *)prop->data));
+
+        /* Found a node with compatible xen,domain; handle this node. */
+        handle_dom0less_domain_node(dir_handle, node, addr_cells, size_cells);
+    }
+
+    if ( dom0less_modules_idx > 0 )
+        return true;
+
+    return false;
 }
 
 static void __init efi_arch_cpu(void)
@@ -562,8 +793,19 @@ static void __init efi_arch_cpu(void)
 
 static void __init efi_arch_blexit(void)
 {
+    uint32_t i = 0;
     if ( dtbfile.need_to_free )
         efi_bs->FreePages(dtbfile.addr, PFN_UP(dtbfile.size));
+    /* Free dom0less files if any */
+    for ( ; i < dom0less_modules_idx; i++ )
+    {
+        /* Free dom0less binary names */
+        efi_bs->FreePool(dom0less_bin_names[i].name);
+        /* Free dom0less binaries */
+        if ( dom0less_files[i].need_to_free )
+            efi_bs->FreePages(dom0less_files[i].addr,
+                              PFN_UP(dom0less_files[i].size));
+    }
     if ( memmap )
         efi_bs->FreePool(memmap);
 }
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 758f9d74d2..65493c4b46 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1134,8 +1134,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
     union string section = { NULL }, name;
     bool base_video = false;
-    const char *option_str;
+    const char *option_str = NULL;
     bool use_cfg_file;
+    bool dom0less_found = false;
 
     __set_bit(EFI_BOOT, &efi_flags);
     __set_bit(EFI_LOADER, &efi_flags);
@@ -1285,14 +1286,21 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
             efi_bs->FreePool(name.w);
         }
 
-        if ( !name.s )
-            blexit(L"No Dom0 kernel image specified.");
-
         efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
 
-        option_str = split_string(name.s);
+#ifdef CONFIG_ARM
+        /* dom0less feature is supported only on ARM */
+        dom0less_found = check_dom0less_efi_boot(dir_handle);
+#endif
+
+        if ( !name.s && !dom0less_found )
+            blexit(L"No Dom0 kernel image specified.");
+
+        if ( name.s != NULL )
+            option_str = split_string(name.s);
 
-        if ( !read_section(loaded_image, L"kernel", &kernel, option_str) )
+        if ( (!read_section(loaded_image, L"kernel", &kernel, option_str)) &&
+             (name.s != NULL) )
         {
             read_file(dir_handle, s2w(&name), &kernel, option_str);
             efi_bs->FreePool(name.w);
-- 
2.17.1


