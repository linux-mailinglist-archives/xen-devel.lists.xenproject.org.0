Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3B979FA72
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 07:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601781.938037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgelC-0003aa-9m; Thu, 14 Sep 2023 05:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601781.938037; Thu, 14 Sep 2023 05:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgelB-0003NK-Qp; Thu, 14 Sep 2023 05:19:25 +0000
Received: by outflank-mailman (input) for mailman id 601781;
 Thu, 14 Sep 2023 05:19:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZLI=E6=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qgel8-0001XI-MN
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 05:19:22 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4251e417-52be-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 07:19:20 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 22:17:34 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 22:17:33 -0700
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
X-Inumbo-ID: 4251e417-52be-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694668760; x=1726204760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lOSfyYhj6fFAdH4YWvO21Rsoh1uWrkdsP+wGjxpQoYw=;
  b=e0E+ypmtQ3F1lqdO6RrClcVI4VMrFjkMuXR7Fi6AbXX9Ny5XfeZqffQQ
   nNuo3H6vl5O8OwZNrK8TV/JZDiMeG0f6udxyDsio7SlGPwmhSbXQahOV/
   NdYQvK3F6XVWPhjwb98VIw4NDsEk+zz8c3V9QiQJFH38FTxaowhe/Seoi
   yxzJ8p3w5bbmBdBxaMuHrM7GNGB81oMHKkr9b8sZj0EOhX+1nD8ZQTa7T
   K59/zl0C1VdqtzE5KW/RlJXr1r+q5gPIa1qSKVjApb+C53m2dUl4DzU3m
   au6LXbh5ujoLVd5yV6b2mCfyTJuZaAFc/t/56XzdTDFHc/P71m7Q+sJNV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382661186"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="382661186"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779488764"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="779488764"
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
Subject: [PATCH v10 09/38] x86/fred: Disable FRED support if CONFIG_X86_FRED is disabled
Date: Wed, 13 Sep 2023 21:47:36 -0700
Message-Id: <20230914044805.301390-10-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914044805.301390-1-xin3.li@intel.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Add CONFIG_X86_FRED to <asm/disabled-features.h> to make
cpu_feature_enabled() work correctly with FRED.

Originally-by: Megha Dey <megha.dey@intel.com>
Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/include/asm/disabled-features.h       | 8 +++++++-
 tools/arch/x86/include/asm/disabled-features.h | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/disabled-features.h b/arch/x86/include/asm/disabled-features.h
index 702d93fdd10e..3cde57cb5093 100644
--- a/arch/x86/include/asm/disabled-features.h
+++ b/arch/x86/include/asm/disabled-features.h
@@ -117,6 +117,12 @@
 #define DISABLE_IBT	(1 << (X86_FEATURE_IBT & 31))
 #endif
 
+#ifdef CONFIG_X86_FRED
+# define DISABLE_FRED	0
+#else
+# define DISABLE_FRED	(1 << (X86_FEATURE_FRED & 31))
+#endif
+
 /*
  * Make sure to add features to the correct mask
  */
@@ -134,7 +140,7 @@
 #define DISABLED_MASK11	(DISABLE_RETPOLINE|DISABLE_RETHUNK|DISABLE_UNRET| \
 			 DISABLE_CALL_DEPTH_TRACKING|DISABLE_USER_SHSTK)
 #define DISABLED_MASK12	(DISABLE_LAM)
-#define DISABLED_MASK13	0
+#define DISABLED_MASK13	(DISABLE_FRED)
 #define DISABLED_MASK14	0
 #define DISABLED_MASK15	0
 #define DISABLED_MASK16	(DISABLE_PKU|DISABLE_OSPKE|DISABLE_LA57|DISABLE_UMIP| \
diff --git a/tools/arch/x86/include/asm/disabled-features.h b/tools/arch/x86/include/asm/disabled-features.h
index fafe9be7a6f4..d540ecdd8812 100644
--- a/tools/arch/x86/include/asm/disabled-features.h
+++ b/tools/arch/x86/include/asm/disabled-features.h
@@ -105,6 +105,12 @@
 # define DISABLE_TDX_GUEST	(1 << (X86_FEATURE_TDX_GUEST & 31))
 #endif
 
+#ifdef CONFIG_X86_FRED
+# define DISABLE_FRED	0
+#else
+# define DISABLE_FRED	(1 << (X86_FEATURE_FRED & 31))
+#endif
+
 /*
  * Make sure to add features to the correct mask
  */
@@ -122,7 +128,7 @@
 #define DISABLED_MASK11	(DISABLE_RETPOLINE|DISABLE_RETHUNK|DISABLE_UNRET| \
 			 DISABLE_CALL_DEPTH_TRACKING)
 #define DISABLED_MASK12	(DISABLE_LAM)
-#define DISABLED_MASK13	0
+#define DISABLED_MASK13	(DISABLE_FRED)
 #define DISABLED_MASK14	0
 #define DISABLED_MASK15	0
 #define DISABLED_MASK16	(DISABLE_PKU|DISABLE_OSPKE|DISABLE_LA57|DISABLE_UMIP| \
-- 
2.34.1


