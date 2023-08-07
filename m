Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CE0771D0C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577905.905014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwSh-0005x2-1D; Mon, 07 Aug 2023 09:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577905.905014; Mon, 07 Aug 2023 09:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwSg-0005uG-UK; Mon, 07 Aug 2023 09:23:38 +0000
Received: by outflank-mailman (input) for mailman id 577905;
 Mon, 07 Aug 2023 09:23:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FiBK=DY=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qSwSf-0005tu-TC
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:23:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15c44cfd-3504-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 11:23:35 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-35-203-138.retail.telecomitalia.it [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id 18FE24EE0737;
 Mon,  7 Aug 2023 11:23:35 +0200 (CEST)
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
X-Inumbo-ID: 15c44cfd-3504-11ee-8613-37d641c3527e
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
Subject: [XEN PATCH] x86/mce: Address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Mon,  7 Aug 2023 11:23:28 +0200
Message-Id: <1506ba7675065ee0cc3c84b05c2f8f963cbf64e6.1691399401.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters to address violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between parameter types used in function
declarations and the ones used in the corresponding function
definitions, thus addressing violations of MISRA C:2012 Rule 8.3
("All declarations of an object or function shall use the same names
and type qualifiers").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/cpu/mcheck/mce.c |  2 +-
 xen/arch/x86/cpu/mcheck/mce.h | 28 ++++++++++++++++------------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index c2173cfc78..57e1eb221e 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -44,7 +44,7 @@ DEFINE_PER_CPU_READ_MOSTLY(struct mca_banks *, no_cmci_banks);
 DEFINE_PER_CPU_READ_MOSTLY(struct mca_banks *, mce_clear_banks);
 
 static void intpose_init(void);
-static void mcinfo_clear(struct mc_info *);
+static void mcinfo_clear(struct mc_info *mi);
 struct mca_banks *mca_allbanks;
 
 #define SEG_PL(segsel)   ((segsel) & 0x3)
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index d40cee531a..b6fc9c3617 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -58,12 +58,14 @@ bool mce_available(const struct cpuinfo_x86 *c);
 unsigned int mce_firstbank(struct cpuinfo_x86 *c);
 /* Helper functions used for collecting error telemetry */
 void noreturn mc_panic(const char *s);
-void x86_mc_get_cpu_info(unsigned, uint32_t *, uint16_t *, uint16_t *,
-                         uint32_t *, uint32_t *, uint32_t *, uint32_t *);
+void x86_mc_get_cpu_info(unsigned cpu, uint32_t *chipid, uint16_t *coreid,
+                         uint16_t *threadid, uint32_t *apicid,
+                         unsigned *ncores, unsigned *ncores_active,
+                         unsigned *nthreads);
 
 /* Register a handler for machine check exceptions. */
 typedef void (*x86_mce_vector_t)(const struct cpu_user_regs *regs);
-extern void x86_mce_vector_register(x86_mce_vector_t);
+extern void x86_mce_vector_register(x86_mce_vector_t hdlr);
 
 /*
  * Common generic MCE handler that implementations may nominate
@@ -73,12 +75,12 @@ void cf_check mcheck_cmn_handler(const struct cpu_user_regs *regs);
 
 /* Register a handler for judging whether mce is recoverable. */
 typedef bool (*mce_recoverable_t)(uint64_t status);
-extern void mce_recoverable_register(mce_recoverable_t);
+extern void mce_recoverable_register(mce_recoverable_t cbfunc);
 
 /* Read an MSR, checking for an interposed value first */
-extern struct intpose_ent *intpose_lookup(unsigned int, uint64_t,
-    uint64_t *);
-extern bool intpose_inval(unsigned int, uint64_t);
+extern struct intpose_ent *intpose_lookup(unsigned int cpu_nr, uint64_t msr,
+    uint64_t *valp);
+extern bool intpose_inval(unsigned int cpu_nr, uint64_t msr);
 
 static inline uint64_t mca_rdmsr(unsigned int msr)
 {
@@ -128,10 +130,12 @@ DECLARE_PER_CPU(struct mca_banks *, mce_clear_banks);
 extern bool cmci_support;
 extern bool is_mc_panic;
 extern bool mce_broadcast;
-extern void mcheck_mca_clearbanks(struct mca_banks *);
+extern void mcheck_mca_clearbanks(struct mca_banks *bankmask);
 
-extern mctelem_cookie_t mcheck_mca_logout(enum mca_source, struct mca_banks *,
-    struct mca_summary *, struct mca_banks *);
+extern mctelem_cookie_t mcheck_mca_logout(enum mca_source who,
+                                          struct mca_banks *bankmask,
+                                          struct mca_summary *sp,
+                                          struct mca_banks *clear_bank);
 
 /*
  * Register callbacks to be made during bank telemetry logout.
@@ -142,7 +146,7 @@ extern mctelem_cookie_t mcheck_mca_logout(enum mca_source, struct mca_banks *,
 
 /* Register a handler for judging whether the bank need to be cleared */
 typedef bool (*mce_need_clearbank_t)(enum mca_source who, u64 status);
-extern void mce_need_clearbank_register(mce_need_clearbank_t);
+extern void mce_need_clearbank_register(mce_need_clearbank_t cbfunc);
 
 /*
  * Register a callback to collect additional information (typically non-
@@ -155,7 +159,7 @@ extern void mce_need_clearbank_register(mce_need_clearbank_t);
  */
 typedef struct mcinfo_extended *(*x86_mce_callback_t)
     (struct mc_info *, uint16_t, uint64_t);
-extern void x86_mce_callback_register(x86_mce_callback_t);
+extern void x86_mce_callback_register(x86_mce_callback_t cbfunc);
 
 void *x86_mcinfo_reserve(struct mc_info *mi,
                          unsigned int size, unsigned int type);
-- 
2.34.1


