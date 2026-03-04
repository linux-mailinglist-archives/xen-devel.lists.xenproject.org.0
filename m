Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKRqHIVpqGnYuQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 18:19:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D577D2050EA
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 18:19:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245832.1545201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxprp-0002dy-O8; Wed, 04 Mar 2026 17:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245832.1545201; Wed, 04 Mar 2026 17:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxprp-0002cH-LH; Wed, 04 Mar 2026 17:18:37 +0000
Received: by outflank-mailman (input) for mailman id 1245832;
 Wed, 04 Mar 2026 17:18:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Avq=BE=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vxpro-0002cB-JA
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 17:18:36 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a7efe51-17ee-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 18:18:30 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4837907f535so63939635e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 09:18:30 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851881a844sm59032745e9.15.2026.03.04.09.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 09:18:28 -0800 (PST)
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
X-Inumbo-ID: 2a7efe51-17ee-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772644710; x=1773249510; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLgVDDKfnR6JHrXAy+RBeThIO2uC8DuDIEkoJk6r+O8=;
        b=AOf3QJ5Ok3Qn99x4Tr86bdRFfMFzJIWS+pbUPQVm09kcyCxJIeJh99FygSzDmrZCwy
         s4Yp9nTcnxpV4dMDzzh7vj7O63IaFn0JEOLYfHeYFdgyhYRahFUuqgOGc8BQ/7XlzQ3w
         ah7kO7MRCBDQTtmURrmNUwHIqF+QZxrnOVroo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772644710; x=1773249510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kLgVDDKfnR6JHrXAy+RBeThIO2uC8DuDIEkoJk6r+O8=;
        b=e2XA7PovXF0dcZ1HZaQvAsq17KtTdIaeHRAHlYnNmRw+Erg7gvmMybpKRon8xow5y2
         /DkUCEnVVdjc8gLBULpzui9oeeFeqJqm20YWbvzQ9PfFRYrj9n1sQP6EGf1xPeBLuhKZ
         nz6BxHs8U2ZCf0tKNpyr1Yeo5WwoiPRC9WsExIx0+IQLCBGcnCwZ5rGzBV6XKhED5hFt
         H8whgZwmJdSc64rQswDLo806NCF8uT6EQzRmTnJGhnICdH1nvOM7WCsBFhyg4mIxqp7i
         I2O8fvf7nZOrCvWSTqMLUWo1BIHDJ94jQHxWnMzSczpyFKXD3HBnBVd9NImB3sM5gshu
         j1pQ==
X-Gm-Message-State: AOJu0YwHJQa2fEXzgJroymagCOxdyw1YCBcnicy3IGGnfzUa4HHDI68k
	ize3Uzrg7ZSJQyTNHCe4j9Z51lZFCVd/KOibuzEQYm0BGUmHW+aTQweXK7VaIF99WkBtrnGOG8U
	P0j6O
X-Gm-Gg: ATEYQzw9TeGiK3pH1pk0rU3VKbx3kJnmlG17IFs4nKnn3ygZZ8TrkC3T1GIH1Npkhkh
	a9nvUzJ1xdYrvrEWShBs6nIpq+JWno1pZQQVonsRfTgPVvTLN7kwR+pVHKLndTEAv5R9PmwQ/DS
	sMeEBNeNA/YiWLuCstQjLZ5NoiyLVsmjEB0cIj4b8wvu29Ntcc/L1RZQdQ9oswxQ59ZV26roi8y
	JuHtOjd1wJEgSIW5EbVuO5NBYGeIX0zwWJ55PRPcLDWscubczJsu9MQpL7fqxWPy5Enf1GjRneP
	h31I8OJQEmyro1SVvdDGB/cDBjg0PA5Bo+6m5R6KpViQ9PaUMB0TLhrX7GpZy9fy7QCQiL48WMg
	fND0N1Ux69KuwaPz6ErFrhvpdDYBvA98mMKIdfxZKXI9eLjslwku4MQGuA5j2WQH09QFPG1kqzU
	FZiCQW+kTK5VzMet2BfpdT51k7ET/dGN0nGvGydSYu1GbOcFulEYDzF7QaY86yrIYHxDEKZhY=
X-Received: by 2002:a05:600c:3b12:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-485198b3304mr47230035e9.35.1772644709130;
        Wed, 04 Mar 2026 09:18:29 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4.1 09/14] x86/pv: Adjust GS handling for FRED mode
Date: Wed,  4 Mar 2026 17:18:26 +0000
Message-Id: <20260304171826.45847-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-10-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-10-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D577D2050EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Action: no action

When FRED is active, hardware automatically swaps GS when changing privilege,
and the SWAPGS instruction is disallowed.

For native OSes using GS as the thread local pointer this is a massive
improvement on the pre-FRED architecture, but under Xen it makes handling PV
guests more complicated.  Specifically, it means that GS_BASE and GS_SHADOW
are the opposite way around in FRED mode, as opposed to IDT mode.

This leads to the following changes:

  * In load_segments(), we already load both GSes.  Account for FRED in the
    SWAP() condition and avoid the path with SWAGS.

  * In save_segments(), we need to read GS_SHADOW rather than GS_BASE.

  * In toggle_guest_mode(), we need to emulate SWAPGS.

  * In {read,write}_msr() which access the live registers, GS_SHADOW and
    GS_BASE need swapping.

  * In do_set_segment_base(), merge the SEGBASE_GS_{USER,KERNEL} cases and
    take FRED into account when choosing which base to update.

    SEGBASE_GS_USER_SEL was already an LKGS invocation (decades before FRED)
    so under FRED needs to be just a MOV %gs.  Simply skip the SWAPGSes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v4.1:
 * Extra comments

v4:
 * Adjust GS accesses for emulated {RD,WR}MSR too.
---
 xen/arch/x86/domain.c             | 16 +++++++++++-----
 xen/arch/x86/pv/domain.c          | 22 ++++++++++++++++++++--
 xen/arch/x86/pv/emul-priv-op.c    | 26 +++++++++++++++++---------
 xen/arch/x86/pv/misc-hypercalls.c | 23 +++++++++++++++--------
 4 files changed, 63 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index e658c2d647b7..9c1f6ef76d52 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1791,9 +1791,10 @@ static void load_segments(struct vcpu *n)
 
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
@@ -1814,7 +1815,9 @@ static void load_segments(struct vcpu *n)
 
     if ( !fs_gs_done && !compat )
     {
-        if ( read_cr4() & X86_CR4_FSGSBASE )
+        unsigned long cr4 = read_cr4();
+
+        if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
         {
             __wrgsbase(gss);
             __wrfsbase(n->arch.pv.fs_base);
@@ -1931,6 +1934,9 @@ static void load_segments(struct vcpu *n)
  * Guests however cannot use SWAPGS, so there is no mechanism to modify the
  * inactive GS base behind Xen's back.  Therefore, Xen's copy of the inactive
  * GS base is still accurate, and doesn't need reading back from hardware.
+ *
+ * Under FRED, hardware automatically swaps GS for us, so SHADOW_GS is the
+ * active GS from the guest's point of view.
  */
 static void save_segments(struct vcpu *v)
 {
@@ -1946,12 +1952,12 @@ static void save_segments(struct vcpu *v)
         if ( read_cr4() & X86_CR4_FSGSBASE )
         {
             fs_base = __rdfsbase();
-            gs_base = __rdgsbase();
+            gs_base = opt_fred ? rdmsr(MSR_SHADOW_GS_BASE) : __rdgsbase();
         }
         else
         {
             fs_base = rdmsr(MSR_FS_BASE);
-            gs_base = rdmsr(MSR_GS_BASE);
+            gs_base = opt_fred ? rdmsr(MSR_SHADOW_GS_BASE) : rdmsr(MSR_GS_BASE);
         }
 
         v->arch.pv.fs_base = fs_base;
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index d16583a7454d..b85abb5ed903 100644
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
@@ -514,11 +515,28 @@ void toggle_guest_mode(struct vcpu *v)
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
 
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 64d47ab677a4..53676b30219c 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -25,6 +25,7 @@
 #include <asm/pv/traps.h>
 #include <asm/shared.h>
 #include <asm/stubs.h>
+#include <asm/traps.h>
 
 #include <xsm/xsm.h>
 
@@ -926,7 +927,8 @@ static int cf_check read_msr(
     case MSR_GS_BASE:
         if ( !cp->extd.lm )
             break;
-        *val = read_gs_base();
+        /* Under FRED, GS is automatically swapped on privilege change. */
+        *val = opt_fred ? rdmsr(MSR_SHADOW_GS_BASE) : read_gs_base();
         return X86EMUL_OKAY;
 
     case MSR_SHADOW_GS_BASE:
@@ -1066,17 +1068,23 @@ static int cf_check write_msr(
         if ( !cp->extd.lm || !is_canonical_address(val) )
             break;
 
-        if ( reg == MSR_FS_BASE )
-            write_fs_base(val);
-        else if ( reg == MSR_GS_BASE )
-            write_gs_base(val);
-        else if ( reg == MSR_SHADOW_GS_BASE )
+        switch ( reg )
         {
-            write_gs_shadow(val);
+        case MSR_FS_BASE:
+            write_fs_base(val);
+            break;
+
+        case MSR_SHADOW_GS_BASE:
             curr->arch.pv.gs_base_user = val;
+            fallthrough;
+        case MSR_GS_BASE:
+            /* Under FRED, GS is automatically swapped on privilege change. */
+            if ( (reg == MSR_GS_BASE) ^ opt_fred )
+                write_gs_base(val);
+            else
+                write_gs_shadow(val);
+            break;
         }
-        else
-            ASSERT_UNREACHABLE();
         return X86EMUL_OKAY;
 
     case MSR_EFER:
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index 4c2abeb4add8..7e915d86b724 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -11,6 +11,7 @@
 
 #include <asm/debugreg.h>
 #include <asm/fsgsbase.h>
+#include <asm/traps.h>
 
 long do_set_debugreg(int reg, unsigned long value)
 {
@@ -192,11 +193,13 @@ long do_set_segment_base(unsigned int which, unsigned long base)
 
         case SEGBASE_GS_USER:
             v->arch.pv.gs_base_user = base;
-            write_gs_shadow(base);
-            break;
-
+            fallthrough;
         case SEGBASE_GS_KERNEL:
-            write_gs_base(base);
+            /* Under FRED, GS is automatically swapped on privilege change. */
+            if ( (which == SEGBASE_GS_KERNEL) ^ opt_fred )
+                write_gs_base(base);
+            else
+                write_gs_shadow(base);
             break;
         }
         break;
@@ -206,10 +209,13 @@ long do_set_segment_base(unsigned int which, unsigned long base)
         unsigned int sel = (uint16_t)base;
 
         /*
-         * We wish to update the user %gs from the GDT/LDT.  Currently, the
-         * guest kernel's GS_BASE is in context.
+         * We wish to update the user %gs from the GDT/LDT.  Currently, we are
+         * in guest kernel context.
+         *
+         * Under IDT, this means updating GS_SHADOW.  Under FRED, plain GS.
          */
-        asm volatile ( "swapgs" );
+        if ( !opt_fred )
+            asm volatile ( "swapgs" );
 
         if ( sel > 3 )
             /* Fix up RPL for non-NUL selectors. */
@@ -247,7 +253,8 @@ long do_set_segment_base(unsigned int which, unsigned long base)
         /* Update the cache of the inactive base, as read from the GDT/LDT. */
         v->arch.pv.gs_base_user = read_gs_base();
 
-        asm volatile ( safe_swapgs );
+        if ( !opt_fred )
+            asm volatile ( safe_swapgs );
         break;
     }
 
-- 
2.39.5


