Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EB6BB85D9
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137055.1473514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4ohH-0006ST-6I; Fri, 03 Oct 2025 22:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137055.1473514; Fri, 03 Oct 2025 22:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4ohH-0006RL-0e; Fri, 03 Oct 2025 22:56:19 +0000
Received: by outflank-mailman (input) for mailman id 1137055;
 Fri, 03 Oct 2025 22:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4ofA-0004mK-9q
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:54:08 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbe96831-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:54:03 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3ee12332f3dso2347181f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:54:03 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:54:01 -0700 (PDT)
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
X-Inumbo-ID: dbe96831-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532043; x=1760136843; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ce/veHiNQH7XIBxxQhrirY27AHnw8PAuWqqvFIesB+M=;
        b=TCXAKjJdbAKRpAxsJO4jVDsR3ArX7CKm4agt94bkEGihsvo0SOnI6xLulQ+BV0ropC
         /nkR1z4k4Nw5wnyKv2aucmnZbp/h+8ocq+NXp5YJzlRrOVG5uG/xjGO2/OahJq1lAFJl
         eyOLxqrAf2YB1HogTJouXBdUOaWNqMTJukGfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532043; x=1760136843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ce/veHiNQH7XIBxxQhrirY27AHnw8PAuWqqvFIesB+M=;
        b=BMNFLT7ddqN7ry2Wpel4/5hsi+YF6Wq6YmIyrEO3xGPQs30ZdzTSrCN2vgWHGlWI9W
         ec8ykLdnZUjm1Z+CjNgI3L/4lrVcsbeLjiMcE+FtimP2lu+SGx+aO1VtMZaHcBhUTPgI
         /FcyW0lj+vIzrFIIhejLu03mVNrQuQNS7kRcO7i4mMV2QSNNyOn5G8uFr+nDUgkwCxJ7
         bL/CCebewUxklNSoFBC4g21KurTCSJpyCtKzZz182DZr9RfCSY+YKgd+xdEh/R8F4rsa
         4elA6XNzA8AoEt5IbhC5y2QRzgVUCP9uTL0aAks1D5mgFXIvFYfI3qq/ilFOhLAkJOMq
         8sww==
X-Gm-Message-State: AOJu0Yw/s27Mo6M991hzusThTdWtPD/0uqJQpwXGpQD9mh8WA8DhPez8
	mooKfKIJJg2chvCqfS6yd/rr+r6qN02Wg6MYA3IwdRbby2etf93RQtuePN7jwPUbceTiOn4r9eO
	hXq6tQMw2fHzB
X-Gm-Gg: ASbGncsl7p8/vBT7fVQfc4dJp8B/5hxUNQroM9yyKc5ZeHRE9ZBti0ioXUqg7ZWOMu2
	sRX8VbYhnwKkLJK5guhDG8giour2DFUvbaSu+5uEixKRDmSWse4IicHgpqn58lT6E1RqcNdJBOr
	MumA0sm00lJvZFQEiBBkY0pmq9CCreGi2ddOnKMa75Glf3jAGKQIJ9RqFVrYNR6BhmNMJRisaQV
	n3YPOJlrs2uy+kFgWDRm6CeYUv3+nIb9SNI2sDzQF7tHOPeysZLx/w4jcbkZuBTeK/JsMWjnyPP
	d6QrRP+tGOklCTPLSDEzqX6ASHqw1ORgp3/U5lD/MM9FyOwqMaVyZ6P1Yme80cmI/wu5+LUJliS
	dqtRhhzWOtTJDIAnhLl7lrChYYH27yyGfjpoF1bb3/BcIEr0imaGEQAhzCSMj+ogJg5q4NG5/iq
	B6/vqX7xLI/usM4zzSvnaPGM4C+JCHWaw=
X-Google-Smtp-Source: AGHT+IFnm/X8LPCGnPd/A+pzm7HYTAVEUtlYINF/Zo5nS6xrAQpb2V3Ra5GfuNY8K39DQsv+h/QpcA==
X-Received: by 2002:a05:6000:2086:b0:3ea:63d:44c6 with SMTP id ffacd0b85a97d-42567194b16mr2975580f8f.35.1759532042908;
        Fri, 03 Oct 2025 15:54:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 18/22] x86/pv: Adjust GS handling for FRED mode
Date: Fri,  3 Oct 2025 23:53:30 +0100
Message-Id: <20251003225334.2123667-19-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
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

  * In save_segments(), we need to read GS_SHADOW rather than GS_BASE.

  * In toggle_guest_mode(), we need to emulate SWAPGS.

  * In do_set_segment_base(), merge the SEGBASE_GS_{USER,KERNEL} cases and
    take FRED into account when choosing which base to update.

    SEGBASE_GS_USER_SEL was already an LKGS invocation (decades before FRED)
    so under FRED needs to be just a MOV %gs.  Simply skip the SWAPGSes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v3:
 * Rename things

v2:
 * New

I think this functions, but it's not ideal.  The conditions are asymmetric and
awkward.
---
 xen/arch/x86/domain.c             | 22 +++++++++++++++++-----
 xen/arch/x86/pv/domain.c          | 22 ++++++++++++++++++++--
 xen/arch/x86/pv/misc-hypercalls.c | 16 ++++++++++------
 3 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8089ff929bf7..ce08f91be3af 100644
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
+ * Under FRED, hardware automatically swaps GS for us, so SHADOW_GS is the
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
index 9c4785c187dd..369af444c29b 100644
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
+     * want to read GS_SHADOW here), the SWAPGS instruction is disallowed so
+     * we have to emulate it.
+     */
+    if ( opt_fred )
+    {
+        unsigned long gs_shadow = rdmsr(MSR_SHADOW_GS_BASE);
+
+        wrmsrns(MSR_SHADOW_GS_BASE, gs_base);
+        write_gs_base(gs_shadow);
+
+        gs_base = gs_shadow;
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


