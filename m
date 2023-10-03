Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB3B7B6223
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 09:06:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611991.951873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZUW-0000Pf-3s; Tue, 03 Oct 2023 07:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611991.951873; Tue, 03 Oct 2023 07:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZUW-0000LI-0U; Tue, 03 Oct 2023 07:06:48 +0000
Received: by outflank-mailman (input) for mailman id 611991;
 Tue, 03 Oct 2023 07:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwHy=FR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qnZJ6-00047B-7x
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 06:55:00 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c27dbca9-61b9-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 08:54:55 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 23:54:48 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2023 23:54:47 -0700
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
X-Inumbo-ID: c27dbca9-61b9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316095; x=1727852095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FcZc1QeKj2isPTwOBVaGNTy+si5WeOaciLFU4yv7EQo=;
  b=BbKo73uHCaX15YH0ctt3j322eQ06JhpfZQ9/5Fo1y90aTmJYBxMPrsAw
   x4rXECJjPlD/a8Q4auFabXlgoYUoi2bqHOOclKOYIurqsamqinrSCAvLZ
   1UenzrzHzPbWTDn7zV6lwGKGKmyNqpDh0VRaHTKNS91CDwy0ZXk2XeeGp
   tdXHK76RYOmAsMCvrb1sy21gSIEw3vLTYRCXEsp2ywOh50teYPo9fcaBs
   6O185UvWGaGw4OH3Q5IEY0NHPpX2TFB1iZFu+MddI3SjgMEO37jKeTe8/
   tUreHJbPP2s3uDF/9mzsu2G1MabltB2rs8rSYeZOCScx+fXy607C1D/25
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367858230"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367858230"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1081900982"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1081900982"
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
Subject: [PATCH v12 26/37] x86/fred: Add a NMI entry stub for FRED
Date: Mon,  2 Oct 2023 23:24:47 -0700
Message-Id: <20231003062458.23552-27-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003062458.23552-1-xin3.li@intel.com>
References: <20231003062458.23552-1-xin3.li@intel.com>
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


