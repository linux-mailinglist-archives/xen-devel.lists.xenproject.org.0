Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CB82C3078
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 20:08:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36805.68851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khdfK-0001Jp-7q; Tue, 24 Nov 2020 19:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36805.68851; Tue, 24 Nov 2020 19:07:50 +0000
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
	id 1khdfK-0001JI-3Q; Tue, 24 Nov 2020 19:07:50 +0000
Received: by outflank-mailman (input) for mailman id 36805;
 Tue, 24 Nov 2020 19:07:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khdfI-0001IE-HP
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:07:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdfI-0003sh-9A; Tue, 24 Nov 2020 19:07:48 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdfH-0000r4-TQ; Tue, 24 Nov 2020 19:07:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfI-0001IE-HP
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=l+HwUUf2wLYBW7rdHkqfybrg3vkpvm3Asp9ED/PY4ng=; b=Pke8eRJlxfyrXxyYfpFgmZB7kO
	1EEUV8sTdIgiw7Dw7E+R0hKJWMndwMq1xKxqh+G/2BK/nCte21PnvnVXeGlQ3BpmDAIfTn98Msvqx
	kPH1gHl0e/OEYgYBnknq5hzDQoMljHnAkVNG2UOF6Xe8WJEBmuE+Rm6oxLj/mjw3zA2s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfI-0003sh-9A; Tue, 24 Nov 2020 19:07:48 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com ([86.183.162.145] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfH-0000r4-TQ; Tue, 24 Nov 2020 19:07:48 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 02/13] viridian: move flush hypercall implementation into separate function
Date: Tue, 24 Nov 2020 19:07:33 +0000
Message-Id: <20201124190744.11343-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201124190744.11343-1-paul@xen.org>
References: <20201124190744.11343-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This patch moves the implementation of HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST
that is currently inline in viridian_hypercall() into a new hvcall_flush()
function.

The new function returns Xen erro values which are then dealt with
appropriately. A return value of -ERESTART translates to viridian_hypercall()
returning HVM_HCALL_preempted. Other return values translate to status codes
and viridian_hypercall() returning HVM_HCALL_completed. Currently the only
values, other than -ERESTART, returned by hvcall_flush() are 0 (indicating
success) or -EINVAL.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v3:
 - Adjust prototype of new function
---
 xen/arch/x86/hvm/viridian/viridian.c | 130 ++++++++++++++++-----------
 1 file changed, 78 insertions(+), 52 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 54035f75cb1a..7871e425cbfe 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -518,6 +518,69 @@ static bool need_flush(void *ctxt, struct vcpu *v)
     return vcpu_mask & (1ul << v->vcpu_id);
 }
 
+union hypercall_input {
+    uint64_t raw;
+    struct {
+        uint16_t call_code;
+        uint16_t fast:1;
+        uint16_t rsvd1:15;
+        uint16_t rep_count:12;
+        uint16_t rsvd2:4;
+        uint16_t rep_start:12;
+        uint16_t rsvd3:4;
+    };
+};
+
+union hypercall_output {
+    uint64_t raw;
+    struct {
+        uint16_t result;
+        uint16_t rsvd1;
+        uint32_t rep_complete:12;
+        uint32_t rsvd2:20;
+    };
+};
+
+static int hvcall_flush(const union hypercall_input *input,
+                        union hypercall_output *output,
+                        paddr_t input_params_gpa,
+                        paddr_t output_params_gpa)
+{
+    struct {
+        uint64_t address_space;
+        uint64_t flags;
+        uint64_t vcpu_mask;
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
+    /*
+     * It is not clear from the spec. if we are supposed to
+     * include current virtual CPU in the set or not in this case,
+     * so err on the safe side.
+     */
+    if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS )
+        input_params.vcpu_mask = ~0ul;
+
+    /*
+     * A false return means that another vcpu is currently trying
+     * a similar operation, so back off.
+     */
+    if ( !paging_flush_tlb(need_flush, &input_params.vcpu_mask) )
+        return -ERESTART;
+
+    output->rep_complete = input->rep_count;
+
+    return 0;
+}
+
 int viridian_hypercall(struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
@@ -525,29 +588,8 @@ int viridian_hypercall(struct cpu_user_regs *regs)
     int mode = hvm_guest_x86_mode(curr);
     unsigned long input_params_gpa, output_params_gpa;
     uint16_t status = HV_STATUS_SUCCESS;
-
-    union hypercall_input {
-        uint64_t raw;
-        struct {
-            uint16_t call_code;
-            uint16_t fast:1;
-            uint16_t rsvd1:15;
-            uint16_t rep_count:12;
-            uint16_t rsvd2:4;
-            uint16_t rep_start:12;
-            uint16_t rsvd3:4;
-        };
-    } input;
-
-    union hypercall_output {
-        uint64_t raw;
-        struct {
-            uint16_t result;
-            uint16_t rsvd1;
-            uint32_t rep_complete:12;
-            uint32_t rsvd2:20;
-        };
-    } output = { 0 };
+    union hypercall_input input;
+    union hypercall_output output = {};
 
     ASSERT(is_viridian_domain(currd));
 
@@ -580,41 +622,25 @@ int viridian_hypercall(struct cpu_user_regs *regs)
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE:
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST:
     {
-        struct {
-            uint64_t address_space;
-            uint64_t flags;
-            uint64_t vcpu_mask;
-        } input_params;
+        int rc = hvcall_flush(&input, &output, input_params_gpa,
+                              output_params_gpa);
 
-        /* These hypercalls should never use the fast-call convention. */
-        status = HV_STATUS_INVALID_PARAMETER;
-        if ( input.fast )
+        switch ( rc )
+        {
+        case 0:
             break;
 
-        /* Get input parameters. */
-        if ( hvm_copy_from_guest_phys(&input_params, input_params_gpa,
-                                      sizeof(input_params)) !=
-             HVMTRANS_okay )
-            break;
-
-        /*
-         * It is not clear from the spec. if we are supposed to
-         * include current virtual CPU in the set or not in this case,
-         * so err on the safe side.
-         */
-        if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS )
-            input_params.vcpu_mask = ~0ul;
-
-        /*
-         * A false return means that another vcpu is currently trying
-         * a similar operation, so back off.
-         */
-        if ( !paging_flush_tlb(need_flush, &input_params.vcpu_mask) )
+        case -ERESTART:
             return HVM_HCALL_preempted;
 
-        output.rep_complete = input.rep_count;
+        default:
+            ASSERT_UNREACHABLE();
+            /* Fallthrough */
+        case -EINVAL:
+            status = HV_STATUS_INVALID_PARAMETER;
+            break;
+        }
 
-        status = HV_STATUS_SUCCESS;
         break;
     }
 
-- 
2.20.1


