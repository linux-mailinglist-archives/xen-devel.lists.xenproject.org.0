Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A84E5B52FA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 06:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405374.647829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXad3-0000FX-R5; Mon, 12 Sep 2022 04:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405374.647829; Mon, 12 Sep 2022 04:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXad3-0000CA-O8; Mon, 12 Sep 2022 04:01:01 +0000
Received: by outflank-mailman (input) for mailman id 405374;
 Mon, 12 Sep 2022 04:01:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JuFZ=ZP=runbox.com=m.v.b@srs-se1.protection.inumbo.net>)
 id 1oXad1-0000AM-Ui
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 04:01:00 +0000
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com
 [2a0c:5a00:149::26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 807703bb-324f-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 06:00:58 +0200 (CEST)
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
 by mailtransmit05.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <m.v.b@runbox.com>)
 id 1oXacx-009joX-FH; Mon, 12 Sep 2022 06:00:55 +0200
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <m.v.b@runbox.com>)
 id 1oXacr-00022C-OX; Mon, 12 Sep 2022 06:00:50 +0200
Received: by submission02.runbox with esmtpsa [Authenticated ID (536975)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1oXaci-0003S3-RC; Mon, 12 Sep 2022 06:00:41 +0200
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
X-Inumbo-ID: 807703bb-324f-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=NYGbYznUIsRn2pdVapESgYelwBLsRFvNvEAjFtNvGkY=; b=hUlUMRT6twm3sxZyGROBdgsTlJ
	fII5XbgviPM6jWxx2yNthBtrz/MU8KJhm1ZXqCcJjk8+J4mtYeXUqxigOFOwIYTQ2Zc4e48PDKWkl
	FiuU6VRFooF1FOHn4h4H/AHNXHvorUWqFMXGuCwLn7YIrQgWkgdhSx2EtufY38sDgmNT6MzRdbw/B
	AZQMJ+sqoJrsP6dYzR5QX5WCGleAnfX/i0WKifjcdY836iaxkt+tMhkZUw4Fs5nAuntsGQuiRGQhq
	zDSupC5d67TwaIuKszVMf40uPU44pvcTB/xuMPxDuJVHNzidix+97p7tXEK/85/2ZIUUHd2D4MF4J
	2ngOSmFw==;
From: "M. Vefa Bicakci" <m.v.b@runbox.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: m.v.b@runbox.com,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/2] xen/gntdev: Prevent leaking grants
Date: Mon, 12 Sep 2022 00:00:01 -0400
Message-Id: <20220912040002.198191-2-m.v.b@runbox.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912040002.198191-1-m.v.b@runbox.com>
References: <20220912040002.198191-1-m.v.b@runbox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prior to this commit, if a grant mapping operation failed partially,
some of the entries in the map_ops array would be invalid, whereas all
of the entries in the kmap_ops array would be valid. This in turn would
cause the following logic in gntdev_map_grant_pages to become invalid:

  for (i = 0; i < map->count; i++) {
    if (map->map_ops[i].status == GNTST_okay) {
      map->unmap_ops[i].handle = map->map_ops[i].handle;
      if (!use_ptemod)
        alloced++;
    }
    if (use_ptemod) {
      if (map->kmap_ops[i].status == GNTST_okay) {
        if (map->map_ops[i].status == GNTST_okay)
          alloced++;
        map->kunmap_ops[i].handle = map->kmap_ops[i].handle;
      }
    }
  }
  ...
  atomic_add(alloced, &map->live_grants);

Assume that use_ptemod is true (i.e., the domain mapping the granted
pages is a paravirtualized domain). In the code excerpt above, note that
the "alloced" variable is only incremented when both kmap_ops[i].status
and map_ops[i].status are set to GNTST_okay (i.e., both mapping
operations are successful).  However, as also noted above, there are
cases where a grant mapping operation fails partially, breaking the
assumption of the code excerpt above.

The aforementioned causes map->live_grants to be incorrectly set. In
some cases, all of the map_ops mappings fail, but all of the kmap_ops
mappings succeed, meaning that live_grants may remain zero. This in turn
makes it impossible to unmap the successfully grant-mapped pages pointed
to by kmap_ops, because unmap_grant_pages has the following snippet of
code at its beginning:

  if (atomic_read(&map->live_grants) == 0)
    return; /* Nothing to do */

In other cases where only some of the map_ops mappings fail but all
kmap_ops mappings succeed, live_grants is made positive, but when the
user requests unmapping the grant-mapped pages, __unmap_grant_pages_done
will then make map->live_grants negative, because the latter function
does not check if all of the pages that were requested to be unmapped
were actually unmapped, and the same function unconditionally subtracts
"data->count" (i.e., a value that can be greater than map->live_grants)
from map->live_grants. The side effects of a negative live_grants value
have not been studied.

The net effect of all of this is that grant references are leaked in one
of the above conditions. In Qubes OS v4.1 (which uses Xen's grant
mechanism extensively for X11 GUI isolation), this issue manifests
itself with warning messages like the following to be printed out by the
Linux kernel in the VM that had granted pages (that contain X11 GUI
window data) to dom0: "g.e. 0x1234 still pending", especially after the
user rapidly resizes GUI VM windows (causing some grant-mapping
operations to partially or completely fail, due to the fact that the VM
unshares some of the pages as part of the window resizing, making the
pages impossible to grant-map from dom0).

The fix for this issue involves counting all successful map_ops and
kmap_ops mappings separately, and then adding the sum to live_grants.
During unmapping, only the number of successfully unmapped grants is
subtracted from live_grants. To determine which grants were successfully
unmapped, their status fields are set to an arbitrary positive number
(1), as was done in commit ebee0eab0859 ("Xen/gntdev: correct error
checking in gntdev_map_grant_pages()"). The code is also modified to
check for negative live_grants values after the subtraction and warn the
user.

Link: https://github.com/QubesOS/qubes-issues/issues/7631
Fixes: dbe97cff7dd9 ("xen/gntdev: Avoid blocking in unmap_grant_pages()")
Cc: stable@vger.kernel.org
Signed-off-by: M. Vefa Bicakci <m.v.b@runbox.com>
---
 drivers/xen/gntdev.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 84b143eef395..485fa9c630aa 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -367,8 +367,7 @@ int gntdev_map_grant_pages(struct gntdev_grant_map *map)
 	for (i = 0; i < map->count; i++) {
 		if (map->map_ops[i].status == GNTST_okay) {
 			map->unmap_ops[i].handle = map->map_ops[i].handle;
-			if (!use_ptemod)
-				alloced++;
+			alloced++;
 		} else if (!err)
 			err = -EINVAL;
 
@@ -377,8 +376,7 @@ int gntdev_map_grant_pages(struct gntdev_grant_map *map)
 
 		if (use_ptemod) {
 			if (map->kmap_ops[i].status == GNTST_okay) {
-				if (map->map_ops[i].status == GNTST_okay)
-					alloced++;
+				alloced++;
 				map->kunmap_ops[i].handle = map->kmap_ops[i].handle;
 			} else if (!err)
 				err = -EINVAL;
@@ -394,8 +392,13 @@ static void __unmap_grant_pages_done(int result,
 	unsigned int i;
 	struct gntdev_grant_map *map = data->data;
 	unsigned int offset = data->unmap_ops - map->unmap_ops;
+	int successful_unmaps = 0;
+	int live_grants;
 
 	for (i = 0; i < data->count; i++) {
+		if (map->unmap_ops[offset + i].status == GNTST_okay)
+			successful_unmaps++;
+
 		WARN_ON(map->unmap_ops[offset + i].status != GNTST_okay &&
 			map->unmap_ops[offset + i].handle != INVALID_GRANT_HANDLE);
 		pr_debug("unmap handle=%d st=%d\n",
@@ -403,6 +406,9 @@ static void __unmap_grant_pages_done(int result,
 			map->unmap_ops[offset+i].status);
 		map->unmap_ops[offset+i].handle = INVALID_GRANT_HANDLE;
 		if (use_ptemod) {
+			if (map->kunmap_ops[offset + i].status == GNTST_okay)
+				successful_unmaps++;
+
 			WARN_ON(map->kunmap_ops[offset + i].status != GNTST_okay &&
 				map->kunmap_ops[offset + i].handle != INVALID_GRANT_HANDLE);
 			pr_debug("kunmap handle=%u st=%d\n",
@@ -411,11 +417,15 @@ static void __unmap_grant_pages_done(int result,
 			map->kunmap_ops[offset+i].handle = INVALID_GRANT_HANDLE;
 		}
 	}
+
 	/*
 	 * Decrease the live-grant counter.  This must happen after the loop to
 	 * prevent premature reuse of the grants by gnttab_mmap().
 	 */
-	atomic_sub(data->count, &map->live_grants);
+	live_grants = atomic_sub_return(successful_unmaps, &map->live_grants);
+	if (WARN_ON(live_grants < 0))
+		pr_err("%s: live_grants became negative (%d) after unmapping %d pages!\n",
+		       __func__, live_grants, successful_unmaps);
 
 	/* Release reference taken by __unmap_grant_pages */
 	gntdev_put_map(NULL, map);
@@ -424,6 +434,8 @@ static void __unmap_grant_pages_done(int result,
 static void __unmap_grant_pages(struct gntdev_grant_map *map, int offset,
 			       int pages)
 {
+	int idx;
+
 	if (map->notify.flags & UNMAP_NOTIFY_CLEAR_BYTE) {
 		int pgno = (map->notify.addr >> PAGE_SHIFT);
 
@@ -436,6 +448,16 @@ static void __unmap_grant_pages(struct gntdev_grant_map *map, int offset,
 		}
 	}
 
+	/* Set all unmap/kunmap status fields to an arbitrary positive value,
+	 * so that it is possible to determine which grants were successfully
+	 * unmapped by inspecting the status fields.
+	 */
+	for (idx = offset; idx < offset + pages; idx++) {
+		map->unmap_ops[idx].status = 1;
+		if (use_ptemod)
+			map->kunmap_ops[idx].status = 1;
+	}
+
 	map->unmap_data.unmap_ops = map->unmap_ops + offset;
 	map->unmap_data.kunmap_ops = use_ptemod ? map->kunmap_ops + offset : NULL;
 	map->unmap_data.pages = map->pages + offset;
-- 
2.37.3


