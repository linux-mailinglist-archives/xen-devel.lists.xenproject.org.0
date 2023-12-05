Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D3980521D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647572.1010959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATUl-0007sg-JX; Tue, 05 Dec 2023 11:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647572.1010959; Tue, 05 Dec 2023 11:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATUk-0007gc-U4; Tue, 05 Dec 2023 11:21:42 +0000
Received: by outflank-mailman (input) for mailman id 647572;
 Tue, 05 Dec 2023 11:21:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUi-0005GD-4l
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:40 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 754a6a2c-9360-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 12:21:39 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:28 -0800
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
X-Inumbo-ID: 754a6a2c-9360-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775300; x=1733311300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GKdJrpjNAAfGimUxYAq3wTN/xrTwaQ33LU4i4+qObUE=;
  b=gdDgwlDBCU8LJ6neaiShDVSKjoFhzx+s8aTe18lgt9BllNVZg9/w+z78
   SUZ4k9j4f4StSnPpKdamcMNHyTnvMo7L3jK+wgJ9ypMy3Bdt1iCwINj4o
   Yvf03eOQTUnrjwyhGvTcJX5GB7QFN6k9uy8P539P6u2Vm5ge32mKvChOT
   sZdM9mAc/MeoOmBLHWjYnqSbPTtENs7i4Y3bYK98Mb4pp0Ocp9/FOxO+L
   Gn/2Gdxm8PnWsg17P40I67brwtqtHbOFFBkukxh/YSTDv4NYme8Xm+B9s
   2TqN3RchjYdg4CvpOF8y2WP27CvaImmDhacoRsj5bQSMEZMGWsYVVQDk1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942730"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942730"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018193022"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018193022"
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
Subject: [PATCH v13 35/35] x86/fred: Invoke FRED initialization code to enable FRED
Date: Tue,  5 Dec 2023 02:50:24 -0800
Message-ID: <20231205105030.8698-36-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Let cpu_init_exception_handling() call cpu_init_fred_exceptions() to
initialize FRED. However if FRED is unavailable or disabled, it falls
back to set up TSS IST and initialize IDT.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Co-developed-by: Xin Li <xin3.li@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v10:
* No need to invalidate SYSCALL and SYSENTER MSRs (Thomas Gleixner).

Changes since v8:
* Move this patch after all required changes are in place (Thomas
  Gleixner).
---
 arch/x86/kernel/cpu/common.c | 22 +++++++++++++++++-----
 arch/x86/kernel/irqinit.c    |  7 ++++++-
 arch/x86/kernel/traps.c      |  5 ++++-
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 9a075792e275..91d2f6018c48 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -61,6 +61,7 @@
 #include <asm/microcode.h>
 #include <asm/intel-family.h>
 #include <asm/cpu_device_id.h>
+#include <asm/fred.h>
 #include <asm/uv/uv.h>
 #include <asm/ia32.h>
 #include <asm/set_memory.h>
@@ -2117,7 +2118,15 @@ void syscall_init(void)
 	/* The default user and kernel segments */
 	wrmsr(MSR_STAR, 0, (__USER32_CS << 16) | __KERNEL_CS);
 
-	idt_syscall_init();
+	/*
+	 * Except the IA32_STAR MSR, there is NO need to setup SYSCALL and
+	 * SYSENTER MSRs for FRED, because FRED uses the ring 3 FRED
+	 * entrypoint for SYSCALL and SYSENTER, and ERETU is the only legit
+	 * instruction to return to ring 3 (both sysexit and sysret cause
+	 * #UD when FRED is enabled).
+	 */
+	if (!cpu_feature_enabled(X86_FEATURE_FRED))
+		idt_syscall_init();
 }
 
 #else	/* CONFIG_X86_64 */
@@ -2223,8 +2232,9 @@ void cpu_init_exception_handling(void)
 	/* paranoid_entry() gets the CPU number from the GDT */
 	setup_getcpu(cpu);
 
-	/* IST vectors need TSS to be set up. */
-	tss_setup_ist(tss);
+	/* For IDT mode, IST vectors need to be set in TSS. */
+	if (!cpu_feature_enabled(X86_FEATURE_FRED))
+		tss_setup_ist(tss);
 	tss_setup_io_bitmap(tss);
 	set_tss_desc(cpu, &get_cpu_entry_area(cpu)->tss.x86_tss);
 
@@ -2233,8 +2243,10 @@ void cpu_init_exception_handling(void)
 	/* GHCB needs to be setup to handle #VC. */
 	setup_ghcb();
 
-	/* Finally load the IDT */
-	load_current_idt();
+	if (cpu_feature_enabled(X86_FEATURE_FRED))
+		cpu_init_fred_exceptions();
+	else
+		load_current_idt();
 }
 
 /*
diff --git a/arch/x86/kernel/irqinit.c b/arch/x86/kernel/irqinit.c
index c683666876f1..f79c5edc0b89 100644
--- a/arch/x86/kernel/irqinit.c
+++ b/arch/x86/kernel/irqinit.c
@@ -28,6 +28,7 @@
 #include <asm/setup.h>
 #include <asm/i8259.h>
 #include <asm/traps.h>
+#include <asm/fred.h>
 #include <asm/prom.h>
 
 /*
@@ -96,7 +97,11 @@ void __init native_init_IRQ(void)
 	/* Execute any quirks before the call gates are initialised: */
 	x86_init.irqs.pre_vector_init();
 
-	idt_setup_apic_and_irq_gates();
+	if (cpu_feature_enabled(X86_FEATURE_FRED))
+		fred_complete_exception_setup();
+	else
+		idt_setup_apic_and_irq_gates();
+
 	lapic_assign_system_vectors();
 
 	if (!acpi_ioapic && !of_ioapic && nr_legacy_irqs()) {
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 848c85208a57..0ee78a30e14a 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -1411,7 +1411,10 @@ void __init trap_init(void)
 
 	/* Initialize TSS before setting up traps so ISTs work */
 	cpu_init_exception_handling();
+
 	/* Setup traps as cpu_init() might #GP */
-	idt_setup_traps();
+	if (!cpu_feature_enabled(X86_FEATURE_FRED))
+		idt_setup_traps();
+
 	cpu_init();
 }
-- 
2.43.0


