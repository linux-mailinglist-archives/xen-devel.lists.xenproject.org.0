Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPw4BnmT32kjWQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:32:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E77C404D1F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282455.1565051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0M4-0000ul-FL; Wed, 15 Apr 2026 13:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282455.1565051; Wed, 15 Apr 2026 13:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0M4-0000sN-9x; Wed, 15 Apr 2026 13:32:32 +0000
Received: by outflank-mailman (input) for mailman id 1282455;
 Wed, 15 Apr 2026 13:32:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df936b.v1-23fe8188e6a9447487e3112d66dc3e1a@bounce.vates.tech>)
 id 1wD0M2-0000q7-1H
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:32:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD0M1-006OmM-DH
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:32:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df936b.v1-23fe8188e6a9447487e3112d66dc3e1a@bounce.vates.tech>)
 id 69df936d-e002-0a2a0a5209dd-0a2a4508b786-2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:32:29 +0200
Received: from [198.2.186.1] (helo=mail186-1.suw21.mandrillapp.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69df936b.v1-23fe8188e6a9447487e3112d66dc3e1a@bounce.vates.tech>)
 id 69df936c-fab6-0a2a45080019-c602ba01ada0-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:32:29 +0200
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-1.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4fwhs766YJzBsX13v
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:32:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 23fe8188e6a9447487e3112d66dc3e1a; Wed, 15 Apr 2026 13:32:27 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776259947; x=1776529947;
	bh=V9h2LeDrWd+hcIIUXMFjjufE73oFJ5PXheM8EpWf9EU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BLUWRz5ltob2x4MQ72Sidnl1M4Rj7Xo26zp6CfZ/eOx9U9szMwmGG6Cr+e7In9Z/U
	 2aegQxcEOm2bnlD+4B2q4huWHpX+5kFzpueYW+hlrVagZyHEVk/sqeD2wjFJzOlVqL
	 ANf7VvijRwtX5LJswWwPRtb0AjnHjEf9VhhgjGqGbzaSwbH5+OgrQYRdlS+4rVfyFX
	 jYcfrA09RfC8pf1/IKZQDFVl/VnutiiFNLP+qxVqAybH55yHP5rez2YdRTzH1QQ9M9
	 x6k3/pw9p4k29YV+3nZuuC84F3NC13/9ilODIGJZYTzsGcHu+lFrXF5Zb2kZfidqYI
	 WJm8azYKbdilQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776259947; x=1776520447; i=teddy.astie@vates.tech;
	bh=V9h2LeDrWd+hcIIUXMFjjufE73oFJ5PXheM8EpWf9EU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WwAN6xK8C6OYy2JJXwfERhI1QDvdeUeYmm4R4jTvlKcEPXC9vjywJaOz10d+arYAw
	 KnCa/eA9SXQopN62WYN9ZlN8aI4nbFGUfoejCpMfznKIrfFvhZTWQUfz0m3lksaqSY
	 rBlNjmpqpPDgUw72eEuOlbCOfEvD/TRt/qyxSftwZPfP98LFmphJMeLWf03jWGfRlL
	 E21GraGfuDGd7tjweHj53QOq25/C+M0B8v1rf76nhAbcE9nisIUHWWcPq8nQ27gFTu
	 m3FYYXZJFBWGGSIZKrTKCHJaue1vDELCnaXx9OjXnJHDdaQpuB+6i/GGVfL345yAQ9
	 HoMBybpFl9MPw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=206/7]=20x86/hvm:=20Transition=20to=20needs=5Ftlb=5Fflush=20logic,=20use=20per-domain=20ASID?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776259945929
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Jason Andryuk" <jason.andryuk@amd.com>, "Tim Deegan" <tim@xen.org>
Message-Id: <2775da1be0c767a2dc7fcdf5caaf43278da2ab74.1776259594.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1776259594.git.teddy.astie@vates.tech>
References: <cover.1776259594.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.23fe8188e6a9447487e3112d66dc3e1a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 13:32:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1776259949-77348497-BD68DE05/0/0
X-purgate-type: clean
X-purgate-size: 42911
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,m:tim@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.906];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9E77C404D1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Change the ASID model where all vCPU of a domain share the same ASID
as required by AMD SEV and broadcast TLB flushing features (AMD INVLPGB).

ASID 1 is reserved as a placeholder for "no domain ASID", and used when
either ASID are not supported or no more ASID is available for use.
In this case, we always flush the TLB when from and to such domain's
vCPU.

Moreover, centralize the TLB flushing logic to use needs_tlb_flush, if
a full TLB flush needs to be performed for the vCPU, either through
SVM tlb_control or VMX invvpid before entering the guest.

As a result, drop ASID tickling logic, which is now redundant with the
needs_tlb_flush mechanism introduced previously. Also take the opportunity
to drop some now unused helpers now that FLUSH_HVM_ASID_CORE is dropped.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Nested virt makes some aspects tricky and is hard to reason about,
especially since there are 2 ASID in such case and complex TLB flushing
logic.

 docs/misc/xen-command-line.pandoc      |   2 +-
 xen/arch/x86/flushtlb.c                |  18 +--
 xen/arch/x86/hvm/asid.c                | 169 +++++++++++--------------
 xen/arch/x86/hvm/emulate.c             |   1 -
 xen/arch/x86/hvm/hvm.c                 |  24 +++-
 xen/arch/x86/hvm/nestedhvm.c           |   7 +-
 xen/arch/x86/hvm/svm/asid.c            |  67 +++++++---
 xen/arch/x86/hvm/svm/nestedsvm.c       |   2 +-
 xen/arch/x86/hvm/svm/svm.c             |  31 +++--
 xen/arch/x86/hvm/svm/svm.h             |   4 -
 xen/arch/x86/hvm/vmx/vmcs.c            |   5 +-
 xen/arch/x86/hvm/vmx/vmx.c             |  64 +++++-----
 xen/arch/x86/hvm/vmx/vvmx.c            |   3 +-
 xen/arch/x86/include/asm/flushtlb.h    |   7 -
 xen/arch/x86/include/asm/hvm/asid.h    |  26 ++--
 xen/arch/x86/include/asm/hvm/domain.h  |   1 +
 xen/arch/x86/include/asm/hvm/hvm.h     |  15 +--
 xen/arch/x86/include/asm/hvm/svm.h     |   5 +
 xen/arch/x86/include/asm/hvm/vcpu.h    |  10 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |   4 +-
 xen/arch/x86/mm/hap/hap.c              |   9 +-
 xen/arch/x86/mm/p2m.c                  |   3 -
 xen/arch/x86/mm/paging.c               |   1 -
 xen/arch/x86/mm/shadow/multi.c         |  11 +-
 24 files changed, 228 insertions(+), 261 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6c77129732..099b718df9 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -208,7 +208,7 @@ to appropriate auditing by Xen.  Argo is disabled by default.
 > Default: `true`
 
 Permit Xen to use Address Space Identifiers.  This is an optimisation which
-tags the TLB entries with an ID per vcpu.  This allows for guest TLB flushes
+tags the TLB entries with an ID per domain.  This allows for guest TLB flushes
 to be performed without the overhead of a complete TLB flush.
 
 ### async-show-all (x86)
diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 8ee2385bba..f60d2df8fd 100644
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
@@ -117,7 +118,6 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4)
 
     if ( tlb_clk_enabled )
         t = pre_flush();
-    hvm_flush_guest_tlbs();
 
     old_cr4 = read_cr4();
     ASSERT(!(old_cr4 & X86_CR4_PCIDE) || !(old_cr4 & X86_CR4_PGE));
@@ -221,9 +221,6 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
             do_tlb_flush();
     }
 
-    if ( flags & FLUSH_HVM_ASID_CORE )
-        hvm_flush_guest_tlbs();
-
     if ( flags & (FLUSH_CACHE_EVICT | FLUSH_CACHE_WRITEBACK) )
     {
         const struct cpuinfo_x86 *c = &current_cpu_data;
@@ -313,21 +310,12 @@ void cache_writeback(const void *addr, unsigned int size)
     asm volatile ("sfence" ::: "memory");
 }
 
-unsigned int guest_flush_tlb_flags(const struct domain *d)
-{
-    bool shadow = paging_mode_shadow(d);
-    bool asid = is_hvm_domain(d) && (cpu_has_svm || shadow);
-
-    return (shadow ? FLUSH_TLB : 0) | (asid ? FLUSH_HVM_ASID_CORE : 0);
-}
-
 void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
 {
-    unsigned int flags = guest_flush_tlb_flags(d);
     struct vcpu *v;
 
-    if ( flags )
-        flush_mask(mask, flags);
+    if ( paging_mode_shadow(d) )
+        flush_tlb_mask(mask);
 
     for_each_vcpu(d, v)
         v->needs_tlb_flush = true;
diff --git a/xen/arch/x86/hvm/asid.c b/xen/arch/x86/hvm/asid.c
index 935cae3901..1a21125161 100644
--- a/xen/arch/x86/hvm/asid.c
+++ b/xen/arch/x86/hvm/asid.c
@@ -5,138 +5,115 @@
  * Copyright (c) 2009, Citrix Systems, Inc.
  */
 
+#include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/param.h>
-#include <xen/sched.h>
-#include <xen/smp.h>
-#include <xen/percpu.h>
+#include <xen/spinlock.h>
+#include <xen/xvmalloc.h>
+
+#include <asm/bitops.h>
 #include <asm/hvm/asid.h>
 
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
+ * ASIDs are assigned uniquely per domain and doesn't change during the lifecycle of the
+ * domain. Once vcpus are initialized and are up, we assign the same ASID to all vcpus
+ * of that domain at the first VMRUN. In order to process a TLB flush on a vcpu, we set
+ * needs_tlb_flush to schedule a TLB flush for the next VMRUN (e.g using tlb control 
+ * field of VMCB).
  *
- * ASIDs are a CPU-local resource.  As preemption of ASIDs is not possible,
- * ASIDs are assigned in a round-robin scheme.  To minimize the overhead of
- * ASID invalidation, at the time of a TLB flush,  ASIDs are tagged with a
- * 64-bit generation.  Only on a generation overflow the code needs to
- * invalidate all ASID information stored at the VCPUs with are run on the
- * specific physical processor.  This overflow appears after about 2^80
- * host processor cycles, so we do not optimize this case, but simply disable
- * ASID useage to retain correctness.
+ * We reserve ASID=1 as being the ASID used when none other is available (or with asid
+ * use disabled). Multiples domains may use this ASID, thus we need to systematically
+ * flush the TLB for this one when switching between vCPUs with ASID=1.
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
-void hvm_asid_init(unsigned int nasids)
+int __init hvm_asid_init(unsigned long nasids)
 {
-    static int8_t __ro_after_init g_disabled = -1;
-    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
+    ASSERT(nasids);
 
-    data->max_asid = nasids - 1;
-    data->disabled = !opt_asid_enabled || (nasids <= 1);
+    asid_count = nasids;
+    asid_enabled = opt_asid_enabled && (nasids > 1);
 
-    if ( g_disabled < 0 )
-    {
-        g_disabled = data->disabled;
-        printk("HVM: ASIDs %sabled\n", data->disabled ? "dis" : "en");
-    }
-    else if ( g_disabled != data->disabled )
-        printk("HVM: CPU%u: ASIDs %sabled\n", smp_processor_id(),
-               data->disabled ? "dis" : "en");
+    asid_bitmap = xvzalloc_array(unsigned long, BITS_TO_LONGS(asid_count + 1));
+    if ( !asid_bitmap )
+        return -ENOMEM;
 
-    /* Zero indicates 'invalid generation', so we start the count at one. */
-    data->core_asid_generation = 1;
+    printk("HVM: ASIDs %sabled (count=%lu)\n", asid_enabled ? "en" : "dis", asid_count);
 
-    /* Zero indicates 'ASIDs disabled', so we start the count at one. */
-    data->next_asid = 1;
-}
+    /* ASID 0 and 1 are reserved, mark it as permanently used */
+    set_bit(0, asid_bitmap);
+    set_bit(1, asid_bitmap);
 
-void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid)
-{
-    write_atomic(&asid->generation, 0);
+    return 0;
 }
 
-void hvm_asid_flush_vcpu(struct vcpu *v)
+int hvm_asid_alloc(struct hvm_asid *asid)
 {
-    hvm_asid_flush_vcpu_asid(&v->arch.hvm.n1asid);
-    hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
-}
+    unsigned long new_asid;
 
-void hvm_asid_flush_core(void)
-{
-    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
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
+    unsigned long new_asid;
+    
+    if ( WARN_ON(min >= asid_count) )
+        return -EINVAL;
 
-    /* On erratum #170 systems we must flush the TLB. 
-     * Generation overruns are taken here, too. */
-    if ( data->disabled )
-        goto disabled;
+    if ( !asid_enabled )
+        return -EOPNOTSUPP;
 
-    /* Test if VCPU has valid ASID. */
-    if ( read_atomic(&asid->generation) == data->core_asid_generation )
-        return 0;
+    spin_lock(&asid_lock);
+    new_asid = find_next_zero_bit(asid_bitmap, asid_count, min);
+    if ( new_asid > max || new_asid > asid_count )
+        return -ENOSPC;
 
-    /* If there are no free ASIDs, need to go to a new generation */
-    if ( unlikely(data->next_asid > data->max_asid) )
-    {
-        hvm_asid_flush_core();
-        data->next_asid = 1;
-        if ( data->disabled )
-            goto disabled;
-    }
+    set_bit(new_asid, asid_bitmap);
 
-    /* Now guaranteed to be a free ASID. */
-    asid->asid = data->next_asid++;
-    write_atomic(&asid->generation, data->core_asid_generation);
+    asid->asid = new_asid;
+    spin_unlock(&asid_lock);
+    return 0;
+}
 
-    /*
-     * When we assign ASID 1, flush all TLB entries as we are starting a new
-     * generation, and all old ASID allocations are now stale. 
-     */
-    return (asid->asid == 1);
+void hvm_asid_free(struct hvm_asid *asid)
+{
+    ASSERT( asid->asid );
 
- disabled:
-    asid->asid = 0;
-    return 0;
+    if ( !asid_enabled || asid->asid == 1 )
+        return;
+
+    ASSERT( asid->asid < asid_count );
+
+    spin_lock(&asid_lock);
+    WARN_ON(!test_bit(asid->asid, asid_bitmap));
+    clear_bit(asid->asid, asid_bitmap);
+    spin_unlock(&asid_lock);
 }
 
 /*
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 3bc1d321cc..efdf236df1 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2656,7 +2656,6 @@ static int cf_check hvmemul_tlb_op(
     case x86emul_invpcid:
         if ( x86emul_invpcid_type(aux) != X86_INVPCID_INDIV_ADDR )
         {
-            hvm_asid_flush_vcpu(current);
             current->needs_tlb_flush = true;
             break;
         }
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0f0b0e242f..2ab625d6e0 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -520,11 +520,13 @@ static bool hvm_get_pending_event(struct vcpu *v, struct x86_event *info)
 
 void hvm_do_resume(struct vcpu *v)
 {
+    struct domain *currd = v->domain;;
+
     check_wakeup_from_wait();
 
     pt_restore_timer(v);
 
-    if ( has_vpci(v->domain) && vpci_process_pending(v) )
+    if ( has_vpci(currd) && vpci_process_pending(v) )
     {
         raise_softirq(SCHEDULE_SOFTIRQ);
         return;
@@ -559,6 +561,13 @@ void hvm_do_resume(struct vcpu *v)
             v->arch.monitor.next_interrupt_enabled = false;
         }
     }
+
+    if ( unlikely(currd->arch.hvm.asid.asid == 1) )
+        /*
+         * As ASID=1 may be shared across multiples domains, we can't easily track the
+         * state of the TLB, we always flush the TLB before resuming this vCPU.
+         */
+        v->needs_tlb_flush = true;
 }
 
 static int cf_check hvm_print_line(
@@ -714,6 +723,10 @@ int hvm_domain_initialise(struct domain *d,
     if ( rc )
         goto fail2;
 
+    rc = hvm_asid_alloc(&d->arch.hvm.asid);
+    if ( rc )
+        goto fail2;
+
     rc = alternative_call(hvm_funcs.domain_initialise, d);
     if ( rc != 0 )
         goto fail2;
@@ -794,7 +807,7 @@ void hvm_domain_destroy(struct domain *d)
         list_del(&ioport->list);
         xfree(ioport);
     }
-
+    hvm_asid_free(&d->arch.hvm.asid);
     destroy_vpci_mmcfg(d);
 }
 
@@ -1612,7 +1625,6 @@ int hvm_vcpu_initialise(struct vcpu *v)
     int rc;
     struct domain *d = v->domain;
 
-    hvm_asid_flush_vcpu(v);
     v->needs_tlb_flush = true;
 
     spin_lock_init(&v->arch.hvm.tm_lock);
@@ -4085,6 +4097,11 @@ static void hvm_s3_resume(struct domain *d)
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
@@ -5464,4 +5481,3 @@ int hvm_copy_context_and_params(struct domain *dst, struct domain *src)
  * indent-tabs-mode: nil
  * End:
  */
-
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
index 53aa5d0512..44d2138895 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -1,39 +1,46 @@
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
 #include <asm/hvm/svm.h>
+#include <asm/processor.h>
 
 #include "svm.h"
 #include "vmcb.h"
 
-void svm_asid_init(const struct cpuinfo_x86 *c)
+void __init svm_asid_init(void)
 {
-    unsigned int nasids = 0;
+    unsigned int cpu, nasids = cpuid_ebx(0x8000000aU);
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
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct hvm_asid *p_asid = &v->domain->arch.hvm.asid;
 
     /* ASID 0 indicates that ASIDs are disabled. */
     if ( p_asid->asid == 0 )
@@ -44,11 +51,31 @@ void svm_asid_handle_vmrun(void)
         return;
     }
 
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
+
+    vmcb->tlb_control =
+        cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
+}
+
+void svm_vcpu_clear_tlb_control(struct vcpu *v)
+{
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
-    /* We can't rely on TLB_CTRL_FLUSH_ASID as all ASIDs are stale here. */
-    vmcb->tlb_control = need_flush ? TLB_CTRL_FLUSH_ALL : TLB_CTRL_NO_FLUSH;
+    vmcb->tlb_control = TLB_CTRL_NO_FLUSH;
 }
 
 /*
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index ef6fa5d23b..d9a84f9388 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -5,6 +5,7 @@
  *
  */
 
+#include <asm/hvm/asid.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/svm.h>
 #include <asm/hvm/nestedhvm.h>
@@ -638,7 +639,6 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     if ( svm->ns_asid != vmcb_get_asid(ns_vmcb))
     {
         nv->nv_flushp2m = 1;
-        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
         svm->ns_asid = vmcb_get_asid(ns_vmcb);
     }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 8714fb18ec..ba22acb8a6 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -27,6 +27,7 @@
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/svm.h>
+#include <asm/hvm/asid.h>
 #include <asm/i387.h>
 #include <asm/idt.h>
 #include <asm/iocap.h>
@@ -137,16 +138,18 @@ static void cf_check svm_update_guest_cr(
         if ( !nestedhvm_enabled(v->domain) )
         {
             if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-                hvm_asid_flush_vcpu(v);
                 
             v->needs_tlb_flush = true;
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
@@ -944,8 +947,6 @@ static void noreturn cf_check svm_do_resume(void)
         v->arch.hvm.svm.launch_core = smp_processor_id();
         hvm_migrate_timers(v);
         hvm_migrate_pirqs(v);
-        /* Migrating to another ASID domain.  Request a new ASID. */
-        hvm_asid_flush_vcpu(v);
         v->needs_tlb_flush = true;
     }
 
@@ -974,8 +975,6 @@ void asmlinkage svm_vmenter_helper(void)
 
     ASSERT(hvmemul_cache_disabled(curr));
 
-    svm_asid_handle_vmrun();
-
     TRACE_TIME(TRC_HVM_VMENTRY |
                (nestedhvm_vcpu_in_guestmode(curr) ? TRC_HVM_NESTEDFLAG : 0));
 
@@ -991,6 +990,9 @@ void asmlinkage svm_vmenter_helper(void)
 
     curr->domain->latest_vcpu[cpu] = curr->vcpu_id;
 
+    if ( test_and_clear_bool(curr->needs_tlb_flush) )
+        svm_vcpu_set_tlb_control(curr);
+
     vmcb->rax = regs->rax;
     vmcb->rip = regs->rip;
     vmcb->rsp = regs->rsp;
@@ -1111,6 +1113,8 @@ static int cf_check svm_vcpu_initialise(struct vcpu *v)
         return rc;
     }
 
+    svm_vcpu_assign_asid(v);
+
     return 0;
 }
 
@@ -1536,9 +1540,6 @@ static int _svm_cpu_up(bool bsp)
     /* check for erratum 383 */
     svm_init_erratum_383(c);
 
-    /* Initialize core's ASID handling. */
-    svm_asid_init(c);
-
     /* Initialize OSVW bits to be used by guests */
     svm_host_osvw_init();
 
@@ -2293,7 +2294,7 @@ static void svm_invlpga_intercept(
 {
     svm_invlpga(linear,
                 (asid == 0)
-                ? v->arch.hvm.n1asid.asid
+                ? v->domain->arch.hvm.asid.asid
                 : vcpu_nestedhvm(v).nv_n2asid.asid);
 }
 
@@ -2315,8 +2316,6 @@ static bool cf_check is_invlpg(
 
 static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
 {
-    /* Safe fallback. Take a new ASID. */
-    hvm_asid_flush_vcpu(v);
     /* Schedule a tlb flush on the VCPU. */
     v->needs_tlb_flush = true;
 }
@@ -2486,6 +2485,8 @@ const struct hvm_function_table * __init start_svm(void)
     svm_function_table.caps.hap_superpage_2mb = true;
     svm_function_table.caps.hap_superpage_1gb = cpu_has_page1gb;
 
+    svm_asid_init();
+
     return &svm_function_table;
 }
 
@@ -2542,6 +2543,8 @@ void asmlinkage svm_vmexit_handler(void)
                    (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0x0F));
     }
 
+    svm_vcpu_clear_tlb_control(v);
+
     exit_reason = vmcb->exitcode;
 
     if ( hvm_long_mode_active(v) )
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index cfa411ad5a..901354e914 100644
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
index 4efe13e07f..88808e26e7 100644
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
@@ -778,8 +779,6 @@ static int _vmx_cpu_up(bool bsp)
 
     this_cpu(vmxon) = 1;
 
-    hvm_asid_init(cpu_has_vmx_vpid ? (1u << VMCS_VPID_WIDTH) : 0);
-
     if ( cpu_has_vmx_ept )
         ept_sync_all();
 
@@ -1903,7 +1902,6 @@ void cf_check vmx_do_resume(void)
          */
         v->arch.hvm.vmx.hostenv_migrated = 1;
 
-        hvm_asid_flush_vcpu(v);
         v->needs_tlb_flush = true;
     }
 
@@ -2117,7 +2115,6 @@ void vmcs_dump_vcpu(struct vcpu *v)
          (SECONDARY_EXEC_ENABLE_VPID | SECONDARY_EXEC_ENABLE_VM_FUNCTIONS) )
         printk("Virtual processor ID = 0x%04x VMfunc controls = %016lx\n",
                vmr16(VIRTUAL_PROCESSOR_ID), vmr(VM_FUNCTION_CONTROL));
-
     vmx_vmcs_exit(v);
 }
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index dceff2f221..15989cf136 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -25,6 +25,7 @@
 #include <asm/fsgsbase.h>
 #include <asm/gdbsx.h>
 #include <asm/guest-msr.h>
+#include <asm/hvm/asid.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/monitor.h>
@@ -834,6 +835,18 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
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
@@ -1510,7 +1523,6 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
             vmx_set_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
 
             wbinvd();               /* flush possibly polluted cache */
-            hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TLB */
             v->needs_tlb_flush = true; /* invalidate memory type cached in TLB */
             v->arch.hvm.vmx.cache_mode = CACHE_MODE_NO_FILL;
         }
@@ -1520,7 +1532,6 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
             vmx_set_guest_pat(v, *pat);
             if ( !is_iommu_enabled(v->domain) || iommu_snoop )
                 vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
-            hvm_asid_flush_vcpu(v); /* no need to flush cache */
             v->needs_tlb_flush = true;
         }
     }
@@ -1873,7 +1884,6 @@ static void cf_check vmx_update_guest_cr(
         __vmwrite(GUEST_CR3, v->arch.hvm.hw_cr[3]);
 
         if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-            hvm_asid_flush_vcpu(v);
         v->needs_tlb_flush = true;
         break;
 
@@ -3171,6 +3181,8 @@ const struct hvm_function_table * __init start_vmx(void)
     lbr_tsx_fixup_check();
     ler_to_fixup_check();
 
+    BUG_ON(hvm_asid_init(cpu_has_vmx_vpid ? (1u << VMCS_VPID_WIDTH) : 1));
+
     return &vmx_function_table;
 }
 
@@ -4934,9 +4946,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
-    u32 new_asid, old_asid;
-    struct hvm_vcpu_asid *p_asid;
-    bool need_flush;
+    struct hvm_asid *p_asid;
     unsigned int cpu = smp_processor_id();
 
     ASSERT(hvmemul_cache_disabled(curr));
@@ -4948,38 +4958,16 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
     if ( curr->domain->arch.hvm.pi_ops.vcpu_block )
         vmx_pi_do_resume(curr);
 
-    if ( !cpu_has_vmx_vpid )
+    if ( !asid_enabled )
         goto out;
     if ( nestedhvm_vcpu_in_guestmode(curr) )
         p_asid = &vcpu_nestedhvm(curr).nv_n2asid;
     else
-        p_asid = &curr->arch.hvm.n1asid;
+        p_asid = &currd->arch.hvm.asid;
 
-    old_asid = p_asid->asid;
-    need_flush = hvm_asid_handle_vmenter(p_asid);
-    new_asid = p_asid->asid;
+    __vmwrite(VIRTUAL_PROCESSOR_ID, p_asid->asid);
 
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
 
-    if ( unlikely(need_flush) )
-        vpid_sync_all();
     /**
      * Check if we were the latest vCPU of this domain that ran on this pCPU.
      * Flush the TLB if it is not, as the TLB entries are the ones from the previous
@@ -4993,16 +4981,21 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
     if ( paging_mode_hap(curr->domain) )
     {
         struct ept_data *ept = &p2m_get_hostp2m(currd)->ept;
-        unsigned int cpu = smp_processor_id();
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
 
@@ -5031,6 +5024,11 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
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
index 16d6f1d61b..7314aa5633 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1253,7 +1253,6 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
 
         if ( nvmx->guest_vpid != new_vpid )
         {
-            hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
             v->needs_tlb_flush = true;
             nvmx->guest_vpid = new_vpid;
         }
@@ -2053,7 +2052,7 @@ static int nvmx_handle_invvpid(struct cpu_user_regs *regs)
     case INVVPID_INDIVIDUAL_ADDR:
     case INVVPID_SINGLE_CONTEXT:
     case INVVPID_ALL_CONTEXT:
-        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(current).nv_n2asid);
+        hvm_flush_tlb(NULL);
         break;
     default:
         vmfail(regs, VMX_INSN_INVEPT_INVVPID_INVALID_OP);
diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index 7bcbca2b7f..d8167aca18 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -125,12 +125,6 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4);
 #define FLUSH_VCPU_STATE 0x1000
  /* Flush the per-cpu root page table */
 #define FLUSH_ROOT_PGTBL 0x2000
-#if CONFIG_HVM
- /* Flush all HVM guests linear TLB (using ASID/VPID) */
-#define FLUSH_HVM_ASID_CORE 0x4000
-#else
-#define FLUSH_HVM_ASID_CORE 0
-#endif
 #if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
 /*
  * Adding this to the flags passed to flush_area_mask will prevent using the
@@ -190,7 +184,6 @@ void flush_area_mask(const cpumask_t *mask, const void *va,
 
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache) {}
 
-unsigned int guest_flush_tlb_flags(const struct domain *d);
 void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
 
 #endif /* __FLUSHTLB_H__ */
diff --git a/xen/arch/x86/include/asm/hvm/asid.h b/xen/arch/x86/include/asm/hvm/asid.h
index 25ba57e768..13ea357f70 100644
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
-void hvm_asid_init(unsigned int nasids);
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
index abf9bc448d..03fe6c8f7b 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -139,6 +139,7 @@ struct hvm_domain {
     } write_map;
 
     struct hvm_pi_ops pi_ops;
+    struct hvm_asid asid;
 
     union {
         struct vmx_domain vmx;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index e7c1364802..935d9e7548 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -274,6 +274,8 @@ int hvm_domain_initialise(struct domain *d,
 void hvm_domain_relinquish_resources(struct domain *d);
 void hvm_domain_destroy(struct domain *d);
 
+int hvm_flush_tlb(const unsigned long *vcpu_bitmap);
+
 int hvm_vcpu_initialise(struct vcpu *v);
 void hvm_vcpu_destroy(struct vcpu *v);
 void hvm_vcpu_down(struct vcpu *v);
@@ -497,17 +499,6 @@ static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset)
     alternative_vcall(hvm_funcs.set_tsc_offset, v, offset);
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
@@ -901,8 +892,6 @@ static inline int hvm_cpu_up(void)
 
 static inline void hvm_cpu_down(void) {}
 
-static inline void hvm_flush_guest_tlbs(void) {}
-
 static inline void hvm_invlpg(const struct vcpu *v, unsigned long linear)
 {
     ASSERT_UNREACHABLE();
diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/asm/hvm/svm.h
index a35a61273b..1877bb149a 100644
--- a/xen/arch/x86/include/asm/hvm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm.h
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
index 836138a4a6..7472cdd0f2 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -9,6 +9,7 @@
 #define __ASM_X86_HVM_VCPU_H__
 
 #include <xen/tasklet.h>
+#include <asm/hvm/asid.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/hvm/vmx/vvmx.h>
@@ -16,11 +17,6 @@
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
@@ -78,7 +74,7 @@ struct nestedvcpu {
     bool stale_np2m; /* True when p2m_base in VMCx02 is no longer valid */
     uint64_t np2m_generation;
 
-    struct hvm_vcpu_asid nv_n2asid;
+    struct hvm_asid nv_n2asid;
 
     bool nv_vmentry_pending;
     bool nv_vmexit_pending;
@@ -142,8 +138,6 @@ struct hvm_vcpu {
     /* (MFN) hypervisor page table */
     pagetable_t         monitor_table;
 
-    struct hvm_vcpu_asid n1asid;
-
     u64                 msr_tsc_adjust;
 
     union {
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 3524cb3536..4f307ae123 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -470,7 +470,7 @@ static inline void vpid_sync_vcpu_context(const struct vcpu *v)
     type = INVVPID_ALL_CONTEXT;
 
 execute_invvpid:
-    __invvpid(type, v->arch.hvm.n1asid.asid, 0);
+    __invvpid(type, v->domain->arch.hvm.asid.asid, 0);
 }
 
 static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
@@ -494,7 +494,7 @@ static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
         type = INVVPID_ALL_CONTEXT;
 
 execute_invvpid:
-    __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
+    __invvpid(type, v->domain->arch.hvm.asid.asid, (u64)gva);
 }
 
 static inline void vpid_sync_all(void)
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 5ccb80bda5..156734d3e0 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -27,6 +27,7 @@
 #include <asm/p2m.h>
 #include <asm/domain.h>
 #include <xen/numa.h>
+#include <asm/hvm/asid.h>
 #include <asm/hvm/nestedhvm.h>
 #include <public/sched.h>
 
@@ -750,18 +751,16 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
         if ( !flush_vcpu(v, vcpu_bitmap) )
             continue;
 
-        hvm_asid_flush_vcpu(v);
-
         cpu = read_atomic(&v->dirty_cpu);
         if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )
             __cpumask_set_cpu(cpu, mask);
     }
 
+    guest_flush_tlb_mask(d, mask);
+
     /*
      * Trigger a vmexit on all pCPUs with dirty vCPU state in order to force an
-     * ASID/VPID change and hence accomplish a guest TLB flush. Note that vCPUs
-     * not currently running will already be flushed when scheduled because of
-     * the ASID tickle done in the loop above.
+     * ASID/VPID flush and hence accomplish a guest TLB flush.
      */
     on_selected_cpus(mask, NULL, NULL, 0);
 
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 910623ac93..6eb6035f09 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1439,7 +1439,6 @@ p2m_flush(struct vcpu *v, struct p2m_domain *p2m)
     ASSERT(v->domain == p2m->domain);
     vcpu_nestedhvm(v).nv_p2m = NULL;
     p2m_flush_table(p2m);
-    hvm_asid_flush_vcpu(v);
     v->needs_tlb_flush = true;
 }
 
@@ -1499,7 +1498,6 @@ static void assign_np2m(struct vcpu *v, struct p2m_domain *p2m)
 
 static void nvcpu_flush(struct vcpu *v)
 {
-    hvm_asid_flush_vcpu(v);
     v->needs_tlb_flush = true;
     vcpu_nestedhvm(v).stale_np2m = true;
 }
@@ -1620,7 +1618,6 @@ void np2m_schedule(int dir)
             if ( !np2m_valid )
             {
                 /* This vCPU's np2m was flushed while it was not runnable */
-                hvm_asid_flush_core();
                 curr->needs_tlb_flush = true;
                 vcpu_nestedhvm(curr).nv_p2m = NULL;
             }
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index b0b3bef753..af5584a777 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -938,7 +938,6 @@ void paging_update_nestedmode(struct vcpu *v)
     else
         /* TODO: shadow-on-shadow */
         v->arch.paging.nestedmode = NULL;
-    hvm_asid_flush_vcpu(v);
     v->needs_tlb_flush = true;
 }
 
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 2df2842138..0eef92bc5b 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -81,12 +81,6 @@ const char *const fetch_type_names[] = {
 
 static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush);
 
-/* Helper to perform a local TLB flush. */
-static void sh_flush_local(const struct domain *d)
-{
-    flush_local(guest_flush_tlb_flags(d));
-}
-
 #if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
 #define ASSERT_VALID_L2(t) \
     ASSERT((t) == SH_type_l2_shadow || (t) == SH_type_l2h_shadow)
@@ -2947,7 +2941,8 @@ static bool cf_check sh_invlpg(struct vcpu *v, unsigned long linear)
     if ( mfn_to_page(sl1mfn)->u.sh.type
          == SH_type_fl1_shadow )
     {
-        sh_flush_local(v->domain);
+        flush_tlb_local();
+        v->needs_tlb_flush = true;
         return false;
     }
 
@@ -3164,7 +3159,7 @@ sh_update_linear_entries(struct vcpu *v)
      * linear pagetable to read a top-level shadow page table entry. But,
      * without this change, it would fetch the wrong value due to a stale TLB.
      */
-    sh_flush_local(d);
+    flush_tlb_local();
     v->needs_tlb_flush = true;
 }
 
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


