Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFCA4562E9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 19:49:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227563.393607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmTI-0004fa-Md; Thu, 18 Nov 2021 18:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227563.393607; Thu, 18 Nov 2021 18:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmTI-0004cd-JK; Thu, 18 Nov 2021 18:49:20 +0000
Received: by outflank-mailman (input) for mailman id 227563;
 Thu, 18 Nov 2021 18:49:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpGR=QF=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mnmTG-0004bm-RE
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 18:49:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a3b0de8-48a0-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 19:49:17 +0100 (CET)
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
X-Inumbo-ID: 3a3b0de8-48a0-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637261356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NbsZ6NUegDcSQoMOv/4sPiQdtY2+3SFEfUDg5iYGvWo=;
  b=V5fN88QYt2KLCl9KU2z7lo1n7ZlKJzvzdWoqWWonAfm72GV+dLG3a3ts
   a/pG1vYkAqZ/856Iv8tiY+45VRArlM6ku8p2LrmdYcFzzHFj/QJjiucWY
   Tm6TA5ihdGJCaTlV112ECfe9HHO7TwhdlFD3hb02k42U3/HzzYuYHXGm+
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8zn02FljashdfOL1N75kiNHCxX0mChf9f+sXx4P6FhWChquRJmOEnAvLjyxPVk1orBNc0+ncEd
 hRl+woJ1Jl/0lxPhjFAg59DaZKj7wGzA9tUVvQknUgczzk/6PkmMhx2ahcz3Le3Olkup2NR3G8
 bmAd6HvR5NCV9QqT19jsUgVjMiL5MnhKjs07gjD1z+6VCF6J4z5LgzefanBJn8MWtJaQ5MOuiT
 Q8dRR2wUIiDA0KchtPzkEJbVshy//DvJg00gLadbsJYbauHQqySKsulGNFCSSf2eMmngOUUjZl
 uNxze91oxX1EhqkqWV9RHwyp
X-SBRS: 5.1
X-MesageID: 60147975
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+5xEA6BGMoNPpxVW//rkw5YqxClBgxIJ4kV8jS/XYbTApDsmhDMPy
 GNOXziPO/6IM2vzeo8ib9ux/RwHuZ7dztQ2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540EI7wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/jxSLltZN6
 Mtx75XpDlYCJfOUk+YaTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGhG5s2ZERQJ4yY
 eJHVSFpKxTNZSZTPwgRCYk9xNmWi33GJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tl6Ru
 2bu72n/RBYAO7S32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXOZi/Skjk+1W/pEN
 lcZvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+lzovW6gClJnY4FDcYL40Nr5FuTj4ty
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 2nS9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocNbxorqp5
 iFsdy2iAAYmV83leMulGrtlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGGyP
 xaM5V4NtMIDZhNGiJObharrV6zGKoC6S7zYug38NIISMvCdiifZlM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhWdyVmXs6v9JQMHgNBSyI/cFwc5zbq6etJU+RYc259zY8kJ
 1mxBR1VzkTRn3rCJVnYY3xvcuq3D51+sWg6LWonOlPxgyovZoOm7aE+cZorfOZ4qLw/nKAsF
 /RVKd+dBvlvSyjc/2hPZ5fKs4E/Jg+gghiDPnT5bWFnLYJgXQHA5vTtYhDrqHsVFiOyuMZn+
 ++g2wrXTIAtXQNnCMqKOvujw0no5SoWmf5oXluOKd5WIR2+/I9vIi33r/k2P8BTdkmTmmrEj
 16bWE5Kq/PMrok59MjyqZqF94r5QfFjGkd6HnXA6erkPyft4Wf+k5RLV/yFfG6BWTqsqrmif
 +hc09r1LOYDwARRq4N5HrtmkfA+6t/oq+MIxwhoBiyWPVGiC7cmKXiax8hf8KZKw+YB6wexX
 0uO/PhcOKmIZ5y5QAJAelJ9Y7TRz+wQlxnT8e8xcRfz6yJA9baaVVlfYkuXgytHIbopaI4oz
 I/NYiLNB9BTXvbyDuu7sw==
IronPort-HdrOrdr: A9a23:DvVtLq+MyDYdFa2mwmhuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.87,245,1631592000"; 
   d="scan'208";a="60147975"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH v2] x86/hvm: Remove callback from paging->flush_tlb() hook
Date: Thu, 18 Nov 2021 18:48:56 +0000
Message-ID: <20211118184856.20229-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211117182603.20057-1-andrew.cooper3@citrix.com>
References: <20211117182603.20057-1-andrew.cooper3@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>

v2:
 * Also short-circuit the hvcall_flush_ex() HV_GENERIC_SET_ALL path.

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
 xen/arch/x86/hvm/viridian/viridian.c | 34 +++++++++++-----------------------
 xen/arch/x86/mm/hap/hap.c            | 11 ++++++++---
 xen/arch/x86/mm/shadow/common.c      | 18 +++++++++++-------
 xen/arch/x86/mm/shadow/private.h     |  3 +--
 xen/include/asm-x86/paging.h         | 11 ++++-------
 6 files changed, 36 insertions(+), 48 deletions(-)

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
index b906f7b86a74..51d50e194e6d 100644
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
@@ -770,8 +755,9 @@ static int hvcall_flush_ex(const union hypercall_input *input,
                                   sizeof(input_params)) != HVMTRANS_okay )
         return -EINVAL;
 
-    if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS )
-        vpmask_fill(vpmask);
+    if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS ||
+         input_params.set.format == HV_GENERIC_SET_ALL )
+        vcpu_bitmap = NULL;
     else
     {
         union hypercall_vpset *vpset = &this_cpu(hypercall_vpset);
@@ -807,13 +793,15 @@ static int hvcall_flush_ex(const union hypercall_input *input,
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
index 5b269ef8b3bb..de4b13565ab4 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -696,8 +696,13 @@ static void hap_update_cr3(struct vcpu *v, int do_locking, bool noflush)
     hvm_update_guest_cr3(v, noflush);
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
@@ -712,7 +717,7 @@ static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
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


