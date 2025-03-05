Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC12A4F20C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 01:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901602.1309567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcFq-000153-Ux; Wed, 05 Mar 2025 00:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901602.1309567; Wed, 05 Mar 2025 00:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcFq-00010l-Om; Wed, 05 Mar 2025 00:04:54 +0000
Received: by outflank-mailman (input) for mailman id 901602;
 Wed, 05 Mar 2025 00:04:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOX7=VY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpcFp-0000xY-Rm
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 00:04:53 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75b76109-f955-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 01:04:51 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso42237735e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 16:04:51 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd435300esm476005e9.29.2025.03.04.16.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 16:04:50 -0800 (PST)
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
X-Inumbo-ID: 75b76109-f955-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741133091; x=1741737891; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20uF2Iga/fxD6mPTxR1JHcaCmNNH+v7vkrBaBajttPg=;
        b=d37h7XmYyrsLv2HaohzsxGQFDI+WGuE9Bzu/Wx6Yz52RV4U8j0syrLGoqIQK4HOZjN
         d/tet4HyxOfZc+jzqJ1+Ec5UkdKLMy6uO2RTG7Rq2UNo0/rQFaBGCBP5QRrkqogtpWmV
         LLO1JyCJBDeik5bGcFmUKlz+GI07dukqB2Wuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741133091; x=1741737891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20uF2Iga/fxD6mPTxR1JHcaCmNNH+v7vkrBaBajttPg=;
        b=JcZIIb3kOaDKL/C+5GIWR2nW/an9fowxTlkce16iDye9BzYQg8SVmKz6kF2DMa7fRO
         qgJ8TRNClQVh/AsLruGvn7aZesKWNS+eTF+6lkKXHi0M/rFUfNIQGg7bvUiR+VnnEAtf
         hB4P7DTTE+0pr0B+E8VfGkJDCT7D2ze9l9ZS95ELFkJn+MTSiVU00kyQw9aIRB+vfGOD
         FvauVU36/oIe0JshyaBTXLTjknErCpoKuIJgVUg70pOIHhOQr7zs+QzHvSq8XSheucp4
         qvn6BrEzNjptnNJTJdU9D5NyOxQYy/r9dat+ktmvL2sGmeV/VPQn+0l4DtJdl417ix40
         o+wA==
X-Gm-Message-State: AOJu0YyvPxC2hf8Vro0Mb4ZzyFOodAhUizaYIUL44PEVAcXBHjMYHrY3
	jIpAD9URiobEk1EEhten6ebl8QRg+WTtsn5NadRjXWAOCUWa9iq3bjN/qNMp+2kwIFaa7XDTXz/
	Z
X-Gm-Gg: ASbGncsPITbFyYIfEtKnC33/LBa89mo1UyjyPD1wc2ebXlHc8k4RE7dVS+lsNYhYwlC
	fLl1pzsdHkl3tkH3XEKgybIynWgnG8Fu2ZKjSyHENP+h0tQjPCzC6faTKb+yTwSNZfQ9JLwT9Fn
	+EvYzTHZHBM1DshPPAHkZgEbNSV2omv5bhea7oRhpwXbYFxtkDR1fbCBOLadLR8YGuDNpwQxuwK
	ue1tRjA53IlwhXZESUuju9MjzKsHoGUV5UrQsNzt3nhZxpPXTBPUecExfQo1vcSMLefnw04rXn7
	rm5Cy//RRV2vj2Lj9WtN9gGeEdfQw/9BcsBj+N4/rlraR0ifZAwUazZwQACiCZBLkKm5xD7hqFK
	7SsQ3KTFtecNyV8jclYA/vybS
X-Google-Smtp-Source: AGHT+IGUTZPbGF+4RiCdeYQfJRTkIo15iueUl4yKPiI2Yc9GORUmJjisXv3iq0zZ5lepAaUgJ+/8tg==
X-Received: by 2002:a05:600c:4e8b:b0:43b:d0fe:b8be with SMTP id 5b1f17b1804b1-43bd29d8d45mr5900275e9.30.1741133090845;
        Tue, 04 Mar 2025 16:04:50 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/5] x86/IDT: Rename idt_table[] to bsp_idt[]
Date: Wed,  5 Mar 2025 00:02:43 +0000
Message-Id: <20250305000247.2772029-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
References: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Having variables named idt_table[] and idt_tables[] is not ideal.

Use X86_IDT_VECTORS and remove IDT_ENTRIES.  State the size of bsp_idt[] in
idt.h so that load_system_tables() and cpu_smpboot_alloc() can use sizeof()
rather than opencoding the calculation.

Move the variable into a new traps-setup.c, to make a start at splitting
traps.c in half.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rename traps-init.c to traps-setup.c
---
 xen/arch/x86/Makefile          |  1 +
 xen/arch/x86/cpu/common.c      |  2 +-
 xen/arch/x86/include/asm/idt.h |  3 +--
 xen/arch/x86/pv/traps.c        |  4 ++--
 xen/arch/x86/smpboot.c         |  2 +-
 xen/arch/x86/traps-setup.c     |  9 +++++++++
 xen/arch/x86/traps.c           | 14 +++++---------
 7 files changed, 20 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/x86/traps-setup.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index b35fd5196ce2..c763f80b0b22 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -65,6 +65,7 @@ obj-y += spec_ctrl.o
 obj-y += srat.o
 obj-y += string.o
 obj-y += time.o
+obj-y += traps-setup.o
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
index 3689fdecbec3..f00368f28c86 100644
--- a/xen/arch/x86/include/asm/idt.h
+++ b/xen/arch/x86/include/asm/idt.h
@@ -28,8 +28,7 @@ typedef union {
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
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
new file mode 100644
index 000000000000..b172ea933607
--- /dev/null
+++ b/xen/arch/x86/traps-setup.c
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
index 4d1aaa78e711..7a68996b02f7 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -98,10 +98,6 @@ DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, compat_gdt);
 DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, compat_gdt_l1e);
 #endif
 
-/* Master table, used by CPU0. */
-idt_entry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    idt_table[IDT_ENTRIES];
-
 /* Pointer to the IDT of every CPU. */
 idt_entry_t *idt_tables[NR_CPUS] __read_mostly;
 
@@ -1874,7 +1870,7 @@ void asmlinkage do_entry_CP(struct cpu_user_regs *regs)
 static void __init noinline __set_intr_gate(unsigned int n,
                                             uint32_t dpl, void *addr)
 {
-    _set_gate(&idt_table[n], SYS_DESC_irq_gate, dpl, addr);
+    _set_gate(&bsp_idt[n], SYS_DESC_irq_gate, dpl, addr);
 }
 
 static void __init set_swint_gate(unsigned int n, void *addr)
@@ -1940,10 +1936,10 @@ void __init init_idt_traps(void)
     set_intr_gate (X86_EXC_CP,  entry_CP);
 
     /* Specify dedicated interrupt stacks for NMI, #DF, and #MC. */
-    enable_each_ist(idt_table);
+    enable_each_ist(bsp_idt);
 
     /* CPU0 uses the master IDT. */
-    idt_tables[0] = idt_table;
+    idt_tables[0] = bsp_idt;
 
     this_cpu(gdt) = boot_gdt;
     if ( IS_ENABLED(CONFIG_PV32) )
@@ -2001,13 +1997,13 @@ void __init trap_init(void)
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


