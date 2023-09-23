Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23C97AC062
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 12:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607201.945609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjziF-0003i1-Dx; Sat, 23 Sep 2023 10:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607201.945609; Sat, 23 Sep 2023 10:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjziF-0003dt-8f; Sat, 23 Sep 2023 10:18:11 +0000
Received: by outflank-mailman (input) for mailman id 607201;
 Sat, 23 Sep 2023 10:18:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xNi6=FH=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qjzcR-0000Pn-8X
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 10:12:11 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a23b9b89-59f9-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 12:12:00 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:11:49 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:11:49 -0700
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
X-Inumbo-ID: a23b9b89-59f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463920; x=1726999920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bNtEfhEic2/4eI6U3F6LZD3GtdQN7TZ08d/4AOd+L9I=;
  b=Rt0zsDyJHjfvmDn4jENCKULsFcR4vk4HdUdBnh7htuEG05/tzI3yzbnM
   quTYVGv3NCqFVI4thXj6hB9dgKDTA7I89E2p+0xBpvmoiIQUTgac4bLuu
   HQ4LyaMrTQeQVCMfb/tKmS/IEvk2oQZVK9OcKe9tOn/EmUOgASwcLqr/i
   C7XsBUl/XxNmbFene1VP8AxLqGYB3ym4xsbikSL5BWtGlkvZ+cvvq4IsF
   7lVWoC/02iLk6s9uiQiJA+dsxeAc3Hi0ygaWIcJn9r8ETmj7/+PjAyqV5
   fuAebLg9JT293A4AYSJkXiP7va5M+Tx05Qd1PsiW2sGAE3xEKrzZmuzUp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447492400"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447492400"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813388196"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813388196"
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
Subject: [PATCH v11 27/37] x86/fred: Add a machine check entry stub for FRED
Date: Sat, 23 Sep 2023 02:42:02 -0700
Message-Id: <20230923094212.26520-28-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923094212.26520-1-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
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
index 6f35f724cc14..da0a4a102afe 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -52,6 +52,7 @@
 #include <asm/mce.h>
 #include <asm/msr.h>
 #include <asm/reboot.h>
+#include <asm/fred.h>
 
 #include "internal.h"
 
@@ -2144,6 +2145,31 @@ DEFINE_IDTENTRY_MCE_USER(exc_machine_check)
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
2.34.1


