Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3747A815824
	for <lists+xen-devel@lfdr.de>; Sat, 16 Dec 2023 08:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655462.1023227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEOhG-0003uJ-50; Sat, 16 Dec 2023 07:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655462.1023227; Sat, 16 Dec 2023 07:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEOhG-0003rc-16; Sat, 16 Dec 2023 07:02:50 +0000
Received: by outflank-mailman (input) for mailman id 655462;
 Sat, 16 Dec 2023 07:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fbHy=H3=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rEOhD-0003kT-Rd
 for xen-devel@lists.xenproject.org; Sat, 16 Dec 2023 07:02:48 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c644f0b-9be1-11ee-98eb-6d05b1d4d9a1;
 Sat, 16 Dec 2023 08:02:46 +0100 (CET)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 23:02:43 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga002.fm.intel.com with ESMTP; 15 Dec 2023 23:02:42 -0800
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
X-Inumbo-ID: 1c644f0b-9be1-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702710166; x=1734246166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lOQJTvu9nXAtsh+1v9ZBLjUIH0wLI8goSM/VimYjQg0=;
  b=a+cjP13j0BNexUZ2LWHhTadjishd10PxwzJJKF2dTgp1WZDSvf5sS6nA
   SL38ayFqIfhjiRbFt2fSozGxt6q+WrTOVR/ecf64kIMzxE6esei8O5Z8R
   MujkZi5bdI3Lhl5LvA6biASvf0thcCPY/p3j5oOSnBj4cXDElrffYiZMr
   6pjXOpxU/1dBAvdGv+g+TeVUN9xbjYwGGjlwmdK4NcObytGdxwIZ8TVHo
   qfjaJAKqhktzMeYccftv9/YxcIbY5gDI0+GkfHEBZ2//efFiGQcw1Rh66
   ZpKaGPAhNP3vDGbp6KYcQe5hqMvWpJTe+ga2Fm1ZcsyLEMwVxFY70GIFm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="375515994"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="375515994"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="893168964"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="893168964"
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
Subject: [PATCH v13A 24/35] x86/fred: Add a NMI entry stub for FRED
Date: Fri, 15 Dec 2023 22:31:39 -0800
Message-ID: <20231216063139.25567-1-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <SA1PR11MB673465C969A6554B8574157EA893A@SA1PR11MB6734.namprd11.prod.outlook.com>
References: <SA1PR11MB673465C969A6554B8574157EA893A@SA1PR11MB6734.namprd11.prod.outlook.com>
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

Changes since v13:
* Save and restore %cr2 upon entering and leaving the FRED NMI handler
  (H. Peter Anvin).
* Remove an unnecessary check "IS_ENABLED(CONFIG_SMP)" (H. Peter Anvin).
* Sync a microcode change to the IDT NMI handler from 8f849ff63bcbc to
  the FRED NMI handler.
---
 arch/x86/kernel/nmi.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 17e955ab69fe..1dd8838e5583 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -35,6 +35,7 @@
 #include <asm/nospec-branch.h>
 #include <asm/microcode.h>
 #include <asm/sev.h>
+#include <asm/fred.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/nmi.h>
@@ -651,6 +652,41 @@ void nmi_backtrace_stall_check(const struct cpumask *btp)
 
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
+	if (arch_cpu_is_offline(smp_processor_id())) {
+		if (microcode_nmi_handler_enabled())
+			microcode_offline_nmi_handler();
+		return;
+	}
+
+	this_cpu_write(nmi_cr2, read_cr2());
+
+	irq_state = irqentry_nmi_enter(regs);
+
+	inc_irq_stat(__nmi_count);
+	default_do_nmi(regs);
+
+	irqentry_nmi_exit(regs, irq_state);
+
+	if (unlikely(this_cpu_read(nmi_cr2) != read_cr2()))
+		write_cr2(this_cpu_read(nmi_cr2));
+}
+#endif
+
 void stop_nmi(void)
 {
 	ignore_nmis++;
-- 
2.43.0


