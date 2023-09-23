Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469567AC061
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 12:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607195.945575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzi9-0002UL-Co; Sat, 23 Sep 2023 10:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607195.945575; Sat, 23 Sep 2023 10:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzi9-0002NY-4X; Sat, 23 Sep 2023 10:18:05 +0000
Received: by outflank-mailman (input) for mailman id 607195;
 Sat, 23 Sep 2023 10:18:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xNi6=FH=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qjzce-0000Pn-9w
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 10:12:24 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4eb96da-59f9-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 12:12:04 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:11:53 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:11:53 -0700
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
X-Inumbo-ID: a4eb96da-59f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463924; x=1726999924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kgfFMDbJiu5q1BDcTkBjlFfGWj3DWiVrEUdh+fgWCfs=;
  b=hMUQY4SsiMDV1sTWLNHLkiC7dWH+tV1TUFgPqV0cizeFVKgpcjc/ox/H
   DxkZvzxowt2mQ2fy24L/LvOWVG8TnQu8LMwLy1lmRaCqRWed24a08mBjv
   +rXqMn2KsmVzmJcLmnp34AahKVqQADtJGM59sfJT8cGHrWshLSttA0a2c
   PW3xV2yKLWx2T0NqXYyhj0CRyr3lSHmQupbCza0LVh7+4tUVmbhNEONeT
   y+Y0Fb/PIfVX3QC4uNzcE5A4eDC2mSBDhWnHszQDAtCqy5XJC4raNdXZa
   WI2JLZJRZo6tILV/BzYiMNywjstm1EBMRZqKNXFdwUlmANDq/FLN7N6zq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447492498"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447492498"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813388236"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813388236"
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
Subject: [PATCH v11 35/37] x86/syscall: Split IDT syscall setup code into idt_syscall_init()
Date: Sat, 23 Sep 2023 02:42:10 -0700
Message-Id: <20230923094212.26520-36-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923094212.26520-1-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
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
index 20bbedbf6dcb..2ee4e7b597a3 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2071,10 +2071,8 @@ static void wrmsrl_cstar(unsigned long val)
 		wrmsrl(MSR_CSTAR, val);
 }
 
-/* May not be marked __init: used by software suspend */
-void syscall_init(void)
+static inline void idt_syscall_init(void)
 {
-	wrmsr(MSR_STAR, 0, (__USER32_CS << 16) | __KERNEL_CS);
 	wrmsrl(MSR_LSTAR, (unsigned long)entry_SYSCALL_64);
 
 	if (ia32_enabled()) {
@@ -2108,6 +2106,15 @@ void syscall_init(void)
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


