Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2237BD3E0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 08:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614144.955084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkAU-0005nO-A5; Mon, 09 Oct 2023 06:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614144.955084; Mon, 09 Oct 2023 06:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkAU-0005kN-3c; Mon, 09 Oct 2023 06:55:06 +0000
Received: by outflank-mailman (input) for mailman id 614144;
 Mon, 09 Oct 2023 06:55:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9Np=FX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qpkAS-0005gg-Kn
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 06:55:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c341d12e-6670-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 08:54:59 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 7FDD94EE0743;
 Mon,  9 Oct 2023 08:54:57 +0200 (CEST)
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
X-Inumbo-ID: c341d12e-6670-11ee-9b0d-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 1/7] xen: add declarations for variables where needed
Date: Mon,  9 Oct 2023 08:54:46 +0200
Message-Id: <002d58b1d15619a8c4b2ec6c2b5f20960ed0a428.1696833629.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696833629.git.nicola.vetrini@bugseng.com>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some variables with external linkage used in C code do not have
a visible declaration where they are defined. Providing such
declaration also resolves violations of MISRA C:2012 Rule 8.4.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- make xenpf_lock static on ARM
- moved the declaration of cr4_pv32_mask to the appropriate file
---
 xen/arch/arm/include/asm/setup.h  |  3 +++
 xen/arch/arm/include/asm/smp.h    |  3 +++
 xen/arch/arm/platform_hypercall.c |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c     |  6 +++---
 xen/arch/x86/include/asm/compat.h |  1 +
 xen/arch/x86/include/asm/setup.h  |  1 +
 xen/arch/x86/irq.c                |  2 +-
 xen/common/symbols.c              | 17 -----------------
 xen/include/xen/symbols.h         | 18 ++++++++++++++++++
 9 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index b8866c20f462..8806a74b216d 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -183,9 +183,12 @@ int map_range_to_domain(const struct dt_device_node *dev,
 extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];

 #ifdef CONFIG_ARM_64
+extern lpae_t boot_first[XEN_PT_LPAE_ENTRIES];
 extern lpae_t boot_first_id[XEN_PT_LPAE_ENTRIES];
 #endif
+extern lpae_t boot_second[XEN_PT_LPAE_ENTRIES];
 extern lpae_t boot_second_id[XEN_PT_LPAE_ENTRIES];
+extern lpae_t boot_third[XEN_PT_LPAE_ENTRIES * XEN_NR_ENTRIES(2)];
 extern lpae_t boot_third_id[XEN_PT_LPAE_ENTRIES];

 /* Find where Xen will be residing at runtime and return a PT entry */
diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index 4fabdf5310d8..28bf24a01d95 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -6,6 +6,9 @@
 #include <asm/current.h>
 #endif

+extern struct init_info init_data;
+extern unsigned long smp_up_cpu;
+
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);

diff --git a/xen/arch/arm/platform_hypercall.c b/xen/arch/arm/platform_hypercall.c
index 743687a30390..fde4bc3e5809 100644
--- a/xen/arch/arm/platform_hypercall.c
+++ b/xen/arch/arm/platform_hypercall.c
@@ -17,7 +17,7 @@
 #include <asm/current.h>
 #include <asm/event.h>

-DEFINE_SPINLOCK(xenpf_lock);
+static DEFINE_SPINLOCK(xenpf_lock);

 long do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
 {
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 6141b7eb9cf1..e855f958030d 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1682,13 +1682,13 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
     return ret;
 }

-int mcinfo_dumpped;
+static int mcinfo_dumped;
 static int cf_check x86_mcinfo_dump_panic(mctelem_cookie_t mctc)
 {
     struct mc_info *mcip = mctelem_dataptr(mctc);

     x86_mcinfo_dump(mcip);
-    mcinfo_dumpped++;
+    mcinfo_dumped++;

     return 0;
 }
@@ -1702,7 +1702,7 @@ static void mc_panic_dump(void)
     for_each_online_cpu(cpu)
         mctelem_process_deferred(cpu, x86_mcinfo_dump_panic,
                                  mctelem_has_deferred_lmce(cpu));
-    dprintk(XENLOG_ERR, "End dump mc_info, %x mcinfo dumped\n", mcinfo_dumpped);
+    dprintk(XENLOG_ERR, "End dump mc_info, %x mcinfo dumped\n", mcinfo_dumped);
 }

 void mc_panic(const char *s)
diff --git a/xen/arch/x86/include/asm/compat.h b/xen/arch/x86/include/asm/compat.h
index 818cad87db67..6f84f1571666 100644
--- a/xen/arch/x86/include/asm/compat.h
+++ b/xen/arch/x86/include/asm/compat.h
@@ -13,6 +13,7 @@ typedef unsigned long full_ptr_t;

 struct domain;
 #ifdef CONFIG_PV32
+extern unsigned long cr4_pv32_mask;
 int switch_compat(struct domain *);
 #else
 #include <xen/errno.h>
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index dfdd9e555149..6d22d3bd467a 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -13,6 +13,7 @@ extern char __2M_rwdata_start[], __2M_rwdata_end[];
 extern unsigned long xenheap_initial_phys_start;
 extern uint64_t boot_tsc_stamp;

+extern char cpu0_stack[STACK_SIZE];
 extern void *stack_start;

 void early_cpu_init(void);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 6abfd8162120..604dba94b052 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -43,7 +43,7 @@ int __read_mostly opt_irq_vector_map = OPT_IRQ_VECTOR_MAP_DEFAULT;
 static unsigned char __read_mostly irq_max_guests;
 integer_param("irq-max-guests", irq_max_guests);

-vmask_t global_used_vector_map;
+static vmask_t global_used_vector_map;

 struct irq_desc __read_mostly *irq_desc = NULL;

diff --git a/xen/common/symbols.c b/xen/common/symbols.c
index 691e61792506..7c3514c65f2e 100644
--- a/xen/common/symbols.c
+++ b/xen/common/symbols.c
@@ -21,23 +21,6 @@
 #include <xen/guest_access.h>
 #include <xen/errno.h>

-#ifdef SYMBOLS_ORIGIN
-extern const unsigned int symbols_offsets[];
-#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
-#else
-extern const unsigned long symbols_addresses[];
-#define symbols_address(n) symbols_addresses[n]
-#endif
-extern const unsigned int symbols_num_syms;
-extern const u8 symbols_names[];
-
-extern const struct symbol_offset symbols_sorted_offsets[];
-
-extern const u8 symbols_token_table[];
-extern const u16 symbols_token_index[];
-
-extern const unsigned int symbols_markers[];
-
 /* expand a compressed symbol data into the resulting uncompressed string,
    given the offset to where the symbol is in the compressed stream */
 static unsigned int symbols_expand_symbol(unsigned int off, char *result)
diff --git a/xen/include/xen/symbols.h b/xen/include/xen/symbols.h
index 20bbb28ef226..92540409265e 100644
--- a/xen/include/xen/symbols.h
+++ b/xen/include/xen/symbols.h
@@ -33,4 +33,22 @@ struct symbol_offset {
     uint32_t stream; /* .. in the compressed stream.*/
     uint32_t addr;   /* .. and in the fixed size address array. */
 };
+
+#ifdef SYMBOLS_ORIGIN
+extern const unsigned int symbols_offsets[];
+#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
+#else
+extern const unsigned long symbols_addresses[];
+#define symbols_address(n) symbols_addresses[n]
+#endif
+extern const unsigned int symbols_num_syms;
+extern const u8 symbols_names[];
+
+extern const struct symbol_offset symbols_sorted_offsets[];
+
+extern const u8 symbols_token_table[];
+extern const u16 symbols_token_index[];
+
+extern const unsigned int symbols_markers[];
+
 #endif /*_XEN_SYMBOLS_H*/
--
2.34.1

