Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D012D0E6C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:50:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46213.82000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmE6J-0001on-JC; Mon, 07 Dec 2020 10:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46213.82000; Mon, 07 Dec 2020 10:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmE6J-0001oO-FC; Mon, 07 Dec 2020 10:50:39 +0000
Received: by outflank-mailman (input) for mailman id 46213;
 Mon, 07 Dec 2020 10:50:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmE6H-0001oH-Rc
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:50:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c265d1a1-d027-4f5a-b340-214ae9c34add;
 Mon, 07 Dec 2020 10:50:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 620AFAC90;
 Mon,  7 Dec 2020 10:50:36 +0000 (UTC)
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
X-Inumbo-ID: c265d1a1-d027-4f5a-b340-214ae9c34add
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607338236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=emEnPp+Epqcvw33KMvAizqtN7vgoaG6rdwXlXDb0rKA=;
	b=X7qU6aqVKiA17Mkt2LASL3UFwibZ4A/6qUYU6LTAOcc2reZUYdyCMFeWEDtujIiIA4vZ8o
	ym03EcN+/yzIeblqiATAdRLxGpGsH7G8JS+c/fmrrH8HTkSCQlcTnC5cWraw0/eDFtYGpv
	anrHjoENMJkzoLfx53aS3Xa0zxyF7r4=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/vPMU: make use of xmalloc_flex_struct()
Message-ID: <89357ce5-6a2b-9abf-0655-6bebced091bd@suse.com>
Date: Mon, 7 Dec 2020 11:50:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

... instead of effectively open-coding it in a type-unsafe way. Drop the
regs_sz variable altogether, replacing other uses suitably.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -44,9 +44,6 @@ static const u32 __read_mostly *counters
 static const u32 __read_mostly *ctrls;
 static bool_t __read_mostly k7_counters_mirrored;
 
-/* Total size of PMU registers block (copied to/from PV(H) guest) */
-static unsigned int __read_mostly regs_sz;
-
 #define F10H_NUM_COUNTERS   4
 #define F15H_NUM_COUNTERS   6
 #define MAX_NUM_COUNTERS    F15H_NUM_COUNTERS
@@ -156,12 +153,9 @@ static inline u32 get_fam15h_addr(u32 ad
 
 static void amd_vpmu_init_regs(struct xen_pmu_amd_ctxt *ctxt)
 {
-    unsigned i;
-    uint64_t *ctrl_regs = vpmu_reg_pointer(ctxt, ctrls);
-
-    memset(&ctxt->regs[0], 0, regs_sz);
-    for ( i = 0; i < num_counters; i++ )
-        ctrl_regs[i] = ctrl_rsvd[i];
+    memset(&ctxt->regs[0], 0, num_counters * sizeof(ctxt->regs[0]));
+    memcpy(&ctxt->regs[num_counters], &ctrl_rsvd[0],
+           num_counters * sizeof(ctxt->regs[0]));
 }
 
 static void amd_vpmu_set_msr_bitmap(struct vcpu *v)
@@ -242,7 +236,8 @@ static int amd_vpmu_load(struct vcpu *v,
         ctxt = vpmu->context;
         ctrl_regs = vpmu_reg_pointer(ctxt, ctrls);
 
-        memcpy(&ctxt->regs[0], &guest_ctxt->regs[0], regs_sz);
+        memcpy(&ctxt->regs[0], &guest_ctxt->regs[0],
+               2 * num_counters * sizeof(ctxt->regs[0]));
 
         for ( i = 0; i < num_counters; i++ )
         {
@@ -316,7 +311,8 @@ static int amd_vpmu_save(struct vcpu *v,
         ASSERT(!has_vlapic(v->domain));
         ctxt = vpmu->context;
         guest_ctxt = &vpmu->xenpmu_data->pmu.c.amd;
-        memcpy(&guest_ctxt->regs[0], &ctxt->regs[0], regs_sz);
+        memcpy(&guest_ctxt->regs[0], &ctxt->regs[0],
+               2 * num_counters * sizeof(ctxt->regs[0]));
     }
 
     return 1;
@@ -508,7 +504,8 @@ int svm_vpmu_initialise(struct vcpu *v)
     if ( !counters )
         return -EINVAL;
 
-    ctxt = xmalloc_bytes(sizeof(*ctxt) + regs_sz);
+    ctxt = xmalloc_flex_struct(struct xen_pmu_amd_ctxt, regs,
+                               2 * num_counters);
     if ( !ctxt )
     {
         printk(XENLOG_G_WARNING "Insufficient memory for PMU, "
@@ -565,8 +562,6 @@ static int __init common_init(void)
         ctrl_rsvd[i] &= CTRL_RSVD_MASK;
     }
 
-    regs_sz = 2 * sizeof(uint64_t) * num_counters;
-
     return 0;
 }
 

