Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5744EB1EF87
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075092.1437643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTkA-0008RV-MT; Fri, 08 Aug 2025 20:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075092.1437643; Fri, 08 Aug 2025 20:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTkA-0008PX-IC; Fri, 08 Aug 2025 20:31:14 +0000
Received: by outflank-mailman (input) for mailman id 1075092;
 Fri, 08 Aug 2025 20:31:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcr-0005tJ-Cy
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:41 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9098a2cb-7495-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 22:23:37 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so17067035e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:37 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:36 -0700 (PDT)
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
X-Inumbo-ID: 9098a2cb-7495-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684616; x=1755289416; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evLhAYiRD6wyqduVR5JzlpDskt89ckAuh4iEnU2F4jA=;
        b=oLtukjId3XrsVDvcs9NMr0rTqZdTadAqdF2f0kdhlHECFncksHx8SreIn3+2NRR9us
         P/Pn+tOTvjC7Cp/jl2YdDt/dYFZWMxU7nnVr8nFEZLSigygwPCuIkFxVknZOGChvzCrZ
         F9rjBe2GybOHrzPvmCkCA6NeBFCkJz/rpR2aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684616; x=1755289416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evLhAYiRD6wyqduVR5JzlpDskt89ckAuh4iEnU2F4jA=;
        b=VSyYbtcvFhfljcaejlgb7h28MgX0vAVCuFRMrj1eDthUiqUi/CcxBOHzu/79yE6pQL
         IgRB/rf4HEyph8BvDGfpaG3zBDveuakKegaEwcwgi1mqr6HHMq3jSOQ+Y0j+khcYTrTK
         UIWs6tSHaI0rEqyWafqZEbRSjRm6aXxyyfW/wRKvzk7GRnRO7sRNCum5gs7uWIVVqdbA
         o7GOGgR6behrmlaXdCgX0m8b6+1rx8lcK+6Bq87TbyaM4tCsb8ASOjBX+mSMkk9pxcb6
         m/YgAh4GFyatjTGHYiNiz4JU9I9AuJY3pfi2Vaxmo2H+Y/dGOdYzZg4Tnf6dQ3g3M9hz
         09gg==
X-Gm-Message-State: AOJu0YzBiaOt7n2WYN7Gtvt9jR6ZUskhGgbaIUxV8Cv8dKorQo/dk8eH
	jx74ji3jPx6Ct1G+EskPTFO4TbxEunzyEfFjtqy66z+ZfTf98O2gVBrJjeb6nn8GOrKUlt6NhXB
	IoP/mf/8=
X-Gm-Gg: ASbGncvE6vl0uB/cI2ZN34HUvCH5GMCG16EST5m+fy1G0OPAZJNeBJZIeIweLYproCU
	5gFwzZJnbZEMTkA15nQjlMHLvuIOg6QwGoY4a9FuDvYKa2H481kPzrvtA+gueHMjRUd1iwvn1/o
	3oJcHp7+Haa3qmQ5EFL1DkaTvTtfNqc8dxYvLWbugF/KnZMFABrkrebXDuQxqXQM3N8NIfrMvOB
	2B0uEHh4PWNx4AFRHb3H3CiN28cDifXVTjPlbc21ebeANrdu3x1CUbyrhyZjFRhzvCl42mFIHyy
	C7hnUst94o0ROiqoowC9nOdlK4K1PVspBUZmlTCo2cnRn3JYYNQOlzpWEe4/NKkLZUnmIEF2J3e
	+fT/KwbgMxZaCFAswtDxf0eQfFCrD0eRDcfVHYrDXAI74wy4CNcOPQTD8+AzDSKKXdv6BqHyXzM
	QH
X-Google-Smtp-Source: AGHT+IGnrev+Fn9IitHmppKh6Q8rFalcNx8FXnd9zAAIoH6loW+O/7BQrlWew/vjceQpRcOGSOsOCw==
X-Received: by 2002:a05:600c:4e09:b0:458:bbed:a806 with SMTP id 5b1f17b1804b1-459f7114067mr30272445e9.22.1754684616504;
        Fri, 08 Aug 2025 13:23:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 22/22] x86/traps: Enable FRED when requested
Date: Fri,  8 Aug 2025 21:23:14 +0100
Message-Id: <20250808202314.1045968-23-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
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

In principle we can stop allocating the IDT and TSS for CPUs now, although I
want to get shutdown and kexec working before making this optimisation, in
case there's something I've overlooked.
---
 xen/arch/x86/include/asm/current.h |  3 ++
 xen/arch/x86/traps-setup.c         | 78 +++++++++++++++++++++++++++---
 2 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index 24d7d906a8c6..046740447db0 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -24,6 +24,9 @@
  * 2 - NMI IST stack
  * 1 - #MC IST stack
  * 0 - IST Shadow Stacks (4x 1k, read-only)
+ *
+ * In FRED mode, #DB and NMI do not need special stacks, so their stacks are
+ * unused.
  */
 
 /*
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index c4825fc1b11a..fdcfc7f5777d 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -26,6 +26,7 @@ int8_t __ro_after_init opt_fred = 0; /* -1 when supported. */
 boolean_param("fred", opt_fred);
 
 void nocall entry_PF(void);
+void nocall entry_FRED_R3(void);
 void nocall lstar_enter(void);
 void nocall cstar_enter(void);
 
@@ -63,6 +64,8 @@ static void load_system_tables(void)
         .limit = sizeof(bsp_idt) - 1,
     };
 
+    ASSERT(opt_fred == 0);
+
     /*
      * Set up the TSS.  Warning - may be live, and the NMI/#MC must remain
      * valid on every instruction boundary.  (Note: these are all
@@ -197,6 +200,8 @@ static void legacy_syscall_init(void)
     unsigned char *stub_page;
     unsigned int offset;
 
+    ASSERT(opt_fred == 0);
+
     /* No PV guests?  No need to set up SYSCALL/SYSENTER infrastructure. */
     if ( !IS_ENABLED(CONFIG_PV) )
         return;
@@ -274,6 +279,44 @@ static void __init init_ler(void)
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
+    wrmsrns(MSR_FRED_RSP_SL0, (unsigned long)(&get_cpu_info()->_fred + 1));
+    wrmsrns(MSR_FRED_RSP_SL1, 0);
+    wrmsrns(MSR_FRED_RSP_SL2, stack_top + (1 + IST_MCE)  * PAGE_SIZE);
+    wrmsrns(MSR_FRED_RSP_SL3, stack_top + (1 + IST_DF)   * PAGE_SIZE);
+    wrmsrns(MSR_FRED_STK_LVLS, ((2UL << (X86_EXC_MC * 2)) |
+                                (3UL << (X86_EXC_DF * 2))));
+
+    if ( cpu_has_xen_shstk )
+    {
+        wrmsrns(MSR_FRED_SSP_SL0, stack_top + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE);
+        wrmsrns(MSR_FRED_SSP_SL1, 0);
+        wrmsrns(MSR_FRED_SSP_SL2, stack_top + (IST_MCE * IST_SHSTK_SIZE));
+        wrmsrns(MSR_FRED_SSP_SL3, stack_top + (IST_DF  * IST_SHSTK_SIZE));
+    }
+}
+
 /*
  * Configure basic exception handling.  This is prior to parsing the command
  * line or configuring a console, and needs to be as simple as possible.
@@ -331,15 +374,18 @@ void __init traps_init(void)
             printk(XENLOG_INFO "Disabling PV32 due to FRED\n");
         }
 #endif
+        init_fred();
+        set_in_cr4(X86_CR4_FRED);
+
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
@@ -357,8 +403,13 @@ void __init traps_init(void)
  */
 void bsp_traps_reinit(void)
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
@@ -367,7 +418,8 @@ void bsp_traps_reinit(void)
  */
 void percpu_traps_init(void)
 {
-    legacy_syscall_init();
+    if ( !opt_fred )
+        legacy_syscall_init();
 
     if ( cpu_has_xen_lbr )
         wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
@@ -382,7 +434,21 @@ void percpu_traps_init(void)
  */
 void asmlinkage ap_early_traps_init(void)
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


