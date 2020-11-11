Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A392AF97D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 21:07:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25210.52862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcwOw-0003NQ-OS; Wed, 11 Nov 2020 20:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25210.52862; Wed, 11 Nov 2020 20:07:30 +0000
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
	id 1kcwOw-0003Ly-FF; Wed, 11 Nov 2020 20:07:30 +0000
Received: by outflank-mailman (input) for mailman id 25210;
 Wed, 11 Nov 2020 20:07:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kcwOu-0003JZ-PB
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:07:28 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcwOu-0000pY-HB; Wed, 11 Nov 2020 20:07:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcwOu-0003JZ-PB
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:07:28 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcwOu-0000pY-HB; Wed, 11 Nov 2020 20:07:28 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 05/10] viridian: use softirq batching in hvcall_ipi()
Date: Wed, 11 Nov 2020 20:07:16 +0000
Message-Id: <20201111200721.30551-6-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111200721.30551-1-paul@xen.org>
References: <20201111200721.30551-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

vlapic_ipi() uses a softirq batching mechanism to improve the efficiency of
sending a IPIs to large number of processors. This patch modifies send_ipi()
(the worker function called by hvcall_ipi()) to also make use of the
mechanism when there multiple bits set the hypercall_vpmask. Hence a `nr`
field is added to the structure to track the number of set bits.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/viridian/viridian.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 63f63093a513..765d53016c02 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -11,6 +11,7 @@
 #include <xen/hypercall.h>
 #include <xen/domain_page.h>
 #include <xen/param.h>
+#include <xen/softirq.h>
 #include <asm/guest/hyperv-tlfs.h>
 #include <asm/paging.h>
 #include <asm/p2m.h>
@@ -509,6 +510,7 @@ void viridian_domain_deinit(struct domain *d)
 
 struct hypercall_vpmask {
     DECLARE_BITMAP(mask, HVM_MAX_VCPUS);
+    unsigned int nr;
 };
 
 static DEFINE_PER_CPU(struct hypercall_vpmask, hypercall_vpmask);
@@ -516,21 +518,24 @@ static DEFINE_PER_CPU(struct hypercall_vpmask, hypercall_vpmask);
 static void vpmask_empty(struct hypercall_vpmask *vpmask)
 {
     bitmap_zero(vpmask->mask, HVM_MAX_VCPUS);
+    vpmask->nr = 0;
 }
 
 static void vpmask_set(struct hypercall_vpmask *vpmask, unsigned int vp)
 {
-    __set_bit(vp, vpmask->mask);
+    if ( !test_and_set_bit(vp, vpmask->mask) )
+        vpmask->nr++;
 }
 
 static void vpmask_fill(struct hypercall_vpmask *vpmask)
 {
     bitmap_fill(vpmask->mask, HVM_MAX_VCPUS);
+    vpmask->nr = HVM_MAX_VCPUS;
 }
 
 static bool vpmask_test(struct hypercall_vpmask *vpmask, unsigned int vp)
 {
-    return test_bit(vp, vpmask->mask);
+    return vpmask->nr && test_bit(vp, vpmask->mask);
 }
 
 static unsigned int vpmask_first(struct hypercall_vpmask *vpmask)
@@ -644,8 +649,17 @@ static void send_ipi(struct hypercall_vpmask *vpmask, uint8_t vector)
     struct domain *currd = current->domain;
     unsigned int vp;
 
+    if ( !vpmask->nr )
+        return;
+
+    if ( vpmask->nr > 1 )
+        cpu_raise_softirq_batch_begin();
+
     for_each_vp ( vpmask, vp )
         vlapic_set_irq(vcpu_vlapic(currd->vcpu[vp]), vector, 0);
+
+    if ( vpmask->nr > 1 )
+        cpu_raise_softirq_batch_finish();
 }
 
 static int hvcall_ipi(union hypercall_input *input,
-- 
2.20.1


