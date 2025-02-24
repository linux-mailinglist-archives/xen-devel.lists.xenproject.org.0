Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB9AA42764
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 17:07:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895268.1303902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazH-0004pd-IK; Mon, 24 Feb 2025 16:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895268.1303902; Mon, 24 Feb 2025 16:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazH-0004lv-Aa; Mon, 24 Feb 2025 16:07:19 +0000
Received: by outflank-mailman (input) for mailman id 895268;
 Mon, 24 Feb 2025 16:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48j1=VP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmazG-0003oc-Du
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 16:07:18 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b4fe0ec-f2c9-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 17:07:17 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso46054775e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 08:07:17 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02d6837sm109356675e9.13.2025.02.24.08.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 08:07:16 -0800 (PST)
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
X-Inumbo-ID: 6b4fe0ec-f2c9-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740413237; x=1741018037; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqs2ri15sfzFaC7F9ABm85vSLlP8o53QJK1dsgxDFAI=;
        b=gergOBXQHovQx0o2LaaqfesNdxDE0HGZOtA5GMklDP0EPtoRV2QCVjisFkeD1q0df6
         63WzjPNVXPY9Ry4r78cSTTxofOv7SpwE6TVTe1K3S4yxLnudrpkCHJeRbUaNJ09fC51K
         8ViWvG5KCtoQoIZHPgCEeQFDSEmfgS2LhfeWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413237; x=1741018037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqs2ri15sfzFaC7F9ABm85vSLlP8o53QJK1dsgxDFAI=;
        b=Kfds7yx5km7VrYlyVBCKxI5vduCimPdl4wrod8SMGf+vBr8L4ZpCDjUAsiJLdHFILj
         6KnJ+Xe8e9rXOMVR7EftzDU/WXCLuyueg6Yrm5lo14O6MqukhBApZSWgBmvAMCvHP4WX
         7yEkYrJtYmRuDoxYs9VKOhwu+4ttYAzGWJGnpw0bjhreaW202+TFiqtuYmAUYGVL07NQ
         JLCgwH+z7GnlP+o3mIKdBLbjPxwlXaU1fARuPunr2VYlP8q+vo9GixLqVEqxUatKoQ4e
         8csFo5mDDyuJ4nbcEkI4PlBgZFOrp9loRs6j/8j0ChdmfUjwonzy6OUZ8tr5zHqZY4UN
         PnrQ==
X-Gm-Message-State: AOJu0YzhUrX7WwTxY4VDGHkogE6MTO67SDXFYo11yHPgqxS3uwiFFoos
	Vu/7v4kQu7jlbN3Rs27YftYHj6dFTwACz63FXMK+F4EcNeO0U+bEUW9KYPxoiKX2eYmIChUNk1V
	Q
X-Gm-Gg: ASbGnctbjLIbmcBM0+3VkyeRXkyYqVda1q+93IvrFfHWmE4Y2ImSx04AySjqrFd0ZBR
	77GbAE9gXDn/bGvoE3V5S9WIUea++9oazX8e/2JazkzLo60dlLc0VaSpyt0P4sCVFPq6B1W1pPG
	4mbYOI2JkM7ozCLju/zt20q1Jkw45J7LoiEdz9AR1xwtjDD8F12gH5f4DSMuMyYdbp9yh1KN1y8
	QEDVXHbaSlFXNUvO+mL7JNvUGeuYl0qqv0kdCU5fOu5Bz8gF++EwvXWGMcbMtY8xhegpC8edUBg
	YXiQ8LY3F+93mO5xCfpBkP0JXx62ZOW+bcxROcVUVDDROw0THpZ1MDGnuw3BS+Bib6Np4D3j98c
	kCNSBrA==
X-Google-Smtp-Source: AGHT+IFdO2/tob/YlbgVoGHNyRf3tjSWVYo8AEV1AL0jYNyLp9S0lOZXJOCZSWz3IOsultllNDjgIw==
X-Received: by 2002:a05:600c:3c86:b0:439:9b80:ca6f with SMTP id 5b1f17b1804b1-439ae1d7272mr136814925e9.5.1740413236550;
        Mon, 24 Feb 2025 08:07:16 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 6/8] x86/IDT: Generate bsp_idt[] at build time
Date: Mon, 24 Feb 2025 16:05:07 +0000
Message-Id: <20250224160509.1117847-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... rather than dynamically at boot time.  Aside from less runtime overhead,
this approach is less fragile than the preexisting autogen stubs mechanism.

We can manage this with some linker calculations.  See patch comments for full
details.

For simplicity, we create a new set of entry stubs here, and clean up the old
ones in the subsequent patch.  bsp_idt[] needs to move from .bss to .data.

No functional change yet; the boot path still (re)writes bsp_idt[] at this
juncture.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

There's something differnet about LLD vs LD.  Without the ABSOLUTE() in
gen-idt.lds.h, LD is fine but LLD puts out symbols in the form:

  x86_IDT_entry_0xff_ADDR1|0000000000002fb0|   t  |            NOTYPE|                |     |.text
  x86_IDT_entry_0xff_ADDR2|0000000000004020|   a  |            NOTYPE|                |     |*ABS*

which causes a slew of errors making symbols for xen-syms:

  .xen-syms.0.S:20:8: error: out of range literal value
   .long 0x15a0 - (((((((261 >> 8) * 0xffff000000000000) | (261 << 39))) + ((1 << 39) / 2)) + (64 << 30)) + (1 << 30))
         ^

owing to half the symbols being t rather than a.  Moreover, this is reliable
for the full FreeBSD builds, but interminttent on randconfig.  I haven't
figured out which other option is having an effect.

Forcing them all to absolute works in both toolchains.
---
 xen/arch/x86/include/asm/gen-idt.h     | 121 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/gen-idt.lds.h |  27 ++++++
 xen/arch/x86/traps-init.c              |   4 -
 xen/arch/x86/x86_64/entry.S            |  76 ++++++++++++++++
 xen/arch/x86/xen.lds.S                 |   2 +
 5 files changed, 226 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/gen-idt.h
 create mode 100644 xen/arch/x86/include/asm/gen-idt.lds.h

diff --git a/xen/arch/x86/include/asm/gen-idt.h b/xen/arch/x86/include/asm/gen-idt.h
new file mode 100644
index 000000000000..a345af0ec774
--- /dev/null
+++ b/xen/arch/x86/include/asm/gen-idt.h
@@ -0,0 +1,121 @@
+/*
+ * Generator for IDT entries.
+ *
+ * Caller to provide GEN(vector, symbol, dpl, autogen) macro
+ *
+ * Symbols are 'entry_0xYY' if there is no better name available.  Regular
+ * handlers set autogen=1, while manual (autogen=0) require the symbol to be
+ * implemented somewhere else.
+ */
+
+#define DPL0 0
+#define DPL1 1
+#define DPL3 3
+
+#define manual 0
+#define autogen 1
+
+#define GEN16(i) \
+    GEN(0x ## i ## 0, entry_0x ## i ## 0, DPL0, autogen) \
+    GEN(0x ## i ## 1, entry_0x ## i ## 1, DPL0, autogen) \
+    GEN(0x ## i ## 2, entry_0x ## i ## 2, DPL0, autogen) \
+    GEN(0x ## i ## 3, entry_0x ## i ## 3, DPL0, autogen) \
+    GEN(0x ## i ## 4, entry_0x ## i ## 4, DPL0, autogen) \
+    GEN(0x ## i ## 5, entry_0x ## i ## 5, DPL0, autogen) \
+    GEN(0x ## i ## 6, entry_0x ## i ## 6, DPL0, autogen) \
+    GEN(0x ## i ## 7, entry_0x ## i ## 7, DPL0, autogen) \
+    GEN(0x ## i ## 8, entry_0x ## i ## 8, DPL0, autogen) \
+    GEN(0x ## i ## 9, entry_0x ## i ## 9, DPL0, autogen) \
+    GEN(0x ## i ## a, entry_0x ## i ## a, DPL0, autogen) \
+    GEN(0x ## i ## b, entry_0x ## i ## b, DPL0, autogen) \
+    GEN(0x ## i ## c, entry_0x ## i ## c, DPL0, autogen) \
+    GEN(0x ## i ## d, entry_0x ## i ## d, DPL0, autogen) \
+    GEN(0x ## i ## e, entry_0x ## i ## e, DPL0, autogen) \
+    GEN(0x ## i ## f, entry_0x ## i ## f, DPL0, autogen)
+
+
+GEN(0x00, entry_DE,         DPL0, manual)
+GEN(0x01, entry_DB,         DPL0, manual)
+GEN(0x02, entry_NMI,        DPL0, manual)
+GEN(0x03, entry_BP,         DPL3, manual)
+GEN(0x04, entry_OF,         DPL3, manual)
+GEN(0x05, entry_BR,         DPL0, manual)
+GEN(0x06, entry_UD,         DPL0, manual)
+GEN(0x07, entry_NM,         DPL0, manual)
+GEN(0x08, entry_DF,         DPL0, manual)
+GEN(0x09, entry_0x09,       DPL0, autogen) /* Coprocessor Segment Overrun */
+GEN(0x0a, entry_TS,         DPL0, manual)
+GEN(0x0b, entry_NP,         DPL0, manual)
+GEN(0x0c, entry_SS,         DPL0, manual)
+GEN(0x0d, entry_GP,         DPL0, manual)
+GEN(0x0e, early_page_fault, DPL0, manual)
+GEN(0x0f, entry_0x0f,       DPL0, autogen) /* PIC Spurious Interrupt Vector */
+
+GEN(0x10, entry_MF,         DPL0, manual)
+GEN(0x11, entry_AC,         DPL0, manual)
+GEN(0x12, entry_MC,         DPL0, manual)
+GEN(0x13, entry_XM,         DPL0, manual)
+GEN(0x14, entry_VE,         DPL0, autogen)
+GEN(0x15, entry_CP,         DPL0, manual)
+GEN(0x16, entry_0x16,       DPL0, autogen)
+GEN(0x17, entry_0x17,       DPL0, autogen)
+GEN(0x18, entry_0x18,       DPL0, autogen)
+GEN(0x19, entry_0x19,       DPL0, autogen)
+GEN(0x1a, entry_0x1a,       DPL0, autogen)
+GEN(0x1b, entry_0x1b,       DPL0, autogen)
+GEN(0x1c, entry_HV,         DPL0, autogen)
+GEN(0x1d, entry_VC,         DPL0, autogen)
+GEN(0x1e, entry_SX,         DPL0, autogen)
+GEN(0x1f, entry_0x1f,       DPL0, autogen)
+
+GEN16(2)
+GEN16(3)
+GEN16(4)
+GEN16(5)
+GEN16(6)
+GEN16(7)
+
+#ifdef CONFIG_PV
+GEN(0x80, entry_int80,      DPL0, manual)
+#else
+GEN(0x80, entry_0x80,       DPL0, autogen)
+#endif
+
+GEN(0x81, entry_0x81,       DPL0, autogen)
+
+#ifdef CONFIG_PV32
+GEN(0x82, entry_int82,      DPL1, manual)
+#else
+GEN(0x82, entry_0x82,       DPL0, autogen)
+#endif
+
+GEN(0x83, entry_0x83,       DPL0, autogen)
+GEN(0x84, entry_0x84,       DPL0, autogen)
+GEN(0x85, entry_0x85,       DPL0, autogen)
+GEN(0x86, entry_0x86,       DPL0, autogen)
+GEN(0x87, entry_0x87,       DPL0, autogen)
+GEN(0x88, entry_0x88,       DPL0, autogen)
+GEN(0x89, entry_0x89,       DPL0, autogen)
+GEN(0x8a, entry_0x8a,       DPL0, autogen)
+GEN(0x8b, entry_0x8b,       DPL0, autogen)
+GEN(0x8c, entry_0x8c,       DPL0, autogen)
+GEN(0x8d, entry_0x8d,       DPL0, autogen)
+GEN(0x8e, entry_0x8e,       DPL0, autogen)
+GEN(0x8f, entry_0x8f,       DPL0, autogen)
+
+GEN16(9)
+GEN16(a)
+GEN16(b)
+GEN16(c)
+GEN16(d)
+GEN16(e)
+GEN16(f)
+
+#undef autogen
+#undef manual
+
+#undef DPL3
+#undef DPL1
+#undef DPL0
+
+#undef GEN16
diff --git a/xen/arch/x86/include/asm/gen-idt.lds.h b/xen/arch/x86/include/asm/gen-idt.lds.h
new file mode 100644
index 000000000000..997cec0c4de1
--- /dev/null
+++ b/xen/arch/x86/include/asm/gen-idt.lds.h
@@ -0,0 +1,27 @@
+/*
+ * Linker file fragment to help format the IDT correctly
+ *
+ * The IDT, having grown compatibly since the 16 bit days, has the entrypoint
+ * address field split into 3.  x86 ELF lacks the @lo/@hi/etc relocation forms
+ * commonly found in other architectures for accessing a part of a resolved
+ * symbol address.
+ *
+ * However, the linker can perform the necessary calculations and provide them
+ * under new symbol names.  We use this to generate the low and next 16 bits
+ * of the address for each handler.
+ *
+ * The upper 32 bits are always a constant as Xen's .text/data/rodata sits in
+ * a single aligned 1G range, so do not need calculating in this manner.
+ */
+#ifndef X86_IDT_GEN_LDS_H
+#define X86_IDT_GEN_LDS_H
+
+#define GEN(vec, sym, dpl, auto)                                        \
+    PROVIDE_HIDDEN(IDT_ ## sym ## _ADDR1 = ABSOLUTE(((sym) & 0xffff))); \
+    PROVIDE_HIDDEN(IDT_ ## sym ## _ADDR2 = ABSOLUTE(((sym >> 16) & 0xffff)));
+
+#include <asm/gen-idt.h>
+
+#undef GEN
+
+#endif /* X86_IDT_GEN_LDS_H */
diff --git a/xen/arch/x86/traps-init.c b/xen/arch/x86/traps-init.c
index ae600526cbe3..3ee28319584d 100644
--- a/xen/arch/x86/traps-init.c
+++ b/xen/arch/x86/traps-init.c
@@ -3,9 +3,5 @@
  * Configuration of event handling for all CPUs.
  */
 #include <asm/idt.h>
-#include <asm/page.h>
-
-idt_entry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    bsp_idt[X86_IDT_VECTORS];
 
 DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index d866e626257b..313711a01184 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -1229,6 +1229,82 @@ FUNC(trap_nop, 0)
         iretq
 END(trap_nop)
 
+/*
+ * Automatically generated entrypoints, and IDT
+ */
+
+        .pushsection .data.page_aligned, "aw", @progbits
+DATA(bsp_idt, PAGE_SIZE)
+        .popsection
+
+/*
+ * Write an IDT Entry.  The linker provides us new _ADDR1/2 symbols calculated
+ * from \sym.
+ */
+.macro write_idte sym, dpl
+        .pushsection .data.page_aligned, "aw", @progbits
+        .word IDT_\sym\()_ADDR1
+        .word __HYPERVISOR_CS
+        .word 0x8e00 | (\dpl << 13) /* Present, DPL, Interrupt Gate */
+        .word IDT_\sym\()_ADDR2
+        .long __XEN_VIRT_START >> 32
+        .long 0
+        .popsection
+.endm
+
+/*
+ * Write an automatically generated stub.  Vectors in the exception range keep
+ * the stack properly aligned by judging whether the CPU pushed an error code
+ * or not.
+ *
+ * Alignment is forced to 16 because that's the size of the interrupt stub
+ * with CET active.
+ */
+.macro gen_entry vec, sym
+
+FUNC(\sym, 16)
+        ENDBR64
+
+        .if \vec < 0x20 /* Exception. */
+
+            test  $8, %spl       /* 64bit exception frames are 16 byte aligned, but the word */
+            jz    1f             /* size is 8 bytes.  Check whether the processor gave us an */
+            pushq $0             /* error code, and insert an empty one if not.              */
+1:          movb  $\vec, EFRAME_entry_vector(%rsp)
+            jmp   handle_exception
+
+        .else /* Interrupt. */
+
+            pushq $0
+            movb  $\vec, EFRAME_entry_vector(%rsp)
+            jmp   common_interrupt
+
+        .endif
+END(\sym)
+.endm
+
+/*
+ * Generator.  Write an entrypoint if necessary, and record an IDT entry.
+ */
+.macro gen vec, sym, dpl, auto
+
+        .if \auto
+            gen_entry \vec, \sym
+        .endif
+
+        write_idte \sym, \dpl
+.endm
+#define GEN(v, s, d, a) gen vec=v, sym=s, dpl=d auto=a;
+#include <asm/gen-idt.h>
+#undef GEN
+
+        .pushsection .data.page_aligned, "aw", @progbits
+END(bsp_idt)
+        .if . - bsp_idt != PAGE_SIZE
+            .error "Bad bsp_idt size, should be PAGE_SIZE"
+        .endif
+        .popsection
+
 /* Table of automatically generated entry points.  One per vector. */
         .pushsection .init.rodata, "a", @progbits
 DATA(autogen_entrypoints, 8)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 42217eaf2485..d4dd6434c466 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -8,6 +8,8 @@
 # define DECL_SECTION_WITH_LADDR
 #endif
 #include <xen/xen.lds.h>
+
+#include <asm/gen-idt.lds.h>
 #include <asm/page.h>
 #include <asm/trampoline.h>
 
-- 
2.39.5


