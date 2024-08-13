Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED23950CB8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 21:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776568.1186730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdwlh-0004tT-U2; Tue, 13 Aug 2024 19:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776568.1186730; Tue, 13 Aug 2024 19:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdwlh-0004qi-RF; Tue, 13 Aug 2024 19:01:17 +0000
Received: by outflank-mailman (input) for mailman id 776568;
 Tue, 13 Aug 2024 19:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaGR=PM=bounce.vates.tech=bounce-md_30504962.66bbad79.v1-ac86e6d5a56745c1ad2a54c7a0e9a345@srs-se1.protection.inumbo.net>)
 id 1sdwlg-0004qZ-Lq
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 19:01:16 +0000
Received: from mail135-13.atl141.mandrillapp.com
 (mail135-13.atl141.mandrillapp.com [198.2.135.13])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 693d84bf-59a6-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 21:01:14 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-13.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4Wk1213L7xzNCdGPp
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 19:01:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ac86e6d5a56745c1ad2a54c7a0e9a345; Tue, 13 Aug 2024 19:01:13 +0000
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
X-Inumbo-ID: 693d84bf-59a6-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1723575673; x=1723836173;
	bh=WcP49SarpCpuQDmycLb8IX7agYmIUvzKnX+BNQO34CI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PhcavI3yJsnchHC8jGz5zq5ILlyR22t88zSlCUuaTz48zZOalTfJHNN3CqFki6xXz
	 mKd42eRq8G1JUzpY2dawPpFqYDJLmOvnlA8pR3iOB+D58zxsduBQ2dWsVTuLipJKJK
	 OB5HTwTHus0xbEYV1gPrqb2jzIktPJYgo6/aP43BIN8gKvzw3X3DQm22q/YYItygBJ
	 80m61/Fta0sQ8L001TaDk5zmOM50cVfLk3zlr5HaESI8uocb+10TeLMperzLDFwoEZ
	 0qlsVvEL9+2YWdXJwKjoLzkcUkv0s3NVu8mMoFWpN+JjyqKZSsZj7gamlfjomdTl5m
	 0zPsKuDIJ3aRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1723575673; x=1723836173; i=vaishali.thakkar@vates.tech;
	bh=WcP49SarpCpuQDmycLb8IX7agYmIUvzKnX+BNQO34CI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=P3jHhzR9gnOYRBNG4t3T+tmuDWZHec/du0rUj77zwvMcTjgYqPIe7YKLY//D9M9cu
	 wQtyh06OVjG+SSc8RfnTvjMHETodstXAWzW3mGl6+NTqF0tMJ/grxht/KQqIh+hTf4
	 /GxSM5NtqYUUNHuWGIQVGkXBfhZkl/q/Hn67QQLJWlD7o8XhGOfPi7CDSIiaveHBK0
	 PD0ahe6SDzVvkrif9GU7XjHfurNW+g1GyfdJDUVgtyIJE2KuVBpK/DmfyDrIt5h5e5
	 k2frI1G8QP222Uc3FoyVUcYel/3ThHYNVbT5HUjDl6B4o72ylYHGP7GUw2jxvN3V3f
	 OJKe4cUrgcPIA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[RFC-for-4.20=20v2=201/1]=20x86/hvm:=20Introduce=20Xen-wide=20ASID=20allocator?=
X-Mailer: git-send-email 2.46.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1723575671884
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <8512ff4c4d78fcd59e6f3185d8a5abd9ef3168b8.1723574652.git.vaishali.thakkar@vates.tech>
In-Reply-To: <cover.1723574652.git.vaishali.thakkar@vates.tech>
References: <cover.1723574652.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ac86e6d5a56745c1ad2a54c7a0e9a345?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240813:md
Date: Tue, 13 Aug 2024 19:01:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Currently ASID generation and management is done per-PCPU. This
scheme is incompatible with SEV technologies as SEV VMs need to
have a fixed ASID associated with all vcpus of the VM throughout
it's lifetime.

This commit introduces a Xen-wide allocator which initializes
the asids at the start of xen and allows to have a fixed asids
throughout the lifecycle of all domains. Having a fixed asid
for non-SEV domains also presents us with the opportunity to
further take use of AMD instructions like TLBSYNC and INVLPGB
for broadcasting the TLB invalidations.

Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
---
Changes since v1:
        - Introudce hvm_asid_bitmap as discussed at Xen-summit
        - Introduce hvm_reclaim_bitmap for reusing ASIDs
        - Assign the asid to the domain at the domain creation via
          hvm_asid_domain_create
        - Corrected the use of CPUID in the svm_asid_init function
        - Adjusted the code in nested virtualization related files
          to use new scheme. As discussed at the Xen-summit, this
          is not tested.
        - Addressed Jan's comments about using uniform style for
          accessing domains via v->domain
        - Allow to flush at the vcpu level in HAP code
        - Documented the sketch of implementation for the new scheme
        - Remove min_asid as for this patch, we are not demonstarting
          it's usecase
        - Arrange includes in multiple files as per Jan's feedback
---
 xen/arch/x86/domain.c                  |   7 ++
 xen/arch/x86/flushtlb.c                |   4 -
 xen/arch/x86/hvm/asid.c                | 136 +++++++++++++------------
 xen/arch/x86/hvm/hvm.c                 |   6 +-
 xen/arch/x86/hvm/nestedhvm.c           |   4 +-
 xen/arch/x86/hvm/svm/asid.c            |  37 ++++---
 xen/arch/x86/hvm/svm/nestedsvm.c       |   5 +-
 xen/arch/x86/hvm/svm/svm.c             |  32 ++----
 xen/arch/x86/hvm/svm/svm.h             |   3 -
 xen/arch/x86/hvm/vmx/vmcs.c            |   2 -
 xen/arch/x86/hvm/vmx/vmx.c             |  37 ++-----
 xen/arch/x86/hvm/vmx/vvmx.c            |   7 +-
 xen/arch/x86/include/asm/hvm/asid.h    |  24 ++---
 xen/arch/x86/include/asm/hvm/domain.h  |   7 ++
 xen/arch/x86/include/asm/hvm/hvm.h     |  11 --
 xen/arch/x86/include/asm/hvm/svm/svm.h |   2 +
 xen/arch/x86/include/asm/hvm/vcpu.h    |   9 --
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |   3 +-
 xen/arch/x86/mm/hap/hap.c              |   5 +-
 xen/arch/x86/mm/p2m.c                  |   6 +-
 xen/arch/x86/mm/paging.c               |   3 +-
 xen/arch/x86/pv/domain.c               |   1 +
 xen/arch/x86/setup.c                   |  10 ++
 23 files changed, 173 insertions(+), 188 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d977ec71ca..75868a2063 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -52,6 +52,7 @@
 #include <asm/ldt.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/hvm/asid.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/viridian.h>
 #include <asm/debugreg.h>
@@ -784,6 +785,7 @@ int arch_domain_create(struct domain *d,
                        unsigned int flags)
 {
     bool paging_initialised = false;
+    struct hvm_domain_asid *p_asid;
     uint32_t emflags;
     int rc;
 
@@ -898,6 +900,11 @@ int arch_domain_create(struct domain *d,
 
     spec_ctrl_init_domain(d);
 
+    if ( is_hvm_domain(d) ) {
+        p_asid = &d->arch.hvm.n1asid;
+        hvm_asid_domain_create(p_asid);
+    }
+
     return 0;
 
  fail:
diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 18748b2bc8..7316b177d7 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -124,7 +124,6 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4)
 
     if ( tlb_clk_enabled )
         t = pre_flush();
-    hvm_flush_guest_tlbs();
 
     old_cr4 = read_cr4();
     ASSERT(!(old_cr4 & X86_CR4_PCIDE) || !(old_cr4 & X86_CR4_PGE));
@@ -229,9 +228,6 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
             do_tlb_flush();
     }
 
-    if ( flags & FLUSH_HVM_ASID_CORE )
-        hvm_flush_guest_tlbs();
-
     if ( flags & FLUSH_CACHE )
     {
         const struct cpuinfo_x86 *c = &current_cpu_data;
diff --git a/xen/arch/x86/hvm/asid.c b/xen/arch/x86/hvm/asid.c
index 8d27b7dba1..a916cb865b 100644
--- a/xen/arch/x86/hvm/asid.c
+++ b/xen/arch/x86/hvm/asid.c
@@ -11,51 +11,66 @@
 #include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/percpu.h>
+
+#include <asm/bitops.h>
 #include <asm/hvm/asid.h>
 
 /* Xen command-line option to enable ASIDs */
 static bool __read_mostly opt_asid_enabled = true;
 boolean_param("asid", opt_asid_enabled);
 
+unsigned long *hvm_asid_bitmap;
+unsigned long *hvm_reclaim_asid_bitmap;
+static DEFINE_SPINLOCK(hvm_asid_lock);
+
 /*
- * ASIDs partition the physical TLB.  In the current implementation ASIDs are
- * introduced to reduce the number of TLB flushes.  Each time the guest's
- * virtual address space changes (e.g. due to an INVLPG, MOV-TO-{CR3, CR4}
- * operation), instead of flushing the TLB, a new ASID is assigned.  This
- * reduces the number of TLB flushes to at most 1/#ASIDs.  The biggest
- * advantage is that hot parts of the hypervisor's code and data retain in
- * the TLB.
- *
  * Sketch of the Implementation:
- *
- * ASIDs are a CPU-local resource.  As preemption of ASIDs is not possible,
- * ASIDs are assigned in a round-robin scheme.  To minimize the overhead of
- * ASID invalidation, at the time of a TLB flush,  ASIDs are tagged with a
- * 64-bit generation.  Only on a generation overflow the code needs to
- * invalidate all ASID information stored at the VCPUs with are run on the
- * specific physical processor.  This overflow appears after about 2^80
- * host processor cycles, so we do not optimize this case, but simply disable
- * ASID useage to retain correctness.
+ * ASIDs are assigned in a round-robin scheme per domain as part of
+ * global allocator scheme and doesn't change during the lifecycle of
+ * the domain. Once vcpus are initialized and are up, we assign the
+ * same ASID to all vcpus of that domain at the first VMRUN. With the
+ * new scheme, we don't need to assign the new ASID during MOV-TO-{CR3,
+ * CR4}. In the case of INVLPG, we flush the TLB entries belonging to
+ * the vcpu and do the reassignment of the ASID belonging to the given
+ * domain.  Currently we do not do anything special for flushing guest
+ * TLBs in flush_area_local as wbinvd() should able to handle this. In
+ * the future Xen should be able to take an advantage of TLBSYNC and
+ * INVLPGB (AMD SVM) with this scheme.
+
+ * When the domain is destroyed, ASID goes to the reclaimable ASID pool
+ * for the reuse. We only go for checking in the reclaimable ASID pool
+ * when we run out of ASIDs in the hvm_asid_bitmap.
  */
 
-/* Per-CPU ASID management. */
+/* Xen-wide ASID management */
 struct hvm_asid_data {
-   uint64_t core_asid_generation;
    uint32_t next_asid;
    uint32_t max_asid;
    bool disabled;
 };
 
-static DEFINE_PER_CPU(struct hvm_asid_data, hvm_asid_data);
+static struct hvm_asid_data asid_data;
 
-void hvm_asid_init(int nasids)
+int hvm_asid_init(int nasids)
 {
+    struct hvm_asid_data *data = &asid_data;
     static int8_t g_disabled = -1;
-    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
 
     data->max_asid = nasids - 1;
     data->disabled = !opt_asid_enabled || (nasids <= 1);
 
+    hvm_asid_bitmap = xzalloc_array(unsigned long,
+                                    BITS_TO_LONGS(data->max_asid));
+    if ( !hvm_asid_bitmap )
+        return -ENOMEM;
+
+    hvm_reclaim_asid_bitmap = xzalloc_array(unsigned long,
+                                            BITS_TO_LONGS(data->max_asid));
+    if ( !hvm_reclaim_asid_bitmap ) {
+        xfree(hvm_asid_bitmap);
+        hvm_asid_bitmap = NULL;
+    }
+
     if ( g_disabled != data->disabled )
     {
         printk("HVM: ASIDs %sabled.\n", data->disabled ? "dis" : "en");
@@ -63,74 +78,67 @@ void hvm_asid_init(int nasids)
             g_disabled = data->disabled;
     }
 
-    /* Zero indicates 'invalid generation', so we start the count at one. */
-    data->core_asid_generation = 1;
+    /* ASID 0 is reserved, so we start the counting from 1 */
+    data->next_asid = find_first_zero_bit(hvm_asid_bitmap, data->max_asid ) + 1;
 
-    /* Zero indicates 'ASIDs disabled', so we start the count at one. */
-    data->next_asid = 1;
+    return 0;
 }
 
-void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid)
+void hvm_asid_flush_domain_asid(struct hvm_domain_asid *asid)
 {
     write_atomic(&asid->generation, 0);
 }
 
-void hvm_asid_flush_vcpu(struct vcpu *v)
+void hvm_asid_flush_domain(struct domain *d)
 {
-    hvm_asid_flush_vcpu_asid(&v->arch.hvm.n1asid);
-    hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
+    hvm_asid_flush_domain_asid(&d->arch.hvm.n1asid);
+    hvm_asid_flush_domain_asid(&d->arch.hvm.nv_n2asid);
 }
 
-void hvm_asid_flush_core(void)
+/* We still allow flushing on vcpu level for non-SEV domain */
+void hvm_asid_flush_vcpu(struct vcpu *v)
 {
-    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
-
-    if ( data->disabled )
-        return;
-
-    if ( likely(++data->core_asid_generation != 0) )
-        return;
-
-    /*
-     * ASID generations are 64 bit.  Overflow of generations never happens.
-     * For safety, we simply disable ASIDs, so correctness is established; it
-     * only runs a bit slower.
-     */
-    printk("HVM: ASID generation overrun. Disabling ASIDs.\n");
-    data->disabled = 1;
+    hvm_asid_flush_domain_asid(&v->domain->arch.hvm.n1asid);
+    hvm_asid_flush_domain_asid(&v->domain->arch.hvm.nv_n2asid);
 }
 
-bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid)
+/* This function is called while creating a new domain */
+bool hvm_asid_domain_create(struct hvm_domain_asid *asid)
 {
-    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
+    struct hvm_asid_data *data = &asid_data;
 
     /* On erratum #170 systems we must flush the TLB. 
      * Generation overruns are taken here, too. */
     if ( data->disabled )
         goto disabled;
 
-    /* Test if VCPU has valid ASID. */
-    if ( read_atomic(&asid->generation) == data->core_asid_generation )
-        return 0;
+    spin_lock(&hvm_asid_lock);
+
+    /* We assume that next_asid > max_asid is unlikely at this point*/
+    arch__test_and_set_bit(data->next_asid, hvm_asid_bitmap);
+
+    /* Find the next available asid to assign to the domain*/
+    data->next_asid = find_next_zero_bit(hvm_asid_bitmap, data->next_asid,
+                                         data->max_asid) + 1;
+
+    /* Check if there are any ASIDs to reclaim */
+    if ( data->next_asid > data->max_asid ) {
+        data->next_asid = find_next_bit(hvm_reclaim_asid_bitmap, 0,
+                                             data->max_asid+1);
+        spin_unlock(&hvm_asid_lock);
 
-    /* If there are no free ASIDs, need to go to a new generation */
-    if ( unlikely(data->next_asid > data->max_asid) )
-    {
-        hvm_asid_flush_core();
-        data->next_asid = 1;
         if ( data->disabled )
             goto disabled;
+
+        if ( data->next_asid > data->max_asid )
+            return -EBUSY;
     }
 
-    /* Now guaranteed to be a free ASID. */
-    asid->asid = data->next_asid++;
-    write_atomic(&asid->generation, data->core_asid_generation);
+    spin_unlock(&hvm_asid_lock);
 
-    /*
-     * When we assign ASID 1, flush all TLB entries as we are starting a new
-     * generation, and all old ASID allocations are now stale. 
-     */
-    return (asid->asid == 1);
+    asid->asid = data->next_asid;
+
+    return 0;
 
  disabled:
     asid->asid = 0;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index f49e29faf7..fbcceb374e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -777,6 +777,10 @@ void hvm_domain_destroy(struct domain *d)
     }
 
     destroy_vpci_mmcfg(d);
+
+    /* Clear the asid and put it in the reclaimable ASID pool */
+    clear_bit(d->arch.hvm.n1asid.asid, hvm_asid_bitmap);
+    set_bit(d->arch.hvm.n1asid.asid, hvm_reclaim_asid_bitmap);
 }
 
 static int cf_check hvm_save_tsc_adjust(struct vcpu *v, hvm_domain_context_t *h)
@@ -1585,8 +1589,6 @@ int hvm_vcpu_initialise(struct vcpu *v)
     int rc;
     struct domain *d = v->domain;
 
-    hvm_asid_flush_vcpu(v);
-
     spin_lock_init(&v->arch.hvm.tm_lock);
     INIT_LIST_HEAD(&v->arch.hvm.tm_list);
 
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index bddd77d810..f1d17becd6 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -41,8 +41,6 @@ nestedhvm_vcpu_reset(struct vcpu *v)
     nv->stale_np2m = false;
     nv->np2m_generation = 0;
 
-    hvm_asid_flush_vcpu_asid(&nv->nv_n2asid);
-
     alternative_vcall(hvm_funcs.nhvm_vcpu_reset, v);
 
     /* vcpu is in host mode */
@@ -86,7 +84,7 @@ static void cf_check nestedhvm_flushtlb_ipi(void *info)
      * This is cheaper than flush_tlb_local() and has
      * the same desired effect.
      */
-    hvm_asid_flush_core();
+    hvm_asid_flush_domain(d);
     vcpu_nestedhvm(v).nv_p2m = NULL;
     vcpu_nestedhvm(v).stale_np2m = true;
 }
diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 7977a8e86b..63f4d15a15 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -4,16 +4,23 @@
  * Copyright (c) 2007, Advanced Micro Devices, Inc.
  */
 
+#include <xen/cpumask.h>
+
+#include <asm/processor.h>
 #include <asm/amd.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/svm/svm.h>
 
 #include "svm.h"
 
-void svm_asid_init(const struct cpuinfo_x86 *c)
+void __init svm_asid_init(void)
 {
+    unsigned int cpu = smp_processor_id();
+    const struct cpuinfo_x86 *c;
     int nasids = 0;
 
+    c = &cpu_data[cpu];
+
     /* Check for erratum #170, and leave ASIDs disabled if it's present. */
     if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
         nasids = cpuid_ebx(0x8000000aU);
@@ -22,33 +29,31 @@ void svm_asid_init(const struct cpuinfo_x86 *c)
 }
 
 /*
- * Called directly before VMRUN.  Checks if the VCPU needs a new ASID,
- * assigns it, and if required, issues required TLB flushes.
+ * Called directly at the VMRUN of a domain to assign
+ * the asid to all associated vcpus of that domain
  */
-void svm_asid_handle_vmrun(void)
+void svm_vcpu_assign_asid(struct vcpu *v)
 {
-    struct vcpu *curr = current;
-    struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
-    struct hvm_vcpu_asid *p_asid =
-        nestedhvm_vcpu_in_guestmode(curr)
-        ? &vcpu_nestedhvm(curr).nv_n2asid : &curr->arch.hvm.n1asid;
-    bool need_flush = hvm_asid_handle_vmenter(p_asid);
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct hvm_domain_asid *p_asid = &v->domain->arch.hvm.n1asid;
 
     /* ASID 0 indicates that ASIDs are disabled. */
     if ( p_asid->asid == 0 )
     {
         vmcb_set_asid(vmcb, true);
         vmcb->tlb_control =
-            cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
+            cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID :
+            TLB_CTRL_FLUSH_ALL;
         return;
     }
 
-    if ( vmcb_get_asid(vmcb) != p_asid->asid )
+    if ( vmcb_get_asid(vmcb) != p_asid->asid ) {
         vmcb_set_asid(vmcb, p_asid->asid);
-
-    vmcb->tlb_control =
-        !need_flush ? TLB_CTRL_NO_FLUSH :
-        cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
+        vmcb->tlb_control = cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID :
+                            TLB_CTRL_FLUSH_ALL;
+    }
+    else
+        return;
 }
 
 /*
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 35a2cbfd7d..102b1a9328 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -486,7 +486,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     if ( rc )
         return rc;
 
-    /* ASID - Emulation handled in hvm_asid_handle_vmenter() */
+    /* ASID - Emulation handled in hvm_asid_domain_create */
 
     /* TLB control */
     n2vmcb->tlb_control = ns_vmcb->tlb_control;
@@ -681,6 +681,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct vmcb_struct *ns_vmcb;
+    struct domain *d = v->domain;
 
     ns_vmcb = nv->nv_vvmcx;
     ASSERT(ns_vmcb != NULL);
@@ -699,7 +700,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     if ( svm->ns_asid != vmcb_get_asid(ns_vmcb))
     {
         nv->nv_flushp2m = 1;
-        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
+        hvm_asid_flush_domain_asid(&d->arch.hvm.nv_n2asid);
         svm->ns_asid = vmcb_get_asid(ns_vmcb);
     }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 92bb10c504..49fac7782f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -25,6 +25,7 @@
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
+#include <asm/hvm/asid.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/vmcb.h>
@@ -179,17 +180,7 @@ static void cf_check svm_update_guest_cr(
         break;
     case 3:
         vmcb_set_cr3(vmcb, v->arch.hvm.hw_cr[3]);
-        if ( !nestedhvm_enabled(v->domain) )
-        {
-            if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-                hvm_asid_flush_vcpu(v);
-        }
-        else if ( nestedhvm_vmswitch_in_progress(v) )
-            ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB. */
-        else if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-            hvm_asid_flush_vcpu_asid(
-                nestedhvm_vcpu_in_guestmode(v)
-                ? &vcpu_nestedhvm(v).nv_n2asid : &v->arch.hvm.n1asid);
+        /* Do not flush during the CR3 switch */
         break;
     case 4:
         value = HVM_CR4_HOST_MASK;
@@ -989,8 +980,6 @@ static void noreturn cf_check svm_do_resume(void)
         v->arch.hvm.svm.launch_core = smp_processor_id();
         hvm_migrate_timers(v);
         hvm_migrate_pirqs(v);
-        /* Migrating to another ASID domain.  Request a new ASID. */
-        hvm_asid_flush_vcpu(v);
     }
 
     if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
@@ -1017,7 +1006,7 @@ void asmlinkage svm_vmenter_helper(void)
 
     ASSERT(hvmemul_cache_disabled(curr));
 
-    svm_asid_handle_vmrun();
+    svm_vcpu_assign_asid(curr);
 
     TRACE_TIME(TRC_HVM_VMENTRY |
                (nestedhvm_vcpu_in_guestmode(curr) ? TRC_HVM_NESTEDFLAG : 0));
@@ -1571,9 +1560,6 @@ static int _svm_cpu_up(bool bsp)
     /* check for erratum 383 */
     svm_init_erratum_383(c);
 
-    /* Initialize core's ASID handling. */
-    svm_asid_init(c);
-
     /* Initialize OSVW bits to be used by guests */
     svm_host_osvw_init();
 
@@ -2333,12 +2319,12 @@ static void svm_vmexit_do_invalidate_cache(struct cpu_user_regs *regs,
 }
 
 static void svm_invlpga_intercept(
-    struct vcpu *v, unsigned long linear, uint32_t asid)
+    struct domain *d, unsigned long linear, uint32_t asid)
 {
     svm_invlpga(linear,
                 (asid == 0)
-                ? v->arch.hvm.n1asid.asid
-                : vcpu_nestedhvm(v).nv_n2asid.asid);
+                ? d->arch.hvm.n1asid.asid
+                : d->arch.hvm.nv_n2asid.asid);
 }
 
 static void svm_invlpg_intercept(unsigned long linear)
@@ -2359,8 +2345,8 @@ static bool cf_check is_invlpg(
 
 static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
 {
-    /* Safe fallback. Take a new ASID. */
-    hvm_asid_flush_vcpu(v);
+    /* Flush the TLB entries belonging to the vcpu and reassign the asid. */
+    hvm_asid_flush_domain(v->domain);
 }
 
 static bool cf_check svm_get_pending_event(
@@ -2929,7 +2915,7 @@ void asmlinkage svm_vmexit_handler(void)
         }
         if ( (insn_len = svm_get_insn_len(v, INSTR_INVLPGA)) == 0 )
             break;
-        svm_invlpga_intercept(v, regs->rax, regs->ecx);
+        svm_invlpga_intercept(v->domain, regs->rax, regs->ecx);
         __update_guest_eip(regs, insn_len);
         break;
 
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index 8dbf37ff49..b285e3c7d9 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -15,9 +15,6 @@ struct cpu_user_regs;
 struct cpuinfo_x86;
 struct vcpu;
 
-void svm_asid_init(const struct cpuinfo_x86 *c);
-void svm_asid_handle_vmrun(void);
-
 unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
 void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 5787110a56..5585f2c4b3 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1957,8 +1957,6 @@ void cf_check vmx_do_resume(void)
          * but the action of another VMCS is deferred till it is switched in.
          */
         v->arch.hvm.vmx.hostenv_migrated = 1;
-
-        hvm_asid_flush_vcpu(v);
     }
 
     debug_state = v->domain->debugger_attached
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 2f7add834a..382b35595a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1463,7 +1463,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
             vmx_set_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
 
             wbinvd();               /* flush possibly polluted cache */
-            hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TLB */
+            hvm_asid_flush_domain(v->domain); /* invalidate memory type cached in TLB */
             v->arch.hvm.cache_mode = NO_FILL_CACHE_MODE;
         }
         else
@@ -1472,7 +1472,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
             vmx_set_guest_pat(v, *pat);
             if ( !is_iommu_enabled(v->domain) || iommu_snoop )
                 vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
-            hvm_asid_flush_vcpu(v); /* no need to flush cache */
+            hvm_asid_flush_domain(v->domain);
         }
     }
 }
@@ -1832,8 +1832,6 @@ static void cf_check vmx_update_guest_cr(
 
         __vmwrite(GUEST_CR3, v->arch.hvm.hw_cr[3]);
 
-        if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-            hvm_asid_flush_vcpu(v);
         break;
 
     default:
@@ -4809,9 +4807,8 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
-    u32 new_asid, old_asid;
-    struct hvm_vcpu_asid *p_asid;
-    bool need_flush;
+    u32 asid;
+    struct hvm_domain_asid *p_asid;
 
     ASSERT(hvmemul_cache_disabled(curr));
 
@@ -4825,36 +4822,22 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
     if ( !cpu_has_vmx_vpid )
         goto out;
     if ( nestedhvm_vcpu_in_guestmode(curr) )
-        p_asid = &vcpu_nestedhvm(curr).nv_n2asid;
+        p_asid = &currd->arch.hvm.nv_n2asid;
     else
-        p_asid = &curr->arch.hvm.n1asid;
+        p_asid = &currd->arch.hvm.n1asid;
 
-    old_asid = p_asid->asid;
-    need_flush = hvm_asid_handle_vmenter(p_asid);
-    new_asid = p_asid->asid;
-
-    if ( unlikely(new_asid != old_asid) )
+    if ( unlikely(asid = p_asid->asid) )
     {
-        __vmwrite(VIRTUAL_PROCESSOR_ID, new_asid);
-        if ( !old_asid && new_asid )
+        __vmwrite(VIRTUAL_PROCESSOR_ID, asid);
+        if (!asid) 
         {
-            /* VPID was disabled: now enabled. */
+            /* VPID was disabled: now enabled */
             curr->arch.hvm.vmx.secondary_exec_control |=
                 SECONDARY_EXEC_ENABLE_VPID;
             vmx_update_secondary_exec_control(curr);
         }
-        else if ( old_asid && !new_asid )
-        {
-            /* VPID was enabled: now disabled. */
-            curr->arch.hvm.vmx.secondary_exec_control &=
-                ~SECONDARY_EXEC_ENABLE_VPID;
-            vmx_update_secondary_exec_control(curr);
-        }
     }
 
-    if ( unlikely(need_flush) )
-        vpid_sync_all();
-
     if ( paging_mode_hap(curr->domain) )
     {
         struct ept_data *ept = &p2m_get_hostp2m(currd)->ept;
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index c05e0e9326..facd7c3a47 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1254,7 +1254,7 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
 
         if ( nvmx->guest_vpid != new_vpid )
         {
-            hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
+            hvm_asid_flush_domain_asid(&v->domain->arch.hvm.nv_n2asid);
             nvmx->guest_vpid = new_vpid;
         }
     }
@@ -2044,6 +2044,7 @@ static int nvmx_handle_invvpid(struct cpu_user_regs *regs)
 {
     struct vmx_inst_decoded decode;
     unsigned long vpid;
+    struct domain *currd = current->domain; 
     int ret;
 
     if ( (ret = decode_vmx_inst(regs, &decode, &vpid)) != X86EMUL_OKAY )
@@ -2055,8 +2056,8 @@ static int nvmx_handle_invvpid(struct cpu_user_regs *regs)
     case INVVPID_INDIVIDUAL_ADDR:
     case INVVPID_SINGLE_CONTEXT:
     case INVVPID_ALL_CONTEXT:
-        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(current).nv_n2asid);
-        break;
+        hvm_asid_flush_domain_asid(&currd->arch.hvm.nv_n2asid);
+      break;
     default:
         vmfail(regs, VMX_INSN_INVEPT_INVVPID_INVALID_OP);
         return X86EMUL_OKAY;
diff --git a/xen/arch/x86/include/asm/hvm/asid.h b/xen/arch/x86/include/asm/hvm/asid.h
index 17c58353d1..c71d17209a 100644
--- a/xen/arch/x86/include/asm/hvm/asid.h
+++ b/xen/arch/x86/include/asm/hvm/asid.h
@@ -8,25 +8,25 @@
 #ifndef __ASM_X86_HVM_ASID_H__
 #define __ASM_X86_HVM_ASID_H__
 
+struct hvm_domain_asid;
+extern unsigned long *hvm_asid_bitmap;
+extern unsigned long *hvm_reclaim_asid_bitmap;
 
-struct vcpu;
-struct hvm_vcpu_asid;
 
-/* Initialise ASID management for the current physical CPU. */
-void hvm_asid_init(int nasids);
+/* Initialise ASID management distributed across all CPUs. */
+int hvm_asid_init(int nasids);
 
 /* Invalidate a particular ASID allocation: forces re-allocation. */
-void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid);
+void hvm_asid_flush_domain_asid(struct hvm_domain_asid *asid);
 
-/* Invalidate all ASID allocations for specified VCPU: forces re-allocation. */
-void hvm_asid_flush_vcpu(struct vcpu *v);
+/* Invalidate all ASID allocations for specified domain */
+void hvm_asid_flush_domain(struct domain *d);
 
-/* Flush all ASIDs on this processor core. */
-void hvm_asid_flush_core(void);
+/* Invalidate ASID allocation for the specified vcpu */
+void hvm_asid_flush_vcpu(struct vcpu *v);
 
-/* Called before entry to guest context. Checks ASID allocation, returns a
- * boolean indicating whether all ASIDs must be flushed. */
-bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid);
+/* Called while creating a domain to assign an ASID */
+bool hvm_asid_domain_create(struct hvm_domain_asid *asid);
 
 #endif /* __ASM_X86_HVM_ASID_H__ */
 
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index dd9d837e84..4d12bafcd1 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -50,6 +50,11 @@ struct hvm_pi_ops {
     void (*vcpu_block)(struct vcpu *v);
 };
 
+struct hvm_domain_asid {
+    uint64_t generation;
+    uint32_t asid;
+};
+
 struct hvm_domain {
     /* Guest page range used for non-default ioreq servers */
     struct {
@@ -141,6 +146,8 @@ struct hvm_domain {
     } write_map;
 
     struct hvm_pi_ops pi_ops;
+    struct hvm_domain_asid n1asid;
+    struct hvm_domain_asid nv_n2asid;
 
     union {
         struct vmx_domain vmx;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 518ba5319b..afd0e580ca 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -466,17 +466,6 @@ static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset,
     alternative_vcall(hvm_funcs.set_tsc_offset, v, offset, at_tsc);
 }
 
-/*
- * Called to ensure than all guest-specific mappings in a tagged TLB are 
- * flushed; does *not* flush Xen's TLB entries, and on processors without a 
- * tagged TLB it will be a noop.
- */
-static inline void hvm_flush_guest_tlbs(void)
-{
-    if ( hvm_enabled )
-        hvm_asid_flush_core();
-}
-
 static inline unsigned int
 hvm_get_cpl(struct vcpu *v)
 {
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 4eeeb25da9..aeeae6c86c 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -21,6 +21,8 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
                    unsigned long fs_base, unsigned long gs_base,
                    unsigned long gs_shadow);
 
+extern void svm_asid_init(void);
+extern void svm_vcpu_assign_asid(struct vcpu *v);
 extern u32 svm_feature_flags;
 
 #define SVM_FEATURE_NPT            0 /* Nested page table support */
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 64c7a6fede..b951e5f1dd 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -17,11 +17,6 @@
 #include <asm/mtrr.h>
 #include <public/hvm/ioreq.h>
 
-struct hvm_vcpu_asid {
-    uint64_t generation;
-    uint32_t asid;
-};
-
 /*
  * We may read or write up to m512 as a number of device-model
  * transactions.
@@ -90,8 +85,6 @@ struct nestedvcpu {
     bool stale_np2m; /* True when p2m_base in VMCx02 is no longer valid */
     uint64_t np2m_generation;
 
-    struct hvm_vcpu_asid nv_n2asid;
-
     bool nv_vmentry_pending;
     bool nv_vmexit_pending;
     bool nv_vmswitch_in_progress; /* true during vmentry/vmexit emulation */
@@ -152,8 +145,6 @@ struct hvm_vcpu {
     /* (MFN) hypervisor page table */
     pagetable_t         monitor_table;
 
-    struct hvm_vcpu_asid n1asid;
-
     u64                 msr_tsc_adjust;
 
     union {
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index f0ec459622..87bf7f8e0f 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -525,6 +525,7 @@ void ept_sync_domain(struct p2m_domain *p2m);
 
 static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
 {
+    struct domain *d = v->domain;
     int type = INVVPID_INDIVIDUAL_ADDR;
 
     /*
@@ -544,7 +545,7 @@ static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
         type = INVVPID_ALL_CONTEXT;
 
 execute_invvpid:
-    __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
+    __invvpid(type, d->arch.hvm.n1asid.asid, (u64)gva);
 }
 
 static inline void vpid_sync_all(void)
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index d2011fde24..d52af69160 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -739,13 +739,14 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
         if ( !flush_vcpu(v, vcpu_bitmap) )
             continue;
 
-        hvm_asid_flush_vcpu(v);
-
         cpu = read_atomic(&v->dirty_cpu);
         if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )
             __cpumask_set_cpu(cpu, mask);
     }
 
+    printk(XENLOG_INFO "hvm_asid_flush_vcpu called in HAP code");
+    hvm_asid_flush_vcpu(v);
+
     /*
      * Trigger a vmexit on all pCPUs with dirty vCPU state in order to force an
      * ASID/VPID change and hence accomplish a guest TLB flush. Note that vCPUs
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 1739133fc2..c13d1dd080 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1395,7 +1395,8 @@ p2m_flush(struct vcpu *v, struct p2m_domain *p2m)
     ASSERT(v->domain == p2m->domain);
     vcpu_nestedhvm(v).nv_p2m = NULL;
     p2m_flush_table(p2m);
-    hvm_asid_flush_vcpu(v);
+    printk(XENLOG_INFO "hvm_asid_flush_domain called in p2m_flush");
+    hvm_asid_flush_domain(v->domain);
 }
 
 void
@@ -1573,8 +1574,7 @@ void np2m_schedule(int dir)
         {
             if ( !np2m_valid )
             {
-                /* This vCPU's np2m was flushed while it was not runnable */
-                hvm_asid_flush_core();
+                /* This vCPU's np2m was flushed while it was not runnable */ 
                 vcpu_nestedhvm(curr).nv_p2m = NULL;
             }
             else
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index dd47bde5ce..96ce752439 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -964,7 +964,8 @@ void paging_update_nestedmode(struct vcpu *v)
     else
         /* TODO: shadow-on-shadow */
         v->arch.paging.nestedmode = NULL;
-    hvm_asid_flush_vcpu(v);
+    printk(XENLOG_INFO "hvm_flush_doamin called in paging_update_nestedmode");
+    hvm_asid_flush_domain(v->domain);
 }
 
 int __init paging_set_allocation(struct domain *d, unsigned int pages,
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 2a445bb17b..4d3b67eb32 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -305,6 +305,7 @@ int pv_vcpu_initialise(struct vcpu *v)
     struct domain *d = v->domain;
     int rc;
 
+    printk(XENLOG_INFO "pv_vcpu_initialise called for domain %u", d->domain_id);
     ASSERT(!is_idle_domain(d));
 
     rc = pv_create_gdt_ldt_l1tab(v);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eee20bb175..f8b1c2548e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -59,6 +59,7 @@
 #include <asm/microcode.h>
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
+#include <asm/hvm/svm/svm.h>
 
 /* opt_nosmp: If true, secondary processors are ignored. */
 static bool __initdata opt_nosmp;
@@ -2015,6 +2016,15 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         printk(XENLOG_INFO "Parked %u CPUs\n", num_parked);
     smp_cpus_done();
 
+    /* Initialize xen-wide ASID handling */
+    #ifdef CONFIG_HVM
+    for_each_present_cpu ( i )
+    {
+        if ( cpu_has_svm )
+            svm_asid_init();
+    }
+    #endif
+
     do_initcalls();
 
     if ( opt_watchdog ) 
-- 
2.46.0

