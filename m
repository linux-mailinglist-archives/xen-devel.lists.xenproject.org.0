Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF392F7F2E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68262.122185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qo4-00082f-G0; Fri, 15 Jan 2021 15:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68262.122185; Fri, 15 Jan 2021 15:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qo4-00082G-Cj; Fri, 15 Jan 2021 15:14:32 +0000
Received: by outflank-mailman (input) for mailman id 68262;
 Fri, 15 Jan 2021 15:14:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Qo3-000826-5H
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:14:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0555514c-5875-42c8-b45a-696a1be5e48d;
 Fri, 15 Jan 2021 15:14:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F743B27F;
 Fri, 15 Jan 2021 15:14:29 +0000 (UTC)
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
X-Inumbo-ID: 0555514c-5875-42c8-b45a-696a1be5e48d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610723669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSdy8Pz3L/zprCeC4fpdnW1IB0NsmJcT9iH+zGCLuIc=;
	b=bTh8MI5jlTecwZZA1lv0M2Wyu+CjOcDr8S1oxR9oLgOwuoRdJH5g7D2nhIauFDfIJWc7b6
	JzRXxlmBY/DzzgWt+T9+sS7jFCymxn+Vj7Fnu8OXb1OgY1X5t0GwjHT35pixOQifjqWuy6
	4rY5VC/bhz34e4oiZf1BMBzZO2uw+rc=
Subject: [PATCH v2 1/2] gnttab: adjust pin count overflow checks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <43168334-20af-a0ed-95ec-8eef5200877b@suse.com>
Message-ID: <d37ac49d-5e36-6f35-be73-83f8e1e8f23e@suse.com>
Date: Fri, 15 Jan 2021 16:14:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <43168334-20af-a0ed-95ec-8eef5200877b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It's at least odd to check counters which aren't going to be
incremented, resulting in failure just because prior operations may
have left an entry in an unusual state. And it's also not helpful to
use open-coded literal numbers in these checks.

Calculate the increment values first and derive from them the mask to
use in the checks.

Also move the pin count checks ahead of the calculation of the status
(and for copy also sha2) pointers: They're not needed in the failure
cases, and this way the compiler may also have an easier time keeping
the variables at least transiently in registers for the subsequent uses.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Replace pre-existing comment. Introduce GNTPIN_incr2oflow_mask().

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -322,23 +322,38 @@ shared_entry_header(struct grant_table *
 
 /* Active grant entry - used for shadowing GTF_permit_access grants. */
 struct active_grant_entry {
-    uint32_t      pin;    /* Reference count information:             */
+/*
+ * 4x byte-wide reference counts, for {host,device}{read,write} mappings,
+ * implemented as a single 32-bit (presumably to optimise checking for any
+ * reference).
+ */
+    uint32_t      pin;
+                          /* Width of the individual counter fields.  */
+#define GNTPIN_cntr_width    8
+#define GNTPIN_cntr_mask     ((1U << GNTPIN_cntr_width) - 1)
                           /* Count of writable host-CPU mappings.     */
 #define GNTPIN_hstw_shift    0
 #define GNTPIN_hstw_inc      (1U << GNTPIN_hstw_shift)
-#define GNTPIN_hstw_mask     (0xFFU << GNTPIN_hstw_shift)
+#define GNTPIN_hstw_mask     (GNTPIN_cntr_mask << GNTPIN_hstw_shift)
                           /* Count of read-only host-CPU mappings.    */
-#define GNTPIN_hstr_shift    8
+#define GNTPIN_hstr_shift    (GNTPIN_hstw_shift + GNTPIN_cntr_width)
 #define GNTPIN_hstr_inc      (1U << GNTPIN_hstr_shift)
-#define GNTPIN_hstr_mask     (0xFFU << GNTPIN_hstr_shift)
+#define GNTPIN_hstr_mask     (GNTPIN_cntr_mask << GNTPIN_hstr_shift)
                           /* Count of writable device-bus mappings.   */
-#define GNTPIN_devw_shift    16
+#define GNTPIN_devw_shift    (GNTPIN_hstr_shift + GNTPIN_cntr_width)
 #define GNTPIN_devw_inc      (1U << GNTPIN_devw_shift)
-#define GNTPIN_devw_mask     (0xFFU << GNTPIN_devw_shift)
+#define GNTPIN_devw_mask     (GNTPIN_cntr_mask << GNTPIN_devw_shift)
                           /* Count of read-only device-bus mappings.  */
-#define GNTPIN_devr_shift    24
+#define GNTPIN_devr_shift    (GNTPIN_devw_shift + GNTPIN_cntr_width)
 #define GNTPIN_devr_inc      (1U << GNTPIN_devr_shift)
-#define GNTPIN_devr_mask     (0xFFU << GNTPIN_devr_shift)
+#define GNTPIN_devr_mask     (GNTPIN_cntr_mask << GNTPIN_devr_shift)
+
+/* Convert a combination of GNTPIN_*_inc to an overflow checking mask. */
+#define GNTPIN_incr2oflow_mask(x) ({                       \
+    ASSERT(!((x) & ~(GNTPIN_hstw_inc | GNTPIN_hstr_inc |   \
+                     GNTPIN_devw_inc | GNTPIN_devr_inc))); \
+    (x) << (GNTPIN_cntr_width - 1);                        \
+})
 
     domid_t       domid;  /* Domain being granted access.             */
     unsigned int  start:15; /* For sub-page grants, the start offset
@@ -988,7 +1003,8 @@ map_grant_ref(
     mfn_t mfn;
     struct page_info *pg = NULL;
     int            rc = GNTST_okay;
-    unsigned int   cache_flags, clear_flags = 0, refcnt = 0, typecnt = 0;
+    unsigned int   cache_flags, clear_flags = 0, refcnt = 0, typecnt = 0,
+                   pin_incr = 0;
     bool           host_map_created = false;
     struct active_grant_entry *act = NULL;
     struct grant_mapping *mt;
@@ -998,7 +1014,14 @@ map_grant_ref(
 
     ld = current->domain;
 
-    if ( unlikely((op->flags & (GNTMAP_device_map|GNTMAP_host_map)) == 0) )
+    if ( op->flags & GNTMAP_device_map )
+        pin_incr += (op->flags & GNTMAP_readonly) ? GNTPIN_devr_inc
+                                                  : GNTPIN_devw_inc;
+    if ( op->flags & GNTMAP_host_map )
+        pin_incr += (op->flags & GNTMAP_readonly) ? GNTPIN_hstr_inc
+                                                  : GNTPIN_hstw_inc;
+
+    if ( unlikely(!pin_incr) )
     {
         gdprintk(XENLOG_INFO, "Bad flags in grant map op: %x\n", op->flags);
         op->status = GNTST_bad_gntref;
@@ -1052,19 +1075,19 @@ map_grant_ref(
     shah = shared_entry_header(rgt, ref);
     act = active_entry_acquire(rgt, ref);
 
-    /* Make sure we do not access memory speculatively */
-    status = evaluate_nospec(rgt->gt_version == 1) ? &shah->flags
-                                                 : &status_entry(rgt, ref);
-
     /* If already pinned, check the active domid and avoid refcnt overflow. */
     if ( act->pin &&
          ((act->domid != ld->domain_id) ||
-          (act->pin & 0x80808080U) != 0 ||
+          (act->pin & GNTPIN_incr2oflow_mask(pin_incr)) ||
           (act->is_sub_page)) )
         PIN_FAIL(act_release_out, GNTST_general_error,
                  "Bad domain (%d != %d), or risk of counter overflow %08x, or subpage %d\n",
                  act->domid, ld->domain_id, act->pin, act->is_sub_page);
 
+    /* Make sure we do not access memory speculatively */
+    status = evaluate_nospec(rgt->gt_version == 1) ? &shah->flags
+                                                   : &status_entry(rgt, ref);
+
     if ( !act->pin ||
          (!(op->flags & GNTMAP_readonly) &&
           !(act->pin & (GNTPIN_hstw_mask|GNTPIN_devw_mask))) )
@@ -1095,12 +1118,7 @@ map_grant_ref(
         }
     }
 
-    if ( op->flags & GNTMAP_device_map )
-        act->pin += (op->flags & GNTMAP_readonly) ?
-            GNTPIN_devr_inc : GNTPIN_devw_inc;
-    if ( op->flags & GNTMAP_host_map )
-        act->pin += (op->flags & GNTMAP_readonly) ?
-            GNTPIN_hstr_inc : GNTPIN_hstw_inc;
+    act->pin += pin_incr;
 
     mfn = act->mfn;
 
@@ -1275,13 +1293,7 @@ map_grant_ref(
     grant_read_lock(rgt);
 
     act = active_entry_acquire(rgt, op->ref);
-
-    if ( op->flags & GNTMAP_device_map )
-        act->pin -= (op->flags & GNTMAP_readonly) ?
-            GNTPIN_devr_inc : GNTPIN_devw_inc;
-    if ( op->flags & GNTMAP_host_map )
-        act->pin -= (op->flags & GNTMAP_readonly) ?
-            GNTPIN_hstr_inc : GNTPIN_hstw_inc;
+    act->pin -= pin_incr;
 
  unlock_out_clear:
     if ( !(op->flags & GNTMAP_readonly) &&
@@ -2516,6 +2528,7 @@ acquire_grant_for_copy(
     uint16_t trans_length;
     bool is_sub_page;
     s16 rc = GNTST_okay;
+    unsigned int pin_incr = readonly ? GNTPIN_hstr_inc : GNTPIN_hstw_inc;
     unsigned int clear_flags = 0;
 
     *page = NULL;
@@ -2530,6 +2543,14 @@ acquire_grant_for_copy(
     shah = shared_entry_header(rgt, gref);
     act = active_entry_acquire(rgt, gref);
 
+    /* If already pinned, check the active domid and avoid refcnt overflow. */
+    if ( act->pin &&
+         ((act->domid != ldom) ||
+          (act->pin & GNTPIN_incr2oflow_mask(pin_incr))) )
+        PIN_FAIL(unlock_out, GNTST_general_error,
+                 "Bad domain (%d != %d), or risk of counter overflow %08x\n",
+                 act->domid, ldom, act->pin);
+
     if ( evaluate_nospec(rgt->gt_version == 1) )
     {
         sha2 = NULL;
@@ -2541,12 +2562,6 @@ acquire_grant_for_copy(
         status = &status_entry(rgt, gref);
     }
 
-    /* If already pinned, check the active domid and avoid refcnt overflow. */
-    if ( act->pin && ((act->domid != ldom) || (act->pin & 0x80808080U) != 0) )
-        PIN_FAIL(unlock_out, GNTST_general_error,
-                 "Bad domain (%d != %d), or risk of counter overflow %08x\n",
-                 act->domid, ldom, act->pin);
-
     old_pin = act->pin;
     if ( sha2 && (shah->flags & GTF_type_mask) == GTF_transitive )
     {
@@ -2728,7 +2743,7 @@ acquire_grant_for_copy(
         }
     }
 
-    act->pin += readonly ? GNTPIN_hstr_inc : GNTPIN_hstw_inc;
+    act->pin += pin_incr;
 
     *page_off = act->start;
     *length = act->length;


