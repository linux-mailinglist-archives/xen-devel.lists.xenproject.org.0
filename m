Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B05D7AC024
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 12:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607173.945515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzh3-0005iE-5U; Sat, 23 Sep 2023 10:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607173.945515; Sat, 23 Sep 2023 10:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzh2-0005ZR-UT; Sat, 23 Sep 2023 10:16:56 +0000
Received: by outflank-mailman (input) for mailman id 607173;
 Sat, 23 Sep 2023 10:16:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xNi6=FH=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qjzcF-0000Pn-6N
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 10:11:59 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e3f9737-59f9-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 12:11:53 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:11:43 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:11:43 -0700
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
X-Inumbo-ID: 9e3f9737-59f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463913; x=1726999913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yFOHuHE47yU8Pv3f7vyK1KueQKaw2/ZJmrjuiwmDzLE=;
  b=Fcs75br/pFd4rF1kHIKDEmjvc6JGW90s21ZBC6Q3QkM0KzIYiCJXxdhL
   bs0jORKTQGqiLBr3dQv7zyfeQ37D1U0OM3ISefdf4HWz+JBGOdYLZLWEL
   7EuZdEqqYk/TmplhU6fQ7dlNUjj7MCnLBCG0E/gkgXGZvltAeFv9VNSOG
   QE7vnX+kR7PdriJH8qWc2xrSFjYNewiDd38YMVIfo7VtN3mdcjhrlkrP+
   25cqLzdEQMcEojsj/0EIdt8i+OfVZUayxE3aBRo5ZNiFLgLd4jI7c1u6W
   SK9d2X8CJIfwSkP0bx+4u+An+LlARKkB/JRVPNiRBhUn5RkD4laW00sRh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447492253"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447492253"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813388151"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813388151"
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
Subject: [PATCH v11 15/37] x86/ptrace: Cleanup the definition of the pt_regs structure
Date: Sat, 23 Sep 2023 02:41:50 -0700
Message-Id: <20230923094212.26520-16-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923094212.26520-1-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct pt_regs is hard to read because the member or section related
comments are not aligned with the members.

The 'cs' and 'ss' members of pt_regs are type of 'unsigned long' while
in reality they are only 16-bit wide. This works so far as the
remaining space is unused, but FRED will use the remaining bits for
other purposes.

To prepare for FRED:

  - Cleanup the formatting
  - Convert 'cs' and 'ss' to u16 and embed them into an union
    with a u64
  - Fixup the related printk() format strings

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/entry/vsyscall/vsyscall_64.c |  2 +-
 arch/x86/include/asm/ptrace.h         | 44 +++++++++++++++++++--------
 arch/x86/kernel/process_64.c          |  2 +-
 3 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
index e0ca8120aea8..a3c0df11d0e6 100644
--- a/arch/x86/entry/vsyscall/vsyscall_64.c
+++ b/arch/x86/entry/vsyscall/vsyscall_64.c
@@ -76,7 +76,7 @@ static void warn_bad_vsyscall(const char *level, struct pt_regs *regs,
 	if (!show_unhandled_signals)
 		return;
 
-	printk_ratelimited("%s%s[%d] %s ip:%lx cs:%lx sp:%lx ax:%lx si:%lx di:%lx\n",
+	printk_ratelimited("%s%s[%d] %s ip:%lx cs:%x sp:%lx ax:%lx si:%lx di:%lx\n",
 			   level, current->comm, task_pid_nr(current),
 			   message, regs->ip, regs->cs,
 			   regs->sp, regs->ax, regs->si, regs->di);
diff --git a/arch/x86/include/asm/ptrace.h b/arch/x86/include/asm/ptrace.h
index f4db78b09c8f..f08ea073edd6 100644
--- a/arch/x86/include/asm/ptrace.h
+++ b/arch/x86/include/asm/ptrace.h
@@ -57,17 +57,19 @@ struct pt_regs {
 #else /* __i386__ */
 
 struct pt_regs {
-/*
- * C ABI says these regs are callee-preserved. They aren't saved on kernel entry
- * unless syscall needs a complete, fully filled "struct pt_regs".
- */
+	/*
+	 * C ABI says these regs are callee-preserved. They aren't saved on
+	 * kernel entry unless syscall needs a complete, fully filled
+	 * "struct pt_regs".
+	 */
 	unsigned long r15;
 	unsigned long r14;
 	unsigned long r13;
 	unsigned long r12;
 	unsigned long bp;
 	unsigned long bx;
-/* These regs are callee-clobbered. Always saved on kernel entry. */
+
+	/* These regs are callee-clobbered. Always saved on kernel entry. */
 	unsigned long r11;
 	unsigned long r10;
 	unsigned long r9;
@@ -77,18 +79,34 @@ struct pt_regs {
 	unsigned long dx;
 	unsigned long si;
 	unsigned long di;
-/*
- * On syscall entry, this is syscall#. On CPU exception, this is error code.
- * On hw interrupt, it's IRQ number:
- */
+
+	/*
+	 * orig_ax is used on entry for:
+	 * - the syscall number (syscall, sysenter, int80)
+	 * - error_code stored by the CPU on traps and exceptions
+	 * - the interrupt number for device interrupts
+	 */
 	unsigned long orig_ax;
-/* Return frame for iretq */
+
+	/* The IRETQ return frame starts here */
 	unsigned long ip;
-	unsigned long cs;
+
+	union {
+		u64	csx;	// The full 64-bit data slot containing CS
+		u16	cs;	// CS selector
+	};
+
 	unsigned long flags;
 	unsigned long sp;
-	unsigned long ss;
-/* top of stack page */
+
+	union {
+		u64	ssx;	// The full 64-bit data slot containing SS
+		u16	ss;	// SS selector
+	};
+
+	/*
+	 * Top of stack on IDT systems.
+	 */
 };
 
 #endif /* !__i386__ */
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 33b268747bb7..0f78b58021bb 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -117,7 +117,7 @@ void __show_regs(struct pt_regs *regs, enum show_regs_mode mode,
 
 	printk("%sFS:  %016lx(%04x) GS:%016lx(%04x) knlGS:%016lx\n",
 	       log_lvl, fs, fsindex, gs, gsindex, shadowgs);
-	printk("%sCS:  %04lx DS: %04x ES: %04x CR0: %016lx\n",
+	printk("%sCS:  %04x DS: %04x ES: %04x CR0: %016lx\n",
 		log_lvl, regs->cs, ds, es, cr0);
 	printk("%sCR2: %016lx CR3: %016lx CR4: %016lx\n",
 		log_lvl, cr2, cr3, cr4);
-- 
2.34.1


