Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D9A6AF0C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 21:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923147.1326810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvMKg-0000xN-WD; Thu, 20 Mar 2025 20:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923147.1326810; Thu, 20 Mar 2025 20:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvMKg-0000vv-Sc; Thu, 20 Mar 2025 20:17:38 +0000
Received: by outflank-mailman (input) for mailman id 923147;
 Thu, 20 Mar 2025 20:17:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvMKf-0000vp-FV
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 20:17:37 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c751740-05c8-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 21:17:35 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so7658515e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 13:17:35 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9ef1f7sm453052f8f.82.2025.03.20.13.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 13:17:33 -0700 (PDT)
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
X-Inumbo-ID: 5c751740-05c8-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742501854; x=1743106654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYN9cj5fVuzzDFxUsBIlSBpe5mpFWhjf5+kj7AWzhAk=;
        b=ZU3nOfB6+gZq6OkPZbbuHANegpym7gGSxzoXqvXTFdBuZVpiDSbA9nPXOQFnpmJ6PF
         yJsK2GBa+Rk0UrC9cwnGPJESws/eN7A+spnEy6gTuHwmEmNJwrd6z26I95H041FP9c4S
         WYQEuagH0at7E3m+kiwi7Q8CGbzXfhqrNw/5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742501854; x=1743106654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYN9cj5fVuzzDFxUsBIlSBpe5mpFWhjf5+kj7AWzhAk=;
        b=GswcYRwObyJ455AJX+LXnR97ZXbgNOy/mLruspxr8vBwIMX6wPRlNqwf2TwLS6rXKw
         U3uQB2OorsSfD2rMwQppZMHChA+qC9/3SD91QzP+K33mbVjrerNa6JPTbSPfo65+LQda
         f5VpOOcAA9zWIPv9P1FZPrrfOeL7VX7rrH012CkrizEwy8lFmOAp82QxJMJoM59DQ20L
         PDrXn+uxagRrpesuPyLbgmV9fK8GPd6y2y5S0XhIlRuKMDkEfzW6CQQW2UXDsTHTLcqm
         BpM235U6vLC5Bn+3D2Enk+X0jPuh/7Hz0S30WL9HLWQXxzqf2Rlw92XrNHDoI6h/7+uR
         mhJw==
X-Gm-Message-State: AOJu0YwVmg7Yq0/S740KSAp3GcBgx5N9KQnoPuzpQN5DNkhlZqs0gkNj
	mf0wAhHYC2Zo1mNdnf0YQcH9PnWI3KzYq0FEROCyZfYVjlWvoHb6MF09wOzdK9tlU/TunY/wRVX
	+
X-Gm-Gg: ASbGncv0zAMdvMWPSwnChUeC8dODXbv62KKjq3bh1r5q0SX+Qq9ESWg0xzDWd3MaFXH
	5/Q5L77cqInV7tj3D2/dbgP6vCSwTBFDn9U/GHkjJ+nguOtgGadz9nuicv+Ywv7BOS2PPDzB3p/
	rEsb0m/RcUHU4MhAK86hztB6khhuRSYzAn/S3Mh610KWlK0g5/C8fvMylBs5ei8zh1u3EdgADjV
	JXkXOPH6onLzVQEGpUKT5Ut4wXyKTe4Yf87TEokAqU18ofDEN91XKvJDgTs5Of8Cpf1RszLCTv/
	/p/VFmynj71Na7LgZzzM3XX1WbBjRttqYOjnIX/KEzsvJ7cb2i14OpV4W0C6KDEESCp5myqmkTc
	+9TpQ2LJKLsDex5Apzw==
X-Google-Smtp-Source: AGHT+IHsEk2Qzb98us/ELKyt+QyWO8kpUAywZMlThwo0AASIJbxmEcgzDs/ZaU9xFNA/q4xTOxwI6w==
X-Received: by 2002:a05:600c:470f:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43d509e190fmr4089785e9.4.1742501854340;
        Thu, 20 Mar 2025 13:17:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/4] x86/traps: Introduce early_traps_init() and simplify setup
Date: Thu, 20 Mar 2025 20:17:32 +0000
Message-Id: <20250320201732.84094-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317192023.568432-5-andrew.cooper3@citrix.com>
References: <20250317192023.568432-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Something I overlooked when last cleaning up exception handling is that a TSS
is not necessary if IST isn't configured, and IST isn't necessary until we're
running guest code.

Introduce early_traps_init(), and rearrange the existing logic between this
and traps_init() later on boot, to allow defering TSS and IST setup.

In early_traps_init(), load the IDT and invalidate TR/LDTR; this sufficient
system-table setup to make exception handling work.  The setup of the BSPs
per-cpu variables stay early too; they're used on certain error paths.

Move load_system_tables() later into traps_init().  Note that it already
contains enable_each_ist(), so the call is simply dropped.

This removes some complexity prior to having exception support, and lays the
groundwork to not even allocate a TSS when using FRED.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Keep this_cpu(idt) early.
---
 xen/arch/x86/include/asm/system.h |  1 -
 xen/arch/x86/include/asm/traps.h  |  1 +
 xen/arch/x86/setup.c              |  5 ++---
 xen/arch/x86/traps-setup.c        | 32 +++++++++++++++++++++++++++++++
 xen/arch/x86/traps.c              | 13 -------------
 5 files changed, 35 insertions(+), 17 deletions(-)

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
index 993a6202a398..7d6e52a55f2f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1087,14 +1087,13 @@ void asmlinkage __init noreturn __start_xen(void)
     };
     const char *hypervisor_name;
 
-    /* Critical region without IDT or TSS.  Any fault is deadly! */
+    /* Critical region without exception handling.  Any fault is deadly! */
 
     init_shadow_spec_ctrl_state();
 
     percpu_init_areas();
 
-    init_idt_traps();
-    load_system_tables();
+    early_traps_init();
 
     smp_prepare_boot_cpu();
     sort_exception_tables();
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index 1a7b42c14bf2..a8385b26ae9b 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -55,6 +55,36 @@ static void __init init_ler(void)
     setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
 }
 
+/*
+ * Configure basic exception handling.  This is prior to parsing the command
+ * line or configuring a console, and needs to be as simple as possible.
+ *
+ * boot_gdt is already loaded, and bsp_idt[] is constructed without IST
+ * settings, so we don't need a TSS configured yet.
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
+    /* Invalidate TR/LDTR as they're not set up yet. */
+    _set_tssldt_desc(boot_gdt + TSS_ENTRY - FIRST_RESERVED_GDT_ENTRY,
+                     0, 0, SYS_DESC_tss_avail);
+
+    ltr(TSS_SELECTOR);
+    lldt(0);
+
+    /* Set up the BSPs per-cpu references. */
+    this_cpu(idt) = bsp_idt;
+    this_cpu(gdt) = boot_gdt;
+    if ( IS_ENABLED(CONFIG_PV32) )
+        this_cpu(compat_gdt) = boot_compat_gdt;
+}
+
 /*
  * Configure complete exception, interrupt and syscall handling.
  */
@@ -63,6 +93,8 @@ void __init traps_init(void)
     /* Replace early pagefault with real pagefault handler. */
     _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
 
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

base-commit: 6e5fed7cb67c9f84653cdbd3924b8a119ef653be
prerequisite-patch-id: 832a3f5dd12d56454ae74d4ae08d1893c672733e
prerequisite-patch-id: 2f5a1dc0cf663d27c66076f809063764e7a99e61
prerequisite-patch-id: 1f25c130d5a1ee15884dfebad9f5d2a4e69f673a
-- 
2.39.5


