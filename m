Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B9A768CDC
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 09:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572648.896561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQMvq-000452-VJ; Mon, 31 Jul 2023 07:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572648.896561; Mon, 31 Jul 2023 07:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQMvq-0003k7-Ih; Mon, 31 Jul 2023 07:03:06 +0000
Received: by outflank-mailman (input) for mailman id 572648;
 Mon, 31 Jul 2023 07:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8T0J=DR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQMvA-0000iu-Ty
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 07:02:24 +0000
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 329a4bd2-2f70-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 09:02:23 +0200 (CEST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 00:02:12 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2023 00:02:13 -0700
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
X-Inumbo-ID: 329a4bd2-2f70-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690786943; x=1722322943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QeZUtDgMAPwFIrdo9TmaG72+ignP6GGIZpxe8B2aw6k=;
  b=QuUXo2nb07kF44TG969mFLg28G1/4KTubgFPBSjRLmyJ7vTIp0rSbvsl
   XFiPuxZL4Q/geYa/I2UaJyiFx5mi1CR6naRlvLyukNEd7yXU0y9EYd8Cl
   Oi3q4c2uSu/JN2B2omLZpu6wAUNAPdtDaaiCezqfsyKCxbQSUCBYTa4n5
   6X1Ap+fFj/Guudf6c1cBPJxM1/J+ERuuRmXv8XeCbLsCh1l+2LVfOCd0W
   o5l/t++z+yxhYff7dPHV2rKgXM+Z4fIFXSW90NT+lyzrer4ZH1i1sGg4p
   6aIoeD+57B02bhHgANDn/jGHEkowA0Z9wHBpos2uXM/jDWEdN/9jF+Hro
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="371649347"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="371649347"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871543474"
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
Subject: [PATCH v9 22/36] x86/fred: Add a double fault entry stub for FRED
Date: Sun, 30 Jul 2023 23:33:03 -0700
Message-Id: <20230731063317.3720-23-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731063317.3720-1-xin3.li@intel.com>
References: <20230731063317.3720-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IDT event delivery of a double fault pushes an error code into the
orig_ax member of the pt_regs structure, and the error code is passed
as the second argument of its C-handler exc_double_fault(), although
the pt_regs structure is already passed as the first argument.

The existing IDT double fault asm entry code does the following

  movq ORIG_RAX(%rsp), %rsi	/* get error code into 2nd argument*/
  movq $-1, ORIG_RAX(%rsp)	/* no syscall to restart */

to set the orig_ax member to -1 just before calling the C-handler.

X86_TRAP_TS, X86_TRAP_NP, X86_TRAP_SS, X86_TRAP_GP, X86_TRAP_AC and
X86_TRAP_CP are all handled in the same way because the IDT event
delivery pushes an error code into their stack frame for them.

The commit d99015b1abbad ("x86: move entry_64.S register saving out of
the macros") introduced the changes to set orig_ax to -1, but I can't
see why. Our tests with FRED seem fine if orig_ax is left unchanged
instead of set to -1. It's probably cleaner and simpler to remove the
second argument from exc_double_fault() while leave orig_ax unchanged
to pass the error code inside the first argument, at least on native
x86_64. That would be a separate, pre-FRED, patch.

For now just add a double fault entry stub for FRED, which simply
calls the existing exc_double_fault().

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/include/asm/fred.h | 1 +
 arch/x86/kernel/traps.c     | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/x86/include/asm/fred.h b/arch/x86/include/asm/fred.h
index f559dd9dc4f2..bd701ac87528 100644
--- a/arch/x86/include/asm/fred.h
+++ b/arch/x86/include/asm/fred.h
@@ -116,6 +116,7 @@ DECLARE_FRED_HANDLER(fred_exc_nmi);
 DECLARE_FRED_HANDLER(fred_exc_debug);
 DECLARE_FRED_HANDLER(fred_exc_page_fault);
 DECLARE_FRED_HANDLER(fred_exc_machine_check);
+DECLARE_FRED_HANDLER(fred_exc_double_fault);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index b10464966a81..49dd92458eb0 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -555,6 +555,13 @@ DEFINE_IDTENTRY_DF(exc_double_fault)
 	instrumentation_end();
 }
 
+#ifdef CONFIG_X86_FRED
+DEFINE_FRED_HANDLER(fred_exc_double_fault)
+{
+	exc_double_fault(regs, regs->orig_ax);
+}
+#endif
+
 DEFINE_IDTENTRY(exc_bounds)
 {
 	if (notify_die(DIE_TRAP, "bounds", regs, 0,
-- 
2.34.1


