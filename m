Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 573DF2F7F31
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:15:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68268.122208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qob-0008Dl-1p; Fri, 15 Jan 2021 15:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68268.122208; Fri, 15 Jan 2021 15:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qoa-0008DO-UV; Fri, 15 Jan 2021 15:15:04 +0000
Received: by outflank-mailman (input) for mailman id 68268;
 Fri, 15 Jan 2021 15:15:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0QoZ-0008DF-F4
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:15:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f3005e2-5488-4cd7-8b27-c21a7531f9b0;
 Fri, 15 Jan 2021 15:15:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79F6CAB7F;
 Fri, 15 Jan 2021 15:15:01 +0000 (UTC)
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
X-Inumbo-ID: 4f3005e2-5488-4cd7-8b27-c21a7531f9b0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610723701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/q9UZ0XeH426n57zPhmm8s1WzsdppI7RSSMGBzPjeIU=;
	b=aJV+nGKDRu2X2o9+cSmj3RGYMiLvgQ9POz9fIKdldDQDzcLTRdSLJyUF20bR3cMHkFLnGc
	1+fBShvWowGo+jIsZN/gXN9yNL42pHawSTVTR7T126gM6VTEQvPHCNOGTfvaCCCoGHVlq1
	Uvuo2VyKJ3ftb4Ai6IqOhYToUIbbhWs=
Subject: [PATCH v2 2/2] gnttab: consolidate pin-to-status syncing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <43168334-20af-a0ed-95ec-8eef5200877b@suse.com>
Message-ID: <54d2a427-e3d6-ec19-055a-2ec7f6fd2a0d@suse.com>
Date: Fri, 15 Jan 2021 16:15:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <43168334-20af-a0ed-95ec-8eef5200877b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Forever since the fix for XSA-230 the 2nd of the comments ahead of
fixup_status_for_copy_pin() has been stale - there's nothing specific to
transitive grants there anymore.

Move the function up, drop the "copy" part from its name again, add a
"readonly" parameter, and use it also on other paths having decremented
one (or not having got to increment any) of the pin counts.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Rename helper to reduce_status_for_pin() and adjust its comment
    accordingly.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -920,6 +920,25 @@ static int _set_status(const grant_entry
         return _set_status_v2(shah, status, rd, act, readonly, mapflag, ldomid);
 }
 
+/*
+ * The status for a grant may indicate that we're taking more access than
+ * the pin requires.  Reduce the status to match the pin.  Called with the
+ * domain's grant table lock held at least in read mode and with the active
+ * entry lock held (iow act->pin can't change behind our backs).
+ */
+static void reduce_status_for_pin(struct domain *rd,
+                                  const struct active_grant_entry *act,
+                                  uint16_t *status, bool readonly)
+{
+    unsigned int clear_flags = act->pin ? 0 : GTF_reading;
+
+    if ( !readonly && !(act->pin & (GNTPIN_hstw_mask | GNTPIN_devw_mask)) )
+        clear_flags |= GTF_writing;
+
+    if ( clear_flags )
+        gnttab_clear_flags(rd, clear_flags, status);
+}
+
 static struct active_grant_entry *grant_map_exists(const struct domain *ld,
                                                    struct grant_table *rgt,
                                                    mfn_t mfn,
@@ -1003,8 +1022,7 @@ map_grant_ref(
     mfn_t mfn;
     struct page_info *pg = NULL;
     int            rc = GNTST_okay;
-    unsigned int   cache_flags, clear_flags = 0, refcnt = 0, typecnt = 0,
-                   pin_incr = 0;
+    unsigned int   cache_flags, refcnt = 0, typecnt = 0, pin_incr = 0;
     bool           host_map_created = false;
     struct active_grant_entry *act = NULL;
     struct grant_mapping *mt;
@@ -1296,15 +1314,7 @@ map_grant_ref(
     act->pin -= pin_incr;
 
  unlock_out_clear:
-    if ( !(op->flags & GNTMAP_readonly) &&
-         !(act->pin & (GNTPIN_hstw_mask|GNTPIN_devw_mask)) )
-        clear_flags |= GTF_writing;
-
-    if ( !act->pin )
-        clear_flags |= GTF_reading;
-
-    if ( clear_flags )
-        gnttab_clear_flags(rd, clear_flags, status);
+    reduce_status_for_pin(rd, act, status, op->flags & GNTMAP_readonly);
 
  act_release_out:
     active_entry_release(act);
@@ -1519,7 +1529,6 @@ unmap_common_complete(struct gnttab_unma
     grant_entry_header_t *sha;
     struct page_info *pg;
     uint16_t *status;
-    unsigned int clear_flags = 0;
 
     if ( evaluate_nospec(!op->done) )
     {
@@ -1578,15 +1587,7 @@ unmap_common_complete(struct gnttab_unma
             act->pin -= GNTPIN_hstw_inc;
     }
 
-    if ( ((act->pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask)) == 0) &&
-         !(op->done & GNTMAP_readonly) )
-        clear_flags |= GTF_writing;
-
-    if ( act->pin == 0 )
-        clear_flags |= GTF_reading;
-
-    if ( clear_flags )
-        gnttab_clear_flags(rd, clear_flags, status);
+    reduce_status_for_pin(rd, act, status, op->done & GNTMAP_readonly);
 
     active_entry_release(act);
     grant_read_unlock(rgt);
@@ -2426,7 +2427,6 @@ release_grant_for_copy(
     uint16_t *status;
     grant_ref_t trans_gref;
     struct domain *td;
-    unsigned int clear_flags = 0;
 
     grant_read_lock(rgt);
 
@@ -2456,15 +2456,9 @@ release_grant_for_copy(
         gnttab_mark_dirty(rd, mfn);
 
         act->pin -= GNTPIN_hstw_inc;
-        if ( !(act->pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask)) )
-            clear_flags |= GTF_writing;
     }
 
-    if ( !act->pin )
-        clear_flags |= GTF_reading;
-
-    if ( clear_flags )
-        gnttab_clear_flags(rd, clear_flags, status);
+    reduce_status_for_pin(rd, act, status, readonly);
 
     active_entry_release(act);
     grant_read_unlock(rgt);
@@ -2481,27 +2475,6 @@ release_grant_for_copy(
     }
 }
 
-/* The status for a grant indicates that we're taking more access than
-   the pin requires.  Fix up the status to match the pin.  Called
-   under the domain's grant table lock. */
-/* Only safe on transitive grants.  Even then, note that we don't
-   attempt to drop any pin on the referent grant. */
-static void fixup_status_for_copy_pin(struct domain *rd,
-                                      const struct active_grant_entry *act,
-                                      uint16_t *status)
-{
-    unsigned int clear_flags = 0;
-
-    if ( !(act->pin & (GNTPIN_hstw_mask | GNTPIN_devw_mask)) )
-        clear_flags |= GTF_writing;
-
-    if ( !act->pin )
-        clear_flags |= GTF_reading;
-
-    if ( clear_flags )
-        gnttab_clear_flags(rd, clear_flags, status);
-}
-
 /*
  * Grab a machine frame number from a grant entry and update the flags
  * and pin count as appropriate. If rc == GNTST_okay, note that this *does*
@@ -2529,7 +2502,6 @@ acquire_grant_for_copy(
     bool is_sub_page;
     s16 rc = GNTST_okay;
     unsigned int pin_incr = readonly ? GNTPIN_hstr_inc : GNTPIN_hstw_inc;
-    unsigned int clear_flags = 0;
 
     *page = NULL;
 
@@ -2616,8 +2588,8 @@ acquire_grant_for_copy(
 
         if ( rc != GNTST_okay )
         {
-            fixup_status_for_copy_pin(rd, act, status);
             rcu_unlock_domain(td);
+            reduce_status_for_pin(rd, act, status, readonly);
             active_entry_release(act);
             grant_read_unlock(rgt);
             return rc;
@@ -2639,8 +2611,8 @@ acquire_grant_for_copy(
                           !act->is_sub_page)) )
         {
             release_grant_for_copy(td, trans_gref, readonly);
-            fixup_status_for_copy_pin(rd, act, status);
             rcu_unlock_domain(td);
+            reduce_status_for_pin(rd, act, status, readonly);
             active_entry_release(act);
             grant_read_unlock(rgt);
             put_page(*page);
@@ -2754,15 +2726,7 @@ acquire_grant_for_copy(
     return rc;
 
  unlock_out_clear:
-    if ( !(readonly) &&
-         !(act->pin & (GNTPIN_hstw_mask | GNTPIN_devw_mask)) )
-        clear_flags |= GTF_writing;
-
-    if ( !act->pin )
-        clear_flags |= GTF_reading;
-
-    if ( clear_flags )
-        gnttab_clear_flags(rd, clear_flags, status);
+    reduce_status_for_pin(rd, act, status, readonly);
 
  unlock_out:
     active_entry_release(act);
@@ -3732,8 +3696,6 @@ gnttab_release_mappings(
 
     for ( handle = 0; handle < gt->maptrack_limit; handle++ )
     {
-        unsigned int clear_flags = 0;
-
         map = &maptrack_entry(gt, handle);
         if ( !(map->flags & (GNTMAP_device_map|GNTMAP_host_map)) )
             continue;
@@ -3806,16 +3768,9 @@ gnttab_release_mappings(
                     put_page(pg);
                 }
             }
-
-            if ( (act->pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask)) == 0 )
-                clear_flags |= GTF_writing;
         }
 
-        if ( act->pin == 0 )
-            clear_flags |= GTF_reading;
-
-        if ( clear_flags )
-            gnttab_clear_flags(rd, clear_flags, status);
+        reduce_status_for_pin(rd, act, status, map->flags & GNTMAP_readonly);
 
         active_entry_release(act);
         grant_read_unlock(rgt);


