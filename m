Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD94768CEB
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 09:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572639.896530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQMvn-00035I-Pe; Mon, 31 Jul 2023 07:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572639.896530; Mon, 31 Jul 2023 07:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQMvn-0002pL-7y; Mon, 31 Jul 2023 07:03:03 +0000
Received: by outflank-mailman (input) for mailman id 572639;
 Mon, 31 Jul 2023 07:02:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8T0J=DR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQMuy-0000iu-7L
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 07:02:12 +0000
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29eee602-2f70-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 09:02:09 +0200 (CEST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 00:01:59 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2023 00:02:00 -0700
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
X-Inumbo-ID: 29eee602-2f70-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690786929; x=1722322929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2rbYs2KdLMV2D8jndr60eRf402MI8mOow/QviwqPNSc=;
  b=nNlM8I/yp9KSLBodDD1PTyH9qE+LuGseHi6TLUO0EgSF7ynBulOQ980z
   hKyqnJOhlN35rV1tXbsW8zTuytbj+ZOqA64PKx5mYlSNILWMpyTEGQ5QZ
   9DYGqo/2tYMZg92aRAFtHRts8WL7TpOJSVA7OYvVLHnUfpEyhelxgEDod
   240C+kS0XixnCNdBBFO0NjU7Jgk1F8cwf46SlpIZ61638nkZYu8CZYbs6
   XXXIhvH9KFGak2xriDXAKnLCZVuesckWMPH4DzcTXvZBx8iEatGq3nFJp
   O6bZE9l7BLBkzROFJrTNyRA4IuONWmcufhg9HJnbfNP+fx4n+2YJXvTz7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="371648926"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="371648926"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871543389"
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
Subject: [PATCH v9 10/36] x86/fred: Add a new header file for FRED definitions
Date: Sun, 30 Jul 2023 23:32:51 -0700
Message-Id: <20230731063317.3720-11-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731063317.3720-1-xin3.li@intel.com>
References: <20230731063317.3720-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Add a header file for FRED prototypes and definitions.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v6:
* Replace pt_regs csx flags prefix FRED_CSL_ with FRED_CSX_.
---
 arch/x86/include/asm/fred.h | 104 ++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 arch/x86/include/asm/fred.h

diff --git a/arch/x86/include/asm/fred.h b/arch/x86/include/asm/fred.h
new file mode 100644
index 000000000000..d76e681a806f
--- /dev/null
+++ b/arch/x86/include/asm/fred.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Macros for Flexible Return and Event Delivery (FRED)
+ */
+
+#ifndef ASM_X86_FRED_H
+#define ASM_X86_FRED_H
+
+#include <linux/const.h>
+#include <asm/asm.h>
+
+/*
+ * FRED return instructions
+ *
+ * Replace with "ERETS"/"ERETU" once binutils support FRED return instructions.
+ * The binutils version supporting FRED instructions is still TBD, and will
+ * update once we have it.
+ */
+#define ERETS			_ASM_BYTES(0xf2,0x0f,0x01,0xca)
+#define ERETU			_ASM_BYTES(0xf3,0x0f,0x01,0xca)
+
+/*
+ * RSP is aligned to a 64-byte boundary before used to push a new stack frame
+ */
+#define FRED_STACK_FRAME_RSP_MASK	_AT(unsigned long, (~0x3f))
+
+/*
+ * Event stack level macro for the FRED_STKLVLS MSR.
+ * Usage example: FRED_STKLVL(X86_TRAP_DF, 3)
+ * Multiple values can be ORd together.
+ */
+#define FRED_STKLVL(v,l)	(_AT(unsigned long, l) << (2*(v)))
+
+/* FRED_CONFIG MSR */
+#define FRED_CONFIG_CSL_MASK		0x3
+/*
+ * Used for the return address for call emulation during code patching,
+ * and measured in 64-byte cache lines.
+ */
+#define FRED_CONFIG_REDZONE_AMOUNT	1
+#define FRED_CONFIG_REDZONE		(_AT(unsigned long, FRED_CONFIG_REDZONE_AMOUNT) << 6)
+#define FRED_CONFIG_INT_STKLVL(l)	(_AT(unsigned long, l) << 9)
+#define FRED_CONFIG_ENTRYPOINT(p)	_AT(unsigned long, (p))
+
+/*
+ * FRED event type and vector bit width and counts.
+ *
+ * There is space in the stack frame making it possible to extend event type
+ * and vector fields in the future.
+ */
+#define FRED_EVENT_TYPE_BITS		3
+#define FRED_EVENT_TYPE_COUNT		_BITUL(FRED_EVENT_TYPE_BITS)
+#define FRED_EVENT_VECTOR_BITS		8
+#define FRED_EVENT_VECTOR_COUNT		_BITUL(FRED_EVENT_VECTOR_BITS)
+
+/* FRED EVENT_TYPE_OTHER vector numbers */
+#define FRED_SYSCALL			1
+#define FRED_SYSENTER			2
+#define FRED_NUM_OTHER_VECTORS		3
+
+/* Flags above the SS selector (regs->ssx) */
+#define FRED_SSX_INTERRUPT_SHADOW_BIT	16
+#define FRED_SSX_INTERRUPT_SHADOW	_BITUL(FRED_SSX_INTERRUPT_SHADOW_BIT)
+#define FRED_SSX_SOFTWARE_INITIATED_BIT	17
+#define FRED_SSX_SOFTWARE_INITIATED	_BITUL(FRED_SSX_SOFTWARE_INITIATED_BIT)
+#define FRED_SSX_NMI_BIT		18
+#define FRED_SSX_NMI			_BITUL(FRED_SSX_NMI_BIT)
+#define FRED_SSX_64_BIT_MODE_BIT	57
+#define FRED_SSX_64_BIT_MODE		_BITUL(FRED_SSX_64_BIT_MODE_BIT)
+
+#ifdef CONFIG_X86_FRED
+
+#ifndef __ASSEMBLY__
+
+#include <linux/kernel.h>
+#include <asm/ptrace.h>
+
+struct fred_info {
+	/* Event data: CR2, DR6, ... */
+	unsigned long edata;
+	unsigned long resv;
+};
+
+/* Full format of the FRED stack frame */
+struct fred_frame {
+	struct pt_regs   regs;
+	struct fred_info info;
+};
+
+static __always_inline struct fred_info *fred_info(struct pt_regs *regs)
+{
+	return &container_of(regs, struct fred_frame, regs)->info;
+}
+
+static __always_inline unsigned long fred_event_data(struct pt_regs *regs)
+{
+	return fred_info(regs)->edata;
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* CONFIG_X86_FRED */
+
+#endif /* ASM_X86_FRED_H */
-- 
2.34.1


