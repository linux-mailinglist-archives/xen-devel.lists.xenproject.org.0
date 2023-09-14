Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE13F79FAE0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 07:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601922.938290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgeyn-0007Bh-Uh; Thu, 14 Sep 2023 05:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601922.938290; Thu, 14 Sep 2023 05:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgeyn-00079B-Rj; Thu, 14 Sep 2023 05:33:29 +0000
Received: by outflank-mailman (input) for mailman id 601922;
 Thu, 14 Sep 2023 05:33:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZLI=E6=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qgelT-0001XI-2f
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 05:19:43 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4db2f59c-52be-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 07:19:39 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 22:17:48 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 22:17:47 -0700
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
X-Inumbo-ID: 4db2f59c-52be-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694668780; x=1726204780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DfU6e7Lxi3caIgHaas3RwgcYA9izTEYulGU0upU0hWQ=;
  b=C2qSgSliymajvEnf/caBa0OMsph2kLxROcw2fpnHpdbIeXh1YLgG6gvc
   JFZKVBUXx+5neaXw/Nl+HS9iqsNLYFHP5E56NwhAiZwRQguabQ60XgEB4
   iUlSLIbPZrU74Mp8O/ltxGGviX7WlMQGSSHXwHPXyXyPp/BYgBs+7zJAL
   dsVkh2SThVsspdP/UJ3YHfLPgFtg/HWIk4XF+jWMMqkj3fiL39Z3i2Rvm
   h0nR9Dygy1ElvA8RHkFMldYhZvgdj9Z0jmyATSXuLK0oDW4uPJng5PuE6
   f1no63Z4sCBxwfcBbNlOz0CP9Ca0lB86uFUVmRBvCiyHCj7v4F/B+d/6z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382661536"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="382661536"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779488847"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="779488847"
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
Subject: [PATCH v10 36/38] x86/fred: Add fred_syscall_init()
Date: Wed, 13 Sep 2023 21:48:03 -0700
Message-Id: <20230914044805.301390-37-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914044805.301390-1-xin3.li@intel.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Add a syscall initialization function fred_syscall_init() for FRED,
and this is really just to skip setting up SYSCALL/SYSENTER related
MSRs, e.g., MSR_LSTAR and invalidate SYSENTER configurations, because
FRED uses the ring 3 FRED entrypoint for SYSCALL and SYSENTER, and
ERETU is the only legit instruction to return to ring 3 per FRED spec
5.0.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/kernel/cpu/common.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index d960b7276008..4cb36e241c9a 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2105,6 +2105,23 @@ static inline void idt_syscall_init(void)
 	       X86_EFLAGS_AC|X86_EFLAGS_ID);
 }
 
+static inline void fred_syscall_init(void)
+{
+	/*
+	 * Per FRED spec 5.0, FRED uses the ring 3 FRED entrypoint for SYSCALL
+	 * and SYSENTER, and ERETU is the only legit instruction to return to
+	 * ring 3, as a result there is _no_ need to setup the SYSCALL and
+	 * SYSENTER MSRs.
+	 *
+	 * Note, both sysexit and sysret cause #UD when FRED is enabled.
+	 */
+	wrmsrl(MSR_LSTAR, 0ULL);
+	wrmsrl_cstar(0ULL);
+	wrmsrl_safe(MSR_IA32_SYSENTER_CS, (u64)GDT_ENTRY_INVALID_SEG);
+	wrmsrl_safe(MSR_IA32_SYSENTER_ESP, 0ULL);
+	wrmsrl_safe(MSR_IA32_SYSENTER_EIP, 0ULL);
+}
+
 /* May not be marked __init: used by software suspend */
 void syscall_init(void)
 {
-- 
2.34.1


