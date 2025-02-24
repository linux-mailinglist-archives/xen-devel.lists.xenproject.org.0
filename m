Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C5A4275D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 17:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895267.1303897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazH-0004m6-7q; Mon, 24 Feb 2025 16:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895267.1303897; Mon, 24 Feb 2025 16:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazH-0004ju-1z; Mon, 24 Feb 2025 16:07:19 +0000
Received: by outflank-mailman (input) for mailman id 895267;
 Mon, 24 Feb 2025 16:07:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48j1=VP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmazF-0003oc-89
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 16:07:17 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a74cff7-f2c9-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 17:07:16 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43aac0390e8so5807535e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 08:07:16 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02d6837sm109356675e9.13.2025.02.24.08.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 08:07:14 -0800 (PST)
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
X-Inumbo-ID: 6a74cff7-f2c9-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740413235; x=1741018035; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFJsQ/EffrIUlzYFRF2KwYzGjP98dz2R+aov7nCV9uM=;
        b=ZAtgZNzxQkzSGNdQxm3L8xZ5Xiq5xTynAKoyMOHvIBlBpThsf8zUjwc5wj8xKjuxi7
         RCsRUAw+PlennP7M5Fxv0pLsws0bqvnsfoHcLdKwkq7VGpq65hQ4PExQAsy6nkVQam76
         zBg6ujf7vaWS4e0skHRf/RExk3eYBie7lzLDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413235; x=1741018035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFJsQ/EffrIUlzYFRF2KwYzGjP98dz2R+aov7nCV9uM=;
        b=WY8HeJBY9sn/2Xb57KNqV+7l3iLKoj1gpG8aQoW5mZYeuLMAZsp0UNOVUqBAQ1D3zm
         wqgNzD/hSBlyAnZPGRg59QDLY08Abm4AIXvnDYpLChfgRiKQ00atZ78A1Z2reobl1KdA
         gjxmqynESKxNMERlgoZX9oI9C3xYf0kLiWS1682PVLdMISRwv9PyYLwyW8nWBELv9cOe
         bCufVBC0l0+LNSO/Lf+oLMRznQ3pO1dEtq607/k30tA3kMcrS567Zys5xFbXebuPzBZP
         1SLqZHgRWH81+XjkPaOGt82ZaXzepH+ks2NGNcsjjXzByy0L1M6cXYRPU5PByyldplGE
         SmYg==
X-Gm-Message-State: AOJu0YyzdxqwzYn1lvC6jy22mBNNWghZdTxUXIEcrZhfEGytSwMhuFIz
	bdCmt1H2Nkog8LTNWcSG+L10eFloqZEiV65pnOLPME4UN+1DNA70ceiZ17S7Vs/W7GMx7JsGsiB
	e
X-Gm-Gg: ASbGncsATn8N+D0Q6+Y9ciBinQbQyCY531v7bkKxTgCESFQufX7LqqrLeJi/jxVF4+m
	zThAV6YwFRaw6UisGtm6d5RsdhpxzwT/6GPMfBtqxJfkV589ShHx078THeiVVWjAK6qroSZ7Ps4
	aWUea2+Y4yGxxadMqrSldsQps8ICyp14Dgsxp5VgPlee/lK+x0HZcn41WD3xzrIDP40anhxGg3W
	BLb4SD4qL+yiFB1xPHkf7ynyFFXwU9Nm6ONEB9CJEsZCP3iYtbd9ooUExPfchOpDNn2cxfOYp+C
	qMOZsNeuJa0wxBPhelF7fue5hdHYTc067fefohI4NIlryJFjmhKS29i20nMRq5DuTpFpAYSpP/M
	UHIMQBw==
X-Google-Smtp-Source: AGHT+IE79iRkP1Na06GcO9H0r52YMm4ebPcOdyybCXvdOn4EIo5vYoznFQISQZZO1mtfuO3r+rB14w==
X-Received: by 2002:a05:600c:3150:b0:439:955d:7adb with SMTP id 5b1f17b1804b1-439ae222a7amr143397645e9.30.1740413235159;
        Mon, 24 Feb 2025 08:07:15 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/8] x86/IDT: Rename idt_table[] to bsp_idt[]
Date: Mon, 24 Feb 2025 16:05:05 +0000
Message-Id: <20250224160509.1117847-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Having variables named idt_table[] and idt_tables[] is not ideal.

Use X86_IDT_VECTORS and remove IDT_ENTRIES.  State the size of bsp_idt[] in
idt.h so that load_system_tables() and cpu_smpboot_alloc() can use sizeof()
rather than opencoding the calculation.

Move the variable into a new traps-init.c, to make a start at splitting
traps.c in half.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/Makefile          |  1 +
 xen/arch/x86/cpu/common.c      |  2 +-
 xen/arch/x86/include/asm/idt.h |  3 +--
 xen/arch/x86/pv/traps.c        |  4 ++--
 xen/arch/x86/smpboot.c         |  2 +-
 xen/arch/x86/traps-init.c      |  9 +++++++++
 xen/arch/x86/traps.c           | 14 +++++---------
 7 files changed, 20 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/x86/traps-init.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index b35fd5196ce2..9dc941a0943e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -65,6 +65,7 @@ obj-y += spec_ctrl.o
 obj-y += srat.o
 obj-y += string.o
 obj-y += time.o
+obj-y += traps-init.o
 obj-y += traps.o
 obj-$(CONFIG_INTEL) += tsx.o
 obj-y += usercopy.o
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 1540ab0007a0..e8b355ebcf36 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -831,7 +831,7 @@ void load_system_tables(void)
 	};
 	const struct desc_ptr idtr = {
 		.base = (unsigned long)idt_tables[cpu],
-		.limit = (IDT_ENTRIES * sizeof(idt_entry_t)) - 1,
+		.limit = sizeof(bsp_idt) - 1,
 	};
 
 	/*
diff --git a/xen/arch/x86/include/asm/idt.h b/xen/arch/x86/include/asm/idt.h
index 4ef52050a11b..29d1a7dfbc63 100644
--- a/xen/arch/x86/include/asm/idt.h
+++ b/xen/arch/x86/include/asm/idt.h
@@ -29,8 +29,7 @@ typedef union {
     };
 } idt_entry_t;
 
-#define IDT_ENTRIES 256
-extern idt_entry_t idt_table[];
+extern idt_entry_t bsp_idt[X86_IDT_VECTORS];
 extern idt_entry_t *idt_tables[];
 
 /*
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 77b034e4dc73..4aeb6cab5238 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -148,12 +148,12 @@ void __init pv_trap_init(void)
 {
 #ifdef CONFIG_PV32
     /* The 32-on-64 hypercall vector is only accessible from ring 1. */
-    _set_gate(idt_table + HYPERCALL_VECTOR,
+    _set_gate(bsp_idt + HYPERCALL_VECTOR,
               SYS_DESC_irq_gate, 1, entry_int82);
 #endif
 
     /* Fast trap for int80 (faster than taking the #GP-fixup path). */
-    _set_gate(idt_table + LEGACY_SYSCALL_VECTOR, SYS_DESC_irq_gate, 3,
+    _set_gate(bsp_idt + LEGACY_SYSCALL_VECTOR, SYS_DESC_irq_gate, 3,
               &entry_int80);
 
     open_softirq(NMI_SOFTIRQ, nmi_softirq);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index f3d60d5bae35..dc65f9e45269 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1080,7 +1080,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
         idt_tables[cpu] = alloc_xenheap_pages(0, memflags);
     if ( idt_tables[cpu] == NULL )
         goto out;
-    memcpy(idt_tables[cpu], idt_table, IDT_ENTRIES * sizeof(idt_entry_t));
+    memcpy(idt_tables[cpu], bsp_idt, sizeof(bsp_idt));
     disable_each_ist(idt_tables[cpu]);
 
     for ( stub_page = 0, i = cpu & ~(STUBS_PER_PAGE - 1);
diff --git a/xen/arch/x86/traps-init.c b/xen/arch/x86/traps-init.c
new file mode 100644
index 000000000000..b172ea933607
--- /dev/null
+++ b/xen/arch/x86/traps-init.c
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Configuration of event handling for all CPUs.
+ */
+#include <asm/idt.h>
+#include <asm/page.h>
+
+idt_entry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+    bsp_idt[X86_IDT_VECTORS];
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index a8a4fdaeb59c..f7965b3ffa50 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -102,10 +102,6 @@ DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, compat_gdt);
 DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, compat_gdt_l1e);
 #endif
 
-/* Master table, used by CPU0. */
-idt_entry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    idt_table[IDT_ENTRIES];
-
 /* Pointer to the IDT of every CPU. */
 idt_entry_t *idt_tables[NR_CPUS] __read_mostly;
 
@@ -2084,7 +2080,7 @@ void asmlinkage do_entry_CP(struct cpu_user_regs *regs)
 static void __init noinline __set_intr_gate(unsigned int n,
                                             uint32_t dpl, void *addr)
 {
-    _set_gate(&idt_table[n], SYS_DESC_irq_gate, dpl, addr);
+    _set_gate(&bsp_idt[n], SYS_DESC_irq_gate, dpl, addr);
 }
 
 static void __init set_swint_gate(unsigned int n, void *addr)
@@ -2150,10 +2146,10 @@ void __init init_idt_traps(void)
     set_intr_gate (X86_EXC_CP,  entry_CP);
 
     /* Specify dedicated interrupt stacks for NMI, #DF, and #MC. */
-    enable_each_ist(idt_table);
+    enable_each_ist(bsp_idt);
 
     /* CPU0 uses the master IDT. */
-    idt_tables[0] = idt_table;
+    idt_tables[0] = bsp_idt;
 
     this_cpu(gdt) = boot_gdt;
     if ( IS_ENABLED(CONFIG_PV32) )
@@ -2211,13 +2207,13 @@ void __init trap_init(void)
         if ( autogen_entrypoints[vector] )
         {
             /* Found autogen entry: check we won't clobber an existing trap. */
-            ASSERT(idt_table[vector].b == 0);
+            ASSERT(bsp_idt[vector].b == 0);
             set_intr_gate(vector, autogen_entrypoints[vector]);
         }
         else
         {
             /* No entry point: confirm we have an existing trap in place. */
-            ASSERT(idt_table[vector].b != 0);
+            ASSERT(bsp_idt[vector].b != 0);
         }
     }
 
-- 
2.39.5


