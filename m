Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF0879FA76
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 07:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601786.938088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgelJ-00058s-3q; Thu, 14 Sep 2023 05:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601786.938088; Thu, 14 Sep 2023 05:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgelH-0004mf-VW; Thu, 14 Sep 2023 05:19:31 +0000
Received: by outflank-mailman (input) for mailman id 601786;
 Thu, 14 Sep 2023 05:19:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZLI=E6=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qgelB-0001XI-Hc
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 05:19:25 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43eb30c1-52be-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 07:19:23 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 22:17:37 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 22:17:36 -0700
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
X-Inumbo-ID: 43eb30c1-52be-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694668763; x=1726204763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yFOHuHE47yU8Pv3f7vyK1KueQKaw2/ZJmrjuiwmDzLE=;
  b=HqrPmQwy4sRhqAbFo3G610gZeBtUJFY4MMXsl/KHWR7hPtT/5HRpJ5Qs
   2b0qDZ0vGhjBhY3qAA33P3bMHswQKBahKfR77n//C0Mce4xWd+5J54VAZ
   ioGcBTTwjQ5RmupBVHgA701h5RFZefBo+A2AdSooS2NtJ41JSP+CrIvLD
   J772AGUbG+3El/wUkMPSznDEOJVPWTZIqPfooOXPMuKrd+bfHE/ncLMY4
   Fsn7vsJJJtFCrGYr6fbxnxSxNoAOQ6+4wCQyrzcvWheps04Xvp9GgsiVz
   /Rr5WgETTpsDkga5EDJHzQs3aILP69Lu9LCqOmnxYvCqCCUpy5vA6bNVl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382661261"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="382661261"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779488784"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="779488784"
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
	jiangshanlai@gmail.com
Subject: [PATCH v10 15/38] x86/ptrace: Cleanup the definition of the pt_regs structure
Date: Wed, 13 Sep 2023 21:47:42 -0700
Message-Id: <20230914044805.301390-16-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914044805.301390-1-xin3.li@intel.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
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


