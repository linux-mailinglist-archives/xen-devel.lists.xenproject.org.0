Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FDB2CEA41
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 09:53:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44161.79243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pu-0006eB-Vn; Fri, 04 Dec 2020 08:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44161.79243; Fri, 04 Dec 2020 08:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pu-0006cS-Fm; Fri, 04 Dec 2020 08:53:06 +0000
Received: by outflank-mailman (input) for mailman id 44161;
 Fri, 04 Dec 2020 08:53:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kl6ps-0006XX-0s
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:53:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kl6pr-00049c-N7; Fri, 04 Dec 2020 08:53:03 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kl6pr-00081O-FS; Fri, 04 Dec 2020 08:53:03 +0000
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
	bh=e7E0uPlbvldsr+/Or2Usn28nGFXQXE0Lw/3OzuAS844=; b=OY+ZrhmXvDbIM5anfbTCwyHSQ7
	30+17YusEJP4C/9uJmN9sKEkYQJYER1LLIyicVMa7AOrV8qTPZ/tjl1ain7osv5p4sfO3bZndXP3l
	e3pWnu55uxJfdyhOg+O4cqsT7pM7MSEX42tZ32I4OshPooYduemELvob5fG99ldXLvMA=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 06/11] viridian: use softirq batching in hvcall_ipi()
Date: Fri,  4 Dec 2020 08:52:50 +0000
Message-Id: <20201204085255.26216-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201204085255.26216-1-paul@xen.org>
References: <20201204085255.26216-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

vlapic_ipi() uses a softirq batching mechanism to improve the efficiency of
sending a IPIs to large number of processors. This patch modifies send_ipi()
(the worker function called by hvcall_ipi()) to also make use of the
mechanism when there multiple bits set the hypercall_vpmask.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v2:
 - Don't add the 'nr' field to struct hypercall_vpmask and use
   bitmap_weight() instead
---
 xen/arch/x86/hvm/viridian/viridian.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 3e2393be4160..894946abcb72 100644
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
@@ -571,6 +572,11 @@ static unsigned int vpmask_next(const struct hypercall_vpmask *vpmask,
 	      (vp) < HVM_MAX_VCPUS; \
 	      (vp) = vpmask_next(vpmask, vp) )
 
+static unsigned int vpmask_nr(const struct hypercall_vpmask *vpmask)
+{
+    return bitmap_weight(vpmask->mask, HVM_MAX_VCPUS);
+}
+
 /*
  * Windows should not issue the hypercalls requiring this callback in the
  * case where vcpu_id would exceed the size of the mask.
@@ -654,10 +660,17 @@ static int hvcall_flush(const union hypercall_input *input,
 static void send_ipi(struct hypercall_vpmask *vpmask, uint8_t vector)
 {
     struct domain *currd = current->domain;
+    unsigned int nr = vpmask_nr(vpmask);
     unsigned int vp;
 
+    if ( nr > 1 )
+        cpu_raise_softirq_batch_begin();
+
     for_each_vp ( vpmask, vp )
         vlapic_set_irq(vcpu_vlapic(currd->vcpu[vp]), vector, 0);
+
+    if ( nr > 1 )
+        cpu_raise_softirq_batch_finish();
 }
 
 static int hvcall_ipi(const union hypercall_input *input,
-- 
2.20.1


