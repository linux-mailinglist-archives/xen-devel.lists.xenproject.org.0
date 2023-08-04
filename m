Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E02276FB98
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 10:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576963.903712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpmz-0007cg-7I; Fri, 04 Aug 2023 08:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576963.903712; Fri, 04 Aug 2023 08:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpmz-0007aJ-32; Fri, 04 Aug 2023 08:04:01 +0000
Received: by outflank-mailman (input) for mailman id 576963;
 Fri, 04 Aug 2023 08:03:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRpmx-0007Qe-Mb
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 08:03:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7696f1ed-329d-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 10:03:57 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D93834EE0741;
 Fri,  4 Aug 2023 10:03:56 +0200 (CEST)
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
X-Inumbo-ID: 7696f1ed-329d-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 2/4] x86/mtrr: address MISRA C:2012 Rule 5.3
Date: Fri,  4 Aug 2023 10:03:34 +0200
Message-Id: <2f7380396ee146132738dd5c6b2a80d62a8035d5.1691135862.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691135862.git.nicola.vetrini@bugseng.com>
References: <cover.1691135862.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variables to avoid shadowing and thus address
MISRA C:2012 Rule 5.3:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope".

The shadowing happens between the struct declaration 'mtrr_state' in
'xen/arch/x86/include/asm/mtrr.h' and local variable names.
The latter are renamed to 'm', which is used elsewhere in
'xen/arch/x86/hvm/mtrr.c' for the same purpose.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Renamed 'mtrr' local variables to 'm'.
- Added references in the commit message.
---
 xen/arch/x86/hvm/mtrr.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 29f3fb1607..7f486358b1 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -687,13 +687,13 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,

 static int cf_check hvm_save_mtrr_msr(struct vcpu *v, hvm_domain_context_t *h)
 {
-    const struct mtrr_state *mtrr_state = &v->arch.hvm.mtrr;
+    const struct mtrr_state *m = &v->arch.hvm.mtrr;
     struct hvm_hw_mtrr hw_mtrr = {
-        .msr_mtrr_def_type = mtrr_state->def_type |
-                             MASK_INSR(mtrr_state->fixed_enabled,
+        .msr_mtrr_def_type = m->def_type |
+                             MASK_INSR(m->fixed_enabled,
                                        MTRRdefType_FE) |
-                            MASK_INSR(mtrr_state->enabled, MTRRdefType_E),
-        .msr_mtrr_cap      = mtrr_state->mtrr_cap,
+                            MASK_INSR(m->enabled, MTRRdefType_E),
+        .msr_mtrr_cap      = m->mtrr_cap,
     };
     unsigned int i;

@@ -710,14 +710,14 @@ static int cf_check hvm_save_mtrr_msr(struct vcpu *v, hvm_domain_context_t *h)

     for ( i = 0; i < MASK_EXTR(hw_mtrr.msr_mtrr_cap, MTRRcap_VCNT); i++ )
     {
-        hw_mtrr.msr_mtrr_var[i * 2] = mtrr_state->var_ranges->base;
-        hw_mtrr.msr_mtrr_var[i * 2 + 1] = mtrr_state->var_ranges->mask;
+        hw_mtrr.msr_mtrr_var[i * 2] = m->var_ranges->base;
+        hw_mtrr.msr_mtrr_var[i * 2 + 1] = m->var_ranges->mask;
     }

     BUILD_BUG_ON(sizeof(hw_mtrr.msr_mtrr_fixed) !=
-                 sizeof(mtrr_state->fixed_ranges));
+                 sizeof(m->fixed_ranges));

-    memcpy(hw_mtrr.msr_mtrr_fixed, mtrr_state->fixed_ranges,
+    memcpy(hw_mtrr.msr_mtrr_fixed, m->fixed_ranges,
            sizeof(hw_mtrr.msr_mtrr_fixed));

     return hvm_save_entry(MTRR, v->vcpu_id, h, &hw_mtrr);
@@ -727,7 +727,7 @@ static int cf_check hvm_load_mtrr_msr(struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int vcpuid, i;
     struct vcpu *v;
-    struct mtrr_state *mtrr_state;
+    struct mtrr_state *m;
     struct hvm_hw_mtrr hw_mtrr;

     vcpuid = hvm_load_instance(h);
@@ -749,26 +749,26 @@ static int cf_check hvm_load_mtrr_msr(struct domain *d, hvm_domain_context_t *h)
         return -EINVAL;
     }

-    mtrr_state = &v->arch.hvm.mtrr;
+    m = &v->arch.hvm.mtrr;

     hvm_set_guest_pat(v, hw_mtrr.msr_pat_cr);

-    mtrr_state->mtrr_cap = hw_mtrr.msr_mtrr_cap;
+    m->mtrr_cap = hw_mtrr.msr_mtrr_cap;

     for ( i = 0; i < NUM_FIXED_MSR; i++ )
-        mtrr_fix_range_msr_set(d, mtrr_state, i, hw_mtrr.msr_mtrr_fixed[i]);
+        mtrr_fix_range_msr_set(d, m, i, hw_mtrr.msr_mtrr_fixed[i]);

     for ( i = 0; i < MASK_EXTR(hw_mtrr.msr_mtrr_cap, MTRRcap_VCNT); i++ )
     {
-        mtrr_var_range_msr_set(d, mtrr_state,
+        mtrr_var_range_msr_set(d, m,
                                MSR_IA32_MTRR_PHYSBASE(i),
                                hw_mtrr.msr_mtrr_var[i * 2]);
-        mtrr_var_range_msr_set(d, mtrr_state,
+        mtrr_var_range_msr_set(d, m,
                                MSR_IA32_MTRR_PHYSMASK(i),
                                hw_mtrr.msr_mtrr_var[i * 2 + 1]);
     }

-    mtrr_def_type_msr_set(d, mtrr_state, hw_mtrr.msr_mtrr_def_type);
+    mtrr_def_type_msr_set(d, m, hw_mtrr.msr_mtrr_def_type);

     return 0;
 }
--
2.34.1

