Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 302292BA67E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 10:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31842.62664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg32a-0005Xj-FD; Fri, 20 Nov 2020 09:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31842.62664; Fri, 20 Nov 2020 09:49:16 +0000
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
	id 1kg32a-0005UJ-8Y; Fri, 20 Nov 2020 09:49:16 +0000
Received: by outflank-mailman (input) for mailman id 31842;
 Fri, 20 Nov 2020 09:49:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kg32Y-0005Px-3A
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:49:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg32X-0002bc-SN; Fri, 20 Nov 2020 09:49:13 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg32X-0003d1-Ke; Fri, 20 Nov 2020 09:49:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32Y-0005Px-3A
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=rH60KaFb4nQd7ulI+9/biFMC6TXsBA8iRybF1TD4Eko=; b=3q1KexrHeX/aaEAH76gfFPGqyd
	zJ20hL+j4OziLbxE1NanvJ79ZWJr8lyYsP3zJMD3ujeMtDzvOyn5zPXnF6X1AA2jgtSh9b4FiOhpE
	W9HeuAtNoWGa3KXHMlL2n4mgh3HXLYfhd58kol1TVO0w99tE9ngrZ1CJ+4n1eWgdOUn4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32X-0002bc-SN; Fri, 20 Nov 2020 09:49:13 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32X-0003d1-Ke; Fri, 20 Nov 2020 09:49:13 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 09/12] viridian: add ExProcessorMasks variant of the IPI hypercall
Date: Fri, 20 Nov 2020 09:48:57 +0000
Message-Id: <20201120094900.1489-10-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201120094900.1489-1-paul@xen.org>
References: <20201120094900.1489-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

A previous patch introduced variants of the flush hypercalls that take a
'Virtual Processor Set' as an argument rather than a simple 64-bit mask.
This patch introduces a similar variant of the HVCALL_SEND_IPI hypercall
(HVCALL_SEND_IPI_EX).

NOTE: As with HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST_EX, a guest should
      not yet issue the HVCALL_SEND_IPI_EX hypercall as support for
      'ExProcessorMasks' is not yet advertised via CPUID.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v2:
 - Sanity check size before hvm_copy_from_guest_phys()
---
 xen/arch/x86/hvm/viridian/viridian.c | 74 ++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index e736c0739da0..74227fecbcd4 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -860,6 +860,75 @@ static int hvcall_ipi(union hypercall_input *input,
     return 0;
 }
 
+static int hvcall_ipi_ex(union hypercall_input *input,
+                         union hypercall_output *output,
+                         unsigned long input_params_gpa,
+                         unsigned long output_params_gpa)
+{
+    struct hypercall_vpmask *vpmask = &this_cpu(hypercall_vpmask);
+    struct {
+        uint32_t vector;
+        uint8_t target_vtl;
+        uint8_t reserved_zero[3];
+        struct hv_vpset set;
+    } input_params;
+    struct hypercall_vpset *vpset = &this_cpu(hypercall_vpset);
+    struct hv_vpset *set = &vpset->set;
+    size_t size;
+    int rc;
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
+    if ( input_params.target_vtl ||
+         input_params.reserved_zero[0] ||
+         input_params.reserved_zero[1] ||
+         input_params.reserved_zero[2] )
+        return HV_STATUS_INVALID_PARAMETER;
+
+    if ( input_params.vector < 0x10 || input_params.vector > 0xff )
+        return HV_STATUS_INVALID_PARAMETER;
+
+    *set = input_params.set;
+    if ( set->format == HV_GENERIC_SET_SPARSE_4K )
+    {
+        unsigned long offset = offsetof(typeof(input_params),
+                                        set.bank_contents);
+
+        size = sizeof(*set->bank_contents) * hv_vpset_nr_banks(set);
+
+        if ( offsetof(typeof(*vpset), set.bank_contents[0]) + size >
+             sizeof(*vpset) )
+        {
+            ASSERT_UNREACHABLE();
+            return -EINVAL;
+        }
+
+        if ( hvm_copy_from_guest_phys(&set->bank_contents,
+                                      input_params_gpa + offset,
+                                      size) != HVMTRANS_okay)
+            return -EINVAL;
+
+        size += sizeof(*set);
+    }
+    else
+        size = sizeof(*set);
+
+    rc = hv_vpset_to_vpmask(set, vpmask);
+    if ( rc )
+        return rc;
+
+    send_ipi(vpmask, input_params.vector);
+
+    return 0;
+}
+
 int viridian_hypercall(struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
@@ -916,6 +985,11 @@ int viridian_hypercall(struct cpu_user_regs *regs)
                         output_params_gpa);
         break;
 
+    case HVCALL_SEND_IPI_EX:
+        rc = hvcall_ipi_ex(&input, &output, input_params_gpa,
+                           output_params_gpa);
+        break;
+
     default:
         gprintk(XENLOG_WARNING, "unimplemented hypercall %04x\n",
                 input.call_code);
-- 
2.20.1


