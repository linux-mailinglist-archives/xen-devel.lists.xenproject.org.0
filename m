Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC8F2AF979
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 21:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25207.52829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcwOt-0003GG-7l; Wed, 11 Nov 2020 20:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25207.52829; Wed, 11 Nov 2020 20:07:27 +0000
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
	id 1kcwOt-0003Ff-1C; Wed, 11 Nov 2020 20:07:27 +0000
Received: by outflank-mailman (input) for mailman id 25207;
 Wed, 11 Nov 2020 20:07:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kcwOr-0003E0-Fl
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:07:25 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcwOr-0000pY-7R; Wed, 11 Nov 2020 20:07:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcwOr-0003E0-Fl
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:07:25 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcwOr-0000pY-7R; Wed, 11 Nov 2020 20:07:25 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 02/10] viridian: move IPI hypercall implementation into separate function
Date: Wed, 11 Nov 2020 20:07:13 +0000
Message-Id: <20201111200721.30551-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111200721.30551-1-paul@xen.org>
References: <20201111200721.30551-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This patch moves the implementation of HVCALL_SEND_IPI that is currently
inline in viridian_hypercall() into a new hvcall_ipi() function.

The new function returns Xen errno values similarly to hvcall_flush(). Hence
the errno translation code in viridial_hypercall() is generalized, removing
the need for the local 'status' variable.

NOTE: The formatting of the 'out' label also corrected as per CODING_STYLE
      and the code is adjusted to avoid a register copy-back if 'mode' is
      neither 8 nor 4.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/viridian/viridian.c | 170 ++++++++++++++-------------
 1 file changed, 87 insertions(+), 83 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index f1a1b6a8af82..c4f720f58d6d 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -581,13 +581,72 @@ static int hvcall_flush(union hypercall_input *input,
     return 0;
 }
 
+static int hvcall_ipi(union hypercall_input *input,
+                      union hypercall_output *output,
+                      unsigned long input_params_gpa,
+                      unsigned long output_params_gpa)
+{
+    struct domain *currd = current->domain;
+    struct vcpu *v;
+    uint32_t vector;
+    uint64_t vcpu_mask;
+
+    /* Get input parameters. */
+    if ( input->fast )
+    {
+        if ( input_params_gpa >> 32 )
+            return -EINVAL;
+
+        vector = input_params_gpa;
+        vcpu_mask = output_params_gpa;
+    }
+    else
+    {
+        struct {
+            uint32_t vector;
+            uint8_t target_vtl;
+            uint8_t reserved_zero[3];
+            uint64_t vcpu_mask;
+        } input_params;
+
+        if ( hvm_copy_from_guest_phys(&input_params, input_params_gpa,
+                                      sizeof(input_params)) != HVMTRANS_okay )
+            return -EINVAL;
+
+        if ( input_params.target_vtl ||
+             input_params.reserved_zero[0] ||
+             input_params.reserved_zero[1] ||
+             input_params.reserved_zero[2] )
+            return -EINVAL;
+
+        vector = input_params.vector;
+        vcpu_mask = input_params.vcpu_mask;
+    }
+
+    if ( vector < 0x10 || vector > 0xff )
+        return -EINVAL;
+
+    for_each_vcpu ( currd, v )
+    {
+        if ( v->vcpu_id >= (sizeof(vcpu_mask) * 8) )
+            return -EINVAL;
+
+        if ( !(vcpu_mask & (1ul << v->vcpu_id)) )
+            continue;
+
+        vlapic_set_irq(vcpu_vlapic(v), vector, 0);
+    }
+
+    return 0;
+}
+
 int viridian_hypercall(struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
     int mode = hvm_guest_x86_mode(curr);
     unsigned long input_params_gpa, output_params_gpa;
-    uint16_t status = HV_STATUS_SUCCESS;
+    int rc = 0;
     union hypercall_input input;
     union hypercall_output output = {};
 
@@ -616,92 +675,18 @@ int viridian_hypercall(struct cpu_user_regs *regs)
          * See section 14.5.1 of the specification.
          */
         do_sched_op(SCHEDOP_yield, guest_handle_from_ptr(NULL, void));
-        status = HV_STATUS_SUCCESS;
         break;
 
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE:
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST:
-    {
-        int rc = hvcall_flush(&input, &output, input_params_gpa,
-                              output_params_gpa);
-
-        switch ( rc )
-        {
-        case 0:
-            break;
-
-        case -ERESTART:
-            return HVM_HCALL_preempted;
-
-        default:
-            ASSERT_UNREACHABLE();
-            /* Fallthrough */
-        case -EINVAL:
-            status = HV_STATUS_INVALID_PARAMETER;
-            break;
-        }
-
+        rc = hvcall_flush(&input, &output, input_params_gpa,
+                          output_params_gpa);
         break;
-    }
 
     case HVCALL_SEND_IPI:
-    {
-        struct vcpu *v;
-        uint32_t vector;
-        uint64_t vcpu_mask;
-
-        status = HV_STATUS_INVALID_PARAMETER;
-
-        /* Get input parameters. */
-        if ( input.fast )
-        {
-            if ( input_params_gpa >> 32 )
-                break;
-
-            vector = input_params_gpa;
-            vcpu_mask = output_params_gpa;
-        }
-        else
-        {
-            struct {
-                uint32_t vector;
-                uint8_t target_vtl;
-                uint8_t reserved_zero[3];
-                uint64_t vcpu_mask;
-            } input_params;
-
-            if ( hvm_copy_from_guest_phys(&input_params, input_params_gpa,
-                                          sizeof(input_params)) !=
-                 HVMTRANS_okay )
-                break;
-
-            if ( input_params.target_vtl ||
-                 input_params.reserved_zero[0] ||
-                 input_params.reserved_zero[1] ||
-                 input_params.reserved_zero[2] )
-                break;
-
-            vector = input_params.vector;
-            vcpu_mask = input_params.vcpu_mask;
-        }
-
-        if ( vector < 0x10 || vector > 0xff )
-            break;
-
-        for_each_vcpu ( currd, v )
-        {
-            if ( v->vcpu_id >= (sizeof(vcpu_mask) * 8) )
-                break;
-
-            if ( !(vcpu_mask & (1ul << v->vcpu_id)) )
-                continue;
-
-            vlapic_set_irq(vcpu_vlapic(v), vector, 0);
-        }
-
-        status = HV_STATUS_SUCCESS;
+        rc = hvcall_ipi(&input, &output, input_params_gpa,
+                        output_params_gpa);
         break;
-    }
 
     default:
         gprintk(XENLOG_WARNING, "unimplemented hypercall %04x\n",
@@ -714,17 +699,36 @@ int viridian_hypercall(struct cpu_user_regs *regs)
          * Given that return a status of 'invalid code' has not so far
          * caused any problems it's not worth logging.
          */
-        status = HV_STATUS_INVALID_HYPERCALL_CODE;
+        rc = -EOPNOTSUPP;
+        break;
+    }
+
+ out:
+    switch ( rc )
+    {
+    case 0:
+        break;
+
+    case -ERESTART:
+        return HVM_HCALL_preempted;
+
+    case -EOPNOTSUPP:
+        output.result = HV_STATUS_INVALID_HYPERCALL_CODE;
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        /* Fallthrough */
+    case -EINVAL:
+        output.result = HV_STATUS_INVALID_PARAMETER;
         break;
     }
 
-out:
-    output.result = status;
     switch (mode) {
     case 8:
         regs->rax = output.raw;
         break;
-    default:
+    case 4:
         regs->rdx = output.raw >> 32;
         regs->rax = (uint32_t)output.raw;
         break;
-- 
2.20.1


