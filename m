Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4067B2296BC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 12:56:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyCPg-0005fa-CE; Wed, 22 Jul 2020 10:55:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvI5=BB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyCPe-0005fU-3R
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 10:55:50 +0000
X-Inumbo-ID: e67e2f90-cc09-11ea-862a-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e67e2f90-cc09-11ea-862a-bc764e2007e4;
 Wed, 22 Jul 2020 10:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595415348;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x2el/5EGZvCwoyblN7Bu8AExlZvxktoPFUqYFtbqQWM=;
 b=g9Yg3LN8P79EzLPaOfx1H1BWDuEj0pi6HnMVKh9IueAhEKKrlBAOM1v2
 qw+b8cRsfociAi6A8Ggxqhhg2VmpnZsUx+388rxVWNyVRlMLxxxtYuUgR
 ipdFBe13YI66lNQQtsPQ830TE5tELSg1ZxcF8KjB001LKdr4EqMEwAmaK A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4wrEHuZaELtgtMyor6/YShnhaRx1zPs+IMD2f1mUljS5Lph4bmbVAdzaKKbfaFBKaqQphSSVv9
 QB9wff8/6J4G1lh7QB7rDCKv/Dbpm7V2p2I3Or9xmVNiGd1XSrQlV3Nih1z62tSjxjsHx9v3fA
 ibCQ2zIdP4O5JXrgnaEYJFLpzVN+12R15gVAfCKXiD77XPsfBZtEo+yEQlU1eAYpp/fKAusarb
 LRhw6uV1wazzj0jM0h2NnJDaCzkxvFSkut2XiV27oqh1Ls1pefU1RSuQ+7Zz++YhhXqn+6WNAg
 gxw=
X-SBRS: 2.7
X-MesageID: 23120953
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="23120953"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/msr: Unify the real {rd, wr}msr() paths in guest_{rd,
 wr}msr()
Date: Wed, 22 Jul 2020 11:55:29 +0100
Message-ID: <20200722105529.12177-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Both the read and write side have commonalities which can be abstracted away.
This also allows for additional safety in release builds, and slightly more
helpful diagnostics in debug builds.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

I'm not a massive fan of the global scope want_rdmsr_safe boolean, but I can't
think of a reasonable way to fix it without starting to use other
flexibiltiies offered to us by C99.  (And to preempt the other question, an
extra set of braces makes extremely confusing to read logic.)
---
 xen/arch/x86/msr.c | 54 ++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 22f921cc71..68f3aadeab 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -154,6 +154,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     const struct cpuid_policy *cp = d->arch.cpuid;
     const struct msr_policy *mp = d->arch.msr;
     const struct vcpu_msrs *msrs = v->arch.msrs;
+    bool want_rdmsr_safe = false;
     int ret = X86EMUL_OKAY;
 
     switch ( msr )
@@ -204,10 +205,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          */
         if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
              !(boot_cpu_data.x86_vendor &
-               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
-             rdmsr_safe(MSR_AMD_PATCHLEVEL, *val) )
+               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) )
             goto gp_fault;
-        break;
+        goto read_from_hw_safe;
 
     case MSR_SPEC_CTRL:
         if ( !cp->feat.ibrsb )
@@ -278,7 +278,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          */
 #ifdef CONFIG_HVM
         if ( v == current && is_hvm_domain(d) && v->arch.hvm.flag_dr_dirty )
-            rdmsrl(msr, *val);
+            goto read_from_hw;
         else
 #endif
             *val = msrs->dr_mask[
@@ -303,6 +303,23 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 
     return ret;
 
+ read_from_hw_safe:
+    want_rdmsr_safe = true;
+ read_from_hw:
+    if ( !rdmsr_safe(msr, *val) )
+        return X86EMUL_OKAY;
+
+    /*
+     * Paths which didn't want rdmsr_safe() and get here took a #GP fault.
+     * Something is broken with the above logic, so make it obvious in debug
+     * builds, and fail safe by handing #GP back to guests in release builds.
+     */
+    if ( !want_rdmsr_safe )
+    {
+        gprintk(XENLOG_ERR, "Bad rdmsr %#x\n", msr);
+        ASSERT_UNREACHABLE();
+    }
+
  gp_fault:
     return X86EMUL_EXCEPTION;
 }
@@ -402,9 +419,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         if ( val & ~PRED_CMD_IBPB )
             goto gp_fault; /* Rsvd bit set? */
 
-        if ( v == curr )
-            wrmsrl(MSR_PRED_CMD, val);
-        break;
+        goto maybe_write_to_hw;
 
     case MSR_FLUSH_CMD:
         if ( !cp->feat.l1d_flush )
@@ -413,9 +428,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         if ( val & ~FLUSH_CMD_L1D )
             goto gp_fault; /* Rsvd bit set? */
 
-        if ( v == curr )
-            wrmsrl(MSR_FLUSH_CMD, val);
-        break;
+        goto maybe_write_to_hw;
 
     case MSR_INTEL_MISC_FEATURES_ENABLES:
     {
@@ -493,8 +506,8 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
                                ? 0 : (msr - MSR_AMD64_DR1_ADDRESS_MASK + 1),
                                ARRAY_SIZE(msrs->dr_mask))] = val;
 
-        if ( v == curr && (curr->arch.dr7 & DR7_ACTIVE_MASK) )
-            wrmsrl(msr, val);
+        if ( curr->arch.dr7 & DR7_ACTIVE_MASK )
+            goto maybe_write_to_hw;
         break;
 
     default:
@@ -509,6 +522,23 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
 
     return ret;
 
+ maybe_write_to_hw:
+    /*
+     * All paths potentially updating a value in hardware need to check
+     * whether the call is in current context or not, so the logic is
+     * implemented here.  Remote context need do nothing more.
+     */
+    if ( v != curr || !wrmsr_safe(msr, val) )
+        return X86EMUL_OKAY;
+
+    /*
+     * Paths which end up here took a #GP fault in wrmsr_safe().  Something is
+     * broken with the logic above, so make it obvious in debug builds, and
+     * fail safe by handing #GP back to the guests in release builds.
+     */
+    gprintk(XENLOG_ERR, "Bad wrmsr %#x val %016"PRIx64"\n", msr, val);
+    ASSERT_UNREACHABLE();
+
  gp_fault:
     return X86EMUL_EXCEPTION;
 }
-- 
2.11.0


