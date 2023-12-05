Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911C88052D6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647614.1011043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATbR-0000Yp-9I; Tue, 05 Dec 2023 11:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647614.1011043; Tue, 05 Dec 2023 11:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATbR-0000VR-5v; Tue, 05 Dec 2023 11:28:37 +0000
Received: by outflank-mailman (input) for mailman id 647614;
 Tue, 05 Dec 2023 11:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUt-0003dP-VV
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:51 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 751beeef-9360-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:21:38 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:27 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:21:26 -0800
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
X-Inumbo-ID: 751beeef-9360-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775300; x=1733311300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UVhP7f+75Ax+FxvYCkHZURx9ZVwCqbLITZRLMgz0Nr0=;
  b=GmWxsUBBhd1slAkZzx9RFtv19DACoJq+oMKuRy+URTqiorKHVoMS8zTH
   pw0eXCQT80r08CEVTOr///1FLP21QkE4YSScdhOb5tDOVlZtbyOxyc0vp
   69Ek2F/UhX8aMq4JLJVw3TEMtveqEGVnSCQyYcwCi/aQKVS2BMivFlUF1
   DypkB2swzJUoeTq9Mk3++rONf6TkmuCjd2kgqkFqtin/IAPTehA/2KQqE
   l6RCrPw3tFtQZNWbIJhs+ndJZu+blfjQz0PVsikKyIF6DVpJdABw1HWDM
   SOzLw8zYWbWwLa9ELs4TAZs4XMpz6TIqX9nhNAzl610rsMlIBbPjOhpWs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942706"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942706"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018193015"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018193015"
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
Subject: [PATCH v13 33/35] x86/syscall: Split IDT syscall setup code into idt_syscall_init()
Date: Tue,  5 Dec 2023 02:50:22 -0800
Message-ID: <20231205105030.8698-34-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because FRED uses the ring 3 FRED entrypoint for SYSCALL and SYSENTER and
ERETU is the only legit instruction to return to ring 3, there is NO need
to setup SYSCALL and SYSENTER MSRs for FRED, except the IA32_STAR MSR.

Split IDT syscall setup code into idt_syscall_init() to make it easy to
skip syscall setup code when FRED is enabled.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/kernel/cpu/common.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 132f41f7c27f..9a075792e275 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2076,10 +2076,8 @@ static void wrmsrl_cstar(unsigned long val)
 		wrmsrl(MSR_CSTAR, val);
 }
 
-/* May not be marked __init: used by software suspend */
-void syscall_init(void)
+static inline void idt_syscall_init(void)
 {
-	wrmsr(MSR_STAR, 0, (__USER32_CS << 16) | __KERNEL_CS);
 	wrmsrl(MSR_LSTAR, (unsigned long)entry_SYSCALL_64);
 
 	if (ia32_enabled()) {
@@ -2113,6 +2111,15 @@ void syscall_init(void)
 	       X86_EFLAGS_AC|X86_EFLAGS_ID);
 }
 
+/* May not be marked __init: used by software suspend */
+void syscall_init(void)
+{
+	/* The default user and kernel segments */
+	wrmsr(MSR_STAR, 0, (__USER32_CS << 16) | __KERNEL_CS);
+
+	idt_syscall_init();
+}
+
 #else	/* CONFIG_X86_64 */
 
 #ifdef CONFIG_STACKPROTECTOR
-- 
2.43.0


