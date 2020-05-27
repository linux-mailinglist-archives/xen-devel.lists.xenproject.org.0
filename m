Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E636E1E345B
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 03:03:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdkSR-0007Am-Ct; Wed, 27 May 2020 01:02:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dR7h=7J=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jdkSQ-0007Ah-LE
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 01:02:10 +0000
X-Inumbo-ID: b084bf4c-9fb5-11ea-81bc-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b084bf4c-9fb5-11ea-81bc-bc764e2007e4;
 Wed, 27 May 2020 01:02:09 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +tmivBmUIBfMiRW1qfV0UofSbEzv3m76rP1iLS1598pEP9EGORPXTeeRdu1M6OlUHhrl+FBzfY
 +aYegj597GkgF7eMc3EIix2mAQllPLtS95enhNVVBsDYV+fpWAHOxgk1BTI63hDUgiVBi7iL1a
 d9Q8TquhIdegVKga9CYotVzNrZVBEDcl69RR/qU15NyvOtQ4Q8x1j3wvukmrlENviLLkSx8PYw
 D8fiu/NDD7G5lfov1yOBGLsJTg4aWCw8W/zf0xvkfQGpwQu+be/8R5VSYNLJqdhlwjlrpX0BY/
 k0g=
X-SBRS: 2.7
X-MesageID: 18801100
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,439,1583211600"; d="scan'208";a="18801100"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2] x86/svm: retry after unhandled NPT fault if gfn was marked
 for recalculation
Date: Wed, 27 May 2020 02:01:48 +0100
Message-ID: <1590541308-11317-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, kevin.tian@intel.com,
 jbeulich@suse.com, wl@xen.org, andrew.cooper3@citrix.com,
 jun.nakajima@intel.com, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

If a recalculation NPT fault hasn't been handled explicitly in
hvm_hap_nested_page_fault() then it's potentially safe to retry -
US bit has been re-instated in PTE and any real fault would be correctly
re-raised next time. Do it by allowing hvm_hap_nested_page_fault to
fall through in that case.

This covers a specific case of migration with vGPU assigned on AMD:
global log-dirty is enabled and causes immediate recalculation NPT
fault in MMIO area upon access. This type of fault isn't described
explicitly in hvm_hap_nested_page_fault (this isn't called on
EPT misconfig exit on Intel) which results in domain crash.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes in v2:
- don't gamble with retrying every recal fault and instead let
  hvm_hap_nested_page_fault know it's allowed to fall through in default case
---
 xen/arch/x86/hvm/hvm.c        | 6 +++---
 xen/arch/x86/hvm/svm/svm.c    | 7 ++++++-
 xen/arch/x86/hvm/vmx/vmx.c    | 2 +-
 xen/include/asm-x86/hvm/hvm.h | 2 +-
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 74c9f84..42bd720 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1731,7 +1731,7 @@ void hvm_inject_event(const struct x86_event *event)
 }
 
 int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
-                              struct npfec npfec)
+                              struct npfec npfec, bool fall_through)
 {
     unsigned long gfn = gpa >> PAGE_SHIFT;
     p2m_type_t p2mt;
@@ -1740,7 +1740,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
     struct p2m_domain *p2m, *hostp2m;
-    int rc, fall_through = 0, paged = 0;
+    int rc, paged = 0;
     bool sharing_enomem = false;
     vm_event_request_t *req_ptr = NULL;
     bool sync = false;
@@ -1905,7 +1905,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
             sync = p2m_mem_access_check(gpa, gla, npfec, &req_ptr);
 
             if ( !sync )
-                fall_through = 1;
+                fall_through = true;
             else
             {
                 /* Rights not promoted (aka. sync event), work here is done */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 46a1aac..8ef3fed 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1695,7 +1695,12 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     else if ( pfec & NPT_PFEC_in_gpt )
         npfec.kind = npfec_kind_in_gpt;
 
-    ret = hvm_hap_nested_page_fault(gpa, ~0ul, npfec);
+    /*
+     * US bit being set in error code indicates P2M type recalculation has
+     * just been done meaning that it's possible there is nothing else to handle
+     * and we can just fall through and retry.
+     */
+    ret = hvm_hap_nested_page_fault(gpa, ~0ul, npfec, !!(pfec & PFEC_user_mode));
 
     if ( tb_init_done )
     {
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 11a4dd9..10f1eeb 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3398,7 +3398,7 @@ static void ept_handle_violation(ept_qual_t q, paddr_t gpa)
     else
         gla = ~0ull;
 
-    ret = hvm_hap_nested_page_fault(gpa, gla, npfec);
+    ret = hvm_hap_nested_page_fault(gpa, gla, npfec, false);
     switch ( ret )
     {
     case 0:         // Unhandled L1 EPT violation
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index 1eb377d..03e5f1d 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -329,7 +329,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx);
 
 struct npfec;
 int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
-                              struct npfec npfec);
+                              struct npfec npfec, bool fall_through);
 
 /* Check CR4/EFER values */
 const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
-- 
2.7.4


