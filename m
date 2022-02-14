Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13764B5110
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271696.466299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3S-0006PD-8x; Mon, 14 Feb 2022 13:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271696.466299; Mon, 14 Feb 2022 13:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3S-0006LF-3N; Mon, 14 Feb 2022 13:06:10 +0000
Received: by outflank-mailman (input) for mailman id 271696;
 Mon, 14 Feb 2022 13:06:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2d-00023t-3E
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:19 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf1c7d79-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:05:14 +0100 (CET)
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
X-Inumbo-ID: bf1c7d79-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Tggw0GZ6bfnXtc3j4bg8kNAeAyzyeywPiqWn1QmRJkY=;
  b=hWqUX8sHy2nidq9jL+80nzlAb/4wFPqq9B9+1a022ixiHc4MDE+naiSN
   wtJcqELJEtDONTMK59Xb0KxjM6LpMmsjHl89uAVqfaVcNEApFdFWSpOqv
   rYCIeTAuBnUDwSclYCYg0+oIANUoj7Mxx3ihyVzHNiJVvdUzFoX72DFQ2
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: h3iYyQsK6zE5hVydfGasuPl2S6zQCRvyDC8bkeVSnsO+uetH8nNUUuE2JnTJOudLkRFmpRcOUe
 I5c65DN0NJLHfNifkAASDni17Vg/KlOm39Lh30kFzAG5/liJWQGB+zDU3lOG6T8GBJdC4zjFSn
 lblgbCBcoLwovYAPr9gZALpt+0UDzLFn8uyjwNwyQmvDcBGEGDZeuJ4Wa1VB/TPBZT7E5AowGq
 ph/ZiH0Yl5aW43fhtRIRVn4X0H6rb1hon0zFmR3gVHOeMSsf/RgnqZnAoiMgnM6XD0F1zcIkRy
 kuPS1TxufY1NFHz90P+tDrp4
X-SBRS: 5.1
X-MesageID: 64050600
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dK7b7a6cv4gWjnE+dDCrwAxRtCbAchMFZxGqfqrLsTDasY5as4F+v
 mofWmzUOP+MazGkfNAgO4znpk9SuZXSzYVjT1Q6/i5nHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29Iw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 +h18tuXEzgVPZbhpqc6XEF8KwRTFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQa6DP
 5RBMVKDajzjW1pEI0owOqkUjcSajFv9Wm1ktn+a8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvGtJk6TePisKQw2RvKmzJVWEZ+uUaHTeeR1XOGHJV4c
 XMo+REDk+sV+xSPdvzQdkjtyJKbhSI0V91VGuw8zQiCzKvI/gqUblQ5oi59hM8O75FvG2Fzv
 rOdt5awXGE07uXJIZ6I3urM9VuP1T4pwXjujMPuZS8M+JHdrY46lXojpf4zQffu3rUZ9dwdq
 g1mTRTSZZ1O16bnNI3hpDgrZg5AQbCTEGYICv3/BD7N0++ATNfNi3aUwVba9+1cC42SU0OMu
 nMJ8+DHsrxSUsHdyXHVGb5XdF1M2xpiGGeC6WOD4rF7r2j9k5JdVdw4DM5CyLdBbZ9fJG6Bj
 L77sgJN/p5DVEZGnocsC79d//8ClPC6ffy8D6i8RoMXPvBZKV/WlAkzNBX49z28zyARfVQXZ
 M7znTCEVi1BV8yKDVOeGo8g7FPc7n5ilD2DHcihl3xKE9O2PRaodFvMC3PWBshR0U9OiFq9H
 w93O5TYxhNBfvf5ZyWLo4cfIUpTdSowBIzsqtwRfemGe1I0FGYkAv7X4LUgZ406wPgFyraWp
 imwCh1C1V7ypXzbMgHWOHptX6ziAMRkpnUhMC1yYVvxgyo/YZyi5bs0focseeV17/RqyPN5F
 qFXe8iJDvlVZC7A/jARMcv0oIB4LUz5jgOSJSu1JjM4esc4FQDO/9bleCrp9TUPUXXr5Zdv/
 eX421qCE5QZRglkAMLHU96Vzgu87SoHheZ/f0rUOd0PKk/ix5dndn7qhfgtLsBSdRianmmG1
 xybCAszrPXWp9Nn68HAgK2Jotv7E+Z6GUYGTWDX4azvaHvf92unh4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9utcHyo7J6zxh/GCSZZlumPbpsP32a0JQdraZK3LJY5VO7V
 0/nFgO24llV1BcJyGIsGTc=
IronPort-HdrOrdr: A9a23:peCOGqMpSc0cScBcTvKjsMiBIKoaSvp037B87TEUdfU1SL3jqy
 nKpp536faaskd2ZJhNo6H5BEDiexPhHPxOkO4s1N6ZNWGMhILPFvAB0WLM+UyEJ8SUzJ8l6U
 4PSdkENDQyNzdHZATBjDVQ3+xA/DBPys7Y5tvj8w==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64050600"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 49/70] x86/hap: CFI hardening
Date: Mon, 14 Feb 2022 12:51:06 +0000
Message-ID: <20220214125127.17985-50-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/mm/hap/guest_walk.c |  4 ++--
 xen/arch/x86/mm/hap/hap.c        | 21 +++++++++++----------
 xen/arch/x86/mm/hap/private.h    | 30 ++++++++++++------------------
 3 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/mm/hap/guest_walk.c b/xen/arch/x86/mm/hap/guest_walk.c
index 832a8058471e..1da8d3b99edc 100644
--- a/xen/arch/x86/mm/hap/guest_walk.c
+++ b/xen/arch/x86/mm/hap/guest_walk.c
@@ -36,14 +36,14 @@
 #include <asm/guest_pt.h>
 #include <asm/p2m.h>
 
-unsigned long hap_gva_to_gfn(GUEST_PAGING_LEVELS)(
+unsigned long cf_check hap_gva_to_gfn(GUEST_PAGING_LEVELS)(
     struct vcpu *v, struct p2m_domain *p2m, unsigned long gva, uint32_t *pfec)
 {
     unsigned long cr3 = v->arch.hvm.guest_cr[3];
     return hap_p2m_ga_to_gfn(GUEST_PAGING_LEVELS)(v, p2m, cr3, gva, pfec, NULL);
 }
 
-unsigned long hap_p2m_ga_to_gfn(GUEST_PAGING_LEVELS)(
+unsigned long cf_check hap_p2m_ga_to_gfn(GUEST_PAGING_LEVELS)(
     struct vcpu *v, struct p2m_domain *p2m, unsigned long cr3,
     paddr_t ga, uint32_t *pfec, unsigned int *page_order)
 {
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index ed5112b00b63..9d67a47f5fe9 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -268,7 +268,7 @@ static void hap_free(struct domain *d, mfn_t mfn)
     page_list_add_tail(pg, &d->arch.paging.hap.freelist);
 }
 
-static struct page_info *hap_alloc_p2m_page(struct domain *d)
+static struct page_info *cf_check hap_alloc_p2m_page(struct domain *d)
 {
     struct page_info *pg;
 
@@ -294,7 +294,7 @@ static struct page_info *hap_alloc_p2m_page(struct domain *d)
     return pg;
 }
 
-static void hap_free_p2m_page(struct domain *d, struct page_info *pg)
+static void cf_check hap_free_p2m_page(struct domain *d, struct page_info *pg)
 {
     struct domain *owner = page_get_owner(pg);
 
@@ -662,8 +662,8 @@ void hap_vcpu_init(struct vcpu *v)
  * HAP guests can handle page faults (in the guest page tables) without
  * needing any action from Xen, so we should not be intercepting them.
  */
-static int hap_page_fault(struct vcpu *v, unsigned long va,
-                          struct cpu_user_regs *regs)
+static int cf_check hap_page_fault(
+    struct vcpu *v, unsigned long va, struct cpu_user_regs *regs)
 {
     struct domain *d = v->domain;
 
@@ -677,7 +677,7 @@ static int hap_page_fault(struct vcpu *v, unsigned long va,
  * should not be intercepting it.  However, we need to correctly handle
  * getting here from instruction emulation.
  */
-static bool_t hap_invlpg(struct vcpu *v, unsigned long linear)
+static bool cf_check hap_invlpg(struct vcpu *v, unsigned long linear)
 {
     /*
      * Emulate INVLPGA:
@@ -690,7 +690,8 @@ static bool_t hap_invlpg(struct vcpu *v, unsigned long linear)
     return 1;
 }
 
-static void hap_update_cr3(struct vcpu *v, int do_locking, bool noflush)
+static void cf_check hap_update_cr3(
+    struct vcpu *v, int do_locking, bool noflush)
 {
     v->arch.hvm.hw_cr[3] = v->arch.hvm.guest_cr[3];
     hvm_update_guest_cr3(v, noflush);
@@ -702,7 +703,7 @@ static bool flush_vcpu(const struct vcpu *v, const unsigned long *vcpu_bitmap)
 }
 
 /* Flush TLB of selected vCPUs.  NULL for all. */
-static bool flush_tlb(const unsigned long *vcpu_bitmap)
+static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
 {
     static DEFINE_PER_CPU(cpumask_t, flush_cpumask);
     cpumask_t *mask = &this_cpu(flush_cpumask);
@@ -747,7 +748,7 @@ hap_paging_get_mode(struct vcpu *v)
                                       &hap_paging_protected_mode);
 }
 
-static void hap_update_paging_modes(struct vcpu *v)
+static void cf_check hap_update_paging_modes(struct vcpu *v)
 {
     struct domain *d = v->domain;
     unsigned long cr3_gfn = v->arch.hvm.guest_cr[3] >> PAGE_SHIFT;
@@ -791,13 +792,13 @@ void hap_p2m_init(struct p2m_domain *p2m)
     p2m->write_p2m_entry_post = hap_write_p2m_entry_post;
 }
 
-static unsigned long hap_gva_to_gfn_real_mode(
+static unsigned long cf_check hap_gva_to_gfn_real_mode(
     struct vcpu *v, struct p2m_domain *p2m, unsigned long gva, uint32_t *pfec)
 {
     return ((paddr_t)gva >> PAGE_SHIFT);
 }
 
-static unsigned long hap_p2m_ga_to_gfn_real_mode(
+static unsigned long cf_check hap_p2m_ga_to_gfn_real_mode(
     struct vcpu *v, struct p2m_domain *p2m, unsigned long cr3,
     paddr_t ga, uint32_t *pfec, unsigned int *page_order)
 {
diff --git a/xen/arch/x86/mm/hap/private.h b/xen/arch/x86/mm/hap/private.h
index 973fbe8be59c..1040eaf69f43 100644
--- a/xen/arch/x86/mm/hap/private.h
+++ b/xen/arch/x86/mm/hap/private.h
@@ -24,27 +24,21 @@
 /********************************************/
 /*          GUEST TRANSLATION FUNCS         */
 /********************************************/
-unsigned long hap_gva_to_gfn_2_levels(struct vcpu *v,
-                                     struct p2m_domain *p2m,
-                                     unsigned long gva, 
-                                     uint32_t *pfec);
-unsigned long hap_gva_to_gfn_3_levels(struct vcpu *v,
-                                     struct p2m_domain *p2m,
-                                     unsigned long gva, 
-                                     uint32_t *pfec);
-unsigned long hap_gva_to_gfn_4_levels(struct vcpu *v,
-                                     struct p2m_domain *p2m,
-                                     unsigned long gva, 
-                                     uint32_t *pfec);
+unsigned long cf_check hap_gva_to_gfn_2_levels(
+    struct vcpu *v, struct p2m_domain *p2m, unsigned long gva, uint32_t *pfec);
+unsigned long cf_check hap_gva_to_gfn_3_levels(
+    struct vcpu *v, struct p2m_domain *p2m, unsigned long gva, uint32_t *pfec);
+unsigned long cf_check hap_gva_to_gfn_4_levels(
+    struct vcpu *v, struct p2m_domain *p2m, unsigned long gva, uint32_t *pfec);
 
-unsigned long hap_p2m_ga_to_gfn_2_levels(struct vcpu *v,
-    struct p2m_domain *p2m, unsigned long cr3,
+unsigned long cf_check hap_p2m_ga_to_gfn_2_levels(
+    struct vcpu *v, struct p2m_domain *p2m, unsigned long cr3,
     paddr_t ga, uint32_t *pfec, unsigned int *page_order);
-unsigned long hap_p2m_ga_to_gfn_3_levels(struct vcpu *v,
-    struct p2m_domain *p2m, unsigned long cr3,
+unsigned long cf_check hap_p2m_ga_to_gfn_3_levels(
+    struct vcpu *v, struct p2m_domain *p2m, unsigned long cr3,
     paddr_t ga, uint32_t *pfec, unsigned int *page_order);
-unsigned long hap_p2m_ga_to_gfn_4_levels(struct vcpu *v,
-    struct p2m_domain *p2m, unsigned long cr3,
+unsigned long cf_check hap_p2m_ga_to_gfn_4_levels(
+    struct vcpu *v, struct p2m_domain *p2m, unsigned long cr3,
     paddr_t ga, uint32_t *pfec, unsigned int *page_order);
 
 #endif /* __HAP_PRIVATE_H__ */
-- 
2.11.0


