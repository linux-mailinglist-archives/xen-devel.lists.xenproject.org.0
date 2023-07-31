Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46781768CE6
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 09:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572644.896546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQMvp-0003YD-Ct; Mon, 31 Jul 2023 07:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572644.896546; Mon, 31 Jul 2023 07:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQMvo-0003IH-LV; Mon, 31 Jul 2023 07:03:04 +0000
Received: by outflank-mailman (input) for mailman id 572644;
 Mon, 31 Jul 2023 07:02:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8T0J=DR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQMv6-0000iu-Ib
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 07:02:20 +0000
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eb7d1d2-2f70-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 09:02:18 +0200 (CEST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 00:02:08 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2023 00:02:09 -0700
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
X-Inumbo-ID: 2eb7d1d2-2f70-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690786938; x=1722322938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=61pP2ZrTnfM4AWC4LzTY02SWj0Yo4OSnGRh0vm8RTJ0=;
  b=bOJAVNs2S7SCJpU6++/oFJVb1FBl6pDQiqdi5vlCl3ZncdK2luXYLxcf
   rqA6j4qjngp8pyLSgG8nfVRs5XUWroS1U5oqUbhvzxAhyYOFkvZqum7gO
   vdjwlSmNdaQgdBm6lhdtXkMIe6Ln9SMQDOmBpTOGMw2PRdfZc8sDpK8Kr
   gJEdPtUfp7jgF2Fpx0v2xnkmEdkallW2RqERScrjNJguYLQv84QfeddVe
   SYYNiMNnDh44WaOU1AldQAdZ/F8NSDsWmxAHDGkq4FvOzuGPwroBfjfGn
   5G2g4A0d63Ee9vrPNL4l9jtCV1tCgu+t/KQAa32uPB5sSdh9Eyy6tqcX5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="371649209"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="371649209"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871543449"
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
Subject: [PATCH v9 18/36] x86/fred: Add a page fault entry stub for FRED
Date: Sun, 30 Jul 2023 23:32:59 -0700
Message-Id: <20230731063317.3720-19-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731063317.3720-1-xin3.li@intel.com>
References: <20230731063317.3720-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Add a page fault entry stub for FRED.

On a FRED system, the faulting address (CR2) is passed on the stack,
to avoid the problem of transient state. Thus we get the page fault
address from the stack instead of CR2.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/include/asm/fred.h |  2 ++
 arch/x86/mm/fault.c         | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/fred.h b/arch/x86/include/asm/fred.h
index b45c1bea5b7f..fb8e7b4f2d38 100644
--- a/arch/x86/include/asm/fred.h
+++ b/arch/x86/include/asm/fred.h
@@ -112,6 +112,8 @@ static __always_inline unsigned long fred_event_data(struct pt_regs *regs)
 
 typedef DECLARE_FRED_HANDLER((*fred_handler));
 
+DECLARE_FRED_HANDLER(fred_exc_page_fault);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* CONFIG_X86_FRED */
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index e8711b2cafaf..dd3df092d0f2 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -34,6 +34,7 @@
 #include <asm/kvm_para.h>		/* kvm_handle_async_pf		*/
 #include <asm/vdso.h>			/* fixup_vdso_exception()	*/
 #include <asm/irq_stack.h>
+#include <asm/fred.h>
 
 #define CREATE_TRACE_POINTS
 #include <asm/trace/exceptions.h>
@@ -1495,9 +1496,10 @@ handle_page_fault(struct pt_regs *regs, unsigned long error_code,
 	}
 }
 
-DEFINE_IDTENTRY_RAW_ERRORCODE(exc_page_fault)
+static __always_inline void page_fault_common(struct pt_regs *regs,
+					      unsigned int error_code,
+					      unsigned long address)
 {
-	unsigned long address = read_cr2();
 	irqentry_state_t state;
 
 	prefetchw(&current->mm->mmap_lock);
@@ -1544,3 +1546,15 @@ DEFINE_IDTENTRY_RAW_ERRORCODE(exc_page_fault)
 
 	irqentry_exit(regs, state);
 }
+
+DEFINE_IDTENTRY_RAW_ERRORCODE(exc_page_fault)
+{
+	page_fault_common(regs, error_code, read_cr2());
+}
+
+#ifdef CONFIG_X86_FRED
+DEFINE_FRED_HANDLER(fred_exc_page_fault)
+{
+	page_fault_common(regs, regs->orig_ax, fred_event_data(regs));
+}
+#endif
-- 
2.34.1


