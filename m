Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75BA8CE563
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 14:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729463.1134619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAU59-0005L9-9H; Fri, 24 May 2024 12:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729463.1134619; Fri, 24 May 2024 12:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAU59-0005JA-5e; Fri, 24 May 2024 12:31:35 +0000
Received: by outflank-mailman (input) for mailman id 729463;
 Fri, 24 May 2024 12:31:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gspi=M3=bounce.vates.tech=bounce-md_30504962.665088a1.v1-da0278549b014913b2e166d18d4b292c@srs-se1.protection.inumbo.net>)
 id 1sAU57-00051V-Ae
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 12:31:33 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c00e4f2-19c9-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 14:31:30 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4Vm4Cj5TjBzPm0PQQ
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 12:31:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 da0278549b014913b2e166d18d4b292c; Fri, 24 May 2024 12:31:29 +0000
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
X-Inumbo-ID: 8c00e4f2-19c9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1716553889; x=1716814389;
	bh=vQSwGscX7oGUBHgB5gR11ubLD7SNlB1T+5N3wTUTxgQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AWWwB9ddXa9t7TcsC1gN4YLINavWjjn5iVZnWJb+XtrdDlUSOFxkL9PL5GyvwEkPl
	 R2sIV3ExJ53hAMgEh45/VW50LHla6MCXg4clKVNSFtQhBo0YRIHeyDyhp+6dBIWVVO
	 W2qJex6ac831sps+yH4bDzEoMS9XL0n7N9YTg35OcM63CGTzset8bLCTWyU0p1SVIa
	 sS8lFSDPSxioFmy8KLnV28rV+aM6wtoBvXKjNFm7epLDug8LAcGVD9VC6zndz+NfAA
	 RxqO9LHrnKTxtc0zmkFGx2q/oy1kQJKO9Q91On6NylJ5mO4j9QCnMIS2boqM/K6Ofx
	 Qt/9jNj83GUGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1716553889; x=1716814389; i=vaishali.thakkar@vates.tech;
	bh=vQSwGscX7oGUBHgB5gR11ubLD7SNlB1T+5N3wTUTxgQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=teUPaiNHVWeCSKcs1oZc2IoX4tLO0+6BSrIGRBtrRe+zEby2l/NwPFNvhDq/n8liA
	 42Oj2e4Gv0N3ktdJiEDfx2ac2037FphrMFkMYdLM8skS93qlUfRiiorkCz+EU48nEQ
	 wEkzNtLv1UxMz7QUzyi456ZFx1rPQ6UAEXs9yJnnd8BWKi/KrEr0DGwwhnXS+TtNQq
	 XhJR6RFrIgDXaMbD0fYEojk3JT8/wFTN6LNZBUNuYcjeQsFGgE0wFgtnRD5BY0QD+5
	 sr+8tQX+zxVPwagEq67LyyvDtQz86rPPf/mtQNQOWr+W2ySs47t4FOgdshyVVfnjJS
	 Tr7SSGNXHiphA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[RFC=20for-4.20=20v1=201/1]=20x86/hvm:=20Introduce=20Xen-wide=20ASID=20Allocator?=
X-Mailer: git-send-email 2.45.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1716553888282
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, george.dunlap@citrix.com, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <f15042aa7953d986b6dbd4dc1512024ba6362420.1716551380.git.vaishali.thakkar@vates.tech>
In-Reply-To: <cover.1716551380.git.vaishali.thakkar@vates.tech>
References: <cover.1716551380.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.da0278549b014913b2e166d18d4b292c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240524:md
Date: Fri, 24 May 2024 12:31:29 +0000
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
 xen/arch/x86/flushtlb.c                |  1 -
 xen/arch/x86/hvm/asid.c                | 61 ++++++++++++++------------
 xen/arch/x86/hvm/emulate.c             |  3 --
 xen/arch/x86/hvm/hvm.c                 |  2 +-
 xen/arch/x86/hvm/nestedhvm.c           |  4 +-
 xen/arch/x86/hvm/svm/asid.c            | 28 +++++++-----
 xen/arch/x86/hvm/svm/nestedsvm.c       |  2 +-
 xen/arch/x86/hvm/svm/svm.c             | 33 ++++++--------
 xen/arch/x86/hvm/svm/svm.h             |  1 -
 xen/arch/x86/hvm/vmx/vmcs.c            |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c             | 15 +++----
 xen/arch/x86/hvm/vmx/vvmx.c            |  6 +--
 xen/arch/x86/include/asm/hvm/asid.h    | 19 ++++----
 xen/arch/x86/include/asm/hvm/domain.h  |  1 +
 xen/arch/x86/include/asm/hvm/hvm.h     |  2 +-
 xen/arch/x86/include/asm/hvm/svm/svm.h |  1 +
 xen/arch/x86/include/asm/hvm/vcpu.h    |  6 +--
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |  3 +-
 xen/arch/x86/mm/hap/hap.c              |  4 +-
 xen/arch/x86/mm/p2m.c                  |  6 +--
 xen/arch/x86/mm/paging.c               |  2 +-
 xen/arch/x86/setup.c                   |  7 +++
 22 files changed, 108 insertions(+), 101 deletions(-)

diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 18748b2bc8..69d72944d7 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -124,7 +124,6 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4)
 
     if ( tlb_clk_enabled )
         t = pre_flush();
-    hvm_flush_guest_tlbs();
 
     old_cr4 = read_cr4();
     ASSERT(!(old_cr4 & X86_CR4_PCIDE) || !(old_cr4 & X86_CR4_PGE));
diff --git a/xen/arch/x86/hvm/asid.c b/xen/arch/x86/hvm/asid.c
index 8d27b7dba1..f343bfcdb9 100644
--- a/xen/arch/x86/hvm/asid.c
+++ b/xen/arch/x86/hvm/asid.c
@@ -27,8 +27,8 @@ boolean_param("asid", opt_asid_enabled);
  * the TLB.
  *
  * Sketch of the Implementation:
- *
- * ASIDs are a CPU-local resource.  As preemption of ASIDs is not possible,
+ * TODO(vaishali): Update this comment
+ * ASIDs are Xen-wide resource.  As preemption of ASIDs is not possible,
  * ASIDs are assigned in a round-robin scheme.  To minimize the overhead of
  * ASID invalidation, at the time of a TLB flush,  ASIDs are tagged with a
  * 64-bit generation.  Only on a generation overflow the code needs to
@@ -38,20 +38,21 @@ boolean_param("asid", opt_asid_enabled);
  * ASID useage to retain correctness.
  */
 
-/* Per-CPU ASID management. */
+/* Xen-wide ASID management */
 struct hvm_asid_data {
-   uint64_t core_asid_generation;
+   uint64_t asid_generation;
    uint32_t next_asid;
    uint32_t max_asid;
+   uint32_t min_asid;
    bool disabled;
 };
 
-static DEFINE_PER_CPU(struct hvm_asid_data, hvm_asid_data);
+static struct hvm_asid_data asid_data;
 
 void hvm_asid_init(int nasids)
 {
     static int8_t g_disabled = -1;
-    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
+    struct hvm_asid_data *data = &asid_data;
 
     data->max_asid = nasids - 1;
     data->disabled = !opt_asid_enabled || (nasids <= 1);
@@ -64,67 +65,73 @@ void hvm_asid_init(int nasids)
     }
 
     /* Zero indicates 'invalid generation', so we start the count at one. */
-    data->core_asid_generation = 1;
+    data->asid_generation = 1;
 
     /* Zero indicates 'ASIDs disabled', so we start the count at one. */
     data->next_asid = 1;
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
+    //hvm_asid_flush_domain_asid(&vcpu_nestedhvm(v).nv_n2asid);
 }
 
-void hvm_asid_flush_core(void)
+void hvm_asid_flush_all(void)
 {
-    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
+    struct hvm_asid_data *data = &asid_data;
 
-    if ( data->disabled )
+    if ( data->disabled)
         return;
 
-    if ( likely(++data->core_asid_generation != 0) )
+    if ( likely(++data->asid_generation != 0) )
         return;
 
     /*
-     * ASID generations are 64 bit.  Overflow of generations never happens.
-     * For safety, we simply disable ASIDs, so correctness is established; it
-     * only runs a bit slower.
-     */
+    * ASID generations are 64 bit.  Overflow of generations never happens.
+    * For safety, we simply disable ASIDs, so correctness is established; it
+    * only runs a bit slower.
+    */
     printk("HVM: ASID generation overrun. Disabling ASIDs.\n");
     data->disabled = 1;
 }
 
-bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid)
+/* This function is called only when first vmenter happens after creating a new domain */
+bool hvm_asid_handle_vmenter(struct hvm_domain_asid *asid)
 {
-    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
+    struct hvm_asid_data *data = &asid_data;
 
     /* On erratum #170 systems we must flush the TLB. 
      * Generation overruns are taken here, too. */
     if ( data->disabled )
         goto disabled;
 
-    /* Test if VCPU has valid ASID. */
-    if ( read_atomic(&asid->generation) == data->core_asid_generation )
+    /* Test if domain has valid ASID. */
+    if ( read_atomic(&asid->generation) == data->asid_generation )
         return 0;
 
     /* If there are no free ASIDs, need to go to a new generation */
     if ( unlikely(data->next_asid > data->max_asid) )
     {
-        hvm_asid_flush_core();
+        // TODO(vaishali): Add a check to pick the asid from the reclaimable asids if any
+        hvm_asid_flush_all();
         data->next_asid = 1;
         if ( data->disabled )
             goto disabled;
     }
 
-    /* Now guaranteed to be a free ASID. */
-    asid->asid = data->next_asid++;
-    write_atomic(&asid->generation, data->core_asid_generation);
+    /* Now guaranteed to be a free ASID. Only assign a new asid if the ASID is 1 */
+    if (asid->asid == 0)
+    {
+        asid->asid = data->next_asid++;
+    }
+
+    write_atomic(&asid->generation, data->asid_generation);
 
     /*
      * When we assign ASID 1, flush all TLB entries as we are starting a new
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 02e378365b..9b8bdd311e 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2519,10 +2519,7 @@ static int cf_check hvmemul_tlb_op(
 
     case x86emul_invpcid:
         if ( x86emul_invpcid_type(aux) != X86_INVPCID_INDIV_ADDR )
-        {
-            hvm_asid_flush_vcpu(current);
             break;
-        }
         aux = x86emul_invpcid_pcid(aux);
         /* fall through */
     case x86emul_invlpga:
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2c66fe0f7a..65e63b736b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1569,7 +1569,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
     int rc;
     struct domain *d = v->domain;
 
-    hvm_asid_flush_vcpu(v);
+    //hvm_asid_flush_vcpu(v);
 
     spin_lock_init(&v->arch.hvm.tm_lock);
     INIT_LIST_HEAD(&v->arch.hvm.tm_list);
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index 451c4da6d4..49e54d0a8c 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -41,7 +41,7 @@ nestedhvm_vcpu_reset(struct vcpu *v)
     nv->stale_np2m = false;
     nv->np2m_generation = 0;
 
-    hvm_asid_flush_vcpu_asid(&nv->nv_n2asid);
+    //hvm_asid_flush_vcpu_asid(&nv->nv_n2asid);
 
     alternative_vcall(hvm_funcs.nhvm_vcpu_reset, v);
 
@@ -86,7 +86,7 @@ static void cf_check nestedhvm_flushtlb_ipi(void *info)
      * This is cheaper than flush_tlb_local() and has
      * the same desired effect.
      */
-    hvm_asid_flush_core();
+    // hvm_asid_flush_core();
     vcpu_nestedhvm(v).nv_p2m = NULL;
     vcpu_nestedhvm(v).stale_np2m = true;
 }
diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 7977a8e86b..9a4fc6c328 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -7,31 +7,35 @@
 #include <asm/amd.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/svm/svm.h>
-
+#include <asm/processor.h>
 #include "svm.h"
+#include "xen/cpumask.h"
 
-void svm_asid_init(const struct cpuinfo_x86 *c)
+void svm_asid_init(void)
 {
+    unsigned int cpu = smp_processor_id();
+    const struct cpuinfo_x86 *c;
     int nasids = 0;
 
-    /* Check for erratum #170, and leave ASIDs disabled if it's present. */
-    if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
-        nasids = cpuid_ebx(0x8000000aU);
-
+    for_each_online_cpu( cpu ) {
+        c = &cpu_data[cpu];
+        /* Check for erratum #170, and leave ASIDs disabled if it's present. */
+        if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
+            nasids += cpuid_ebx(0x8000000aU);
+    }
     hvm_asid_init(nasids);
 }
 
 /*
- * Called directly before VMRUN.  Checks if the VCPU needs a new ASID,
+ * Called directly before first VMRUN.  Checks if the domain needs an ASID,
  * assigns it, and if required, issues required TLB flushes.
  */
 void svm_asid_handle_vmrun(void)
 {
-    struct vcpu *curr = current;
-    struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
-    struct hvm_vcpu_asid *p_asid =
-        nestedhvm_vcpu_in_guestmode(curr)
-        ? &vcpu_nestedhvm(curr).nv_n2asid : &curr->arch.hvm.n1asid;
+    struct vcpu *v = current;
+    struct domain *d = current->domain;
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct hvm_domain_asid *p_asid = &d->arch.hvm.n1asid;
     bool need_flush = hvm_asid_handle_vmenter(p_asid);
 
     /* ASID 0 indicates that ASIDs are disabled. */
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 35a2cbfd7d..08da1f7e84 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -699,7 +699,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     if ( svm->ns_asid != vmcb_get_asid(ns_vmcb))
     {
         nv->nv_flushp2m = 1;
-        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
+//        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
         svm->ns_asid = vmcb_get_asid(ns_vmcb);
     }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index db530d55f2..61f1ad3085 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -179,17 +179,15 @@ static void cf_check svm_update_guest_cr(
         break;
     case 3:
         vmcb_set_cr3(vmcb, v->arch.hvm.hw_cr[3]);
-        if ( !nestedhvm_enabled(v->domain) )
+        /*if ( !nestedhvm_enabled(v->domain) )
         {
             if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
                 hvm_asid_flush_vcpu(v);
-        }
-        else if ( nestedhvm_vmswitch_in_progress(v) )
+        }*/
+        if ( nestedhvm_vmswitch_in_progress(v) )
             ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB. */
-        else if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-            hvm_asid_flush_vcpu_asid(
-                nestedhvm_vcpu_in_guestmode(v)
-                ? &vcpu_nestedhvm(v).nv_n2asid : &v->arch.hvm.n1asid);
+        /*else if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
+            hvm_asid_flush_vcpu_asid(&v->arch.hvm.n1asid);*/
         break;
     case 4:
         value = HVM_CR4_HOST_MASK;
@@ -988,8 +986,8 @@ static void noreturn cf_check svm_do_resume(void)
         v->arch.hvm.svm.launch_core = smp_processor_id();
         hvm_migrate_timers(v);
         hvm_migrate_pirqs(v);
-        /* Migrating to another ASID domain.  Request a new ASID. */
-        hvm_asid_flush_vcpu(v);
+        /* Migrating to another ASID domain. Request a new ASID. */
+        hvm_asid_flush_domain(v->domain);
     }
 
     if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
@@ -1570,9 +1568,6 @@ static int _svm_cpu_up(bool bsp)
     /* check for erratum 383 */
     svm_init_erratum_383(c);
 
-    /* Initialize core's ASID handling. */
-    svm_asid_init(c);
-
     /* Initialize OSVW bits to be used by guests */
     svm_host_osvw_init();
 
@@ -2331,13 +2326,11 @@ static void svm_vmexit_do_invalidate_cache(struct cpu_user_regs *regs,
     __update_guest_eip(regs, inst_len);
 }
 
+//TODO(vaishali): Handle for nested virtualization as well
 static void svm_invlpga_intercept(
-    struct vcpu *v, unsigned long linear, uint32_t asid)
+    struct domain *d, unsigned long linear, uint32_t asid)
 {
-    svm_invlpga(linear,
-                (asid == 0)
-                ? v->arch.hvm.n1asid.asid
-                : vcpu_nestedhvm(v).nv_n2asid.asid);
+    svm_invlpga(linear, d->arch.hvm.n1asid.asid);
 }
 
 static void svm_invlpg_intercept(unsigned long linear)
@@ -2358,8 +2351,9 @@ static bool cf_check is_invlpg(
 
 static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
 {
+    v = current;
     /* Safe fallback. Take a new ASID. */
-    hvm_asid_flush_vcpu(v);
+    hvm_asid_flush_domain(v->domain);
 }
 
 static bool cf_check svm_get_pending_event(
@@ -2533,6 +2527,7 @@ void asmlinkage svm_vmexit_handler(void)
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     uint64_t exit_reason;
     struct vcpu *v = current;
+    struct domain *d = current->domain;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     int insn_len, rc;
     vintr_t intr;
@@ -2927,7 +2922,7 @@ void asmlinkage svm_vmexit_handler(void)
         }
         if ( (insn_len = svm_get_insn_len(v, INSTR_INVLPGA)) == 0 )
             break;
-        svm_invlpga_intercept(v, regs->rax, regs->ecx);
+        svm_invlpga_intercept(d, regs->rax, regs->ecx);
         __update_guest_eip(regs, insn_len);
         break;
 
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index 8dbf37ff49..be6e5aa3e5 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -15,7 +15,6 @@ struct cpu_user_regs;
 struct cpuinfo_x86;
 struct vcpu;
 
-void svm_asid_init(const struct cpuinfo_x86 *c);
 void svm_asid_handle_vmrun(void);
 
 unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 9b6dc51f36..3f6f2f205a 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1956,7 +1956,7 @@ void cf_check vmx_do_resume(void)
          */
         v->arch.hvm.vmx.hostenv_migrated = 1;
 
-        hvm_asid_flush_vcpu(v);
+        hvm_asid_flush_domain(v->domain);
     }
 
     debug_state = v->domain->debugger_attached
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 8ba996546f..5f25ed8b10 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1467,7 +1467,8 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
             vmx_set_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
 
             wbinvd();               /* flush possibly polluted cache */
-            hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TLB */
+            // TODO(vaishali): Is it still correct to flush here?
+            hvm_asid_flush_domain(v->domain); /* invalidate memory type cached in TLB */
             v->arch.hvm.cache_mode = NO_FILL_CACHE_MODE;
         }
         else
@@ -1476,7 +1477,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
             vmx_set_guest_pat(v, *pat);
             if ( !is_iommu_enabled(v->domain) || iommu_snoop )
                 vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
-            hvm_asid_flush_vcpu(v); /* no need to flush cache */
+            /*hvm_asid_flush_vcpu(v);  no need to flush cache */
         }
     }
 }
@@ -1836,8 +1837,6 @@ static void cf_check vmx_update_guest_cr(
 
         __vmwrite(GUEST_CR3, v->arch.hvm.hw_cr[3]);
 
-        if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-            hvm_asid_flush_vcpu(v);
         break;
 
     default:
@@ -4820,7 +4819,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
     u32 new_asid, old_asid;
-    struct hvm_vcpu_asid *p_asid;
+    struct hvm_domain_asid *p_asid;
     bool need_flush;
 
     ASSERT(hvmemul_cache_disabled(curr));
@@ -4834,10 +4833,10 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
 
     if ( !cpu_has_vmx_vpid )
         goto out;
-    if ( nestedhvm_vcpu_in_guestmode(curr) )
+/*    if ( nestedhvm_vcpu_in_guestmode(curr) )
         p_asid = &vcpu_nestedhvm(curr).nv_n2asid;
-    else
-        p_asid = &curr->arch.hvm.n1asid;
+    else*/
+        p_asid = &currd->arch.hvm.n1asid;
 
     old_asid = p_asid->asid;
     need_flush = hvm_asid_handle_vmenter(p_asid);
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 39290c9861..168173a26b 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1254,7 +1254,7 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
 
         if ( nvmx->guest_vpid != new_vpid )
         {
-            hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
+//            hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
             nvmx->guest_vpid = new_vpid;
         }
     }
@@ -2055,8 +2055,8 @@ static int nvmx_handle_invvpid(struct cpu_user_regs *regs)
     case INVVPID_INDIVIDUAL_ADDR:
     case INVVPID_SINGLE_CONTEXT:
     case INVVPID_ALL_CONTEXT:
-        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(current).nv_n2asid);
-        break;
+  //      hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(current).nv_n2asid);
+      break;
     default:
         vmfail(regs, VMX_INSN_INVEPT_INVVPID_INVALID_OP);
         return X86EMUL_OKAY;
diff --git a/xen/arch/x86/include/asm/hvm/asid.h b/xen/arch/x86/include/asm/hvm/asid.h
index 17c58353d1..65c702f809 100644
--- a/xen/arch/x86/include/asm/hvm/asid.h
+++ b/xen/arch/x86/include/asm/hvm/asid.h
@@ -8,25 +8,24 @@
 #ifndef __ASM_X86_HVM_ASID_H__
 #define __ASM_X86_HVM_ASID_H__
 
+struct hvm_domain;
+struct hvm_domain_asid;
 
-struct vcpu;
-struct hvm_vcpu_asid;
-
-/* Initialise ASID management for the current physical CPU. */
+/* Initialise ASID management distributed across all CPUs. */
 void hvm_asid_init(int nasids);
 
 /* Invalidate a particular ASID allocation: forces re-allocation. */
-void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid);
+void hvm_asid_flush_domain_asid(struct hvm_domain_asid *asid);
 
-/* Invalidate all ASID allocations for specified VCPU: forces re-allocation. */
-void hvm_asid_flush_vcpu(struct vcpu *v);
+/* Invalidate all ASID allocations for specified domain */
+void hvm_asid_flush_domain(struct domain *d);
 
-/* Flush all ASIDs on this processor core. */
-void hvm_asid_flush_core(void);
+/* Flush all ASIDs on all processor cores */
+void hvm_asid_flush_all(void);
 
 /* Called before entry to guest context. Checks ASID allocation, returns a
  * boolean indicating whether all ASIDs must be flushed. */
-bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid);
+bool hvm_asid_handle_vmenter(struct hvm_domain_asid *asid);
 
 #endif /* __ASM_X86_HVM_ASID_H__ */
 
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index dd9d837e84..2d02e227fc 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -141,6 +141,7 @@ struct hvm_domain {
     } write_map;
 
     struct hvm_pi_ops pi_ops;
+    struct hvm_domain_asid n1asid;
 
     union {
         struct vmx_domain vmx;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 1c01e22c8e..1ab816c48a 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -464,7 +464,7 @@ static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset,
 static inline void hvm_flush_guest_tlbs(void)
 {
     if ( hvm_enabled )
-        hvm_asid_flush_core();
+        hvm_asid_flush_all();
 }
 
 static inline unsigned int
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 4eeeb25da9..19b79c490f 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -21,6 +21,7 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
                    unsigned long fs_base, unsigned long gs_base,
                    unsigned long gs_shadow);
 
+extern void svm_asid_init(void);
 extern u32 svm_feature_flags;
 
 #define SVM_FEATURE_NPT            0 /* Nested page table support */
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 64c7a6fede..b185522611 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -17,7 +17,7 @@
 #include <asm/mtrr.h>
 #include <public/hvm/ioreq.h>
 
-struct hvm_vcpu_asid {
+struct hvm_domain_asid {
     uint64_t generation;
     uint32_t asid;
 };
@@ -90,7 +90,7 @@ struct nestedvcpu {
     bool stale_np2m; /* True when p2m_base in VMCx02 is no longer valid */
     uint64_t np2m_generation;
 
-    struct hvm_vcpu_asid nv_n2asid;
+    // struct hvm_vcpu_asid nv_n2asid;
 
     bool nv_vmentry_pending;
     bool nv_vmexit_pending;
@@ -152,8 +152,6 @@ struct hvm_vcpu {
     /* (MFN) hypervisor page table */
     pagetable_t         monitor_table;
 
-    struct hvm_vcpu_asid n1asid;
-
     u64                 msr_tsc_adjust;
 
     union {
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 1489dd05c2..c8a9ca707d 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -525,6 +525,7 @@ void ept_sync_domain(struct p2m_domain *p2m);
 
 static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
 {
+    struct domain *d = current->domain;
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
index d2011fde24..53098c7f8c 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -739,13 +739,13 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
         if ( !flush_vcpu(v, vcpu_bitmap) )
             continue;
 
-        hvm_asid_flush_vcpu(v);
-
         cpu = read_atomic(&v->dirty_cpu);
         if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )
             __cpumask_set_cpu(cpu, mask);
     }
 
+    hvm_asid_flush_domain(d);
+
     /*
      * Trigger a vmexit on all pCPUs with dirty vCPU state in order to force an
      * ASID/VPID change and hence accomplish a guest TLB flush. Note that vCPUs
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index db5d9b6c2a..358e7f677e 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1393,7 +1393,7 @@ p2m_flush(struct vcpu *v, struct p2m_domain *p2m)
     ASSERT(v->domain == p2m->domain);
     vcpu_nestedhvm(v).nv_p2m = NULL;
     p2m_flush_table(p2m);
-    hvm_asid_flush_vcpu(v);
+    hvm_asid_flush_domain(v->domain);
 }
 
 void
@@ -1452,7 +1452,7 @@ static void assign_np2m(struct vcpu *v, struct p2m_domain *p2m)
 
 static void nvcpu_flush(struct vcpu *v)
 {
-    hvm_asid_flush_vcpu(v);
+//    hvm_asid_flush_domain(&v->domain->arch.hvm);
     vcpu_nestedhvm(v).stale_np2m = true;
 }
 
@@ -1572,7 +1572,7 @@ void np2m_schedule(int dir)
             if ( !np2m_valid )
             {
                 /* This vCPU's np2m was flushed while it was not runnable */
-                hvm_asid_flush_core();
+                hvm_asid_flush_all();
                 vcpu_nestedhvm(curr).nv_p2m = NULL;
             }
             else
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index bca320fffa..5e09b84322 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -964,7 +964,7 @@ void paging_update_nestedmode(struct vcpu *v)
     else
         /* TODO: shadow-on-shadow */
         v->arch.paging.nestedmode = NULL;
-    hvm_asid_flush_vcpu(v);
+    hvm_asid_flush_domain(v->domain);
 }
 
 int __init paging_set_allocation(struct domain *d, unsigned int pages,
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b50c9c84af..78f12e7f9e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -59,6 +59,7 @@
 #include <asm/microcode.h>
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
+#include <asm/hvm/svm/svm.h>
 
 /* opt_nosmp: If true, secondary processors are ignored. */
 static bool __initdata opt_nosmp;
@@ -2013,6 +2014,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         printk(XENLOG_INFO "Parked %u CPUs\n", num_parked);
     smp_cpus_done();
 
+    /* Initialize xen-wide ASID handling */
+    #ifdef CONFIG_HVM
+    if ( cpu_has_svm )
+        svm_asid_init();
+    #endif
+
     do_initcalls();
 
     if ( opt_watchdog ) 
-- 
2.45.0

