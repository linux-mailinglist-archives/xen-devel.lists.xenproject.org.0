Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCE92BA681
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 10:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31839.62626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg32V-0005Km-N4; Fri, 20 Nov 2020 09:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31839.62626; Fri, 20 Nov 2020 09:49:11 +0000
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
	id 1kg32V-0005JR-Dz; Fri, 20 Nov 2020 09:49:11 +0000
Received: by outflank-mailman (input) for mailman id 31839;
 Fri, 20 Nov 2020 09:49:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kg32U-0005IB-8N
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:49:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg32U-0002bG-5k; Fri, 20 Nov 2020 09:49:10 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg32T-0003d1-U8; Fri, 20 Nov 2020 09:49:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32U-0005IB-8N
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=WvuwwpXtHIjcO9NlLF0rzPVaiYPqjWXaNgyK1WMlZ8U=; b=HTeXAkg4QeahXXWEcacrgWgUKq
	7SgIVGWC5T/JtLEyEBCLKtYlFzrQcDejLNm93hzt+2X5P6rs43IgAcOVZphuVSS/GCqIyRPBQVo9F
	0HXT2qaB8HG/j2UYW8aTEz5T7fcrrOZI83Q1o+xgF1AhmNfLI7S8Tx1KkAvubFtnsQ1o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32U-0002bG-5k; Fri, 20 Nov 2020 09:49:10 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32T-0003d1-U8; Fri, 20 Nov 2020 09:49:10 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 06/12] viridian: use softirq batching in hvcall_ipi()
Date: Fri, 20 Nov 2020 09:48:54 +0000
Message-Id: <20201120094900.1489-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201120094900.1489-1-paul@xen.org>
References: <20201120094900.1489-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

vlapic_ipi() uses a softirq batching mechanism to improve the efficiency of
sending a IPIs to large number of processors. This patch modifies send_ipi()
(the worker function called by hvcall_ipi()) to also make use of the
mechanism when there multiple bits set the hypercall_vpmask.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v2:
 - Don't add the 'nr' field to struct hypercall_vpmask and use
   bitmap_weight() instead
---
 xen/arch/x86/hvm/viridian/viridian.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index d8d8ecc89c80..d6f47b28c1e6 100644
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
@@ -570,6 +571,11 @@ static unsigned int vpmask_next(struct hypercall_vpmask *vpmask, unsigned int vp
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
@@ -653,10 +659,17 @@ static int hvcall_flush(union hypercall_input *input,
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
 
 static int hvcall_ipi(union hypercall_input *input,
-- 
2.20.1


