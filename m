Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC093228739
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 19:23:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxvyQ-0003MU-R7; Tue, 21 Jul 2020 17:22:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ5W=BA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jxvyP-0003MP-HE
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 17:22:37 +0000
X-Inumbo-ID: c48d8004-cb76-11ea-a110-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c48d8004-cb76-11ea-a110-12813bfff9fa;
 Tue, 21 Jul 2020 17:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595352155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U9TFSiMPyXpVYVZMejGmia8JMd9i23k5xSQc2PVJ5+Q=;
 b=QeLcFQZen2EDU7lLxnAUVZa7d4JkphtLpPoA+prKL0Ng6V1nAEOk0ecm
 FaAhNA34xl0HIuGBAXxSswHqnYySXojnXH5mc1htWx789zHown9TVKJrp
 LHY8lOFN/Dx+xHkrtCvVsrjtJ/spIFbUhssBo1Pp14F/m0et/eP/nMHGh Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4JDADQ/sytG4ozsWr7yIeK7GkrOMB6CevNqwqE5rav/DcjQYI9gvEU6aoeAvqmntPFkur9u+bH
 ma409rlwRPmVD7noc2pT5LTeslcZOWqOhBjrg55k0/YYu1m+3VvWlIE2waX1PFrJ9I8pclf+zq
 z9nRcXDFZP6Yq9zxciOo26Tupvv8+AlgaEZg9xMYVQTdo5YfDD0ds60rI1B+8U6V7AxIg5otQk
 Wb4FkN8VeWkx+bE6mlPRF9UD0+SDVafoRZu1tSsRjPZSgHu1GbhDEEqxe4pFkNPp6/OY7aGlQM
 5WQ=
X-SBRS: 2.7
X-MesageID: 23065430
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,379,1589256000"; d="scan'208";a="23065430"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/svm: Fold nsvm_{wr, rd}msr() into svm_msr_{read,
 write}_intercept()
Date: Tue, 21 Jul 2020 18:22:08 +0100
Message-ID: <20200721172208.12176-1-andrew.cooper3@citrix.com>
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

... to simplify the default cases.

There are multiple errors with the handling of these three MSRs, but they are
deliberately not addressed this point.

This removes the dance converting -1/0/1 into X86EMUL_*, allowing for the
removal of the 'ret' variable.

While cleaning this up, drop the gdprintk()'s for #GP conditions, and the
'result' variable from svm_msr_write_intercept() is it is never modified.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c        | 77 ---------------------------------
 xen/arch/x86/hvm/svm/svm.c              | 46 +++++++++++++-------
 xen/include/asm-x86/hvm/svm/nestedsvm.h |  4 --
 3 files changed, 31 insertions(+), 96 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 11dc9c089c..a193d9de45 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -47,22 +47,6 @@ nestedsvm_vcpu_stgi(struct vcpu *v)
     local_event_delivery_enable(); /* unmask events for PV drivers */
 }
 
-static int
-nestedsvm_vmcb_isvalid(struct vcpu *v, uint64_t vmcxaddr)
-{
-    /* Address must be 4k aligned */
-    if ( (vmcxaddr & ~PAGE_MASK) != 0 )
-        return 0;
-
-    /* Maximum valid physical address.
-     * See AMD BKDG for HSAVE_PA MSR.
-     */
-    if ( vmcxaddr > 0xfd00000000ULL )
-        return 0;
-
-    return 1;
-}
-
 int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
@@ -1263,67 +1247,6 @@ enum hvm_intblk nsvm_intr_blocked(struct vcpu *v)
     return hvm_intblk_none;
 }
 
-/* MSR handling */
-int nsvm_rdmsr(struct vcpu *v, unsigned int msr, uint64_t *msr_content)
-{
-    struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    int ret = 1;
-
-    *msr_content = 0;
-
-    switch (msr) {
-    case MSR_K8_VM_CR:
-        break;
-    case MSR_K8_VM_HSAVE_PA:
-        *msr_content = svm->ns_msr_hsavepa;
-        break;
-    case MSR_AMD64_TSC_RATIO:
-        *msr_content = svm->ns_tscratio;
-        break;
-    default:
-        ret = 0;
-        break;
-    }
-
-    return ret;
-}
-
-int nsvm_wrmsr(struct vcpu *v, unsigned int msr, uint64_t msr_content)
-{
-    int ret = 1;
-    struct nestedsvm *svm = &vcpu_nestedsvm(v);
-
-    switch (msr) {
-    case MSR_K8_VM_CR:
-        /* ignore write. handle all bits as read-only. */
-        break;
-    case MSR_K8_VM_HSAVE_PA:
-        if (!nestedsvm_vmcb_isvalid(v, msr_content)) {
-            gdprintk(XENLOG_ERR,
-                "MSR_K8_VM_HSAVE_PA value invalid %#"PRIx64"\n", msr_content);
-            ret = -1; /* inject #GP */
-            break;
-        }
-        svm->ns_msr_hsavepa = msr_content;
-        break;
-    case MSR_AMD64_TSC_RATIO:
-        if ((msr_content & ~TSC_RATIO_RSVD_BITS) != msr_content) {
-            gdprintk(XENLOG_ERR,
-                "reserved bits set in MSR_AMD64_TSC_RATIO %#"PRIx64"\n",
-                msr_content);
-            ret = -1; /* inject #GP */
-            break;
-        }
-        svm->ns_tscratio = msr_content;
-        break;
-    default:
-        ret = 0;
-        break;
-    }
-
-    return ret;
-}
-
 /* VMEXIT emulation */
 void
 nestedsvm_vmexit_defer(struct vcpu *v,
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 4eb41792e2..bbe73744b8 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1788,10 +1788,10 @@ static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
 
 static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
 {
-    int ret;
     struct vcpu *v = current;
     const struct domain *d = v->domain;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    const struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
 
     switch ( msr )
     {
@@ -1914,6 +1914,18 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             goto gpf;
         break;
 
+    case MSR_K8_VM_CR:
+        *msr_content = 0;
+        break;
+
+    case MSR_K8_VM_HSAVE_PA:
+        *msr_content = nsvm->ns_msr_hsavepa;
+        break;
+
+    case MSR_AMD64_TSC_RATIO:
+        *msr_content = nsvm->ns_tscratio;
+        break;
+
     case MSR_AMD_OSVW_ID_LENGTH:
     case MSR_AMD_OSVW_STATUS:
         if ( !d->arch.cpuid->extd.osvw )
@@ -1922,12 +1934,6 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         break;
 
     default:
-        ret = nsvm_rdmsr(v, msr, msr_content);
-        if ( ret < 0 )
-            goto gpf;
-        else if ( ret )
-            break;
-
         if ( rdmsr_safe(msr, *msr_content) == 0 )
             break;
 
@@ -1956,10 +1962,10 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
 
 static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
 {
-    int ret, result = X86EMUL_OKAY;
     struct vcpu *v = current;
     struct domain *d = v->domain;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
 
     switch ( msr )
     {
@@ -2085,6 +2091,22 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
             goto gpf;
         break;
 
+    case MSR_K8_VM_CR:
+        /* ignore write. handle all bits as read-only. */
+        break;
+
+    case MSR_K8_VM_HSAVE_PA:
+        if ( (msr_content & ~PAGE_MASK) || msr_content > 0xfd00000000ULL )
+            goto gpf;
+        nsvm->ns_msr_hsavepa = msr_content;
+        break;
+
+    case MSR_AMD64_TSC_RATIO:
+        if ( msr_content & TSC_RATIO_RSVD_BITS )
+            goto gpf;
+        nsvm->ns_tscratio = msr_content;
+        break;
+
     case MSR_IA32_MCx_MISC(4): /* Threshold register */
     case MSR_F10_MC4_MISC1 ... MSR_F10_MC4_MISC3:
         /*
@@ -2102,12 +2124,6 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         break;
 
     default:
-        ret = nsvm_wrmsr(v, msr, msr_content);
-        if ( ret < 0 )
-            goto gpf;
-        else if ( ret )
-            break;
-
         /* Match up with the RDMSR side; ultimately this should go away. */
         if ( rdmsr_safe(msr, msr_content) == 0 )
             break;
@@ -2115,7 +2131,7 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         goto gpf;
     }
 
-    return result;
+    return X86EMUL_OKAY;
 
  gpf:
     return X86EMUL_EXCEPTION;
diff --git a/xen/include/asm-x86/hvm/svm/nestedsvm.h b/xen/include/asm-x86/hvm/svm/nestedsvm.h
index 31fb4bfeb4..0873698457 100644
--- a/xen/include/asm-x86/hvm/svm/nestedsvm.h
+++ b/xen/include/asm-x86/hvm/svm/nestedsvm.h
@@ -118,10 +118,6 @@ bool_t nsvm_vmcb_guest_intercepts_event(
 bool_t nsvm_vmcb_hap_enabled(struct vcpu *v);
 enum hvm_intblk nsvm_intr_blocked(struct vcpu *v);
 
-/* MSRs */
-int nsvm_rdmsr(struct vcpu *v, unsigned int msr, uint64_t *msr_content);
-int nsvm_wrmsr(struct vcpu *v, unsigned int msr, uint64_t msr_content);
-
 /* Interrupts, vGIF */
 void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v);
 void svm_vmexit_do_stgi(struct cpu_user_regs *regs, struct vcpu *v);
-- 
2.11.0


