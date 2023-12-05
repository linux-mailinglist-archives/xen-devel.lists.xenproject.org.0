Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377908052F8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:34:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647653.1011133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATgs-0007zJ-1J; Tue, 05 Dec 2023 11:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647653.1011133; Tue, 05 Dec 2023 11:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATgr-0007xV-Rg; Tue, 05 Dec 2023 11:34:13 +0000
Received: by outflank-mailman (input) for mailman id 647653;
 Tue, 05 Dec 2023 11:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUg-0003dP-UR
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:38 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 706219f1-9360-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:21:31 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:22 -0800
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
X-Inumbo-ID: 706219f1-9360-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775292; x=1733311292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rAnyLosJqaaOHxof3xhnPHEJruwr0RNdRmdgUfbYES8=;
  b=MPPIMS8y8/fSi2JeoQSP015mOeWEtityefHWgUD5TvTQ1uPHSH42oXvB
   4b2AMG/IxweURv/cyydy2b8xxKTDOh7RtrVIDIZ2i+rci0tyRNoDysASk
   XY4NBx80IM0lRqRXB5BekVMIHtKjvLSDgzGo0DpmQnJ7WdxlUSISKtHA4
   VsPbFvy6szRhKTULsgL8OVdG60ajI1MOq7MAur4ZWu6wrKzbeyPnn0XzZ
   e+/XFouYgBmfkOe31qNWUAwFpnhCWLqga5ix8F52tKorXY6weP6PslR5A
   OR4Fe1EM00221Ecc/tcaruMAqPAwpTRklahq+jOqjdTF3tx5ldGEa+Y1b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942501"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942501"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018192953"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018192953"
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
Subject: [PATCH v13 16/35] x86/fred: Reserve space for the FRED stack frame
Date: Tue,  5 Dec 2023 02:50:05 -0800
Message-ID: <20231205105030.8698-17-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

When using FRED, reserve space at the top of the stack frame, just
like i386 does.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/include/asm/thread_info.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
index d63b02940747..12da7dfd5ef1 100644
--- a/arch/x86/include/asm/thread_info.h
+++ b/arch/x86/include/asm/thread_info.h
@@ -31,7 +31,9 @@
  * In vm86 mode, the hardware frame is much longer still, so add 16
  * bytes to make room for the real-mode segments.
  *
- * x86_64 has a fixed-length stack frame.
+ * x86-64 has a fixed-length stack frame, but it depends on whether
+ * or not FRED is enabled. Future versions of FRED might make this
+ * dynamic, but for now it is always 2 words longer.
  */
 #ifdef CONFIG_X86_32
 # ifdef CONFIG_VM86
@@ -39,8 +41,12 @@
 # else
 #  define TOP_OF_KERNEL_STACK_PADDING 8
 # endif
-#else
-# define TOP_OF_KERNEL_STACK_PADDING 0
+#else /* x86-64 */
+# ifdef CONFIG_X86_FRED
+#  define TOP_OF_KERNEL_STACK_PADDING (2 * 8)
+# else
+#  define TOP_OF_KERNEL_STACK_PADDING 0
+# endif
 #endif
 
 /*
-- 
2.43.0


