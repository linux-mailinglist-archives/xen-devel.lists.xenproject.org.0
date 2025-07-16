Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B02EB07C16
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 19:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045521.1415684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5yp-0003id-Pp; Wed, 16 Jul 2025 17:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045521.1415684; Wed, 16 Jul 2025 17:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5yp-0003fD-MC; Wed, 16 Jul 2025 17:31:43 +0000
Received: by outflank-mailman (input) for mailman id 1045521;
 Wed, 16 Jul 2025 17:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc5yn-00030y-T1
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 17:31:41 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id babe35b7-626a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 19:31:38 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso54205f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 10:31:38 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e68sm27048625e9.1.2025.07.16.10.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 10:31:37 -0700 (PDT)
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
X-Inumbo-ID: babe35b7-626a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752687098; x=1753291898; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGM1Q5EIuvsx4uKAcpMSkvBp3uB8iDs6K5Nkv2be9Lk=;
        b=ahgevl2UcpcRzoT2hZeBW/QhFi5ieOeNsO5zDFd4/cgy4SsykSNm5KCSd6vxJ/GRc3
         buM53ZjLl1N0RRdf7kNUkVoz2jtL+n6+1t5698aEGPfn2rfC6EjNWeVks5co/j/FqAcb
         OKjX0a0D/B7ShIdyQRLG02H+2NyY4+7hgBCMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752687098; x=1753291898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGM1Q5EIuvsx4uKAcpMSkvBp3uB8iDs6K5Nkv2be9Lk=;
        b=NBwnx42I0tAjn5ZXObvJeUaa/9HVOIxTDXIi9/5oDx6Wu6aDhsYFTjNu1Bo9sZg7M0
         k6w6REjP9IVTEalNKRYoCwgKbtDbzUdXxDXoFdYdJVF8lYZZuZrB+JKmlbKXBeBMViMt
         S2mUhsRyPUVxKX2+Z84KBArrsPzpzO/t1V8zMOgkdKVJc0ZWEPoCEttprw02MLftj6oa
         gNHwjqmczUEXN3Ep5ml1J2Jnp1cxcJ9TJVbaZYl4y6XrdRWugYhh4NclTmgJIbP6vE7V
         5PUnhucz4ZCHdEtBbrdk7uT2nEm2k1Eoq/JeycXez1PjQ/sIiK1h/Z3Lkm4iXpo7B3K6
         c7kw==
X-Gm-Message-State: AOJu0YxVvM+RSxWczNEjqQ+ZTqvU6lizH8s4c3DveQ1wh1IiB6RHLkdy
	iZZUaPJcl0SXSewYWoFtXBX6fWYzKfy7V7tDiL7ah/VF89PRgt53qMnmxDjTtGScTQb+ZyJ0iVU
	r6YtJP40Rtw==
X-Gm-Gg: ASbGncu8g5DdlkrgHqN8CY/j9NISh6pUu5MeUqgrsTgtsO/597lNeum5uc8eMYUdmI+
	Ib03imvDdjkltx0+3YOst1QRU1HT0MdA15moRGUxf+eKyoCmbSNp+xllRKqz/LeVuG5D/+eFbF1
	kDcopanKoXhTbK5gIcmxLCUut7m7pVJksgn8IyXtN8IcipDUtF9wLh9IOgkIz/kHPEeSo1ow8pG
	9mRDjl11viD/EhqguXLHJBzutZi1dcwJlPQ08+1BcIInkH9cb+SZzCTNcylRhhMPdcOiLCJlJm7
	SSTf3xS366T/Z47mHYxvBT1pWWnBnF2Q+dN/+rnapIM3CpDc0fii4xyY5Sx7O7TMK7AmgRDnfWH
	U7oH3/2PK4VroW+TgZA3QcvPd1iuENNkPzc1mOvYhyzwB4hb01XtF9SHjy9/G+p1m7SSFlvVUg4
	ZN
X-Google-Smtp-Source: AGHT+IFPr6SaMfmfUk9/B5XbKRHzcgQBpqGhtOvy3yp7Lq8gwXtvkia5tDU5xNBUj60r82WH02/1Dg==
X-Received: by 2002:a5d:5f86:0:b0:3b2:ef53:5818 with SMTP id ffacd0b85a97d-3b60dd643d3mr3247037f8f.5.1752687097759;
        Wed, 16 Jul 2025 10:31:37 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/6] x86: Break struct x86_cpu_id out of processor.h
Date: Wed, 16 Jul 2025 18:31:28 +0100
Message-Id: <20250716173132.2213891-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Only 5 files use struct x86_cpu_id, so it should not be in processor.h.  This
is in preparation to extend it with VFM support.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/cpu_idle.c         |  2 +-
 xen/arch/x86/apic.c                  |  1 +
 xen/arch/x86/cpu/common.c            | 21 +--------------------
 xen/arch/x86/cpu/intel.c             |  2 +-
 xen/arch/x86/cpu/mwait-idle.c        |  1 +
 xen/arch/x86/include/asm/match-cpu.h | 25 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/processor.h | 10 ----------
 7 files changed, 30 insertions(+), 32 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/match-cpu.h

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 86f32fd9a6f0..fee29353439e 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -50,8 +50,8 @@
 #include <asm/hpet.h>
 #include <asm/io.h>
 #include <asm/iocap.h>
+#include <asm/match-cpu.h>
 #include <asm/mwait.h>
-#include <asm/processor.h>
 #include <asm/spec_ctrl.h>
 
 #include <acpi/cpufreq/cpufreq.h>
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index a058c435878a..c4272ab4de4f 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -37,6 +37,7 @@
 #include <asm/io-ports.h>
 #include <asm/io_apic.h>
 #include <asm/irq-vectors.h>
+#include <asm/match-cpu.h>
 #include <asm/mc146818rtc.h>
 #include <asm/microcode.h>
 #include <asm/mpspec.h>
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 77364fd728db..cc004fc976f5 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -11,9 +11,9 @@
 #include <asm/debugreg.h>
 #include <asm/idt.h>
 #include <asm/io.h>
+#include <asm/match-cpu.h>
 #include <asm/mpspec.h>
 #include <asm/msr.h>
-#include <asm/processor.h>
 #include <asm/prot-key.h>
 #include <asm/random.h>
 #include <asm/setup.h>
@@ -998,25 +998,6 @@ void cpu_uninit(unsigned int cpu)
 	cpumask_clear_cpu(cpu, &cpu_initialized);
 }
 
-/*
- * x86_match_cpu - match the current CPU against an array of
- * x86_cpu_ids
- * @match: Pointer to array of x86_cpu_ids. Last entry terminated with
- *         {}.
- * Return the entry if the current CPU matches the entries in the
- * passed x86_cpu_id match table. Otherwise NULL.  The match table
- * contains vendor (X86_VENDOR_*), family, model and feature bits or
- * respective wildcard entries.
- *
- * A typical table entry would be to match a specific CPU
- * { X86_VENDOR_INTEL, 6, 0x12 }
- * or to match a specific CPU feature
- * { X86_FEATURE_MATCH(X86_FEATURE_FOOBAR) }
- *
- * This always matches against the boot cpu, assuming models and
-features are
- * consistent over all CPUs.
- */
 const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[])
 {
 	const struct x86_cpu_id *m;
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 59b5828fa9e9..ee1ae92cd7e6 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -8,9 +8,9 @@
 #include <asm/apic.h>
 #include <asm/i387.h>
 #include <asm/intel-family.h>
+#include <asm/match-cpu.h>
 #include <asm/mpspec.h>
 #include <asm/msr.h>
-#include <asm/processor.h>
 #include <asm/trampoline.h>
 
 #include "cpu.h"
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index c733a672d1e0..eec2823cbacf 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -52,6 +52,7 @@
 #include <asm/cpuidle.h>
 #include <asm/hpet.h>
 #include <asm/intel-family.h>
+#include <asm/match-cpu.h>
 #include <asm/msr.h>
 #include <asm/mwait.h>
 #include <asm/spec_ctrl.h>
diff --git a/xen/arch/x86/include/asm/match-cpu.h b/xen/arch/x86/include/asm/match-cpu.h
new file mode 100644
index 000000000000..2704b84d74c9
--- /dev/null
+++ b/xen/arch/x86/include/asm/match-cpu.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_MATCH_CPU_H
+#define X86_MATCH_CPU_H
+
+#include <xen/stdint.h>
+
+struct x86_cpu_id {
+    uint16_t vendor;
+    uint16_t family;
+    uint16_t model;
+    uint16_t feature;
+    const void *driver_data;
+};
+
+/*
+ * x86_match_cpu() - match the CPU against an array of x86_cpu_ids[]
+ *
+ * @table: Array of x86_cpu_ids. Last entry terminated with {}.
+ *
+ * Returns the matching entry, otherwise NULL.  This always matches against
+ * the boot CPU, assuming models and features are consistent over all CPUs.
+ */
+const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[]);
+
+#endif /* X86_MATCH_CPU_H */
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 04824c3633cf..c58617631bf3 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -80,14 +80,6 @@
 struct domain;
 struct vcpu;
 
-struct x86_cpu_id {
-    uint16_t vendor;
-    uint16_t family;
-    uint16_t model;
-    uint16_t feature;   /* bit index */
-    const void *driver_data;
-};
-
 extern struct cpuinfo_x86 cpu_data[];
 #define current_cpu_data cpu_data[smp_processor_id()]
 
@@ -104,8 +96,6 @@ extern unsigned int hap_paddr_bits;
 /* Maximum width of virtual addresses supported by the hardware. */
 extern unsigned int vaddr_bits;
 
-extern const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[]);
-
 extern void identify_cpu(struct cpuinfo_x86 *c);
 extern void setup_clear_cpu_cap(unsigned int cap);
 extern void setup_force_cpu_cap(unsigned int cap);
-- 
2.39.5


