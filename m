Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1F7964DD9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 20:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786059.1195611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjk2V-0003Nj-5Q; Thu, 29 Aug 2024 18:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786059.1195611; Thu, 29 Aug 2024 18:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjk2V-0003MB-0Z; Thu, 29 Aug 2024 18:38:35 +0000
Received: by outflank-mailman (input) for mailman id 786059;
 Thu, 29 Aug 2024 18:38:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zolI=P4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjk2T-0003M5-Gr
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 18:38:33 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e28984a5-6635-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 20:38:29 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8696e9bd24so129176866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 11:38:29 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f26asm108992166b.58.2024.08.29.11.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 11:38:22 -0700 (PDT)
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
X-Inumbo-ID: e28984a5-6635-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724956708; x=1725561508; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eObA4/0vF47B3M4DileFOdwT05bO0d69HHcAChJn1Yg=;
        b=tumvY/c8zuSIdZN9VwB7G/6QBmCc4nKan47pUi1kodkepVCE+suQ2ncLD4N4HrGIAQ
         XQItM3z9Z3CN2BnekDG/62UzUo39ASUVBCf99aN9ei4dIapaMxYMHmfTXe4AnI1ooujs
         6aTUF/WGmNQPFpuX1CIPqfxX2TH3wDK9usfbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724956708; x=1725561508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eObA4/0vF47B3M4DileFOdwT05bO0d69HHcAChJn1Yg=;
        b=itct7rrERkxzTSsFCKPPqcR7W5nlUhvhyLXMbwCVQyTL8AxwQh7BAiqr3+Lu2y+RPx
         UBtAUjoFv6xbJ/OTrYLzka9cm/ZC70U2lMgBrO/FaJVht1ZlivSKuHUZyvKbg2p6P/J/
         Kbk7S5lO4S5fbBcd++TjkMB2tTHsJVUFGm9MfL9PUnTIN6Kne4f+apJDj6FS2T7n4EyK
         ZdXOaai10j9pY7Nv1VDw8I4M/5xBL/ePe1IW16iA6OepWMi4bYjvyoLi3OL80xXVt0Yx
         bXryFpK6vwP87iZmpbvHApFCf1rzUY++ztXD6RhQ+7yUVlVu4dlER8RhlzRhsKAYGEqK
         9ifQ==
X-Gm-Message-State: AOJu0Yze2hI9v8PLBLZorNqCu1CRX8TMLPtPwgjKxoBlauPhzQSts8m2
	SOnoeEPK5oBoFp5MN4iLoGMRWQP9DUC/V15Zfx2/+ZeysXcrhVd1srFT3cb8wJ2m1eaDVFE8XJ6
	h
X-Google-Smtp-Source: AGHT+IH75GJDefyrKK4Ut9+fvaWChrcrXGLdYFb1vZmf3GXZIVILEPPV3pLkMvjJNfb6LDp8WjNrww==
X-Received: by 2002:a17:907:ea6:b0:a86:ad8b:3511 with SMTP id a640c23a62f3a-a897fa7235fmr286354066b.49.1724956707649;
        Thu, 29 Aug 2024 11:38:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/pv: Make cr4_pv32_mask be PV32-only
Date: Thu, 29 Aug 2024 19:38:17 +0100
Message-Id: <20240829183817.2807665-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The user of cr4_pv32_mask (the cr4_pv32_restore() function) only exists in a
CONFIG_PV32 build, but right now the variable is unconditionally set up.

To start with, move the setup into set_in_cr4() and remove it from it's
somewhat ad-hoc position in __start_xen().  This means the variable will be
set up in two steps for a CONFIG_PV32=y build, but it's cleaner and more
robust logic overall.

With that, there's no good reason for the variable to stay in setup.c.  Move
it to x86/pv/traps.c (for want of any better place to live), and move the
declaration to beside set_in_cr4() and mmu_cr4_features which is a better
position than setup.h.

Guard the reference with CONFIG_PV32, and fix up a recent typo in an adjacent
comment while at it.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/processor.h |  4 ++++
 xen/arch/x86/include/asm/setup.h     |  2 --
 xen/arch/x86/pv/dom0_build.c         | 10 +++++++---
 xen/arch/x86/pv/traps.c              |  4 ++++
 xen/arch/x86/setup.c                 |  4 ----
 5 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 66463f6a6d67..e71dbb8d3fbf 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -312,11 +312,15 @@ static inline void stts(void)
  * after us can get the correct flags.
  */
 extern unsigned long mmu_cr4_features;
+extern unsigned long cr4_pv32_mask;
 
 static always_inline void set_in_cr4 (unsigned long mask)
 {
     mmu_cr4_features |= mask;
     write_cr4(read_cr4() | mask);
+
+    if ( IS_ENABLED(CONFIG_PV32) && (mask & XEN_CR4_PV32_BITS) )
+        cr4_pv32_mask |= (mask & XEN_CR4_PV32_BITS);
 }
 
 static always_inline void __monitor(const void *eax, unsigned long ecx,
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 8f7dfefb4dcf..d75589178b91 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -64,8 +64,6 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
 
-extern unsigned long cr4_pv32_mask;
-
 #define max_init_domid (0)
 
 #endif
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 57b1834b5eaa..262edb6bf2f0 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -1061,12 +1061,14 @@ int __init dom0_construct_pv(struct domain *d,
 
     /*
      * Clear SMAP in CR4 to allow user-accesses in construct_dom0().  This
-     * prevents us needing to write rewrite construct_dom0() in terms of
+     * prevents us needing to write construct_dom0() in terms of
      * copy_{to,from}_user().
      */
     if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
     {
-        cr4_pv32_mask &= ~X86_CR4_SMAP;
+        if ( IS_ENABLED(CONFIG_PV32) )
+            cr4_pv32_mask &= ~X86_CR4_SMAP;
+
         write_cr4(read_cr4() & ~X86_CR4_SMAP);
     }
 
@@ -1075,7 +1077,9 @@ int __init dom0_construct_pv(struct domain *d,
     if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
     {
         write_cr4(read_cr4() | X86_CR4_SMAP);
-        cr4_pv32_mask |= X86_CR4_SMAP;
+
+        if ( IS_ENABLED(CONFIG_PV32) )
+            cr4_pv32_mask |= X86_CR4_SMAP;
     }
 
     return rc;
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 5a7341abf068..3389a25acd83 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -18,6 +18,10 @@
 #include <asm/traps.h>
 #include <irq_vectors.h>
 
+#ifdef CONFIG_PV32
+unsigned long __ro_after_init cr4_pv32_mask;
+#endif
+
 void pv_inject_event(const struct x86_event *event)
 {
     struct vcpu *curr = current;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f1076c72032d..c2e0082a3020 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -79,8 +79,6 @@ bool __read_mostly use_invpcid;
 int8_t __initdata opt_probe_port_aliases = -1;
 boolean_param("probe-port-aliases", opt_probe_port_aliases);
 
-unsigned long __ro_after_init cr4_pv32_mask;
-
 /* **** Linux config option: propagated to domain0. */
 /* "acpi=off":    Sisables both ACPI table parsing and interpreter. */
 /* "acpi=force":  Override the disable blacklist.                   */
@@ -1898,8 +1896,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
         set_in_cr4(X86_CR4_SMAP);
 
-    cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
-
     if ( boot_cpu_has(X86_FEATURE_FSGSBASE) )
         set_in_cr4(X86_CR4_FSGSBASE);
 

base-commit: 99f942f3d410059dc223ee0a908827e928ef3592
-- 
2.39.2


