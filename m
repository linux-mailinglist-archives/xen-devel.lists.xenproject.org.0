Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253E7CFB59
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 15:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619340.964250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTG2-0008Ak-Ns; Thu, 19 Oct 2023 13:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619340.964250; Thu, 19 Oct 2023 13:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTG2-00085p-KC; Thu, 19 Oct 2023 13:40:14 +0000
Received: by outflank-mailman (input) for mailman id 619340;
 Thu, 19 Oct 2023 13:40:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQIi=GB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtTG1-0007zm-Rt
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 13:40:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0769bdd0-6e85-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 15:40:13 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 8DE5C4EE0740;
 Thu, 19 Oct 2023 15:40:11 +0200 (CEST)
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
X-Inumbo-ID: 0769bdd0-6e85-11ee-98d5-6d05b1d4d9a1
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
Subject: [XEN PATCH][for-4.19 v3 1/8] xen: add declarations for variables where needed
Date: Thu, 19 Oct 2023 15:39:59 +0200
Message-Id: <4d419cbffc84e0f9934794d105705ac64094a54a.1697722648.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697722648.git.nicola.vetrini@bugseng.com>
References: <cover.1697722648.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some variables with external linkage used in C code do not have
a visible declaration where they are defined. Providing such
declaration also resolves violations of MISRA C:2012 Rule 8.4.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- make xenpf_lock static on ARM
Changes in v3:
- moved back code from symbols.h to symbols.c
- dropped two declarations, now deviated
---
 xen/arch/arm/include/asm/setup.h  | 3 +++
 xen/arch/arm/include/asm/smp.h    | 3 +++
 xen/arch/arm/platform_hypercall.c | 2 +-
 xen/arch/x86/cpu/mcheck/mce.c     | 6 +++---
 xen/arch/x86/irq.c                | 2 +-
 xen/include/xen/symbols.h         | 1 +
 6 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 98af6f55f5a0..2a2d6114f2eb 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -184,9 +184,12 @@ int map_range_to_domain(const struct dt_device_node *dev,
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
 
diff --git a/xen/include/xen/symbols.h b/xen/include/xen/symbols.h
index 20bbb28ef226..1b2863663aa0 100644
--- a/xen/include/xen/symbols.h
+++ b/xen/include/xen/symbols.h
@@ -33,4 +33,5 @@ struct symbol_offset {
     uint32_t stream; /* .. in the compressed stream.*/
     uint32_t addr;   /* .. and in the fixed size address array. */
 };
+
 #endif /*_XEN_SYMBOLS_H*/
-- 
2.34.1


