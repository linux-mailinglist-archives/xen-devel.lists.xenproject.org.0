Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46742BA683
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 10:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31837.62605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg32T-0005Gs-S8; Fri, 20 Nov 2020 09:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31837.62605; Fri, 20 Nov 2020 09:49:09 +0000
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
	id 1kg32T-0005G8-MS; Fri, 20 Nov 2020 09:49:09 +0000
Received: by outflank-mailman (input) for mailman id 31837;
 Fri, 20 Nov 2020 09:49:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kg32S-0005Dl-8Q
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:49:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg32R-0002ax-TV; Fri, 20 Nov 2020 09:49:07 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg32R-0003d1-LL; Fri, 20 Nov 2020 09:49:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32S-0005Dl-8Q
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=4IjgffEuEnKUzkPcG7Uko4N1YazvYI/Qlj97s2cqBCg=; b=S/HE5+4x9GMOk4dbcXx475CQip
	048rsSSEQodcBZgPP7ozR4YFkR4C9msBDMUBZ35LzAQ6dH+uY2Y4JQBD6PYXClpCIc7nqPQuTsqN7
	yOaigimt5tjyDY1as8zr2wZ5SWhOGo7tbIJ3Soq1DcibVSp9fsAnQu/0qqVtejpVObIU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32R-0002ax-TV; Fri, 20 Nov 2020 09:49:07 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32R-0003d1-LL; Fri, 20 Nov 2020 09:49:07 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 04/12] viridian: introduce a per-cpu hypercall_vpmask and accessor functions...
Date: Fri, 20 Nov 2020 09:48:52 +0000
Message-Id: <20201120094900.1489-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201120094900.1489-1-paul@xen.org>
References: <20201120094900.1489-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... and make use of them in hvcall_flush()/need_flush().

Subsequent patches will need to deal with virtual processor masks potentially
wider than 64 bits. Thus, to avoid using too much stack, this patch
introduces global per-cpu virtual processor masks and converts the
implementation of hvcall_flush() to use them.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v2:
 - Modified vpmask_set() to take a base 'vp' and a 64-bit 'mask', still
   looping over the mask as bitmap.h does not provide a primitive for copying
   one mask into another at an offset
 - Added ASSERTions to verify that we don't attempt to set or test bits
   beyond the limit of the map
---
 xen/arch/x86/hvm/viridian/viridian.c | 58 ++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index d9864cdc0b7d..334d8527ff59 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -507,15 +507,59 @@ void viridian_domain_deinit(struct domain *d)
     XFREE(d->arch.hvm.viridian);
 }
 
+struct hypercall_vpmask {
+    DECLARE_BITMAP(mask, HVM_MAX_VCPUS);
+};
+
+static DEFINE_PER_CPU(struct hypercall_vpmask, hypercall_vpmask);
+
+static void vpmask_empty(struct hypercall_vpmask *vpmask)
+{
+    bitmap_zero(vpmask->mask, HVM_MAX_VCPUS);
+}
+
+static void vpmask_set(struct hypercall_vpmask *vpmask, unsigned int vp,
+                       uint64_t mask)
+{
+    unsigned int count = sizeof(mask) * 8;
+
+    while ( count-- )
+    {
+        if ( !mask )
+            break;
+
+        if ( mask & 1 )
+        {
+            ASSERT(vp < HVM_MAX_VCPUS);
+            __set_bit(vp, vpmask->mask);
+        }
+
+        mask >>= 1;
+        vp++;
+    }
+}
+
+static void vpmask_fill(struct hypercall_vpmask *vpmask)
+{
+    bitmap_fill(vpmask->mask, HVM_MAX_VCPUS);
+}
+
+static bool vpmask_test(const struct hypercall_vpmask *vpmask,
+                        unsigned int vp)
+{
+    ASSERT(vp < HVM_MAX_VCPUS);
+    return test_bit(vp, vpmask->mask);
+}
+
 /*
  * Windows should not issue the hypercalls requiring this callback in the
  * case where vcpu_id would exceed the size of the mask.
  */
 static bool need_flush(void *ctxt, struct vcpu *v)
 {
-    uint64_t vcpu_mask = *(uint64_t *)ctxt;
+    struct hypercall_vpmask *vpmask = ctxt;
 
-    return vcpu_mask & (1ul << v->vcpu_id);
+    return vpmask_test(vpmask, v->vcpu_id);
 }
 
 union hypercall_input {
@@ -546,6 +590,7 @@ static int hvcall_flush(union hypercall_input *input,
                         unsigned long input_params_gpa,
                         unsigned long output_params_gpa)
 {
+    struct hypercall_vpmask *vpmask = &this_cpu(hypercall_vpmask);
     struct {
         uint64_t address_space;
         uint64_t flags;
@@ -567,13 +612,18 @@ static int hvcall_flush(union hypercall_input *input,
      * so err on the safe side.
      */
     if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS )
-        input_params.vcpu_mask = ~0ul;
+        vpmask_fill(vpmask);
+    else
+    {
+        vpmask_empty(vpmask);
+        vpmask_set(vpmask, 0, input_params.vcpu_mask);
+    }
 
     /*
      * A false return means that another vcpu is currently trying
      * a similar operation, so back off.
      */
-    if ( !paging_flush_tlb(need_flush, &input_params.vcpu_mask) )
+    if ( !paging_flush_tlb(need_flush, vpmask) )
         return -ERESTART;
 
     output->rep_complete = input->rep_count;
-- 
2.20.1


