Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 054B62AF97C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 21:07:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25209.52853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcwOw-0003M9-9K; Wed, 11 Nov 2020 20:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25209.52853; Wed, 11 Nov 2020 20:07:30 +0000
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
	id 1kcwOv-0003Kz-VI; Wed, 11 Nov 2020 20:07:29 +0000
Received: by outflank-mailman (input) for mailman id 25209;
 Wed, 11 Nov 2020 20:07:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kcwOt-0003Hk-MB
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:07:27 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcwOt-0000pY-Dw; Wed, 11 Nov 2020 20:07:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcwOt-0003Hk-MB
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:07:27 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcwOt-0000pY-Dw; Wed, 11 Nov 2020 20:07:27 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 04/10] viridian: use hypercall_vpmask in hvcall_ipi()
Date: Wed, 11 Nov 2020 20:07:15 +0000
Message-Id: <20201111200721.30551-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111200721.30551-1-paul@xen.org>
References: <20201111200721.30551-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

A subsequent patch will need to IPI a mask of virtual processors potentially
wider than 64 bits. A previous patch introduced per-cpu hypercall_vpmask
to allow hvcall_flush() to deal with such wide masks. This patch modifies
the implementation of hvcall_ipi() to make use of the same mask structures,
introducing a for_each_vp() macro to facilitate traversing a mask.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/viridian/viridian.c | 43 ++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 4ab1f14b2248..63f63093a513 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -533,6 +533,21 @@ static bool vpmask_test(struct hypercall_vpmask *vpmask, unsigned int vp)
     return test_bit(vp, vpmask->mask);
 }
 
+static unsigned int vpmask_first(struct hypercall_vpmask *vpmask)
+{
+    return find_first_bit(vpmask->mask, HVM_MAX_VCPUS);
+}
+
+static unsigned int vpmask_next(struct hypercall_vpmask *vpmask, unsigned int vp)
+{
+    return find_next_bit(vpmask->mask, HVM_MAX_VCPUS, vp + 1);
+}
+
+#define for_each_vp(vpmask, vp) \
+	for ((vp) = vpmask_first(vpmask); \
+	     (vp) < HVM_MAX_VCPUS; \
+	     (vp) = vpmask_next(vpmask, vp))
+
 /*
  * Windows should not issue the hypercalls requiring this callback in the
  * case where vcpu_id would exceed the size of the mask.
@@ -624,15 +639,24 @@ static int hvcall_flush(union hypercall_input *input,
     return 0;
 }
 
+static void send_ipi(struct hypercall_vpmask *vpmask, uint8_t vector)
+{
+    struct domain *currd = current->domain;
+    unsigned int vp;
+
+    for_each_vp ( vpmask, vp )
+        vlapic_set_irq(vcpu_vlapic(currd->vcpu[vp]), vector, 0);
+}
+
 static int hvcall_ipi(union hypercall_input *input,
                       union hypercall_output *output,
                       unsigned long input_params_gpa,
                       unsigned long output_params_gpa)
 {
-    struct domain *currd = current->domain;
-    struct vcpu *v;
+    struct hypercall_vpmask *vpmask = &this_cpu(hypercall_vpmask);
     uint32_t vector;
     uint64_t vcpu_mask;
+    unsigned int vp;
 
     /* Get input parameters. */
     if ( input->fast )
@@ -669,17 +693,20 @@ static int hvcall_ipi(union hypercall_input *input,
     if ( vector < 0x10 || vector > 0xff )
         return -EINVAL;
 
-    for_each_vcpu ( currd, v )
+    vpmask_empty(vpmask);
+    for (vp = 0; vp < 64; vp++)
     {
-        if ( v->vcpu_id >= (sizeof(vcpu_mask) * 8) )
-            return -EINVAL;
+        if ( !vcpu_mask )
+            break;
 
-        if ( !(vcpu_mask & (1ul << v->vcpu_id)) )
-            continue;
+        if ( vcpu_mask & 1 )
+            vpmask_set(vpmask, vp);
 
-        vlapic_set_irq(vcpu_vlapic(v), vector, 0);
+        vcpu_mask >>= 1;
     }
 
+    send_ipi(vpmask, vector);
+
     return 0;
 }
 
-- 
2.20.1


