Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A95454D2B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 19:27:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226973.392413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnPdd-0003wG-H2; Wed, 17 Nov 2021 18:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226973.392413; Wed, 17 Nov 2021 18:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnPdd-0003uU-Du; Wed, 17 Nov 2021 18:26:29 +0000
Received: by outflank-mailman (input) for mailman id 226973;
 Wed, 17 Nov 2021 18:26:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J8BY=QE=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mnPdb-0003uO-8Y
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 18:26:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcf6532a-47d3-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 19:26:23 +0100 (CET)
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
X-Inumbo-ID: dcf6532a-47d3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637173583;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vcaFR5Wb8C5x2GC+ObWk4NMWkFGNk65Gx4Uiu2P/QjI=;
  b=KsOZF598E1K/+c8K/uG5lA+8PE1PP7frXeJQIbM3njsvY30br0mSMjZJ
   uaLr0LWYF5r6Lw45So3PbsoE597S/7NX1lOFzun2KW0b2ky9sDlQ27J9f
   2jFaGZT/TnQAeOy0MHNp3HISLZ2rPWHe7cVt8anQ1mCEMMPc42EQE15Qi
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: rhJOP72HmMGe2sVr7bLTOpcWNEVWa27Nev+opEzb40WrCNuaSRa5VQLOhGxZAU6DjqqF660ByR
 HTMkbwRSTCpRpz6r0ZFXnMgPn/ONg9djjPRBWgPxl3mP4OkrMJ4kjK04bHVExhDcsWyYe0rc07
 N2LxBJ36XAH7O7Do+zRLFciVi2hELuTqrKhyoURu9h1wnCNn75NYgaNeZoBTlj+PdOXaGAI0Vj
 BKPmdTOJWbujl+O0jeGe/RT1RkQpIBPLVYkAxqkYESjlpFn4L4VPxUekZQgBVfWaHVpDzQ2HrO
 rwQVy/+fHuF22jFiraBHaCxy
X-SBRS: 5.1
X-MesageID: 57580380
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qJeAJqvLHrib1Xf7+28Qb+BUP+fnVIVZMUV32f8akzHdYApBsoF/q
 tZmKTqGPPaIZGrye9p3bNzl8x4E6pXXz4AxG1BvrHxjFitD+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2IfhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl7sShaR8DPLX2mMctTxcCHyRwAbMF9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DO
 JdJMWE/NHwsZTVXNXMcNaM+mdv4n1vHSy1DjU6Ig7sOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKgkTKdi32TeDtHW2iYfnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/p9A
 UEJ/islrYAp6VemCNL6WnWFTGWs50BGHYAKSqtjtV/LmvG8Dxul6nYsFWZQSMQMttcMRR8ay
 lHTk9bnOSIsv+jAIZ6CzYu8oTS3MCkTCGYNYy4YUAcIi+XeTJEPYgHnFYg6TvPs5jHhMXSpm
 m3R8nBi71kGpZdTj/3TwLzRv967SnElpCYR7x6fYG+q5xgRiGWNN93xsgizARqtwe+kori9U
 Josx5j2AAMmV8jleMmxrAMlRunBCxGtamO0vLKXN8N9nwlBAlb6FWyq3BlwJV1yLuEPciLzb
 UnYtGt5vcEIYyP6MvMoP9jgVqzGKJQM8/y/DZg4ifIUPPBMmPKvpnkyNSZ8IUiz+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48gPUwDnUgDKZfobcmjlXyPiOPGDFbMEOttGAbeP4gRsfLfyC2Io
 ok3Cid/40gGOAEISnKMqtB7wJFjBSVTOK0aXOQLLLPeeVQ/Rzl6YxITqJt4E7FYc21uvr+g1
 hmAtoVwkTITXFXLdleHbG5NcrTqUcotpH43J3V0b12px2IiccCk66JGL8k7erwu9epCy/9oT
 qZaJ5XcU6oXEjmXqS4AaZTdrZB5cEj5jwy5ICf4MiM0eIRtRlKV94a8LBfv7iQHEgG+qdA6/
 ++7zgreTJdaH1ZiAc/aZeiB1VS0uXRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4qYCbi7qFooGlF/pFMnBbR2SLv6yrMST6/3a4xdMSWui/Yj2ABnj//7+vZ
 LsJwqikYuEHhltDr6F1D61vkfAl/9LqqrJXklZkEXHMYwj5A79sOCDbj8xGt6kLzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4KRnOlj+6Q924KGDABdbMBS7gSBAKKd4bdE+y
 uA7tc9KswGyh3LG6DpdYvy4I4hUEkE9bg==
IronPort-HdrOrdr: A9a23:I9mqc6oyJCayPRfDvKTLgf8aV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.87,241,1631592000"; 
   d="scan'208";a="57580380"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH] x86/hvm: Remove callback from paging->flush_tlb() hook
Date: Wed, 17 Nov 2021 18:26:03 +0000
Message-ID: <20211117182603.20057-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

TLB flushing is a hotpath, and function pointer calls are
expensive (especially under repoline) for what amounts to an identity
transform on the data.  Just pass the vcpu_bitmap bitmap directly.

As we use NULL for all rather than none, introduce a flush_vcpu() helper to
avoid the risk of logical errors from opencoding the expression.  This also
means the viridian callers can avoid writing an all-ones bitmap for the
flushing logic to consume.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>

The result even compiles smaller:

  $ ../scripts/bloat-o-meter xen-syms-before xen-syms-after
  add/remove: 0/2 grow/shrink: 0/3 up/down: 0/-125 (-125)
  Function                                     old     new   delta
  flush_tlb                                    207     205      -2
  always_flush                                   6       -      -6
  need_flush                                     9       -      -9
  do_hvm_op                                   2434    2418     -16
  shadow_flush_tlb                             628     536     -92

but this is very much not the point of the patch.

It would be rather more efficient in this case and probably others for
for_each_vcpu() to iterate over d->vcpu[] than follow the v->next_vcpu pointer
chain (better locality of access), and also because then the vCPU id is the
loop induction variable, not a value read from memory.
---
 xen/arch/x86/hvm/hvm.c               |  7 +------
 xen/arch/x86/hvm/viridian/viridian.c | 31 +++++++++----------------------
 xen/arch/x86/mm/hap/hap.c            | 11 ++++++++---
 xen/arch/x86/mm/shadow/common.c      | 18 +++++++++++-------
 xen/arch/x86/mm/shadow/private.h     |  3 +--
 xen/include/asm-x86/paging.h         | 11 ++++-------
 6 files changed, 34 insertions(+), 47 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index eee365711d63..31e9474db093 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4047,17 +4047,12 @@ static void hvm_s3_resume(struct domain *d)
     }
 }
 
-static bool always_flush(void *ctxt, struct vcpu *v)
-{
-    return true;
-}
-
 static int hvmop_flush_tlb_all(void)
 {
     if ( !is_hvm_domain(current->domain) )
         return -EINVAL;
 
-    return paging_flush_tlb(always_flush, NULL) ? 0 : -ERESTART;
+    return paging_flush_tlb(NULL) ? 0 : -ERESTART;
 }
 
 static int hvmop_set_evtchn_upcall_vector(
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index b906f7b86a74..cab0bbee5cde 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -574,13 +574,6 @@ static void vpmask_fill(struct hypercall_vpmask *vpmask)
     bitmap_fill(vpmask->mask, HVM_MAX_VCPUS);
 }
 
-static bool vpmask_test(const struct hypercall_vpmask *vpmask,
-                        unsigned int vp)
-{
-    ASSERT(vp < HVM_MAX_VCPUS);
-    return test_bit(vp, vpmask->mask);
-}
-
 static unsigned int vpmask_first(const struct hypercall_vpmask *vpmask)
 {
     return find_first_bit(vpmask->mask, HVM_MAX_VCPUS);
@@ -669,17 +662,6 @@ static uint16_t hv_vpset_to_vpmask(const struct hv_vpset *set,
 #undef NR_VPS_PER_BANK
 }
 
-/*
- * Windows should not issue the hypercalls requiring this callback in the
- * case where vcpu_id would exceed the size of the mask.
- */
-static bool need_flush(void *ctxt, struct vcpu *v)
-{
-    struct hypercall_vpmask *vpmask = ctxt;
-
-    return vpmask_test(vpmask, v->vcpu_id);
-}
-
 union hypercall_input {
     uint64_t raw;
     struct {
@@ -714,6 +696,7 @@ static int hvcall_flush(const union hypercall_input *input,
         uint64_t flags;
         uint64_t vcpu_mask;
     } input_params;
+    unsigned long *vcpu_bitmap;
 
     /* These hypercalls should never use the fast-call convention. */
     if ( input->fast )
@@ -730,18 +713,19 @@ static int hvcall_flush(const union hypercall_input *input,
      * so err on the safe side.
      */
     if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS )
-        vpmask_fill(vpmask);
+        vcpu_bitmap = NULL;
     else
     {
         vpmask_empty(vpmask);
         vpmask_set(vpmask, 0, input_params.vcpu_mask);
+        vcpu_bitmap = vpmask->mask;
     }
 
     /*
      * A false return means that another vcpu is currently trying
      * a similar operation, so back off.
      */
-    if ( !paging_flush_tlb(need_flush, vpmask) )
+    if ( !paging_flush_tlb(vcpu_bitmap) )
         return -ERESTART;
 
     output->rep_complete = input->rep_count;
@@ -760,6 +744,7 @@ static int hvcall_flush_ex(const union hypercall_input *input,
         uint64_t flags;
         struct hv_vpset set;
     } input_params;
+    unsigned long *vcpu_bitmap;
 
     /* These hypercalls should never use the fast-call convention. */
     if ( input->fast )
@@ -771,7 +756,7 @@ static int hvcall_flush_ex(const union hypercall_input *input,
         return -EINVAL;
 
     if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS )
-        vpmask_fill(vpmask);
+        vcpu_bitmap = NULL;
     else
     {
         union hypercall_vpset *vpset = &this_cpu(hypercall_vpset);
@@ -807,13 +792,15 @@ static int hvcall_flush_ex(const union hypercall_input *input,
         rc = hv_vpset_to_vpmask(set, vpmask);
         if ( rc )
             return rc;
+
+        vcpu_bitmap = vpmask->mask;
     }
 
     /*
      * A false return means that another vcpu is currently trying
      * a similar operation, so back off.
      */
-    if ( !paging_flush_tlb(need_flush, vpmask) )
+    if ( !paging_flush_tlb(vcpu_bitmap) )
         return -ERESTART;
 
     output->rep_complete = input->rep_count;
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 73575deb0d8a..84d7a1b7906a 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -705,8 +705,13 @@ static void dummy_flush(void *data)
 {
 }
 
-static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
-                      void *ctxt)
+static bool flush_vcpu(const struct vcpu *v, const unsigned long *vcpu_bitmap)
+{
+    return !vcpu_bitmap || test_bit(v->vcpu_id, vcpu_bitmap);
+}
+
+/* Flush TLB of selected vCPUs.  NULL for all. */
+static bool flush_tlb(const unsigned long *vcpu_bitmap)
 {
     static DEFINE_PER_CPU(cpumask_t, flush_cpumask);
     cpumask_t *mask = &this_cpu(flush_cpumask);
@@ -721,7 +726,7 @@ static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
     {
         unsigned int cpu;
 
-        if ( !flush_vcpu(ctxt, v) )
+        if ( !flush_vcpu(v, vcpu_bitmap) )
             continue;
 
         hvm_asid_flush_vcpu(v);
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 8c1b041f7135..de09ef5cae58 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -3069,9 +3069,13 @@ static void sh_clean_dirty_bitmap(struct domain *d)
 }
 
 
-/* Fluhs TLB of selected vCPUs. */
-bool shadow_flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
-                      void *ctxt)
+static bool flush_vcpu(const struct vcpu *v, const unsigned long *vcpu_bitmap)
+{
+    return !vcpu_bitmap || test_bit(v->vcpu_id, vcpu_bitmap);
+}
+
+/* Flush TLB of selected vCPUs.  NULL for all. */
+bool shadow_flush_tlb(const unsigned long *vcpu_bitmap)
 {
     static DEFINE_PER_CPU(cpumask_t, flush_cpumask);
     cpumask_t *mask = &this_cpu(flush_cpumask);
@@ -3084,12 +3088,12 @@ bool shadow_flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
 
     /* Pause all other vcpus. */
     for_each_vcpu ( d, v )
-        if ( v != current && flush_vcpu(ctxt, v) )
+        if ( v != current && flush_vcpu(v, vcpu_bitmap) )
             vcpu_pause_nosync(v);
 
     /* Now that all VCPUs are signalled to deschedule, we wait... */
     for_each_vcpu ( d, v )
-        if ( v != current && flush_vcpu(ctxt, v) )
+        if ( v != current && flush_vcpu(v, vcpu_bitmap) )
             while ( !vcpu_runnable(v) && v->is_running )
                 cpu_relax();
 
@@ -3103,7 +3107,7 @@ bool shadow_flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
     {
         unsigned int cpu;
 
-        if ( !flush_vcpu(ctxt, v) )
+        if ( !flush_vcpu(v, vcpu_bitmap) )
             continue;
 
         paging_update_cr3(v, false);
@@ -3118,7 +3122,7 @@ bool shadow_flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
 
     /* Done. */
     for_each_vcpu ( d, v )
-        if ( v != current && flush_vcpu(ctxt, v) )
+        if ( v != current && flush_vcpu(v, vcpu_bitmap) )
             vcpu_unpause(v);
 
     return true;
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index 35efb1b984fb..e4db8d32546a 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -922,8 +922,7 @@ static inline int sh_check_page_has_no_refs(struct page_info *page)
 }
 
 /* Flush the TLB of the selected vCPUs. */
-bool shadow_flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
-                      void *ctxt);
+bool shadow_flush_tlb(const unsigned long *vcpu_bitmap);
 
 #endif /* _XEN_SHADOW_PRIVATE_H */
 
diff --git a/xen/include/asm-x86/paging.h b/xen/include/asm-x86/paging.h
index 996c2cd0383f..308f1115dde9 100644
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -141,9 +141,7 @@ struct paging_mode {
     void          (*update_cr3            )(struct vcpu *v, int do_locking,
                                             bool noflush);
     void          (*update_paging_modes   )(struct vcpu *v);
-    bool          (*flush_tlb             )(bool (*flush_vcpu)(void *ctxt,
-                                                               struct vcpu *v),
-                                            void *ctxt);
+    bool          (*flush_tlb             )(const unsigned long *vcpu_bitmap);
 
     unsigned int guest_levels;
 
@@ -417,11 +415,10 @@ static always_inline unsigned int paging_max_paddr_bits(const struct domain *d)
     return bits;
 }
 
-static inline bool paging_flush_tlb(bool (*flush_vcpu)(void *ctxt,
-                                                       struct vcpu *v),
-                                    void *ctxt)
+/* Flush selected vCPUs TLBs.  NULL for all. */
+static inline bool paging_flush_tlb(const unsigned long *vcpu_bitmap)
 {
-    return paging_get_hostmode(current)->flush_tlb(flush_vcpu, ctxt);
+    return paging_get_hostmode(current)->flush_tlb(vcpu_bitmap);
 }
 
 #endif /* XEN_PAGING_H */
-- 
2.11.0


