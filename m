Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B61576AC55
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573965.899156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlMh-0007wB-0q; Tue, 01 Aug 2023 09:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573965.899156; Tue, 01 Aug 2023 09:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlMg-0007sy-SA; Tue, 01 Aug 2023 09:08:26 +0000
Received: by outflank-mailman (input) for mailman id 573965;
 Tue, 01 Aug 2023 09:08:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L1iX=DS=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQlGn-0005E5-0i
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:02:21 +0000
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d523a12-304a-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 11:02:19 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 02:02:10 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 02:02:09 -0700
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
X-Inumbo-ID: 1d523a12-304a-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690880539; x=1722416539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dQPbDjEqQWsCazdenr4wm1/cp/YJX7zOnAx3X5niG4Q=;
  b=n+rYQuhcIvzNJLmsXBEw8Lwsem76O8IpiNHXC+Nr3gsLSUuUdShApJMs
   vDqLN06+yrUsgLryFPnaC+Xc8GWMeIaVU7lbuhbmce1nybQ8TR9xHE9nX
   k/mvLKHP7/+m5rrtj/dYUeE1ynS1KMayUTi/siF/crjn7YGkL1fKHVPlQ
   GmOHsQAufB/AplysljpMC39cfVZLOWmLx0eEXXCx6T4b7cIIqTPY+efwS
   1XaVjRKAC2vU2E/cwY5eRD8hVduFYOhX4C1tgsoVMb40MVuPwkdBsEDna
   iD9wwhNx1fS6TyMwHG9GWVRMdcjTAiIoHem+MtO7kOeVStbKxQfgy7CT5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="433082746"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="433082746"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="975217074"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="975217074"
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
Subject: [PATCH RESEND v9 21/36] x86/fred: Add a machine check entry stub for FRED
Date: Tue,  1 Aug 2023 01:33:03 -0700
Message-Id: <20230801083318.8363-22-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801083318.8363-1-xin3.li@intel.com>
References: <20230801083318.8363-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a machine check entry stub for FRED.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v5:
* Disallow #DB inside #MCE for robustness sake (Peter Zijlstra).
---
 arch/x86/include/asm/fred.h    |  1 +
 arch/x86/kernel/cpu/mce/core.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/x86/include/asm/fred.h b/arch/x86/include/asm/fred.h
index 2a7c47dfd733..f559dd9dc4f2 100644
--- a/arch/x86/include/asm/fred.h
+++ b/arch/x86/include/asm/fred.h
@@ -115,6 +115,7 @@ typedef DECLARE_FRED_HANDLER((*fred_handler));
 DECLARE_FRED_HANDLER(fred_exc_nmi);
 DECLARE_FRED_HANDLER(fred_exc_debug);
 DECLARE_FRED_HANDLER(fred_exc_page_fault);
+DECLARE_FRED_HANDLER(fred_exc_machine_check);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index b8ad5a5b4026..98456e20f155 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -52,6 +52,7 @@
 #include <asm/mce.h>
 #include <asm/msr.h>
 #include <asm/reboot.h>
+#include <asm/fred.h>
 
 #include "internal.h"
 
@@ -2118,6 +2119,20 @@ DEFINE_IDTENTRY_MCE_USER(exc_machine_check)
 	exc_machine_check_user(regs);
 	local_db_restore(dr7);
 }
+
+#ifdef CONFIG_X86_FRED
+DEFINE_FRED_HANDLER(fred_exc_machine_check)
+{
+	unsigned long dr7;
+
+	dr7 = local_db_save();
+	if (user_mode(regs))
+		exc_machine_check_user(regs);
+	else
+		exc_machine_check_kernel(regs);
+	local_db_restore(dr7);
+}
+#endif
 #else
 /* 32bit unified entry point */
 DEFINE_IDTENTRY_RAW(exc_machine_check)
-- 
2.34.1


