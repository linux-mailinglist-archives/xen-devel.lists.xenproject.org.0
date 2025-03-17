Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BA7A65DC7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 20:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918005.1322790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuG0n-0006HL-Gr; Mon, 17 Mar 2025 19:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918005.1322790; Mon, 17 Mar 2025 19:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuG0n-0006Fa-C2; Mon, 17 Mar 2025 19:20:33 +0000
Received: by outflank-mailman (input) for mailman id 918005;
 Mon, 17 Mar 2025 19:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuG0l-0005ZB-L0
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 19:20:31 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e43407ae-0364-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 20:20:31 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so1181958f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 12:20:31 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe292d0sm113505845e9.20.2025.03.17.12.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 12:20:29 -0700 (PDT)
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
X-Inumbo-ID: e43407ae-0364-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742239230; x=1742844030; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfALmh2Mta205aGWnBqRuhdKfESvLlwk5s7oemAqxsg=;
        b=FHEd6ngtfM5ErNhdHFIPyjLkJm0JLcKhbP9dIilgCRoP+5W9US9scxBx1G/+AAKrNx
         hLFM5/4apzOeD2mqK95wD5GOedfJqttePoR1bXELMP14H7ciBfzcyJbDZ2uw14M/2+MF
         v54K2CG7jfkGSW4E3tQqSc/WVnVzuyVHezc98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742239230; x=1742844030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfALmh2Mta205aGWnBqRuhdKfESvLlwk5s7oemAqxsg=;
        b=igQLSJb5BGm+lMYUiPZnZkbRx2J4jgWvsVH+Zjt3xYmy/aUoGRgEJm7ZxjhD7sEmLC
         5nVLDMnofzo8sXFATWFcF2/1zEv6wd3AUej8EPSu6irs9YDm8eK97wlG+if/W3oMYhs3
         6eBl99UQdasFYoatLUtxvmg2WmRoac9NWSkebQgYNNvuhqqF4oFwPXMtTVpRamqcafgW
         SpPRZbkNj/FbufjFNUrM3flKRrErC53Ryj9Wzz1+DWr4/7P1JFRB43NkblG9HmC7CFpl
         GZng7isRPfhxMy4In24IIoQNu9pJWjYaH0R6tKbabkVJ2S80+u71bDfKVWfH1ocspAFo
         QO7g==
X-Gm-Message-State: AOJu0Ywl/BteNwUP2pzpNuadcML9AHEUwV3Rc40poMVvk7SreB0M80cz
	Ln9wHrcwEz82GPAEu96b3Kt0JgrvbYAl94WZBBbIpe22a1Yie1dNnv28z1UGG8fgrgC6m67n51B
	8
X-Gm-Gg: ASbGncvcVA+Brn2NJq7oCmmtnPnGKsBj0qUARKYU6njAI/TYfci5ixVcw5Vvxc8gAXQ
	KhqvU0d+2SNkOBtMEniTcenPtIqdJ3UQey+2RTCa6XbxsMmBrXulZhhivns2aJjsofbateFfuKY
	YiHpOfwBfGkLbDE9dEoYY350En7AKiLs9DMG87QNlrYurJJFPA0YZ2evcySxoeHClQB+C8CCoLz
	yBuoeT32RhYpF71mcgovfhIELIXRGafHxQTGIJ0+zxOH8OukjMPBKh3TNe3QCK7d1VY70w74xH4
	n8Is7FLxzVW1G47xLQ8zELM5xF6xBEOq7fVfncyy92yjMkv+xMCWOvk8FIcjnYLKoC0brGgbfYL
	pF2FcejlouqSsrcZhil/gGaS+
X-Google-Smtp-Source: AGHT+IH6SnuKA9Qh36JS9CV63sf4fZQsWn8byy++oyL1vIa/RK/cvvQBD22JJPW6Mangixbx9yWaZw==
X-Received: by 2002:a05:6000:4027:b0:391:1222:b444 with SMTP id ffacd0b85a97d-3971e9720d7mr13011538f8f.20.1742239230150;
        Mon, 17 Mar 2025 12:20:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/4] x86/traps: Introduce early_traps_init() and simplify setup
Date: Mon, 17 Mar 2025 19:20:23 +0000
Message-Id: <20250317192023.568432-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317192023.568432-1-andrew.cooper3@citrix.com>
References: <20250317192023.568432-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Something I overlooked when last cleaning up exception handling is that a TSS
is not necessary if IST isn't configured, and IST isn't necessary until we're
running guest code.

Introduce early_traps_init() which is far more minimal than init_idt_traps();
bsp_ist[] is constructed without IST settings, so all early_traps_init() needs
to do is load the IDT, and invalidate TR/LDTR.

Put the remaining logic into traps_init(), later on boot.  Note that
load_system_tables() already contains enable_each_ist(), so the call is simply
dropped.

This removes some complexity prior to having exception support, and lays the
groundwork to not even allocate a TSS when using FRED.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/system.h |  1 -
 xen/arch/x86/include/asm/traps.h  |  1 +
 xen/arch/x86/setup.c              |  3 +--
 xen/arch/x86/traps-setup.c        | 32 +++++++++++++++++++++++++++++++
 xen/arch/x86/traps.c              | 13 -------------
 5 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
index 1bf6bd026852..8ceaaf45d1a0 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -263,7 +263,6 @@ static inline int local_irq_is_enabled(void)
 #define BROKEN_ACPI_Sx          0x0001
 #define BROKEN_INIT_AFTER_S1    0x0002
 
-void init_idt_traps(void);
 void load_system_tables(void);
 void subarch_percpu_traps_init(void);
 
diff --git a/xen/arch/x86/include/asm/traps.h b/xen/arch/x86/include/asm/traps.h
index 3d30aa6738d4..72c33a33e283 100644
--- a/xen/arch/x86/include/asm/traps.h
+++ b/xen/arch/x86/include/asm/traps.h
@@ -7,6 +7,7 @@
 #ifndef ASM_TRAP_H
 #define ASM_TRAP_H
 
+void early_traps_init(void);
 void traps_init(void);
 void percpu_traps_init(void);
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 5e2411a008f5..6a6ddc569500 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1093,8 +1093,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     percpu_init_areas();
 
-    init_idt_traps();
-    load_system_tables();
+    early_traps_init();
 
     smp_prepare_boot_cpu();
     sort_exception_tables();
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index 1a7b42c14bf2..67a6fda89ad9 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -55,6 +55,31 @@ static void __init init_ler(void)
     setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
 }
 
+/*
+ * Configure basic exception handling.  This is prior to parsing the command
+ * line or configuring a console, and needs to be as simple as possible.
+ *
+ * boot_gdt is already loaded, and bsp_idt[] is constructed without IST
+ * settings, so we don't need a TSS configured yet.
+ *
+ * Load bsp_idt[], and invalidate the TSS and LDT.
+ */
+void __init early_traps_init(void)
+{
+    const struct desc_ptr idtr = {
+        .base = (unsigned long)bsp_idt,
+        .limit = sizeof(bsp_idt) - 1,
+    };
+
+    lidt(&idtr);
+
+    _set_tssldt_desc(boot_gdt + TSS_ENTRY - FIRST_RESERVED_GDT_ENTRY,
+                     0, 0, SYS_DESC_tss_avail);
+
+    ltr(TSS_SELECTOR);
+    lldt(0);
+}
+
 /*
  * Configure complete exception, interrupt and syscall handling.
  */
@@ -63,6 +88,13 @@ void __init traps_init(void)
     /* Replace early pagefault with real pagefault handler. */
     _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
 
+    this_cpu(idt) = bsp_idt;
+    this_cpu(gdt) = boot_gdt;
+    if ( IS_ENABLED(CONFIG_PV32) )
+        this_cpu(compat_gdt) = boot_compat_gdt;
+
+    load_system_tables();
+
     init_ler();
 
     /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 79d92f21acf5..25e0d5777e6e 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1858,19 +1858,6 @@ void asmlinkage do_entry_CP(struct cpu_user_regs *regs)
     panic("CONTROL-FLOW PROTECTION FAULT: #CP[%04x] %s\n", ec, err);
 }
 
-void __init init_idt_traps(void)
-{
-    /* Specify dedicated interrupt stacks for NMI, #DF, and #MC. */
-    enable_each_ist(bsp_idt);
-
-    /* CPU0 uses the master IDT. */
-    this_cpu(idt) = bsp_idt;
-
-    this_cpu(gdt) = boot_gdt;
-    if ( IS_ENABLED(CONFIG_PV32) )
-        this_cpu(compat_gdt) = boot_compat_gdt;
-}
-
 void asm_domain_crash_synchronous(unsigned long addr)
 {
     /*
-- 
2.39.5


