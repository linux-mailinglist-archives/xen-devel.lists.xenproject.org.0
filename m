Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADACA7AC05F
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 12:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607196.945581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzi9-0002at-Rb; Sat, 23 Sep 2023 10:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607196.945581; Sat, 23 Sep 2023 10:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzi9-0002Tl-Gw; Sat, 23 Sep 2023 10:18:05 +0000
Received: by outflank-mailman (input) for mailman id 607196;
 Sat, 23 Sep 2023 10:18:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xNi6=FH=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qjzci-0000Pn-AY
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 10:12:28 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5d9c024-59f9-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 12:12:06 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:11:54 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:11:54 -0700
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
X-Inumbo-ID: a5d9c024-59f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463926; x=1726999926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dp4g3U5j1+mHLqLShoixZI9RDsoukyKAu6bCdytj8jk=;
  b=DbxWFbX+ESVMeumtssq6SfyGqEq9Y9dA0gRc+iaO4Cc//2yUlFDwKivI
   aRwUG+o/1p+SPfEHEuhJ+9/xbxtKMeqkFK+OsmUhfbGlCm44x0Yp5DdJ0
   qG2Rl4AS1pSJ3kfJwh+lDeCDUFRRtpMqLwzCoePus78sJTilIYko2qsh0
   NNphEg38vrPZx42eNfICCBsuhb4MfxUNgHfSoHqnCTAwpI/DYHU96Zz8a
   B7a75Cwk3CyQXt9BWq+0Q6WoShhmYs2I5AioBgoGlfcVPRfXBUH1DSLCb
   zksUX5ICfrd+M+HpXNZd0t6/4UhGqrmJoEeQ8SBnsJKJ0lHsU7W5a5Xdg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447492522"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447492522"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813388252"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813388252"
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
Subject: [PATCH v11 37/37] x86/fred: Invoke FRED initialization code to enable FRED
Date: Sat, 23 Sep 2023 02:42:12 -0700
Message-Id: <20230923094212.26520-38-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923094212.26520-1-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Let cpu_init_exception_handling() call cpu_init_fred_exceptions() to
initialize FRED. However if FRED is unavailable or disabled, it falls
back to set up TSS IST and initialize IDT.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Co-developed-by: Xin Li <xin3.li@intel.com>
Tested-by: Shan Kang <shan.kang@intel.com>
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
index 2ee4e7b597a3..e7a5b9831252 100644
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
@@ -2112,7 +2113,15 @@ void syscall_init(void)
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
@@ -2228,8 +2237,9 @@ void cpu_init_exception_handling(void)
 	/* paranoid_entry() gets the CPU number from the GDT */
 	setup_getcpu(cpu);
 
-	/* IST vectors need TSS to be set up. */
-	tss_setup_ist(tss);
+	/* For IDT mode, IST vectors need to be set in TSS. */
+	if (!cpu_feature_enabled(X86_FEATURE_FRED))
+		tss_setup_ist(tss);
 	tss_setup_io_bitmap(tss);
 	set_tss_desc(cpu, &get_cpu_entry_area(cpu)->tss.x86_tss);
 
@@ -2238,8 +2248,10 @@ void cpu_init_exception_handling(void)
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
2.34.1


