Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173A77A8BC9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 20:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605885.943506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1zT-0007p3-A0; Wed, 20 Sep 2023 18:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605885.943506; Wed, 20 Sep 2023 18:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1zT-0007nP-78; Wed, 20 Sep 2023 18:31:59 +0000
Received: by outflank-mailman (input) for mailman id 605885;
 Wed, 20 Sep 2023 18:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wKQE=FE=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qj1zR-0007W9-Ag
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 18:31:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f97017b6-57e3-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 20:31:56 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-klMOH7FoOeqRVhW53sYvwQ-1; Wed, 20 Sep 2023 14:31:52 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54B2B811E86;
 Wed, 20 Sep 2023 18:31:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ECAC711281;
 Wed, 20 Sep 2023 18:31:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3F49821E6906; Wed, 20 Sep 2023 20:31:49 +0200 (CEST)
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
X-Inumbo-ID: f97017b6-57e3-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695234714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zyO5+9rvw3/TPsjhMiZIDwj15IvwxhUWLb/O9InaZZU=;
	b=aE/l9RXxp+nH5rzGXz7sZVh0l2WGE79DC5LqYSeLM2S1wuEPcEEZpbTbekvqt/UN5US02B
	ZQ7PqnweXcFq2jExNgtcN62MA8n555syvIoUASo8EUovXQRMxppcQ0mqRzw8fpwk5mAIBE
	ons3R+NgPlHbf0b+aXm4BiOIMLlN33Y=
X-MC-Unique: klMOH7FoOeqRVhW53sYvwQ-1
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	eblake@redhat.com,
	vsementsov@yandex-team.ru,
	jsnow@redhat.com,
	idryomov@gmail.com,
	pl@kamp.de,
	sw@weilnetz.de,
	sstabellini@kernel.org,
	anthony.perard@citrix.com,
	paul@xen.org,
	pbonzini@redhat.com,
	marcandre.lureau@redhat.com,
	berrange@redhat.com,
	thuth@redhat.com,
	philmd@linaro.org,
	stefanha@redhat.com,
	fam@euphon.net,
	quintela@redhat.com,
	peterx@redhat.com,
	leobras@redhat.com,
	kraxel@redhat.com,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 4/7] block/dirty-bitmap: Clean up local variable shadowing
Date: Wed, 20 Sep 2023 20:31:46 +0200
Message-ID: <20230920183149.1105333-5-armbru@redhat.com>
In-Reply-To: <20230920183149.1105333-1-armbru@redhat.com>
References: <20230920183149.1105333-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Tracked down with -Wshadow=local.
Clean up: rename both the pair of parameters and the pair of local
variables.  While there, move the local variables to function scope.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/monitor/bitmap-qmp-cmds.c | 19 ++++++++++---------
 block/qcow2-bitmap.c            |  3 +--
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 55f778f5af..70d01a3776 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -258,37 +258,38 @@ void qmp_block_dirty_bitmap_disable(const char *node, const char *name,
     bdrv_disable_dirty_bitmap(bitmap);
 }
 
-BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
+BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *dst_node,
+                                          const char *dst_bitmap,
                                           BlockDirtyBitmapOrStrList *bms,
                                           HBitmap **backup, Error **errp)
 {
     BlockDriverState *bs;
     BdrvDirtyBitmap *dst, *src;
     BlockDirtyBitmapOrStrList *lst;
+    const char *src_node, *src_bitmap;
     HBitmap *local_backup = NULL;
 
     GLOBAL_STATE_CODE();
 
-    dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
+    dst = block_dirty_bitmap_lookup(dst_node, dst_bitmap, &bs, errp);
     if (!dst) {
         return NULL;
     }
 
     for (lst = bms; lst; lst = lst->next) {
         switch (lst->value->type) {
-            const char *name, *node;
         case QTYPE_QSTRING:
-            name = lst->value->u.local;
-            src = bdrv_find_dirty_bitmap(bs, name);
+            src_bitmap = lst->value->u.local;
+            src = bdrv_find_dirty_bitmap(bs, src_bitmap);
             if (!src) {
-                error_setg(errp, "Dirty bitmap '%s' not found", name);
+                error_setg(errp, "Dirty bitmap '%s' not found", src_bitmap);
                 goto fail;
             }
             break;
         case QTYPE_QDICT:
-            node = lst->value->u.external.node;
-            name = lst->value->u.external.name;
-            src = block_dirty_bitmap_lookup(node, name, NULL, errp);
+            src_node = lst->value->u.external.node;
+            src_bitmap = lst->value->u.external.name;
+            src = block_dirty_bitmap_lookup(src_node, src_bitmap, NULL, errp);
             if (!src) {
                 goto fail;
             }
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 037fa2d435..ffd5cd3b23 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1555,7 +1555,6 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
     FOR_EACH_DIRTY_BITMAP(bs, bitmap) {
         const char *name = bdrv_dirty_bitmap_name(bitmap);
         uint32_t granularity = bdrv_dirty_bitmap_granularity(bitmap);
-        Qcow2Bitmap *bm;
 
         if (!bdrv_dirty_bitmap_get_persistence(bitmap) ||
             bdrv_dirty_bitmap_inconsistent(bitmap)) {
@@ -1625,7 +1624,7 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
 
     /* allocate clusters and store bitmaps */
     QSIMPLEQ_FOREACH(bm, bm_list, entry) {
-        BdrvDirtyBitmap *bitmap = bm->dirty_bitmap;
+        bitmap = bm->dirty_bitmap;
 
         if (bitmap == NULL || bdrv_dirty_bitmap_readonly(bitmap)) {
             continue;
-- 
2.41.0


