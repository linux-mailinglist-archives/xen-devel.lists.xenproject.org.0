Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E661261332
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:10:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFfFF-0000Lr-TG; Tue, 08 Sep 2020 15:09:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Jy8=CR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFfFE-0000Lm-AM
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:09:16 +0000
X-Inumbo-ID: 0d51b1a7-49cd-4225-8026-ed8be773fce4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d51b1a7-49cd-4225-8026-ed8be773fce4;
 Tue, 08 Sep 2020 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599577756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eDs6XK+RloydobsyPaT/gSOjeELdNR9f2ZPJP0pwxRA=;
 b=NGZMYNQrZxzfFPIKNIzeJYuRNGs7CEBbYdKVsJTa5Tm9bOtZHcAH8Dk8
 zejHlkJBEacVwFibfeYRGcbVIJbUa8vcmTxj7zWzEeKpFHhWpI5fOHFUd
 igdlmc0mi0izZLVWVcljBWLuh8Zzti3d9bIrSZmtoCarCqQY+PXcJJlV2 Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: iS5JRndMuWmOL89L5cCktZY2YmxQhNwM4AEr2o/aPoRlMo2ZjC95IIuyNKSTTsC1046CDxshPK
 ZkDxSC0G3WBV4IrA2/0ppHC71vls7boFMl1I5+ydZwFb1QvAefpIQ7FrGLclLB0Flt9ZOdmxBg
 baDH8xeMRFQWrmV8J4hUoZWVvc6zNV71y+vCFQmfGdqkyEYS5eJlVEs831WSUm+wDzSZZQE5vo
 h6qSVFuNeK9Ou5c8T19a4SoHbF/4MY/3lsFWzkORCzpVcsgxZFS8hGsNjf+ylXJi9Sbd0/wmPI
 fDo=
X-SBRS: 2.7
X-MesageID: 26538068
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,406,1592884800"; d="scan'208";a="26538068"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/pv: Fix assertions in svm_load_segs()
Date: Tue, 8 Sep 2020 16:08:49 +0100
Message-ID: <20200908150849.5699-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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

OSSTest has shown an assertion failure:
http://logs.test-lab.xenproject.org/osstest/logs/153906/test-xtf-amd64-amd64-1/serial-rimava1.log

This is because we pass a non-NUL selector into svm_load_segs(), which is
something we must not do, as this path does not load the attributes/limit from
the GDT/LDT.

Drop the {gs,gs}_sel parameters from svm_load_segs() and use 0 instead.  This
is fine even for non-zero NUL segments, as it is how the IRET instruction
behaves in all CPUs.

Only use the svm_load_segs() path when FS and GS are NUL, which is the common
case when scheduling a 64bit vcpu with 64bit userspace in context.

Fixes: ad0fd291c5 ("x86/pv: Rewrite segment context switching from scratch")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Rewrite from scratch.
---
 xen/arch/x86/domain.c             | 7 +++----
 xen/arch/x86/hvm/svm/svm.c        | 9 +++------
 xen/include/asm-x86/hvm/svm/svm.h | 6 ++++--
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d4f4ced681..e8e91cf080 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1557,7 +1557,7 @@ static void load_segments(struct vcpu *n)
                    : [_val] "rm" (val) )
 
 #ifdef CONFIG_HVM
-    if ( cpu_has_svm && !compat )
+    if ( cpu_has_svm && !compat && (uregs->fs | uregs->gs) <= 3 )
     {
         unsigned long gsb = n->arch.flags & TF_kernel_mode
             ? n->arch.pv.gs_base_kernel : n->arch.pv.gs_base_user;
@@ -1565,8 +1565,7 @@ static void load_segments(struct vcpu *n)
             ? n->arch.pv.gs_base_user : n->arch.pv.gs_base_kernel;
 
         fs_gs_done = svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_START(n),
-                                   uregs->fs, n->arch.pv.fs_base,
-                                   uregs->gs, gsb, gss);
+                                   n->arch.pv.fs_base, gsb, gss);
     }
 #endif
     if ( !fs_gs_done )
@@ -1929,7 +1928,7 @@ static void __context_switch(void)
     /* Prefetch the VMCB if we expect to use it later in the context switch */
     if ( cpu_has_svm && is_pv_domain(nd) && !is_pv_32bit_domain(nd) &&
          !is_idle_domain(nd) )
-        svm_load_segs(0, 0, 0, 0, 0, 0, 0);
+        svm_load_segs(0, 0, 0, 0, 0);
 #endif
 
     if ( need_full_gdt(nd) && !per_cpu(full_gdt_loaded, cpu) )
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index af584ff5d1..23b2a2aa17 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1521,8 +1521,7 @@ static void svm_init_erratum_383(const struct cpuinfo_x86 *c)
 
 #ifdef CONFIG_PV
 bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
-                   unsigned int fs_sel, unsigned long fs_base,
-                   unsigned int gs_sel, unsigned long gs_base,
+                   unsigned long fs_base, unsigned long gs_base,
                    unsigned long gs_shadow)
 {
     unsigned int cpu = smp_processor_id();
@@ -1559,14 +1558,12 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
         vmcb->ldtr.base = ldt_base;
     }
 
-    ASSERT(!(fs_sel & ~3));
-    vmcb->fs.sel = fs_sel;
+    vmcb->fs.sel = 0;
     vmcb->fs.attr = 0;
     vmcb->fs.limit = 0;
     vmcb->fs.base = fs_base;
 
-    ASSERT(!(gs_sel & ~3));
-    vmcb->gs.sel = gs_sel;
+    vmcb->gs.sel = 0;
     vmcb->gs.attr = 0;
     vmcb->gs.limit = 0;
     vmcb->gs.base = gs_base;
diff --git a/xen/include/asm-x86/hvm/svm/svm.h b/xen/include/asm-x86/hvm/svm/svm.h
index d568e86db9..2310878e41 100644
--- a/xen/include/asm-x86/hvm/svm/svm.h
+++ b/xen/include/asm-x86/hvm/svm/svm.h
@@ -52,10 +52,12 @@ void svm_update_guest_cr(struct vcpu *, unsigned int cr, unsigned int flags);
 /*
  * PV context switch helper. Calls with zero ldt_base request a prefetch of
  * the VMCB area to be loaded from, instead of an actual load of state.
+ *
+ * Must only be used for NUL FS/GS, as the segment attributes/limits are not
+ * read from the GDT/LDT.
  */
 bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
-                   unsigned int fs_sel, unsigned long fs_base,
-                   unsigned int gs_sel, unsigned long gs_base,
+                   unsigned long fs_base, unsigned long gs_base,
                    unsigned long gs_shadow);
 
 extern u32 svm_feature_flags;
-- 
2.11.0


