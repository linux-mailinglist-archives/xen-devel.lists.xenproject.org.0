Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE35768D30
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 09:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572696.896711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQN2D-0007kd-Bb; Mon, 31 Jul 2023 07:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572696.896711; Mon, 31 Jul 2023 07:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQN2D-0007hu-85; Mon, 31 Jul 2023 07:09:41 +0000
Received: by outflank-mailman (input) for mailman id 572696;
 Mon, 31 Jul 2023 07:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8T0J=DR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQN2C-0007Jb-5x
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 07:09:40 +0000
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36089a85-2f71-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 09:09:38 +0200 (CEST)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 00:09:37 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga007.fm.intel.com with ESMTP; 31 Jul 2023 00:09:35 -0700
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
X-Inumbo-ID: 36089a85-2f71-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690787378; x=1722323378;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Aa5CvA7MmnPHyksJQgqEteFVOvaio1lA17Ke5qS+vL0=;
  b=N72tAZR+vkIV66rxfC9UqMmtaL6m9M6WWG9cpgkn/2EnLP7fOXS6EI/+
   itBGSuzlRjj2Tntnj3Jj20DPWn5otb4PlvUC0+kjqk3N9yOlWlihgpUuQ
   rN70j89iZZd244rAWJr+rJEaqZweDhY+oNxMNf0KUtg6c74Fs+lwn+wfG
   l0rUN3Itl5EeRsZFfG0pQzX/kZhO6R8ZNSOOuaRnOiIkCGPo0/fz0Z0Uc
   TLaqf5/DrJoVK/pp2SIaH9P0rNxklprCke2v4xAVMmv+z7RJ7h0a6MwA2
   Abm8yiX8OmufieFNaW4zymVAAPPkHZbV3iOA+c33XrQMg3LHWRSk+Xx0a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="432749913"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="432749913"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="731491679"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="731491679"
From: Xin Li <xin3.li@intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Tony Luck <tony.luck@intel.com>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Kim Phillips <kim.phillips@amd.com>,
	Xin Li <xin3.li@intel.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	"Liam R . Howlett" <Liam.Howlett@Oracle.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Jiaxi Chen <jiaxi.chen@linux.intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Jim Mattson <jmattson@google.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	Breno Leitao <leitao@debian.org>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Brian Gerst <brgerst@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ze Gao <zegao2021@gmail.com>,
	Fei Li <fei1.li@intel.com>,
	Conghui <conghui.chen@intel.com>,
	Ashok Raj <ashok.raj@intel.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Jane Malalane <jane.malalane@citrix.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Yantengsi <siyanteng@loongson.cn>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sathvika Vasireddy <sv@linux.ibm.com>
Subject: [PATCH v9 28/36] x86/idtentry: Incorporate declaration/definition of the FRED exception handler type
Date: Sun, 30 Jul 2023 23:41:05 -0700
Message-Id: <20230731064105.3857-1-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing IDT exception C-handlers of X86_TRAP_TS, X86_TRAP_NP,
X86_TRAP_SS, X86_TRAP_GP, X86_TRAP_AC and X86_TRAP_CP take an error
code as the second argument, thus their FRED version handlers simply
call the corresponding existing IDT handlers with orig_ax from the
pt_regs structure as the second argument.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/include/asm/idtentry.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index e67d111bf932..3b743c3fbe91 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -11,6 +11,7 @@
 #include <linux/entry-common.h>
 #include <linux/hardirq.h>
 
+#include <asm/fred.h>
 #include <asm/irq_stack.h>
 
 /**
@@ -67,13 +68,16 @@ static __always_inline void __##func(struct pt_regs *regs)
 
 /**
  * DECLARE_IDTENTRY_ERRORCODE - Declare functions for simple IDT entry points
+ *				and their corresponding software based
+ *				dispatch handler
  *				Error code pushed by hardware
  * @vector:	Vector number (ignored for C)
  * @func:	Function name of the entry point
  *
- * Declares three functions:
+ * Declares four functions:
  * - The ASM entry point: asm_##func
  * - The XEN PV trap entry point: xen_##func (maybe unused)
+ * - The C handler called from the FRED event dispatch framework
  * - The C handler called from the ASM entry point
  *
  * Same as DECLARE_IDTENTRY, but has an extra error_code argument for the
@@ -82,14 +86,19 @@ static __always_inline void __##func(struct pt_regs *regs)
 #define DECLARE_IDTENTRY_ERRORCODE(vector, func)			\
 	asmlinkage void asm_##func(void);				\
 	asmlinkage void xen_asm_##func(void);				\
+	__visible DECLARE_FRED_HANDLER(fred_##func);			\
 	__visible void func(struct pt_regs *regs, unsigned long error_code)
 
 /**
  * DEFINE_IDTENTRY_ERRORCODE - Emit code for simple IDT entry points
+ *			       and their corresponding software based
+ *			       dispatch handler
  *			       Error code pushed by hardware
  * @func:	Function name of the entry point
  *
- * Same as DEFINE_IDTENTRY, but has an extra error_code argument
+ * Same as DEFINE_IDTENTRY, but has an extra error_code argument. The
+ * fred_func() simply calls func() with passing orig_ax as its second
+ * argument.
  */
 #define DEFINE_IDTENTRY_ERRORCODE(func)					\
 static __always_inline void __##func(struct pt_regs *regs,		\
@@ -106,6 +115,11 @@ __visible noinstr void func(struct pt_regs *regs,			\
 	irqentry_exit(regs, state);					\
 }									\
 									\
+__visible DEFINE_FRED_HANDLER(fred_##func)				\
+{									\
+	func(regs, regs->orig_ax);					\
+}									\
+									\
 static __always_inline void __##func(struct pt_regs *regs,		\
 				     unsigned long error_code)
 
-- 
2.34.1


