Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821E52C3077
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 20:08:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36811.68922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khdfS-0001cp-KW; Tue, 24 Nov 2020 19:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36811.68922; Tue, 24 Nov 2020 19:07:58 +0000
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
	id 1khdfS-0001aG-1H; Tue, 24 Nov 2020 19:07:58 +0000
Received: by outflank-mailman (input) for mailman id 36811;
 Tue, 24 Nov 2020 19:07:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khdfP-0001Uo-Ea
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:07:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdfP-0003tO-8Z; Tue, 24 Nov 2020 19:07:55 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdfP-0000r4-0V; Tue, 24 Nov 2020 19:07:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfP-0001Uo-Ea
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=I7JJtB7WNzzZPW1N9VUrCzgJzropJ8kr71EcJ8UnyZk=; b=c1/mzUJLUt42kjlCwqhRaQndpG
	8YUTmLnIfPglZ0/P8RxbmP5mwn1hLi7aUASCuviJUzRQ4aD8vn9sWassb9sud3Sfn1IRWGrncCRcN
	HzeDd4IYHR5IjSr1KX51aVSKyC9lRqem0cDQbRMmaNr/rgbQ1PbFEABOCSNpsxGPwvhw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfP-0003tO-8Z; Tue, 24 Nov 2020 19:07:55 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com ([86.183.162.145] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfP-0000r4-0V; Tue, 24 Nov 2020 19:07:55 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 08/13] viridian: add ExProcessorMasks variants of the flush hypercalls
Date: Tue, 24 Nov 2020 19:07:39 +0000
Message-Id: <20201124190744.11343-9-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201124190744.11343-1-paul@xen.org>
References: <20201124190744.11343-1-paul@xen.org>
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

v3:
 - Adjust one of the helper macros
 - A few more consts and type tweaks
 - Adjust prototype of new function

v2:
 - Add helper macros to define mask and struct sizes
 - Use a union to determine the size of 'hypercall_vpset'
 - Use hweight64() in hv_vpset_nr_banks()
 - Sanity check size before hvm_copy_from_guest_phys()
---
 xen/arch/x86/hvm/viridian/viridian.c | 141 +++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 4867a1bd140b..5d0b49012360 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -577,6 +577,69 @@ static unsigned int vpmask_nr(const struct hypercall_vpmask *vpmask)
     return bitmap_weight(vpmask->mask, HVM_MAX_VCPUS);
 }
 
+#define HV_VPSET_BANK_SIZE \
+    sizeof_field(struct hv_vpset, bank_contents[0])
+
+#define HV_VPSET_SIZE(banks)   \
+    (offsetof(struct hv_vpset, bank_contents) + \
+     ((banks) * HV_VPSET_BANK_SIZE))
+
+#define HV_VPSET_MAX_BANKS \
+    (sizeof_field(struct hv_vpset, valid_bank_mask) * 8)
+
+union hypercall_vpset {
+    struct hv_vpset set;
+    uint8_t pad[HV_VPSET_SIZE(HV_VPSET_MAX_BANKS)];
+};
+
+static DEFINE_PER_CPU(union hypercall_vpset, hypercall_vpset);
+
+static unsigned int hv_vpset_nr_banks(struct hv_vpset *vpset)
+{
+    return hweight64(vpset->valid_bank_mask);
+}
+
+static uint16_t hv_vpset_to_vpmask(const struct hv_vpset *set,
+                                   struct hypercall_vpmask *vpmask)
+{
+#define NR_VPS_PER_BANK (HV_VPSET_BANK_SIZE * 8)
+
+    switch ( set->format )
+    {
+    case HV_GENERIC_SET_ALL:
+        vpmask_fill(vpmask);
+        return 0;
+
+    case HV_GENERIC_SET_SPARSE_4K:
+    {
+        uint64_t bank_mask;
+        unsigned int vp, bank = 0;
+
+        vpmask_empty(vpmask);
+        for ( vp = 0, bank_mask = set->valid_bank_mask;
+              bank_mask;
+              vp += NR_VPS_PER_BANK, bank_mask >>= 1 )
+        {
+            if ( bank_mask & 1 )
+            {
+                uint64_t mask = set->bank_contents[bank];
+
+                vpmask_set(vpmask, vp, mask);
+                bank++;
+            }
+        }
+        return 0;
+    }
+
+    default:
+        break;
+    }
+
+    return -EINVAL;
+
+#undef NR_VPS_PER_BANK
+}
+
 /*
  * Windows should not issue the hypercalls requiring this callback in the
  * case where vcpu_id would exceed the size of the mask.
@@ -657,6 +720,78 @@ static int hvcall_flush(const union hypercall_input *input,
     return 0;
 }
 
+static int hvcall_flush_ex(const union hypercall_input *input,
+                           union hypercall_output *output,
+                           paddr_t input_params_gpa,
+                           paddr_t output_params_gpa)
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
+        union hypercall_vpset *vpset = &this_cpu(hypercall_vpset);
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
+
+            if ( offsetof(typeof(*vpset), set.bank_contents[0]) + size >
+                 sizeof(*vpset) )
+            {
+                ASSERT_UNREACHABLE();
+                return -EINVAL;
+            }
+
+            if ( hvm_copy_from_guest_phys(&set->bank_contents[0],
+                                          input_params_gpa + offset,
+                                          size) != HVMTRANS_okay)
+                return -EINVAL;
+
+            size += sizeof(*set);
+        }
+        else
+            size = sizeof(*set);
+
+        rc = hv_vpset_to_vpmask(set, vpmask);
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
@@ -770,6 +905,12 @@ int viridian_hypercall(struct cpu_user_regs *regs)
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


