Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EF9262CBE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 12:00:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFwtV-00005E-2i; Wed, 09 Sep 2020 10:00:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wApk=CS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFwtT-0008SC-RP
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 09:59:59 +0000
X-Inumbo-ID: d67111ab-c8d0-43d3-a25c-f77c3a1c1bec
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d67111ab-c8d0-43d3-a25c-f77c3a1c1bec;
 Wed, 09 Sep 2020 09:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599645591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OwyxB5tgMIlpdQSglN/DeSMcT7TCEejwNAp6gxAeraY=;
 b=GOICWHMCUv4itdUtuvbkJMsaE4mN+kCxiPt7qF7oNekKq4LrA6HlrMVd
 WUsN/eZoJunrYelaEy/qwMxC8KkbLc6iNkUo4oF487IHbuIyBefOVPtfF
 LXmzXYF28PYMgnQvJDcZpF/p2x6OK6OMEOl/ENNjBNGivX+9LlDZpRT+d Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Qins8ku/JDWcnxkbNzlMzFuDloJSCgl6Fw857a+WsrFgqoa38vu6EfajGklltSdgCmPGBvPmjX
 k7z/fkoAEslRw3i+l6icAo0+UmC4OAkbtXujNH3c43N4oSvxr4Qm/Du2dQMDdvoK1Y7IfhYSOn
 JF3fyQqFf7wwbcDEpW4dLzvRlaCq732xmzCepEp0AANPvYZxAZaxeH5zg9+fHakJRapFf5LYVt
 21IxjK5aEH3pEhfVEW/7KYZdl97htEXRgGVpvEmU5Ql1NVSUJ7J7bOl2PR0MfgaeEw361R3qS+
 ToM=
X-SBRS: 2.7
X-MesageID: 27243911
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,409,1592884800"; d="scan'208";a="27243911"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/5] x86/pv: Optimise to the segment context switching paths
Date: Wed, 9 Sep 2020 10:59:19 +0100
Message-ID: <20200909095920.25495-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200909095920.25495-1-andrew.cooper3@citrix.com>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
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

Save the segment selectors with explicit asm, rather than with read_sreg().
This permits the use of MOV's m16 encoding, which avoids indirecting the
selector value through a register.

For {save,load}_segments(), opencode the fs/gs helpers, as the optimiser is
unable to rearrange the logic down to a single X86_CR4_FSGSBASE check.  This
removes several jumps and creates bigger basic blocks.

In load_segments(), optimise GS base handling substantially.  The call to
svm_load_segs() already needs gsb/gss the correct way around, so hoist the
logic for the later path to use it as well.  Swapping the inputs in GPRs is
far more efficient than using SWAPGS.

Previously, there was optionally one SWAPGS from the user/kernel mode check,
two SWAPGS's in write_gs_shadow() and two WRGSBASE's.  Updates to GS (4 or 5
here) in quick succession stall all contemporary pipelines repeatedly.  (Intel
Core/Xeon pipelines have segment register renaming[1], so can continue to
speculatively execute with one GS update in flight.  Other pipelines cannot
have two updates in flight concurrently, and must stall dispatch of the second
until the first has retired.)

Rewrite the logic to have exactly two WRGSBASEs and one SWAPGS, which removes
two stalles all contemporary processors.

Although modest, the resulting delta is:

  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-106 (-106)
  Function                                     old     new   delta
  paravirt_ctxt_switch_from                    235     198     -37
  context_switch                              3582    3513     -69

in a common path.

[1] https://software.intel.com/security-software-guidance/insights/deep-dive-intel-analysis-speculative-behavior-swapgs-and-segment-registers

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/domain.c | 70 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 0b0e3f8294..ab71b9f79c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1537,6 +1537,7 @@ arch_do_vcpu_op(
 static void load_segments(struct vcpu *n)
 {
     struct cpu_user_regs *uregs = &n->arch.user_regs;
+    unsigned long gsb = 0, gss = 0;
     bool compat = is_pv_32bit_vcpu(n);
     bool all_segs_okay = true, fs_gs_done = false;
 
@@ -1556,18 +1557,24 @@ static void load_segments(struct vcpu *n)
                    : [ok] "+r" (all_segs_okay)          \
                    : [_val] "rm" (val) )
 
-#ifdef CONFIG_HVM
-    if ( cpu_has_svm && !compat && (uregs->fs | uregs->gs) <= 3 )
+    if ( !compat )
     {
-        unsigned long gsb = n->arch.flags & TF_kernel_mode
-            ? n->arch.pv.gs_base_kernel : n->arch.pv.gs_base_user;
-        unsigned long gss = n->arch.flags & TF_kernel_mode
-            ? n->arch.pv.gs_base_user : n->arch.pv.gs_base_kernel;
+        gsb = n->arch.pv.gs_base_kernel;
+        gss = n->arch.pv.gs_base_user;
+
+        /*
+         * Figure out which way around gsb/gss want to be.  gsb needs to be
+         * the active context, and gss needs to be the inactive context.
+         */
+        if ( !(n->arch.flags & TF_kernel_mode) )
+            SWAP(gsb, gss);
 
-        fs_gs_done = svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_START(n),
-                                   n->arch.pv.fs_base, gsb, gss);
+        if ( IS_ENABLED(CONFIG_HVM) && cpu_has_svm &&
+             (uregs->fs | uregs->gs) <= 3 )
+            fs_gs_done = svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_START(n),
+                                       n->arch.pv.fs_base, gsb, gss);
     }
-#endif
+
     if ( !fs_gs_done )
     {
         load_LDT(n);
@@ -1581,13 +1588,19 @@ static void load_segments(struct vcpu *n)
 
     if ( !fs_gs_done && !compat )
     {
-        write_fs_base(n->arch.pv.fs_base);
-        write_gs_shadow(n->arch.pv.gs_base_kernel);
-        write_gs_base(n->arch.pv.gs_base_user);
-
-        /* If in kernel mode then switch the GS bases around. */
-        if ( (n->arch.flags & TF_kernel_mode) )
+        if ( read_cr4() & X86_CR4_FSGSBASE )
+        {
+            __wrgsbase(gss);
+            __wrfsbase(n->arch.pv.fs_base);
             asm volatile ( "swapgs" );
+            __wrgsbase(gsb);
+        }
+        else
+        {
+            wrmsrl(MSR_FS_BASE, n->arch.pv.fs_base);
+            wrmsrl(MSR_GS_BASE, gsb);
+            wrmsrl(MSR_SHADOW_GS_BASE, gss);
+        }
     }
 
     if ( unlikely(!all_segs_okay) )
@@ -1703,16 +1716,31 @@ static void save_segments(struct vcpu *v)
 {
     struct cpu_user_regs *regs = &v->arch.user_regs;
 
-    regs->ds = read_sreg(ds);
-    regs->es = read_sreg(es);
-    regs->fs = read_sreg(fs);
-    regs->gs = read_sreg(gs);
+    asm volatile ( "mov %%ds, %[ds];\n\t"
+                   "mov %%es, %[es];\n\t"
+                   "mov %%fs, %[fs];\n\t"
+                   "mov %%gs, %[gs];\n\t"
+                   : [ds] "=m" (regs->ds),
+                     [es] "=m" (regs->es),
+                     [fs] "=m" (regs->fs),
+                     [gs] "=m" (regs->gs) );
 
     if ( !is_pv_32bit_vcpu(v) )
     {
-        unsigned long gs_base = read_gs_base();
+        unsigned long fs_base, gs_base;
+
+        if ( read_cr4() & X86_CR4_FSGSBASE )
+        {
+            fs_base = __rdfsbase();
+            gs_base = __rdgsbase();
+        }
+        else
+        {
+            rdmsrl(MSR_FS_BASE, fs_base);
+            rdmsrl(MSR_GS_BASE, gs_base);
+        }
 
-        v->arch.pv.fs_base = read_fs_base();
+        v->arch.pv.fs_base = fs_base;
         if ( v->arch.flags & TF_kernel_mode )
             v->arch.pv.gs_base_kernel = gs_base;
         else
-- 
2.11.0


