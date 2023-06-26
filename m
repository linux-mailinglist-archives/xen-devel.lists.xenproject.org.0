Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C49973D685
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555077.866806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5Z-0000Oz-QZ; Mon, 26 Jun 2023 03:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555077.866806; Mon, 26 Jun 2023 03:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5Y-0008Kr-Ki; Mon, 26 Jun 2023 03:40:28 +0000
Received: by outflank-mailman (input) for mailman id 555077;
 Mon, 26 Jun 2023 03:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1A-0007ej-3s
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8e148bdf-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:35:54 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 180BB1FB;
 Sun, 25 Jun 2023 20:36:38 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 20FCE3F64C;
 Sun, 25 Jun 2023 20:35:49 -0700 (PDT)
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
X-Inumbo-ID: 8e148bdf-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 15/52] xen: make VMAP only support in MMU system
Date: Mon, 26 Jun 2023 11:34:06 +0800
Message-Id: <20230626033443.2943270-16-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VMAP is widely used in ALTERNATIVE feature, CPUERRATA feature, Grant
Table feature, LIVEPATCH feature etc, to remap a range of memory with new
memory attributes. Since this is highly dependent on virtual address
translation, we choose to fold VMAP in MMU system.

In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it only
support in MMU system on ARM architecture. And we make features like
ALTERNATIVE, CPUERRATA, LIVEPATCH, Grant Table, etc, now depend on VMAP.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v2:
- new commit
---
v3:
- make LIVEPATCH/ALTERNATIVE/CPUERRATA/Grant Table/LIVEPATCH depend on HAS_VMAP
- function call should be wrapped in context, then we could remove inline stubs
---
 xen/arch/arm/Kconfig   |  3 ++-
 xen/arch/arm/Makefile  |  2 +-
 xen/arch/arm/setup.c   |  7 +++++++
 xen/arch/arm/smpboot.c |  2 ++
 xen/arch/x86/Kconfig   |  1 +
 xen/arch/x86/setup.c   |  2 ++
 xen/common/Kconfig     |  5 +++++
 xen/common/Makefile    |  2 +-
 xen/common/vmap.c      |  7 +++++++
 xen/include/xen/vmap.h | 11 ++++-------
 10 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 22b28b8ba2..a88500fb50 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -11,7 +11,7 @@ config ARM_64
 
 config ARM
 	def_bool y
-	select HAS_ALTERNATIVE
+	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_PDX
@@ -63,6 +63,7 @@ config HAS_MMU
 	bool "Memory Management Unit support in a VMSA system"
 	default y
 	select HAS_PMAP
+	select HAS_VMAP
 	help
 	  In a VMSA system, a Memory Management Unit (MMU) provides fine-grained control of
 	  a memory system through a set of virtual to physical address mappings and associated memory
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index c1babdba6a..d01528cac6 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_HAS_VPCI) += vpci.o
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
 obj-y += bootfdt.init.o
-obj-y += cpuerrata.o
+obj-$(CONFIG_HAS_VMAP) += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
 obj-y += device.o
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 50259552a0..34923d9984 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -812,7 +812,9 @@ void __init start_xen(unsigned long boot_phys_offset,
      */
     system_state = SYS_STATE_boot;
 
+#ifdef CONFIG_HAS_VMAP
     vm_init();
+#endif
 
     if ( acpi_disabled )
     {
@@ -844,11 +846,13 @@ void __init start_xen(unsigned long boot_phys_offset,
     nr_cpu_ids = smp_get_max_cpus();
     printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", nr_cpu_ids);
 
+#ifdef CONFIG_HAS_VMAP
     /*
      * Some errata relies on SMCCC version which is detected by psci_init()
      * (called from smp_init_cpus()).
      */
     check_local_cpu_errata();
+#endif
 
     check_local_cpu_features();
 
@@ -915,12 +919,15 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     do_initcalls();
 
+
+#ifdef CONFIG_HAS_VMAP
     /*
      * It needs to be called after do_initcalls to be able to use
      * stop_machine (tasklets initialized via an initcall).
      */
     apply_alternatives_all();
     enable_errata_workarounds();
+#endif
     enable_cpu_features();
 
     /* Create initial domain 0. */
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 8bcdbea66c..0796e534ec 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -388,7 +388,9 @@ void start_secondary(void)
 
     local_abort_enable();
 
+#ifdef CONFIG_HAS_VMAP
     check_local_cpu_errata();
+#endif
     check_local_cpu_features();
 
     printk(XENLOG_DEBUG "CPU %u booted.\n", smp_processor_id());
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 406445a358..033cc2332e 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -27,6 +27,7 @@ config X86
 	select HAS_PDX
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
+	select HAS_VMAP
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 74e3915a4d..9f06879225 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1750,12 +1750,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         end_boot_allocator();
 
     system_state = SYS_STATE_boot;
+#ifdef CONFIG_HAS_VMAP
     /*
      * No calls involving ACPI code should go between the setting of
      * SYS_STATE_boot and vm_init() (or else acpi_os_{,un}map_memory()
      * will break).
      */
     vm_init();
+#endif
 
     bsp_stack = cpu_alloc_stack(0);
     if ( !bsp_stack )
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 3d2123a783..2c29e89b75 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -15,6 +15,7 @@ config CORE_PARKING
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
 	default y
+	depends on HAS_VMAP
 	---help---
 	  Grant table provides a generic mechanism to memory sharing
 	  between domains. This shared memory interface underpins the
@@ -65,6 +66,9 @@ config HAS_SCHED_GRANULARITY
 config HAS_UBSAN
 	bool
 
+config HAS_VMAP
+	bool
+
 config MEM_ACCESS_ALWAYS_ON
 	bool
 
@@ -367,6 +371,7 @@ config LIVEPATCH
 	bool "Live patching support"
 	default X86
 	depends on "$(XEN_HAS_BUILD_ID)" = "y"
+	depends on HAS_VMAP
 	select CC_SPLIT_SECTIONS
 	---help---
 	  Allows a running Xen hypervisor to be dynamically patched using
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 46049eac35..4803282d62 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -51,7 +51,7 @@ obj-$(CONFIG_TRACEBUFFER) += trace.o
 obj-y += version.o
 obj-y += virtual_region.o
 obj-y += vm_event.o
-obj-y += vmap.o
+obj-$(CONFIG_HAS_VMAP) += vmap.o
 obj-y += vsprintf.o
 obj-y += wait.o
 obj-bin-y += warning.init.o
diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 4fd6b3067e..51e13e17ed 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -331,4 +331,11 @@ void vfree(void *va)
     while ( (pg = page_list_remove_head(&pg_list)) != NULL )
         free_domheap_page(pg);
 }
+
+void iounmap(void __iomem *va)
+{
+    unsigned long addr = (unsigned long)(void __force *)va;
+
+    vunmap((void *)(addr & PAGE_MASK));
+}
 #endif
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index b0f7632e89..d7ef4df452 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -1,4 +1,4 @@
-#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
+#if !defined(__XEN_VMAP_H__) && (defined(VMAP_VIRT_START) || !defined(CONFIG_HAS_VMAP))
 #define __XEN_VMAP_H__
 
 #include <xen/mm-frame.h>
@@ -25,17 +25,14 @@ void vfree(void *va);
 
 void __iomem *ioremap(paddr_t, size_t);
 
-static inline void iounmap(void __iomem *va)
-{
-    unsigned long addr = (unsigned long)(void __force *)va;
-
-    vunmap((void *)(addr & PAGE_MASK));
-}
+void iounmap(void __iomem *va);
 
 void *arch_vmap_virt_end(void);
 static inline void vm_init(void)
 {
+#if defined(VMAP_VIRT_START)
     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
+#endif
 }
 
 #endif /* __XEN_VMAP_H__ */
-- 
2.25.1


