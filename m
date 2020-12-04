Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57572CEA3D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 09:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44156.79207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pr-0006VQ-Fg; Fri, 04 Dec 2020 08:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44156.79207; Fri, 04 Dec 2020 08:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pr-0006UX-6R; Fri, 04 Dec 2020 08:53:03 +0000
Received: by outflank-mailman (input) for mailman id 44156;
 Fri, 04 Dec 2020 08:53:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kl6po-0006R7-P4
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:53:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kl6po-000494-DL; Fri, 04 Dec 2020 08:53:00 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kl6po-00081O-5d; Fri, 04 Dec 2020 08:53:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=+0Al/tr4MJNf/ubHYvoVGtFEnTG6Fvjontp4axhb608=; b=K+uA/vPlVhnw6B2Cd4n3hb6Ytv
	LhfyaPwl70xjf38pluqEIy4yYZRLstm11FVEMiNZT6IMfJOFm0pOT31UGSb5RCzPdFJMwq4QV5u95
	U0IZDX8TUWb+cgKYsVrN8BzNI2O9WTUOhdNpGbvCq3rN34dAVYfROOXizqVG75ec9rQ4=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 03/11] viridian: move IPI hypercall implementation into separate function
Date: Fri,  4 Dec 2020 08:52:47 +0000
Message-Id: <20201204085255.26216-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201204085255.26216-1-paul@xen.org>
References: <20201204085255.26216-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This patch moves the implementation of HVCALL_SEND_IPI that is currently
inline in viridian_hypercall() into a new hvcall_ipi() function.

The new function returns Xen errno values similarly to hvcall_flush(). Hence
the errno translation code in viridial_hypercall() is generalized, removing
the need for the local 'status' variable.

NOTE: The formatting of the switch statement at the top of
      viridial_hypercall() is also adjusted as per CODING_STYLE.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v3:
 - Adjust prototype of new function

v2:
 - Different formatting adjustment
---
 xen/arch/x86/hvm/viridian/viridian.c | 168 ++++++++++++++-------------
 1 file changed, 87 insertions(+), 81 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index f0b3ee65e3aa..77e90b502c69 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -581,13 +581,72 @@ static int hvcall_flush(const union hypercall_input *input,
     return 0;
 }
 
+static int hvcall_ipi(const union hypercall_input *input,
+                      union hypercall_output *output,
+                      paddr_t input_params_gpa,
+                      paddr_t output_params_gpa)
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
 
@@ -600,11 +659,13 @@ int viridian_hypercall(struct cpu_user_regs *regs)
         input_params_gpa = regs->rdx;
         output_params_gpa = regs->r8;
         break;
+
     case 4:
         input.raw = (regs->rdx << 32) | regs->eax;
         input_params_gpa = (regs->rbx << 32) | regs->ecx;
         output_params_gpa = (regs->rdi << 32) | regs->esi;
         break;
+
     default:
         goto out;
     }
@@ -616,92 +677,18 @@ int viridian_hypercall(struct cpu_user_regs *regs)
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
@@ -714,12 +701,31 @@ int viridian_hypercall(struct cpu_user_regs *regs)
          * Given that return a status of 'invalid code' has not so far
          * caused any problems it's not worth logging.
          */
-        status = HV_STATUS_INVALID_HYPERCALL_CODE;
+        rc = -EOPNOTSUPP;
         break;
     }
 
  out:
-    output.result = status;
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
+        break;
+    }
+
     switch ( mode )
     {
     case 8:
-- 
2.20.1


