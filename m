Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBBFAB9A04
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986806.1372321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsDD-0000SS-J4; Fri, 16 May 2025 10:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986806.1372321; Fri, 16 May 2025 10:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsDD-0000QA-GE; Fri, 16 May 2025 10:22:43 +0000
Received: by outflank-mailman (input) for mailman id 986806;
 Fri, 16 May 2025 10:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yArv=YA=bounce.vates.tech=bounce-md_30504962.682711ee.v1-11ea96c549834e75beb56434593a40e2@srs-se1.protection.inumbo.net>)
 id 1uFsDB-0000Q4-Mg
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:22:42 +0000
Received: from mail133-28.atl131.mandrillapp.com
 (mail133-28.atl131.mandrillapp.com [198.2.133.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b16934bb-323f-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 12:22:39 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-28.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZzNSG0vkDzMQxhqx
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 10:22:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 11ea96c549834e75beb56434593a40e2; Fri, 16 May 2025 10:22:38 +0000
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
X-Inumbo-ID: b16934bb-323f-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747390958; x=1747660958;
	bh=+whoNgFeV0mthcIxVXin+w5q5c78yv2JPXRHflVP3O4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DtptuGg/aRRLX8dpxHuFNwc2dtpevXwmsG0oyIWh5sAW61l9B2m5gXC7EHnOhLzem
	 dU7JtdCKc9DMfyLVBqoLI0ltzCltSeYO8xcs7X6l/kLkPKlBM4/cv3n1QaAygbkW0K
	 Un0+WaOatUUEdUs3a1B1xG4kdmgym3gaDqIGASBuYNfMvidQMvB7p9gVIhb1sxjpSg
	 vDvpvSr9xN+pbgwXUn9so8qj1h5k7dA8zWJcD2NJzaCcZjtFyprfoP7qThEuvi/Z10
	 Exnm2bwx3wQsY4z2HY3j1TAQ1hAxuVQca/9Dz7XZ3SU6aLyP56PA6z/Kgffl3Xl7Uj
	 XdfsCtJkOFIZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747390958; x=1747651458; i=teddy.astie@vates.tech;
	bh=+whoNgFeV0mthcIxVXin+w5q5c78yv2JPXRHflVP3O4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Jh6vaneGII+HSnbkaqjnrJ43Xw1nVj3ko0F2rlFGvqoZjDAJ5Xmz9tHZYsBiOd2mI
	 z5D0QiMQg0ED0lP6UpY9hfZkn0JpDQfLOkroujDlnUQOv6zvKN23Eso/Uo8O4I9ybG
	 u0pw6xELoLYHaLByUFd7TagsoOGEYgAO/TwmZbZib8hNmg9STjv3IImTBhEwszVDAU
	 XiniWL0ym90y7fxHcw8UWxrAqhvpE5XUmJqo7yqU+tgqvc+n4DAKIcFZYyoIGEBQ5S
	 rATQsN9HikN+zRycK1wAtfBp2Y0twDAxwtvwmfwyCakY0Z/qtvmvnHE2N3hbfwiMVD
	 u2o/dUQsVGg4A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2007/16]=20x86/hvm:=20Introduce=20Xen-wide=20ASID=20allocator?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747390956490
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Tim Deegan" <tim@xen.org>, "Vaishali Thakkar" <vaishali.thakkar@suse.com>
Message-Id: <9cdb3e67abd01390bcc4cd103ca539d6bf7adbc0.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.11ea96c549834e75beb56434593a40e2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 10:22:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Vaishali Thakkar <vaishali.thakkar@suse.com>

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

Introduce vcpu->needs_tlb_flush attribute to schedule a guest TLB
flush for the next VMRUN/VMENTER. This will be later be done using
either TLB_CONTROL field (AMD) or INVEPT (Intel). This flush method
is used in place of the current ASID swapping logic.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Vaishali Thakkar <vaishali.thakkar@suse.com>
---
TODO:
- Intel: Don't assign the VPID at each VMENTER, though we need
  to rethink how we manage VMCS with nested virtualization / altp2m
  for changing this behavior.
- AMD: Consider hot-plug of CPU with ERRATA_170. (is it possible ?)
- Consider cases where we don't have enough ASIDs (e.g Xen as nested guest)
- Nested virtualization ASID management

This patch currently breaks shadow paging, yet I haven't managed to diagnose
exactly what is happening.

Original changelog :
Changes since v3:
 - Simplified asid bitmap management
   It is only called once per domain, so it doesn't need to have
   a complicated logic.
 - Drop hvm_asid_data structure which doesn't serve a purpose anymore.
 - Introduce and use vcpu->needs_tlb_flush to indicate that a guest TLB
   flush is needed before waking the vcpu. It is used to set
   TLB_CONTROL (AMD) field properly or make a appropriate invept (Intel).
 - Only assign ASID once (see TODO for Intel side)
 - Check the ERRATA_170 for each CPU present.
 - add asid_alloc_range() for allocating within a specific
   range (e.g SEV ASID ranges)

Changes since v2:
 - Moved hvm_asid_domain_create to hvm_domain_initialise
 - Added __ro_after_init for bitmaps
 - Make hvm_asid_init  unsigned int __init
 - Remove functions hvm_asid_flush_domain_asid and hvm_asid_flush_vcpu
 - Mark ASID 0 permenantly
 - Remove the irrelevant tracking of generation
 - Add hvm_domain_asid_destroy to avoid layering violation
 - Remove unnecessary fixups touching the same code
 - Add a logic to move asids from reclaim_bitmap->asid_bitmap
 - Misc styling fixes - remove unncessary trailing spaces/printks

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
 xen/arch/x86/flushtlb.c                |   7 +-
 xen/arch/x86/hvm/asid.c                | 170 +++++++++++--------------
 xen/arch/x86/hvm/emulate.c             |   2 +-
 xen/arch/x86/hvm/hvm.c                 |  14 +-
 xen/arch/x86/hvm/nestedhvm.c           |   7 +-
 xen/arch/x86/hvm/svm/asid.c            |  77 +++++++----
 xen/arch/x86/hvm/svm/nestedsvm.c       |   2 +-
 xen/arch/x86/hvm/svm/svm.c             |  37 +++---
 xen/arch/x86/hvm/svm/svm.h             |   4 -
 xen/arch/x86/hvm/vmx/vmcs.c            |   6 +-
 xen/arch/x86/hvm/vmx/vmx.c             |  68 +++++-----
 xen/arch/x86/hvm/vmx/vvmx.c            |   5 +-
 xen/arch/x86/include/asm/hvm/asid.h    |  26 ++--
 xen/arch/x86/include/asm/hvm/domain.h  |   1 +
 xen/arch/x86/include/asm/hvm/hvm.h     |  15 +--
 xen/arch/x86/include/asm/hvm/svm/svm.h |   5 +
 xen/arch/x86/include/asm/hvm/vcpu.h    |  10 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |   8 +-
 xen/arch/x86/mm/hap/hap.c              |   7 +-
 xen/arch/x86/mm/p2m.c                  |   7 +-
 xen/arch/x86/mm/paging.c               |   2 +-
 xen/arch/x86/mm/shadow/hvm.c           |   1 +
 xen/arch/x86/mm/shadow/multi.c         |   1 +
 xen/include/xen/sched.h                |   2 +
 24 files changed, 238 insertions(+), 246 deletions(-)

diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 1e0011d5b1..9cae828b34 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -13,6 +13,7 @@
 #include <xen/softirq.h>
 #include <asm/cache.h>
 #include <asm/flushtlb.h>
+#include <asm/hvm/hvm.h>
 #include <asm/invpcid.h>
 #include <asm/nops.h>
 #include <asm/page.h>
@@ -124,7 +125,6 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4)
 
     if ( tlb_clk_enabled )
         t = pre_flush();
-    hvm_flush_guest_tlbs();
 
     old_cr4 = read_cr4();
     ASSERT(!(old_cr4 & X86_CR4_PCIDE) || !(old_cr4 & X86_CR4_PGE));
@@ -229,8 +229,9 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
             do_tlb_flush();
     }
 
-    if ( flags & FLUSH_HVM_ASID_CORE )
-        hvm_flush_guest_tlbs();
+    //if ( flags & FLUSH_HVM_ASID_CORE )
+    //    // Needed ?
+    //    hvm_flush_tlb(NULL);
 
     if ( flags & FLUSH_CACHE )
     {
diff --git a/xen/arch/x86/hvm/asid.c b/xen/arch/x86/hvm/asid.c
index 8d27b7dba1..91f8e44210 100644
--- a/xen/arch/x86/hvm/asid.c
+++ b/xen/arch/x86/hvm/asid.c
@@ -8,133 +8,107 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/param.h>
-#include <xen/sched.h>
-#include <xen/smp.h>
-#include <xen/percpu.h>
+#include <xen/spinlock.h>
+#include <xen/xvmalloc.h>
+
 #include <asm/hvm/asid.h>
+#include <asm/bitops.h>
 
 /* Xen command-line option to enable ASIDs */
 static bool __read_mostly opt_asid_enabled = true;
 boolean_param("asid", opt_asid_enabled);
 
+bool __read_mostly asid_enabled = false;
+static unsigned long __ro_after_init *asid_bitmap;
+static unsigned long __ro_after_init asid_count;
+static DEFINE_SPINLOCK(asid_lock);
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
+ * ASIDs are assigned uniquely per domain and doesn't change during
+ * the lifecycle of the domain. Once vcpus are initialized and are up,
+ * we assign the same ASID to all vcpus of that domain at the first VMRUN.
+ * In order to process a TLB flush on a vcpu, we set needs_tlb_flush
+ * to schedule a TLB flush for the next VMRUN (e.g using tlb control field
+ * of VMCB).
  */
 
-/* Per-CPU ASID management. */
-struct hvm_asid_data {
-   uint64_t core_asid_generation;
-   uint32_t next_asid;
-   uint32_t max_asid;
-   bool disabled;
-};
-
-static DEFINE_PER_CPU(struct hvm_asid_data, hvm_asid_data);
-
-void hvm_asid_init(int nasids)
+int __init hvm_asid_init(unsigned long nasids)
 {
-    static int8_t g_disabled = -1;
-    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
+    ASSERT(nasids);
 
-    data->max_asid = nasids - 1;
-    data->disabled = !opt_asid_enabled || (nasids <= 1);
-
-    if ( g_disabled != data->disabled )
-    {
-        printk("HVM: ASIDs %sabled.\n", data->disabled ? "dis" : "en");
-        if ( g_disabled < 0 )
-            g_disabled = data->disabled;
-    }
+    asid_count = nasids;
+    asid_enabled = opt_asid_enabled || (nasids <= 1);
 
-    /* Zero indicates 'invalid generation', so we start the count at one. */
-    data->core_asid_generation = 1;
+    asid_bitmap = xvzalloc_array(unsigned long, BITS_TO_LONGS(asid_count));
+    if ( !asid_bitmap )
+        return -ENOMEM;
 
-    /* Zero indicates 'ASIDs disabled', so we start the count at one. */
-    data->next_asid = 1;
-}
+    printk("HVM: ASIDs %sabled (count=%lu)\n", asid_enabled ? "en" : "dis", asid_count);
 
-void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid)
-{
-    write_atomic(&asid->generation, 0);
-}
+    /* ASID 0 is reserved, mark it as permanently used */
+    set_bit(0, asid_bitmap);
 
-void hvm_asid_flush_vcpu(struct vcpu *v)
-{
-    hvm_asid_flush_vcpu_asid(&v->arch.hvm.n1asid);
-    hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
+    return 0;
 }
 
-void hvm_asid_flush_core(void)
+int hvm_asid_alloc(struct hvm_asid *asid)
 {
-    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
+    unsigned long new_asid;
+    
+    if ( !asid_enabled )
+    {
+        asid->asid = 1;
+        return 0;
+    }
 
-    if ( data->disabled )
-        return;
+    spin_lock(&asid_lock);
+    new_asid = find_first_zero_bit(asid_bitmap, asid_count);
+    if ( new_asid > asid_count )
+        return -ENOSPC;
 
-    if ( likely(++data->core_asid_generation != 0) )
-        return;
+    set_bit(new_asid, asid_bitmap);
 
-    /*
-     * ASID generations are 64 bit.  Overflow of generations never happens.
-     * For safety, we simply disable ASIDs, so correctness is established; it
-     * only runs a bit slower.
-     */
-    printk("HVM: ASID generation overrun. Disabling ASIDs.\n");
-    data->disabled = 1;
+    asid->asid = new_asid;
+    spin_unlock(&asid_lock);
+    return 0;
 }
 
-bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid)
+int hvm_asid_alloc_range(struct hvm_asid *asid, unsigned long min, unsigned long max)
 {
-    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
-
-    /* On erratum #170 systems we must flush the TLB. 
-     * Generation overruns are taken here, too. */
-    if ( data->disabled )
-        goto disabled;
-
-    /* Test if VCPU has valid ASID. */
-    if ( read_atomic(&asid->generation) == data->core_asid_generation )
-        return 0;
+    unsigned long new_asid;
+    
+    if ( WARN_ON(min >= asid_count) )
+        return -EINVAL;
+    
+    if ( !asid_enabled )
+        return -EOPNOTSUPP;
+
+    spin_lock(&asid_lock);
+    new_asid = find_next_zero_bit(asid_bitmap, asid_count, min);
+    if ( new_asid > max || new_asid > asid_count )
+        return -ENOSPC;
+
+    set_bit(new_asid, asid_bitmap);
+
+    asid->asid = new_asid;
+    spin_unlock(&asid_lock);
+    return 0;
+}
 
-    /* If there are no free ASIDs, need to go to a new generation */
-    if ( unlikely(data->next_asid > data->max_asid) )
-    {
-        hvm_asid_flush_core();
-        data->next_asid = 1;
-        if ( data->disabled )
-            goto disabled;
-    }
+void hvm_asid_free(struct hvm_asid *asid)
+{
+    ASSERT( asid->asid );
 
-    /* Now guaranteed to be a free ASID. */
-    asid->asid = data->next_asid++;
-    write_atomic(&asid->generation, data->core_asid_generation);
+    if ( !asid_enabled )
+        return;
 
-    /*
-     * When we assign ASID 1, flush all TLB entries as we are starting a new
-     * generation, and all old ASID allocations are now stale. 
-     */
-    return (asid->asid == 1);
+    ASSERT( asid->asid < asid_count );
 
- disabled:
-    asid->asid = 0;
-    return 0;
+    spin_lock(&asid_lock);
+    WARN_ON(!test_bit(asid->asid, asid_bitmap));
+    clear_bit(asid->asid, asid_bitmap);
+    spin_unlock(&asid_lock);
 }
 
 /*
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 91f004d233..6ed8e03475 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2666,7 +2666,7 @@ static int cf_check hvmemul_tlb_op(
     case x86emul_invpcid:
         if ( x86emul_invpcid_type(aux) != X86_INVPCID_INDIV_ADDR )
         {
-            hvm_asid_flush_vcpu(current);
+            current->needs_tlb_flush = true;
             break;
         }
         aux = x86emul_invpcid_pcid(aux);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0e7c453b24..625ae2098b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -702,6 +702,10 @@ int hvm_domain_initialise(struct domain *d,
     if ( rc )
         goto fail2;
 
+    rc = hvm_asid_alloc(&d->arch.hvm.asid);
+    if ( rc )
+        goto fail2;
+
     rc = alternative_call(hvm_funcs.domain_initialise, d);
     if ( rc != 0 )
         goto fail2;
@@ -782,8 +786,9 @@ void hvm_domain_destroy(struct domain *d)
         list_del(&ioport->list);
         xfree(ioport);
     }
-
+    hvm_asid_free(&d->arch.hvm.asid);
     destroy_vpci_mmcfg(d);
+
 }
 
 static int cf_check hvm_save_tsc_adjust(struct vcpu *v, hvm_domain_context_t *h)
@@ -1603,7 +1608,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
     int rc;
     struct domain *d = v->domain;
 
-    hvm_asid_flush_vcpu(v);
+    v->needs_tlb_flush = true;
 
     spin_lock_init(&v->arch.hvm.tm_lock);
     INIT_LIST_HEAD(&v->arch.hvm.tm_list);
@@ -4145,6 +4150,11 @@ static void hvm_s3_resume(struct domain *d)
     }
 }
 
+int hvm_flush_tlb(const unsigned long *vcpu_bitmap)
+{
+    return current->domain->arch.paging.flush_tlb(vcpu_bitmap);
+}
+
 static int hvmop_flush_tlb_all(void)
 {
     if ( !is_hvm_domain(current->domain) )
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index bddd77d810..61e866b771 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -12,6 +12,7 @@
 #include <asm/hvm/nestedhvm.h>
 #include <asm/event.h>  /* for local_event_delivery_(en|dis)able */
 #include <asm/paging.h> /* for paging_mode_hap() */
+#include <asm/hvm/asid.h>
 
 static unsigned long *shadow_io_bitmap[3];
 
@@ -36,13 +37,11 @@ nestedhvm_vcpu_reset(struct vcpu *v)
     hvm_unmap_guest_frame(nv->nv_vvmcx, 1);
     nv->nv_vvmcx = NULL;
     nv->nv_vvmcxaddr = INVALID_PADDR;
-    nv->nv_flushp2m = 0;
+    nv->nv_flushp2m = true;
     nv->nv_p2m = NULL;
     nv->stale_np2m = false;
     nv->np2m_generation = 0;
 
-    hvm_asid_flush_vcpu_asid(&nv->nv_n2asid);
-
     alternative_vcall(hvm_funcs.nhvm_vcpu_reset, v);
 
     /* vcpu is in host mode */
@@ -86,7 +85,7 @@ static void cf_check nestedhvm_flushtlb_ipi(void *info)
      * This is cheaper than flush_tlb_local() and has
      * the same desired effect.
      */
-    hvm_asid_flush_core();
+    WARN_ON(hvm_flush_tlb(NULL));
     vcpu_nestedhvm(v).nv_p2m = NULL;
     vcpu_nestedhvm(v).stale_np2m = true;
 }
diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 7977a8e86b..1b6def4a4c 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -1,56 +1,77 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * asid.c: handling ASIDs in SVM.
+ * asid.c: handling ASIDs/VPIDs.
  * Copyright (c) 2007, Advanced Micro Devices, Inc.
  */
 
+#include <xen/cpumask.h>
+
 #include <asm/amd.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/svm/svm.h>
+#include <asm/hvm/svm/vmcb.h>
+#include <asm/processor.h>
 
 #include "svm.h"
 
-void svm_asid_init(const struct cpuinfo_x86 *c)
+void __init svm_asid_init(void)
 {
-    int nasids = 0;
+    unsigned int cpu;
+    int nasids = cpuid_ebx(0x8000000aU);
+
+    if ( !nasids )
+        nasids = 1;
 
-    /* Check for erratum #170, and leave ASIDs disabled if it's present. */
-    if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
-        nasids = cpuid_ebx(0x8000000aU);
+    for_each_present_cpu(cpu)
+    {
+        /* Check for erratum #170, and leave ASIDs disabled if it's present. */
+        if ( cpu_has_amd_erratum(&cpu_data[cpu], AMD_ERRATUM_170) )
+        {
+            printk(XENLOG_WARNING "Disabling ASID due to errata 170 on CPU%u\n", cpu);
+            nasids = 1;
+        }
+    }
 
-    hvm_asid_init(nasids);
+    BUG_ON(hvm_asid_init(nasids));
 }
 
 /*
- * Called directly before VMRUN.  Checks if the VCPU needs a new ASID,
- * assigns it, and if required, issues required TLB flushes.
+ * Called directly at the first VMRUN/VMENTER of a vcpu to assign the ASID/VPID.
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
-
-    /* ASID 0 indicates that ASIDs are disabled. */
-    if ( p_asid->asid == 0 )
-    {
-        vmcb_set_asid(vmcb, true);
-        vmcb->tlb_control =
-            cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
-        return;
-    }
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct hvm_asid *p_asid = &v->domain->arch.hvm.asid;
+
+    ASSERT(p_asid->asid);
 
-    if ( vmcb_get_asid(vmcb) != p_asid->asid )
-        vmcb_set_asid(vmcb, p_asid->asid);
+    /* In case ASIDs are disabled, as ASID = 0 is reserved, guest can use 1 instead. */
+    vmcb_set_asid(vmcb, asid_enabled ? p_asid->asid : 1);
+}
+
+/* Call to make a TLB flush at the next VMRUN. */
+void svm_vcpu_set_tlb_control(struct vcpu *v)
+{
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    
+    /*
+     * If the vcpu is already running, the tlb control flag may not be
+     * processed and will be cleared at the next VMEXIT, which will undo
+     * what we are trying to do.
+     */
+    WARN_ON(v != current && v->is_running);
 
     vmcb->tlb_control =
-        !need_flush ? TLB_CTRL_NO_FLUSH :
         cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
 }
 
+void svm_vcpu_clear_tlb_control(struct vcpu *v)
+{
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+
+    vmcb->tlb_control = TLB_CTRL_NO_FLUSH;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index dc2b6a4253..6e5dc2624f 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -5,6 +5,7 @@
  *
  */
 
+#include <asm/hvm/asid.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
@@ -699,7 +700,6 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     if ( svm->ns_asid != vmcb_get_asid(ns_vmcb))
     {
         nv->nv_flushp2m = 1;
-        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
         svm->ns_asid = vmcb_get_asid(ns_vmcb);
     }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index e33a38c1e4..cc19d80fe1 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -26,6 +26,7 @@
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
+#include <asm/hvm/asid.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/vmcb.h>
@@ -183,14 +184,17 @@ static void cf_check svm_update_guest_cr(
         if ( !nestedhvm_enabled(v->domain) )
         {
             if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-                hvm_asid_flush_vcpu(v);
+                v->needs_tlb_flush = true;
         }
         else if ( nestedhvm_vmswitch_in_progress(v) )
             ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB. */
         else if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-            hvm_asid_flush_vcpu_asid(
-                nestedhvm_vcpu_in_guestmode(v)
-                ? &vcpu_nestedhvm(v).nv_n2asid : &v->arch.hvm.n1asid);
+        {
+            if (nestedhvm_vcpu_in_guestmode(v))
+                vcpu_nestedhvm(v).nv_flushp2m = true;
+            else
+                v->needs_tlb_flush = true;
+        }
         break;
     case 4:
         value = HVM_CR4_HOST_MASK;
@@ -991,8 +995,7 @@ static void noreturn cf_check svm_do_resume(void)
         v->arch.hvm.svm.launch_core = smp_processor_id();
         hvm_migrate_timers(v);
         hvm_migrate_pirqs(v);
-        /* Migrating to another ASID domain.  Request a new ASID. */
-        hvm_asid_flush_vcpu(v);
+        v->needs_tlb_flush = true;
     }
 
     if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
@@ -1019,13 +1022,14 @@ void asmlinkage svm_vmenter_helper(void)
 
     ASSERT(hvmemul_cache_disabled(curr));
 
-    svm_asid_handle_vmrun();
-
     TRACE_TIME(TRC_HVM_VMENTRY |
                (nestedhvm_vcpu_in_guestmode(curr) ? TRC_HVM_NESTEDFLAG : 0));
 
     svm_sync_vmcb(curr, vmcb_needs_vmsave);
 
+    if ( test_and_clear_bool(curr->needs_tlb_flush) )
+        svm_vcpu_set_tlb_control(curr);
+
     vmcb->rax = regs->rax;
     vmcb->rip = regs->rip;
     vmcb->rsp = regs->rsp;
@@ -1146,6 +1150,8 @@ static int cf_check svm_vcpu_initialise(struct vcpu *v)
         return rc;
     }
 
+    svm_vcpu_assign_asid(v);
+
     return 0;
 }
 
@@ -1572,9 +1578,6 @@ static int _svm_cpu_up(bool bsp)
     /* check for erratum 383 */
     svm_init_erratum_383(c);
 
-    /* Initialize core's ASID handling. */
-    svm_asid_init(c);
-
     /* Initialize OSVW bits to be used by guests */
     svm_host_osvw_init();
 
@@ -2338,7 +2341,7 @@ static void svm_invlpga_intercept(
 {
     svm_invlpga(linear,
                 (asid == 0)
-                ? v->arch.hvm.n1asid.asid
+                ? v->domain->arch.hvm.asid.asid
                 : vcpu_nestedhvm(v).nv_n2asid.asid);
 }
 
@@ -2360,8 +2363,8 @@ static bool cf_check is_invlpg(
 
 static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
 {
-    /* Safe fallback. Take a new ASID. */
-    hvm_asid_flush_vcpu(v);
+    /* Schedule a tlb flush on the VCPU. */
+    v->needs_tlb_flush = true;
 }
 
 static bool cf_check svm_get_pending_event(
@@ -2528,6 +2531,8 @@ const struct hvm_function_table * __init start_svm(void)
     svm_function_table.caps.hap_superpage_2mb = true;
     svm_function_table.caps.hap_superpage_1gb = cpu_has_page1gb;
 
+    svm_asid_init();
+
     return &svm_function_table;
 }
 
@@ -2584,6 +2589,8 @@ void asmlinkage svm_vmexit_handler(void)
                    (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0x0F));
     }
 
+    svm_vcpu_clear_tlb_control(v);
+
     exit_reason = vmcb->exitcode;
 
     if ( hvm_long_mode_active(v) )
@@ -2659,7 +2666,7 @@ void asmlinkage svm_vmexit_handler(void)
         }
     }
 
-    if ( unlikely(exit_reason == VMEXIT_INVALID) )
+    if ( unlikely(exit_reason == VMEXIT_INVALID || exit_reason == (uint32_t)VMEXIT_INVALID) )
     {
         gdprintk(XENLOG_ERR, "invalid VMCB state:\n");
         svm_vmcb_dump(__func__, vmcb);
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index f5b0312d2d..92145c6d7b 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -12,12 +12,8 @@
 #include <xen/types.h>
 
 struct cpu_user_regs;
-struct cpuinfo_x86;
 struct vcpu;
 
-void svm_asid_init(const struct cpuinfo_x86 *c);
-void svm_asid_handle_vmrun(void);
-
 unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
 void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index a44475ae15..b8a28e2cf8 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -20,6 +20,7 @@
 #include <asm/current.h>
 #include <asm/flushtlb.h>
 #include <asm/hvm/hvm.h>
+#include <asm/hvm/asid.h>
 #include <asm/hvm/io.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/vmx/vmcs.h>
@@ -759,8 +760,6 @@ static int _vmx_cpu_up(bool bsp)
 
     this_cpu(vmxon) = 1;
 
-    hvm_asid_init(cpu_has_vmx_vpid ? (1u << VMCS_VPID_WIDTH) : 0);
-
     if ( cpu_has_vmx_ept )
         ept_sync_all();
 
@@ -1941,7 +1940,7 @@ void cf_check vmx_do_resume(void)
          */
         v->arch.hvm.vmx.hostenv_migrated = 1;
 
-        hvm_asid_flush_vcpu(v);
+        v->needs_tlb_flush = true;
     }
 
     debug_state = v->domain->debugger_attached
@@ -2154,7 +2153,6 @@ void vmcs_dump_vcpu(struct vcpu *v)
          (SECONDARY_EXEC_ENABLE_VPID | SECONDARY_EXEC_ENABLE_VM_FUNCTIONS) )
         printk("Virtual processor ID = 0x%04x VMfunc controls = %016lx\n",
                vmr16(VIRTUAL_PROCESSOR_ID), vmr(VM_FUNCTION_CONTROL));
-
     vmx_vmcs_exit(v);
 }
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 827db6bdd8..8859ec4b38 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -37,6 +37,7 @@
 #include <asm/x86_emulate.h>
 #include <asm/hvm/vpt.h>
 #include <public/hvm/save.h>
+#include <asm/hvm/asid.h>
 #include <asm/hvm/monitor.h>
 #include <asm/xenoprof.h>
 #include <asm/gdbsx.h>
@@ -824,6 +825,18 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
         vmx_update_secondary_exec_control(v);
     }
 
+    if ( asid_enabled )
+    {
+        v->arch.hvm.vmx.secondary_exec_control |= SECONDARY_EXEC_ENABLE_VPID;
+        vmx_update_secondary_exec_control(v);
+    }
+    else
+    {
+        v->arch.hvm.vmx.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VPID;
+        vmx_update_secondary_exec_control(v);
+    }
+
+
     /*
      * We can safely pass MSR_SPEC_CTRL through to the guest, even if STIBP
      * isn't enumerated in hardware, as SPEC_CTRL_STIBP is ignored.
@@ -1477,7 +1490,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
             vmx_set_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
 
             wbinvd();               /* flush possibly polluted cache */
-            hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TLB */
+            v->needs_tlb_flush = true; /* invalidate memory type cached in TLB */
             v->arch.hvm.cache_mode = NO_FILL_CACHE_MODE;
         }
         else
@@ -1486,7 +1499,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
             vmx_set_guest_pat(v, *pat);
             if ( !is_iommu_enabled(v->domain) || iommu_snoop )
                 vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
-            hvm_asid_flush_vcpu(v); /* no need to flush cache */
+            v->needs_tlb_flush = true;
         }
     }
 }
@@ -1847,7 +1860,7 @@ static void cf_check vmx_update_guest_cr(
         __vmwrite(GUEST_CR3, v->arch.hvm.hw_cr[3]);
 
         if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-            hvm_asid_flush_vcpu(v);
+            v->needs_tlb_flush = true;
         break;
 
     default:
@@ -3128,6 +3141,8 @@ const struct hvm_function_table * __init start_vmx(void)
     lbr_tsx_fixup_check();
     ler_to_fixup_check();
 
+    BUG_ON(hvm_asid_init(cpu_has_vmx_vpid ? (1u << VMCS_VPID_WIDTH) : 1));
+
     return &vmx_function_table;
 }
 
@@ -4901,9 +4916,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
-    u32 new_asid, old_asid;
-    struct hvm_vcpu_asid *p_asid;
-    bool need_flush;
+    struct hvm_asid *p_asid;
 
     ASSERT(hvmemul_cache_disabled(curr));
 
@@ -4914,38 +4927,14 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
     if ( curr->domain->arch.hvm.pi_ops.vcpu_block )
         vmx_pi_do_resume(curr);
 
-    if ( !cpu_has_vmx_vpid )
+    if ( !asid_enabled )
         goto out;
     if ( nestedhvm_vcpu_in_guestmode(curr) )
         p_asid = &vcpu_nestedhvm(curr).nv_n2asid;
     else
-        p_asid = &curr->arch.hvm.n1asid;
-
-    old_asid = p_asid->asid;
-    need_flush = hvm_asid_handle_vmenter(p_asid);
-    new_asid = p_asid->asid;
-
-    if ( unlikely(new_asid != old_asid) )
-    {
-        __vmwrite(VIRTUAL_PROCESSOR_ID, new_asid);
-        if ( !old_asid && new_asid )
-        {
-            /* VPID was disabled: now enabled. */
-            curr->arch.hvm.vmx.secondary_exec_control |=
-                SECONDARY_EXEC_ENABLE_VPID;
-            vmx_update_secondary_exec_control(curr);
-        }
-        else if ( old_asid && !new_asid )
-        {
-            /* VPID was enabled: now disabled. */
-            curr->arch.hvm.vmx.secondary_exec_control &=
-                ~SECONDARY_EXEC_ENABLE_VPID;
-            vmx_update_secondary_exec_control(curr);
-        }
-    }
+        p_asid = &currd->arch.hvm.asid;
 
-    if ( unlikely(need_flush) )
-        vpid_sync_all();
+    __vmwrite(VIRTUAL_PROCESSOR_ID, p_asid->asid);
 
     if ( paging_mode_hap(curr->domain) )
     {
@@ -4954,12 +4943,18 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
         unsigned int inv = 0; /* None => Single => All */
         struct ept_data *single = NULL; /* Single eptp, iff inv == 1 */
 
+        if ( test_and_clear_bool(curr->needs_tlb_flush)  )
+        {
+            inv = 1;
+            single = ept;
+        }
+
         if ( cpumask_test_cpu(cpu, ept->invalidate) )
         {
             cpumask_clear_cpu(cpu, ept->invalidate);
 
             /* Automatically invalidate all contexts if nested. */
-            inv += 1 + nestedhvm_enabled(currd);
+            inv = 1 + nestedhvm_enabled(currd);
             single = ept;
         }
 
@@ -4986,6 +4981,11 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
             __invept(inv == 1 ? INVEPT_SINGLE_CONTEXT : INVEPT_ALL_CONTEXT,
                      inv == 1 ? single->eptp          : 0);
     }
+    else /* Shadow paging */
+    {
+        if ( test_and_clear_bool(curr->needs_tlb_flush) )
+            vpid_sync_vcpu_context(curr);
+    }
 
  out:
     if ( unlikely(curr->arch.hvm.vmx.lbr_flags & LBR_FIXUP_MASK) )
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index ceb5e5a322..fa84ee4e8f 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -12,6 +12,7 @@
 
 #include <asm/mtrr.h>
 #include <asm/p2m.h>
+#include <asm/hvm/hvm.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vvmx.h>
@@ -1254,7 +1255,7 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
 
         if ( nvmx->guest_vpid != new_vpid )
         {
-            hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
+            v->needs_tlb_flush = true;
             nvmx->guest_vpid = new_vpid;
         }
     }
@@ -2055,7 +2056,7 @@ static int nvmx_handle_invvpid(struct cpu_user_regs *regs)
     case INVVPID_INDIVIDUAL_ADDR:
     case INVVPID_SINGLE_CONTEXT:
     case INVVPID_ALL_CONTEXT:
-        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(current).nv_n2asid);
+        hvm_flush_tlb(NULL);
         break;
     default:
         vmfail(regs, VMX_INSN_INVEPT_INVVPID_INVALID_OP);
diff --git a/xen/arch/x86/include/asm/hvm/asid.h b/xen/arch/x86/include/asm/hvm/asid.h
index 17c58353d1..13ea357f70 100644
--- a/xen/arch/x86/include/asm/hvm/asid.h
+++ b/xen/arch/x86/include/asm/hvm/asid.h
@@ -8,25 +8,21 @@
 #ifndef __ASM_X86_HVM_ASID_H__
 #define __ASM_X86_HVM_ASID_H__
 
+#include <xen/stdbool.h>
+#include <xen/stdint.h>
 
-struct vcpu;
-struct hvm_vcpu_asid;
+struct hvm_asid {
+  uint32_t asid;
+};
 
-/* Initialise ASID management for the current physical CPU. */
-void hvm_asid_init(int nasids);
+extern bool asid_enabled;
 
-/* Invalidate a particular ASID allocation: forces re-allocation. */
-void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid);
+/* Initialise ASID management distributed across all CPUs. */
+int hvm_asid_init(unsigned long nasids);
 
-/* Invalidate all ASID allocations for specified VCPU: forces re-allocation. */
-void hvm_asid_flush_vcpu(struct vcpu *v);
-
-/* Flush all ASIDs on this processor core. */
-void hvm_asid_flush_core(void);
-
-/* Called before entry to guest context. Checks ASID allocation, returns a
- * boolean indicating whether all ASIDs must be flushed. */
-bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid);
+int hvm_asid_alloc(struct hvm_asid *asid);
+int hvm_asid_alloc_range(struct hvm_asid *asid, unsigned long min, unsigned long max);
+void hvm_asid_free(struct hvm_asid *asid);
 
 #endif /* __ASM_X86_HVM_ASID_H__ */
 
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 2608bcfad2..5fb37d342b 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -141,6 +141,7 @@ struct hvm_domain {
     } write_map;
 
     struct hvm_pi_ops pi_ops;
+    struct hvm_asid asid;
 
     union {
         struct vmx_domain vmx;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index bf8bc2e100..7af111cb39 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -268,6 +268,8 @@ int hvm_domain_initialise(struct domain *d,
 void hvm_domain_relinquish_resources(struct domain *d);
 void hvm_domain_destroy(struct domain *d);
 
+int hvm_flush_tlb(const unsigned long *vcpu_bitmap);
+
 int hvm_vcpu_initialise(struct vcpu *v);
 void hvm_vcpu_destroy(struct vcpu *v);
 void hvm_vcpu_down(struct vcpu *v);
@@ -483,17 +485,6 @@ static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset,
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
@@ -881,8 +872,6 @@ static inline int hvm_cpu_up(void)
 
 static inline void hvm_cpu_down(void) {}
 
-static inline void hvm_flush_guest_tlbs(void) {}
-
 static inline void hvm_invlpg(const struct vcpu *v, unsigned long linear)
 {
     ASSERT_UNREACHABLE();
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 32f6e48e30..1254e5f3ee 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -9,6 +9,11 @@
 #ifndef __ASM_X86_HVM_SVM_H__
 #define __ASM_X86_HVM_SVM_H__
 
+void svm_asid_init(void);
+void svm_vcpu_assign_asid(struct vcpu *v);
+void svm_vcpu_set_tlb_control(struct vcpu *v);
+void svm_vcpu_clear_tlb_control(struct vcpu *v);
+
 /*
  * PV context switch helpers.  Prefetching the VMCB area itself has been shown
  * to be useful for performance.
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 196fed6d5d..960bea6734 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -9,6 +9,7 @@
 #define __ASM_X86_HVM_VCPU_H__
 
 #include <xen/tasklet.h>
+#include <asm/hvm/asid.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/hvm/vmx/vvmx.h>
@@ -17,11 +18,6 @@
 #include <asm/mtrr.h>
 #include <public/hvm/ioreq.h>
 
-struct hvm_vcpu_asid {
-    uint64_t generation;
-    uint32_t asid;
-};
-
 struct hvm_vcpu_io {
     /*
      * HVM emulation:
@@ -79,7 +75,7 @@ struct nestedvcpu {
     bool stale_np2m; /* True when p2m_base in VMCx02 is no longer valid */
     uint64_t np2m_generation;
 
-    struct hvm_vcpu_asid nv_n2asid;
+    struct hvm_asid nv_n2asid;
 
     bool nv_vmentry_pending;
     bool nv_vmexit_pending;
@@ -141,8 +137,6 @@ struct hvm_vcpu {
     /* (MFN) hypervisor page table */
     pagetable_t         monitor_table;
 
-    struct hvm_vcpu_asid n1asid;
-
     u64                 msr_tsc_adjust;
 
     union {
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index a55a31b42d..cae3613a61 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -462,14 +462,10 @@ static inline void vpid_sync_vcpu_context(struct vcpu *v)
     if ( likely(cpu_has_vmx_vpid_invvpid_single_context) )
         goto execute_invvpid;
 
-    /*
-     * If single context invalidation is not supported, we escalate to
-     * use all context invalidation.
-     */
     type = INVVPID_ALL_CONTEXT;
 
 execute_invvpid:
-    __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
+    __invvpid(type, v->domain->arch.hvm.asid.asid, 0);
 }
 
 static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
@@ -493,7 +489,7 @@ static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
         type = INVVPID_ALL_CONTEXT;
 
 execute_invvpid:
-    __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
+    __invvpid(type, v->domain->arch.hvm.asid.asid, (u64)gva);
 }
 
 static inline void vpid_sync_all(void)
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index ec5043a8aa..cf7ca1702a 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -27,6 +27,7 @@
 #include <asm/p2m.h>
 #include <asm/domain.h>
 #include <xen/numa.h>
+#include <asm/hvm/asid.h>
 #include <asm/hvm/nestedhvm.h>
 #include <public/sched.h>
 
@@ -739,7 +740,7 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
         if ( !flush_vcpu(v, vcpu_bitmap) )
             continue;
 
-        hvm_asid_flush_vcpu(v);
+        v->needs_tlb_flush = true;
 
         cpu = read_atomic(&v->dirty_cpu);
         if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )
@@ -748,9 +749,7 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
 
     /*
      * Trigger a vmexit on all pCPUs with dirty vCPU state in order to force an
-     * ASID/VPID change and hence accomplish a guest TLB flush. Note that vCPUs
-     * not currently running will already be flushed when scheduled because of
-     * the ASID tickle done in the loop above.
+     * ASID/VPID flush and hence accomplish a guest TLB flush.
      */
     on_selected_cpus(mask, NULL, NULL, 0);
 
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 3a39b5d124..04b41cee12 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -25,6 +25,7 @@
 #include <asm/p2m.h>
 #include <asm/mem_sharing.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/hvm/vcpu.h>
 #include <asm/altp2m.h>
 #include <asm/vm_event.h>
 #include <xsm/xsm.h>
@@ -1405,7 +1406,7 @@ p2m_flush(struct vcpu *v, struct p2m_domain *p2m)
     ASSERT(v->domain == p2m->domain);
     vcpu_nestedhvm(v).nv_p2m = NULL;
     p2m_flush_table(p2m);
-    hvm_asid_flush_vcpu(v);
+    v->needs_tlb_flush = true;
 }
 
 void
@@ -1464,7 +1465,7 @@ static void assign_np2m(struct vcpu *v, struct p2m_domain *p2m)
 
 static void nvcpu_flush(struct vcpu *v)
 {
-    hvm_asid_flush_vcpu(v);
+    v->needs_tlb_flush = true;
     vcpu_nestedhvm(v).stale_np2m = true;
 }
 
@@ -1584,7 +1585,7 @@ void np2m_schedule(int dir)
             if ( !np2m_valid )
             {
                 /* This vCPU's np2m was flushed while it was not runnable */
-                hvm_asid_flush_core();
+                curr->needs_tlb_flush = true; /* TODO: Is it ok ? */
                 vcpu_nestedhvm(curr).nv_p2m = NULL;
             }
             else
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index c77f4c1dac..26b6ce9e9b 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -964,7 +964,7 @@ void paging_update_nestedmode(struct vcpu *v)
     else
         /* TODO: shadow-on-shadow */
         v->arch.paging.nestedmode = NULL;
-    hvm_asid_flush_vcpu(v);
+    v->needs_tlb_flush = true;
 }
 
 int __init paging_set_allocation(struct domain *d, unsigned int pages,
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 114957a3e1..f98591f976 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -737,6 +737,7 @@ bool cf_check shadow_flush_tlb(const unsigned long *vcpu_bitmap)
             continue;
 
         paging_update_cr3(v, false);
+        v->needs_tlb_flush = true;
 
         cpu = read_atomic(&v->dirty_cpu);
         if ( is_vcpu_dirty_cpu(cpu) )
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 7be9c180ec..0e2865286e 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3144,6 +3144,7 @@ sh_update_linear_entries(struct vcpu *v)
      * without this change, it would fetch the wrong value due to a stale TLB.
      */
     sh_flush_local(d);
+    v->needs_tlb_flush = true;
 }
 
 static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 4ce9253284..f2f5a98534 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -228,6 +228,8 @@ struct vcpu
     bool             defer_shutdown;
     /* VCPU is paused following shutdown request (d->is_shutting_down)? */
     bool             paused_for_shutdown;
+    /* VCPU needs its TLB flushed before waking. */
+    bool             needs_tlb_flush;
     /* VCPU need affinity restored */
     uint8_t          affinity_broken;
 #define VCPU_AFFINITY_OVERRIDE    0x01
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


