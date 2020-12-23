Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 527192E1DCA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 16:13:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58436.102755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5pO-0008Sx-4y; Wed, 23 Dec 2020 15:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58436.102755; Wed, 23 Dec 2020 15:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5pO-0008SW-1t; Wed, 23 Dec 2020 15:13:26 +0000
Received: by outflank-mailman (input) for mailman id 58436;
 Wed, 23 Dec 2020 15:13:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks5pM-0008SQ-Ih
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 15:13:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12d769bc-6208-4d9a-848e-dc635848956e;
 Wed, 23 Dec 2020 15:13:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E3F8AE12;
 Wed, 23 Dec 2020 15:13:22 +0000 (UTC)
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
X-Inumbo-ID: 12d769bc-6208-4d9a-848e-dc635848956e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608736402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UIvYxhcjcsMxBwG4F+TcWL6/ZoSGotF19ElMz38C6KU=;
	b=m7Q+x3HOhKKvbJo8AFRhB7L1Td35aa2KDNT8o9r7UtsdRGkcpiTO+pYJtgPoSPQdRo/7NG
	LAYY8S45b0bD+HQjjsqEFgxP9iARWfj4Atn+mItfcEu5ZoaXBJneHUhm+eKpdUukkbymcg
	7RUhQrCFQSxPx9peRo0hwLUzJxJJS7s=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] gnttab: defer allocation of status frame tracking array
Message-ID: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
Date: Wed, 23 Dec 2020 16:13:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This array can be large when many grant frames are permitted; avoid
allocating it when it's not going to be used anyway, by doing this only
in gnttab_populate_status_frames().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Defer allocation to when a domain actually switches to the v2 grant
    API.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1725,6 +1728,17 @@ gnttab_populate_status_frames(struct dom
     /* Make sure, prior version checks are architectural visible */
     block_speculation();
 
+    if ( gt->status == ZERO_BLOCK_PTR )
+    {
+        gt->status = xzalloc_array(grant_status_t *,
+                                   grant_to_status_frames(gt->max_grant_frames));
+        if ( !gt->status )
+        {
+            gt->status = ZERO_BLOCK_PTR;
+            return -ENOMEM;
+        }
+    }
+
     for ( i = nr_status_frames(gt); i < req_status_frames; i++ )
     {
         if ( (gt->status[i] = alloc_xenheap_page()) == NULL )
@@ -1745,18 +1759,23 @@ status_alloc_failed:
         free_xenheap_page(gt->status[i]);
         gt->status[i] = NULL;
     }
+    if ( !nr_status_frames(gt) )
+    {
+        xfree(gt->status);
+        gt->status = ZERO_BLOCK_PTR;
+    }
     return -ENOMEM;
 }
 
 static int
 gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
 {
-    unsigned int i;
+    unsigned int i, n = nr_status_frames(gt);
 
     /* Make sure, prior version checks are architectural visible */
     block_speculation();
 
-    for ( i = 0; i < nr_status_frames(gt); i++ )
+    for ( i = 0; i < n; i++ )
     {
         struct page_info *pg = virt_to_page(gt->status[i]);
         gfn_t gfn = gnttab_get_frame_gfn(gt, true, i);
@@ -1811,12 +1830,12 @@ gnttab_unpopulate_status_frames(struct d
         page_set_owner(pg, NULL);
     }
 
-    for ( i = 0; i < nr_status_frames(gt); i++ )
-    {
-        free_xenheap_page(gt->status[i]);
-        gt->status[i] = NULL;
-    }
     gt->nr_status_frames = 0;
+    smp_wmb(); /* Just in case - all accesses should be under lock. */
+    for ( i = 0; i < n; i++ )
+        free_xenheap_page(gt->status[i]);
+    xfree(gt->status);
+    gt->status = ZERO_BLOCK_PTR;
 
     return 0;
 }
@@ -1943,11 +1962,11 @@ int grant_table_init(struct domain *d, i
     if ( gt->shared_raw == NULL )
         goto out;
 
-    /* Status pages for grant table - for version 2 */
-    gt->status = xzalloc_array(grant_status_t *,
-                               grant_to_status_frames(gt->max_grant_frames));
-    if ( gt->status == NULL )
-        goto out;
+    /*
+     * Status page tracking array for v2 gets allocated on demand. But don't
+     * leave a NULL pointer there.
+     */
+    gt->status = ZERO_BLOCK_PTR;
 
     grant_write_lock(gt);
 

