Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A42A4392
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18245.43225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZu0O-0005NF-Aj; Tue, 03 Nov 2020 10:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18245.43225; Tue, 03 Nov 2020 10:57:36 +0000
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
	id 1kZu0O-0005Mo-7g; Tue, 03 Nov 2020 10:57:36 +0000
Received: by outflank-mailman (input) for mailman id 18245;
 Tue, 03 Nov 2020 10:57:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZu0M-0005Mb-WD
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:57:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f6f69f0e-ad4a-49e5-a948-7e5a417ccecc;
 Tue, 03 Nov 2020 10:57:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30207AC8C;
 Tue,  3 Nov 2020 10:57:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZu0M-0005Mb-WD
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:57:35 +0000
X-Inumbo-ID: f6f69f0e-ad4a-49e5-a948-7e5a417ccecc
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id f6f69f0e-ad4a-49e5-a948-7e5a417ccecc;
	Tue, 03 Nov 2020 10:57:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604401053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=McZ0BgAGUmxFUr4xKQf+8oaTAT8M4nBK6Ql+lYPz1kI=;
	b=NKitQ3yw1SjnKZ/+2j2zIe4JKMG+VmNdTN42crxe6oDwvnMHURiFha0+v5bkb1Lnw1bsex
	vxtGVZnjvBDH4fCdrIH+1AgxDyI5chTA8FTjWQPU9sqmh5hXOVuGFm8V5FD4knFfELn7WZ
	b8MV8PZFT+zYpJb2FePlWIqJueK7zOU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 30207AC8C;
	Tue,  3 Nov 2020 10:57:33 +0000 (UTC)
Subject: [PATCH 4/5] x86/PV: restrict TLB flushing after mod_l[234]_entry()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Message-ID: <eac90675-bcf3-3818-1f5f-f9825349e22c@suse.com>
Date: Tue, 3 Nov 2020 11:57:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Just like we avoid to invoke remote root pt flushes when all uses of an
L4 table can be accounted for locally, the same can be done for all of
L[234] for the linear pt flush when the table is a "free floating" one,
i.e. it is pinned but not hooked up anywhere. While this situation
doesn't occur very often, it can be observed.

Since this breaks one of the implications of the XSA-286 fix, drop the
flush_root_pt_local variable again and set ->root_pgt_changed directly,
just like it was before that change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While adjusting the big comment that was added for XSA-286 I wondered
why it talks about the "construction of 32bit PV guests". How are 64-bit
PV guests different in this regard?

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3903,8 +3903,7 @@ long do_mmu_update(
     struct vcpu *curr = current, *v = curr;
     struct domain *d = v->domain, *pt_owner = d, *pg_owner;
     mfn_t map_mfn = INVALID_MFN, mfn;
-    bool flush_linear_pt = false, flush_root_pt_local = false,
-        flush_root_pt_others = false;
+    bool flush_linear_pt = false, flush_root_pt_others = false;
     uint32_t xsm_needed = 0;
     uint32_t xsm_checked = 0;
     int rc = put_old_guest_table(curr);
@@ -4054,7 +4053,9 @@ long do_mmu_update(
                         break;
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
-                    if ( !rc )
+                    if ( !rc &&
+                         (page->u.inuse.type_info & PGT_count_mask) >
+                         1 + !!(page->u.inuse.type_info & PGT_pinned) )
                         flush_linear_pt = true;
                     break;
 
@@ -4063,7 +4064,9 @@ long do_mmu_update(
                         break;
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
-                    if ( !rc )
+                    if ( !rc &&
+                         (page->u.inuse.type_info & PGT_count_mask) >
+                         1 + !!(page->u.inuse.type_info & PGT_pinned) )
                         flush_linear_pt = true;
                     break;
 
@@ -4072,7 +4075,9 @@ long do_mmu_update(
                         break;
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
-                    if ( !rc )
+                    if ( !rc &&
+                         (page->u.inuse.type_info & PGT_count_mask) >
+                         1 + !!(page->u.inuse.type_info & PGT_pinned) )
                         flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
                     {
@@ -4082,7 +4087,7 @@ long do_mmu_update(
                                     mfn) )
                         {
                             local_in_use = true;
-                            flush_root_pt_local = true;
+                            get_cpu_info()->root_pgt_changed = true;
                         }
 
                         /*
@@ -4199,8 +4204,8 @@ long do_mmu_update(
     /*
      * Perform required TLB maintenance.
      *
-     * This logic currently depend on flush_linear_pt being a superset of the
-     * flush_root_pt_* conditions.
+     * This logic currently depends on flush_linear_pt being a superset of the
+     * flush_root_pt_others condition.
      *
      * pt_owner may not be current->domain.  This may occur during
      * construction of 32bit PV guests, or debugging of PV guests.  The
@@ -4219,7 +4224,7 @@ long do_mmu_update(
      * pt_owner->dirty_cpumask), and/or all *other* dirty CPUs as there are
      * references we can't account for locally.
      */
-    if ( flush_linear_pt /* || flush_root_pt_local || flush_root_pt_others */ )
+    if ( flush_linear_pt /* || flush_root_pt_others */ )
     {
         unsigned int cpu = smp_processor_id();
         cpumask_t *mask = pt_owner->dirty_cpumask;
@@ -4236,12 +4241,8 @@ long do_mmu_update(
             cpumask_copy(mask, pt_owner->dirty_cpumask);
             __cpumask_clear_cpu(cpu, mask);
 
-            flush_local(FLUSH_TLB |
-                        (flush_root_pt_local ? FLUSH_ROOT_PGTBL : 0));
+            flush_local(FLUSH_TLB);
         }
-        else
-            /* Sanity check.  flush_root_pt_local implies local cpu is dirty. */
-            ASSERT(!flush_root_pt_local);
 
         /* Flush the remote dirty CPUs.  Does not include the local CPU. */
         if ( !cpumask_empty(mask) )
@@ -4249,8 +4250,8 @@ long do_mmu_update(
                        (flush_root_pt_others ? FLUSH_ROOT_PGTBL : 0));
     }
     else
-        /* Sanity check.  flush_root_pt_* implies flush_linear_pt. */
-        ASSERT(!flush_root_pt_local && !flush_root_pt_others);
+        /* Sanity check.  flush_root_pt_others implies flush_linear_pt. */
+        ASSERT(!flush_root_pt_others);
 
     perfc_add(num_page_updates, i);
 


