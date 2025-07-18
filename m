Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859A8B0A801
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 17:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048951.1419181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnQW-0001X6-5b; Fri, 18 Jul 2025 15:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048951.1419181; Fri, 18 Jul 2025 15:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnQV-0001PH-Vs; Fri, 18 Jul 2025 15:55:11 +0000
Received: by outflank-mailman (input) for mailman id 1048951;
 Fri, 18 Jul 2025 15:55:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucnQU-0000xy-F4
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 15:55:10 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 944f137e-63ef-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 17:55:08 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45634205adaso11391825e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 08:55:08 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48719sm2276468f8f.47.2025.07.18.08.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 08:55:07 -0700 (PDT)
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
X-Inumbo-ID: 944f137e-63ef-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752854108; x=1753458908; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luIxgmOKAlUDcDRuBqi0YJDZTZn+FgoCmStDLwvT0EA=;
        b=eJWMLxsIKLbYaRkUWVU5ba5ZYu2izsigD/7mbgykuf8Ed4aPDM43vgd+5kCPSEWzs8
         Ce6wKJb4AflXcr8L9jfvjm1/R97/V7iUYiEqIdpGgGOdqUVYLuzyzz5JulycHIYoiZaF
         y0PBMUGa6vBGub7DouDevlnF6donefoVWOaKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752854108; x=1753458908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luIxgmOKAlUDcDRuBqi0YJDZTZn+FgoCmStDLwvT0EA=;
        b=iXFs6cUC4QhIHKKpAkyijbho1oZo+jNcVQBxPSAoMrBZacN6fcytg4Z20bXzz6fZDm
         yY5XJ2404PaogsKm6IJbkHDqniCRqEqK4UFaiixw6Q091J4d0FPuduHcYCpRg11Zx+94
         uU/pjHyMUWAHMIqgP2clKkasAtnQTTLtJZ4PAHhwCNltKRGTWchJj7px4BaMXGJOZhGq
         QY24t82FZB5TpAiL7tsuHwTyIcic72/Bcf83AL1iqUUPFx4tNDRrz2Ry0hpxYPseO7Ub
         JJWf8xO2hoac6uHHv6/3qhul2oct291F5hFZtxlR69SXxqhh9z0Q558HcRocSEy6OCcZ
         H1uA==
X-Gm-Message-State: AOJu0Yw+ex8HhVx9lmxYbi7Tcvcy9hzW4tkkXF3UrZqWrAi8NDVWNIQi
	iLkZNkr0HmO3u8LJ6mv4Wlvp5v0qPHgQQtMsBaozuvl6oizsYg/5CtoSogwFehfZG5qFmc4imlL
	w3kAL72KGOA==
X-Gm-Gg: ASbGncvbu7nR1Ihmga0DrxRQtMujwxp92jL2x8xuaNdkoM3EkQxY/YTyCEGAY+vhDqC
	aI2/yLgudtBQ6XqaRBIYEjBzl6OR4o2F/lNzUKfros0ow40qdBbJW38s9kvMZ+enykIsF8ILAc4
	2PABv9hOsyS5rA/3ikl5Yq2ZdcHk37Q9Nx6VZqJ4jt0da65GG/keAtPGwa0tr7UCWylEnXtqLrU
	rP4dTKwDGOVZhUz+u/i96aNbp8vQfjWswYyRwMeXEC4A3NbbiQXPb2h6HUbo5wgjg4A3ZM4Eswr
	ug5K4ZnMkYLqfvt4I/nVC4TBFlABkm4om1pVt9eBuXpwUmiytE0AdbynIgy1zUfAPKsJxk4mmDf
	8Mwftqj3PzXN1ScXosehZOPyRn6Sc7/i1K7eGDtmdortBDhS+60hfRyC4XnUneTesLdOgMRalQ2
	S+
X-Google-Smtp-Source: AGHT+IERzlEXS7z26U7cQQV0LKgJiclBCNTQC1mJfbJPpZdgl0UiZEccaMHJn8sQDfrgdxMJrXyx6Q==
X-Received: by 2002:a05:6000:22c6:b0:3a3:652d:1640 with SMTP id ffacd0b85a97d-3b60e4c9551mr7874473f8f.2.1752854107589;
        Fri, 18 Jul 2025 08:55:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] x86/spec-ctrl: Update vendor/family/model logic
Date: Fri, 18 Jul 2025 16:55:01 +0100
Message-Id: <20250718155502.2610047-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718155502.2610047-1-andrew.cooper3@citrix.com>
References: <20250718155502.2610047-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch to the new fields and constants.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I've intentionally not converted the tables with raw numbers yet.  That's not
a mechanical change, and requires more care.
---
 xen/arch/x86/spec_ctrl.c | 162 +++++++++++++++++++--------------------
 1 file changed, 80 insertions(+), 82 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index bcdae1ed2377..c5bc2eef9572 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -388,7 +388,7 @@ int8_t __ro_after_init opt_xpti_domu = -1;
 
 static __init void xpti_init_default(void)
 {
-    if ( (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
+    if ( (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
          cpu_has_rdcl_no )
     {
         if ( opt_xpti_hwdom < 0 )
@@ -712,8 +712,8 @@ static bool __init check_smt_enabled(void)
      * At the time of writing, it is almost completely undocumented, so isn't
      * virtualised reliably.
      */
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
-         boot_cpu_data.x86 != 0xf && !cpu_has_hypervisor &&
+    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL &&
+         boot_cpu_data.family != 0xf && !cpu_has_hypervisor &&
          !rdmsr_safe(MSR_INTEL_CORE_THREAD_COUNT, val) )
         return (MASK_EXTR(val, MSR_CTC_CORE_MASK) !=
                 MASK_EXTR(val, MSR_CTC_THREAD_MASK));
@@ -738,11 +738,11 @@ static bool __init retpoline_calculations(void)
     unsigned int ucode_rev = this_cpu(cpu_sig).rev;
     bool safe = false;
 
-    if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         return true;
 
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return false;
 
     /*
@@ -793,8 +793,8 @@ static bool __init retpoline_calculations(void)
     {
         printk(XENLOG_ERR
                "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RSBA %u, EIBRS %u, RRSBA %u\n",
-               boot_cpu_data.x86, boot_cpu_data.x86_model,
-               boot_cpu_data.x86_mask, ucode_rev,
+               boot_cpu_data.family, boot_cpu_data.model,
+               boot_cpu_data.stepping, ucode_rev,
                cpu_has_rsba, cpu_has_eibrs, cpu_has_rrsba);
         add_taint(TAINT_CPU_OUT_OF_SPEC);
     }
@@ -833,7 +833,7 @@ static bool __init retpoline_calculations(void)
     if ( cpu_has_arch_caps )
         return true;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.model )
     {
     case 0x17: /* Penryn */
     case 0x1d: /* Dunnington */
@@ -866,7 +866,7 @@ static bool __init retpoline_calculations(void)
     case 0x4f: /* Broadwell EP/EX */
         safe = ucode_rev >= 0xb000021; break;
     case 0x56: /* Broadwell D */
-        switch ( boot_cpu_data.x86_mask )
+        switch ( boot_cpu_data.stepping )
         {
         case 2:  safe = ucode_rev >= 0x15;      break;
         case 3:  safe = ucode_rev >= 0x7000012; break;
@@ -874,7 +874,7 @@ static bool __init retpoline_calculations(void)
         case 5:  safe = ucode_rev >= 0xe000009; break;
         default:
             printk("Unrecognised CPU stepping %#x - assuming not reptpoline safe\n",
-                   boot_cpu_data.x86_mask);
+                   boot_cpu_data.stepping);
             safe = false;
             break;
         }
@@ -913,7 +913,7 @@ static bool __init retpoline_calculations(void)
 
     default:
         printk("Unrecognised CPU model %#x - assuming not reptpoline safe\n",
-               boot_cpu_data.x86_model);
+               boot_cpu_data.model);
         safe = false;
         break;
     }
@@ -938,11 +938,11 @@ static bool __init retpoline_calculations(void)
  */
 static bool __init rsb_is_full_width(void)
 {
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return true;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.model )
     {
     case 0x37: /* Baytrail / Valleyview (Silvermont) */
     case 0x4a: /* Merrifield */
@@ -966,11 +966,11 @@ static bool __init should_use_eager_fpu(void)
      * Assume all unrecognised processors are ok.  This is only known to
      * affect Intel Family 6 processors.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return false;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.model )
     {
         /*
          * Core processors since at least Nehalem are vulnerable.
@@ -1023,7 +1023,7 @@ static bool __init should_use_eager_fpu(void)
 
     default:
         printk("Unrecognised CPU model %#x - assuming vulnerable to LazyFPU\n",
-               boot_cpu_data.x86_model);
+               boot_cpu_data.model);
         return true;
     }
 }
@@ -1033,8 +1033,7 @@ static bool __init should_use_eager_fpu(void)
  */
 static void __init srso_calculations(bool hw_smt_enabled)
 {
-    if ( !(boot_cpu_data.x86_vendor &
-           (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+    if ( !(boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
         return;
 
     /*
@@ -1044,7 +1043,7 @@ static void __init srso_calculations(bool hw_smt_enabled)
     if ( cpu_has_hypervisor )
         return;
 
-    if ( boot_cpu_data.x86 == 0x19 )
+    if ( boot_cpu_data.family == 0x19 )
     {
         /*
          * We could have a table of models/microcode revisions.  ...or we
@@ -1059,7 +1058,7 @@ static void __init srso_calculations(bool hw_smt_enabled)
             printk(XENLOG_WARNING
                    "Vulnerable to SRSO, without suitable microcode to mitigate\n");
     }
-    else if ( boot_cpu_data.x86 < 0x19 )
+    else if ( boot_cpu_data.family < 0x19 )
     {
         /*
          * Zen1/2 (which have the IBPB microcode) have IBPB_BRTYPE behaviour
@@ -1084,7 +1083,7 @@ static void __init srso_calculations(bool hw_smt_enabled)
      * they can be altered at runtime so it's not safe to presume SRSO_NO.
      */
     if ( !hw_smt_enabled &&
-         (boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) )
+         (boot_cpu_data.family == 0x17 || boot_cpu_data.family == 0x18) )
         setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
 }
 
@@ -1100,11 +1099,10 @@ static void __init srso_calculations(bool hw_smt_enabled)
  */
 static bool __init has_div_vuln(void)
 {
-    if ( !(boot_cpu_data.x86_vendor &
-           (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+    if ( !(boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
         return false;
 
-    if ( boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18 )
+    if ( boot_cpu_data.family != 0x17 && boot_cpu_data.family != 0x18 )
         return false;
 
     return is_zen1_uarch();
@@ -1139,7 +1137,7 @@ static void __init ibpb_calculations(void)
         return;
     }
 
-    if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
     {
         /*
          * AMD/Hygon CPUs to date (June 2022) don't flush the RAS.  Future
@@ -1224,10 +1222,10 @@ static __init void l1tf_calculations(void)
     l1d_maxphysaddr = paddr_bits;
 
     /* L1TF is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
-         boot_cpu_data.x86 == 6 )
+    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL &&
+         boot_cpu_data.family == 6 )
     {
-        switch ( boot_cpu_data.x86_model )
+        switch ( boot_cpu_data.model )
         {
             /*
              * Core processors since at least Penryn are vulnerable.
@@ -1303,7 +1301,7 @@ static __init void l1tf_calculations(void)
 
     if ( cpu_has_bug_l1tf && hit_default )
         printk("Unrecognised CPU model %#x - assuming vulnerable to L1TF\n",
-               boot_cpu_data.x86_model);
+               boot_cpu_data.model);
 
     /*
      * L1TF safe address heuristics.  These apply to the real hardware we are
@@ -1360,15 +1358,15 @@ static __init void l1tf_calculations(void)
 static __init void mds_calculations(void)
 {
     /* MDS is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return;
 
     /* Any processor advertising MDS_NO should be not vulnerable to MDS. */
     if ( cpu_has_mds_no )
         return;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.model )
     {
         /*
          * Core processors since at least Nehalem are vulnerable.
@@ -1401,17 +1399,17 @@ static __init void mds_calculations(void)
          * Some Core processors have per-stepping vulnerability.
          */
     case 0x55: /* Skylake-X / Cascade Lake */
-        if ( boot_cpu_data.x86_mask <= 5 )
+        if ( boot_cpu_data.stepping <= 5 )
             cpu_has_bug_mds = true;
         break;
 
     case 0x8e: /* Kaby / Coffee / Whiskey Lake M */
-        if ( boot_cpu_data.x86_mask <= 0xb )
+        if ( boot_cpu_data.stepping <= 0xb )
             cpu_has_bug_mds = true;
         break;
 
     case 0x9e: /* Kaby / Coffee / Whiskey Lake D */
-        if ( boot_cpu_data.x86_mask <= 0xc )
+        if ( boot_cpu_data.stepping <= 0xc )
             cpu_has_bug_mds = true;
         break;
 
@@ -1444,7 +1442,7 @@ static __init void mds_calculations(void)
 
     default:
         printk("Unrecognised CPU model %#x - assuming vulnerable to MDS\n",
-               boot_cpu_data.x86_model);
+               boot_cpu_data.model);
         cpu_has_bug_mds = true;
         break;
     }
@@ -1471,8 +1469,8 @@ static __init void mds_calculations(void)
 static void __init rfds_calculations(void)
 {
     /* RFDS is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return;
 
     /*
@@ -1490,10 +1488,10 @@ static void __init rfds_calculations(void)
      * Not all CPUs are expected to get a microcode update enumerating one of
      * RFDS_{NO,CLEAR}, or we might have out-of-date microcode.
      */
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.vfm )
     {
-    case INTEL_FAM6_ALDERLAKE:
-    case INTEL_FAM6_RAPTORLAKE:
+    case INTEL_ALDERLAKE:
+    case INTEL_RAPTORLAKE:
         /*
          * Alder Lake and Raptor Lake might be a client SKU (with the
          * Gracemont cores active, and therefore vulnerable) or might be a
@@ -1505,17 +1503,17 @@ static void __init rfds_calculations(void)
         if ( !cpu_has_hybrid )
             break;
         fallthrough;
-    case INTEL_FAM6_ALDERLAKE_L:
-    case INTEL_FAM6_RAPTORLAKE_P:
-    case INTEL_FAM6_RAPTORLAKE_S:
-
-    case INTEL_FAM6_ATOM_GOLDMONT:      /* Apollo Lake */
-    case INTEL_FAM6_ATOM_GOLDMONT_D:    /* Denverton */
-    case INTEL_FAM6_ATOM_GOLDMONT_PLUS: /* Gemini Lake */
-    case INTEL_FAM6_ATOM_TREMONT_D:     /* Snow Ridge / Parker Ridge */
-    case INTEL_FAM6_ATOM_TREMONT:       /* Elkhart Lake */
-    case INTEL_FAM6_ATOM_TREMONT_L:     /* Jasper Lake */
-    case INTEL_FAM6_ATOM_GRACEMONT:     /* Alder Lake N */
+    case INTEL_ALDERLAKE_L:
+    case INTEL_RAPTORLAKE_P:
+    case INTEL_RAPTORLAKE_S:
+
+    case INTEL_ATOM_GOLDMONT:      /* Apollo Lake */
+    case INTEL_ATOM_GOLDMONT_D:    /* Denverton */
+    case INTEL_ATOM_GOLDMONT_PLUS: /* Gemini Lake */
+    case INTEL_ATOM_TREMONT_D:     /* Snow Ridge / Parker Ridge */
+    case INTEL_ATOM_TREMONT:       /* Elkhart Lake */
+    case INTEL_ATOM_TREMONT_L:     /* Jasper Lake */
+    case INTEL_ATOM_GRACEMONT:     /* Alder Lake N */
         return;
     }
 
@@ -1537,7 +1535,7 @@ static void __init tsa_calculations(void)
     unsigned int curr_rev, min_rev;
 
     /* TSA is only known to affect AMD processors at this time. */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD )
+    if ( boot_cpu_data.vendor != X86_VENDOR_AMD )
         return;
 
     /* If we're virtualised, don't attempt to synthesise anything. */
@@ -1556,7 +1554,7 @@ static void __init tsa_calculations(void)
      * ... otherwise, synthesise them.  CPUs other than Fam19 (Zen3/4) are
      * stated to be not vulnerable.
      */
-    if ( boot_cpu_data.x86 != 0x19 )
+    if ( boot_cpu_data.family != 0x19 )
     {
         setup_force_cpu_cap(X86_FEATURE_TSA_SQ_NO);
         setup_force_cpu_cap(X86_FEATURE_TSA_L1_NO);
@@ -1589,8 +1587,8 @@ static void __init tsa_calculations(void)
     default:
         printk(XENLOG_WARNING
                "Unrecognised CPU %02x-%02x-%02x, ucode 0x%08x for TSA mitigation\n",
-               boot_cpu_data.x86, boot_cpu_data.x86_model,
-               boot_cpu_data.x86_mask, curr_rev);
+               boot_cpu_data.family, boot_cpu_data.model,
+               boot_cpu_data.stepping, curr_rev);
         return;
     }
 
@@ -1631,7 +1629,7 @@ static bool __init cpu_has_gds(void)
      * Cove (Alder Lake, Sapphire Rapids).  Broadwell and older, and the Atom
      * line, and all hybrid parts are unaffected.
      */
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.model )
     {
     case 0x55: /* Skylake/Cascade Lake/Cooper Lake SP */
     case 0x6a: /* Ice Lake SP */
@@ -1661,8 +1659,8 @@ static void __init gds_calculations(void)
     bool cpu_has_bug_gds, mitigated = false;
 
     /* GDS is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return;
 
     cpu_has_bug_gds = cpu_has_gds();
@@ -1684,8 +1682,8 @@ static void __init gds_calculations(void)
              */
             printk(XENLOG_ERR
                    "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: GDS_CTRL && GDS_NO\n",
-                   boot_cpu_data.x86, boot_cpu_data.x86_model,
-                   boot_cpu_data.x86_mask, this_cpu(cpu_sig).rev);
+                   boot_cpu_data.family, boot_cpu_data.model,
+                   boot_cpu_data.stepping, this_cpu(cpu_sig).rev);
             return add_taint(TAINT_CPU_OUT_OF_SPEC);
         }
 
@@ -1756,8 +1754,8 @@ static void __init gds_calculations(void)
 static bool __init cpu_has_bug_bhi(void)
 {
     /* BHI is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return false;
 
     if ( boot_cpu_has(X86_FEATURE_BHI_NO) )
@@ -1880,7 +1878,7 @@ static void __init its_calculations(void)
         return;
 
     /* ITS is only known to affect Intel processors at this time. */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL )
         return;
 
     /*
@@ -1890,27 +1888,27 @@ static void __init its_calculations(void)
      *  - those with BHI_CTRL
      * but we still need to synthesise ITS_NO.
      */
-    if ( boot_cpu_data.x86 != 6 || !cpu_has_eibrs ||
+    if ( boot_cpu_data.family != 6 || !cpu_has_eibrs ||
          boot_cpu_has(X86_FEATURE_BHI_CTRL) )
         goto synthesise;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.vfm )
     {
         /* These Skylake-uarch cores suffer cases #2 and #3. */
-    case INTEL_FAM6_SKYLAKE_X:
-    case INTEL_FAM6_KABYLAKE_L:
-    case INTEL_FAM6_KABYLAKE:
-    case INTEL_FAM6_COMETLAKE:
-    case INTEL_FAM6_COMETLAKE_L:
+    case INTEL_SKYLAKE_X:
+    case INTEL_KABYLAKE_L:
+    case INTEL_KABYLAKE:
+    case INTEL_COMETLAKE:
+    case INTEL_COMETLAKE_L:
         return;
 
         /* These Sunny/Willow/Cypress Cove cores suffer case #3. */
-    case INTEL_FAM6_ICELAKE_X:
-    case INTEL_FAM6_ICELAKE_D:
-    case INTEL_FAM6_ICELAKE_L:
-    case INTEL_FAM6_TIGERLAKE_L:
-    case INTEL_FAM6_TIGERLAKE:
-    case INTEL_FAM6_ROCKETLAKE:
+    case INTEL_ICELAKE_X:
+    case INTEL_ICELAKE_D:
+    case INTEL_ICELAKE_L:
+    case INTEL_TIGERLAKE_L:
+    case INTEL_TIGERLAKE:
+    case INTEL_ROCKETLAKE:
         return;
 
     default:
@@ -2183,8 +2181,8 @@ void __init init_speculation_mitigations(void)
          * before going idle is less overhead than flushing on PV entry.
          */
         if ( !opt_rsb_pv && hw_smt_enabled &&
-             (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD|X86_VENDOR_HYGON)) &&
-             (boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) )
+             (boot_cpu_data.vendor & (X86_VENDOR_AMD|X86_VENDOR_HYGON)) &&
+             (boot_cpu_data.family == 0x17 || boot_cpu_data.family == 0x18) )
             setup_force_cpu_cap(X86_FEATURE_SC_RSB_IDLE);
     }
 
-- 
2.39.5


