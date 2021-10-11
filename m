Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A432428847
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 10:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205415.360713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqHH-0007e6-6s; Mon, 11 Oct 2021 08:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205415.360713; Mon, 11 Oct 2021 08:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqHH-0007as-2a; Mon, 11 Oct 2021 08:03:19 +0000
Received: by outflank-mailman (input) for mailman id 205415;
 Mon, 11 Oct 2021 08:03:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBe3=O7=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mZqHF-0007Zo-2A
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 08:03:17 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id eb55e371-b339-45e3-a53b-531ce92b187f;
 Mon, 11 Oct 2021 08:03:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D619C11FB;
 Mon, 11 Oct 2021 01:03:13 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 366E43F66F;
 Mon, 11 Oct 2021 01:03:12 -0700 (PDT)
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
X-Inumbo-ID: eb55e371-b339-45e3-a53b-531ce92b187f
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
Subject: [PATCH v5 1/2] arm/efi: Use dom0less configuration when using EFI boot
Date: Mon, 11 Oct 2021 09:03:01 +0100
Message-Id: <20211011080302.24203-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211011080302.24203-1-luca.fancellu@arm.com>
References: <20211011080302.24203-1-luca.fancellu@arm.com>

This patch introduces the support for dom0less configuration
when using UEFI boot on ARM, it permits the EFI boot to
continue if no dom0 kernel is specified but at least one domU
is found.

Introduce the new property "xen,uefi-binary" for device tree boot
module nodes that are subnode of "xen,domain" compatible nodes.
The property holds a string containing the file name of the
binary that shall be loaded by the uefi loader from the filesystem.

Introduce a new call efi_check_dt_boot(...) called during EFI boot
that checks for module to be loaded using device tree.
Architectures that don't support device tree don't have to
provide this function.

Update efi documentation about how to start a dom0less
setup using UEFI

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v5:
- Removed unneeded variable initialization
- Fixed comment
- Fixed error message for the absence of an initial domain kernel
- changed efi_arch_check_dt_boot to efi_check_dt_boot and add
a stub if CONFIG_HAS_DEVICE_TREE is not declared, updated commit
message about the call introduction in the EFI boot flow.
Changes in v4:
- update uefi,cfg-load to xen,uefi-cfg-load in documentation
- fixed comments and code style
- changed variable name from dt_module_found to dt_modules_found
in boot.c
- removed stub efi_arch_check_dt_boot from x86 code because the
architecture does not support DT, protected call with #ifdef
in the common code.
- add comment to explain the result from efi_arch_check_dt_boot
just looking the common code
- Add space before comment in boot.c
- renamed uefi,binary property to xen,uefi-binary
Changes in v3:
- fixed documentation
- fixed name len in strlcpy
- fixed some style issues
- closed filesystem handle before calling blexit
- passed runtime errors up to the stack instead
of calling blexit
- renamed names and function to make them more
general in prevision to load also Dom0 kernel
and ramdisk from DT
Changes in v2:
- remove array of struct file
- fixed some int types
- Made the code use filesystem even when configuration
file is skipped.
- add documentation of uefi,binary in booting.txt
- add documentation on how to boot all configuration
for Xen using UEFI in efi.pandoc
---
 docs/misc/arm/device-tree/booting.txt |  21 ++
 docs/misc/efi.pandoc                  | 203 +++++++++++++++++
 xen/arch/arm/efi/efi-boot.h           | 305 +++++++++++++++++++++++++-
 xen/common/efi/boot.c                 |  39 +++-
 4 files changed, 556 insertions(+), 12 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 352b0ec43a..7258e7e1ec 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -190,6 +190,13 @@ The kernel sub-node has the following properties:
 
     Command line parameters for the guest kernel.
 
+- xen,uefi-binary (UEFI boot only)
+
+    String property that specifies the file name to be loaded by the UEFI boot
+    for this module. If this is specified, there is no need to specify the reg
+    property because it will be created by the UEFI stub on boot.
+    This option is needed only when UEFI boot is used.
+
 The ramdisk sub-node has the following properties:
 
 - compatible
@@ -201,6 +208,13 @@ The ramdisk sub-node has the following properties:
     Specifies the physical address of the ramdisk in RAM and its
     length.
 
+- xen,uefi-binary (UEFI boot only)
+
+    String property that specifies the file name to be loaded by the UEFI boot
+    for this module. If this is specified, there is no need to specify the reg
+    property because it will be created by the UEFI stub on boot.
+    This option is needed only when UEFI boot is used.
+
 
 Example
 =======
@@ -265,6 +279,13 @@ The dtb sub-node should have the following properties:
     Specifies the physical address of the device tree binary fragment
     RAM and its length.
 
+- xen,uefi-binary (UEFI boot only)
+
+    String property that specifies the file name to be loaded by the UEFI boot
+    for this module. If this is specified, there is no need to specify the reg
+    property because it will be created by the UEFI stub on boot.
+    This option is needed only when UEFI boot is used.
+
 As an example:
 
         module@0xc000000 {
diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index ed85351541..876cd55005 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -167,3 +167,206 @@ sbsign \
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
+module, the user must specify the "xen,uefi-binary" property containing the name
+of the binary file that has to be loaded in memory.
+The UEFI stub will load the binary in memory and it will add the reg property
+accordingly.
+
+An example here:
+
+domU1 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "xen,domain";
+	memory = <0 0x20000>;
+	cpus = <1>;
+	vpl011;
+
+	module@1 {
+		compatible = "multiboot,kernel", "multiboot,module";
+		xen,uefi-binary = "vmlinuz-3.0.31-0.4-xen";
+		bootargs = "console=ttyAMA0";
+	};
+	module@2 {
+		compatible = "multiboot,ramdisk", "multiboot,module";
+		xen,uefi-binary = "initrd-3.0.31-0.4-xen";
+	};
+	module@3 {
+		compatible = "multiboot,ramdisk", "multiboot,module";
+		xen,uefi-binary = "passthrough.dtb";
+	};
+};
+
+## How to boot different Xen setup using UEFI
+
+These are the different ways to boot a Xen system from UEFI:
+
+ - Boot Xen and Dom0 (minimum required)
+ - Boot Xen and DomU(s) (true dom0less, only on ARM)
+ - Boot Xen, Dom0 and DomU(s) (only on ARM)
+
+### Boot Xen and Dom0
+
+This configuration can be started using the Xen configuration file in the
+example above.
+
+### Boot Xen and DomU(s)
+
+This configuration needs the domU domain(s) specified in the /chosen node,
+examples of how to do that are provided by the documentation about dom0less
+and the example above shows how to use the "xen,uefi-binary" property to use the
+UEFI stub for module loading.
+When adding DomU modules to device tree, also add the property
+xen,uefi-cfg-load under chosen for Xen to load the Xen config file.
+Otherwise, Xen will skip the config file and rely on device tree alone.
+
+Example 1 of how to boot a true dom0less configuration:
+
+Xen configuration file: skipped.
+
+Device tree:
+
+```
+chosen {
+	#size-cells = <0x1>;
+	#address-cells = <0x1>;
+	xen,xen-bootargs = "<Xen command line>"
+
+	domU1 {
+		#size-cells = <0x1>;
+		#address-cells = <0x1>;
+		compatible = "xen,domain";
+		cpus = <0x1>;
+		memory = <0x0 0xc0000>;
+		vpl011;
+
+		module@1 {
+			compatible = "multiboot,kernel", "multiboot,module";
+			xen,uefi-binary = "Image-domu1.bin";
+			bootargs = "console=ttyAMA0 root=/dev/ram0 rw";
+		};
+	};
+	domU2 {
+		#size-cells = <0x1>;
+		#address-cells = <0x1>;
+		compatible = "xen,domain";
+		cpus = <0x1>;
+		memory = <0x0 0x100000>;
+		vpl011;
+
+		module@2 {
+			compatible = "multiboot,kernel", "multiboot,module";
+			xen,uefi-binary = "Image-domu2.bin";
+			bootargs = "console=ttyAMA0 root=/dev/ram0 rw";
+		};
+	};
+};
+```
+
+Example 2 of how to boot a true dom0less configuration:
+
+Xen configuration file:
+
+```
+[global]
+default=xen
+
+[xen]
+options=<Xen command line>
+dtb=<optional DTB>
+```
+
+Device tree:
+
+```
+chosen {
+	#size-cells = <0x1>;
+	#address-cells = <0x1>;
+	xen,uefi-cfg-load;
+
+	domU1 {
+		#size-cells = <0x1>;
+		#address-cells = <0x1>;
+		compatible = "xen,domain";
+		cpus = <0x1>;
+		memory = <0x0 0xc0000>;
+		vpl011;
+
+		module@1 {
+			compatible = "multiboot,kernel", "multiboot,module";
+			xen,uefi-binary = "Image-domu1.bin";
+			bootargs = "console=ttyAMA0 root=/dev/ram0 rw";
+		};
+	};
+	domU2 {
+		#size-cells = <0x1>;
+		#address-cells = <0x1>;
+		compatible = "xen,domain";
+		cpus = <0x1>;
+		memory = <0x0 0x100000>;
+		vpl011;
+
+		module@2 {
+			compatible = "multiboot,kernel", "multiboot,module";
+			xen,uefi-binary = "Image-domu2.bin";
+			bootargs = "console=ttyAMA0 root=/dev/ram0 rw";
+		};
+	};
+};
+```
+
+### Boot Xen, Dom0 and DomU(s)
+
+This configuration is a mix of the two configuration above, to boot this one
+the configuration file must be processed so the /chosen node must have the
+"xen,uefi-cfg-load" property.
+
+Here an example:
+
+Xen configuration file:
+
+```
+[global]
+default=xen
+
+[xen]
+options=<Xen command line>
+kernel=vmlinuz-3.0.31-0.4-xen [domain 0 command line options]
+ramdisk=initrd-3.0.31-0.4-xen
+dtb=<optional DTB>
+```
+
+Device tree:
+
+```
+chosen {
+	#size-cells = <0x1>;
+	#address-cells = <0x1>;
+	xen,uefi-cfg-load;
+
+	domU1 {
+		#size-cells = <0x1>;
+		#address-cells = <0x1>;
+		compatible = "xen,domain";
+		cpus = <0x1>;
+		memory = <0x0 0xc0000>;
+		vpl011;
+
+		module@1 {
+			compatible = "multiboot,kernel", "multiboot,module";
+			xen,uefi-binary = "Image-domu1.bin";
+			bootargs = "console=ttyAMA0 root=/dev/ram0 rw";
+		};
+	};
+};
+```
+
+
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index a3e46453d4..9c1d400fa6 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -8,9 +8,49 @@
 #include <asm/setup.h>
 #include <asm/smp.h>
 
+typedef struct {
+    char *name;
+    unsigned int name_len;
+    EFI_PHYSICAL_ADDRESS addr;
+    UINTN size;
+} module_name;
+
+/*
+ * Binaries will be translated into bootmodules, the maximum number for them is
+ * MAX_MODULES where we should remove a unit for Xen and one for Xen DTB
+ */
+#define MAX_UEFI_MODULES (MAX_MODULES - 2)
+static struct file __initdata module_binary;
+static module_name __initdata modules[MAX_UEFI_MODULES];
+static unsigned int __initdata modules_available = MAX_UEFI_MODULES;
+static unsigned int __initdata modules_idx;
+
+#define ERROR_BINARY_FILE_NOT_FOUND (-1)
+#define ERROR_ALLOC_MODULE_NO_SPACE (-1)
+#define ERROR_ALLOC_MODULE_NAME     (-2)
+#define ERROR_MISSING_DT_PROPERTY   (-3)
+#define ERROR_RENAME_MODULE_NAME    (-4)
+#define ERROR_SET_REG_PROPERTY      (-5)
+#define ERROR_DT_MODULE_DOMU        (-1)
+#define ERROR_DT_CHOSEN_NODE        (-2)
+
 void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
 void __flush_dcache_area(const void *vaddr, unsigned long size);
 
+static int get_module_file_index(const char *name, unsigned int name_len);
+static void PrintMessage(const CHAR16 *s);
+static int allocate_module_file(EFI_FILE_HANDLE dir_handle,
+                                const char *name,
+                                unsigned int name_len);
+static int handle_module_node(EFI_FILE_HANDLE dir_handle,
+                              int module_node_offset,
+                              int reg_addr_cells,
+                              int reg_size_cells);
+static bool is_boot_module(int dt_module_offset);
+static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
+                                       int domain_node);
+static int efi_check_dt_boot(EFI_FILE_HANDLE dir_handle);
+
 #define DEVICE_TREE_GUID \
 {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0}}
 
@@ -552,8 +592,260 @@ static void __init efi_arch_handle_module(const struct file *file,
                          kernel.size) < 0 )
             blexit(L"Unable to set reg property.");
     }
-    else
+    else if ( file != &module_binary )
+        /*
+         * If file is not a dom0 module file and it's not a domU module,
+         * stop here.
+         */
         blexit(L"Unknown module type");
+
+    /*
+     * modules_available is decremented here because for each dom0 file added
+     * from the configuration file, there will be an additional bootmodule,
+     * so the number of available slots will be decremented because there is a
+     * maximum amount of bootmodules that can be loaded.
+     */
+    modules_available--;
+}
+
+/*
+ * This function checks for a binary previously loaded with a give name, it
+ * returns the index of the file in the modules array or a negative number if no
+ * file with that name is found.
+ */
+static int __init get_module_file_index(const char *name,
+                                        unsigned int name_len)
+{
+    unsigned int i;
+    int ret = ERROR_BINARY_FILE_NOT_FOUND;
+
+    for ( i = 0; i < modules_idx; i++ )
+    {
+        module_name *mod = &modules[i];
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
+static void __init PrintMessage(const CHAR16 *s)
+{
+    PrintStr(s);
+    PrintStr(newline);
+}
+
+/*
+ * This function allocates a binary and keeps track of its name, it returns the
+ * index of the file in the modules array or a negative number on error.
+ */
+static int __init allocate_module_file(EFI_FILE_HANDLE dir_handle,
+                                       const char *name,
+                                       unsigned int name_len)
+{
+    module_name *file_name;
+    union string module_name;
+    int ret;
+
+    /*
+     * Check if there is any space left for a module, the variable
+     * modules_available is updated each time we use read_file(...)
+     * successfully.
+     */
+    if ( !modules_available )
+    {
+        PrintMessage(L"No space left for modules");
+        return ERROR_ALLOC_MODULE_NO_SPACE;
+    }
+
+    module_name.cs = name;
+    ret = modules_idx;
+
+    /* Save at this index the name of this binary */
+    file_name = &modules[ret];
+
+    if ( efi_bs->AllocatePool(EfiLoaderData, (name_len + 1) * sizeof(char),
+                              (void**)&file_name->name) != EFI_SUCCESS )
+    {
+        PrintMessage(L"Error allocating memory for module binary name");
+        return ERROR_ALLOC_MODULE_NAME;
+    }
+
+    /* Save name and length of the binary in the data structure */
+    strlcpy(file_name->name, name, name_len + 1);
+    file_name->name_len = name_len;
+
+    /* Load the binary in memory */
+    read_file(dir_handle, s2w(&module_name), &module_binary, NULL);
+
+    /* Save address and size */
+    file_name->addr = module_binary.addr;
+    file_name->size = module_binary.size;
+
+    /* s2w(...) allocates some memory, free it */
+    efi_bs->FreePool(module_name.w);
+
+    modules_idx++;
+
+    return ret;
+}
+
+/*
+ * This function checks for the presence of the xen,uefi-binary property in the
+ * module, if found it loads the binary as module and sets the right address
+ * for the reg property into the module DT node.
+ */
+static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
+                                     int module_node_offset,
+                                     int reg_addr_cells,
+                                     int reg_size_cells)
+{
+    const void *uefi_name_prop;
+    char mod_string[24]; /* Placeholder for module@ + a 64-bit number + \0 */
+    int uefi_name_len, file_idx;
+    module_name *file;
+
+    /* Read xen,uefi-binary property to get the file name. */
+    uefi_name_prop = fdt_getprop(fdt, module_node_offset, "xen,uefi-binary",
+                                 &uefi_name_len);
+
+    if ( !uefi_name_prop )
+        /* Property not found */
+        return 0;
+
+    file_idx = get_module_file_index(uefi_name_prop, uefi_name_len);
+    if ( file_idx < 0 )
+    {
+        file_idx = allocate_module_file(dir_handle, uefi_name_prop,
+                                        uefi_name_len);
+        if ( file_idx < 0 )
+            return file_idx;
+    }
+
+    file = &modules[file_idx];
+
+    snprintf(mod_string, sizeof(mod_string), "module@%"PRIx64, file->addr);
+
+    /* Rename the module to be module@{address} */
+    if ( fdt_set_name(fdt, module_node_offset, mod_string) < 0 )
+    {
+        PrintMessage(L"Unable to modify module node name.");
+        return ERROR_RENAME_MODULE_NAME;
+    }
+
+    if ( fdt_set_reg(fdt, module_node_offset, reg_addr_cells, reg_size_cells,
+                     file->addr, file->size) < 0 )
+    {
+        PrintMessage(L"Unable to set module reg property.");
+        return ERROR_SET_REG_PROPERTY;
+    }
+
+    return 0;
+}
+
+static bool __init is_boot_module(int dt_module_offset)
+{
+    if ( (fdt_node_check_compatible(fdt, dt_module_offset,
+                                    "multiboot,kernel") == 0) ||
+         (fdt_node_check_compatible(fdt, dt_module_offset,
+                                    "multiboot,ramdisk") == 0) ||
+         (fdt_node_check_compatible(fdt, dt_module_offset,
+                                    "multiboot,device-tree") == 0) )
+        return true;
+
+    return false;
+}
+
+/*
+ * This function checks for boot modules under the domU guest domain node
+ * in the DT.
+ * Returns 0 on success, negative number on error.
+ */
+static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
+                                              int domain_node)
+{
+    int module_node, addr_cells, size_cells, len;
+    const struct fdt_property *prop;
+
+    /* Get #address-cells and #size-cells from domain node */
+    prop = fdt_get_property(fdt, domain_node, "#address-cells", &len);
+    if ( !prop )
+    {
+        PrintMessage(L"#address-cells not found in domain node.");
+        return ERROR_MISSING_DT_PROPERTY;
+    }
+
+    addr_cells = fdt32_to_cpu(*((uint32_t *)prop->data));
+
+    prop = fdt_get_property(fdt, domain_node, "#size-cells", &len);
+    if ( !prop )
+    {
+        PrintMessage(L"#size-cells not found in domain node.");
+        return ERROR_MISSING_DT_PROPERTY;
+    }
+
+    size_cells = fdt32_to_cpu(*((uint32_t *)prop->data));
+
+    /*
+     * Check for nodes compatible with multiboot,{kernel,ramdisk,device-tree}
+     * inside this node
+     */
+    for ( module_node = fdt_first_subnode(fdt, domain_node);
+          module_node > 0;
+          module_node = fdt_next_subnode(fdt, module_node) )
+        if ( is_boot_module(module_node) )
+        {
+            int ret = handle_module_node(dir_handle, module_node, addr_cells,
+                                         size_cells);
+            if ( ret < 0 )
+                return ret;
+        }
+
+    return 0;
+}
+
+/*
+ * This function checks for xen domain nodes under the /chosen node for possible
+ * domU guests to be loaded.
+ * Returns the number of modules loaded or a negative number for error.
+ */
+static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
+{
+    int chosen, node, addr_len, size_len;
+    unsigned int i = 0;
+
+    /* Check for the chosen node in the current DTB */
+    chosen = setup_chosen_node(fdt, &addr_len, &size_len);
+    if ( chosen < 0 )
+    {
+        PrintMessage(L"Unable to setup chosen node");
+        return ERROR_DT_CHOSEN_NODE;
+    }
+
+    /* Check for nodes compatible with xen,domain under the chosen node */
+    for ( node = fdt_first_subnode(fdt, chosen);
+          node > 0;
+          node = fdt_next_subnode(fdt, node) )
+    {
+        if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
+        {
+            /* Found a node with compatible xen,domain; handle this node. */
+            if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
+                return ERROR_DT_MODULE_DOMU;
+        }
+    }
+
+    /* Free boot modules file names if any */
+    for ( ; i < modules_idx; i++ )
+    {
+        /* Free boot modules binary names */
+        efi_bs->FreePool(modules[i].name);
+    }
+
+    return modules_idx;
 }
 
 static void __init efi_arch_cpu(void)
@@ -562,8 +854,19 @@ static void __init efi_arch_cpu(void)
 
 static void __init efi_arch_blexit(void)
 {
+    unsigned int i = 0;
+
     if ( dtbfile.need_to_free )
         efi_bs->FreePages(dtbfile.addr, PFN_UP(dtbfile.size));
+    /* Free boot modules file names if any */
+    for ( ; i < modules_idx; i++ )
+    {
+        /* Free boot modules binary names */
+        efi_bs->FreePool(modules[i].name);
+        /* Free modules binaries */
+        efi_bs->FreePages(modules[i].addr,
+                          PFN_UP(modules[i].size));
+    }
     if ( memmap )
         efi_bs->FreePool(memmap);
 }
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 758f9d74d2..7879b93f93 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -166,6 +166,13 @@ static void __init PrintErr(const CHAR16 *s)
     StdErr->OutputString(StdErr, (CHAR16 *)s );
 }
 
+#ifndef CONFIG_HAS_DEVICE_TREE
+static inline int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
+{
+    return 0;
+}
+#endif
+
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -1136,6 +1143,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     bool base_video = false;
     const char *option_str;
     bool use_cfg_file;
+    int dt_modules_found;
+    EFI_FILE_HANDLE dir_handle;
 
     __set_bit(EFI_BOOT, &efi_flags);
     __set_bit(EFI_LOADER, &efi_flags);
@@ -1216,9 +1225,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
     efi_arch_relocate_image(0);
 
+    /* Get the file system interface. */
+    dir_handle = get_parent_handle(loaded_image, &file_name);
+
     if ( use_cfg_file )
     {
-        EFI_FILE_HANDLE dir_handle;
         UINTN depth, cols, rows, size;
 
         size = cols = rows = depth = 0;
@@ -1229,9 +1240,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
         gop = efi_get_gop();
 
-        /* Get the file system interface. */
-        dir_handle = get_parent_handle(loaded_image, &file_name);
-
         /* Read and parse the config file. */
         if ( read_section(loaded_image, L"config", &cfg, NULL) )
             PrintStr(L"Using builtin config file\r\n");
@@ -1285,14 +1293,12 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
             efi_bs->FreePool(name.w);
         }
 
-        if ( !name.s )
-            blexit(L"No Dom0 kernel image specified.");
-
         efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
 
-        option_str = split_string(name.s);
+        option_str = name.s ? split_string(name.s) : NULL;
 
-        if ( !read_section(loaded_image, L"kernel", &kernel, option_str) )
+        if ( !read_section(loaded_image, L"kernel", &kernel, option_str) &&
+             name.s )
         {
             read_file(dir_handle, s2w(&name), &kernel, option_str);
             efi_bs->FreePool(name.w);
@@ -1361,12 +1367,23 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
         cfg.addr = 0;
 
-        dir_handle->Close(dir_handle);
-
         if ( gop && !base_video )
             gop_mode = efi_find_gop_mode(gop, cols, rows, depth);
     }
 
+    /* Get the number of boot modules specified on the DT or an error (<0) */
+    dt_modules_found = efi_check_dt_boot(dir_handle);
+
+    dir_handle->Close(dir_handle);
+
+    if ( dt_modules_found < 0 )
+        /* efi_check_dt_boot throws some error */
+        blexit(L"Error processing boot modules on DT.");
+
+    /* Check if at least one of Dom0 or DomU(s) is specified */
+    if ( !dt_modules_found && !kernel.ptr )
+        blexit(L"No initial domain kernel specified.");
+
     efi_arch_edd();
 
     /* XXX Collect EDID info. */
-- 
2.17.1


