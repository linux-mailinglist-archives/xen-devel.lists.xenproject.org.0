Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB5E354502
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 18:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105454.201881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRsB-0005XC-FU; Mon, 05 Apr 2021 16:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105454.201881; Mon, 05 Apr 2021 16:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRsB-0005WD-3Q; Mon, 05 Apr 2021 16:14:43 +0000
Received: by outflank-mailman (input) for mailman id 105454;
 Mon, 05 Apr 2021 16:14:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRs7-0005U7-PX
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 16:14:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRs6-0003es-Eb; Mon, 05 Apr 2021 16:14:38 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRba-00053b-4i; Mon, 05 Apr 2021 15:57:34 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=YW9oGuy3t6k1yVdYEyjW8Earg8hRQJeA+vjl3JWhoBo=; b=ajbC8nh8c9j/DoiYvRFOnAVoe
	O5EupfUULfhonKEdYyMbDWJW/YSBR5etebR61NKpX1W+xrnE1gbqV/zuTC1wffKx5CGN53f9JBpV4
	XKdytp7Mle026VbMKzLKx2n3NAbieCtndaGdNZIp3fN007vIWM4Vl7HxngnhmUC7On9v8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 14/14] tools/xentrace: Use const whenever we point to literal strings
Date: Mon,  5 Apr 2021 16:57:13 +0100
Message-Id: <20210405155713.29754-15-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

literal strings are not meant to be modified. So we should use const
char * rather than char * when we want to store a pointer to them.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xentrace/xenalyze.c | 71 ++++++++++++++++++++-------------------
 tools/xentrace/xenctx.c   |  4 +--
 2 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index b7f4e2bea83d..5de167031e01 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -356,7 +356,7 @@ void parse_symbol_file(char *fn) {
 char * find_symbol(unsigned long long addr) {
     struct symbol_struct * p=G.symbols;
     int i;
-    char * lastname="ZERO";
+    const char * lastname="ZERO";
     unsigned long long offset=addr;
     static char name[144];
 
@@ -495,7 +495,7 @@ struct {
 
 #define HVM_VMX_EXIT_REASON_MAX (EXIT_REASON_XSETBV+1)
 
-char * hvm_vmx_exit_reason_name[HVM_VMX_EXIT_REASON_MAX] = {
+const char * hvm_vmx_exit_reason_name[HVM_VMX_EXIT_REASON_MAX] = {
     [EXIT_REASON_EXCEPTION_NMI]="EXCEPTION_NMI",
     [EXIT_REASON_EXTERNAL_INTERRUPT]="EXTERNAL_INTERRUPT",
     [EXIT_REASON_TRIPLE_FAULT]="TRIPLE_FAULT",
@@ -698,7 +698,7 @@ enum VMEXIT_EXITCODE
 };
 
 #define HVM_SVM_EXIT_REASON_MAX 1025
-char * hvm_svm_exit_reason_name[HVM_SVM_EXIT_REASON_MAX] = {
+const char * hvm_svm_exit_reason_name[HVM_SVM_EXIT_REASON_MAX] = {
     /* 0-15 */
     "VMEXIT_CR0_READ",
     "VMEXIT_CR1_READ",
@@ -875,7 +875,7 @@ char * hvm_svm_exit_reason_name[HVM_SVM_EXIT_REASON_MAX] = {
 #define EXTERNAL_INTERRUPT_MAX 256
 
 /* Stringify numbers */
-char * hvm_extint_vector_name[EXTERNAL_INTERRUPT_MAX] = {
+const char * hvm_extint_vector_name[EXTERNAL_INTERRUPT_MAX] = {
     [SPURIOUS_APIC_VECTOR] = "SPURIOS_APIC",
     [ERROR_APIC_VECTOR] =    "ERROR_APIC",
     [INVALIDATE_TLB_VECTOR]= "INVALIDATE_TLB",
@@ -887,7 +887,7 @@ char * hvm_extint_vector_name[EXTERNAL_INTERRUPT_MAX] = {
 
 #define HVM_TRAP_MAX 20
 
-char * hvm_trap_name[HVM_TRAP_MAX] = {
+const char * hvm_trap_name[HVM_TRAP_MAX] = {
     [0] =  "Divide",
     [1] =  "RESERVED",
     [2] =  "NMI",
@@ -947,7 +947,7 @@ enum {
     HVM_EVENT_VLAPIC,
     HVM_EVENT_HANDLER_MAX
 };
-char * hvm_event_handler_name[HVM_EVENT_HANDLER_MAX] = {
+const char * hvm_event_handler_name[HVM_EVENT_HANDLER_MAX] = {
     "(no handler)",
     "pf_xen",
     "pf_inject",
@@ -1001,7 +1001,7 @@ enum {
     GUEST_INTERRUPT_CASE_MAX,
 };
 
-char *guest_interrupt_case_name[] = {
+const char *guest_interrupt_case_name[] = {
     [GUEST_INTERRUPT_CASE_WAKE_TO_HALT_ALONE]="wake to halt alone",
     /* This interrupt woke, maybe another interrupt before halt */
     [GUEST_INTERRUPT_CASE_WAKE_TO_HALT_ANY]  ="wake to halt any  ",
@@ -1009,7 +1009,7 @@ char *guest_interrupt_case_name[] = {
     [GUEST_INTERRUPT_CASE_INTERRUPT_TO_HALT] ="intr to halt      ",
 };
 
-char *hvm_vol_name[HVM_VOL_MAX] = {
+const char *hvm_vol_name[HVM_VOL_MAX] = {
     [HVM_VOL_VMENTRY]="vmentry",
     [HVM_VOL_VMEXIT] ="vmexit",
     [HVM_VOL_HANDLER]="handler",
@@ -1056,7 +1056,7 @@ enum {
     HYPERCALL_MAX
 };
 
-char *hypercall_name[HYPERCALL_MAX] = {
+const char *hypercall_name[HYPERCALL_MAX] = {
     [HYPERCALL_set_trap_table]="set_trap_table",
     [HYPERCALL_mmu_update]="mmu_update",
     [HYPERCALL_set_gdt]="set_gdt",
@@ -1114,7 +1114,7 @@ enum {
     PF_XEN_EMUL_MAX,
 };
 
-char * pf_xen_emul_name[PF_XEN_EMUL_MAX] = {
+const char * pf_xen_emul_name[PF_XEN_EMUL_MAX] = {
     [PF_XEN_EMUL_LVL_0]="non-linmap",
     [PF_XEN_EMUL_LVL_1]="linmap l1",
     [PF_XEN_EMUL_LVL_2]="linmap l2",
@@ -1140,7 +1140,7 @@ enum {
     PF_XEN_NON_EMUL_MAX,
 };
 
-char * pf_xen_non_emul_name[PF_XEN_NON_EMUL_MAX] = {
+const char * pf_xen_non_emul_name[PF_XEN_NON_EMUL_MAX] = {
     [PF_XEN_NON_EMUL_VA_USER]="va user",
     [PF_XEN_NON_EMUL_VA_KERNEL]="va kernel",
     [PF_XEN_NON_EMUL_EIP_USER]="eip user",
@@ -1160,7 +1160,7 @@ enum {
     PF_XEN_FIXUP_MAX,
 };
 
-char * pf_xen_fixup_name[PF_XEN_FIXUP_MAX] = {
+const char * pf_xen_fixup_name[PF_XEN_FIXUP_MAX] = {
     [PF_XEN_FIXUP_PREALLOC_UNPIN] = "unpin",
     [PF_XEN_FIXUP_PREALLOC_UNHOOK] = "unhook",
     [PF_XEN_FIXUP_UNSYNC] = "unsync",
@@ -1195,7 +1195,7 @@ enum {
 #define SHADOW_RESYNC_FULL    14
 #define SHADOW_RESYNC_ONLY    15
 
-char * pf_xen_name[PF_XEN_MAX] = {
+const char * pf_xen_name[PF_XEN_MAX] = {
     [PF_XEN_NOT_SHADOW]="propagate",
     [PF_XEN_FAST_PROPAGATE]="fast propagate",
     [PF_XEN_FAST_MMIO]="fast mmio",
@@ -1304,7 +1304,7 @@ struct hvm_data {
     struct vcpu_data *v; /* up-pointer */
 
     /* SVM / VMX compatibility. FIXME - should be global */
-    char ** exit_reason_name;
+    const char ** exit_reason_name;
     int exit_reason_max;
     struct hvm_summary_handler_node *exit_reason_summary_handler_list[HVM_EXIT_REASON_MAX];
 
@@ -1408,7 +1408,7 @@ enum {
     HVM_SHORT_SUMMARY_MAX,
 };
 
-char *hvm_short_summary_name[HVM_SHORT_SUMMARY_MAX] = {
+const char *hvm_short_summary_name[HVM_SHORT_SUMMARY_MAX] = {
     [HVM_SHORT_SUMMARY_EMULATE]  ="emulate",
     [HVM_SHORT_SUMMARY_UNSYNC]   ="unsync",
     [HVM_SHORT_SUMMARY_FIXUP]    ="fixup",
@@ -1478,7 +1478,7 @@ enum {
     PV_MAX
 };
 
-char *pv_name[PV_MAX] = {
+const char *pv_name[PV_MAX] = {
     [PV_HYPERCALL]="hypercall",
     [PV_TRAP]="trap",
     [PV_PAGE_FAULT]="page_fault",
@@ -1527,7 +1527,7 @@ int runstate_graph[RUNSTATE_MAX] =
     [RUNSTATE_INIT]=-2,
 };
 
-char * runstate_name[RUNSTATE_MAX]={
+const char * runstate_name[RUNSTATE_MAX]={
     [RUNSTATE_RUNNING]= "running",
     [RUNSTATE_RUNNABLE]="runnable",
     [RUNSTATE_BLOCKED]= "blocked", /* to be blocked */
@@ -1545,7 +1545,7 @@ enum {
     RUNNABLE_STATE_MAX
 };
 
-char * runnable_state_name[RUNNABLE_STATE_MAX]={
+const char * runnable_state_name[RUNNABLE_STATE_MAX]={
     [RUNNABLE_STATE_INVALID]="invalid", /* Should never show up */
     [RUNNABLE_STATE_WAKE]="wake",
     [RUNNABLE_STATE_PREEMPT]="preempt",
@@ -1565,7 +1565,7 @@ enum {
     MEM_MAX
 };
 
-char *mem_name[MEM_MAX] = {
+const char *mem_name[MEM_MAX] = {
     [MEM_PAGE_GRANT_MAP]         = "grant-map",
     [MEM_PAGE_GRANT_UNMAP]       = "grant-unmap",
     [MEM_PAGE_GRANT_TRANSFER]    = "grant-transfer",
@@ -1681,7 +1681,7 @@ enum {
     DOMAIN_RUNSTATE_MAX
 };
 
-char * domain_runstate_name[] = {
+const char * domain_runstate_name[] = {
     [DOMAIN_RUNSTATE_BLOCKED]="blocked",
     [DOMAIN_RUNSTATE_PARTIAL_RUN]="partial run",
     [DOMAIN_RUNSTATE_FULL_RUN]="full run",
@@ -1698,7 +1698,7 @@ enum {
     POD_RECLAIM_CONTEXT_MAX
 };
 
-char * pod_reclaim_context_name[] = {
+const char * pod_reclaim_context_name[] = {
     [POD_RECLAIM_CONTEXT_UNKNOWN]="unknown",
     [POD_RECLAIM_CONTEXT_FAULT]="fault",
     [POD_RECLAIM_CONTEXT_BALLOON]="balloon",
@@ -1756,7 +1756,7 @@ enum {
     TOPLEVEL_MAX=TOPLEVEL_HW+1,
 };
 
-char * toplevel_name[TOPLEVEL_MAX] = {
+const char * toplevel_name[TOPLEVEL_MAX] = {
     [TOPLEVEL_GEN]="gen",
     [TOPLEVEL_SCHED]="sched",
     [TOPLEVEL_DOM0OP]="dom0op",
@@ -2263,7 +2263,7 @@ static inline void clear_interval_cycles(struct interval_element *e) {
     e->instructions = 0;
 }
 
-static inline void print_cpu_affinity(struct cycle_summary *s, char *p) {
+static inline void print_cpu_affinity(struct cycle_summary *s, const char *p) {
     if(s->count) {
         long long avg;
 
@@ -2326,7 +2326,8 @@ static inline void print_cycle_percent_summary(struct cycle_summary *s,
     }
 }
 
-static inline void print_cycle_summary(struct cycle_summary *s, char *p) {
+static inline void print_cycle_summary(struct cycle_summary *s,
+                                       const char *p) {
     if(s->count) {
         long long avg;
 
@@ -2938,7 +2939,7 @@ void hvm_update_short_summary(struct hvm_data *h, int element) {
 }
 
 void hvm_short_summary(struct hvm_short_summary_struct *hss,
-                       tsc_t total, char *prefix) {
+                       tsc_t total, const char *prefix) {
     char desc[80];
     int i;
 
@@ -3352,7 +3353,7 @@ void hvm_pf_xen_process(struct record_info *ri, struct hvm_data *h) {
          fprintf(warn, "%s: Strange, postprocess already set\n", __func__);
 }
 
-char * hvm_vlapic_icr_dest_shorthand_name[4] = {
+const char * hvm_vlapic_icr_dest_shorthand_name[4] = {
     "dest_field", "self", "all-inc", "all-exc"
 };
 
@@ -3800,7 +3801,7 @@ void update_io_address(struct io_address ** list, unsigned int pa, int dir,
     update_cycles(&p->summary[dir], arc_cycles);
 }
 
-void hvm_io_address_summary(struct io_address *list, char * s) {
+void hvm_io_address_summary(struct io_address *list, const char * s) {
     if(!list)
         return;
 
@@ -4484,7 +4485,7 @@ void hvm_intr_window_process(struct record_info *ri, struct hvm_data *h)
         int32_t intr;
     } *r = (typeof(r))h->d;
 
-    char *intsrc_name[] = {
+    const char *intsrc_name[] = {
         "none",
         "pic",
         "lapic",
@@ -4687,14 +4688,15 @@ void hvm_generic_postprocess(struct hvm_data *h)
     }
 }
 
-void hvm_generic_dump(struct record_info *ri, char * prefix)
+void hvm_generic_dump(struct record_info *ri, const char * prefix)
 {
     struct {
         unsigned vcpu:16, domain:16;
         unsigned d[4];
     } *cr = (typeof(cr))ri->d;
 
-    char *evt_string, evt_number[256];
+    const char *evt_string;
+    char evt_number[256];
     int i, evt, is_64 = 0;
 
     evt = ri->event - TRC_HVM_HANDLER;
@@ -6042,10 +6044,11 @@ void shadow_propagate_process(struct record_info *ri, struct hvm_data *h)
         fprintf(warn, "%s: Strange, postprocess already set\n", __func__);
 }
 
-void shadow_fault_generic_dump(unsigned int event, uint32_t *d, char *prefix,
-                         char * dump_header)
+void shadow_fault_generic_dump(unsigned int event, uint32_t *d,
+                               const char *prefix, const char * dump_header)
 {
-    char *evt_string, evt_number[10];
+    const char *evt_string;
+    char evt_number[10];
     union shadow_event sevt = { .event = event };
     int i;
 
@@ -8643,7 +8646,7 @@ void dump_generic(FILE * f, struct record_info *ri)
     fprintf(f, " ]\n");
 }
 
-void dump_raw(char * s, struct record_info *ri)
+void dump_raw(const char * s, struct record_info *ri)
 {
     int i;
 
diff --git a/tools/xentrace/xenctx.c b/tools/xentrace/xenctx.c
index 2fa864f86723..972f473dbf02 100644
--- a/tools/xentrace/xenctx.c
+++ b/tools/xentrace/xenctx.c
@@ -302,7 +302,7 @@ static void read_symbol_table(const char *symtab)
 
 #if defined(__i386__) || defined(__x86_64__)
 #define CR0_PE  0x1
-char *flag_values[22][2] =
+const char *flag_values[22][2] =
 {/*  clear,     set,       bit# */
     { NULL,     "c"    }, // 0        Carry
     { NULL,     NULL   }, // 1
@@ -334,7 +334,7 @@ static void print_flags(uint64_t flags)
 
     printf("\nflags: %08" PRIx64, flags);
     for (i = 21; i >= 0; i--) {
-        char *s = flag_values[i][(flags >> i) & 1];
+        const char *s = flag_values[i][(flags >> i) & 1];
         if (s != NULL)
             printf(" %s", s);
     }
-- 
2.17.1


