Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62892BB85BE
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136903.1473421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4of2-0007uv-EI; Fri, 03 Oct 2025 22:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136903.1473421; Fri, 03 Oct 2025 22:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4of2-0007mf-24; Fri, 03 Oct 2025 22:54:00 +0000
Received: by outflank-mailman (input) for mailman id 1136903;
 Fri, 03 Oct 2025 22:53:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oez-0004mF-P5
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:57 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d805581f-a0ab-11f0-9d14-b5c5bf9af7f9;
 Sat, 04 Oct 2025 00:53:57 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e326e4e99so20303505e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:57 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:55 -0700 (PDT)
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
X-Inumbo-ID: d805581f-a0ab-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532036; x=1760136836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZB02FQCtZ7HQMg+a6BPzi5/pgcHeCMvxoE+tfd+QO6E=;
        b=Vo0xUkl5gAxFKKGtGhWUtuQIP6NXNAnYbLw6n28mueER/d8A7V35zwswXXwSSjocdA
         LNIiTFdhwDATzxhHtiGhiQuexf9wtVbzjLq7oPsO6fu1MHdB5aXhpZGT82Gw/Lo2wg7s
         7DgJVLZhaz4k8RoaO5zhrFibpwBlkAARjonbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532036; x=1760136836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZB02FQCtZ7HQMg+a6BPzi5/pgcHeCMvxoE+tfd+QO6E=;
        b=uL8BGYUfdOk0Xiood4nwK8N/LjV8Rb5+J6bk8bw95m+fBpcXTaGBJC1HPtfaan7pKT
         tsOnfEYKnwaN5GjFFVriSTnVR6kFHALVE1k0quWIothttKs7nhjzKKy61qpVR7XZrWG6
         nN4STD5ZVAVSy8i5HEJGY83AOGz4dUzNJms/mT93J8DvrcX8v3X1uPBek2FIzfBiUF6X
         vZyw4SKOpFk+2Z0gbvZ1tScjgp9vNXA0f3TXCCsFpUPYHasw2mvOvu4prEJ99a1rzva4
         2Qf5KcZ52CaiE2yXWFGacijI5GWct5AHWIh2/VOv69Prk5kxOagvLLAqbDQDQxrzxA11
         Ma8A==
X-Gm-Message-State: AOJu0YzsJUHdgcvsxcfiVRgQOfb+mY9i9F0so6YBZ3JfI9wc499Ffta4
	ThE9sMZhb5gVFWLBhZ2M3yK8s6IZPEnMgbSVBv4Ol9DwEz2pMpLzsCeA8+gBewQv1ulqvrY9Nk5
	c9uN7tnSNPA==
X-Gm-Gg: ASbGncuZWeYHRUN+0lulCVdf5Hd/wltzQq4vtK9Tvp2YT4Y/KivVnm8xoM9jwWUJBvp
	LiPC2H7PDM3NVmDpgV5VYRt+cDiGvEXk6FWU5NYe10v+CibF+b87UiSq6z6gOxCSfhT4Io6Wb+/
	JJdTMkq3jsxxrdX0zzIGVfg/2mLnPOjorNlZj+8FwYmhIj7aL46Xh0iyK0iTryd+6621NV1eQ31
	uWkewOm6S8iTYBfnKYaAIgzRcQ9vdzLk82xKt2M9cCpkqsoJTwtIGVbunKbeExmF4zYh5FXO4Ak
	ML4tBSK8LzUljlRnDhOnH33/KoNdSw6NZ8BUCSmy/7vRkpmYOwJOcdZWkkAaAY0XfJeQsSbr6Bz
	bHrwZd3GzcudgLJC6Iik88hI7SEl+954M1CLW3iWD7CeN1joTP7Hu7BNx14opAG26DkPAw7hRYC
	ZpLYpbwO2KFHu1nLMPKdJ8JnIfQES/Ypk=
X-Google-Smtp-Source: AGHT+IHDojY8NuOAkeDeOCm7hdMc7HP70ugcxmaKP4MOK/BXN/C9Zg+Cvz+hNWk+dwRPTfEr6AYdww==
X-Received: by 2002:a5d:64e9:0:b0:3e7:6424:1b47 with SMTP id ffacd0b85a97d-42566c00d2fmr3521319f8f.6.1759532036300;
        Fri, 03 Oct 2025 15:53:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 13/22] x86/traps: Enable FRED when requested
Date: Fri,  3 Oct 2025 23:53:25 +0100
Message-Id: <20251003225334.2123667-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
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

Per the documentation, percpu_early_traps_init() is responsible for switching
off the boot GDT, which needs doing even in FRED mode.

Finally, set CR4.FRED in traps_init()/percpu_early_traps_init().

Xen can now boot in FRED mode up until starting a PV guest, where it faults
because IRET is not permitted to change privilege.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v3:
 * Fix poisoning of SL1 pointers.
 * Adjust bsp_traps_reinit().  It probably doesn't matter.

v2:
 * Explain the lack of BUG_ON()
 * Posion SL1

In principle we can stop allocating the IDT and TSS for CPUs now, although I
want to get shutdown and kexec working before making this optimisation, in
case there's something I've overlooked.
---
 xen/arch/x86/include/asm/current.h |  3 ++
 xen/arch/x86/include/asm/traps.h   |  2 +
 xen/arch/x86/traps-setup.c         | 83 ++++++++++++++++++++++++++++--
 3 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index 62817e8476ec..6139980ab115 100644
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
index d77be8f83921..d937209ae606 100644
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
+        wrmsrns(MSR_FRED_SSP_SL1, stack_top + (1 + IST_DB) * PAGE_SIZE); /* Poison */
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
@@ -356,7 +410,11 @@ void __init traps_init(void)
  */
 void __init bsp_traps_reinit(void)
 {
-    load_system_tables();
+    if ( opt_fred )
+        init_fred();
+    else
+        load_system_tables();
+
     percpu_traps_init();
 }
 
@@ -366,7 +424,8 @@ void __init bsp_traps_reinit(void)
  */
 void percpu_traps_init(void)
 {
-    legacy_syscall_init();
+    if ( !opt_fred )
+        legacy_syscall_init();
 
     if ( cpu_has_xen_lbr )
         wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
@@ -381,7 +440,21 @@ void percpu_traps_init(void)
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


