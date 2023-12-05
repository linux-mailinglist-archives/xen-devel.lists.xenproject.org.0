Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B66D6805210
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647568.1010924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATUg-0006li-5O; Tue, 05 Dec 2023 11:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647568.1010924; Tue, 05 Dec 2023 11:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATUf-0006do-N0; Tue, 05 Dec 2023 11:21:37 +0000
Received: by outflank-mailman (input) for mailman id 647568;
 Tue, 05 Dec 2023 11:21:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUd-0005GD-2c
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:35 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7254f875-9360-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 12:21:34 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:24 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:21:22 -0800
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
X-Inumbo-ID: 7254f875-9360-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775295; x=1733311295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0MXczFK3xOQViMofjzuL8bjmZe4faEq58HCGtZP2g9c=;
  b=L/XFE+VJ8BD89duxqUzniC6bhdtnpdLq/KHj1Cgj/PWCpSQX/i1RTRWj
   HsuqXEMslKruTmUMRNMZj2TGIBzXwctH9BDQ0buEwXlRCwU4agmLFokOA
   pTe8iOr2ofPiJ8my7Edd1dQNQFW8P630miVUbhT7cM3vqqiOFDPrHt15V
   I14r0cRvDuhTu5IChQ91CYuIvaZWw2preKLkVPaz9hBAdm5rDkE8dYAQ4
   DFtwxC2OdliaWFBT0ihLI+Tr35C29ErSJA0AMY3JJTqFvxrYbfY+JJ193
   4PYEfkgnPSiSqnhaf3dWdCXQH6+qKqamkDPEWvU1xq9Lzg+YhGBSfkzO4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942565"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942565"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018192972"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018192972"
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
Subject: [PATCH v13 21/35] x86/fred: Make exc_page_fault() work for FRED
Date: Tue,  5 Dec 2023 02:50:10 -0800
Message-ID: <20231205105030.8698-22-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

On a FRED system, the faulting address (CR2) is passed on the stack,
to avoid the problem of transient state.  Thus the page fault address
is read from the FRED stack frame instead of CR2 when FRED is enabled.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Change since v12:
* No "we" in a commit message, use passive voice (Borislav Petkov).
---
 arch/x86/mm/fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index ab778eac1952..7675bc067153 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -34,6 +34,7 @@
 #include <asm/kvm_para.h>		/* kvm_handle_async_pf		*/
 #include <asm/vdso.h>			/* fixup_vdso_exception()	*/
 #include <asm/irq_stack.h>
+#include <asm/fred.h>
 
 #define CREATE_TRACE_POINTS
 #include <asm/trace/exceptions.h>
@@ -1516,8 +1517,10 @@ handle_page_fault(struct pt_regs *regs, unsigned long error_code,
 
 DEFINE_IDTENTRY_RAW_ERRORCODE(exc_page_fault)
 {
-	unsigned long address = read_cr2();
 	irqentry_state_t state;
+	unsigned long address;
+
+	address = cpu_feature_enabled(X86_FEATURE_FRED) ? fred_event_data(regs) : read_cr2();
 
 	prefetchw(&current->mm->mmap_lock);
 
-- 
2.43.0


