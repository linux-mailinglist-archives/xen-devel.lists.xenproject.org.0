Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF3CAB9D94
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 15:33:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987176.1372602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvBt-0000F3-1f; Fri, 16 May 2025 13:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987176.1372602; Fri, 16 May 2025 13:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvBs-0000DD-Ut; Fri, 16 May 2025 13:33:32 +0000
Received: by outflank-mailman (input) for mailman id 987176;
 Fri, 16 May 2025 13:33:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFvBr-0000D2-6K
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 13:33:31 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ab047b2-325a-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 15:33:30 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a361b8a66cso384097f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 06:33:30 -0700 (PDT)
Received: from andrew-laptop.. ([46.149.103.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88990sm2919757f8f.68.2025.05.16.06.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 06:33:28 -0700 (PDT)
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
X-Inumbo-ID: 5ab047b2-325a-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747402409; x=1748007209; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+563COaD5Tzxy42DVJiIP27O5Q90TLkJxpGFzPREXj4=;
        b=Bg0glXHKqiNNJ/6YKjniaGyx6j2IuPpd6YOTS9q5ImcffaTvCl9wScAvh+sU80u8b7
         O8kHMgzTZnbvXYw4/CPuDdF2xFlLZy/6v18GQcVohSRRcL/YA9pN4KWe9S9URiHiWa8A
         p62+SLQmRmint5E671YZVLWtBRsf3XANthPmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402409; x=1748007209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+563COaD5Tzxy42DVJiIP27O5Q90TLkJxpGFzPREXj4=;
        b=gbproIwZMWrx3+MmprzzEDxw4hPNboKojzJuj9Rf8l/0giDbDo+sAtmtWzn5u1lkNA
         mxOeUMi25Mqc9QM1YDUkdgjK5L+vWHg0jMdCxPH6SxHIpFOG5T3wBU/pqHTNT8kSET5v
         Pcuh4DhX+lMnAJEzpJbOWwi/goZeaRKIGAyIFrNUxgXGdKGKDyMePE11H38kzVMDJiyp
         Dy2Cum6mjgLIdsT1XNgCYwmXvWsnEwhHaClAmQ/B2A0RZ4PBF0Yj0/0p05sfPR7K6QG+
         WSBv8mgntoDlEOzIhdLx1WLm2+KRNVeVOEAcpFT2j4qRsLiqydADr9nZ0si9vFDwBr5g
         PQQA==
X-Gm-Message-State: AOJu0YwkLBjYREcnzwndRNRPH809o3XHkbm8YpKFPIxGdDMtl+I8awgr
	I5MSOuqgvYhfoQYuMfWEaJPb+kntdNEF1iZBgc86jxlVkeZzmEIuhHXErFgnEQNTf3JdF0UlZ2R
	Ldlek
X-Gm-Gg: ASbGncsMySx/kJvgOGiffgfpSP0qM0Ip7BnK6bONQktriHnrQbuTKbPNvV4RsnF6RGn
	rqZ6zErhXkcZ/yaKgmHTGfvsO/mYgYUu7HWW6GGh1CT9m6Gb3DUCfBoD6t3j/jYu1z4+BC6mbvl
	WOvRwEiZNTZHcCWeHAzrQUjvPv3HPSnERNjELe/F1Gli0BM/SmHbe92/Js58rs9DEJm/MeZt4GU
	0/PTKxHQWWI+N5D/ce/7rkAHqorKC8fvDi809CmrcaE11IH4qpMnD5OeSexmmfZqda23u/1CIGJ
	6X5ll+LXYkfczNvRgxSugiK/1CwtIcJ1qM3Bol1A9MjEer2lO/11Fomzt/c3lbU=
X-Google-Smtp-Source: AGHT+IGBZcA/D0toS/bzcF2SEeqek/9hmi29cajL7lU/dxawRyQdg/bLnBswuTorEq6YmiJwR4jRmQ==
X-Received: by 2002:a5d:64ee:0:b0:3a0:8495:cb75 with SMTP id ffacd0b85a97d-3a35c834f85mr3921790f8f.9.1747402409082;
        Fri, 16 May 2025 06:33:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/stubs: Consolidate the stubs infrastructure in asm/stubs.h
Date: Fri, 16 May 2025 14:33:26 +0100
Message-Id: <20250516133326.49587-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Very few files need the stubs.  Move the infrastructure out of
processor.h and config.h into a new stubs.h, and adjust the includes
accordingly.

Make the per-cpu struct stubs be read mostly; they're unmodified
during the uptime of the CPU, and move them into smpboot.c seeing as
that's where they're allocated and freed.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

This is from one of my several failed attempts to deal with the stubs
more nicely in XSA-469.  Still, getting the infrastructure out of
processor.h is a good cleanup.

The FRED series is probably going to result in getting rid of
x86_64/traps.c, given that most of the content gets dropped.
---
 xen/arch/x86/alternative.c           |  1 +
 xen/arch/x86/extable.c               |  8 +++---
 xen/arch/x86/hvm/vmx/vmx.c           |  1 +
 xen/arch/x86/include/asm/config.h    |  5 ----
 xen/arch/x86/include/asm/processor.h | 11 ---------
 xen/arch/x86/include/asm/stubs.h     | 37 ++++++++++++++++++++++++++++
 xen/arch/x86/pv/emul-priv-op.c       |  1 +
 xen/arch/x86/setup.c                 |  1 +
 xen/arch/x86/smpboot.c               |  3 +++
 xen/arch/x86/x86_64/traps.c          |  3 +--
 xen/arch/x86/x86_emulate/private.h   |  2 ++
 11 files changed, 52 insertions(+), 21 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/stubs.h

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index ecc56964bd9c..d4fe56b3dae8 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -11,6 +11,7 @@
 #include <asm/alternative.h>
 #include <xen/init.h>
 #include <asm/setup.h>
+#include <asm/stubs.h>
 #include <asm/system.h>
 #include <asm/traps.h>
 #include <asm/nmi.h>
diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 1572efa69a00..8b78c75d3374 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -1,16 +1,18 @@
 
+#include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/list.h>
+#include <xen/livepatch.h>
 #include <xen/perfc.h>
 #include <xen/rcupdate.h>
 #include <xen/sort.h>
 #include <xen/spinlock.h>
-#include <asm/uaccess.h>
-#include <xen/domain_page.h>
 #include <xen/virtual_region.h>
-#include <xen/livepatch.h>
 #include <xen/warning.h>
 
+#include <asm/stubs.h>
+#include <asm/uaccess.h>
+
 #define EX_FIELD(ptr, field) ((unsigned long)&(ptr)->field + (ptr)->field)
 
 static inline unsigned long ex_addr(const struct exception_table_entry *x)
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 827db6bdd807..c2262c584822 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -48,6 +48,7 @@
 #include <asm/monitor.h>
 #include <asm/prot-key.h>
 #include <asm/spec_ctrl.h>
+#include <asm/stubs.h>
 #include <public/arch-x86/cpuid.h>
 
 static bool __initdata opt_force_ept;
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index f0123a7de983..3553bf89dc97 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -49,11 +49,6 @@
 /* Primary shadow stack is slot 5 of 8, immediately under the primary stack. */
 #define PRIMARY_SHSTK_SLOT 5
 
-/* Total size of syscall and emulation stubs. */
-#define STUB_BUF_SHIFT (L1_CACHE_SHIFT > 7 ? L1_CACHE_SHIFT : 7)
-#define STUB_BUF_SIZE  (1 << STUB_BUF_SHIFT)
-#define STUBS_PER_PAGE (PAGE_SIZE / STUB_BUF_SIZE)
-
 /* Return value for zero-size _xmalloc(), distinguished from NULL. */
 #define ZERO_BLOCK_PTR ((void *)0xBAD0BAD0BAD0BAD0UL)
 
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index eacd425c5350..1820e04a32f9 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -424,17 +424,6 @@ static inline void enable_nmis(void)
 
 void nocall sysenter_entry(void);
 
-struct stubs {
-    union {
-        void(*func)(void);
-        unsigned long addr;
-    };
-    unsigned long mfn;
-};
-
-DECLARE_PER_CPU(struct stubs, stubs);
-unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
-
 static inline uint8_t get_cpu_family(uint32_t raw, uint8_t *model,
                                      uint8_t *stepping)
 {
diff --git a/xen/arch/x86/include/asm/stubs.h b/xen/arch/x86/include/asm/stubs.h
new file mode 100644
index 000000000000..a520928e9a50
--- /dev/null
+++ b/xen/arch/x86/include/asm/stubs.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_ASM_STUBS_H
+#define X86_ASM_STUBS_H
+
+/*
+ * Xen has several per-cpu executable stubs which are written dynamically.
+ * These are:
+ *
+ * - The SYSCALL entry stubs, LSTAR and CSTAR.  These are written on boot, and
+ *   are responsible for moving back onto Xen's stack.
+ *
+ * - The emulation stub.  This is used to replay an instruction or sequence
+ *   which trapped for emulation.
+ *
+ * The stubs have an executable alias in l2_xenmap[] (i.e. within 1G of the
+ * rest of .text), and are written via map_domain_page().
+ */
+
+#include <xen/percpu.h>
+
+/* Total size of syscall and emulation stubs. */
+#define STUB_BUF_SHIFT (L1_CACHE_SHIFT > 7 ? L1_CACHE_SHIFT : 7)
+#define STUB_BUF_SIZE  (1 << STUB_BUF_SHIFT)
+#define STUBS_PER_PAGE (PAGE_SIZE / STUB_BUF_SIZE)
+
+struct stubs {
+    union {
+        void (*func)(void);
+        unsigned long addr;
+    };
+    unsigned long mfn;
+};
+
+DECLARE_PER_CPU(struct stubs, stubs);
+unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
+
+#endif /* X86_ASM_STUBS_H */
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 295d847ea24c..4da3f379ef3e 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -21,6 +21,7 @@
 #include <asm/pv/domain.h>
 #include <asm/pv/trace.h>
 #include <asm/shared.h>
+#include <asm/stubs.h>
 
 #include <xsm/xsm.h>
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 25189541244d..1f5cb67bd0ee 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -55,6 +55,7 @@
 #include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/spec_ctrl.h>
+#include <asm/stubs.h>
 #include <asm/tboot.h>
 #include <asm/trampoline.h>
 #include <asm/traps.h>
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 0189d6c332a4..41fe67d43c94 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -38,6 +38,7 @@
 #include <asm/prot-key.h>
 #include <asm/setup.h>
 #include <asm/spec_ctrl.h>
+#include <asm/stubs.h>
 #include <asm/tboot.h>
 #include <asm/time.h>
 #include <asm/trampoline.h>
@@ -57,6 +58,8 @@ static cpumask_t scratch_cpu0mask;
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, send_ipi_cpumask);
 static cpumask_t send_ipi_cpu0mask;
 
+DEFINE_PER_CPU_READ_MOSTLY(struct stubs, stubs);
+
 cpumask_t cpu_online_map __read_mostly;
 EXPORT_SYMBOL(cpu_online_map);
 
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index ac0fafd72d31..b10bd0becafb 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -21,6 +21,7 @@
 #include <asm/nmi.h>
 #include <asm/page.h>
 #include <asm/shared.h>
+#include <asm/stubs.h>
 #include <asm/traps.h>
 
 
@@ -330,8 +331,6 @@ static unsigned int write_stub_trampoline(
     return ROUNDUP(p - stub, 16);
 }
 
-DEFINE_PER_CPU(struct stubs, stubs);
-
 void nocall lstar_enter(void);
 void nocall cstar_enter(void);
 
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 30be59547032..c4138afe1db5 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -10,8 +10,10 @@
 
 # include <xen/bug.h>
 # include <xen/kernel.h>
+
 # include <asm/endbr.h>
 # include <asm/msr-index.h>
+# include <asm/stubs.h>
 # include <asm/x86-vendors.h>
 # include <asm/x86_emulate.h>
 
-- 
2.34.1


