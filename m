Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B454B5106
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271653.466281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb2Q-0003Sj-Ch; Mon, 14 Feb 2022 13:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271653.466281; Mon, 14 Feb 2022 13:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb2P-0003LQ-UR; Mon, 14 Feb 2022 13:05:05 +0000
Received: by outflank-mailman (input) for mailman id 271653;
 Mon, 14 Feb 2022 13:05:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2N-00023t-C1
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b699f3dd-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:05:00 +0100 (CET)
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
X-Inumbo-ID: b699f3dd-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Vmf+grYE8bKtbE+rcnkJIH/kZo6uatD1f3oilVOV1Mo=;
  b=dLJwZ9ACtIntA7zQuw9g97zLzcXOs8P1itm25ptg//lLPEE8Cru6NLZh
   MJA7ASW2pQ8L9gAt2dsAX3BLhKZwrv11JBSwneMPnqEbt9NSbooawiJBM
   iTQH4Yl6r+MHh12nvMW7XXJg39M0kAjrZQHkVC6Ifj1URpqCdPNz0mDLY
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: H91983OJySle/XwUPf9C7ClRnyUt40HvBbr2gDnpRR7yQONQvm90NE4gklDMhWGB0bZEeUOBBI
 P9PXFmw5C2dhAChTv2st6OJ0gAL9nt1zq6RRV/CJW/Oe+5pCgK+qEjj5EhuIM0vD2gOpbRNzzH
 bwoJ+gIIsAXKPwrHlYDjJAQBFbCt6KeVJO2fqeTINuU+WOLrgaCHMUGjGzchIYPKifidrH+VC5
 X+Go0idnmudpB804gW1e0E7fQwYTASSOoMgMNeED6UEYdbZCjFsW3zWQxBEFY26vCJ3z/bKudP
 waVTpe3ebicex2b7Oy7eFN5d
X-SBRS: 5.1
X-MesageID: 63592493
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Dmg5K6jnt8cAp/aTP24tSKe0X161eRcKZh0ujC45NGQN5FlHY01je
 htvD2uEb/uPZTP9KI0kPtnj908DsJTRm9NgGgo5/CA2Riwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx3YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1NiYK5cywFApbundkgbTR7KTlkBLxJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiFO
 ptDNWs0BPjGSxNUIAw1AY86p8brikL4XWRVsAvLjpNitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0ML/+D5XhqKQs2gfKgDVOVltGDjNXvMVVlGa+Z8xWE
 Wc4xhEMqJUPymGIdMHnZgy39SvsUgEnZ/JcFOgz6Qeow6XS4hqECmVscgOteODKp+dtG2V0i
 wbhc8fBQGU27ebLES71GqK88GvqURX5O1PucsPtoeEtx9D46L8+gRvUJjqIOP7k14alcd0cL
 t3jkcTfu1nxpZNRv0lY1Qqe695JmnQuZlRrjjg7pkr/smtEiHeNPuREE2Tz4/daN5q+RVKcp
 nUCkMX2xLlQUc3SxHzQHb1UR+vBCxO53Nr02wAHInXc3271py7LkX54vFmS23uFwu5bIGS0M
 Sc/SCta5YNJPWvCUEOES9nZNije9oC5TY6NfqmNNrJmO8EtHCfarHAGTRPBhAjFzRlz+ZzTz
 L/GKK5A+15BUv85pNd3Ls9AuYIWKtcWmz+CG8Cjl07/uVdcDVbMIYo43JK1RrhRxMu5TM/9q
 oY32xKix0oNXevgTDPQ9IJPf1kGIWJiXcL9qtBNd/7FKQ1jQTlzB/jUyLInWopkg6UKybuYo
 iDjAhdVmAjlmHnKCQSWcXQ/Ornhaoly8CAgNis2MFf2h3V6OdSz7L0SfoccdKU88LAx1uZ9S
 vQIIp3SAvlGRjnd1S4aaJ3x8N5reBix3FrcNCu5ejkvOZVnQlWRqNPjewLu8ggIDza26pRi8
 +HxiFuDTMNaFQp4DcvQZPa+9H+LvCAQyLBoQk/FAthPY0GwooJkHDP8060sKMYWJBSdmjbDj
 1SKAQ0VrPXmqpMu9IWbnriNqoqkHrcsHkdeGGWHv7+6OTODozimyI5EFu2JYSrcRCX//6D7P
 bdZyPT1MfsmmldWstUjT+Y3nPxmv9a/9aVHyglEHWnQawX5A7xtFXCKwM1Tu/Af3bReowa3B
 hqC99Qy1W9l4y85/Ir9/DYYU9k=
IronPort-HdrOrdr: A9a23:9wn6f69jvBhkISSWOupuk+DcI+orL9Y04lQ7vn2YSXRuE/Bw9v
 re5MjzuiWE6wr5NEtOpTnEAtjlfZq+z+8N3WByB8bBYOCOggLBR+sOgbcKgQeQfBEWntQts5
 uIGJIfNDSfNzZHZL7BkWyFL+o=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63592493"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 44/70] x86/pmu: CFI hardening
Date: Mon, 14 Feb 2022 12:51:01 +0000
Message-ID: <20220214125127.17985-45-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/cpu/vpmu_amd.c             | 16 ++++++++--------
 xen/arch/x86/cpu/vpmu_intel.c           | 16 ++++++++--------
 xen/arch/x86/oprofile/op_model_athlon.c | 16 ++++++++--------
 xen/arch/x86/oprofile/op_model_p4.c     | 14 +++++++-------
 xen/arch/x86/oprofile/op_model_ppro.c   | 26 ++++++++++++++------------
 5 files changed, 45 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 25ad4ecf48a4..5963ce90150a 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -186,7 +186,7 @@ static void amd_vpmu_unset_msr_bitmap(struct vcpu *v)
     msr_bitmap_off(vpmu);
 }
 
-static int amd_vpmu_do_interrupt(struct cpu_user_regs *regs)
+static int cf_check amd_vpmu_do_interrupt(struct cpu_user_regs *regs)
 {
     return 1;
 }
@@ -206,7 +206,7 @@ static inline void context_load(struct vcpu *v)
     }
 }
 
-static int amd_vpmu_load(struct vcpu *v, bool_t from_guest)
+static int cf_check amd_vpmu_load(struct vcpu *v, bool from_guest)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
     struct xen_pmu_amd_ctxt *ctxt;
@@ -280,7 +280,7 @@ static inline void context_save(struct vcpu *v)
         rdmsrl(counters[i], counter_regs[i]);
 }
 
-static int amd_vpmu_save(struct vcpu *v,  bool_t to_guest)
+static int cf_check amd_vpmu_save(struct vcpu *v,  bool to_guest)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
     unsigned int i;
@@ -348,7 +348,7 @@ static void context_update(unsigned int msr, u64 msr_content)
     }
 }
 
-static int amd_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
+static int cf_check amd_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
 {
     struct vcpu *v = current;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
@@ -404,7 +404,7 @@ static int amd_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
     return 0;
 }
 
-static int amd_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
+static int cf_check amd_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *v = current;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
@@ -422,7 +422,7 @@ static int amd_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
     return 0;
 }
 
-static void amd_vpmu_destroy(struct vcpu *v)
+static void cf_check amd_vpmu_destroy(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
@@ -440,7 +440,7 @@ static void amd_vpmu_destroy(struct vcpu *v)
 }
 
 /* VPMU part of the 'q' keyhandler */
-static void amd_vpmu_dump(const struct vcpu *v)
+static void cf_check amd_vpmu_dump(const struct vcpu *v)
 {
     const struct vpmu_struct *vpmu = vcpu_vpmu(v);
     const struct xen_pmu_amd_ctxt *ctxt = vpmu->context;
@@ -480,7 +480,7 @@ static void amd_vpmu_dump(const struct vcpu *v)
     }
 }
 
-static int svm_vpmu_initialise(struct vcpu *v)
+static int cf_check svm_vpmu_initialise(struct vcpu *v)
 {
     struct xen_pmu_amd_ctxt *ctxt;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 22dd4469d920..48b81ab6f018 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -288,7 +288,7 @@ static inline void __core2_vpmu_save(struct vcpu *v)
         rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, core2_vpmu_cxt->global_status);
 }
 
-static int core2_vpmu_save(struct vcpu *v, bool_t to_guest)
+static int cf_check core2_vpmu_save(struct vcpu *v, bool to_guest)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
@@ -407,7 +407,7 @@ static int core2_vpmu_verify(struct vcpu *v)
     return 0;
 }
 
-static int core2_vpmu_load(struct vcpu *v, bool_t from_guest)
+static int cf_check core2_vpmu_load(struct vcpu *v, bool from_guest)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
@@ -522,7 +522,7 @@ static int core2_vpmu_msr_common_check(u32 msr_index, int *type, int *index)
     return 1;
 }
 
-static int core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
+static int cf_check core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
 {
     int i, tmp;
     int type = -1, index = -1;
@@ -690,7 +690,7 @@ static int core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
     return 0;
 }
 
-static int core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
+static int cf_check core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
 {
     int type = -1, index = -1;
     struct vcpu *v = current;
@@ -730,7 +730,7 @@ static int core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
 }
 
 /* Dump vpmu info on console, called in the context of keyhandler 'q'. */
-static void core2_vpmu_dump(const struct vcpu *v)
+static void cf_check core2_vpmu_dump(const struct vcpu *v)
 {
     const struct vpmu_struct *vpmu = vcpu_vpmu(v);
     unsigned int i;
@@ -775,7 +775,7 @@ static void core2_vpmu_dump(const struct vcpu *v)
     }
 }
 
-static int core2_vpmu_do_interrupt(struct cpu_user_regs *regs)
+static int cf_check core2_vpmu_do_interrupt(struct cpu_user_regs *regs)
 {
     struct vcpu *v = current;
     u64 msr_content;
@@ -802,7 +802,7 @@ static int core2_vpmu_do_interrupt(struct cpu_user_regs *regs)
     return 1;
 }
 
-static void core2_vpmu_destroy(struct vcpu *v)
+static void cf_check core2_vpmu_destroy(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
@@ -816,7 +816,7 @@ static void core2_vpmu_destroy(struct vcpu *v)
     vpmu_clear(vpmu);
 }
 
-static int vmx_vpmu_initialise(struct vcpu *v)
+static int cf_check vmx_vpmu_initialise(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
     u64 msr_content;
diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/oprofile/op_model_athlon.c
index 2177f02946e2..7bc5853a6c23 100644
--- a/xen/arch/x86/oprofile/op_model_athlon.c
+++ b/xen/arch/x86/oprofile/op_model_athlon.c
@@ -164,7 +164,7 @@ static inline u64 op_amd_randomize_ibs_op(u64 val)
     return val;
 }
 
-static void athlon_fill_in_addresses(struct op_msrs * const msrs)
+static void cf_check athlon_fill_in_addresses(struct op_msrs * const msrs)
 {
 	msrs->counters[0].addr = MSR_K7_PERFCTR0;
 	msrs->counters[1].addr = MSR_K7_PERFCTR1;
@@ -177,7 +177,7 @@ static void athlon_fill_in_addresses(struct op_msrs * const msrs)
 	msrs->controls[3].addr = MSR_K7_EVNTSEL3;
 }
 
-static void fam15h_fill_in_addresses(struct op_msrs * const msrs)
+static void cf_check fam15h_fill_in_addresses(struct op_msrs * const msrs)
 {
 	msrs->counters[0].addr = MSR_AMD_FAM15H_PERFCTR0;
 	msrs->counters[1].addr = MSR_AMD_FAM15H_PERFCTR1;
@@ -194,7 +194,7 @@ static void fam15h_fill_in_addresses(struct op_msrs * const msrs)
 	msrs->controls[5].addr = MSR_AMD_FAM15H_EVNTSEL5;
 }
 
-static void athlon_setup_ctrs(struct op_msrs const * const msrs)
+static void cf_check athlon_setup_ctrs(struct op_msrs const * const msrs)
 {
 	uint64_t msr_content;
 	int i;
@@ -308,9 +308,9 @@ static inline int handle_ibs(int mode, struct cpu_user_regs const * const regs)
     return 1;
 }
 
-static int athlon_check_ctrs(unsigned int const cpu,
-			     struct op_msrs const * const msrs,
-			     struct cpu_user_regs const * const regs)
+static int cf_check athlon_check_ctrs(
+	unsigned int const cpu, struct op_msrs const * const msrs,
+	struct cpu_user_regs const * const regs)
 
 {
 	uint64_t msr_content;
@@ -386,7 +386,7 @@ static inline void start_ibs(void)
 	}
 }
  
-static void athlon_start(struct op_msrs const * const msrs)
+static void cf_check athlon_start(struct op_msrs const * const msrs)
 {
 	uint64_t msr_content;
 	int i;
@@ -415,7 +415,7 @@ static void stop_ibs(void)
 		wrmsrl(MSR_AMD64_IBSOPCTL, 0);
 }
 
-static void athlon_stop(struct op_msrs const * const msrs)
+static void cf_check athlon_stop(struct op_msrs const * const msrs)
 {
 	uint64_t msr_content;
 	int i;
diff --git a/xen/arch/x86/oprofile/op_model_p4.c b/xen/arch/x86/oprofile/op_model_p4.c
index b08ba53cbd39..d047258644db 100644
--- a/xen/arch/x86/oprofile/op_model_p4.c
+++ b/xen/arch/x86/oprofile/op_model_p4.c
@@ -390,7 +390,7 @@ static unsigned int get_stagger(void)
 static unsigned long reset_value[NUM_COUNTERS_NON_HT];
 
 
-static void p4_fill_in_addresses(struct op_msrs * const msrs)
+static void cf_check p4_fill_in_addresses(struct op_msrs * const msrs)
 {
 	unsigned int i;
 	unsigned int addr, stag;
@@ -530,7 +530,7 @@ static void pmc_setup_one_p4_counter(unsigned int ctr)
 }
 
 
-static void p4_setup_ctrs(struct op_msrs const * const msrs)
+static void cf_check p4_setup_ctrs(struct op_msrs const * const msrs)
 {
 	unsigned int i;
 	uint64_t msr_content;
@@ -609,9 +609,9 @@ static void p4_setup_ctrs(struct op_msrs const * const msrs)
 	}
 }
 
-static int p4_check_ctrs(unsigned int const cpu,
-                         struct op_msrs const * const msrs,
-                         struct cpu_user_regs const * const regs)
+static int cf_check p4_check_ctrs(
+	unsigned int const cpu, struct op_msrs const * const msrs,
+	struct cpu_user_regs const * const regs)
 {
 	unsigned long ctr, stag, real;
 	uint64_t msr_content;
@@ -665,7 +665,7 @@ static int p4_check_ctrs(unsigned int const cpu,
 }
 
 
-static void p4_start(struct op_msrs const * const msrs)
+static void cf_check p4_start(struct op_msrs const * const msrs)
 {
 	unsigned int stag;
 	uint64_t msr_content;
@@ -683,7 +683,7 @@ static void p4_start(struct op_msrs const * const msrs)
 }
 
 
-static void p4_stop(struct op_msrs const * const msrs)
+static void cf_check p4_stop(struct op_msrs const * const msrs)
 {
 	unsigned int stag;
 	uint64_t msr_content;
diff --git a/xen/arch/x86/oprofile/op_model_ppro.c b/xen/arch/x86/oprofile/op_model_ppro.c
index 72c504a10216..8d7e13ea8777 100644
--- a/xen/arch/x86/oprofile/op_model_ppro.c
+++ b/xen/arch/x86/oprofile/op_model_ppro.c
@@ -63,7 +63,7 @@ static int counter_width = 32;
 static unsigned long reset_value[OP_MAX_COUNTER];
 int ppro_has_global_ctrl = 0;
 
-static void ppro_fill_in_addresses(struct op_msrs * const msrs)
+static void cf_check ppro_fill_in_addresses(struct op_msrs * const msrs)
 {
 	int i;
 
@@ -74,7 +74,7 @@ static void ppro_fill_in_addresses(struct op_msrs * const msrs)
 }
 
 
-static void ppro_setup_ctrs(struct op_msrs const * const msrs)
+static void cf_check ppro_setup_ctrs(struct op_msrs const * const msrs)
 {
 	uint64_t msr_content;
 	int i;
@@ -128,9 +128,9 @@ static void ppro_setup_ctrs(struct op_msrs const * const msrs)
 	}
 }
 
-static int ppro_check_ctrs(unsigned int const cpu,
-                           struct op_msrs const * const msrs,
-                           struct cpu_user_regs const * const regs)
+static int cf_check ppro_check_ctrs(
+	unsigned int const cpu, struct op_msrs const * const msrs,
+	struct cpu_user_regs const * const regs)
 {
 	u64 val;
 	int i;
@@ -170,7 +170,7 @@ static int ppro_check_ctrs(unsigned int const cpu,
 }
 
 
-static void ppro_start(struct op_msrs const * const msrs)
+static void cf_check ppro_start(struct op_msrs const * const msrs)
 {
 	uint64_t msr_content;
 	int i;
@@ -190,7 +190,7 @@ static void ppro_start(struct op_msrs const * const msrs)
 }
 
 
-static void ppro_stop(struct op_msrs const * const msrs)
+static void cf_check ppro_stop(struct op_msrs const * const msrs)
 {
 	uint64_t msr_content;
 	int i;
@@ -206,7 +206,7 @@ static void ppro_stop(struct op_msrs const * const msrs)
         wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, 0x0ULL);
 }
 
-static int ppro_is_arch_pmu_msr(u64 msr_index, int *type, int *index)
+static int cf_check ppro_is_arch_pmu_msr(u64 msr_index, int *type, int *index)
 {
 	if ( (msr_index >= MSR_IA32_PERFCTR0) &&
             (msr_index < (MSR_IA32_PERFCTR0 + num_counters)) )
@@ -226,7 +226,7 @@ static int ppro_is_arch_pmu_msr(u64 msr_index, int *type, int *index)
         return 0;
 }
 
-static int ppro_allocate_msr(struct vcpu *v)
+static int cf_check ppro_allocate_msr(struct vcpu *v)
 {
 	struct vpmu_struct *vpmu = vcpu_vpmu(v);
 	struct arch_msr_pair *msr_content;
@@ -245,7 +245,7 @@ static int ppro_allocate_msr(struct vcpu *v)
 	return 0;
 }
 
-static void ppro_free_msr(struct vcpu *v)
+static void cf_check ppro_free_msr(struct vcpu *v)
 {
 	struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
@@ -255,7 +255,8 @@ static void ppro_free_msr(struct vcpu *v)
 	vpmu_reset(vpmu, VPMU_PASSIVE_DOMAIN_ALLOCATED);
 }
 
-static void ppro_load_msr(struct vcpu *v, int type, int index, u64 *msr_content)
+static void cf_check ppro_load_msr(
+	struct vcpu *v, int type, int index, u64 *msr_content)
 {
 	struct arch_msr_pair *msrs = vcpu_vpmu(v)->context;
 	switch ( type )
@@ -269,7 +270,8 @@ static void ppro_load_msr(struct vcpu *v, int type, int index, u64 *msr_content)
 	}
 }
 
-static void ppro_save_msr(struct vcpu *v, int type, int index, u64 msr_content)
+static void cf_check ppro_save_msr(
+	struct vcpu *v, int type, int index, u64 msr_content)
 {
 	struct arch_msr_pair *msrs = vcpu_vpmu(v)->context;
 
-- 
2.11.0


