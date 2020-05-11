Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12791CD299
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 09:32:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY2uw-0004KL-0G; Mon, 11 May 2020 07:32:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tfUY=6Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jY2uu-0004KE-JG
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 07:32:00 +0000
X-Inumbo-ID: 7d0c3f72-9359-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d0c3f72-9359-11ea-b07b-bc764e2007e4;
 Mon, 11 May 2020 07:31:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 00914AC90;
 Mon, 11 May 2020 07:31:56 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] xen/xenbus: let xenbus_map_ring_valloc() return errno
 values only
Date: Mon, 11 May 2020 09:31:51 +0200
Message-Id: <20200511073151.19043-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200511073151.19043-1-jgross@suse.com>
References: <20200511073151.19043-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Today xenbus_map_ring_valloc() can return either a negative errno
value (-ENOMEM or -EINVAL) or a grant status value. This is a mess as
e.g -ENOMEM and GNTST_eagain have the same numeric value.

Fix that by turning all grant mapping errors into -ENOENT. This is
no problem as all callers of xenbus_map_ring_valloc() only use the
return value to print an error message, and in case of mapping errors
the grant status value has already been printed by __xenbus_map_ring()
before.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/xenbus/xenbus_client.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index d8e5c5e4fa67..5e6b256ca916 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -456,8 +456,7 @@ EXPORT_SYMBOL_GPL(xenbus_free_evtchn);
  * Map @nr_grefs pages of memory into this domain from another
  * domain's grant table.  xenbus_map_ring_valloc allocates @nr_grefs
  * pages of virtual address space, maps the pages to that address, and
- * sets *vaddr to that address.  Returns 0 on success, and GNTST_*
- * (see xen/include/interface/grant_table.h) or -ENOMEM / -EINVAL on
+ * sets *vaddr to that address.  Returns 0 on success, and -errno on
  * error. If an error is returned, device will switch to
  * XenbusStateClosing and the error message will be saved in XenStore.
  */
@@ -477,18 +476,11 @@ int xenbus_map_ring_valloc(struct xenbus_device *dev, grant_ref_t *gnt_refs,
 		return -ENOMEM;
 
 	info->node = kzalloc(sizeof(*info->node), GFP_KERNEL);
-	if (!info->node) {
+	if (!info->node)
 		err = -ENOMEM;
-		goto out;
-	}
-
-	err = ring_ops->map(dev, info, gnt_refs, nr_grefs, vaddr);
-
-	/* Some hypervisors are buggy and can return 1. */
-	if (err > 0)
-		err = GNTST_general_error;
+	else
+		err = ring_ops->map(dev, info, gnt_refs, nr_grefs, vaddr);
 
- out:
 	kfree(info->node);
 	kfree(info);
 	return err;
@@ -507,7 +499,6 @@ static int __xenbus_map_ring(struct xenbus_device *dev,
 			     bool *leaked)
 {
 	int i, j;
-	int err = GNTST_okay;
 
 	if (nr_grefs > XENBUS_MAX_RING_GRANTS)
 		return -EINVAL;
@@ -522,7 +513,6 @@ static int __xenbus_map_ring(struct xenbus_device *dev,
 
 	for (i = 0; i < nr_grefs; i++) {
 		if (info->map[i].status != GNTST_okay) {
-			err = info->map[i].status;
 			xenbus_dev_fatal(dev, info->map[i].status,
 					 "mapping in shared page %d from domain %d",
 					 gnt_refs[i], dev->otherend_id);
@@ -531,7 +521,7 @@ static int __xenbus_map_ring(struct xenbus_device *dev,
 			handles[i] = info->map[i].handle;
 	}
 
-	return GNTST_okay;
+	return 0;
 
  fail:
 	for (i = j = 0; i < nr_grefs; i++) {
@@ -554,7 +544,7 @@ static int __xenbus_map_ring(struct xenbus_device *dev,
 		}
 	}
 
-	return err;
+	return -ENOENT;
 }
 
 /**
-- 
2.26.1


