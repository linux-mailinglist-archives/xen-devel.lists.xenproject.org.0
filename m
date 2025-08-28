Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C8EB3A3A4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099158.1453095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHI-0007JV-FQ; Thu, 28 Aug 2025 15:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099158.1453095; Thu, 28 Aug 2025 15:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHI-0007CY-8L; Thu, 28 Aug 2025 15:11:04 +0000
Received: by outflank-mailman (input) for mailman id 1099158;
 Thu, 28 Aug 2025 15:11:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCc-0003MD-T9
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:14 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a3de1a5-8420-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 17:06:14 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45b618e067eso15236585e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:14 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:12 -0700 (PDT)
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
X-Inumbo-ID: 8a3de1a5-8420-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393573; x=1756998373; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY3lQ3Gg5F0xoJy8yGYu7zB1wis52ZSXOTHimYFvGOs=;
        b=Q9uOCq3fIQPBMWjLXoy5eDvPyqZpzxqVQqauARJAyzbP+b5wNNedbaaCWSSZJNjygS
         ySylziICJpVLxJG4BSBeAtuuxpzY0FJb/TIVctWfB91p15BvtaMnhJFyo8gtoBI4JmZ8
         ls94S/r83XnUzYznHpyi74SHdkQSKkvao54zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393573; x=1756998373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MY3lQ3Gg5F0xoJy8yGYu7zB1wis52ZSXOTHimYFvGOs=;
        b=UmwJtB1eIkgHrn+07ZlmZp64iyLKKwsz/kV5hOYptDT6MVqlKYVC0SIffxaLSVWTuD
         XngujIzqcaTDa8NGLLZ4TnDX0OCWECKS3KJdyywceI/eQEObD550n+tAVvAJ5yvpwkpH
         +tk/fAbLWYJtvs6JL5L6v+hdas19FcowQO3XE/b8bIDl2tGbRecl+nsznhcDl6tBHXap
         OASVVeekA69S/OQyaULvzU0t38iLs4GU4HIie2lpMgYvVj0YJNqgaFi12RHR2GTMTC+y
         QdBbqeo34SWOeOXKRBvWTnjLAqm9vT2LgT+TvkJmDG4ZhifO5m4svF6RQpdzuvhCdi3A
         PFkg==
X-Gm-Message-State: AOJu0YxZSRMVGQGmorklsuxfG5o4Ibfm56F7JKOrON3DaZ9lY+T8cDWn
	ECU+VSpTtaagHfe75zoETbmSOr78vEG933ssvi5I57OYI3DFLMaYm+d9IdN1o6PhTc6x0PfbSWH
	KAZBX
X-Gm-Gg: ASbGncsFaZxd+Qx2jvgoukj5DMhWBLXE+WUlA0bEzMYKhoXp5tJnCipEItrjxCiy2+5
	RyVQAAUJDDDIvUv5jMaYQrF4243yHf+rlBVFwXobKEMKo8ZPQUoy+aqk5o6hjh6HX87cgD5zSSr
	O2B9boCHsJFSh9dGxa7WB0kgeMfhiaIXVy8ft1FZ6h5AeOy2iv2ja6dn3TRgESpVkxbldQ2iVX+
	Q0trzIL9ZuKOke45OZZEiiss3Xp2NIyaz29YStopGqMqm5o7aPP7NB5K6Gv+xyhFisI8kbsxPow
	EqHxJx8myBeD0DqEduBgd/dkPQN1qQlCnnnkFV2o6czY0nvheBLrc3lLonspMS30aT1K7My8PkK
	eP+aJW13+y4nq22tdtX3RVlmRR7FkHfv1ao2cqeT+0AAqpTj66VpwmSg8RRUREoJpR3EU1Uvj7U
	is
X-Google-Smtp-Source: AGHT+IFQVvC2/C4PiSOWq/sn2hG6BV8Q8EC4V59JjEG6KGMP3c4wfKe9Oiz9FcakG4VgHBJE4PBv4A==
X-Received: by 2002:a05:600c:5246:b0:458:6f13:aa4a with SMTP id 5b1f17b1804b1-45b68b79262mr94975525e9.6.1756393573084;
        Thu, 28 Aug 2025 08:06:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 14/23] x86/traps: Enable FRED when requested
Date: Thu, 28 Aug 2025 16:04:00 +0100
Message-Id: <20250828150409.901315-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the shadow stack and exception handling adjustements in place, we can now
activate FRED when appropriate.  Note that opt_fred is still disabled by
default.

Introduce init_fred() to set up all the MSRs relevant for FRED.  FRED uses
MSR_STAR (entries from Ring3 only), and MSR_FRED_SSP_SL0 aliases MSR_PL0_SSP
when CET-SS is active.  Otherwise, they're all new MSRs.

With init_fred() existing, load_system_tables() and legacy_syscall_init()
should only be used when setting up IDT delivery.  Insert ASSERT()s to this
effect, and adjust the various *_init() functions to make this property true.

Per the documentation, ap_early_traps_init() is responsible for switching off
the boot GDT, which needs doing even in FRED mode.

Finally, set CR4.FRED in {bsp,ap}_early_traps_init().

Xen can now boot in FRED mode up until starting a PV guest, where it faults
because IRET is not permitted to change privilege.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Explain the lack of BUG_ON()
 * Posion SL1

In principle we can stop allocating the IDT and TSS for CPUs now, although I
want to get shutdown and kexec working before making this optimisation, in
case there's something I've overlooked.
---
 xen/arch/x86/include/asm/current.h |  3 ++
 xen/arch/x86/include/asm/traps.h   |  2 +
 xen/arch/x86/traps-setup.c         | 86 +++++++++++++++++++++++++++---
 3 files changed, 85 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index 35cc61fa88e7..53b0d3cf143d 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -23,6 +23,9 @@
  * 2 - NMI IST stack
  * 1 - #MC IST stack
  * 0 - IST Shadow Stacks (4x 1k, read-only)
+ *
+ * In FRED mode, #DB and NMI do not need special stacks, so their IST stacks
+ * are unused.
  */
 
 /*
diff --git a/xen/arch/x86/include/asm/traps.h b/xen/arch/x86/include/asm/traps.h
index 73097e957d05..5d7504bc44d1 100644
--- a/xen/arch/x86/include/asm/traps.h
+++ b/xen/arch/x86/include/asm/traps.h
@@ -16,6 +16,8 @@ void traps_init(void);
 void bsp_traps_reinit(void);
 void percpu_traps_init(void);
 
+void nocall entry_FRED_R3(void);
+
 extern unsigned int ler_msr;
 
 const char *vector_name(unsigned int vec);
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index d77be8f83921..535b53969678 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -59,6 +59,8 @@ static void load_system_tables(void)
         .limit = sizeof(bsp_idt) - 1,
     };
 
+    ASSERT(opt_fred == 0);
+
     /*
      * Set up the TSS.  Warning - may be live, and the NMI/#MC must remain
      * valid on every instruction boundary.  (Note: these are all
@@ -191,6 +193,8 @@ static void legacy_syscall_init(void)
     unsigned char *stub_page;
     unsigned int offset;
 
+    ASSERT(opt_fred == 0);
+
     /* No PV guests?  No need to set up SYSCALL/SYSENTER infrastructure. */
     if ( !IS_ENABLED(CONFIG_PV) )
         return;
@@ -268,6 +272,52 @@ static void __init init_ler(void)
     setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
 }
 
+/*
+ * Set up all MSRs relevant for FRED event delivery.
+ *
+ * Xen does not use any of the optional config in MSR_FRED_CONFIG, so all that
+ * is needed is the entrypoint.
+ *
+ * Because FRED always provides a good stack, NMI and #DB do not need any
+ * special treatment.  Only #DF needs another stack level, and #MC for the
+ * offchance that Xen's main stack suffers an uncorrectable error.
+ *
+ * This makes Stack Level 1 unused, but we use #DB's stacks, and with the
+ * regular and shadow stacks reversed as posion to guarantee that any use
+ * escalates to #DF.
+ *
+ * FRED reuses MSR_STAR to provide the segment selector values to load on
+ * entry from Ring3.  Entry from Ring0 leave %cs and %ss unmodified.
+ */
+static void init_fred(void)
+{
+    unsigned long stack_top = get_stack_bottom() & ~(STACK_SIZE - 1);
+
+    ASSERT(opt_fred == 1);
+
+    wrmsrns(MSR_STAR, XEN_MSR_STAR);
+    wrmsrns(MSR_FRED_CONFIG, (unsigned long)entry_FRED_R3);
+
+    /*
+     * MSR_FRED_RSP_* all come with an 64-byte alignment check, avoiding the
+     * need for an explicit BUG_ON().
+     */
+    wrmsrns(MSR_FRED_RSP_SL0, (unsigned long)(&get_cpu_info()->_fred + 1));
+    wrmsrns(MSR_FRED_RSP_SL1, stack_top + (IST_DB * IST_SHSTK_SIZE)); /* Poison */
+    wrmsrns(MSR_FRED_RSP_SL2, stack_top + (1 + IST_MCE)  * PAGE_SIZE);
+    wrmsrns(MSR_FRED_RSP_SL3, stack_top + (1 + IST_DF)   * PAGE_SIZE);
+    wrmsrns(MSR_FRED_STK_LVLS, ((2UL << (X86_EXC_MC * 2)) |
+                                (3UL << (X86_EXC_DF * 2))));
+
+    if ( cpu_has_xen_shstk )
+    {
+        wrmsrns(MSR_FRED_SSP_SL0, stack_top + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE);
+        wrmsrns(MSR_FRED_RSP_SL1, stack_top + (1 + IST_DF)  * PAGE_SIZE); /* Poison */
+        wrmsrns(MSR_FRED_SSP_SL2, stack_top + (IST_MCE * IST_SHSTK_SIZE));
+        wrmsrns(MSR_FRED_SSP_SL3, stack_top + (IST_DF  * IST_SHSTK_SIZE));
+    }
+}
+
 /*
  * Configure basic exception handling.  This is prior to parsing the command
  * line or configuring a console, and needs to be as simple as possible.
@@ -329,16 +379,20 @@ void __init traps_init(void)
             printk(XENLOG_INFO "Disabling PV32 due to FRED\n");
         }
 #endif
+
+        init_fred();
+        set_in_cr4(X86_CR4_FRED);
+
         setup_force_cpu_cap(X86_FEATURE_XEN_FRED);
         printk("Using FRED event delivery\n");
     }
     else
     {
+        load_system_tables();
+
         printk("Using IDT event delivery\n");
     }
 
-    load_system_tables();
-
     init_ler();
 
     /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
@@ -356,8 +410,13 @@ void __init traps_init(void)
  */
 void __init bsp_traps_reinit(void)
 {
-    load_system_tables();
-    percpu_traps_init();
+    if ( opt_fred )
+        init_fred();
+    else
+    {
+        load_system_tables();
+        percpu_traps_init();
+    }
 }
 
 /*
@@ -366,7 +425,8 @@ void __init bsp_traps_reinit(void)
  */
 void percpu_traps_init(void)
 {
-    legacy_syscall_init();
+    if ( !opt_fred )
+        legacy_syscall_init();
 
     if ( cpu_has_xen_lbr )
         wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
@@ -381,7 +441,21 @@ void percpu_traps_init(void)
  */
 void asmlinkage percpu_early_traps_init(void)
 {
-    load_system_tables();
+    if ( opt_fred )
+    {
+        const seg_desc_t *gdt = this_cpu(gdt) - FIRST_RESERVED_GDT_ENTRY;
+        const struct desc_ptr gdtr = {
+            .base = (unsigned long)gdt,
+            .limit = LAST_RESERVED_GDT_BYTE,
+        };
+
+        lgdt(&gdtr);
+
+        init_fred();
+        write_cr4(read_cr4() | X86_CR4_FRED);
+    }
+    else
+        load_system_tables();
 }
 
 static void __init __maybe_unused build_assertions(void)
-- 
2.39.5


