Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED5E79FA74
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 07:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601790.938122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgelP-0006gR-QF; Thu, 14 Sep 2023 05:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601790.938122; Thu, 14 Sep 2023 05:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgelO-0006Dz-Tf; Thu, 14 Sep 2023 05:19:38 +0000
Received: by outflank-mailman (input) for mailman id 601790;
 Thu, 14 Sep 2023 05:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZLI=E6=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qgelD-0001XI-Pa
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 05:19:27 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 455699f5-52be-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 07:19:25 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 22:17:38 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 22:17:38 -0700
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
X-Inumbo-ID: 455699f5-52be-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694668766; x=1726204766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f4gesqgoemAM7gLIVW0tfHuShJv23oH28+TguMOULZ8=;
  b=BSplR6hjGD9hQ5K/ymN787jSWRqWTYIWUAXMZsK9JmGiGoqJXoGGLqde
   /w9WYjHMgDON4UVFWaFPT2UmiUzj1+SnVTZCG9uFVhsaziJCOry//mqdR
   pZtmPNZFz+IkNdgo6ZWaKRyRTmgge8gUuNHLj0TE51IJ9nmb4e13wH1k6
   xn+vHv43PBhRDfJyPCmtQB1h2Bcs8egu/qgZxnQHUEs4baeCAKy1D7chJ
   Q7aeDLoXZn/hjvXytzM8NmnpsPuZpIqcQuvKN9S3UyfyNKfQOy5XBuhuE
   N+ugtTukiEMAMQUI8ZtcHBeR6ACAec7rmM31cR9ArIVeUbvublmlfSqC1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382661301"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="382661301"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779488793"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="779488793"
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
	jiangshanlai@gmail.com
Subject: [PATCH v10 18/38] x86/fred: Reserve space for the FRED stack frame
Date: Wed, 13 Sep 2023 21:47:45 -0700
Message-Id: <20230914044805.301390-19-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914044805.301390-1-xin3.li@intel.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
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
2.34.1


