Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690D72CEA40
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 09:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44160.79227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pt-0006Zx-5k; Fri, 04 Dec 2020 08:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44160.79227; Fri, 04 Dec 2020 08:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6ps-0006Xu-TI; Fri, 04 Dec 2020 08:53:04 +0000
Received: by outflank-mailman (input) for mailman id 44160;
 Fri, 04 Dec 2020 08:53:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kl6pq-0006UL-Qv
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:53:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kl6pq-00049V-KR; Fri, 04 Dec 2020 08:53:02 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kl6pq-00081O-CE; Fri, 04 Dec 2020 08:53:02 +0000
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
	bh=VB9C9TJfNJjFaO4TuFClll7Hzlvku7IXdGGyn//ncrE=; b=2wXi7Y0oDqBLVpVfPXP1r0Iyvl
	bfM1+20z4RznhHEEmQj7mM3OyF5tPgsCDnpai3pEn9rDaP666Sh20GEXBcEfYmZNb87tT1Gn9EzNN
	A5YsWwYraeRVjAANOTd0pWMljFl9ReSgxU54DP164TM+P2leEc//keUb1axcvkBYT5qs=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 05/11] viridian: use hypercall_vpmask in hvcall_ipi()
Date: Fri,  4 Dec 2020 08:52:49 +0000
Message-Id: <20201204085255.26216-6-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201204085255.26216-1-paul@xen.org>
References: <20201204085255.26216-1-paul@xen.org>
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

v3:
 - Couple of extra 'const' qualifiers

v2:
 - Drop the 'vp' loop now that vpmask_set() will do it internally
---
 xen/arch/x86/hvm/viridian/viridian.c | 44 +++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 0274c8f2eec1..3e2393be4160 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -551,6 +551,26 @@ static bool vpmask_test(const struct hypercall_vpmask *vpmask,
     return test_bit(vp, vpmask->mask);
 }
 
+static unsigned int vpmask_first(const struct hypercall_vpmask *vpmask)
+{
+    return find_first_bit(vpmask->mask, HVM_MAX_VCPUS);
+}
+
+static unsigned int vpmask_next(const struct hypercall_vpmask *vpmask,
+                                unsigned int vp)
+{
+    /*
+     * If vp + 1 > HVM_MAX_VCPUS then find_next_bit() will return
+     * HVM_MAX_VCPUS, ensuring the for_each_vp ( ... ) loop terminates.
+     */
+    return find_next_bit(vpmask->mask, HVM_MAX_VCPUS, vp + 1);
+}
+
+#define for_each_vp(vpmask, vp) \
+	for ( (vp) = vpmask_first(vpmask); \
+	      (vp) < HVM_MAX_VCPUS; \
+	      (vp) = vpmask_next(vpmask, vp) )
+
 /*
  * Windows should not issue the hypercalls requiring this callback in the
  * case where vcpu_id would exceed the size of the mask.
@@ -631,13 +651,21 @@ static int hvcall_flush(const union hypercall_input *input,
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
 static int hvcall_ipi(const union hypercall_input *input,
                       union hypercall_output *output,
                       paddr_t input_params_gpa,
                       paddr_t output_params_gpa)
 {
-    struct domain *currd = current->domain;
-    struct vcpu *v;
+    struct hypercall_vpmask *vpmask = &this_cpu(hypercall_vpmask);
     uint32_t vector;
     uint64_t vcpu_mask;
 
@@ -676,16 +704,10 @@ static int hvcall_ipi(const union hypercall_input *input,
     if ( vector < 0x10 || vector > 0xff )
         return -EINVAL;
 
-    for_each_vcpu ( currd, v )
-    {
-        if ( v->vcpu_id >= (sizeof(vcpu_mask) * 8) )
-            return -EINVAL;
+    vpmask_empty(vpmask);
+    vpmask_set(vpmask, 0, vcpu_mask);
 
-        if ( !(vcpu_mask & (1ul << v->vcpu_id)) )
-            continue;
-
-        vlapic_set_irq(vcpu_vlapic(v), vector, 0);
-    }
+    send_ipi(vpmask, vector);
 
     return 0;
 }
-- 
2.20.1


