Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 970C77B6173
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 08:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611892.951562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIt-0005Gv-BB; Tue, 03 Oct 2023 06:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611892.951562; Tue, 03 Oct 2023 06:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIt-0005DN-3s; Tue, 03 Oct 2023 06:54:47 +0000
Received: by outflank-mailman (input) for mailman id 611892;
 Tue, 03 Oct 2023 06:54:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwHy=FR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qnZIq-00047B-QJ
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 06:54:44 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b97ceffa-61b9-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 08:54:41 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 23:54:36 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2023 23:54:35 -0700
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
X-Inumbo-ID: b97ceffa-61b9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316081; x=1727852081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9qsPaAmdkqHl0KD85EKfAfnheAb+UY4gBzEbjksg7Tw=;
  b=W9u8uI6aJelwA58zVAlYn3k10F4CqDENxhnUxIge7G0X9maA4yjSNI4d
   cHWwxnkjjozjRFg4V6JzW6VewpKcXb8+Pwl508n16L35+z205rin6DQsS
   ErTIY2TCBSidzXEnSRCDoSl9S0iboWiYg87qbgoqTwVRZrhI/Bb+iJOHJ
   kuUcwoXRIfoDFWfESlYBaKSRb1Cw141ln/whMguomto6zY+mSe/haIlNx
   aOHj/6+bSzeG0GBq0fY8ckTGMWXN28piD82LvltgHTlOGqyFOsr44RliZ
   COLVFtjZ2o6Ustnf18f+Hyvn20BQ6wVnN1XzITvKwQFk9PCPCfIFsBHZv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367857927"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367857927"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1081900902"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1081900902"
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
Subject: [PATCH v12 03/37] x86/msr: Add the WRMSRNS instruction support
Date: Mon,  2 Oct 2023 23:24:24 -0700
Message-Id: <20231003062458.23552-4-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003062458.23552-1-xin3.li@intel.com>
References: <20231003062458.23552-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an always inline API __wrmsrns() to embed the WRMSRNS instruction
into the code.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/include/asm/msr.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 65ec1965cd28..c284ff9ebe67 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -97,6 +97,19 @@ static __always_inline void __wrmsr(unsigned int msr, u32 low, u32 high)
 		     : : "c" (msr), "a"(low), "d" (high) : "memory");
 }
 
+/*
+ * WRMSRNS behaves exactly like WRMSR with the only difference being
+ * that it is not a serializing instruction by default.
+ */
+static __always_inline void __wrmsrns(u32 msr, u32 low, u32 high)
+{
+	/* Instruction opcode for WRMSRNS; supported in binutils >= 2.40. */
+	asm volatile("1: .byte 0x0f,0x01,0xc6\n"
+		     "2:\n"
+		     _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR)
+		     : : "c" (msr), "a"(low), "d" (high));
+}
+
 #define native_rdmsr(msr, val1, val2)			\
 do {							\
 	u64 __val = __rdmsr((msr));			\
@@ -297,6 +310,11 @@ do {							\
 
 #endif	/* !CONFIG_PARAVIRT_XXL */
 
+static __always_inline void wrmsrns(u32 msr, u64 val)
+{
+	__wrmsrns(msr, val, val >> 32);
+}
+
 /*
  * 64-bit version of wrmsr_safe():
  */
-- 
2.34.1


