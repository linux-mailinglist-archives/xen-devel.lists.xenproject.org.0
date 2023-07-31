Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E377697BD
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573061.897410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQT3p-0000vf-7l; Mon, 31 Jul 2023 13:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573061.897410; Mon, 31 Jul 2023 13:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQT3p-0000su-4B; Mon, 31 Jul 2023 13:35:45 +0000
Received: by outflank-mailman (input) for mailman id 573061;
 Mon, 31 Jul 2023 13:35:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQT3n-0008Hl-C2
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:35:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 247e0a1a-2fa7-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 15:35:41 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 9E1844EE0743;
 Mon, 31 Jul 2023 15:35:40 +0200 (CEST)
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
X-Inumbo-ID: 247e0a1a-2fa7-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH 4/4] arm/efi: address MISRA C:2012 Rule 5.3
Date: Mon, 31 Jul 2023 15:35:02 +0200
Message-Id: <c153e4fbe19510ba1244024e7a4b8897c86afd3a.1690810346.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690810346.git.nicola.vetrini@bugseng.com>
References: <cover.1690810346.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

The parameter 'fdt' in static function within this file is removed,
as they served no purpose and shadowed the homonymous variable.

For the same reason the local variable in 'lookup_fdt_config_table'
is dropped and the function is now consequently static void.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/efi/efi-boot.h | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 6126a71400..ec328885a3 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -52,7 +52,7 @@ static struct file __initdata dtbfile;
 static void __initdata *fdt;
 static void __initdata *memmap;
 
-static int __init setup_chosen_node(void *fdt, int *addr_cells, int *size_cells)
+static int __init setup_chosen_node(int *addr_cells, int *size_cells)
 {
     int node;
     const struct fdt_property *prop;
@@ -114,7 +114,7 @@ static int __init setup_chosen_node(void *fdt, int *addr_cells, int *size_cells)
  * Set a single 'reg' property taking into account the
  * configured addr and size cell sizes.
  */
-static int __init fdt_set_reg(void *fdt, int node, int addr_cells,
+static int __init fdt_set_reg(int node, int addr_cells,
                               int size_cells, uint64_t addr, uint64_t len)
 {
     __be32 val[4]; /* At most 2 64 bit values to be stored */
@@ -138,13 +138,16 @@ static int __init fdt_set_reg(void *fdt, int node, int addr_cells,
     return(fdt_setprop(fdt, node, "reg", val, sizeof(*cellp) * (cellp - val)));
 }
 
-static void __init *lookup_fdt_config_table(EFI_SYSTEM_TABLE *sys_table)
+/*
+ * Set the variable 'fdt' if a matching guid is found.
+ */
+static void __init lookup_fdt_config_table(EFI_SYSTEM_TABLE *sys_table)
 {
     static const EFI_GUID __initconst fdt_guid = DEVICE_TREE_GUID;
     EFI_CONFIGURATION_TABLE *tables;
-    void *fdt = NULL;
     int i;
 
+    fdt = NULL;
     tables = sys_table->ConfigurationTable;
     for ( i = 0; i < sys_table->NumberOfTableEntries; i++ )
     {
@@ -154,7 +157,6 @@ static void __init *lookup_fdt_config_table(EFI_SYSTEM_TABLE *sys_table)
             break;
         }
     }
-    return fdt;
 }
 
 static bool __init meminfo_add_bank(struct meminfo *mem,
@@ -228,7 +230,6 @@ static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DESCRIPTOR *
  * and memory map information.
  */
 EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
-                                            void *fdt,
                                             EFI_MEMORY_DESCRIPTOR *memory_map,
                                             UINTN map_size,
                                             UINTN desc_size,
@@ -383,7 +384,7 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
     if ( EFI_ERROR(status) )
         blexit(L"EFI memory map processing failed");
 
-    status = fdt_add_uefi_nodes(SystemTable, fdt, map, map_size, desc_size,
+    status = fdt_add_uefi_nodes(SystemTable, map, map_size, desc_size,
                                 desc_ver);
     if ( EFI_ERROR(status) )
         PrintErrMesg(L"Updating FDT failed", status);
@@ -542,7 +543,7 @@ static void __init efi_arch_handle_module(const struct file *file,
 
     if ( file == &dtbfile )
         return;
-    chosen = setup_chosen_node(fdt, &addr_len, &size_len);
+    chosen = setup_chosen_node(&addr_len, &size_len);
     if ( chosen < 0 )
         blexit(L"Unable to setup chosen node");
 
@@ -557,7 +558,7 @@ static void __init efi_arch_handle_module(const struct file *file,
         if ( fdt_setprop(fdt, node, "compatible", ramdisk_compat,
                          sizeof(ramdisk_compat)) < 0 )
             blexit(L"Unable to set compatible property.");
-        if ( fdt_set_reg(fdt, node, addr_len, size_len, ramdisk.addr,
+        if ( fdt_set_reg(node, addr_len, size_len, ramdisk.addr,
                     ramdisk.size) < 0 )
             blexit(L"Unable to set reg property.");
     }
@@ -572,7 +573,7 @@ static void __init efi_arch_handle_module(const struct file *file,
         if ( fdt_setprop(fdt, node, "compatible", xsm_compat,
                          sizeof(xsm_compat)) < 0 )
             blexit(L"Unable to set compatible property.");
-        if ( fdt_set_reg(fdt, node, addr_len, size_len, xsm.addr,
+        if ( fdt_set_reg(node, addr_len, size_len, xsm.addr,
                     xsm.size) < 0 )
             blexit(L"Unable to set reg property.");
     }
@@ -589,7 +590,7 @@ static void __init efi_arch_handle_module(const struct file *file,
             blexit(L"Unable to set compatible property.");
         if ( options && fdt_setprop_string(fdt, node, "bootargs", options) < 0 )
             blexit(L"Unable to set bootargs property.");
-        if ( fdt_set_reg(fdt, node, addr_len, size_len, kernel.addr,
+        if ( fdt_set_reg(node, addr_len, size_len, kernel.addr,
                          kernel.size) < 0 )
             blexit(L"Unable to set reg property.");
     }
@@ -757,7 +758,7 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
         return ERROR_RENAME_MODULE_NAME;
     }
 
-    if ( fdt_set_reg(fdt, module_node_offset, reg_addr_cells, reg_size_cells,
+    if ( fdt_set_reg(module_node_offset, reg_addr_cells, reg_size_cells,
                      file->addr, file->size) < 0 )
     {
         PrintMessage(L"Unable to set module reg property.");
@@ -862,7 +863,7 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
     EFI_FILE_HANDLE dir_handle = NULL;
 
     /* Check for the chosen node in the current DTB */
-    chosen = setup_chosen_node(fdt, &addr_len, &size_len);
+    chosen = setup_chosen_node(&addr_len, &size_len);
     if ( chosen < 0 )
     {
         PrintMessage(L"Unable to setup chosen node");
@@ -951,7 +952,7 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
      * node to decide whether to skip the UEFI Xen configuration file or not.
      */
 
-    fdt = lookup_fdt_config_table(SystemTable);
+    lookup_fdt_config_table(SystemTable);
     dtbfile.ptr = fdt;
     dtbfile.need_to_free = false; /* Config table memory can't be freed. */
 
-- 
2.34.1


