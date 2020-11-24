Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24772C307C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 20:08:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36809.68897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khdfO-0001Ro-3n; Tue, 24 Nov 2020 19:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36809.68897; Tue, 24 Nov 2020 19:07:54 +0000
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
	id 1khdfN-0001QG-T3; Tue, 24 Nov 2020 19:07:53 +0000
Received: by outflank-mailman (input) for mailman id 36809;
 Tue, 24 Nov 2020 19:07:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khdfM-0001PE-RA
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:07:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdfM-0003t9-Mo; Tue, 24 Nov 2020 19:07:52 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdfM-0000r4-E6; Tue, 24 Nov 2020 19:07:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfM-0001PE-RA
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=jXUtIM3q7XVre1T2PL1q5bRCrTalFKSE91vco2iGk0A=; b=nhQ9cUXszfVEANDtv+ELcv6B7G
	DKItv6UOyXSsThrIuA+P+yLqvsy//ueHU3iqJwNaKABIawYdyjSXIoUF7T8n+d6n8jHiOa/ZzDZbq
	EzUZ/OwMOnrDsQK4ryeNvdKPhYbua/34yGxRS9pa7gbzkpME9J9c2vG7m9GeifI6q54c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfM-0003t9-Mo; Tue, 24 Nov 2020 19:07:52 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com ([86.183.162.145] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfM-0000r4-E6; Tue, 24 Nov 2020 19:07:52 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 06/13] viridian: use softirq batching in hvcall_ipi()
Date: Tue, 24 Nov 2020 19:07:37 +0000
Message-Id: <20201124190744.11343-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201124190744.11343-1-paul@xen.org>
References: <20201124190744.11343-1-paul@xen.org>
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
index cdfeaec8b96b..4867a1bd140b 100644
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


