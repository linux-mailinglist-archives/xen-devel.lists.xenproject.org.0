Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AA39C264A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 21:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832903.1248219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VKv-000363-PK; Fri, 08 Nov 2024 20:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832903.1248219; Fri, 08 Nov 2024 20:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VKv-00033w-Ky; Fri, 08 Nov 2024 20:12:05 +0000
Received: by outflank-mailman (input) for mailman id 832903;
 Fri, 08 Nov 2024 20:12:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9VKt-0002pM-Bo
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 20:12:03 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6397e88-9e0d-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 21:12:00 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5cece886771so4338110a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 12:12:00 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5d7e6sm2334739a12.14.2024.11.08.12.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:11:55 -0800 (PST)
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
X-Inumbo-ID: b6397e88-9e0d-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmEiLCJoZWxvIjoibWFpbC1lZDEteDUyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI2Mzk3ZTg4LTllMGQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDk2NzIwLjI0NDUzMiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731096719; x=1731701519; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MMy8e2dl3W/FfU86BORT7sNQ1T6E9mw4dCgXuqbc4E=;
        b=WzqXc+q3NyawmmIsDQeQldVe7iVabSMcmdSQ54HRXyzFUx+dJhGEE+RAhe+uG0BQf+
         V/9g/pOxdgd+VZykLwgbhx64FiZ5Q3gf61dNL9D+wL/RTU2I/x9OURYB3UrdThmn4PcV
         M9K7i9QGrM3Yz7RxVjbiM7SrqQeqRbKp/20KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096719; x=1731701519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MMy8e2dl3W/FfU86BORT7sNQ1T6E9mw4dCgXuqbc4E=;
        b=ciRK04agTH8GvEI/SNta5X3uAVTkRDKzvd/ig11z5BrHZ91zPj6jmaia36SoyBz0aE
         uPV7It+2DMxDMU0R+N+/XaKGwoOP8UH3+rFdPnB9cTwWRslDNbugNqXX7GohaSae4D+E
         AEdRZUUh5KUCyQmoOwP5NanIRLbjpANN+e7h0pVx+k6TWxEKTomewl8x52AfecblaPc0
         QDNIMvVSp02wLb7uM7Rpe1qzUdLAODNBLVonTV0a5KQbA/y5pYbn8G25rVv4wPOgO2cB
         yw/LE5TmICY4OdBs4lZ8UAoZn4eErzQdiMMCiAGfTWdHDb49VdI/ZtUBcIcNDlYDLbE5
         dS6A==
X-Gm-Message-State: AOJu0YxirEo4lAoc+8BYJYDI6Mrs23DoQZzUeLgT0bfb691MqNH+8PrU
	3IT7nOSPNFno3rM5LzQFJzMtfK3ZAXyw5KOnrugs359ZZ7WTcvkxQPYQ5F4mFDJ2OnoZt/J3KtL
	0
X-Google-Smtp-Source: AGHT+IHBTmngeNBjGTDSUpzBLDTzycAJDBAwbriOJKsg/gpCD6Nh1KlwxMASrNZyXJ6btFUQXyhsOg==
X-Received: by 2002:a50:fb89:0:b0:5cf:a27:c87e with SMTP id 4fb4d7f45d1cf-5cf0a27c98dmr3327773a12.10.1731096718640;
        Fri, 08 Nov 2024 12:11:58 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/4] x86: Move mach-default/irq_vectors.h to asm/irq-vectors.h
Date: Fri,  8 Nov 2024 20:11:44 +0000
Message-Id: <20241108201147.812036-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108201147.812036-1-andrew.cooper3@citrix.com>
References: <20241108201147.812036-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

irq_vectors.h is included by with multiple paths.  Move it to be a regular
header instead.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/apic.c                                           | 3 ++-
 xen/arch/x86/cpu/vpmu.c                                       | 4 +++-
 xen/arch/x86/i8259.c                                          | 2 +-
 .../include/asm/{mach-default/irq_vectors.h => irq-vectors.h} | 0
 xen/arch/x86/io_apic.c                                        | 2 +-
 xen/arch/x86/irq.c                                            | 2 +-
 xen/arch/x86/msi.c                                            | 2 +-
 xen/arch/x86/pv/hypercall.c                                   | 3 ++-
 xen/arch/x86/pv/traps.c                                       | 2 +-
 xen/arch/x86/smp.c                                            | 2 +-
 xen/arch/x86/smpboot.c                                        | 2 +-
 xen/arch/x86/traps.c                                          | 2 +-
 xen/arch/x86/x86_64/compat/entry.S                            | 2 +-
 xen/arch/x86/x86_64/entry.S                                   | 2 +-
 14 files changed, 17 insertions(+), 13 deletions(-)
 rename xen/arch/x86/include/asm/{mach-default/irq_vectors.h => irq-vectors.h} (100%)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 8f192f80b852..8e8ff4d155ff 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -26,6 +26,8 @@
 #include <xen/delay.h>
 #include <xen/smp.h>
 #include <xen/softirq.h>
+
+#include <asm/irq-vectors.h>
 #include <asm/mc146818rtc.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
@@ -38,7 +40,6 @@
 #include <asm/genapic.h>
 
 #include <io_ports.h>
-#include <irq_vectors.h>
 #include <xen/kexec.h>
 #include <asm/guest.h>
 #include <asm/nmi.h>
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index a5bb1689c7d5..c28192ea2662 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -13,13 +13,15 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/sched.h>
+
+#include <asm/irq-vectors.h>
 #include <asm/regs.h>
 #include <asm/msr.h>
 #include <asm/nmi.h>
 #include <asm/p2m.h>
 #include <asm/vpmu.h>
 #include <asm/apic.h>
-#include <irq_vectors.h>
+
 #include <public/pmu.h>
 #include <xsm/xsm.h>
 
diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index 10ddd2b0fbbf..a14f20bdf676 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -19,9 +19,9 @@
 #include <xen/delay.h>
 #include <asm/apic.h>
 #include <asm/asm_defns.h>
+#include <asm/irq-vectors.h>
 #include <asm/setup.h>
 #include <io_ports.h>
-#include <irq_vectors.h>
 
 /*
  * This is the 'legacy' 8259A Programmable Interrupt Controller,
diff --git a/xen/arch/x86/include/asm/mach-default/irq_vectors.h b/xen/arch/x86/include/asm/irq-vectors.h
similarity index 100%
rename from xen/arch/x86/include/asm/mach-default/irq_vectors.h
rename to xen/arch/x86/include/asm/irq-vectors.h
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 13daebc10a97..12cc4a561d14 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -35,6 +35,7 @@
 #include <asm/genapic.h>
 #include <asm/hpet.h>
 #include <asm/io_apic.h>
+#include <asm/irq-vectors.h>
 #include <asm/mc146818rtc.h>
 #include <asm/smp.h>
 #include <asm/desc.h>
@@ -42,7 +43,6 @@
 #include <asm/setup.h>
 
 #include <io_ports.h>
-#include <irq_vectors.h>
 #include <public/physdev.h>
 #include <xen/trace.h>
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 6340cd6dd73d..e56bacc88d84 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -25,11 +25,11 @@
 #include <asm/apic.h>
 #include <asm/genapic.h>
 #include <asm/io_apic.h>
+#include <asm/irq-vectors.h>
 #include <asm/msi.h>
 #include <asm/current.h>
 #include <asm/flushtlb.h>
 
-#include <irq_vectors.h>
 #include <public/physdev.h>
 
 /* opt_noirqbalance: If true, software IRQ balancing/affinity is disabled. */
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 68d6e25178a9..be5ef99e088f 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -26,6 +26,7 @@
 #include <asm/genapic.h>
 #include <asm/io.h>
 #include <asm/io_apic.h>
+#include <asm/irq-vectors.h>
 #include <asm/smp.h>
 #include <asm/desc.h>
 #include <asm/msi.h>
@@ -33,7 +34,6 @@
 #include <asm/p2m.h>
 
 #include <io_ports.h>
-#include <irq_vectors.h>
 #include <public/physdev.h>
 #include <xen/iommu.h>
 #include <xsm/xsm.h>
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 4294e930128b..2febade44b73 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -11,9 +11,10 @@
 #include <xen/hypercall.h>
 #include <xen/nospec.h>
 #include <xen/trace.h>
+
 #include <asm/apic.h>
+#include <asm/irq-vectors.h>
 #include <asm/multicall.h>
-#include <irq_vectors.h>
 
 /* Forced inline to cause 'compat' to be evaluated at compile time. */
 static void always_inline
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index ed8aa97382b7..fd1597d0bdea 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -13,10 +13,10 @@
 #include <xen/softirq.h>
 
 #include <asm/debugreg.h>
+#include <asm/irq-vectors.h>
 #include <asm/pv/trace.h>
 #include <asm/shared.h>
 #include <asm/traps.h>
-#include <irq_vectors.h>
 
 void pv_inject_event(const struct x86_event *event)
 {
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index bd337e548c5a..02a6ed7593f3 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -19,13 +19,13 @@
 #include <asm/current.h>
 #include <asm/genapic.h>
 #include <asm/guest.h>
+#include <asm/irq-vectors.h>
 #include <asm/smp.h>
 #include <asm/mc146818rtc.h>
 #include <asm/flushtlb.h>
 #include <asm/hardirq.h>
 #include <asm/hpet.h>
 #include <asm/setup.h>
-#include <irq_vectors.h>
 
 /* Helper functions to prepare APIC register values. */
 static unsigned int prepare_ICR(unsigned int shortcut, int vector)
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 42272a9844fa..568a3abe1f47 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -39,7 +39,7 @@
 #include <asm/time.h>
 #include <asm/tboot.h>
 #include <asm/trampoline.h>
-#include <irq_vectors.h>
+#include <asm/irq-vectors.h>
 
 unsigned long __read_mostly trampoline_phys;
 enum ap_boot_method __read_mostly ap_boot_method = AP_BOOT_NORMAL;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index a9c2c607eb08..fd8a4448e3f7 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -69,7 +69,7 @@
 #include <public/hvm/params.h>
 #include <asm/cpuid.h>
 #include <xsm/xsm.h>
-#include <asm/mach-default/irq_vectors.h>
+#include <asm/irq-vectors.h>
 #include <asm/pv/traps.h>
 #include <asm/pv/trace.h>
 #include <asm/pv/mm.h>
diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index a99646c0cd4e..1e87652f4bcb 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -5,11 +5,11 @@
         .file "x86_64/compat/entry.S"
 
 #include <asm/asm_defns.h>
+#include <asm/irq-vectors.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/desc.h>
 #include <public/xen.h>
-#include <irq_vectors.h>
 
 FUNC(entry_int82)
         ENDBR64
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index c5c723b5f4d4..40d094d5b2ee 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -7,10 +7,10 @@
         .file "x86_64/entry.S"
 
 #include <asm/asm_defns.h>
+#include <asm/irq-vectors.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <public/xen.h>
-#include <irq_vectors.h>
 
 /* %rsp: struct cpu_user_regs */
 .macro ASSERT_CONTEXT_IS_XEN
-- 
2.39.5


