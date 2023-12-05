Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37E68052DF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647626.1011073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATcl-0002qA-63; Tue, 05 Dec 2023 11:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647626.1011073; Tue, 05 Dec 2023 11:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATcl-0002oQ-2N; Tue, 05 Dec 2023 11:29:59 +0000
Received: by outflank-mailman (input) for mailman id 647626;
 Tue, 05 Dec 2023 11:29:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUf-0003dP-UB
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:37 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7049dbef-9360-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:21:30 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:21 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:21:20 -0800
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
X-Inumbo-ID: 7049dbef-9360-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775292; x=1733311292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1ausx4Z+ZyraUX+YcuvtrDimsqYt0aM/gmBdfI6uiWo=;
  b=MwjJWuhSj0q+AcEqPm8Xn8+7dUDlbN4+PM8/mxPevlmmr8UeskRhXx6F
   AQfomNO3Jx5S2zR5u9VAMEGgTBbMtfjiOEeJLr3TdgWYGRuXvulVc/olD
   jsRQqNBN6PHYqBzQEruSnEER9IhnzxATp7NpZ2YAraG3cZtb6dCOl95/h
   n1sTtzxsGzOpWZIJ4qVZDEkPJNeLvc+zWOPXPXdNxhslELYFdvJssUV7B
   HdYVhhsRRftZY3ze3IJlCuU2JbtdhpvcLwOBTws4sSmoaUkJyUcA6uOxE
   NGhbB+osQfFUtyuDjNlhkMYyN4R6ZgoelOHAFQXPCiqm9rqXnXdXLiIFA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942488"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942488"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018192949"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018192949"
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
Subject: [PATCH v13 15/35] x86/fred: Add a new header file for FRED definitions
Date: Tue,  5 Dec 2023 02:50:04 -0800
Message-ID: <20231205105030.8698-16-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
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
 arch/x86/include/asm/fred.h | 68 +++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 arch/x86/include/asm/fred.h

diff --git a/arch/x86/include/asm/fred.h b/arch/x86/include/asm/fred.h
new file mode 100644
index 000000000000..f514fdb5a39f
--- /dev/null
+++ b/arch/x86/include/asm/fred.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Macros for Flexible Return and Event Delivery (FRED)
+ */
+
+#ifndef ASM_X86_FRED_H
+#define ASM_X86_FRED_H
+
+#include <linux/const.h>
+
+#include <asm/asm.h>
+
+/*
+ * FRED event return instruction opcodes for ERET{S,U}; supported in
+ * binutils >= 2.41.
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
+ * Used for the return address for call emulation during code patching,
+ * and measured in 64-byte cache lines.
+ */
+#define FRED_CONFIG_REDZONE_AMOUNT	1
+#define FRED_CONFIG_REDZONE		(_AT(unsigned long, FRED_CONFIG_REDZONE_AMOUNT) << 6)
+#define FRED_CONFIG_INT_STKLVL(l)	(_AT(unsigned long, l) << 9)
+#define FRED_CONFIG_ENTRYPOINT(p)	_AT(unsigned long, (p))
+
+#ifndef __ASSEMBLY__
+
+#ifdef CONFIG_X86_FRED
+#include <linux/kernel.h>
+
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
+#else /* CONFIG_X86_FRED */
+static __always_inline unsigned long fred_event_data(struct pt_regs *regs) { return 0; }
+#endif /* CONFIG_X86_FRED */
+#endif /* !__ASSEMBLY__ */
+
+#endif /* ASM_X86_FRED_H */
-- 
2.43.0


