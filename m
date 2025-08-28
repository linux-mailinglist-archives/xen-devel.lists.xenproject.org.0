Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D47B3A39D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099147.1453061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureH2-0006Dz-VK; Thu, 28 Aug 2025 15:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099147.1453061; Thu, 28 Aug 2025 15:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureH2-00069F-Rb; Thu, 28 Aug 2025 15:10:48 +0000
Received: by outflank-mailman (input) for mailman id 1099147;
 Thu, 28 Aug 2025 15:10:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCm-00035A-Nm
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:24 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f7a945b-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:06:23 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b0cbbbaso9178255e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:23 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:21 -0700 (PDT)
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
X-Inumbo-ID: 8f7a945b-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393582; x=1756998382; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1g7fXJwyTmagQ+fUZI3KocvezPB5n0D5eI066AmNuaE=;
        b=e40UnWakUmICyJ3pgdWjAez32Xs2J8sJVM2c7HjLii+GhaWcZn6eK24J20LuH2QRvy
         EWmYnAlGG5jZAilVjtrWSPVB5lf8A5HgrJh71h/fO4b9+7OAdCvWnX9kTrKN/wWQ8l3s
         LoqxjghvSqwgQRay1a7REwyTWspU9a3N/F8nA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393582; x=1756998382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1g7fXJwyTmagQ+fUZI3KocvezPB5n0D5eI066AmNuaE=;
        b=XPxRVazyl+pEnLtPsIEM2X2W8/b8bnP3xlAxdSkI8Xor7dXHCHH9g8OH9RIJ7etTBs
         Fgc5AtewBvF0PEfjTswN8yVxLCyyLvi/6w9SzAbr9l/anadmF5rjFkvLOTO1DqoxGUB4
         ZHpwCLhsVQVqUaxFlQj3EN0IeWO+XZZR6Z9OtpkTQwpZd9KueClzQz7IbvfWGhvhocF/
         aFJJlK8zaWpUBjzM6CF4AOMOrRrMVvyCbFbIkkeMSJDIkneFPYQKaVFJkX4mcW5n8SRd
         2qt4tBm0x4jmAaU8tuyqSikjGhbHpyPZ2P4Gye3IUb6nRHDeYwZOHHpVC82lp/VwN5g4
         aTDA==
X-Gm-Message-State: AOJu0YwggQWQZa/Tknqc4onzYLrtPqPXF8kkgkmcgrWZEDUkNiJTpP9L
	ucRsaFFTXWQ//cZVl4/oQvvkr7HpTrY0J/P47XL6IvlaZmbeSeQjhLw+Z9naEUDTqP09z7zVYEP
	NJiNb
X-Gm-Gg: ASbGncvgPQc0Ls3bCZlgSr/0KJg+9KPR4ToZnGQbSrnjU2yYRIgLJSlszT62GfqpCmm
	JtgHS8tyIHYRP/tHtt9i8wvHDw1KzttzCB+pGC8DoMXJ0kql8L0U9htMVnUD9pWl3jZRL7J3pKv
	9Wc8VJy2ipjZhbSpo3ESYoppHSCescz2OzcR3M8sNJotDbghOcMXUHSrHGm16FTiredYi4qAHsV
	UEgi8crdA1flvgkoCzDPRyAnz6ZibLOZ9+4J0mv940CTkgxYzyTs4cE/vTLAlLWA1ujBPCzHcvE
	lDNEgQTnxed6AzAjFZeToMyvfK79I3z2Ffk5XoDgnpnGriPRoFvTt9vMot4SiMFUYsSGzkILEkD
	POB3V7uN8qt7PTQu6Emqt2TZT4LqwOGxGnCNLTY/UE/MsdMzR2zAyxHJaKfEl/bR4w/UqT3Vffd
	lOAEhZvuGVeE4hU4bJe6igSA==
X-Google-Smtp-Source: AGHT+IGFUp4xpm3RLbeJfkywplsFAa8MLRkbelyLTQZbgnqQvj2Y2geapjX8W3GoRwIA0s3EEF5aCg==
X-Received: by 2002:a05:600c:190e:b0:459:e3f8:9308 with SMTP id 5b1f17b1804b1-45b517ad4bbmr217773045e9.11.1756393581895;
        Thu, 28 Aug 2025 08:06:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 19/23] x86/pv: Adjust GS handling for FRED mode
Date: Thu, 28 Aug 2025 16:04:05 +0100
Message-Id: <20250828150409.901315-20-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When FRED is active, hardware automatically swaps GS when changing privilege,
and the SWAPGS instruction is disallowed.

For native OSes using GS as the thread local pointer this is a massive
improvement on the pre-FRED architecture, but under Xen it makes handling PV
guests more complicated.  Specifically, it means that GS_BASE and GS_SHADOW
are the opposite way around in FRED mode, as opposed to IDT mode.

This leads to the following changes:

  * In load_segments(), we have to load both GSes.  Account for this in the
    SWAP() condition and avoid the path with SWAGS.

  * In save_segments(), we need to read GS_KERN rather than GS_BASE.

  * In toggle_guest_mode(), we need to emulate SWAPGS.

  * In do_set_segment_base(), merge the SEGBASE_GS_{USER,KERNEL} cases and
    take FRED into account when choosing which base to update.

    SEGBASE_GS_USER_SEL was already an LKGS invocation (decades before FRED)
    so under FRED needs to be a simple MOV %gs.  Simply skip the SWAPGSes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New

I think this functions, but it's not ideal.  The conditions are asymmetric and
awkward.

In principle, MSR_IMM can be as performant as FSGSBASE.  They can literally be
the the same microcode if the microline indexing allows.

Otherwise, the FSGSBASE instructions will be more performant than MSR
accesses (no need to decode %ecx), even with non-serialising writes (which all
FRED hardware should have).  However, use of FSGSBASE often comes with SWAPGS
and that can't be used under FRED.
---
 xen/arch/x86/domain.c             | 22 +++++++++++++++++-----
 xen/arch/x86/pv/domain.c          | 22 ++++++++++++++++++++--
 xen/arch/x86/pv/misc-hypercalls.c | 16 ++++++++++------
 3 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8089ff929bf7..64922869a625 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1819,9 +1819,10 @@ static void load_segments(struct vcpu *n)
 
         /*
          * Figure out which way around gsb/gss want to be.  gsb needs to be
-         * the active context, and gss needs to be the inactive context.
+         * the active context, and gss needs to be the inactive context,
+         * unless we're in FRED mode where they're reversed.
          */
-        if ( !(n->arch.flags & TF_kernel_mode) )
+        if ( !(n->arch.flags & TF_kernel_mode) ^ opt_fred )
             SWAP(gsb, gss);
 
         if ( using_svm() && (n->arch.pv.fs | n->arch.pv.gs) <= 3 )
@@ -1842,7 +1843,9 @@ static void load_segments(struct vcpu *n)
 
     if ( !fs_gs_done && !compat )
     {
-        if ( read_cr4() & X86_CR4_FSGSBASE )
+        unsigned long cr4 = read_cr4();
+
+        if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
         {
             __wrgsbase(gss);
             __wrfsbase(n->arch.pv.fs_base);
@@ -1959,6 +1962,9 @@ static void load_segments(struct vcpu *n)
  * Guests however cannot use SWAPGS, so there is no mechanism to modify the
  * inactive GS base behind Xen's back.  Therefore, Xen's copy of the inactive
  * GS base is still accurate, and doesn't need reading back from hardware.
+ *
+ * Under FRED, hardware automatically swaps GS for us, so GS_KERN is the
+ * active GS from the guest's point of view.
  */
 static void save_segments(struct vcpu *v)
 {
@@ -1974,12 +1980,18 @@ static void save_segments(struct vcpu *v)
         if ( read_cr4() & X86_CR4_FSGSBASE )
         {
             fs_base = __rdfsbase();
-            gs_base = __rdgsbase();
+            if ( opt_fred )
+                gs_base = rdmsr(MSR_SHADOW_GS_BASE);
+            else
+                gs_base = __rdgsbase();
         }
         else
         {
             fs_base = rdmsr(MSR_FS_BASE);
-            gs_base = rdmsr(MSR_GS_BASE);
+            if ( opt_fred )
+                gs_base = rdmsr(MSR_SHADOW_GS_BASE);
+            else
+                gs_base = rdmsr(MSR_GS_BASE);
         }
 
         v->arch.pv.fs_base = fs_base;
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 9c4785c187dd..5a7b69da5000 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -14,9 +14,10 @@
 #include <asm/cpufeature.h>
 #include <asm/fsgsbase.h>
 #include <asm/invpcid.h>
-#include <asm/spec_ctrl.h>
 #include <asm/pv/domain.h>
 #include <asm/shadow.h>
+#include <asm/spec_ctrl.h>
+#include <asm/traps.h>
 
 #ifdef CONFIG_PV32
 int8_t __read_mostly opt_pv32 = -1;
@@ -480,11 +481,28 @@ void toggle_guest_mode(struct vcpu *v)
      * subsequent context switch won't bother re-reading it.
      */
     gs_base = read_gs_base();
+
+    /*
+     * In FRED mode, not only are the two GSes the other way around (i.e. we
+     * want to read GS_KERN here), the SWAPGS instruction is disallowed so we
+     * have to emulate it.
+     */
+    if ( opt_fred )
+    {
+        unsigned long gs_kern = rdmsr(MSR_SHADOW_GS_BASE);
+
+        wrmsrns(MSR_SHADOW_GS_BASE, gs_base);
+        write_gs_base(gs_kern);
+
+        gs_base = gs_kern;
+    }
+    else
+        asm volatile ( "swapgs" );
+
     if ( v->arch.flags & TF_kernel_mode )
         v->arch.pv.gs_base_kernel = gs_base;
     else
         v->arch.pv.gs_base_user = gs_base;
-    asm volatile ( "swapgs" );
 
     _toggle_guest_pt(v);
 
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index 4c2abeb4add8..2c9cf50638db 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -11,6 +11,7 @@
 
 #include <asm/debugreg.h>
 #include <asm/fsgsbase.h>
+#include <asm/traps.h>
 
 long do_set_debugreg(int reg, unsigned long value)
 {
@@ -192,11 +193,12 @@ long do_set_segment_base(unsigned int which, unsigned long base)
 
         case SEGBASE_GS_USER:
             v->arch.pv.gs_base_user = base;
-            write_gs_shadow(base);
-            break;
-
+            fallthrough;
         case SEGBASE_GS_KERNEL:
-            write_gs_base(base);
+            if ( (which == SEGBASE_GS_KERNEL) ^ opt_fred )
+                write_gs_base(base);
+            else
+                write_gs_shadow(base);
             break;
         }
         break;
@@ -209,7 +211,8 @@ long do_set_segment_base(unsigned int which, unsigned long base)
          * We wish to update the user %gs from the GDT/LDT.  Currently, the
          * guest kernel's GS_BASE is in context.
          */
-        asm volatile ( "swapgs" );
+        if ( !opt_fred )
+            asm volatile ( "swapgs" );
 
         if ( sel > 3 )
             /* Fix up RPL for non-NUL selectors. */
@@ -247,7 +250,8 @@ long do_set_segment_base(unsigned int which, unsigned long base)
         /* Update the cache of the inactive base, as read from the GDT/LDT. */
         v->arch.pv.gs_base_user = read_gs_base();
 
-        asm volatile ( safe_swapgs );
+        if ( !opt_fred )
+            asm volatile ( safe_swapgs );
         break;
     }
 
-- 
2.39.5


