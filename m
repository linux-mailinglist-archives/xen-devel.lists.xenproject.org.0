Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C412F643E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:23:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67163.119628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04TW-0000d7-Lu; Thu, 14 Jan 2021 15:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67163.119628; Thu, 14 Jan 2021 15:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04TW-0000cl-IW; Thu, 14 Jan 2021 15:23:50 +0000
Received: by outflank-mailman (input) for mailman id 67163;
 Thu, 14 Jan 2021 15:23:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04TV-0000cd-HI
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:23:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7873b4be-a62e-4484-b1c7-c800cfe9f6eb;
 Thu, 14 Jan 2021 15:23:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73EF9AC24;
 Thu, 14 Jan 2021 15:23:47 +0000 (UTC)
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
X-Inumbo-ID: 7873b4be-a62e-4484-b1c7-c800cfe9f6eb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610637827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNiAyk16ONrTzcmz1yqaPikcT/RPQ4kXmUtWKkq/WvA=;
	b=h3lDOjOHjMs6D4e1JWift7Ax49ulM6DdMMT08dy5atumaqpo6pJOZ8cdhWpJL6r5OnIxhd
	t9lNFaUAus37rwej7wWbCuRbCzeG4dc6l9/5jt6F1ZrkD9lngCSIUPyezOep7+wD4zRud0
	Y7mOJbxq9/gJAU7/IA5t9sEefz4admQ=
Subject: [PATCH 2/3] gnttab: consolidate pin-to-status syncing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
Message-ID: <5e84b80d-4b6f-118b-c2cb-071e6e774db5@suse.com>
Date: Thu, 14 Jan 2021 16:23:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
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

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -908,6 +908,25 @@ static int _set_status(const grant_entry
         return _set_status_v2(shah, status, rd, act, readonly, mapflag, ldomid);
 }
 
+/*
+ * The status for a grant may indicate that we're taking more access than
+ * the pin requires.  Fix up the status to match the pin.  Called with the
+ * domain's grant table lock held at least in read mode and with the active
+ * entry lock held (iow act->pin can't change behind our backs).
+ */
+static void fixup_status_for_pin(struct domain *rd,
+                                 const struct active_grant_entry *act,
+                                 uint16_t *status, bool readonly)
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
@@ -991,8 +1010,7 @@ map_grant_ref(
     mfn_t mfn;
     struct page_info *pg = NULL;
     int            rc = GNTST_okay;
-    unsigned int   cache_flags, clear_flags = 0, refcnt = 0, typecnt = 0,
-                   pin_incr = 0;
+    unsigned int   cache_flags, refcnt = 0, typecnt = 0, pin_incr = 0;
     bool           host_map_created = false;
     struct active_grant_entry *act = NULL;
     struct grant_mapping *mt;
@@ -1284,15 +1302,7 @@ map_grant_ref(
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
+    fixup_status_for_pin(rd, act, status, op->flags & GNTMAP_readonly);
 
  act_release_out:
     active_entry_release(act);
@@ -1507,7 +1517,6 @@ unmap_common_complete(struct gnttab_unma
     grant_entry_header_t *sha;
     struct page_info *pg;
     uint16_t *status;
-    unsigned int clear_flags = 0;
 
     if ( evaluate_nospec(!op->done) )
     {
@@ -1566,15 +1575,7 @@ unmap_common_complete(struct gnttab_unma
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
+    fixup_status_for_pin(rd, act, status, op->done & GNTMAP_readonly);
 
     active_entry_release(act);
     grant_read_unlock(rgt);
@@ -2414,7 +2415,6 @@ release_grant_for_copy(
     uint16_t *status;
     grant_ref_t trans_gref;
     struct domain *td;
-    unsigned int clear_flags = 0;
 
     grant_read_lock(rgt);
 
@@ -2444,15 +2444,9 @@ release_grant_for_copy(
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
+    fixup_status_for_pin(rd, act, status, readonly);
 
     active_entry_release(act);
     grant_read_unlock(rgt);
@@ -2469,27 +2463,6 @@ release_grant_for_copy(
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
@@ -2517,7 +2490,6 @@ acquire_grant_for_copy(
     bool is_sub_page;
     s16 rc = GNTST_okay;
     unsigned int pin_incr = readonly ? GNTPIN_hstr_inc : GNTPIN_hstw_inc;
-    unsigned int clear_flags = 0;
 
     *page = NULL;
 
@@ -2604,8 +2576,8 @@ acquire_grant_for_copy(
 
         if ( rc != GNTST_okay )
         {
-            fixup_status_for_copy_pin(rd, act, status);
             rcu_unlock_domain(td);
+            fixup_status_for_pin(rd, act, status, readonly);
             active_entry_release(act);
             grant_read_unlock(rgt);
             return rc;
@@ -2627,8 +2599,8 @@ acquire_grant_for_copy(
                           !act->is_sub_page)) )
         {
             release_grant_for_copy(td, trans_gref, readonly);
-            fixup_status_for_copy_pin(rd, act, status);
             rcu_unlock_domain(td);
+            fixup_status_for_pin(rd, act, status, readonly);
             active_entry_release(act);
             grant_read_unlock(rgt);
             put_page(*page);
@@ -2742,15 +2714,7 @@ acquire_grant_for_copy(
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
+    fixup_status_for_pin(rd, act, status, readonly);
 
  unlock_out:
     active_entry_release(act);
@@ -3720,8 +3684,6 @@ gnttab_release_mappings(
 
     for ( handle = 0; handle < gt->maptrack_limit; handle++ )
     {
-        unsigned int clear_flags = 0;
-
         map = &maptrack_entry(gt, handle);
         if ( !(map->flags & (GNTMAP_device_map|GNTMAP_host_map)) )
             continue;
@@ -3794,16 +3756,9 @@ gnttab_release_mappings(
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
+        fixup_status_for_pin(rd, act, status, map->flags & GNTMAP_readonly);
 
         active_entry_release(act);
         grant_read_unlock(rgt);


