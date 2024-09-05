Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E0B96D9D6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 15:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791094.1200888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smCCb-0002ec-CW; Thu, 05 Sep 2024 13:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791094.1200888; Thu, 05 Sep 2024 13:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smCCb-0002ca-8N; Thu, 05 Sep 2024 13:07:09 +0000
Received: by outflank-mailman (input) for mailman id 791094;
 Thu, 05 Sep 2024 13:07:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smCCZ-0002Ra-GD
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 13:07:07 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf8b3b3c-6b87-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 15:07:05 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c3ca32971cso844746a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 06:07:05 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a61fbb093sm136972766b.11.2024.09.05.06.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 06:07:03 -0700 (PDT)
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
X-Inumbo-ID: bf8b3b3c-6b87-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725541624; x=1726146424; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1rk1SivgKsroKO5X3xfzliShecCf9u4hA4GiCVFO6s=;
        b=o6YthHEdlvV9YnSEwh42ij+lsv08FUmtbJm3693bn2F5UYSNiaHNSANb2ZvYZLrWP0
         5QewoL/wDIEFsbvGa2t/RWSVgJpQJU471AZ0JhTKeOwWChl2QhOEik+y84BoUsRbba9U
         +XzliFsSjdsbfmMaN62EZW3s5bZ2u/y6Y/4gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541624; x=1726146424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1rk1SivgKsroKO5X3xfzliShecCf9u4hA4GiCVFO6s=;
        b=S5f3j5K5paIdgBHIKEc6rWF2S5zE4u/PJuNQyylKmYLIpqYYfbDbWL+TWibVRkYljl
         57VP6mNEqBPfgxFrLYXmizTPEAQu461wMWzLCG3eJSv4bSS8f3nTfA84Co9UAp++Biz3
         DQoeHa66hnNpOCp0mCjA+6FAnRavtqTIPgRWwo0sVGQOAGp1kZiz8oUqtXTedyOYUpSR
         y2WGKU9z7Vq/Gsgge4krBSsbaKB66xQwOYTEEUeqyVVejG3dhbhKMWjXTC1+szwvWqD2
         rEmml+RgSuKWlXmKjsWma6QgyCc6JbbU+VsIyqf//jbdoJIwYcnAGkn73lWOLApQb5Ed
         zbBA==
X-Gm-Message-State: AOJu0Yw0nIgEgESCYTWOHQlnSsFVng3EpRNXYTzbziJ4ssraxIUwSQEr
	gveD4bbnNIJ7dWWi4upc4qu5NH7H7fZHOUlsetApPWRPsIknFk6osV2zlgRg0oVI4vwuBZ285eM
	U
X-Google-Smtp-Source: AGHT+IFBo/7+XGqS+J+fdbXDJc4jZ41o18nvzHb3//XzZ/9rgsbx/2ycpdTKlsCH2fMkbR7YR33lug==
X-Received: by 2002:a17:907:918c:b0:a8a:8069:2633 with SMTP id a640c23a62f3a-a8a806927d9mr5967666b.1.1725541623884;
        Thu, 05 Sep 2024 06:07:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH 2/3] x86/trampoline: Move the trampoline declarations out of <asm/config.h>
Date: Thu,  5 Sep 2024 14:06:56 +0100
Message-Id: <20240905130657.4075906-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

asm/config.h is included in every translation unit (via xen/config.h), while
only a handful of functions actually interact with the trampoline.

Move the infrastructure into its own header, and take the opportunity to
document everything.

Also change trampoline_realmode_entry() and wakeup_start() to be nocall
functions, rather than char arrays.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/acpi/power.c             |  2 +
 xen/arch/x86/cpu/intel.c              |  2 +
 xen/arch/x86/efi/efi-boot.h           |  1 +
 xen/arch/x86/guest/xen/pvh-boot.c     |  1 +
 xen/arch/x86/include/asm/config.h     | 19 ------
 xen/arch/x86/include/asm/trampoline.h | 98 +++++++++++++++++++++++++++
 xen/arch/x86/mm.c                     |  1 +
 xen/arch/x86/platform_hypercall.c     |  2 +
 xen/arch/x86/setup.c                  |  1 +
 xen/arch/x86/smpboot.c                |  1 +
 xen/arch/x86/tboot.c                  |  2 +
 xen/arch/x86/x86_64/mm.c              |  2 +
 12 files changed, 113 insertions(+), 19 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/trampoline.h

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 557faf312b09..08a7fc250800 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -31,6 +31,8 @@
 #include <asm/microcode.h>
 #include <asm/prot-key.h>
 #include <asm/spec_ctrl.h>
+#include <asm/trampoline.h>
+
 #include <acpi/cpufreq/cpufreq.h>
 
 uint32_t system_reset_counter = 1;
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index af56e57bd8ab..807b708217e9 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -12,6 +12,8 @@
 #include <asm/mpspec.h>
 #include <asm/apic.h>
 #include <asm/i387.h>
+#include <asm/trampoline.h>
+
 #include <mach_apic.h>
 
 #include "cpu.h"
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index f282358435f1..23e510c77e2e 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -9,6 +9,7 @@
 #include <asm/microcode.h>
 #include <asm/msr.h>
 #include <asm/setup.h>
+#include <asm/trampoline.h>
 
 static struct file __initdata ucode;
 static multiboot_info_t __initdata mbi = {
diff --git a/xen/arch/x86/guest/xen/pvh-boot.c b/xen/arch/x86/guest/xen/pvh-boot.c
index cc57ab2cbcde..e14d7e20e942 100644
--- a/xen/arch/x86/guest/xen/pvh-boot.c
+++ b/xen/arch/x86/guest/xen/pvh-boot.c
@@ -12,6 +12,7 @@
 
 #include <asm/e820.h>
 #include <asm/guest.h>
+#include <asm/trampoline.h>
 
 #include <public/arch-x86/hvm/start_info.h>
 
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 2a260a2581fd..1f828bfd52f4 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -83,25 +83,6 @@
 #define LIST_POISON1  ((void *)0x0100100100100100UL)
 #define LIST_POISON2  ((void *)0x0200200200200200UL)
 
-#ifndef __ASSEMBLY__
-extern unsigned long trampoline_phys;
-#define bootsym_phys(sym)                                 \
-    (((unsigned long)&(sym)-(unsigned long)&trampoline_start)+trampoline_phys)
-#define bootsym(sym)                                      \
-    (*((typeof(sym) *)__va(bootsym_phys(sym))))
-
-extern char trampoline_start[], trampoline_end[];
-extern char trampoline_realmode_entry[];
-extern unsigned int trampoline_xen_phys_start;
-extern unsigned char trampoline_cpu_started;
-extern char wakeup_start[];
-
-extern unsigned char video_flags;
-
-extern unsigned short boot_edid_caps;
-extern unsigned char boot_edid_info[128];
-#endif
-
 #include <xen/const.h>
 
 #define PML4_ENTRY_BITS  39
diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
new file mode 100644
index 000000000000..cc3420ba3530
--- /dev/null
+++ b/xen/arch/x86/include/asm/trampoline.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef XEN_ASM_TRAMPOLINE_H
+#define XEN_ASM_TRAMPOLINE_H
+
+/*
+ * Data in or about the low memory trampoline.
+ *
+ * x86 systems software typically needs a block of logic below the 1M
+ * boundary, commonly called the trampoline, containing 16-bit logic.  Xen has
+ * a combined trampoline of all necessary 16-bit logic, formed of two parts.
+ *
+ * 1) The permanent trampoline; a single 4k page containing:
+ *
+ *    - The INIT-SIPI-SIPI entrypoint for APs, and
+ *    - The S3 wakeup vector.
+ *
+ *    Both of these are 16-bit entrypoints, responsible for activating paging
+ *    and getting into 64-bit mode.  This requires the permanent trampoline to
+ *    be identity mapped in idle_pg_table[].
+ *
+ *    The SIPI64 spec deprecates the 16-bit AP entrypoint, while S0ix (also
+ *    called Low Power Idle or Connected Standby) deprecates S3.
+ *
+ * 2) The boot trampoline:
+ *
+ *    This is used by the BSP to drop into 16-bit mode, make various BIOS
+ *    calls to obtain E820/EDID/etc.  It follows the permanent and exceeds 4k,
+ *    but is only used in 16-bit and 32-bit unpaged mode so does not need
+ *    mapping in pagetables.
+ *
+ *    When the BIOS calls are complete, execution does join back with the AP
+ *    path, and becomes subject to the same paging requirements.  This path is
+ *    not needed for non-BIOS boots.
+ *
+ * The location of trampoline is not fixed.  The layout of low memory varies
+ * greatly from platform to platform.  Therefore, the trampoline is relocated
+ * manually as part of placement.
+ */
+
+#ifndef __ASSEMBLY__
+
+#include <xen/compiler.h>
+#include <xen/types.h>
+
+/*
+ * Start and end of the trampoline section, as linked into Xen.  It is within
+ * the .init section and reclaimed after boot.
+ */
+/* SAF-0-safe */
+extern char trampoline_start[], trampoline_end[];
+
+/*
+ * The physical address of trampoline_start[] in low memory.  It must be below
+ * the 1M boundary (as the trampoline contains 16-bit code), and must be 4k
+ * aligned (SIPI requirement for APs).
+ */
+extern unsigned long trampoline_phys;
+
+/*
+ * Calculate the physical address of a symbol in the trampoline.
+ *
+ * Should only be used on symbols declared later in this header.  Specifying
+ * other symbols will compile but malfunction when used, as will using this
+ * helper before the trampoline is placed.
+ */
+#define bootsym_phys(sym)                                       \
+    (trampoline_phys + ((unsigned long)&(sym) -                 \
+                        (unsigned long)trampoline_start))
+
+/* Given a trampoline symbol, construct a pointer to it in the directmap. */
+#define bootsym(sym) (*((typeof(sym) *)__va(bootsym_phys(sym))))
+
+/* The INIT-SIPI-SIPI entrypoint.  16-bit code. */
+void nocall trampoline_realmode_entry(void);
+
+/* The S3 wakeup vector.  16-bit code. */
+void nocall wakeup_start(void);
+
+/*
+ * A variable in the trampoline, containing Xen's physical address.  Amongst
+ * other things, it is used to find idle_pg_table[] in order to enable paging
+ * and activate 64-bit mode.  This variable needs keeping in sync with
+ * xen_phys_start.
+ */
+extern uint32_t trampoline_xen_phys_start;
+
+/* A semaphore to indicate signs-of-life at the start of the AP boot path. */
+extern uint8_t trampoline_cpu_started;
+
+/* Quirks about video mode-setting on S3 resume. */
+extern uint8_t video_flags;
+
+/* Extended Display Identification Data, gathered from the BIOS. */
+extern uint16_t boot_edid_caps;
+extern uint8_t boot_edid_info[128];
+
+#endif /* !__ASSEMBLY__ */
+#endif /* XEN_ASM_TRAMPOLINE_H */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 608583a1134e..c735aaf0e823 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -131,6 +131,7 @@
 #include <asm/guest.h>
 #include <asm/pv/domain.h>
 #include <asm/pv/mm.h>
+#include <asm/trampoline.h>
 
 #ifdef CONFIG_PV
 #include "pv/mm.h"
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 7e3278109300..67f851237def 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -32,6 +32,8 @@
 #include <asm/mtrr.h>
 #include <asm/io_apic.h>
 #include <asm/setup.h>
+#include <asm/trampoline.h>
+
 #include "cpu/mcheck/mce.h"
 #include "cpu/mtrr/mtrr.h"
 #include <xsm/xsm.h>
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index cd69198326da..a6e77c9ed9fc 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -59,6 +59,7 @@
 #include <asm/microcode.h>
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
+#include <asm/trampoline.h>
 
 /* opt_nosmp: If true, secondary processors are ignored. */
 static bool __initdata opt_nosmp;
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 0a89f22a3980..9e79c1a6d6e6 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -35,6 +35,7 @@
 #include <asm/spec_ctrl.h>
 #include <asm/time.h>
 #include <asm/tboot.h>
+#include <asm/trampoline.h>
 #include <irq_vectors.h>
 #include <mach_apic.h>
 
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index ba0700d2d5da..d5db60d335e3 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -14,6 +14,8 @@
 #include <asm/e820.h>
 #include <asm/tboot.h>
 #include <asm/setup.h>
+#include <asm/trampoline.h>
+
 #include <crypto/vmac.h>
 
 /* tboot=<physical address of shared page> */
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index b2a280fba369..0d8e60252962 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -37,6 +37,8 @@ EMIT_FILE;
 #include <asm/numa.h>
 #include <asm/mem_paging.h>
 #include <asm/mem_sharing.h>
+#include <asm/trampoline.h>
+
 #include <public/memory.h>
 
 #ifdef CONFIG_PV32
-- 
2.39.2


