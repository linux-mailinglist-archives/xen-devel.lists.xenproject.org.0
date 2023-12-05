Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026C8052C2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647596.1011003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATYz-0005bA-6f; Tue, 05 Dec 2023 11:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647596.1011003; Tue, 05 Dec 2023 11:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATYz-0005Zb-2i; Tue, 05 Dec 2023 11:26:05 +0000
Received: by outflank-mailman (input) for mailman id 647596;
 Tue, 05 Dec 2023 11:26:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUc-0003dP-Tx
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:34 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f10460b-9360-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:21:28 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:20 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:21:19 -0800
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
X-Inumbo-ID: 6f10460b-9360-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775289; x=1733311289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ednaCMmFl3XJWL+gfBq22HioBkuQBmZA1PVTbNrlGWM=;
  b=I1g9kkLgd9Uok/KqyuKDoQroB+KZZk44KmQ74ATmJ9fTEq1wIjIqbp1T
   76FpcJ8vDOI7aZs8NT/TTANjM4NTqsbs5JwJV86FYBo6DndroHo8qMJUG
   BqG44YWyk48DO6X3otGJ6TGKF1F3Qx7TfTOwcM7j6tS6PmbBc+nJRqsRe
   4t9myb8VUXgOOZlmz7i2hMqPcccVwQFXsqkw5E/RKUNMj2QM3Na65pVxf
   3Yykc0L24N2nvSYIQ/jfFf+DvgjqtxwUolaMCkNoSRyZlhbYQM8wcW4tx
   imYromX+8DYdNp9D6AwW6Xrzz3Zgr45JpWdqPZ1DwxihcksMONLSj9169
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942439"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942439"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018192936"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018192936"
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
Subject: [PATCH v13 11/35] x86/cpu: Add X86_CR4_FRED macro
Date: Tue,  5 Dec 2023 02:50:00 -0800
Message-ID: <20231205105030.8698-12-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
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
index 68102acd63b0..132f41f7c27f 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -389,9 +389,8 @@ static __always_inline void setup_umip(struct cpuinfo_x86 *c)
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
2.43.0


