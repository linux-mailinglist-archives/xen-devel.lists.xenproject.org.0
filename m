Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B16AB2AF980
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 21:07:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25213.52896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcwP0-0003Y5-QF; Wed, 11 Nov 2020 20:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25213.52896; Wed, 11 Nov 2020 20:07:34 +0000
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
	id 1kcwP0-0003Uy-9y; Wed, 11 Nov 2020 20:07:34 +0000
Received: by outflank-mailman (input) for mailman id 25213;
 Wed, 11 Nov 2020 20:07:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kcwOy-0003RR-2w
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:07:32 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcwOx-0000pY-Qt; Wed, 11 Nov 2020 20:07:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcwOy-0003RR-2w
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:07:32 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcwOx-0000pY-Qt; Wed, 11 Nov 2020 20:07:32 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 08/10] viridian: log initial invocation of each type of hypercall
Date: Wed, 11 Nov 2020 20:07:19 +0000
Message-Id: <20201111200721.30551-9-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111200721.30551-1-paul@xen.org>
References: <20201111200721.30551-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

To make is simpler to observe which viridian hypercalls are issued by a
particular Windows guest, this patch adds a per-domain mask to track them.
Each type of hypercall causes a different bit to be set in the mask and
when the bit transitions from clear to set, a log line is emitted showing
the name of the hypercall and the domain that issued it.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/viridian/viridian.c | 21 +++++++++++++++++++++
 xen/include/asm-x86/hvm/viridian.h   |  8 ++++++++
 2 files changed, 29 insertions(+)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index e899dd1e9f55..670fec3a4870 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -930,6 +930,7 @@ int viridian_hypercall(struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
+    struct viridian_domain *vd = currd->arch.hvm.viridian;
     int mode = hvm_guest_x86_mode(curr);
     unsigned long input_params_gpa, output_params_gpa;
     int rc = 0;
@@ -957,6 +958,10 @@ int viridian_hypercall(struct cpu_user_regs *regs)
     switch ( input.call_code )
     {
     case HVCALL_NOTIFY_LONG_SPIN_WAIT:
+        if ( !test_and_set_bit(_HCALL_spin_wait, &vd->hypercall_flags) )
+            printk(XENLOG_G_INFO "d%d: VIRIDIAN HVCALL_NOTIFY_LONG_SPIN_WAIT\n",
+                   currd->domain_id);
+
         /*
          * See section 14.5.1 of the specification.
          */
@@ -965,22 +970,38 @@ int viridian_hypercall(struct cpu_user_regs *regs)
 
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE:
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST:
+        if ( !test_and_set_bit(_HCALL_flush, &vd->hypercall_flags) )
+            printk(XENLOG_G_INFO "%pd: VIRIDIAN HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST\n",
+                   currd);
+
         rc = hvcall_flush(&input, &output, input_params_gpa,
                           output_params_gpa);
         break;
 
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE_EX:
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST_EX:
+        if ( !test_and_set_bit(_HCALL_flush_ex, &vd->hypercall_flags) )
+            printk(XENLOG_G_INFO "%pd: VIRIDIAN HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST_EX\n",
+                   currd);
+
         rc = hvcall_flush_ex(&input, &output, input_params_gpa,
                              output_params_gpa);
         break;
 
     case HVCALL_SEND_IPI:
+        if ( !test_and_set_bit(_HCALL_ipi, &vd->hypercall_flags) )
+            printk(XENLOG_G_INFO "%pd: VIRIDIAN HVCALL_SEND_IPI\n",
+                   currd);
+
         rc = hvcall_ipi(&input, &output, input_params_gpa,
                         output_params_gpa);
         break;
 
     case HVCALL_SEND_IPI_EX:
+        if ( !test_and_set_bit(_HCALL_ipi_ex, &vd->hypercall_flags) )
+            printk(XENLOG_G_INFO "%pd: VIRIDIAN HVCALL_SEND_IPI_EX\n",
+                   currd);
+
         rc = hvcall_ipi_ex(&input, &output, input_params_gpa,
                            output_params_gpa);
         break;
diff --git a/xen/include/asm-x86/hvm/viridian.h b/xen/include/asm-x86/hvm/viridian.h
index cbf77d9c760b..d176c4b9153b 100644
--- a/xen/include/asm-x86/hvm/viridian.h
+++ b/xen/include/asm-x86/hvm/viridian.h
@@ -59,6 +59,14 @@ struct viridian_domain
 {
     union hv_guest_os_id guest_os_id;
     union hv_vp_assist_page_msr hypercall_gpa;
+    unsigned long hypercall_flags;
+
+#define _HCALL_spin_wait 0
+#define _HCALL_flush 1
+#define _HCALL_flush_ex 2
+#define _HCALL_ipi 3
+#define _HCALL_ipi_ex 4
+
     struct viridian_time_ref_count time_ref_count;
     struct viridian_page reference_tsc;
 };
-- 
2.20.1


