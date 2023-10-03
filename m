Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BF7B617D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 08:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611900.951626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZJ0-0006xd-1C; Tue, 03 Oct 2023 06:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611900.951626; Tue, 03 Oct 2023 06:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIz-0006j6-IC; Tue, 03 Oct 2023 06:54:53 +0000
Received: by outflank-mailman (input) for mailman id 611900;
 Tue, 03 Oct 2023 06:54:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwHy=FR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qnZIv-00040o-4O
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 06:54:49 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be004050-61b9-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 08:54:48 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 23:54:41 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2023 23:54:41 -0700
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
X-Inumbo-ID: be004050-61b9-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316088; x=1727852088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nFX1zfVQEUHSVWboxtoxLzmp8lIUuta3YE4l1C8KOLQ=;
  b=Cp7w/UTTdT9K7R5HyNpvMgTjFZ9YGI3SPFY+QjefobfiQG7T7I77KzHt
   AthalVeyVsY817sjaxGfPH6gTRlp68sh29HNslj9WAtHKfh33ta3KZqrE
   nkmTCszvTd3+ggCDAkxDZT6AD3LCP2bXHSeY5GRAguLGJKXGES+8bIDvE
   hxxi1nkgcl5oNY752cCUbu7HNG4GvXSPXxC86SLC+PAxtW+fFq1yUbqFr
   k+XUNQjJKBJYndAO45Ag/e3DX6q+MvudodfYcdIdLIaTsri66S2xLPV5o
   CwDg9C9helq7u3rjh/bZpGCHIMdg+rLi5Cm8/YrUUyHsNVCZwfdr5MFMi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367858052"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367858052"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1081900934"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1081900934"
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
Subject: [PATCH v12 13/37] x86/cpu: Add X86_CR4_FRED macro
Date: Mon,  2 Oct 2023 23:24:34 -0700
Message-Id: <20231003062458.23552-14-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003062458.23552-1-xin3.li@intel.com>
References: <20231003062458.23552-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Add X86_CR4_FRED macro for the FRED bit in %cr4. This bit must not be
changed after initialization, so add it to the pinned CR4 bits.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v9:
* Avoid a type cast by defining X86_CR4_FRED as 0 on 32-bit (Thomas
  Gleixner).
---
 arch/x86/include/uapi/asm/processor-flags.h | 7 +++++++
 arch/x86/kernel/cpu/common.c                | 5 ++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/uapi/asm/processor-flags.h b/arch/x86/include/uapi/asm/processor-flags.h
index d898432947ff..f1a4adc78272 100644
--- a/arch/x86/include/uapi/asm/processor-flags.h
+++ b/arch/x86/include/uapi/asm/processor-flags.h
@@ -139,6 +139,13 @@
 #define X86_CR4_LAM_SUP_BIT	28 /* LAM for supervisor pointers */
 #define X86_CR4_LAM_SUP		_BITUL(X86_CR4_LAM_SUP_BIT)
 
+#ifdef __x86_64__
+#define X86_CR4_FRED_BIT	32 /* enable FRED kernel entry */
+#define X86_CR4_FRED		_BITUL(X86_CR4_FRED_BIT)
+#else
+#define X86_CR4_FRED		(0)
+#endif
+
 /*
  * x86-64 Task Priority Register, CR8
  */
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 736d38abfc5a..9b1cb6c938c4 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -401,9 +401,8 @@ static __always_inline void setup_umip(struct cpuinfo_x86 *c)
 }
 
 /* These bits should not change their value after CPU init is finished. */
-static const unsigned long cr4_pinned_mask =
-	X86_CR4_SMEP | X86_CR4_SMAP | X86_CR4_UMIP |
-	X86_CR4_FSGSBASE | X86_CR4_CET;
+static const unsigned long cr4_pinned_mask = X86_CR4_SMEP | X86_CR4_SMAP | X86_CR4_UMIP |
+					     X86_CR4_FSGSBASE | X86_CR4_CET | X86_CR4_FRED;
 static DEFINE_STATIC_KEY_FALSE_RO(cr_pinning);
 static unsigned long cr4_pinned_bits __ro_after_init;
 
-- 
2.34.1


