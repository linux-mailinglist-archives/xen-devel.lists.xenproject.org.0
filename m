Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0543D2AF97E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 21:07:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25211.52878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcwOy-0003RL-9C; Wed, 11 Nov 2020 20:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25211.52878; Wed, 11 Nov 2020 20:07:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcwOx-0003Q0-U2; Wed, 11 Nov 2020 20:07:31 +0000
Received: by outflank-mailman (input) for mailman id 25211;
 Wed, 11 Nov 2020 20:07:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kcwOv-0003LR-SL
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:07:29 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcwOv-0000pY-KP; Wed, 11 Nov 2020 20:07:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcwOv-0003LR-SL
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:07:29 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcwOv-0000pY-KP; Wed, 11 Nov 2020 20:07:29 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 06/10] viridian: add ExProcessorMasks variants of the flush hypercalls
Date: Wed, 11 Nov 2020 20:07:17 +0000
Message-Id: <20201111200721.30551-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111200721.30551-1-paul@xen.org>
References: <20201111200721.30551-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

The Microsoft Hypervisor TLFS specifies variants of the already implemented
HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST hypercalls that take a 'Virtual
Processor Set' as an argument rather than a simple 64-bit mask.

This patch adds a new hvcall_flush_ex() function to implement these
(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST_EX) hypercalls. This makes use of
new helper functions, hv_vpset_nr_banks() and hv_vpset_to_vpmask(), to
determine the size of the Virtual Processor Set (so it can be copied from
guest memory) and parse it into hypercall_vpmask (respectively).

NOTE: A guest should not yet issue these hypercalls as 'ExProcessorMasks'
      support needs to be advertised via CPUID. This will be done in a
      subsequent patch.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/viridian/viridian.c | 147 +++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 765d53016c02..1226e1596a1c 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -553,6 +553,83 @@ static unsigned int vpmask_next(struct hypercall_vpmask *vpmask, unsigned int vp
 	     (vp) < HVM_MAX_VCPUS; \
 	     (vp) = vpmask_next(vpmask, vp))
 
+struct hypercall_vpset {
+        struct hv_vpset set;
+        uint64_t __bank_contents[64];
+};
+
+static DEFINE_PER_CPU(struct hypercall_vpset, hypercall_vpset);
+
+static unsigned int hv_vpset_nr_banks(struct hv_vpset *vpset)
+{
+    uint64_t bank_mask;
+    unsigned int nr = 0;
+
+    for ( bank_mask = vpset->valid_bank_mask; bank_mask; bank_mask >>= 1 )
+        if ( bank_mask & 1 )
+            nr++;
+
+    return nr;
+}
+
+static uint16_t hv_vpset_to_vpmask(struct hv_vpset *set, size_t size,
+                                   struct hypercall_vpmask *vpmask)
+{
+    switch ( set->format )
+    {
+    case HV_GENERIC_SET_ALL:
+        vpmask_fill(vpmask);
+        return 0;
+
+    case HV_GENERIC_SET_SPARSE_4K:
+    {
+        uint64_t bank_mask;
+        unsigned int bank = 0, vp = 0;
+
+        vpmask_empty(vpmask);
+        for ( bank_mask = set->valid_bank_mask; bank_mask; bank_mask >>= 1 )
+        {
+            /* Make sure we won't dereference past the end of the array */
+            if ( (void *)(set->bank_contents + bank) >=
+                 (void *)set + size )
+            {
+                ASSERT_UNREACHABLE();
+                return -EINVAL;
+            }
+
+            if ( bank_mask & 1 )
+            {
+                uint64_t mask = set->bank_contents[bank];
+                unsigned int i;
+
+                for ( i = 0; i < 64; i++, vp++ )
+                {
+                    if ( mask & 1 )
+                    {
+                        if ( vp >= HVM_MAX_VCPUS )
+                            return -EINVAL;
+
+                        vpmask_set(vpmask, vp);
+                    }
+
+                    mask >>= 1;
+                }
+
+                bank++;
+            }
+            else
+                vp += 64;
+        }
+        return 0;
+    }
+
+    default:
+        break;
+    }
+
+    return -EINVAL;
+}
+
 /*
  * Windows should not issue the hypercalls requiring this callback in the
  * case where vcpu_id would exceed the size of the mask.
@@ -644,6 +721,70 @@ static int hvcall_flush(union hypercall_input *input,
     return 0;
 }
 
+static int hvcall_flush_ex(union hypercall_input *input,
+                           union hypercall_output *output,
+                           unsigned long input_params_gpa,
+                           unsigned long output_params_gpa)
+{
+    struct hypercall_vpmask *vpmask = &this_cpu(hypercall_vpmask);
+    struct {
+        uint64_t address_space;
+        uint64_t flags;
+        struct hv_vpset set;
+    } input_params;
+
+    /* These hypercalls should never use the fast-call convention. */
+    if ( input->fast )
+        return -EINVAL;
+
+    /* Get input parameters. */
+    if ( hvm_copy_from_guest_phys(&input_params, input_params_gpa,
+                                  sizeof(input_params)) != HVMTRANS_okay )
+        return -EINVAL;
+
+    if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS )
+        vpmask_fill(vpmask);
+    else
+    {
+        struct hypercall_vpset *vpset = &this_cpu(hypercall_vpset);
+        struct hv_vpset *set = &vpset->set;
+        size_t size;
+        int rc;
+
+        *set = input_params.set;
+        if ( set->format == HV_GENERIC_SET_SPARSE_4K )
+        {
+            unsigned long offset = offsetof(typeof(input_params),
+                                            set.bank_contents);
+
+            size = sizeof(*set->bank_contents) * hv_vpset_nr_banks(set);
+            if ( hvm_copy_from_guest_phys(&set->bank_contents,
+                                          input_params_gpa + offset,
+                                          size) != HVMTRANS_okay)
+                return -EINVAL;
+
+            size += sizeof(*set);
+        }
+        else
+            size = sizeof(*set);
+
+        rc = hv_vpset_to_vpmask(set, size, vpmask);
+        if ( rc )
+            return rc;
+    }
+
+    /*
+     * A false return means that another vcpu is currently trying
+     * a similar operation, so back off.
+     */
+    if ( !paging_flush_tlb(need_flush, vpmask) )
+        return -ERESTART;
+
+    output->rep_complete = input->rep_count;
+
+    return 0;
+}
+
 static void send_ipi(struct hypercall_vpmask *vpmask, uint8_t vector)
 {
     struct domain *currd = current->domain;
@@ -767,6 +908,12 @@ int viridian_hypercall(struct cpu_user_regs *regs)
                           output_params_gpa);
         break;
 
+    case HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE_EX:
+    case HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST_EX:
+        rc = hvcall_flush_ex(&input, &output, input_params_gpa,
+                             output_params_gpa);
+        break;
+
     case HVCALL_SEND_IPI:
         rc = hvcall_ipi(&input, &output, input_params_gpa,
                         output_params_gpa);
-- 
2.20.1


