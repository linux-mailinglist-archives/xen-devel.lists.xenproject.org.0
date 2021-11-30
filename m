Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D261463D6F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 19:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235414.408425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms7bi-0000wL-8b; Tue, 30 Nov 2021 18:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235414.408425; Tue, 30 Nov 2021 18:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms7bi-0000uJ-4W; Tue, 30 Nov 2021 18:11:58 +0000
Received: by outflank-mailman (input) for mailman id 235414;
 Tue, 30 Nov 2021 18:11:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ms7bh-0000OK-6E
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 18:11:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff3faf13-5208-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 19:11:55 +0100 (CET)
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
X-Inumbo-ID: ff3faf13-5208-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638295915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XSzkVLoGE9z937AIRFhmIWxFCeWPF7/Hqp4uUfMmskQ=;
  b=Uth1TR1792qsQcxt0DULPVkXoQ0GvA/tjpYJlEK4TEE/m4Ef5poB9+mQ
   8Tv1hT7lvefjp8mewvwKOQ5SLonCbkjq4SX/DHW7Foteu/jcp6B4kTrFl
   gQE4eineESwCzi9YtgtcBRKSqREy4C4RHfN+M97dgsgu5bxjNbndtXPjf
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wZpKAQqbWF7oRjqV1maBNiVr4WVflNC+u1tN6jwIuwRnUQ72+Te4jYiLta1rgAXb0qllJKiArL
 /UE9Bfx7opTQYMDApysuJlXoIMhhw5QVsh+5O18NVUBvLWgAwXpwOTUCnGRhWScIbf8R4AN5Nd
 u19pQUGL3t8FQS5RP7NzVN1LTf3A0u5ptTgufcRXa7Jfy9ipxxzb+H9xolhQNpO58xp6zKvibg
 0ktkvE/65G0qDzgpemh3KYetZgsTK+K6PoEZVCqVraW/97GGSmj76vFkPSYchq2bBPqSnjWFaA
 AwmLF28uJaCth0CPb7sK1P9A
X-SBRS: 5.1
X-MesageID: 58452968
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rOYuU6jVVDtgqVGCqX32Tg8zX1619xcKZh0ujC45NGQN5FlHY01je
 htvXGmOa/mOYGOjedp/OYWzo0wD6sSEnIBlTAtv/itgFHgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cz2YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Q7K2yYFgyb5bW2+gkfSJXLj89AvVZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauOO
 5dDOGQ/BPjGSy1JNH4nEpx9pcWLo3PwUTBWmEynoKVitgA/yyQuieOwYbI5YOeiWcxQl12wu
 mHC8mL2ExwecteYzFKt+3O3j+7LlAvxWZ4eGbO18PJnmhuYwWl7IAUOVEGwqP2wgFOWUdNDJ
 0Ea9ywioLJ0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQP4MudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9URX5NkdbO3VCF1FcpYC+/sdj1XojU+qPDoao1+z3MG7rk
 guQ7yQHqY4csNBI6P2kqAWvby2XmrDFSQs85wPyV22j7x9kaIPNW7FE+WQ3/t4bct/HEwDpU
 Gws3pHHsbtQVc3leDmlGb1VRNmUC+C53CowaLKFN70o7HyT9nGqZui8CxkudR4yYq7oldIEC
 XI/WD+9BrcPbBNGjoctOupd7vjGK4C7TrwJsdiOM7JzjmBZLlPvwc2XTRf4M5rRuEYti7ojH
 pyQbNyhC30XYYw+kmHmHb5EiuR1nHxkrY82eXwd50/8uVZ5TCTIIYrpzXPUNrxphE96iFu9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUXX9ritw/G7gtWre1I8cEl4Uqe56ep4J+RNwvQE/s+Vr
 yrVchIJlzLCaYjvdFzihoZLM+i0A/6SbBsTYEQRALpf8yR5PNv0sv5AL8BfkHtO3LUL8MOYh
 sItI62oasmjgByck9jERZWi/oFkajqxggeCY3isbDQlJsYyTA3V4N70OADo8XBWXCawsMI/p
 Zym1x/aHsVfF1gzUp6OZaL91U61sFgchPl2AxnCLO5MdRi+64NtMSHw0KM6epleNRXZyzKG/
 A+KGhNE9/LVqoo4/YCR16CJpoukCcVkGU9eEzWJ5Lq6L3CCrGGi3ZVBQKCDejWEDDH4/6CrZ
 ON0yfDgMaJYwAYW4tQkS7sylPAw/driobNe3z9IJnSTYgT5EK5kL1mHwdJL6v9HyIhGtFbkQ
 UmI4NRbZ+mEYZu3DF4LKQM5Re2fzvVIyCLK5PE4LUimti96+L2LDRdbMxWW0XEPKbJ0NMUuw
 Ps7ud5Q4Au600J4PtGDhyFS1mKNMn1fDPl36sBEWNfm2lgx11VPQZ3AESunspiAZuJFPlQuP
 jLJ1rHJgK5Rxxaafnc+fZQXMTGxWXjaVMh28WI/
IronPort-HdrOrdr: A9a23:s3KGeqimVsY37ci/q3dkGrmpBXBQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.87,276,1631592000"; 
   d="scan'208";a="58452968"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>
Subject: [PATCH 2/2] x86/hvm: Rework nested hap functions to reduce parameters
Date: Tue, 30 Nov 2021 18:11:39 +0000
Message-ID: <20211130181139.14398-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211130181139.14398-1-andrew.cooper3@citrix.com>
References: <20211130181139.14398-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Most functions in this call chain have 8 parameters, meaning that the final
two booleans are spilled to the stack for for calls.

First, delete nestedhap_walk_L1_p2m and introduce nhvm_hap_walk_L1_p2m() as a
thin wrapper around hvm_funcs just like all the other nhvm_*() hooks.  This
involves including xen/mm.h as the forward declaration of struct npfec is no
longer enough.

Next, replace the triple of booleans with struct npfec, which contains the
same information in the bottom 3 bits.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Alexandru Isaila <aisaila@bitdefender.com>
CC: Petre Pircalabu <ppircalabu@bitdefender.com>

I don't much like this, but I think it's the least bad option in the short
term.  npfec is horribly mis-named/mis-used (at best, it should be considered
npf_info, and probably inherits from the same API/ABI mistakes our regular
pagewalk functions have) and is going to have to be untangled to make nested
virt a maintainable option.
---
 xen/arch/x86/hvm/hvm.c                  |  5 +----
 xen/arch/x86/hvm/svm/nestedsvm.c        | 11 +++++----
 xen/arch/x86/hvm/vmx/vvmx.c             | 10 ++++-----
 xen/arch/x86/mm/hap/nested_hap.c        | 40 +++++++++------------------------
 xen/arch/x86/mm/p2m.c                   | 12 +++++-----
 xen/include/asm-x86/hvm/hvm.h           | 13 ++++++++---
 xen/include/asm-x86/hvm/nestedhvm.h     |  6 +----
 xen/include/asm-x86/hvm/svm/nestedsvm.h |  6 ++---
 xen/include/asm-x86/hvm/vmx/vvmx.h      |  8 +++----
 9 files changed, 46 insertions(+), 65 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 31e9474db093..07a11d372e9f 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1769,10 +1769,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
          * the same as for shadow paging.
          */
 
-         rv = nestedhvm_hap_nested_page_fault(curr, &gpa,
-                                              npfec.read_access,
-                                              npfec.write_access,
-                                              npfec.insn_fetch);
+        rv = nestedhvm_hap_nested_page_fault(curr, &gpa, npfec);
         switch (rv) {
         case NESTEDHVM_PAGEFAULT_DONE:
         case NESTEDHVM_PAGEFAULT_RETRY:
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 6d9063004077..abc178d8d482 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1216,10 +1216,9 @@ nsvm_vmcb_hap_enabled(struct vcpu *v)
  * walk is successful, the translated value is returned in
  * L1_gpa. The result value tells what to do next.
  */
-int
-nsvm_hap_walk_L1_p2m(struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa,
-                     unsigned int *page_order, uint8_t *p2m_acc,
-                     bool_t access_r, bool_t access_w, bool_t access_x)
+int nsvm_hap_walk_L1_p2m(
+    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
+    uint8_t *p2m_acc, struct npfec npfec)
 {
     uint32_t pfec;
     unsigned long nested_cr3, gfn;
@@ -1227,9 +1226,9 @@ nsvm_hap_walk_L1_p2m(struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa,
     nested_cr3 = nhvm_vcpu_p2m_base(v);
 
     pfec = PFEC_user_mode | PFEC_page_present;
-    if ( access_w )
+    if ( npfec.write_access )
         pfec |= PFEC_write_access;
-    if ( access_x )
+    if ( npfec.insn_fetch )
         pfec |= PFEC_insn_fetch;
 
     /* Walk the guest-supplied NPT table, just as if it were a pagetable */
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index e9f94daf6493..7419ee9dd0bc 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2346,16 +2346,16 @@ int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
  * walk is successful, the translated value is returned in
  * L1_gpa. The result value tells what to do next.
  */
-int
-nvmx_hap_walk_L1_p2m(struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa,
-                     unsigned int *page_order, uint8_t *p2m_acc,
-                     bool_t access_r, bool_t access_w, bool_t access_x)
+int nvmx_hap_walk_L1_p2m(
+    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
+    uint8_t *p2m_acc, struct npfec npfec)
 {
     int rc;
     unsigned long gfn;
     uint64_t exit_qual;
     uint32_t exit_reason = EXIT_REASON_EPT_VIOLATION;
-    uint32_t rwx_rights = (access_x << 2) | (access_w << 1) | access_r;
+    uint32_t rwx_rights =
+        (npfec.insn_fetch << 2) | (npfec.write_access << 1) | npfec.read_access;
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
 
     vmx_vmcs_enter(v);
diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index 50fa2dd9f405..d8a7b3b40167 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -113,31 +113,13 @@ nestedhap_fix_p2m(struct vcpu *v, struct p2m_domain *p2m,
     }
 }
 
-/* This function uses L2_gpa to walk the P2M page table in L1. If the
- * walk is successful, the translated value is returned in
- * L1_gpa. The result value tells what to do next.
- */
-int
-nestedhap_walk_L1_p2m(struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa,
-                      unsigned int *page_order, uint8_t *p2m_acc,
-                      bool_t access_r, bool_t access_w, bool_t access_x)
-{
-    ASSERT(hvm_funcs.nhvm_hap_walk_L1_p2m);
-
-    return hvm_funcs.nhvm_hap_walk_L1_p2m(v, L2_gpa, L1_gpa, page_order,
-        p2m_acc, access_r, access_w, access_x);
-}
-
-
 /* This function uses L1_gpa to walk the P2M table in L0 hypervisor. If the
  * walk is successful, the translated value is returned in L0_gpa. The return 
  * value tells the upper level what to do.
  */
-static int
-nestedhap_walk_L0_p2m(struct p2m_domain *p2m, paddr_t L1_gpa, paddr_t *L0_gpa,
-                      p2m_type_t *p2mt, p2m_access_t *p2ma,
-                      unsigned int *page_order,
-                      bool_t access_r, bool_t access_w, bool_t access_x)
+static int nestedhap_walk_L0_p2m(
+    struct p2m_domain *p2m, paddr_t L1_gpa, paddr_t *L0_gpa, p2m_type_t *p2mt,
+    p2m_access_t *p2ma, unsigned int *page_order, struct npfec npfec)
 {
     mfn_t mfn;
     int rc;
@@ -154,7 +136,7 @@ nestedhap_walk_L0_p2m(struct p2m_domain *p2m, paddr_t L1_gpa, paddr_t *L0_gpa,
         goto out;
 
     rc = NESTEDHVM_PAGEFAULT_L0_ERROR;
-    if ( access_w && p2m_is_readonly(*p2mt) )
+    if ( npfec.write_access && p2m_is_readonly(*p2mt) )
         goto out;
 
     if ( p2m_is_paging(*p2mt) || p2m_is_shared(*p2mt) || !p2m_is_ram(*p2mt) )
@@ -176,9 +158,8 @@ nestedhap_walk_L0_p2m(struct p2m_domain *p2m, paddr_t L1_gpa, paddr_t *L0_gpa,
  *
  * Returns:
  */
-int
-nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
-    bool_t access_r, bool_t access_w, bool_t access_x)
+int nestedhvm_hap_nested_page_fault(
+    struct vcpu *v, paddr_t *L2_gpa, struct npfec npfec)
 {
     int rv;
     paddr_t L1_gpa, L0_gpa;
@@ -192,8 +173,8 @@ nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
     p2m = p2m_get_hostp2m(d); /* L0 p2m */
 
     /* walk the L1 P2M table */
-    rv = nestedhap_walk_L1_p2m(v, *L2_gpa, &L1_gpa, &page_order_21, &p2ma_21,
-        access_r, access_w, access_x);
+    rv = nhvm_hap_walk_L1_p2m(v, *L2_gpa, &L1_gpa, &page_order_21, &p2ma_21,
+                              npfec);
 
     /* let caller to handle these two cases */
     switch (rv) {
@@ -209,9 +190,8 @@ nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
     }
 
     /* ==> we have to walk L0 P2M */
-    rv = nestedhap_walk_L0_p2m(p2m, L1_gpa, &L0_gpa,
-        &p2mt_10, &p2ma_10, &page_order_10,
-        access_r, access_w, access_x);
+    rv = nestedhap_walk_L0_p2m(p2m, L1_gpa, &L0_gpa, &p2mt_10, &p2ma_10,
+                               &page_order_10, npfec);
 
     /* let upper level caller to handle these two cases */
     switch (rv) {
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index def1695cf00b..68e38cba14f7 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1930,6 +1930,11 @@ unsigned long paging_gva_to_gfn(struct vcpu *v,
         const struct paging_mode *mode;
         uint8_t l1_p2ma;
         unsigned int l1_page_order;
+        struct npfec npfec = {
+            .read_access  = 1,
+            .write_access = *pfec & PFEC_write_access,
+            .insn_fetch   = *pfec & PFEC_insn_fetch,
+        };
         int rv;
 
         /* translate l2 guest va into l2 guest gfn */
@@ -1940,11 +1945,8 @@ unsigned long paging_gva_to_gfn(struct vcpu *v,
         if ( l2_gfn == gfn_x(INVALID_GFN) )
             return gfn_x(INVALID_GFN);
 
-        rv = nestedhap_walk_L1_p2m(v, pfn_to_paddr(l2_gfn), &l1_gpa,
-                                   &l1_page_order, &l1_p2ma,
-                                   1,
-                                   !!(*pfec & PFEC_write_access),
-                                   !!(*pfec & PFEC_insn_fetch));
+        rv = nhvm_hap_walk_L1_p2m(
+            v, pfn_to_paddr(l2_gfn), &l1_gpa, &l1_page_order, &l1_p2ma, npfec);
 
         if ( rv != NESTEDHVM_PAGEFAULT_DONE )
             return gfn_x(INVALID_GFN);
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index 2767427aa938..7e571e1515c6 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -25,6 +25,7 @@
 #include <asm/current.h>
 #include <asm/x86_emulate.h>
 #include <asm/hvm/asid.h>
+#include <xen/mm.h>
 
 #ifdef CONFIG_HVM_FEP
 /* Permit use of the Forced Emulation Prefix in HVM guests */
@@ -203,8 +204,7 @@ struct hvm_function_table {
     /*Walk nested p2m  */
     int (*nhvm_hap_walk_L1_p2m)(struct vcpu *v, paddr_t L2_gpa,
                                 paddr_t *L1_gpa, unsigned int *page_order,
-                                uint8_t *p2m_acc, bool_t access_r,
-                                bool_t access_w, bool_t access_x);
+                                uint8_t *p2m_acc, struct npfec npfec);
 
     void (*enable_msr_interception)(struct domain *d, uint32_t msr);
     bool_t (*is_singlestep_supported)(void);
@@ -350,7 +350,6 @@ int hvm_debug_op(struct vcpu *v, int32_t op);
 void hvm_toggle_singlestep(struct vcpu *v);
 void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx);
 
-struct npfec;
 int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
                               struct npfec npfec);
 
@@ -631,6 +630,14 @@ static inline enum hvm_intblk nhvm_interrupt_blocked(struct vcpu *v)
     return hvm_funcs.nhvm_intr_blocked(v);
 }
 
+static inline int nhvm_hap_walk_L1_p2m(
+    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
+    uint8_t *p2m_acc, struct npfec npfec)
+{
+    return hvm_funcs.nhvm_hap_walk_L1_p2m(
+        v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);
+}
+
 static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     hvm_funcs.enable_msr_interception(d, msr);
diff --git a/xen/include/asm-x86/hvm/nestedhvm.h b/xen/include/asm-x86/hvm/nestedhvm.h
index d26392578621..7184928c2bb1 100644
--- a/xen/include/asm-x86/hvm/nestedhvm.h
+++ b/xen/include/asm-x86/hvm/nestedhvm.h
@@ -58,11 +58,7 @@ bool_t nestedhvm_vcpu_in_guestmode(struct vcpu *v);
 #define NESTEDHVM_PAGEFAULT_RETRY      5
 #define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
 int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
-    bool_t access_r, bool_t access_w, bool_t access_x);
-
-int nestedhap_walk_L1_p2m(struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa,
-                          unsigned int *page_order, uint8_t *p2m_acc,
-                          bool_t access_r, bool_t access_w, bool_t access_x);
+                                    struct npfec npfec);
 
 /* IO permission map */
 unsigned long *nestedhvm_vcpu_iomap_get(bool_t ioport_80, bool_t ioport_ed);
diff --git a/xen/include/asm-x86/hvm/svm/nestedsvm.h b/xen/include/asm-x86/hvm/svm/nestedsvm.h
index 087369845761..c3ef2354140c 100644
--- a/xen/include/asm-x86/hvm/svm/nestedsvm.h
+++ b/xen/include/asm-x86/hvm/svm/nestedsvm.h
@@ -122,9 +122,9 @@ enum hvm_intblk nsvm_intr_blocked(struct vcpu *v);
 void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v);
 void svm_vmexit_do_stgi(struct cpu_user_regs *regs, struct vcpu *v);
 bool_t nestedsvm_gif_isset(struct vcpu *v);
-int nsvm_hap_walk_L1_p2m(struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa,
-                         unsigned int *page_order, uint8_t *p2m_acc,
-                         bool_t access_r, bool_t access_w, bool_t access_x);
+int nsvm_hap_walk_L1_p2m(
+    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
+    uint8_t *p2m_acc, struct npfec npfec);
 
 #define NSVM_INTR_NOTHANDLED     3
 #define NSVM_INTR_NOTINTERCEPTED 2
diff --git a/xen/include/asm-x86/hvm/vmx/vvmx.h b/xen/include/asm-x86/hvm/vmx/vvmx.h
index d5f68f30b129..e4ca3bc6ee2b 100644
--- a/xen/include/asm-x86/hvm/vmx/vvmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vvmx.h
@@ -100,10 +100,10 @@ bool_t nvmx_ept_enabled(struct vcpu *v);
 #define EPT_TRANSLATE_MISCONFIG     2
 #define EPT_TRANSLATE_RETRY         3
 
-int
-nvmx_hap_walk_L1_p2m(struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa,
-                     unsigned int *page_order, uint8_t *p2m_acc,
-                     bool_t access_r, bool_t access_w, bool_t access_x);
+int nvmx_hap_walk_L1_p2m(
+    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
+    uint8_t *p2m_acc, struct npfec npfec);
+
 /*
  * Virtual VMCS layout
  *
-- 
2.11.0


