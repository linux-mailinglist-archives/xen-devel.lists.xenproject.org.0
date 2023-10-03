Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640B7B6181
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 08:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611891.951549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIs-0004rE-1Q; Tue, 03 Oct 2023 06:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611891.951549; Tue, 03 Oct 2023 06:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIr-0004lo-SU; Tue, 03 Oct 2023 06:54:45 +0000
Received: by outflank-mailman (input) for mailman id 611891;
 Tue, 03 Oct 2023 06:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwHy=FR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qnZIq-00040o-DM
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 06:54:44 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb2d8c7e-61b9-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 08:54:43 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 23:54:37 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2023 23:54:36 -0700
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
X-Inumbo-ID: bb2d8c7e-61b9-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316083; x=1727852083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=peVjyb58aU5czBXdVg55hBuRdCD6fg7woOPGVcAZ2Yw=;
  b=NkX+WIvIe6VCcfNwqDrMew4au/xF95gJ9q7J48JZJ0nMR3Ov5l7DQYbu
   nwxfA56Xxt4EndLD51Gd17IENzYKY57bn8+Jhq5QoKzV2lj0UnjOHbTKw
   3jGq0uO6H455+tI+hSYa9qpXqSx6JuHaZIckJ3jRX2zdf36VGGsu3V6mJ
   faGxymO5AizRe1X9km3dTYHXy6fsaujW8uC+0GI5CNEvPlgfS9ntUcQp/
   B2Y/hWLdhyRR3i6lN4BVF27dUUjeY8XtalcjNPsWJzv3UGnfL5xlvoqYr
   mMYHdbxUrkoU7ox/HUmFc1oayhWPA7VI711aUCncXvm5Im8rW7vIBOjeG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367857955"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367857955"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1081900910"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1081900910"
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
Subject: [PATCH v12 05/37] x86/trapnr: Add event type macros to <asm/trapnr.h>
Date: Mon,  2 Oct 2023 23:24:26 -0700
Message-Id: <20231003062458.23552-6-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003062458.23552-1-xin3.li@intel.com>
References: <20231003062458.23552-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel VT-x classifies events into eight different types, which is
inherited by FRED for event identification. As such, event type
becomes a common x86 concept, and should be defined in a common x86
header.

Add event type macros to <asm/trapnr.h>, and use it in <asm/vmx.h>.

Suggested-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v10:
* A few comment fixes and improvements (Andrew Cooper).
---
 arch/x86/include/asm/trapnr.h | 12 ++++++++++++
 arch/x86/include/asm/vmx.h    | 17 +++++++++--------
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/trapnr.h b/arch/x86/include/asm/trapnr.h
index f5d2325aa0b7..8d1154cdf787 100644
--- a/arch/x86/include/asm/trapnr.h
+++ b/arch/x86/include/asm/trapnr.h
@@ -2,6 +2,18 @@
 #ifndef _ASM_X86_TRAPNR_H
 #define _ASM_X86_TRAPNR_H
 
+/*
+ * Event type codes used by FRED, Intel VT-x and AMD SVM
+ */
+#define EVENT_TYPE_EXTINT	0	// External interrupt
+#define EVENT_TYPE_RESERVED	1
+#define EVENT_TYPE_NMI		2	// NMI
+#define EVENT_TYPE_HWEXC	3	// Hardware originated traps, exceptions
+#define EVENT_TYPE_SWINT	4	// INT n
+#define EVENT_TYPE_PRIV_SWEXC	5	// INT1
+#define EVENT_TYPE_SWEXC	6	// INTO, INT3
+#define EVENT_TYPE_OTHER	7	// FRED SYSCALL/SYSENTER, VT-x MTF
+
 /* Interrupts/Exceptions */
 
 #define X86_TRAP_DE		 0	/* Divide-by-zero */
diff --git a/arch/x86/include/asm/vmx.h b/arch/x86/include/asm/vmx.h
index 0e73616b82f3..4dba17363008 100644
--- a/arch/x86/include/asm/vmx.h
+++ b/arch/x86/include/asm/vmx.h
@@ -17,6 +17,7 @@
 #include <linux/types.h>
 
 #include <uapi/asm/vmx.h>
+#include <asm/trapnr.h>
 #include <asm/vmxfeatures.h>
 
 #define VMCS_CONTROL_BIT(x)	BIT(VMX_FEATURE_##x & 0x1f)
@@ -374,14 +375,14 @@ enum vmcs_field {
 #define VECTORING_INFO_DELIVER_CODE_MASK    	INTR_INFO_DELIVER_CODE_MASK
 #define VECTORING_INFO_VALID_MASK       	INTR_INFO_VALID_MASK
 
-#define INTR_TYPE_EXT_INTR              (0 << 8) /* external interrupt */
-#define INTR_TYPE_RESERVED              (1 << 8) /* reserved */
-#define INTR_TYPE_NMI_INTR		(2 << 8) /* NMI */
-#define INTR_TYPE_HARD_EXCEPTION	(3 << 8) /* processor exception */
-#define INTR_TYPE_SOFT_INTR             (4 << 8) /* software interrupt */
-#define INTR_TYPE_PRIV_SW_EXCEPTION	(5 << 8) /* ICE breakpoint - undocumented */
-#define INTR_TYPE_SOFT_EXCEPTION	(6 << 8) /* software exception */
-#define INTR_TYPE_OTHER_EVENT           (7 << 8) /* other event */
+#define INTR_TYPE_EXT_INTR		(EVENT_TYPE_EXTINT << 8)	/* external interrupt */
+#define INTR_TYPE_RESERVED		(EVENT_TYPE_RESERVED << 8)	/* reserved */
+#define INTR_TYPE_NMI_INTR		(EVENT_TYPE_NMI << 8)		/* NMI */
+#define INTR_TYPE_HARD_EXCEPTION	(EVENT_TYPE_HWEXC << 8)		/* processor exception */
+#define INTR_TYPE_SOFT_INTR		(EVENT_TYPE_SWINT << 8)		/* software interrupt */
+#define INTR_TYPE_PRIV_SW_EXCEPTION	(EVENT_TYPE_PRIV_SWEXC << 8)	/* ICE breakpoint */
+#define INTR_TYPE_SOFT_EXCEPTION	(EVENT_TYPE_SWEXC << 8)		/* software exception */
+#define INTR_TYPE_OTHER_EVENT		(EVENT_TYPE_OTHER << 8)		/* other event */
 
 /* GUEST_INTERRUPTIBILITY_INFO flags. */
 #define GUEST_INTR_STATE_STI		0x00000001
-- 
2.34.1


