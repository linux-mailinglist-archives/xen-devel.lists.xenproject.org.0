Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A1945EE9D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232781.403797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawP-0003lk-TL; Fri, 26 Nov 2021 13:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232781.403797; Fri, 26 Nov 2021 13:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawP-0003cR-Bb; Fri, 26 Nov 2021 13:07:01 +0000
Received: by outflank-mailman (input) for mailman id 232781;
 Fri, 26 Nov 2021 13:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavb-0003W9-I3
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f33e7f7-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:06:10 +0100 (CET)
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
X-Inumbo-ID: 9f33e7f7-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lximL64CK95djBSogswxc0craXiGZCmN208+GkSGs/4=;
  b=iVU0sLnf7fPCHW16bSgPBhhxeyyHvvWz9qWP4vN4GWthrrdx3+BHCQFb
   BkgMw0umZW0EMcnQKQDtP7bPPKcR1WhGhPpI35KLQQjQFmnFhUbe4EPAD
   diCeuUr+maowUaUCSTx1K4oAwuf7/Z1ZcKlWJ3ZVkzVHjmRIWNvw/XWbR
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vuJvUChCQhHB/ox0yJ203BadB5bX5zAEnj3gOCw4jIbaFaveUZeMtTEUzpYxpb+0TpLDLuB7N+
 e6d1O8VHvV4xk8tJvEtZc9oiG7QDu8swSJ9P7bByQ8q/nP780UInPfylxNbNuPp12qljLhi44N
 VOuSFHqMFqemWyR5CXH+jig5dZCVJRhIm5wXOLvCGPWy4v8C60lQrc9QL1Lz5SOfisMmh1NEU/
 n+kDYpkp5RilgJfTTjWBFzWnCN/faf2ZGUbOBDD9vzP3YxkWItnk35+uftbToSag9xzv5+Hboi
 BV+W//OFBnnrRDSDtUeP4LGO
X-SBRS: 5.1
X-MesageID: 59064059
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h5LPia5j3Ixzl2l9ZfI0/wxRtPXAchMFZxGqfqrLsTDasY5as4F+v
 mVJWjjXaPyNZzb1fYpya4q+o0xU6MLRm4VmTgI6pSo1Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 ORplsSrEwsTN4rzvcMwYkBgNBxwFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTTK6AO
 5JEOFKDajzqXzJlfUUdJa5kgef5hlryLgJe9Wms8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc+ZhN85i81uB8KPz3CO+K1lddhl8ZvVz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D3gbQ4xawZRGp8crVnl
 CNf8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxg5bJtbKGO3P
 BS7VeZtCHl7ZyDCgUhfOd/ZNijX5fK4SYSNug78MrKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI+cElJNhMb6e9Jl1VNk/sHm+HW0
 Gu6X0MEmlPziWeecVeBa2x5aaOpVpF69CppMSspNFeu+n4ifYfws/tPK8ppJeEqpL550Pp5b
 /gZYMHcUP5BfSvKpmYGZp7noY08KBny3VCSPzCoaSQUdoJ7Q1Cb4cftewbirXFcDie+ucYkj
 aen0wfXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEyalDWA1
 guQDRMJnsX3otc4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKkQoYs4d4FLo3n6sy68G2+u1fxwVgWn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0aBGkzbf2v05PUHm6XIl57GAS0hTY0GBhSE1wGGZ62/5L
 TPNYPIr1jE=
IronPort-HdrOrdr: A9a23:e7v42Kk5tm8s1kNeybthigMvTufpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="59064059"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 45/65] x86/hap: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:26 +0000
Message-ID: <20211126123446.32324-46-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
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


