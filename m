Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F07D7B6203
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 09:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611923.951723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZRG-0008Lj-Kl; Tue, 03 Oct 2023 07:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611923.951723; Tue, 03 Oct 2023 07:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZRG-0008Je-Hx; Tue, 03 Oct 2023 07:03:26 +0000
Received: by outflank-mailman (input) for mailman id 611923;
 Tue, 03 Oct 2023 07:03:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwHy=FR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qnZJA-00040o-PE
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 06:55:04 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6219426-61b9-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 08:55:01 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 23:54:53 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2023 23:54:52 -0700
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
X-Inumbo-ID: c6219426-61b9-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316102; x=1727852102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KVAH30AJVp6O2e8FLYlwUzaPcwlh2ELK9dDq37AIdDs=;
  b=XNthX3KFPH8s237RumIq/Zv9SpOIlEgSSHL/cuTN5UYICgyar/UFTWBc
   v4i8haVxbMFuPT/xxWiuvOzy9O/t5HspWpnYu2+ewwTNrSw9eymOkEpdP
   vqeqcU7gAkPAnjC1whTq9xEkXf/bXcREWq97CQ1x6pk2Sbz/An5S5lULK
   fcRNxASE2AEPyHVFLQi/50w04XQ9F3FVe4Pj9jsu9HqZLbc7+j15RPIxp
   OdfCKauHuoVbkx04jNVqq/isvBIxyBANqRrGdx1xIEP3DzTUAikwSAfMO
   XOp9+DYVba6IE4NxaIWZ7gTUvXqOqDdGxOsYf6lr5KZKFNP/PBukl8Wg/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367858351"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367858351"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1081901025"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1081901025"
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
Subject: [PATCH v12 35/37] x86/syscall: Split IDT syscall setup code into idt_syscall_init()
Date: Mon,  2 Oct 2023 23:24:56 -0700
Message-Id: <20231003062458.23552-36-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003062458.23552-1-xin3.li@intel.com>
References: <20231003062458.23552-1-xin3.li@intel.com>
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
index 9b1cb6c938c4..69f9bdab19a9 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2078,10 +2078,8 @@ static void wrmsrl_cstar(unsigned long val)
 		wrmsrl(MSR_CSTAR, val);
 }
 
-/* May not be marked __init: used by software suspend */
-void syscall_init(void)
+static inline void idt_syscall_init(void)
 {
-	wrmsr(MSR_STAR, 0, (__USER32_CS << 16) | __KERNEL_CS);
 	wrmsrl(MSR_LSTAR, (unsigned long)entry_SYSCALL_64);
 
 	if (ia32_enabled()) {
@@ -2115,6 +2113,15 @@ void syscall_init(void)
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
2.34.1


