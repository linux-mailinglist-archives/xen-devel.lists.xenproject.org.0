Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCCA768CE9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 09:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572635.896506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQMvm-0002Yl-4C; Mon, 31 Jul 2023 07:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572635.896506; Mon, 31 Jul 2023 07:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQMvl-0002Lz-OD; Mon, 31 Jul 2023 07:03:01 +0000
Received: by outflank-mailman (input) for mailman id 572635;
 Mon, 31 Jul 2023 07:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8T0J=DR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQMuw-0000hs-Az
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 07:02:10 +0000
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29d8aa5a-2f70-11ee-b254-6b7b168915f2;
 Mon, 31 Jul 2023 09:02:08 +0200 (CEST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 00:01:58 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2023 00:01:59 -0700
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
X-Inumbo-ID: 29d8aa5a-2f70-11ee-b254-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690786928; x=1722322928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f1KjXTBSCMC/3m47AKFmo72XHXtCtx2wNvJSmQVR8WU=;
  b=MCe+CkaaOiasJb1YHhBc5MD3+mkULEaIwSc2b0nqLgHl35bWnYPW2MVd
   oLYZ6P/TBL3/VszdfJUxVACbdrS3T4M2UzhLoLBsGIdyNEGUdk8ps5WjS
   WCcAgU3YaN6JtJ33av8BNHvuhuqF9BdMyXDM26cZ02VHRg2NqGR2pTMIm
   A/f5cqYgTkG9iuVaUgK6SMp/0NoxXfloPca512UwrjnQfc4x01HbjpL6a
   YK9/BeBDAc1qazAfrfj9igsTMvyl4MD1893H9wakRgLsA9nbWGiuOZryw
   zo8KVPzZHuLfdnWnzErn4XQGTGktLRyFFyzIfvJftOQS4ufqt+4TpWpmm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="371648889"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="371648889"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871543380"
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
Subject: [PATCH v9 09/36] x86/fred: Make unions for the cs and ss fields in struct pt_regs
Date: Sun, 30 Jul 2023 23:32:50 -0700
Message-Id: <20230731063317.3720-10-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731063317.3720-1-xin3.li@intel.com>
References: <20230731063317.3720-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Make the cs and ss fields in struct pt_regs unions between the actual
selector and the unsigned long stack slot. FRED uses this space to
store additional flags.

The printk changes are simply due to the cs and ss fields changed to
unsigned short from unsigned long.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v8:
* Reflect stack frame definition changes from FRED spec 3.0 to 5.0.
* Use __packed instead of __attribute__((__packed__)) (Borislav Petkov).
* Put all comments above the members, like the rest of the file does
  (Borislav Petkov).

Changes since v3:
* Rename csl/ssl of the pt_regs structure to csx/ssx (x for extended)
  (Andrew Cooper).
---
 arch/x86/entry/vsyscall/vsyscall_64.c |  2 +-
 arch/x86/include/asm/ptrace.h         | 57 +++++++++++++++++++++++++--
 arch/x86/kernel/process_64.c          |  2 +-
 3 files changed, 56 insertions(+), 5 deletions(-)

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
index f4db78b09c8f..f1690beffd15 100644
--- a/arch/x86/include/asm/ptrace.h
+++ b/arch/x86/include/asm/ptrace.h
@@ -80,15 +80,66 @@ struct pt_regs {
 /*
  * On syscall entry, this is syscall#. On CPU exception, this is error code.
  * On hw interrupt, it's IRQ number:
+ *
+ * A FRED stack frame starts here:
+ *   1) It _always_ includes an error code;
+ *   2) The return frame for eretu/erets starts here.
  */
 	unsigned long orig_ax;
 /* Return frame for iretq */
 	unsigned long ip;
-	unsigned long cs;
+	union {
+/* CS extended: CS + any fields above it */
+		unsigned long csx;
+		struct {
+/* CS selector proper */
+			unsigned short cs;
+/* The stack level (SL) at the time the event occurred */
+			unsigned int sl		: 2;
+/* Set to indicate that indirect branch tracker in WAIT_FOR_ENDBRANCH state */
+			unsigned int wfe	: 1;
+			unsigned int __csx_resv1: 13;
+			unsigned int __csx_resv2: 32;
+		} __packed;
+	};
 	unsigned long flags;
 	unsigned long sp;
-	unsigned long ss;
-/* top of stack page */
+	union {
+/* SS extended: SS + any fields above it */
+		unsigned long ssx;
+		struct {
+/* SS selector proper */
+			unsigned short ss;
+/* Set to indicate that interrupt blocking by STI was in effect */
+			unsigned int sti	: 1;
+/* For SYSCALL, SYSENTER, or INT n (for any value of n) */
+			unsigned int sys	: 1;
+			unsigned int nmi	: 1;
+			unsigned int __ssx_resv1: 13;
+/* Event information fields, ignored by the FRED return instructions */
+			unsigned int vector	: 8;
+			unsigned int __ssx_resv2: 8;
+			unsigned int type	: 4;
+			unsigned int __ssx_resv3: 4;
+/* Set to indicate that the event was incident to enclave execution */
+			unsigned int enc	: 1;
+/* Set to indicate that the logical processor had been in 64-bit mode */
+			unsigned int l		: 1;
+/*
+ * Set to indicate the event is a nested exception encountered during FRED
+ * event delivery of another event. This bit is not set if the event is
+ * double fault (#DF).
+ */
+			unsigned int nst	: 1;
+			unsigned int __ssx_resv4: 1;
+/* The length of the instruction causing the event */
+			unsigned int instr_len	: 4;
+		} __packed;
+	};
+/*
+ * Top of stack page on IDT systems, while FRED systems have extra fields
+ * defined above, see <asm/fred.h>.
+ */
 };
 
 #endif /* !__i386__ */
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 3d181c16a2f6..265ab8fcb146 100644
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


