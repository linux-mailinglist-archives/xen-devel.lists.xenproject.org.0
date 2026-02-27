Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IkywCPElommP0QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738021BEEF2
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243145.1543179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74n-0001ny-5g; Fri, 27 Feb 2026 23:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243145.1543179; Fri, 27 Feb 2026 23:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74m-0001gJ-UO; Fri, 27 Feb 2026 23:16:52 +0000
Received: by outflank-mailman (input) for mailman id 1243145;
 Fri, 27 Feb 2026 23:16:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74l-0008WD-7O
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:51 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64ee25d6-1432-11f1-b164-2bf370ae4941;
 Sat, 28 Feb 2026 00:16:50 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so19849895e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:50 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:48 -0800 (PST)
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
X-Inumbo-ID: 64ee25d6-1432-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234209; x=1772839009; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbhT0QMKBr/TIGT+bhPKLxd4WsrkmIxt58Vxe9HNu08=;
        b=IqrRAk+QEM+BsjGUr+SQuBK4HVBy4xKrkt8t2aFjS8rGbBZfBhcBxGEaarc3rAvwE0
         cvu2TTH7Bk3Yqz9101oIiBXFQIqemOqEMALQCoiF3yFSPQRui2F79lmOTnvJJZxy0nPl
         vf3JKBXrDO7B9GeJa5QjU2UkhprnmWYuCrSXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234209; x=1772839009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RbhT0QMKBr/TIGT+bhPKLxd4WsrkmIxt58Vxe9HNu08=;
        b=lA2IouDxFj5W0swSbIGxtrWeUYl2EPNNmrNQOAUVanUYIjjoVNgNjpsdap/O9yXuPN
         2TPlCAAso3gjkGQIKemi9mDX6ANi6Lw+69+/Eyn6O38wZYtNG24C+aZIlX/v9abl/LXy
         zMa+6M2YoO1ZVi/Nc09LKNJcFtDkb+SUkI7GGoR4UIR3KQiFtXfj5fndF3XBqXUois6o
         Y/w1Zjqv3QmTCdc51k0HQkwnR/R7GxVckQ9RNvr7Cu/wSrrOu1iG6AFbcdl+YtXBhoKn
         ih0N8t+Fe260ryBJSHiX3QFYBT/LvTqzF6vLzaasNgjvnV1sCsGGWiZUshRCDnKiw/SA
         9sJQ==
X-Gm-Message-State: AOJu0YzHfQSt0GgEzTxmecBN3Up+HCrpitlJpCfa8PkInsn7S5fWPwpi
	3Qw1BUX6AHxoM19WBsnQImo++zLA4BaZcCcAQp3V6yrK7iQZKL9IsXjo5+6fQQCCj4KAajDUrId
	97z4O
X-Gm-Gg: ATEYQzwW9A/FBnBOgsZm08n5FDN3R/tAwbxsp5pbLPSWFR18Sm5pABjldN+/V5Cdn5m
	U6empophNCUzSh7lDroMg84PVvnENnUdwUU+R3wH7VzQNLyswjh3Ao4n/eBukz6UW9UsIIoqfam
	5EzaZ6a3WOgT74N9iDqwZyFsCNRum5PmbxD4kikY03GVXh9WsmMNhZlUmU8/jS7f71dxTZhihZD
	lK4CH7BeAssJ5mJLWfvgkKd8YnlFpv6RLNYLwVw/J47VyFBCbeg2P/f2vP2In9kotHoKDYNKIjD
	k6xj/fhvuOAUnJycU7M1TokxmmBgVMUhAQlLy84LS88AC7Xfjaqf8NrhW/Fv2W0b4zjijd/P2VI
	7Dr3Zm8KMAxpFRsJbdJxzZ/e2nEZgZjm6JIJjVWuneFCu/mDGX9+2lcFI8ytN8ii5TShQXWsM1z
	Eobyr55xNOAe8ws5Q2rXAqKCyiA/5w2Vj5g5DLDf3daiAn1owZjCu67KrcjTaOpDa4lkSEbog=
X-Received: by 2002:a05:600c:4e56:b0:483:612d:7a9a with SMTP id 5b1f17b1804b1-483c9b68304mr84594355e9.0.1772234208709;
        Fri, 27 Feb 2026 15:16:48 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 08/14] x86/traps: Enable FRED when requested
Date: Fri, 27 Feb 2026 23:16:30 +0000
Message-Id: <20260227231636.3955109-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 738021BEEF2
X-Rspamd-Action: no action

With the shadow stack and exception handling adjustements in place, we can now
activate FRED when appropriate.  Note that opt_fred is still disabled by
default until more infrastructure is in place.

Introduce init_fred() to set up all the MSRs relevant for FRED.  FRED uses
MSR_STAR (entries from Ring3 only), and MSR_FRED_SSP_SL0 aliases MSR_PL0_SSP
when CET-SS is active.  Otherwise, they're all new MSRs.

Also introduce init_fred_tss().  At this juncture we need a TSS set up, even
if it is mostly unused.  Reinsert the BUILD_BUG_ON() checking the size of the
TSS against 0x67, this time with a more precise comment.

With init_fred() existing, load_system_tables() and legacy_syscall_init()
should only be used when setting up IDT delivery.  Insert ASSERT()s to this
effect, and adjust the various init functions to make this property true.

The FRED initialisation path still needs to write to all system table
registers at least once, even if only to invalidate them.  Per the
documentation, percpu_early_traps_init() is responsible for switching off the
boot GDT, which also needs doing even in FRED mode.

Finally, set CR4.FRED in traps_init()/percpu_early_traps_init().

Xen can now boot in FRED mode and run a PVH dom0.  PV guests still need more
work before they can be run under FRED.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

[*] PVH Dom0 on an Intel PantherLake CPU.

v4:
 * Rework TSS handling entirely, following the VT-x (re)discovery.

v3:
 * Fix poisoning of SL1 pointers.
 * Adjust bsp_traps_reinit().  It probably doesn't matter.
---
 xen/arch/x86/include/asm/current.h |   3 +
 xen/arch/x86/include/asm/traps.h   |   2 +
 xen/arch/x86/traps-setup.c         | 130 +++++++++++++++++++++++++++--
 3 files changed, 130 insertions(+), 5 deletions(-)

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
index b2c161943d1e..4c8744eebe3c 100644
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
@@ -268,6 +272,76 @@ static void __init init_ler(void)
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
+/*
+ * Set up a minimal TSS and selector for use in FRED mode.
+ *
+ * With FRED moving the stack pointers into MSRs, we would like to avoid
+ * having a TSS at all, but:
+ *  - VT-x VMExit unconditionally sets TR.limit to 0x67, meaning that
+ *    HOST_TR_BASE needs to point to a good TSS.
+ *  - show_stack_overflow() cross-checks tss->rsp0.
+ *
+ * Fill in rsp0 and the bitmap offset, and load a zero-length TR.  If VT-x
+ * does get used, it will clobber TR to refer to this_cpu(tss_page).tss.
+ */
+static void init_fred_tss(void)
+{
+    seg_desc_t *gdt = this_cpu(gdt) - FIRST_RESERVED_GDT_ENTRY;
+    struct tss64 *tss = &this_cpu(tss_page).tss;
+
+    tss->rsp0 = get_stack_bottom();
+    tss->bitmap = IOBMP_INVALID_OFFSET;
+
+    _set_tssldt_desc(gdt + TSS_ENTRY, 0, 0, SYS_DESC_tss_avail);
+    ltr(TSS_SELECTOR);
+}
+
 /*
  * Configure basic exception handling.  This is prior to parsing the command
  * line or configuring a console, and needs to be as simple as possible.
@@ -322,6 +396,8 @@ void __init traps_init(void)
 
     if ( opt_fred )
     {
+        const struct desc_ptr idtr = {};
+
 #ifdef CONFIG_PV32
         if ( opt_pv32 )
         {
@@ -329,16 +405,27 @@ void __init traps_init(void)
             printk(XENLOG_INFO "Disabling PV32 due to FRED\n");
         }
 #endif
+
+        init_fred();
+        set_in_cr4(X86_CR4_FRED);
+
+        /*
+         * Invalidate the IDT as it's not used.  Set up a minimal TSS.  The
+         * LDT was configured by bsp_early_traps_init().
+         */
+        lidt(&idtr);
+        init_fred_tss();
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
 
     percpu_traps_init();
@@ -353,7 +440,11 @@ void __init traps_init(void)
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
 
@@ -368,7 +459,7 @@ void percpu_traps_init(void)
      * allocated, limiting the placement of the traps_init() call, and gets
      * re-done anyway by bsp_traps_reinit().
      */
-    if ( system_state > SYS_STATE_early_boot )
+    if ( !opt_fred && system_state > SYS_STATE_early_boot )
         legacy_syscall_init();
 
     if ( cpu_has_xen_lbr )
@@ -384,7 +475,29 @@ void percpu_traps_init(void)
  */
 void asmlinkage percpu_early_traps_init(void)
 {
-    load_system_tables();
+    if ( opt_fred )
+    {
+        seg_desc_t *gdt = this_cpu(gdt) - FIRST_RESERVED_GDT_ENTRY;
+        const struct desc_ptr gdtr = {
+            .base = (unsigned long)gdt,
+            .limit = LAST_RESERVED_GDT_BYTE,
+        }, idtr = {};
+
+        lgdt(&gdtr);
+
+        init_fred();
+        write_cr4(read_cr4() | X86_CR4_FRED);
+
+        /*
+         * Invalidate the IDT (not used) and LDT (not set up yet).  Set up a
+         * minimal TSS.
+         */
+        lidt(&idtr);
+        init_fred_tss();
+        lldt(0);
+    }
+    else
+        load_system_tables();
 }
 
 static void __init __maybe_unused build_assertions(void)
@@ -403,4 +516,11 @@ static void __init __maybe_unused build_assertions(void)
                   endof_field(struct cpu_info, guest_cpu_user_regs)) & 15);
     BUILD_BUG_ON((sizeof(struct cpu_info) -
                   endof_field(struct cpu_info, _fred)) & 63);
+
+    /*
+     * The x86 architecture is happy with TR.limit being less than 0x67, but
+     * VT-x is not.  VMExit unconditionally sets the limit to 0x67, meaning
+     * that HOST_TR_BASE needs to refer to a good TSS of at least this size.
+     */
+    BUILD_BUG_ON(sizeof(struct tss64) <= 0x67);
 }
-- 
2.39.5


