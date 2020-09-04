Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B7525DA7B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 15:52:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEC8v-0007AF-AU; Fri, 04 Sep 2020 13:52:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtGI=CN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kEC8u-00079z-3a
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 13:52:40 +0000
X-Inumbo-ID: 87942b95-8d2d-4307-801b-3d6cf418c70b
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87942b95-8d2d-4307-801b-3d6cf418c70b;
 Fri, 04 Sep 2020 13:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599227559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L6C32o0narMAoQ5k3rPPl8ZPwtt0naiC0W7kbHEcHl8=;
 b=BX6uEHU3y8kurWeBx9jhbmZviOS3mY2Hb5SsvMvvqsz/bDvuuUk6rgbG
 nlrzjHiPHpfNZQ5IwrPRT6C41PWFfduOIsQjAcFaPdPu3ybeRgbMrgq0r
 d9PHC1fdNTtujRO6zCRLtTKv/Uelq0ioBBnBNtRSDRfxv9YPaDA083V3+ g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pRiTg/JZz29EKapSehcB3yj+yRBr4egftoLc7eRmQxTIARLF2Cbv8wWH1qGt0FfJtvFFQTgmDX
 7ESLI+eZk5YMuk/d7qMeOSzy1YO/d8OupqrzQ195YClJ9Wc/6uCXHk9bX0v3+liftDB+conFAc
 TH+H6Rr2C6sbdmVJ59w98p/dhpv9NuFKWMxPPRJ/ZAr+WGrlXMrSw0gCSftTJgmzwfZRTX7zum
 Rv3kXWxF0/zySFH9bkRxzgP+2Rtz8WIOuxI1IaqxUn03ZuJbaLRQZ+r6YmsVWxCy2T0Yjc4TZf
 jU8=
X-SBRS: 2.7
X-MesageID: 26347704
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26347704"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andy Lutomirski
 <luto@kernel.org>, Sarah Newman <srn@prgmr.com>
Subject: [PATCH v2 1/2] x86/pv: Fix consistency of 64bit segment bases
Date: Fri, 4 Sep 2020 14:52:08 +0100
Message-ID: <20200904135209.29226-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200904135209.29226-1-andrew.cooper3@citrix.com>
References: <20200904135209.29226-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The comments in save_segments(), _toggle_guest_pt() and write_cr() are false.
The %fs and %gs bases can be updated at any time by the guest.

As a consequence, Xen's fs_base/etc tracking state is always stale when the
vcpu is in context, and must not be used to complete MSR_{FS,GS}_BASE reads, etc.

In particular, a sequence such as:

  wrmsr(MSR_FS_BASE, 0x1ull << 32);
  write_fs(__USER_DS);
  base = rdmsr(MSR_FS_BASE);

will return the stale base, not the new base.  This may cause guest a guest
kernel's context switching of userspace to malfunction.

Therefore:
 * Update save_segments(), _toggle_guest_pt() and read_msr() to always read
   the segment bases from hardware.
 * Update write_cr(), write_msr() and do_set_segment_base() to not not waste
   time caching data which is instantly going to become stale again.
 * Provide comments to explaining when the tracking state is and isn't stale.

This bug has been present for 14 years, but several bugfixes since have built
on and extended the original flawed logic.

Fixes: ba9adb737ba ("Apply stricter checking to RDMSR/WRMSR emulations.")
Fixes: c42494acb2f ("x86: fix FS/GS base handling when using the fsgsbase feature")
Fixed: eccc170053e ("x86/pv: Don't have %cr4.fsgsbase active behind a guest kernels back")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andy Lutomirski <luto@kernel.org>
CC: Sarah Newman <srn@prgmr.com>

v2:
 * New, although the first two hunks pulled forwards from what is now patch 2.

The fact that this has gone unnoticed for so long shows how little 64bit
userspace software reloads %fs/%gs directly.  Then again, its not very
surprising, as doing so would break Thread Local Storage.
---
 xen/arch/x86/domain.c          | 21 ++++++++++++++++-----
 xen/arch/x86/pv/domain.c       | 18 ++++++++++--------
 xen/arch/x86/pv/emul-priv-op.c | 19 ++-----------------
 xen/arch/x86/x86_64/mm.c       |  6 ------
 xen/include/asm-x86/domain.h   | 19 ++++++++++++++++++-
 5 files changed, 46 insertions(+), 37 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 66975d5f2c..f479bc6857 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1728,6 +1728,16 @@ static void load_segments(struct vcpu *n)
     }
 }
 
+/*
+ * Record all guest segment state.  The guest can load segment selectors
+ * without trapping, which will also alter the 64bit FS/GS bases.  Arbitrary
+ * changes to bases can also be made with the WR{FS,GS}BASE instructions, when
+ * enabled.
+ *
+ * Guests however cannot use SWAPGS, so there is no mechanism to modify the
+ * inactive GS base behind Xen's back.  Therefore, Xen's copy of the inactive
+ * GS base is still accurate, and doesn't need reading back from hardware.
+ */
 static void save_segments(struct vcpu *v)
 {
     struct cpu_user_regs *regs = &v->arch.user_regs;
@@ -1738,14 +1748,15 @@ static void save_segments(struct vcpu *v)
     regs->fs = read_sreg(fs);
     regs->gs = read_sreg(gs);
 
-    /* %fs/%gs bases can only be stale if WR{FS,GS}BASE are usable. */
-    if ( (read_cr4() & X86_CR4_FSGSBASE) && !is_pv_32bit_vcpu(v) )
+    if ( !is_pv_32bit_vcpu(v) )
     {
-        v->arch.pv.fs_base = __rdfsbase();
+        unsigned long gs_base = rdgsbase();
+
+        v->arch.pv.fs_base = rdfsbase();
         if ( v->arch.flags & TF_kernel_mode )
-            v->arch.pv.gs_base_kernel = __rdgsbase();
+            v->arch.pv.gs_base_kernel = gs_base;
         else
-            v->arch.pv.gs_base_user = __rdgsbase();
+            v->arch.pv.gs_base_user = gs_base;
     }
 
     if ( regs->ds )
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index ec5a7d2dca..44e4ea2582 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -444,17 +444,19 @@ static void _toggle_guest_pt(struct vcpu *v)
 void toggle_guest_mode(struct vcpu *v)
 {
     const struct domain *d = v->domain;
+    unsigned long gs_base;
 
     ASSERT(!is_pv_32bit_vcpu(v));
 
-    /* %fs/%gs bases can only be stale if WR{FS,GS}BASE are usable. */
-    if ( read_cr4() & X86_CR4_FSGSBASE )
-    {
-        if ( v->arch.flags & TF_kernel_mode )
-            v->arch.pv.gs_base_kernel = __rdgsbase();
-        else
-            v->arch.pv.gs_base_user = __rdgsbase();
-    }
+    /*
+     * Update the cached value of the GS base about to become inactive, as a
+     * subsequent context switch won't bother re-reading it.
+     */
+    gs_base = rdgsbase();
+    if ( v->arch.flags & TF_kernel_mode )
+        v->arch.pv.gs_base_kernel = gs_base;
+    else
+        v->arch.pv.gs_base_user = gs_base;
     asm volatile ( "swapgs" );
 
     _toggle_guest_pt(v);
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index bcc1188f6a..a192160f84 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -801,17 +801,6 @@ static int write_cr(unsigned int reg, unsigned long val,
     }
 
     case 4: /* Write CR4 */
-        /*
-         * If this write will disable FSGSBASE, refresh Xen's idea of the
-         * guest bases now that they can no longer change.
-         */
-        if ( (curr->arch.pv.ctrlreg[4] & X86_CR4_FSGSBASE) &&
-             !(val & X86_CR4_FSGSBASE) )
-        {
-            curr->arch.pv.fs_base = __rdfsbase();
-            curr->arch.pv.gs_base_kernel = __rdgsbase();
-        }
-
         curr->arch.pv.ctrlreg[4] = pv_fixup_guest_cr4(curr, val);
         write_cr4(pv_make_cr4(curr));
         ctxt_switch_levelling(curr);
@@ -882,15 +871,13 @@ static int read_msr(unsigned int reg, uint64_t *val,
     case MSR_FS_BASE:
         if ( is_pv_32bit_domain(currd) )
             break;
-        *val = (read_cr4() & X86_CR4_FSGSBASE) ? __rdfsbase()
-                                               : curr->arch.pv.fs_base;
+        *val = rdfsbase();
         return X86EMUL_OKAY;
 
     case MSR_GS_BASE:
         if ( is_pv_32bit_domain(currd) )
             break;
-        *val = (read_cr4() & X86_CR4_FSGSBASE) ? __rdgsbase()
-                                               : curr->arch.pv.gs_base_kernel;
+        *val = rdgsbase();
         return X86EMUL_OKAY;
 
     case MSR_SHADOW_GS_BASE:
@@ -1007,14 +994,12 @@ static int write_msr(unsigned int reg, uint64_t val,
         if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
             break;
         wrfsbase(val);
-        curr->arch.pv.fs_base = val;
         return X86EMUL_OKAY;
 
     case MSR_GS_BASE:
         if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
             break;
         wrgsbase(val);
-        curr->arch.pv.gs_base_kernel = val;
         return X86EMUL_OKAY;
 
     case MSR_SHADOW_GS_BASE:
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 28bc98f8f2..b69cf2dc4f 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1030,10 +1030,7 @@ long do_set_segment_base(unsigned int which, unsigned long base)
     {
     case SEGBASE_FS:
         if ( is_canonical_address(base) )
-        {
             wrfsbase(base);
-            v->arch.pv.fs_base = base;
-        }
         else
             ret = -EINVAL;
         break;
@@ -1050,10 +1047,7 @@ long do_set_segment_base(unsigned int which, unsigned long base)
 
     case SEGBASE_GS_KERNEL:
         if ( is_canonical_address(base) )
-        {
             wrgsbase(base);
-            v->arch.pv.gs_base_kernel = base;
-        }
         else
             ret = -EINVAL;
         break;
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 5fb347a94c..df657dc69f 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -527,7 +527,24 @@ struct pv_vcpu
     bool_t syscall32_disables_events;
     bool_t sysenter_disables_events;
 
-    /* Segment base addresses. */
+    /*
+     * 64bit segment bases.
+     *
+     * FS and the active GS are always stale when the vCPU is in context, as
+     * the guest can change them behind Xen's back with MOV SREG, or
+     * WR{FS,GS}BASE on capable hardware.
+     *
+     * The inactive GS base is never stale, as guests can't use SWAPGS to
+     * access it - all modification is performed by Xen either directly
+     * (hypercall, #GP emulation), or indirectly (toggle_guest_mode()).
+     *
+     * The vCPU context switch path is optimised based on this fact, so any
+     * path updating or swapping the inactive base must update the cached
+     * value as well.
+     *
+     * Which GS base is active and inactive depends on whether the vCPU is in
+     * user or kernel context.
+     */
     unsigned long fs_base;
     unsigned long gs_base_kernel;
     unsigned long gs_base_user;
-- 
2.11.0


