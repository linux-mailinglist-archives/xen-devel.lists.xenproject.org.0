Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA779FA62
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 07:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601776.937997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgel8-0002an-PB; Thu, 14 Sep 2023 05:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601776.937997; Thu, 14 Sep 2023 05:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgel8-0002Rd-Ee; Thu, 14 Sep 2023 05:19:22 +0000
Received: by outflank-mailman (input) for mailman id 601776;
 Thu, 14 Sep 2023 05:19:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZLI=E6=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qgel5-0001XI-Uu
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 05:19:19 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f0a52cb-52be-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 07:19:16 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 22:17:30 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 22:17:30 -0700
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
X-Inumbo-ID: 3f0a52cb-52be-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694668756; x=1726204756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9qsPaAmdkqHl0KD85EKfAfnheAb+UY4gBzEbjksg7Tw=;
  b=nRUHIN0Mlmrz2tja9fiX4yuhSrC5RBbkI1D7fprYxzF71NHxt4nHitE9
   bY3otDvfT6egW1MvqpVPVRJz6BV6b10X6zxBJdEaMCZLF3GKQYLRAXi7k
   +edHcA9DB0+xfp8tQLWEjDEgZpbC/OFrXPfGEpoCyZGSE62npLGfrrNbH
   Hsui4Ska3mEAzYsn9C0S8yi9yCwqZ+lULF11VGu7j0RMMn4GSk0eGShCI
   TxEvkPO/uw3WVQLXGSpNE8ooSa/bZCfVv3DevBDfVptutU33OgV58J5gS
   71rEUA0orW1RqO1lJKSxCh7bgW1QdOQ0eySOPjcTdnAN9Ogene1lkbsdB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382661106"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="382661106"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779488743"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="779488743"
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
Subject: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
Date: Wed, 13 Sep 2023 21:47:30 -0700
Message-Id: <20230914044805.301390-4-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914044805.301390-1-xin3.li@intel.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
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


