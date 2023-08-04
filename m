Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC0A7702B2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 16:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577183.904135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRvXH-0000QU-7I; Fri, 04 Aug 2023 14:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577183.904135; Fri, 04 Aug 2023 14:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRvXH-0000Nr-3q; Fri, 04 Aug 2023 14:12:11 +0000
Received: by outflank-mailman (input) for mailman id 577183;
 Fri, 04 Aug 2023 14:12:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HS9z=DV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qRvXF-0000Nl-K6
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 14:12:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5139f66-32d0-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 16:12:07 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-35-203-138.retail.telecomitalia.it [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id CFB8D4EE0737;
 Fri,  4 Aug 2023 16:12:06 +0200 (CEST)
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
X-Inumbo-ID: e5139f66-32d0-11ee-8613-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH] x86: Address violations of MISRA C:2012 and drop bool_t
Date: Fri,  4 Aug 2023 16:11:59 +0200
Message-Id: <2cd78bd0d39b36fe73e87cd1011658a54c2c729d.1691158092.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters to address violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between object and function declarations thus
addressing violations of MISRA C:2012 Rule 8.3 ("All declarations of an
object or function shall use the same names and type qualifiers").
Replace the occurrences of bool_t with bool.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/cpu/common.c            |  6 +++---
 xen/arch/x86/include/asm/processor.h | 16 ++++++++--------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index cfcdaace12..5f29148416 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -26,11 +26,11 @@
 
 bool __read_mostly opt_dom0_cpuid_faulting = true;
 
-bool_t opt_arat = 1;
+bool opt_arat = 1;
 boolean_param("arat", opt_arat);
 
 /* pku: Flag to enable Memory Protection Keys (default on). */
-static bool_t opt_pku = 1;
+static bool opt_pku = 1;
 boolean_param("pku", opt_pku);
 
 unsigned int opt_cpuid_mask_ecx = ~0u;
@@ -208,7 +208,7 @@ void ctxt_switch_levelling(const struct vcpu *next)
 		alternative_vcall(ctxt_switch_masking, next);
 }
 
-bool_t opt_cpu_info;
+bool opt_cpu_info;
 boolean_param("cpuinfo", opt_cpu_info);
 
 int get_model_name(struct cpuinfo_x86 *c)
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 0989748be6..8d1909f73d 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -96,7 +96,7 @@ extern bool probe_cpuid_faulting(void);
 extern void ctxt_switch_levelling(const struct vcpu *next);
 extern void (*ctxt_switch_masking)(const struct vcpu *next);
 
-extern bool_t opt_cpu_info;
+extern bool opt_cpu_info;
 extern u32 trampoline_efer;
 extern u64 trampoline_misc_enable_off;
 
@@ -109,17 +109,17 @@ extern unsigned int vaddr_bits;
 
 extern const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[]);
 
-extern void identify_cpu(struct cpuinfo_x86 *);
-extern void setup_clear_cpu_cap(unsigned int);
-extern void setup_force_cpu_cap(unsigned int);
-extern bool is_forced_cpu_cap(unsigned int);
+extern void identify_cpu(struct cpuinfo_x86 *c);
+extern void setup_clear_cpu_cap(unsigned int cap);
+extern void setup_force_cpu_cap(unsigned int cap);
+extern bool is_forced_cpu_cap(unsigned int cap);
 extern void print_cpu_info(unsigned int cpu);
 extern void init_intel_cacheinfo(struct cpuinfo_x86 *c);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)
 
-unsigned int apicid_to_socket(unsigned int);
+unsigned int apicid_to_socket(unsigned int apicid);
 
 static inline int cpu_nr_siblings(unsigned int cpu)
 {
@@ -410,12 +410,12 @@ void show_registers(const struct cpu_user_regs *regs);
 #define dump_execution_state() \
     run_in_exception_handler(show_execution_state_nonconst)
 void show_page_walk(unsigned long addr);
-void noreturn fatal_trap(const struct cpu_user_regs *regs, bool_t show_remote);
+void noreturn fatal_trap(const struct cpu_user_regs *regs, bool show_remote);
 
 extern void mtrr_ap_init(void);
 extern void mtrr_bp_init(void);
 
-void mcheck_init(struct cpuinfo_x86 *c, bool_t bsp);
+void mcheck_init(struct cpuinfo_x86 *c, bool bsp);
 
 void do_nmi(const struct cpu_user_regs *regs);
 void do_machine_check(const struct cpu_user_regs *regs);
-- 
2.34.1


