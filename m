Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FAE805218
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647570.1010947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATUk-0007Wh-1R; Tue, 05 Dec 2023 11:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647570.1010947; Tue, 05 Dec 2023 11:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATUj-0007ME-EM; Tue, 05 Dec 2023 11:21:41 +0000
Received: by outflank-mailman (input) for mailman id 647570;
 Tue, 05 Dec 2023 11:21:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUf-0005GD-MY
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:37 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73c888cc-9360-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 12:21:36 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:26 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:21:25 -0800
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
X-Inumbo-ID: 73c888cc-9360-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775297; x=1733311297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c4v54mG+yNciVv+S7CXnyMniWVPMoCmWvn//znfwVvI=;
  b=Z84pk1Fc9psctUckgygqQYKX7gQ5/TAG+UwODCUcJGQRKJw+AngR8amL
   qDJ6xKzDI4WyRd392+VyMrwgKILGhLtn7QwD1HG4gs6ID9D9ZXJObYw5o
   9CX/FZEKGyodIZguu/0jDsxk3Imy95B2VFRb3hIj2nLGBy3gT9fLybd3H
   lGoQuHKKYk7LCKH4HwOeMJyiEEHxL2ocIkX4XGUUrkuOxQpB5iL46JepN
   qsK0rAcMcV54alUrVisM6s6nWcmCIINECvRolAHBx+EY6WHFmzVtCChJG
   YYdW+h2wqT8GJ/Rk+y5Ljxy7jxRuMWUFmKa3cxpaZwIJBiv3NPhobYZPN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942658"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942658"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018193002"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018193002"
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
	nik.borisov@suse.com,
	shan.kang@intel.com
Subject: [PATCH v13 29/35] x86/fred: Fixup fault on ERETU by jumping to fred_entrypoint_user
Date: Tue,  5 Dec 2023 02:50:18 -0800
Message-ID: <20231205105030.8698-30-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the stack frame contains an invalid user context (e.g. due to invalid SS,
a non-canonical RIP, etc.) the ERETU instruction will trap (#SS or #GP).

From a Linux point of view, this really should be considered a user space
failure, so use the standard fault fixup mechanism to intercept the fault,
fix up the exception frame, and redirect execution to fred_entrypoint_user.
The end result is that it appears just as if the hardware had taken the
exception immediately after completing the transition to user space.

Suggested-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v8:
* Reflect the FRED spec 5.0 change that ERETS and ERETU add 8 to %rsp
  before popping the return context from the stack.

Changes since v6:
* Add a comment to explain why it is safe to write to the previous FRED stack
  frame. (Lai Jiangshan).

Changes since v5:
* Move the NMI bit from an invalid stack frame, which caused ERETU to fault,
  to the fault handler's stack frame, thus to unblock NMI ASAP if NMI is blocked
  (Lai Jiangshan).
---
 arch/x86/entry/entry_64_fred.S             |  5 +-
 arch/x86/include/asm/extable_fixup_types.h |  4 +-
 arch/x86/mm/extable.c                      | 79 ++++++++++++++++++++++
 3 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/arch/x86/entry/entry_64_fred.S b/arch/x86/entry/entry_64_fred.S
index 5781c3411b44..d1c2fc4af8ae 100644
--- a/arch/x86/entry/entry_64_fred.S
+++ b/arch/x86/entry/entry_64_fred.S
@@ -3,6 +3,7 @@
  * The actual FRED entry points.
  */
 
+#include <asm/asm.h>
 #include <asm/fred.h>
 
 #include "calling.h"
@@ -34,7 +35,9 @@ SYM_CODE_START_NOALIGN(asm_fred_entrypoint_user)
 	call	fred_entry_from_user
 SYM_INNER_LABEL(asm_fred_exit_user, SYM_L_GLOBAL)
 	FRED_EXIT
-	ERETU
+1:	ERETU
+
+	_ASM_EXTABLE_TYPE(1b, asm_fred_entrypoint_user, EX_TYPE_ERETU)
 SYM_CODE_END(asm_fred_entrypoint_user)
 
 .fill asm_fred_entrypoint_kernel - ., 1, 0xcc
diff --git a/arch/x86/include/asm/extable_fixup_types.h b/arch/x86/include/asm/extable_fixup_types.h
index 991e31cfde94..1585c798a02f 100644
--- a/arch/x86/include/asm/extable_fixup_types.h
+++ b/arch/x86/include/asm/extable_fixup_types.h
@@ -64,6 +64,8 @@
 #define	EX_TYPE_UCOPY_LEN4		(EX_TYPE_UCOPY_LEN | EX_DATA_IMM(4))
 #define	EX_TYPE_UCOPY_LEN8		(EX_TYPE_UCOPY_LEN | EX_DATA_IMM(8))
 
-#define EX_TYPE_ZEROPAD			20 /* longword load with zeropad on fault */
+#define	EX_TYPE_ZEROPAD			20 /* longword load with zeropad on fault */
+
+#define	EX_TYPE_ERETU			21
 
 #endif
diff --git a/arch/x86/mm/extable.c b/arch/x86/mm/extable.c
index 271dcb2deabc..fc40a4e12f3a 100644
--- a/arch/x86/mm/extable.c
+++ b/arch/x86/mm/extable.c
@@ -6,6 +6,7 @@
 #include <xen/xen.h>
 
 #include <asm/fpu/api.h>
+#include <asm/fred.h>
 #include <asm/sev.h>
 #include <asm/traps.h>
 #include <asm/kdebug.h>
@@ -223,6 +224,80 @@ static bool ex_handler_ucopy_len(const struct exception_table_entry *fixup,
 	return ex_handler_uaccess(fixup, regs, trapnr, fault_address);
 }
 
+#ifdef CONFIG_X86_FRED
+static bool ex_handler_eretu(const struct exception_table_entry *fixup,
+			     struct pt_regs *regs, unsigned long error_code)
+{
+	struct pt_regs *uregs = (struct pt_regs *)
+		(regs->sp - offsetof(struct pt_regs, orig_ax));
+	unsigned short ss = uregs->ss;
+	unsigned short cs = uregs->cs;
+
+	/*
+	 * Move the NMI bit from the invalid stack frame, which caused ERETU
+	 * to fault, to the fault handler's stack frame, thus to unblock NMI
+	 * with the fault handler's ERETS instruction ASAP if NMI is blocked.
+	 */
+	regs->fred_ss.nmi = uregs->fred_ss.nmi;
+
+	/*
+	 * Sync event information to uregs, i.e., the ERETU return frame, but
+	 * is it safe to write to the ERETU return frame which is just above
+	 * current event stack frame?
+	 *
+	 * The RSP used by FRED to push a stack frame is not the value in %rsp,
+	 * it is calculated from %rsp with the following 2 steps:
+	 * 1) RSP = %rsp - (IA32_FRED_CONFIG & 0x1c0)	// Reserve N*64 bytes
+	 * 2) RSP = RSP & ~0x3f		// Align to a 64-byte cache line
+	 * when an event delivery doesn't trigger a stack level change.
+	 *
+	 * Here is an example with N*64 (N=1) bytes reserved:
+	 *
+	 *  64-byte cache line ==>  ______________
+	 *                         |___Reserved___|
+	 *                         |__Event_data__|
+	 *                         |_____SS_______|
+	 *                         |_____RSP______|
+	 *                         |_____FLAGS____|
+	 *                         |_____CS_______|
+	 *                         |_____IP_______|
+	 *  64-byte cache line ==> |__Error_code__| <== ERETU return frame
+	 *                         |______________|
+	 *                         |______________|
+	 *                         |______________|
+	 *                         |______________|
+	 *                         |______________|
+	 *                         |______________|
+	 *                         |______________|
+	 *  64-byte cache line ==> |______________| <== RSP after step 1) and 2)
+	 *                         |___Reserved___|
+	 *                         |__Event_data__|
+	 *                         |_____SS_______|
+	 *                         |_____RSP______|
+	 *                         |_____FLAGS____|
+	 *                         |_____CS_______|
+	 *                         |_____IP_______|
+	 *  64-byte cache line ==> |__Error_code__| <== ERETS return frame
+	 *
+	 * Thus a new FRED stack frame will always be pushed below a previous
+	 * FRED stack frame ((N*64) bytes may be reserved between), and it is
+	 * safe to write to a previous FRED stack frame as they never overlap.
+	 */
+	fred_info(uregs)->edata = fred_event_data(regs);
+	uregs->ssx = regs->ssx;
+	uregs->fred_ss.ss = ss;
+	/* The NMI bit was moved away above */
+	uregs->fred_ss.nmi = 0;
+	uregs->csx = regs->csx;
+	uregs->fred_cs.sl = 0;
+	uregs->fred_cs.wfe = 0;
+	uregs->cs = cs;
+	uregs->orig_ax = error_code;
+
+	return ex_handler_default(fixup, regs);
+}
+#endif
+
 int ex_get_fixup_type(unsigned long ip)
 {
 	const struct exception_table_entry *e = search_exception_tables(ip);
@@ -300,6 +375,10 @@ int fixup_exception(struct pt_regs *regs, int trapnr, unsigned long error_code,
 		return ex_handler_ucopy_len(e, regs, trapnr, fault_addr, reg, imm);
 	case EX_TYPE_ZEROPAD:
 		return ex_handler_zeropad(e, regs, fault_addr);
+#ifdef CONFIG_X86_FRED
+	case EX_TYPE_ERETU:
+		return ex_handler_eretu(e, regs, error_code);
+#endif
 	}
 	BUG();
 }
-- 
2.43.0


