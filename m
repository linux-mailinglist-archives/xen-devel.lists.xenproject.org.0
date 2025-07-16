Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19044B07C13
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 19:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045520.1415670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5yo-0003Kb-Gl; Wed, 16 Jul 2025 17:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045520.1415670; Wed, 16 Jul 2025 17:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5yo-0003GP-Ck; Wed, 16 Jul 2025 17:31:42 +0000
Received: by outflank-mailman (input) for mailman id 1045520;
 Wed, 16 Jul 2025 17:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc5ym-0002mM-Uh
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 17:31:40 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bba3099e-626a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 19:31:40 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso734375e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 10:31:40 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e68sm27048625e9.1.2025.07.16.10.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 10:31:38 -0700 (PDT)
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
X-Inumbo-ID: bba3099e-626a-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752687099; x=1753291899; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cHqWIXYK9ZHd5yODMOV445YmwZQVsFju3NAdcKhA+M=;
        b=KVyCnSd8amSZulrS1eg+guK8xqzdechMiAMxlrg+5xw2k5keEMynGz0f54HaaQv79I
         kIKfDR8QUlnj2QeQxzqt6Ze1ahv98xpHaYts8gp5hbF0q4S3aScae74Nw51beZAZJXpg
         SDjxVzuTYFm0MLNmUa/2z1ps7NWt6ZJ2T/LwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752687099; x=1753291899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cHqWIXYK9ZHd5yODMOV445YmwZQVsFju3NAdcKhA+M=;
        b=LLxyS2/Tk+s8RgZXvRIxmWXGWQewz7R2tbT2WRYANgvZYQKorQTJ/IqLy4R3z3ubRR
         ZAw3DoL/2M+Yw0Rpl0WzFZAsWGu2iMCZZJ+SCFjnlA+maoKiOyMDBHaf6Wmy7I+MwiAM
         WxnRvG7UHYTwZiSPs4iJNPGNWTATbIwDarezTIbAbyxqhni2YaB8DssXVExzDc53oG+4
         7Jd8RydDDxmGfiyW0MuL1hsx3z6G3WKJgKFFwjor3L5QeurIdXvMH/IoIkWNuLd/5VzF
         I6m9QngZe+BYkp3g+X4uqOLNYkrF9mGIXKVoDs1Bf5Xe66TAEvRjWluDerXtQ0Uop+Y1
         MM9A==
X-Gm-Message-State: AOJu0YwQMt+BTHWwh63CbDm6q3rlGInWNy5N2uPfuWDoFqJm4rNdCaW/
	/N+y3yhLBQDmE7i6WruobEc6cEzg/MXcHszOIvNxQrSpk1eHfPVc5Jhz6+vgnbB/OBIMGwK+TVm
	KVnEMooADtA==
X-Gm-Gg: ASbGnctMnLizMAn4Hgd4ZFqAfgRkBpOIPXOkcMYOmHIau2Uuh/AdVrtRi1RquOXx1ng
	Gjv3NMvF953WMHgIyDK0PUnM3ryzNjb+Qp3d0CseX0HRd/HnOSbFPk2h/UvIo3lSfJh5ScVT1rv
	YMIGJ2rVI1SDMuFb2EAS5VBtGhQZAgZ+8i5TMK5zTLir52a2rtr57KZXt7zLbpTzwaoDUOCxkTd
	wbqx35qLEULTF5OyDdABTlkxLFindFwMioEvpzvVztVw3tvKpVfbniqyquqiw/WFS2pKdjYm4vZ
	y6I3ywFeqDZCPfvHJW6mkI2vlzHf49FUprTAF0RZVPLQX4bkzJRCpqBy7b3LCs5hNkvhYK7vMDX
	2Fui+1VsLR2vM2oee6j9hBT64r57F/jFM8Db4bHIQzVC+MkuZePPSNjF7HGrzfpo9EE+puSlvd6
	iI+GbKvAtWd44=
X-Google-Smtp-Source: AGHT+IFerGiKFNcZqXC7oXHy7Xms5M28KyxTImmZyTMyYQmvkqDc4bSqVrqYOBHxadlOHOtj+kBnoQ==
X-Received: by 2002:a05:600c:820f:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-4562ed57638mr33497505e9.6.1752687099449;
        Wed, 16 Jul 2025 10:31:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/6] x86: Convert users of INTEL_FAM6_MODEL() to X86_MATCH_VFM()
Date: Wed, 16 Jul 2025 18:31:30 +0100
Message-Id: <20250716173132.2213891-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This replaces raw model numbers (and comments in some cases) with names.  For
probe_mwait_errata(), merge the comments with the table to make it easier to
see which erratum is which, and drop a stray "Problem" in LNL030.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

There isn't an obvious helper in Linux to use which can avoid the data
parameter; Linux doesn't really do lists like this which are *just* a VFM
match with nothing else.

Either way, I've opted for a few extra NULLs than a proliferation of
X86_MATCH_*() helpers.
---
 xen/arch/x86/acpi/cpu_idle.c | 48 ++++++++++++++-------------------
 xen/arch/x86/cpu/intel.c     | 51 +++++++++++++++++-------------------
 2 files changed, 44 insertions(+), 55 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index fee29353439e..78e98e9c134d 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -583,7 +583,6 @@ bool errata_c6_workaround(void)
 
     if ( unlikely(fix_needed == -1) )
     {
-#define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
         /*
          * Errata AAJ72: EOI Transaction May Not be Sent if Software Enters
          * Core C6 During an Interrupt Service Routine"
@@ -594,12 +593,12 @@ bool errata_c6_workaround(void)
          * there is an EOI pending.
          */
         static const struct x86_cpu_id eoi_errata[] = {
-            INTEL_FAM6_MODEL(0x1a),
-            INTEL_FAM6_MODEL(0x1e),
-            INTEL_FAM6_MODEL(0x1f),
-            INTEL_FAM6_MODEL(0x25),
-            INTEL_FAM6_MODEL(0x2c),
-            INTEL_FAM6_MODEL(0x2f),
+            X86_MATCH_VFM(INTEL_NEHALEM_EP,   NULL),
+            X86_MATCH_VFM(INTEL_NEHALEM,      NULL),
+            X86_MATCH_VFM(INTEL_NEHALEM_G,    NULL),
+            X86_MATCH_VFM(INTEL_WESTMERE,     NULL),
+            X86_MATCH_VFM(INTEL_WESTMERE_EP,  NULL),
+            X86_MATCH_VFM(INTEL_WESTMERE_EX,  NULL),
             { }
         };
         /*
@@ -617,29 +616,22 @@ bool errata_c6_workaround(void)
          * discovered on Haswell hardware, and is affected.
          */
         static const struct x86_cpu_id isr_errata[] = {
-            /* Haswell */
-            INTEL_FAM6_MODEL(0x3c),
-            INTEL_FAM6_MODEL(0x3f),
-            INTEL_FAM6_MODEL(0x45),
-            INTEL_FAM6_MODEL(0x46),
-            /* Broadwell */
-            INTEL_FAM6_MODEL(0x47),
-            INTEL_FAM6_MODEL(0x3d),
-            INTEL_FAM6_MODEL(0x4f),
-            INTEL_FAM6_MODEL(0x56),
-            /* Skylake (client) */
-            INTEL_FAM6_MODEL(0x5e),
-            INTEL_FAM6_MODEL(0x4e),
-            /* {Sky/Cascade}lake (server) */
-            INTEL_FAM6_MODEL(0x55),
-            /* {Kaby/Coffee/Whiskey/Amber} Lake */
-            INTEL_FAM6_MODEL(0x9e),
-            INTEL_FAM6_MODEL(0x8e),
-            /* Cannon Lake */
-            INTEL_FAM6_MODEL(0x66),
+            X86_MATCH_VFM(INTEL_HASWELL,      NULL),
+            X86_MATCH_VFM(INTEL_HASWELL_X,    NULL),
+            X86_MATCH_VFM(INTEL_HASWELL_L,    NULL),
+            X86_MATCH_VFM(INTEL_HASWELL_G,    NULL),
+            X86_MATCH_VFM(INTEL_BROADWELL,    NULL),
+            X86_MATCH_VFM(INTEL_BROADWELL_G,  NULL),
+            X86_MATCH_VFM(INTEL_BROADWELL_X,  NULL),
+            X86_MATCH_VFM(INTEL_BROADWELL_D,  NULL),
+            X86_MATCH_VFM(INTEL_SKYLAKE_L,    NULL),
+            X86_MATCH_VFM(INTEL_SKYLAKE,      NULL),
+            X86_MATCH_VFM(INTEL_SKYLAKE_X,    NULL),
+            X86_MATCH_VFM(INTEL_KABYLAKE_L,   NULL),
+            X86_MATCH_VFM(INTEL_KABYLAKE,     NULL),
+            X86_MATCH_VFM(INTEL_CANNONLAKE_L, NULL),
             { }
         };
-#undef INTEL_FAM6_MODEL
 
         fix_needed = cpu_has_apic &&
                      ((!directed_eoi_enabled && x86_match_cpu(eoi_errata)) ||
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 26a171aa363e..2028a609453b 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -382,16 +382,12 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
  */
 static void probe_c3_errata(const struct cpuinfo_x86 *c)
 {
-#define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
     static const struct x86_cpu_id models[] = {
-        /* Nehalem */
-        INTEL_FAM6_MODEL(0x1a),
-        INTEL_FAM6_MODEL(0x1e),
-        INTEL_FAM6_MODEL(0x1f),
-        INTEL_FAM6_MODEL(0x2e),
-        /* Westmere (note Westmere-EX is not affected) */
-        INTEL_FAM6_MODEL(0x2c),
-        INTEL_FAM6_MODEL(0x25),
+        X86_MATCH_VFM(INTEL_NEHALEM_EP,   NULL),
+        X86_MATCH_VFM(INTEL_NEHALEM,      NULL),
+        X86_MATCH_VFM(INTEL_NEHALEM_G,    NULL),
+        X86_MATCH_VFM(INTEL_WESTMERE,     NULL),
+        X86_MATCH_VFM(INTEL_WESTMERE_EP,  NULL),
         { }
     };
 
@@ -405,29 +401,30 @@ static void probe_c3_errata(const struct cpuinfo_x86 *c)
     }
 }
 
-/*
- * APL30: One use of the MONITOR/MWAIT instruction pair is to allow a logical
- * processor to wait in a sleep state until a store to the armed address range
- * occurs. Due to this erratum, stores to the armed address range may not
- * trigger MWAIT to resume execution.
- *
- * ICX143: Under complex microarchitectural conditions, a monitor that is armed
- * with the MWAIT instruction may not be triggered, leading to a processor
- * hang.
- *
- * LNL030: Problem P-cores may not exit power state Core C6 on monitor hit.
- *
- * Force the sending of an IPI in those cases.
- */
 static void __init probe_mwait_errata(void)
 {
     static const struct x86_cpu_id __initconst models[] = {
-        INTEL_FAM6_MODEL(INTEL_FAM6_ATOM_GOLDMONT), /* APL30  */
-        INTEL_FAM6_MODEL(INTEL_FAM6_ICELAKE_X),     /* ICX143 */
-        INTEL_FAM6_MODEL(INTEL_FAM6_LUNARLAKE_M),   /* LNL030 */
+        /*
+         * APL30: One use of the MONITOR/MWAIT instruction pair is to allow a
+         * logical processor to wait in a sleep state until a store to the
+         * armed address range occurs. Due to this erratum, stores to the
+         * armed address range may not trigger MWAIT to resume execution.
+         */
+        X86_MATCH_VFM(INTEL_ATOM_GOLDMONT, NULL),
+
+        /*
+         * ICX143: Under complex microarchitectural conditions, a monitor that
+         * is armed with the MWAIT instruction may not be triggered, leading
+         * to a processor hang.
+         */
+        X86_MATCH_VFM(INTEL_ICELAKE_X, NULL),
+
+        /*
+         * LNL030: P-cores may not exit power state Core C6 on monitor hit.
+         */
+        X86_MATCH_VFM(INTEL_LUNARLAKE_M, NULL),
         { }
     };
-#undef INTEL_FAM6_MODEL
 
     if ( boot_cpu_has(X86_FEATURE_MONITOR) && x86_match_cpu(models) )
     {
-- 
2.39.5


