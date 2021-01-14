Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FCF2F643C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67159.119616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04TA-0000Xk-DL; Thu, 14 Jan 2021 15:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67159.119616; Thu, 14 Jan 2021 15:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04TA-0000XP-AG; Thu, 14 Jan 2021 15:23:28 +0000
Received: by outflank-mailman (input) for mailman id 67159;
 Thu, 14 Jan 2021 15:23:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04T9-0000XK-2N
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:23:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e704fada-4c4f-44c2-b0ea-03f459e5cfc0;
 Thu, 14 Jan 2021 15:23:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8391AEAB;
 Thu, 14 Jan 2021 15:23:24 +0000 (UTC)
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
X-Inumbo-ID: e704fada-4c4f-44c2-b0ea-03f459e5cfc0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610637805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDxKZJvVeCw6bI1HCjMqfPdjKwcrVa8JpjiVL8f6Rh0=;
	b=ZzSkq6nsz+Scy3LhPyKuoVdqOxWS3qXBq0TnaR6pYcdHxuX2j8k5+nKBqpc+JUnuEJHmvq
	NUArRDQPF3HSQREoD2wmbhJhIFxr5VTlovo+njCIUTL2TcRqt9AnsD1vMMIQOia6bitVbM
	DkFt088WRjeg+sa3gSE66poo5EAGYvs=
Subject: [PATCH 1/3] gnttab: adjust pin count overflow checks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
Message-ID: <38331526-5c24-08d4-b1b6-9baa16251c1d@suse.com>
Date: Thu, 14 Jan 2021 16:23:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It's at least odd to check counters which aren't going to be
incremented. And it's also not helpful to use open-coded literal numbers
in these checks.

Calculate the increment values first and derive from them the mask to
use in the checks.

Also move the pin count checks ahead of the calculation of the status
(and for copy also sha2) pointers: They're not needed in the failure
cases, and this way the compiler may also have an easier time keeping
the variables at least transiently in registers for the subsequent uses.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -323,22 +323,25 @@ shared_entry_header(struct grant_table *
 /* Active grant entry - used for shadowing GTF_permit_access grants. */
 struct active_grant_entry {
     uint32_t      pin;    /* Reference count information:             */
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
 
     domid_t       domid;  /* Domain being granted access.             */
     unsigned int  start:15; /* For sub-page grants, the start offset
@@ -988,7 +991,8 @@ map_grant_ref(
     mfn_t mfn;
     struct page_info *pg = NULL;
     int            rc = GNTST_okay;
-    unsigned int   cache_flags, clear_flags = 0, refcnt = 0, typecnt = 0;
+    unsigned int   cache_flags, clear_flags = 0, refcnt = 0, typecnt = 0,
+                   pin_incr = 0;
     bool           host_map_created = false;
     struct active_grant_entry *act = NULL;
     struct grant_mapping *mt;
@@ -998,7 +1002,14 @@ map_grant_ref(
 
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
@@ -1052,19 +1063,19 @@ map_grant_ref(
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
+          (act->pin & (pin_incr << (GNTPIN_cntr_width - 1))) ||
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
@@ -1095,12 +1106,7 @@ map_grant_ref(
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
 
@@ -1275,13 +1281,7 @@ map_grant_ref(
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
@@ -2516,6 +2516,7 @@ acquire_grant_for_copy(
     uint16_t trans_length;
     bool is_sub_page;
     s16 rc = GNTST_okay;
+    unsigned int pin_incr = readonly ? GNTPIN_hstr_inc : GNTPIN_hstw_inc;
     unsigned int clear_flags = 0;
 
     *page = NULL;
@@ -2530,6 +2531,14 @@ acquire_grant_for_copy(
     shah = shared_entry_header(rgt, gref);
     act = active_entry_acquire(rgt, gref);
 
+    /* If already pinned, check the active domid and avoid refcnt overflow. */
+    if ( act->pin &&
+         ((act->domid != ldom) ||
+          (act->pin & (pin_incr << (GNTPIN_cntr_width - 1)))) )
+        PIN_FAIL(unlock_out, GNTST_general_error,
+                 "Bad domain (%d != %d), or risk of counter overflow %08x\n",
+                 act->domid, ldom, act->pin);
+
     if ( evaluate_nospec(rgt->gt_version == 1) )
     {
         sha2 = NULL;
@@ -2541,12 +2550,6 @@ acquire_grant_for_copy(
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
@@ -2728,7 +2731,7 @@ acquire_grant_for_copy(
         }
     }
 
-    act->pin += readonly ? GNTPIN_hstr_inc : GNTPIN_hstw_inc;
+    act->pin += pin_incr;
 
     *page_off = act->start;
     *length = act->length;


