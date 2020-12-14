Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5EA2D9F3D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52467.91891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kosi0-0003wH-Gr; Mon, 14 Dec 2020 18:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52467.91891; Mon, 14 Dec 2020 18:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshz-0003r9-4d; Mon, 14 Dec 2020 18:36:31 +0000
Received: by outflank-mailman (input) for mailman id 52467;
 Mon, 14 Dec 2020 17:06:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O6EJ=FS=redhat.com=slp@srs-us1.protection.inumbo.net>)
 id 1korJD-0001y4-RW
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 17:06:51 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 94297bc7-4b2c-40b3-8999-002e654fcffe;
 Mon, 14 Dec 2020 17:06:50 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-_8-ouXvpNqK8vTFc4U2Pjg-1; Mon, 14 Dec 2020 12:06:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BAA0800685;
 Mon, 14 Dec 2020 17:06:26 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-112-231.rdu2.redhat.com
 [10.10.112.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3A39669FC;
 Mon, 14 Dec 2020 17:06:22 +0000 (UTC)
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
X-Inumbo-ID: 94297bc7-4b2c-40b3-8999-002e654fcffe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607965610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bR0d1JArrAy1qnHujAAvCo8e9rCfTiOxzdxX6U9l434=;
	b=A17hCsS2dLfOAdeLek1rUNWKlSiON6lRiCofKLHx/32gKFAprl3Q7BCsU4qXnAFxpiuCvX
	w+llJLsolyD6t1Ci3p8KhnAtf7i4+RWdwmXlLOvEil/OOOpZ+t2LdrX6n5b1i64KIQjkGS
	se/SAZIwC8lWaQ+osAjiAtu2+3aZ2oM=
X-MC-Unique: _8-ouXvpNqK8vTFc4U2Pjg-1
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v2 4/4] block: Close block exports in two steps
Date: Mon, 14 Dec 2020 18:05:19 +0100
Message-Id: <20201214170519.223781-5-slp@redhat.com>
In-Reply-To: <20201214170519.223781-1-slp@redhat.com>
References: <20201214170519.223781-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

There's a cross-dependency between closing the block exports and
draining the block layer. The latter needs that we close all export's
client connections to ensure they won't queue more requests, but the
exports may have coroutines yielding in the block layer, which implies
they can't be fully closed until we drain it.

To break this cross-dependency, this change adds a "bool wait"
argument to blk_exp_close_all() and blk_exp_close_all_type(), so
callers can decide whether they want to wait for the exports to be
fully quiesced, or just return after requesting them to shut down.

Then, in bdrv_close_all we make two calls, one without waiting to
close all client connections, and another after draining the block
layer, this time waiting for the exports to be fully quiesced.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1900505
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 block.c                   | 20 +++++++++++++++++++-
 block/export/export.c     | 10 ++++++----
 blockdev-nbd.c            |  2 +-
 include/block/export.h    |  4 ++--
 qemu-nbd.c                |  2 +-
 stubs/blk-exp-close-all.c |  2 +-
 6 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/block.c b/block.c
index bc8a66ab6e..41db70ac07 100644
--- a/block.c
+++ b/block.c
@@ -4472,13 +4472,31 @@ static void bdrv_close(BlockDriverState *bs)
 void bdrv_close_all(void)
 {
     assert(job_next(NULL) == NULL);
-    blk_exp_close_all();
+
+    /*
+     * There's a cross-dependency between closing the block exports and
+     * draining the block layer. The latter needs that we close all export's
+     * client connections to ensure they won't queue more requests, but the
+     * exports may have coroutines yielding in the block layer, which implies
+     * they can't be fully closed until we drain it.
+     *
+     * Make a first call to close all export's client connections, without
+     * waiting for each export to be fully quiesced.
+     */
+    blk_exp_close_all(false);
 
     /* Drop references from requests still in flight, such as canceled block
      * jobs whose AIO context has not been polled yet */
     bdrv_drain_all();
 
     blk_remove_all_bs();
+
+    /*
+     * Make a second call to shut down the exports, this time waiting for them
+     * to be fully quiesced.
+     */
+    blk_exp_close_all(true);
+
     blockdev_close_all_bdrv_states();
 
     assert(QTAILQ_EMPTY(&all_bdrv_states));
diff --git a/block/export/export.c b/block/export/export.c
index bad6f21b1c..0124ebd9f9 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -280,7 +280,7 @@ static bool blk_exp_has_type(BlockExportType type)
 }
 
 /* type == BLOCK_EXPORT_TYPE__MAX for all types */
-void blk_exp_close_all_type(BlockExportType type)
+void blk_exp_close_all_type(BlockExportType type, bool wait)
 {
     BlockExport *exp, *next;
 
@@ -293,12 +293,14 @@ void blk_exp_close_all_type(BlockExportType type)
         blk_exp_request_shutdown(exp);
     }
 
-    AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
+    if (wait) {
+        AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
+    }
 }
 
-void blk_exp_close_all(void)
+void blk_exp_close_all(bool wait)
 {
-    blk_exp_close_all_type(BLOCK_EXPORT_TYPE__MAX);
+    blk_exp_close_all_type(BLOCK_EXPORT_TYPE__MAX, wait);
 }
 
 void qmp_block_export_add(BlockExportOptions *export, Error **errp)
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index d8443d235b..d71d4da7c2 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -266,7 +266,7 @@ void qmp_nbd_server_stop(Error **errp)
         return;
     }
 
-    blk_exp_close_all_type(BLOCK_EXPORT_TYPE_NBD);
+    blk_exp_close_all_type(BLOCK_EXPORT_TYPE_NBD, true);
 
     nbd_server_free(nbd_server);
     nbd_server = NULL;
diff --git a/include/block/export.h b/include/block/export.h
index 7feb02e10d..71c25928ce 100644
--- a/include/block/export.h
+++ b/include/block/export.h
@@ -83,7 +83,7 @@ BlockExport *blk_exp_find(const char *id);
 void blk_exp_ref(BlockExport *exp);
 void blk_exp_unref(BlockExport *exp);
 void blk_exp_request_shutdown(BlockExport *exp);
-void blk_exp_close_all(void);
-void blk_exp_close_all_type(BlockExportType type);
+void blk_exp_close_all(bool wait);
+void blk_exp_close_all_type(BlockExportType type, bool wait);
 
 #endif
diff --git a/qemu-nbd.c b/qemu-nbd.c
index a7075c5419..928f4466f6 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1122,7 +1122,7 @@ int main(int argc, char **argv)
     do {
         main_loop_wait(false);
         if (state == TERMINATE) {
-            blk_exp_close_all();
+            blk_exp_close_all(true);
             state = TERMINATED;
         }
     } while (state != TERMINATED);
diff --git a/stubs/blk-exp-close-all.c b/stubs/blk-exp-close-all.c
index 1c71316763..ecd0ce611f 100644
--- a/stubs/blk-exp-close-all.c
+++ b/stubs/blk-exp-close-all.c
@@ -2,6 +2,6 @@
 #include "block/export.h"
 
 /* Only used in programs that support block exports (libblockdev.fa) */
-void blk_exp_close_all(void)
+void blk_exp_close_all(bool wait)
 {
 }
-- 
2.26.2


