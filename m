Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AC58052F9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647651.1011123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATgq-0007lk-ON; Tue, 05 Dec 2023 11:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647651.1011123; Tue, 05 Dec 2023 11:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATgq-0007ib-L5; Tue, 05 Dec 2023 11:34:12 +0000
Received: by outflank-mailman (input) for mailman id 647651;
 Tue, 05 Dec 2023 11:34:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUm-0003dP-Us
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:44 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7350f7e4-9360-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:21:36 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:25 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:21:23 -0800
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
X-Inumbo-ID: 7350f7e4-9360-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775297; x=1733311297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9l8F1WmhlJ7jRL54JQMm6v1HYP6GXYsOB2qRuf6ZAIU=;
  b=O9MIXii0i+RBpyZqynEC0q3ye+WYl3Ns6mOdYaKYj7I+9Wc1eosyxN45
   uJqZ1dfRsAElj2xkzae3v6nkSjpI8wsgeDY9LPuGenZoRvZhHHymAgkeZ
   jPQ5MyzMVxQx0kvZ/ysH6wNtPAjceU958ukxKPVyUt56jvA0bVaR6NgaJ
   FsGDlv6JzRkVb6xI1NnS/C1R87pWFGSUiD+V9ii2PcBgCLXT5Uc7hLzDB
   UaBX3fHOZq24sa0JbPLFJqbytioYwOqUR4QZyLNzFSsx+bZn5+JlDaG+Z
   ZVATRGsRhBgCB0Urdca1Kgw20e0BO7Nw2zRJbsxBjBJ70oShkm5VWL5vu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942608"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942608"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018192988"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018192988"
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
Subject: [PATCH v13 25/35] x86/fred: Add a machine check entry stub for FRED
Date: Tue,  5 Dec 2023 02:50:14 -0800
Message-ID: <20231205105030.8698-26-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like #DB, when occurred on different ring level, i.e., from user or kernel
context, #MCE needs to be handled on different stack: User #MCE on current
task stack, while kernel #MCE on a dedicated stack.

This is exactly how FRED event delivery invokes an exception handler: ring
3 event on level 0 stack, i.e., current task stack; ring 0 event on the
#MCE dedicated stack specified in the IA32_FRED_STKLVLS MSR. So unlike IDT,
the FRED machine check entry stub doesn't do stack switch.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v5:
* Disallow #DB inside #MCE for robustness sake (Peter Zijlstra).
---
 arch/x86/kernel/cpu/mce/core.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 1642018dd6c9..d524eb87f76c 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -53,6 +53,7 @@
 #include <asm/mce.h>
 #include <asm/msr.h>
 #include <asm/reboot.h>
+#include <asm/fred.h>
 
 #include "internal.h"
 
@@ -2150,6 +2151,31 @@ DEFINE_IDTENTRY_MCE_USER(exc_machine_check)
 	exc_machine_check_user(regs);
 	local_db_restore(dr7);
 }
+
+#ifdef CONFIG_X86_FRED
+/*
+ * When occurred on different ring level, i.e., from user or kernel
+ * context, #MCE needs to be handled on different stack: User #MCE
+ * on current task stack, while kernel #MCE on a dedicated stack.
+ *
+ * This is exactly how FRED event delivery invokes an exception
+ * handler: ring 3 event on level 0 stack, i.e., current task stack;
+ * ring 0 event on the #MCE dedicated stack specified in the
+ * IA32_FRED_STKLVLS MSR. So unlike IDT, the FRED machine check entry
+ * stub doesn't do stack switch.
+ */
+DEFINE_FREDENTRY_MCE(exc_machine_check)
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
2.43.0


