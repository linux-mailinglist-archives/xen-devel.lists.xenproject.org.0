Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4157ABFF2
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 12:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607141.945440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzgi-0001XV-Fu; Sat, 23 Sep 2023 10:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607141.945440; Sat, 23 Sep 2023 10:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzgi-0001NB-4m; Sat, 23 Sep 2023 10:16:36 +0000
Received: by outflank-mailman (input) for mailman id 607141;
 Sat, 23 Sep 2023 10:16:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xNi6=FH=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qjzcP-0000Pn-8T
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 10:12:09 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1931479-59f9-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 12:11:59 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:11:48 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:11:48 -0700
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
X-Inumbo-ID: a1931479-59f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463919; x=1726999919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WI4PNmnQNqWbUIJ+xrhdRHV/OU0QAbzmppTdHG3/yfg=;
  b=NOWAVrzzNpyAquCMjCO/gHfVLEcokgaMzfmEMWm5EZXdnC9ilJtSM1iL
   JtbIWUmXyFPCp6O5WorKMyhfBxzJZdt0mELJxJWCUlWorLsyAcC2D3zn9
   n2tMM9H7Z4dbQJzbwx0p/JnClWVsdnVKc+DxJ9YDntbEFUaFZuOIG3nXq
   Nk6MlB4xkEK63cu33FRcdv1+i/5IwLw8iGwn/OoyO+11isy/tvf4o++/2
   Zx9+VzAPAAdMnTnwAvP60e48VlSwEGUNBAHddtN00wjrIhmy6ihxA5H3m
   vfSEs3iZYwTsIdST3/mvVIqvYkepvX362J0vzle/CAK2/20puHd4u/Dqu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447492375"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447492375"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813388190"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813388190"
From: Xin Li <xin3.li@intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	peterz@infradead.org,
	jgross@suse.com,
	ravi.v.shankar@intel.com,
	mhiramat@kernel.org,
	andrew.cooper3@citrix.com,
	jiangshanlai@gmail.com,
	nik.borisov@suse.com
Subject: [PATCH v11 25/37] x86/fred: Add a debug fault entry stub for FRED
Date: Sat, 23 Sep 2023 02:42:00 -0700
Message-Id: <20230923094212.26520-26-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923094212.26520-1-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

When occurred on different ring level, i.e., from user or kernel context,
#DB needs to be handled on different stack: User #DB on current task
stack, while kernel #DB on a dedicated stack. This is exactly how FRED
event delivery invokes an exception handler: ring 3 event on level 0
stack, i.e., current task stack; ring 0 event on the #DB dedicated stack
specified in the IA32_FRED_STKLVLS MSR. So unlike IDT, the FRED debug
exception entry stub doesn't do stack switch.

On a FRED system, the debug trap status information (DR6) is passed on
the stack, to avoid the problem of transient state. Furthermore, FRED
transitions avoid a lot of ugly corner cases the handling of which can,
and should be, skipped.

The FRED debug trap status information saved on the stack differs from
DR6 in both stickiness and polarity; it is exactly in the format which
debug_read_clear_dr6() returns for the IDT entry points.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v9:
* Disable #DB to avoid endless recursion and stack overflow when a
  watchpoint/breakpoint is set in the code path which is executed by
  #DB handler (Thomas Gleixner).

Changes since v1:
* call irqentry_nmi_{enter,exit}() in both IDT and FRED debug fault kernel
  handler (Peter Zijlstra).
---
 arch/x86/kernel/traps.c | 43 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index c876f1d36a81..848c85208a57 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -50,6 +50,7 @@
 #include <asm/ftrace.h>
 #include <asm/traps.h>
 #include <asm/desc.h>
+#include <asm/fred.h>
 #include <asm/fpu/api.h>
 #include <asm/cpu.h>
 #include <asm/cpu_entry_area.h>
@@ -934,8 +935,7 @@ static bool notify_debug(struct pt_regs *regs, unsigned long *dr6)
 	return false;
 }
 
-static __always_inline void exc_debug_kernel(struct pt_regs *regs,
-					     unsigned long dr6)
+static noinstr void exc_debug_kernel(struct pt_regs *regs, unsigned long dr6)
 {
 	/*
 	 * Disable breakpoints during exception handling; recursive exceptions
@@ -947,6 +947,11 @@ static __always_inline void exc_debug_kernel(struct pt_regs *regs,
 	 *
 	 * Entry text is excluded for HW_BP_X and cpu_entry_area, which
 	 * includes the entry stack is excluded for everything.
+	 *
+	 * For FRED, nested #DB should just work fine. But when a watchpoint or
+	 * breakpoint is set in the code path which is executed by #DB handler,
+	 * it results in an endless recursion and stack overflow. Thus we stay
+	 * with the IDT approach, i.e., save DR7 and disable #DB.
 	 */
 	unsigned long dr7 = local_db_save();
 	irqentry_state_t irq_state = irqentry_nmi_enter(regs);
@@ -976,7 +981,8 @@ static __always_inline void exc_debug_kernel(struct pt_regs *regs,
 	 * Catch SYSENTER with TF set and clear DR_STEP. If this hit a
 	 * watchpoint at the same time then that will still be handled.
 	 */
-	if ((dr6 & DR_STEP) && is_sysenter_singlestep(regs))
+	if (!cpu_feature_enabled(X86_FEATURE_FRED) &&
+	    (dr6 & DR_STEP) && is_sysenter_singlestep(regs))
 		dr6 &= ~DR_STEP;
 
 	/*
@@ -1008,8 +1014,7 @@ static __always_inline void exc_debug_kernel(struct pt_regs *regs,
 	local_db_restore(dr7);
 }
 
-static __always_inline void exc_debug_user(struct pt_regs *regs,
-					   unsigned long dr6)
+static noinstr void exc_debug_user(struct pt_regs *regs, unsigned long dr6)
 {
 	bool icebp;
 
@@ -1093,6 +1098,34 @@ DEFINE_IDTENTRY_DEBUG_USER(exc_debug)
 {
 	exc_debug_user(regs, debug_read_clear_dr6());
 }
+
+#ifdef CONFIG_X86_FRED
+/*
+ * When occurred on different ring level, i.e., from user or kernel
+ * context, #DB needs to be handled on different stack: User #DB on
+ * current task stack, while kernel #DB on a dedicated stack.
+ *
+ * This is exactly how FRED event delivery invokes an exception
+ * handler: ring 3 event on level 0 stack, i.e., current task stack;
+ * ring 0 event on the #DB dedicated stack specified in the
+ * IA32_FRED_STKLVLS MSR. So unlike IDT, the FRED debug exception
+ * entry stub doesn't do stack switch.
+ */
+DEFINE_FREDENTRY_DEBUG(exc_debug)
+{
+	/*
+	 * FRED #DB stores DR6 on the stack in the format which
+	 * debug_read_clear_dr6() returns for the IDT entry points.
+	 */
+	unsigned long dr6 = fred_event_data(regs);
+
+	if (user_mode(regs))
+		exc_debug_user(regs, dr6);
+	else
+		exc_debug_kernel(regs, dr6);
+}
+#endif /* CONFIG_X86_FRED */
+
 #else
 /* 32 bit does not have separate entry points. */
 DEFINE_IDTENTRY_RAW(exc_debug)
-- 
2.34.1


