Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF81027EA2A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713.2407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcOr-0004aA-Gt; Wed, 30 Sep 2020 13:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713.2407; Wed, 30 Sep 2020 13:44:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcOr-0004ZR-Cu; Wed, 30 Sep 2020 13:44:05 +0000
Received: by outflank-mailman (input) for mailman id 713;
 Wed, 30 Sep 2020 13:44:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNcOp-0004YJ-DI
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:44:03 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfcfd5d9-4c79-41bb-b3ef-ece8d0941c31;
 Wed, 30 Sep 2020 13:44:02 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNcOp-0004YJ-DI
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:44:03 +0000
X-Inumbo-ID: dfcfd5d9-4c79-41bb-b3ef-ece8d0941c31
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dfcfd5d9-4c79-41bb-b3ef-ece8d0941c31;
	Wed, 30 Sep 2020 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601473443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tthMpROINA5RAkSPIiMBl10BH/IKTfi+k+TFtLZ7eE4=;
  b=cn6uluEWpO06EjSC0oj6JxIQlKBwhn3GAUG1fFymHjyCSSbjPxGLkz/b
   xnZiPIopWWXGR7JnzmCDD5mWo2gjN1C9tomVNX4M+Ca39oOK3MJkPR6G5
   QZMsMw126raWQ5y61lCNUfcqqyRA0k2EuGGXNri1SdZsVIH9s8Zsa0f3C
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ezf7PnSO3XtkQbnhDGOuxIvvef5jaBsUxNk488ciVVYvHxJgzLzOrb2VUhm5McXgGYqwpv5pi0
 4npkJvY+5xLbYutMTxJXugTYnznLbOWYpwmzYZS3mMrfCD7/1xIrn2R9ZHqq/WmD73KAF1XfjS
 JsVDKSCJiWtS7y6Fq5nVc06nCh/C4xb5HfqFvIs5VLLaXhGUXPi8zuVkgEh2hd/3SMwR5TBbWg
 HzXQUOfSBIJWRTA9VYaWQ8jNppRcDwJTX0jcIYpbIiA2if+wtTw4YcXbaC7H4xaCJeTEbkFBkk
 nsU=
X-SBRS: None
X-MesageID: 28300093
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28300093"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 7/8] x86/hvm: Drop restore boolean from hvm_cr4_guest_valid_bits()
Date: Wed, 30 Sep 2020 14:42:47 +0100
Message-ID: <20200930134248.4918-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200930134248.4918-1-andrew.cooper3@citrix.com>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Previously, migration was reordered so the CPUID data was available before
register state.  nestedhvm_enabled() has recently been made accurate for the
entire lifetime of the domain.

Therefore, we can drop the bodge in hvm_cr4_guest_valid_bits() which existed
previously to tolerate a guests' CR4 being set/restored before
HVM_PARAM_NESTEDHVM.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/domain.c       | 2 +-
 xen/arch/x86/hvm/hvm.c          | 8 ++++----
 xen/arch/x86/hvm/svm/svmdebug.c | 6 ++++--
 xen/arch/x86/hvm/vmx/vmx.c      | 2 +-
 xen/arch/x86/hvm/vmx/vvmx.c     | 2 +-
 xen/include/asm-x86/hvm/hvm.h   | 2 +-
 6 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 8e3375265c..0ce132b308 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -275,7 +275,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
     if ( v->arch.hvm.guest_efer & EFER_LME )
         v->arch.hvm.guest_efer |= EFER_LMA;
 
-    if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d, false) )
+    if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d) )
     {
         gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx\n",
                 v->arch.hvm.guest_cr[4]);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 101a739952..54e32e4fe8 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -972,14 +972,14 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
         X86_CR0_CD | X86_CR0_PG)))
 
 /* These bits in CR4 can be set by the guest. */
-unsigned long hvm_cr4_guest_valid_bits(const struct domain *d, bool restore)
+unsigned long hvm_cr4_guest_valid_bits(const struct domain *d)
 {
     const struct cpuid_policy *p = d->arch.cpuid;
     bool mce, vmxe;
 
     /* Logic broken out simply to aid readability below. */
     mce  = p->basic.mce || p->basic.mca;
-    vmxe = p->basic.vmx && (restore || nestedhvm_enabled(d));
+    vmxe = p->basic.vmx && nestedhvm_enabled(d);
 
     return ((p->basic.vme     ? X86_CR4_VME | X86_CR4_PVI : 0) |
             (p->basic.tsc     ? X86_CR4_TSD               : 0) |
@@ -1033,7 +1033,7 @@ static int hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
         return -EINVAL;
     }
 
-    if ( ctxt.cr4 & ~hvm_cr4_guest_valid_bits(d, true) )
+    if ( ctxt.cr4 & ~hvm_cr4_guest_valid_bits(d) )
     {
         printk(XENLOG_G_ERR "HVM%d restore: bad CR4 %#" PRIx64 "\n",
                d->domain_id, ctxt.cr4);
@@ -2425,7 +2425,7 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
     struct vcpu *v = current;
     unsigned long old_cr;
 
-    if ( value & ~hvm_cr4_guest_valid_bits(v->domain, false) )
+    if ( value & ~hvm_cr4_guest_valid_bits(v->domain) )
     {
         HVM_DBG_LOG(DBG_LEVEL_1,
                     "Guest attempts to set reserved bit in CR4: %lx",
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index ba26b6a80b..f450391df4 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -106,6 +106,7 @@ bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
     unsigned long cr0 = vmcb_get_cr0(vmcb);
     unsigned long cr3 = vmcb_get_cr3(vmcb);
     unsigned long cr4 = vmcb_get_cr4(vmcb);
+    unsigned long valid;
     uint64_t efer = vmcb_get_efer(vmcb);
 
 #define PRINTF(fmt, args...) do { \
@@ -130,9 +131,10 @@ bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
            (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
         PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
 
-    if ( cr4 & ~hvm_cr4_guest_valid_bits(v->domain, false) )
+    valid = hvm_cr4_guest_valid_bits(v->domain);
+    if ( cr4 & ~valid )
         PRINTF("CR4: invalid bits are set (%#"PRIx64", valid: %#"PRIx64")\n",
-               cr4, hvm_cr4_guest_valid_bits(v->domain, false));
+               cr4, valid);
 
     if ( vmcb_get_dr6(vmcb) >> 32 )
         PRINTF("DR6: bits [63:32] are not zero (%#"PRIx64")\n",
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 95d109f962..86b8916a5d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1529,7 +1529,7 @@ static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr,
              */
             v->arch.hvm.vmx.cr4_host_mask =
                 (HVM_CR4_HOST_MASK | X86_CR4_PKE |
-                 ~hvm_cr4_guest_valid_bits(v->domain, false));
+                 ~hvm_cr4_guest_valid_bits(v->domain));
 
             v->arch.hvm.vmx.cr4_host_mask |= v->arch.hvm.vmx.vmx_realmode ?
                                              X86_CR4_VME : 0;
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 1e51689ef3..3a37e9ebea 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2323,7 +2323,7 @@ int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
         data = X86_CR4_VMXE;
         break;
     case MSR_IA32_VMX_CR4_FIXED1:
-        data = hvm_cr4_guest_valid_bits(d, false);
+        data = hvm_cr4_guest_valid_bits(d);
         break;
     case MSR_IA32_VMX_MISC:
         /* Do not support CR3-target feature now */
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index be0d8b0a4d..334bd573b9 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -334,7 +334,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
 /* Check CR4/EFER values */
 const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
                            signed int cr0_pg);
-unsigned long hvm_cr4_guest_valid_bits(const struct domain *d, bool restore);
+unsigned long hvm_cr4_guest_valid_bits(const struct domain *d);
 
 int hvm_copy_context_and_params(struct domain *src, struct domain *dst);
 
-- 
2.11.0


