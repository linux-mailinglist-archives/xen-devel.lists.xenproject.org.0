Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBEC75CB90
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 17:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567605.886881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMry5-0002Zq-85; Fri, 21 Jul 2023 15:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567605.886881; Fri, 21 Jul 2023 15:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMry5-0002YC-5N; Fri, 21 Jul 2023 15:22:57 +0000
Received: by outflank-mailman (input) for mailman id 567605;
 Fri, 21 Jul 2023 15:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIrH=DH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qMry4-0002Y6-Bp
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 15:22:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76ffece1-27da-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 17:22:55 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.162.18.33])
 by support.bugseng.com (Postfix) with ESMTPSA id 01B564EE0C89;
 Fri, 21 Jul 2023 17:22:52 +0200 (CEST)
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
X-Inumbo-ID: 76ffece1-27da-11ee-b23a-6b7b168915f2
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH] xen/arm: mechanical renaming to address MISRA C:2012 Rule 5.3
Date: Fri, 21 Jul 2023 17:22:40 +0200
Message-Id: <164303a2b19336a0e5f934a995d2a9c104035fab.1689952914.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

The function parameters renamed in this patch are hiding a variable defined
in an enclosing scope or a function identifier.

The following renames have been made:
- s/guest_mode/guest_mode_on/ to distinguish from function 'guest_mode'
- s/struct module_name/struct module_info to distinguish from the homonymous
parameters, since the structure contains more information than just the name.
- s/file_name/file_info in 'xen/arch/arm/efi/efi-boot.h' for consistency with
the previous renaming.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/efi/efi-boot.h | 22 +++++++++++-----------
 xen/arch/arm/traps.c        | 28 ++++++++++++++--------------
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 3daa63a40d..6126a71400 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -13,7 +13,7 @@ typedef struct {
     unsigned int name_len;
     EFI_PHYSICAL_ADDRESS addr;
     UINTN size;
-} module_name;
+} module_info;
 
 /*
  * Binaries will be translated into bootmodules, the maximum number for them is
@@ -21,7 +21,7 @@ typedef struct {
  */
 #define MAX_UEFI_MODULES (MAX_MODULES - 2)
 static struct file __initdata module_binary;
-static module_name __initdata modules[MAX_UEFI_MODULES];
+static module_info __initdata modules[MAX_UEFI_MODULES];
 static unsigned int __initdata modules_available = MAX_UEFI_MODULES;
 static unsigned int __initdata modules_idx;
 
@@ -622,7 +622,7 @@ static int __init get_module_file_index(const char *name,
 
     for ( i = 0; i < modules_idx; i++ )
     {
-        module_name *mod = &modules[i];
+        module_info *mod = &modules[i];
         if ( (mod->name_len == name_len) &&
              (strncmp(mod->name, name, name_len) == 0) )
         {
@@ -648,7 +648,7 @@ static int __init allocate_module_file(const EFI_LOADED_IMAGE *loaded_image,
                                        const char *name,
                                        unsigned int name_len)
 {
-    module_name *file_name;
+    module_info *file_info;
     CHAR16 *fname;
     union string module_name;
     int ret;
@@ -668,18 +668,18 @@ static int __init allocate_module_file(const EFI_LOADED_IMAGE *loaded_image,
     ret = modules_idx;
 
     /* Save at this index the name of this binary */
-    file_name = &modules[ret];
+    file_info = &modules[ret];
 
     if ( efi_bs->AllocatePool(EfiLoaderData, (name_len + 1) * sizeof(char),
-                              (void**)&file_name->name) != EFI_SUCCESS )
+                              (void**)&file_info->name) != EFI_SUCCESS )
     {
         PrintMessage(L"Error allocating memory for module binary name");
         return ERROR_ALLOC_MODULE_NAME;
     }
 
     /* Save name and length of the binary in the data structure */
-    strlcpy(file_name->name, name, name_len + 1);
-    file_name->name_len = name_len;
+    strlcpy(file_info->name, name, name_len + 1);
+    file_info->name_len = name_len;
 
     /* Get the file system interface. */
     if ( !*dir_handle )
@@ -689,8 +689,8 @@ static int __init allocate_module_file(const EFI_LOADED_IMAGE *loaded_image,
     read_file(*dir_handle, s2w(&module_name), &module_binary, NULL);
 
     /* Save address and size */
-    file_name->addr = module_binary.addr;
-    file_name->size = module_binary.size;
+    file_info->addr = module_binary.addr;
+    file_info->size = module_binary.size;
 
     /* s2w(...) allocates some memory, free it */
     efi_bs->FreePool(module_name.w);
@@ -716,7 +716,7 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
     const void *uefi_name_prop;
     char mod_string[24]; /* Placeholder for module@ + a 64-bit number + \0 */
     int uefi_name_len, file_idx, module_compat;
-    module_name *file;
+    module_info *file;
 
     /* Check if the node is a multiboot,module otherwise return */
     module_compat = fdt_node_check_compatible(fdt, module_node_offset,
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index d1ef787638..05860f063c 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -745,7 +745,7 @@ static const char *mode_string(register_t cpsr)
 
 static void show_registers_32(const struct cpu_user_regs *regs,
                               const struct reg_ctxt *ctxt,
-                              bool guest_mode,
+                              bool guest_mode_on,
                               const struct vcpu *v)
 {
 
@@ -754,7 +754,7 @@ static void show_registers_32(const struct cpu_user_regs *regs,
     printk("PC:     %08"PRIx32"\n", regs->pc32);
 #else
     printk("PC:     %08"PRIx32, regs->pc);
-    if ( !guest_mode )
+    if ( !guest_mode_on )
         printk(" %pS", _p(regs->pc));
     printk("\n");
 #endif
@@ -773,7 +773,7 @@ static void show_registers_32(const struct cpu_user_regs *regs,
 #endif
            regs->r12);
 
-    if ( guest_mode )
+    if ( guest_mode_on )
     {
         printk("USR: SP: %08"PRIx32" LR: %"PRIregister"\n",
                regs->sp_usr, regs->lr);
@@ -798,7 +798,7 @@ static void show_registers_32(const struct cpu_user_regs *regs,
 #endif
     printk("\n");
 
-    if ( guest_mode )
+    if ( guest_mode_on )
     {
         printk("     SCTLR: %"PRIregister"\n", ctxt->sctlr_el1);
         printk("       TCR: %"PRIregister"\n", ctxt->tcr_el1);
@@ -822,18 +822,18 @@ static void show_registers_32(const struct cpu_user_regs *regs,
 #ifdef CONFIG_ARM_64
 static void show_registers_64(const struct cpu_user_regs *regs,
                               const struct reg_ctxt *ctxt,
-                              bool guest_mode,
+                              bool guest_mode_on,
                               const struct vcpu *v)
 {
 
     BUG_ON( (regs->cpsr & PSR_MODE_BIT) );
 
     printk("PC:     %016"PRIx64, regs->pc);
-    if ( !guest_mode )
+    if ( !guest_mode_on )
         printk(" %pS", _p(regs->pc));
     printk("\n");
     printk("LR:     %016"PRIx64"\n", regs->lr);
-    if ( guest_mode )
+    if ( guest_mode_on )
     {
         printk("SP_EL0: %016"PRIx64"\n", regs->sp_el0);
         printk("SP_EL1: %016"PRIx64"\n", regs->sp_el1);
@@ -866,7 +866,7 @@ static void show_registers_64(const struct cpu_user_regs *regs,
            regs->x27, regs->x28, regs->fp);
     printk("\n");
 
-    if ( guest_mode )
+    if ( guest_mode_on )
     {
         printk("   ELR_EL1: %016"PRIx64"\n", regs->elr_el1);
         printk("   ESR_EL1: %08"PRIx32"\n", ctxt->esr_el1);
@@ -883,28 +883,28 @@ static void show_registers_64(const struct cpu_user_regs *regs,
 
 static void _show_registers(const struct cpu_user_regs *regs,
                             const struct reg_ctxt *ctxt,
-                            bool guest_mode,
+                            bool guest_mode_on,
                             const struct vcpu *v)
 {
     print_xen_info();
 
     printk("CPU:    %d\n", smp_processor_id());
 
-    if ( guest_mode )
+    if ( guest_mode_on )
     {
         if ( regs_mode_is_32bit(regs) )
-            show_registers_32(regs, ctxt, guest_mode, v);
+            show_registers_32(regs, ctxt, guest_mode_on, v);
 #ifdef CONFIG_ARM_64
         else
-            show_registers_64(regs, ctxt, guest_mode, v);
+            show_registers_64(regs, ctxt, guest_mode_on, v);
 #endif
     }
     else
     {
 #ifdef CONFIG_ARM_64
-        show_registers_64(regs, ctxt, guest_mode, v);
+        show_registers_64(regs, ctxt, guest_mode_on, v);
 #else
-        show_registers_32(regs, ctxt, guest_mode, v);
+        show_registers_32(regs, ctxt, guest_mode_on, v);
 #endif
     }
     printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
-- 
2.34.1


