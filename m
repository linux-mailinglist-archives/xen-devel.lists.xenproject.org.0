Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A20C668B8B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476633.739088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjr-0007P8-K1; Fri, 13 Jan 2023 05:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476633.739088; Fri, 13 Jan 2023 05:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjq-0007Gx-O7; Fri, 13 Jan 2023 05:36:26 +0000
Received: by outflank-mailman (input) for mailman id 476633;
 Fri, 13 Jan 2023 05:36:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCen-0005sJ-3P
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7d730806-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:31:12 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95A01FEC;
 Thu, 12 Jan 2023 21:31:53 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 90BF33F587;
 Thu, 12 Jan 2023 21:31:07 -0800 (PST)
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
X-Inumbo-ID: 7d730806-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 30/40] xen/mpu: disable VMAP sub-system for MPU systems
Date: Fri, 13 Jan 2023 13:29:03 +0800
Message-Id: <20230113052914.3845596-31-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VMAP in MMU system, is used to remap a range of normal memory
or device memory to another virtual address with new attributes
for specific purpose, like ALTERNATIVE feature. Since there is
no virtual address translation support in MPU system, we can
not support VMAP in MPU system.

So in this patch, we disable VMAP for MPU systems, and some
features depending on VMAP also need to be disabled at the same
time, Like ALTERNATIVE, CPU ERRATA.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Kconfig                   |  3 +-
 xen/arch/arm/Makefile                  |  2 +-
 xen/arch/arm/include/asm/alternative.h | 15 +++++
 xen/arch/arm/include/asm/cpuerrata.h   | 12 ++++
 xen/arch/arm/setup.c                   |  7 +++
 xen/arch/x86/Kconfig                   |  1 +
 xen/common/Kconfig                     |  3 +
 xen/common/Makefile                    |  2 +-
 xen/include/xen/vmap.h                 | 81 ++++++++++++++++++++++++--
 9 files changed, 119 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index c6b6b612d1..9230c8b885 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -11,12 +11,13 @@ config ARM_64
 
 config ARM
 	def_bool y
-	select HAS_ALTERNATIVE
+	select HAS_ALTERNATIVE if !ARM_V8R
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_PDX
 	select HAS_PMAP
 	select IOMMU_FORCE_PT_SHARE
+	select HAS_VMAP if !ARM_V8R
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 23dfbc3333..c949661590 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_HAS_VPCI) += vpci.o
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
 obj-y += bootfdt.init.o
-obj-y += cpuerrata.o
+obj-$(CONFIG_HAS_ALTERNATIVE) += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
 obj-y += device.o
diff --git a/xen/arch/arm/include/asm/alternative.h b/xen/arch/arm/include/asm/alternative.h
index 1eb4b60fbb..bc23d1d34f 100644
--- a/xen/arch/arm/include/asm/alternative.h
+++ b/xen/arch/arm/include/asm/alternative.h
@@ -8,6 +8,7 @@
 
 #ifndef __ASSEMBLY__
 
+#include <xen/errno.h>
 #include <xen/types.h>
 #include <xen/stringify.h>
 
@@ -28,8 +29,22 @@ typedef void (*alternative_cb_t)(const struct alt_instr *alt,
 				 const uint32_t *origptr, uint32_t *updptr,
 				 int nr_inst);
 
+#ifdef CONFIG_HAS_ALTERNATIVE
 void apply_alternatives_all(void);
 int apply_alternatives(const struct alt_instr *start, const struct alt_instr *end);
+#else
+static inline void apply_alternatives_all(void)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline int apply_alternatives(const struct alt_instr *start,
+                                     const struct alt_instr *end)
+{
+    ASSERT_UNREACHABLE();
+    return -EINVAL;
+}
+#endif /* !CONFIG_HAS_ALTERNATIVE */
 
 #define ALTINSTR_ENTRY(feature, cb)					      \
 	" .word 661b - .\n"				/* label           */ \
diff --git a/xen/arch/arm/include/asm/cpuerrata.h b/xen/arch/arm/include/asm/cpuerrata.h
index 8d7e7b9375..5d97f33763 100644
--- a/xen/arch/arm/include/asm/cpuerrata.h
+++ b/xen/arch/arm/include/asm/cpuerrata.h
@@ -4,8 +4,20 @@
 #include <asm/cpufeature.h>
 #include <asm/alternative.h>
 
+#ifdef CONFIG_HAS_ALTERNATIVE
 void check_local_cpu_errata(void);
 void enable_errata_workarounds(void);
+#else
+static inline void check_local_cpu_errata(void)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void enable_errata_workarounds(void)
+{
+    ASSERT_UNREACHABLE();
+}
+#endif /* !CONFIG_HAS_ALTERNATIVE */
 
 #define CHECK_WORKAROUND_HELPER(erratum, feature, arch)         \
 static inline bool check_workaround_##erratum(void)             \
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 3ebf9e9a5c..0eac33e68c 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -721,7 +721,9 @@ void __init start_xen(unsigned long boot_phys_offset,
      */
     system_state = SYS_STATE_boot;
 
+#ifdef CONFIG_HAS_VMAP
     vm_init();
+#endif
 
     if ( acpi_disabled )
     {
@@ -753,11 +755,13 @@ void __init start_xen(unsigned long boot_phys_offset,
     nr_cpu_ids = smp_get_max_cpus();
     printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", nr_cpu_ids);
 
+#ifdef CONFIG_HAS_ALTERNATIVE
     /*
      * Some errata relies on SMCCC version which is detected by psci_init()
      * (called from smp_init_cpus()).
      */
     check_local_cpu_errata();
+#endif
 
     check_local_cpu_features();
 
@@ -824,12 +828,15 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     do_initcalls();
 
+
+#ifdef CONFIG_HAS_ALTERNATIVE
     /*
      * It needs to be called after do_initcalls to be able to use
      * stop_machine (tasklets initialized via an initcall).
      */
     apply_alternatives_all();
     enable_errata_workarounds();
+#endif
     enable_cpu_features();
 
     /* Create initial domain 0. */
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6a7825f4ba..7f072cc603 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -28,6 +28,7 @@ config X86
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
+	select HAS_VMAP
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index f1ea3199c8..ba16366a4b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -61,6 +61,9 @@ config HAS_SCHED_GRANULARITY
 config HAS_UBSAN
 	bool
 
+config HAS_VMAP
+	bool
+
 config MEM_ACCESS_ALWAYS_ON
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 9a3a12b12d..9d991effb2 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -50,7 +50,7 @@ obj-$(CONFIG_TRACEBUFFER) += trace.o
 obj-y += version.o
 obj-y += virtual_region.o
 obj-y += vm_event.o
-obj-y += vmap.o
+obj-$(CONFIG_HAS_VMAP) += vmap.o
 obj-y += vsprintf.o
 obj-y += wait.o
 obj-bin-y += warning.init.o
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index b0f7632e89..2e3ae0ca6a 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -1,15 +1,17 @@
-#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
+#if !defined(__XEN_VMAP_H__) && (defined(VMAP_VIRT_START) || !defined(CONFIG_HAS_VMAP))
 #define __XEN_VMAP_H__
 
-#include <xen/mm-frame.h>
-#include <xen/page-size.h>
-
 enum vmap_region {
     VMAP_DEFAULT,
     VMAP_XEN,
     VMAP_REGION_NR,
 };
 
+#ifdef CONFIG_HAS_VMAP
+
+#include <xen/mm-frame.h>
+#include <xen/page-size.h>
+
 void vm_init_type(enum vmap_region type, void *start, void *end);
 
 void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
@@ -38,4 +40,75 @@ static inline void vm_init(void)
     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
 }
 
+#else /* !CONFIG_HAS_VMAP */
+
+static inline void vm_init_type(enum vmap_region type, void *start, void *end)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void *__vmap(const mfn_t *mfn, unsigned int granularity,
+                           unsigned int nr, unsigned int align,
+                           unsigned int flags, enum vmap_region type)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+
+static inline void *vmap(const mfn_t *mfn, unsigned int nr)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+
+static inline void vunmap(const void *va)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void *vmalloc(size_t size)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+
+static inline void *vmalloc_xen(size_t size)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+
+static inline void *vzalloc(size_t size)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+
+static inline void vfree(void *va)
+{
+    ASSERT_UNREACHABLE();
+}
+
+void __iomem *ioremap(paddr_t, size_t)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+
+static inline void iounmap(void __iomem *va)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void *arch_vmap_virt_end(void)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+
+static inline void vm_init(void)
+{
+    ASSERT_UNREACHABLE();
+}
+#endif  /* !CONFIG_HAS_VMAP */
 #endif /* __XEN_VMAP_H__ */
-- 
2.25.1


