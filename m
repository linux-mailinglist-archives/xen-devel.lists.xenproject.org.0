Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416AE6F1566
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 12:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527247.819638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLJx-0008E9-LP; Fri, 28 Apr 2023 10:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527247.819638; Fri, 28 Apr 2023 10:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLJx-0008C2-I9; Fri, 28 Apr 2023 10:27:21 +0000
Received: by outflank-mailman (input) for mailman id 527247;
 Fri, 28 Apr 2023 10:27:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Azqw=AT=amazon.co.uk=prvs=475810522=hakor@srs-se1.protection.inumbo.net>)
 id 1psLJw-0008Bw-CP
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 10:27:20 +0000
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com
 [207.171.188.200]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ff9d0bd-e5af-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 12:27:18 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-617e30c2.us-east-1.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-9103.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 10:27:06 +0000
Received: from EX19D017EUB004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-m6i4x-617e30c2.us-east-1.amazon.com (Postfix)
 with ESMTPS id D78B6639FB; Fri, 28 Apr 2023 10:26:56 +0000 (UTC)
Received: from EX19MTAUEA001.ant.amazon.com (10.252.134.203) by
 EX19D017EUB004.ant.amazon.com (10.252.51.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Apr 2023 10:26:55 +0000
Received: from dev-dsk-hakor-1a-9589d7a9.eu-west-1.amazon.com (172.19.124.154)
 by mail-relay.amazon.com (10.252.134.102) with Microsoft SMTP Server
 id
 15.2.1118.26 via Frontend Transport; Fri, 28 Apr 2023 10:26:54 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3ff9d0bd-e5af-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1682677639; x=1714213639;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6N7xgEqW1adG5czCROokGAB7KqoQj1XrEp7xLcti96I=;
  b=Mdjs+Bs1c/l2zAWchEeuKbPZFRb6iwbXWJOf/f2Vbo7kwuncgzAiXvkw
   D3UUMuOg+CYrs7Og6xqle0HYr1wZOX7b2nmIJOdQju2pFKz/vPKCUSoEy
   ZIaETlBs5PKt/srzFbfJlr47olQKs26n5QNI2jcgKf25ekN5tH43HqqJq
   4=;
X-IronPort-AV: E=Sophos;i="5.99,234,1677542400"; 
   d="scan'208";a="1126887208"
From: Ruben Hakobyan <hakor@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: Ruben Hakobyan <hakor@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/grant-table: Properly acquire the vCPU maptrack freelist lock
Date: Fri, 28 Apr 2023 10:26:33 +0000
Message-ID: <20230428102633.86473-1-hakor@amazon.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

Introduced as part of XSA-228, the maptrack_freelist_lock is meant to
protect all accesses to entries in the vCPU freelist as well as the
head and tail pointers.

However, this principle is violated twice in get_maptrack_handle(),
where the tail pointer is directly accessed without taking the lock.
The first occurrence is when stealing an extra entry for the tail
pointer, and the second occurrence is when directly setting the tail of
an empty freelist after allocating its first page.

Make sure to correctly acquire the freelist lock before accessing and
modifying the tail pointer to fully comply with XSA-228.

It should be noted that with the current setup, it is not possible for
these accesses to race with anything. However, it is still important
to correctly take the lock here to avoid any future possible races. For
example, a race could be possible with put_maptrack_handle() if the
maptrack code is modified to allow vCPU freelists to temporarily
include handles not directly assigned to them in the maptrack.

Note that the tail and head pointers can still be accessed without
taking the lock when initialising the freelist in grant_table_init_vcpu()
as concurrent access will not be possible here.

Signed-off-by: Ruben Hakobyan <hakor@amazon.com>
---
 xen/common/grant_table.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index d87e58a53d..67e346ca64 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -660,23 +660,27 @@ get_maptrack_handle(
     if ( !new_mt )
     {
         spin_unlock(&lgt->maptrack_lock);
+        handle = steal_maptrack_handle(lgt, curr);
+        if ( handle == INVALID_MAPTRACK_HANDLE )
+            return handle;
+
+        spin_lock(&curr->maptrack_freelist_lock);
+        if ( curr->maptrack_tail != MAPTRACK_TAIL )
+        {
+            spin_unlock(&curr->maptrack_freelist_lock);
+            return handle;
+        }
 
         /*
          * Uninitialized free list? Steal an extra entry for the tail
          * sentinel.
          */
-        if ( curr->maptrack_tail == MAPTRACK_TAIL )
-        {
-            handle = steal_maptrack_handle(lgt, curr);
-            if ( handle == INVALID_MAPTRACK_HANDLE )
-                return handle;
-            spin_lock(&curr->maptrack_freelist_lock);
-            maptrack_entry(lgt, handle).ref = MAPTRACK_TAIL;
-            curr->maptrack_tail = handle;
-            if ( curr->maptrack_head == MAPTRACK_TAIL )
-                curr->maptrack_head = handle;
-            spin_unlock(&curr->maptrack_freelist_lock);
-        }
+        maptrack_entry(lgt, handle).ref = MAPTRACK_TAIL;
+        curr->maptrack_tail = handle;
+        if ( curr->maptrack_head == MAPTRACK_TAIL )
+            curr->maptrack_head = handle;
+        spin_unlock(&curr->maptrack_freelist_lock);
+
         return steal_maptrack_handle(lgt, curr);
     }
 
@@ -696,8 +700,10 @@ get_maptrack_handle(
     }
 
     /* Set tail directly if this is the first page for the local vCPU. */
+    spin_lock(&curr->maptrack_freelist_lock);
     if ( curr->maptrack_tail == MAPTRACK_TAIL )
         curr->maptrack_tail = handle + MAPTRACK_PER_PAGE - 1;
+    spin_unlock(&curr->maptrack_freelist_lock);
 
     lgt->maptrack[nr_maptrack_frames(lgt)] = new_mt;
     smp_wmb();
-- 
2.39.2


