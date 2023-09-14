Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D97279FAE4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 07:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601942.938331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgezs-00023M-2R; Thu, 14 Sep 2023 05:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601942.938331; Thu, 14 Sep 2023 05:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgezr-00021A-V0; Thu, 14 Sep 2023 05:34:35 +0000
Received: by outflank-mailman (input) for mailman id 601942;
 Thu, 14 Sep 2023 05:34:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZLI=E6=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qgelH-0001X7-Eo
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 05:19:31 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 482bd31d-52be-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 07:19:30 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 22:17:43 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 22:17:42 -0700
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
X-Inumbo-ID: 482bd31d-52be-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694668770; x=1726204770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FcZc1QeKj2isPTwOBVaGNTy+si5WeOaciLFU4yv7EQo=;
  b=mQELh168oyoE8sL+D7H9Xji/wkhViCObf6CpsxfAZy2XWs92/l+N8clv
   bOFx+n9zjMblyj3wICxUo+ALkTyVwPcgh64llM+ziIG8j7gUgYyOFHwlZ
   +BMLSQH4ii8WlWdj9LRRavGlH8DKIivYTdzPePmF+TFlWyJtOu1f4k20E
   pf1U7LwYZeWnhWUED4bt1RrOIOi5tSfrnWIcDZFOnzJlOX9YsqDMS+H5l
   sRqbnelL6eN69QLGEeGJZeE0jI5aFt+cKMVESZzJnn9ErPAguw/FXKZIr
   vvcEVCqKNF22q9+XPoING+q3wsndMhjaUIIMzb/5Le35p1XTqWnz2P0qd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382661408"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="382661408"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779488817"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="779488817"
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
Subject: [PATCH v10 26/38] x86/fred: Add a NMI entry stub for FRED
Date: Wed, 13 Sep 2023 21:47:53 -0700
Message-Id: <20230914044805.301390-27-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914044805.301390-1-xin3.li@intel.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

On a FRED system, NMIs nest both with themselves and faults, transient
information is saved into the stack frame, and NMI unblocking only
happens when the stack frame indicates that so should happen.

Thus, the NMI entry stub for FRED is really quite small...

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/kernel/nmi.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index a0c551846b35..58843fdf5cd0 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -34,6 +34,7 @@
 #include <asm/cache.h>
 #include <asm/nospec-branch.h>
 #include <asm/sev.h>
+#include <asm/fred.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/nmi.h>
@@ -643,6 +644,33 @@ void nmi_backtrace_stall_check(const struct cpumask *btp)
 
 #endif
 
+#ifdef CONFIG_X86_FRED
+/*
+ * With FRED, CR2/DR6 is pushed to #PF/#DB stack frame during FRED
+ * event delivery, i.e., there is no problem of transient states.
+ * And NMI unblocking only happens when the stack frame indicates
+ * that so should happen.
+ *
+ * Thus, the NMI entry stub for FRED is really straightforward and
+ * as simple as most exception handlers. As such, #DB is allowed
+ * during NMI handling.
+ */
+DEFINE_FREDENTRY_NMI(exc_nmi)
+{
+	irqentry_state_t irq_state;
+
+	if (IS_ENABLED(CONFIG_SMP) && arch_cpu_is_offline(smp_processor_id()))
+		return;
+
+	irq_state = irqentry_nmi_enter(regs);
+
+	inc_irq_stat(__nmi_count);
+	default_do_nmi(regs);
+
+	irqentry_nmi_exit(regs, irq_state);
+}
+#endif
+
 void stop_nmi(void)
 {
 	ignore_nmis++;
-- 
2.34.1


