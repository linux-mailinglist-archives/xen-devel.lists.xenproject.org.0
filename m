Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0803A7A8BC6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 20:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605888.943527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1zW-0008EX-Ba; Wed, 20 Sep 2023 18:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605888.943527; Wed, 20 Sep 2023 18:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1zV-0008AP-U5; Wed, 20 Sep 2023 18:32:01 +0000
Received: by outflank-mailman (input) for mailman id 605888;
 Wed, 20 Sep 2023 18:32:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wKQE=FE=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qj1zU-0007WV-6w
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 18:32:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fadc242b-57e3-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 20:31:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-JMOR339hPOO4Fkf-bHeIMg-1; Wed, 20 Sep 2023 14:31:53 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE28B3816D8E;
 Wed, 20 Sep 2023 18:31:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63FB1C185EF;
 Wed, 20 Sep 2023 18:31:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 467D921E690C; Wed, 20 Sep 2023 20:31:49 +0200 (CEST)
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
X-Inumbo-ID: fadc242b-57e3-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695234717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p9yrL6sfTg7uK2lAJ2dhNnzI9tHwDDSYk4qrcqZO5/I=;
	b=bB1evOPB8TLO70v62TtAF41vcFPPPAPBLfcb2dRUcfZfisQJV3eQIz7nCP4BIkGLY0Vjq0
	+JB72Fe6oBUc3mZE4dxjLBd/2vYxUCZkrmeDowpSq2t5YfAAzCPb7drYeBpMV5yKv+lWA2
	oz3H/A7iPMNDGTlR56e7nctXUQQd8TA=
X-MC-Unique: JMOR339hPOO4Fkf-bHeIMg-1
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
Subject: [PATCH v2 6/7] block: Clean up local variable shadowing
Date: Wed, 20 Sep 2023 20:31:48 +0200
Message-ID: <20230920183149.1105333-7-armbru@redhat.com>
In-Reply-To: <20230920183149.1105333-1-armbru@redhat.com>
References: <20230920183149.1105333-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Tracked down with -Wshadow=local.
Clean up: delete inner declarations when they are actually redundant,
else rename variables.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Ilya Dryomov <idryomov@gmail.com>
---
 block.c              |  9 +++++----
 block/rbd.c          |  2 +-
 block/stream.c       |  1 -
 block/vvfat.c        | 35 ++++++++++++++++++-----------------
 hw/block/xen-block.c |  6 +++---
 5 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/block.c b/block.c
index 8da89aaa62..bb5dd17e9c 100644
--- a/block.c
+++ b/block.c
@@ -3035,18 +3035,19 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
                                               &local_err);
 
         if (ret < 0 && child_class->change_aio_ctx) {
-            Transaction *tran = tran_new();
+            Transaction *aio_ctx_tran = tran_new();
             GHashTable *visited = g_hash_table_new(NULL, NULL);
             bool ret_child;
 
             g_hash_table_add(visited, new_child);
             ret_child = child_class->change_aio_ctx(new_child, child_ctx,
-                                                    visited, tran, NULL);
+                                                    visited, aio_ctx_tran,
+                                                    NULL);
             if (ret_child == true) {
                 error_free(local_err);
                 ret = 0;
             }
-            tran_finalize(tran, ret_child == true ? 0 : -1);
+            tran_finalize(aio_ctx_tran, ret_child == true ? 0 : -1);
             g_hash_table_destroy(visited);
         }
 
@@ -6077,12 +6078,12 @@ void bdrv_iterate_format(void (*it)(void *opaque, const char *name),
     QLIST_FOREACH(drv, &bdrv_drivers, list) {
         if (drv->format_name) {
             bool found = false;
-            int i = count;
 
             if (use_bdrv_whitelist && !bdrv_is_whitelisted(drv, read_only)) {
                 continue;
             }
 
+            i = count;
             while (formats && i && !found) {
                 found = !strcmp(formats[--i], drv->format_name);
             }
diff --git a/block/rbd.c b/block/rbd.c
index 978671411e..472ca05cba 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1290,7 +1290,7 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
          * operations that exceed the current size.
          */
         if (offset + bytes > s->image_size) {
-            int r = qemu_rbd_resize(bs, offset + bytes);
+            r = qemu_rbd_resize(bs, offset + bytes);
             if (r < 0) {
                 return r;
             }
diff --git a/block/stream.c b/block/stream.c
index e522bbdec5..007253880b 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -282,7 +282,6 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     /* Make sure that the image is opened in read-write mode */
     bs_read_only = bdrv_is_read_only(bs);
     if (bs_read_only) {
-        int ret;
         /* Hold the chain during reopen */
         if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
             return;
diff --git a/block/vvfat.c b/block/vvfat.c
index 0ddc91fc09..856b479c91 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -777,7 +777,6 @@ static int read_directory(BDRVVVFATState* s, int mapping_index)
     while((entry=readdir(dir))) {
         unsigned int length=strlen(dirname)+2+strlen(entry->d_name);
         char* buffer;
-        direntry_t* direntry;
         struct stat st;
         int is_dot=!strcmp(entry->d_name,".");
         int is_dotdot=!strcmp(entry->d_name,"..");
@@ -857,7 +856,7 @@ static int read_directory(BDRVVVFATState* s, int mapping_index)
 
     /* fill with zeroes up to the end of the cluster */
     while(s->directory.next%(0x10*s->sectors_per_cluster)) {
-        direntry_t* direntry=array_get_next(&(s->directory));
+        direntry = array_get_next(&(s->directory));
         memset(direntry,0,sizeof(direntry_t));
     }
 
@@ -1962,24 +1961,24 @@ get_cluster_count_for_direntry(BDRVVVFATState* s, direntry_t* direntry, const ch
                  * This is horribly inefficient, but that is okay, since
                  * it is rarely executed, if at all.
                  */
-                int64_t offset = cluster2sector(s, cluster_num);
+                int64_t offs = cluster2sector(s, cluster_num);
 
                 vvfat_close_current_file(s);
                 for (i = 0; i < s->sectors_per_cluster; i++) {
                     int res;
 
                     res = bdrv_is_allocated(s->qcow->bs,
-                                            (offset + i) * BDRV_SECTOR_SIZE,
+                                            (offs + i) * BDRV_SECTOR_SIZE,
                                             BDRV_SECTOR_SIZE, NULL);
                     if (res < 0) {
                         return -1;
                     }
                     if (!res) {
-                        res = vvfat_read(s->bs, offset, s->cluster_buffer, 1);
+                        res = vvfat_read(s->bs, offs, s->cluster_buffer, 1);
                         if (res) {
                             return -1;
                         }
-                        res = bdrv_co_pwrite(s->qcow, offset * BDRV_SECTOR_SIZE,
+                        res = bdrv_co_pwrite(s->qcow, offs * BDRV_SECTOR_SIZE,
                                              BDRV_SECTOR_SIZE, s->cluster_buffer,
                                              0);
                         if (res < 0) {
@@ -2467,8 +2466,9 @@ commit_direntries(BDRVVVFATState* s, int dir_index, int parent_mapping_index)
 
     for (c = first_cluster; !fat_eof(s, c); c = modified_fat_get(s, c)) {
         direntry_t *first_direntry;
-        void* direntry = array_get(&(s->directory), current_dir_index);
-        int ret = vvfat_read(s->bs, cluster2sector(s, c), direntry,
+
+        direntry = array_get(&(s->directory), current_dir_index);
+        ret = vvfat_read(s->bs, cluster2sector(s, c), (uint8_t *)direntry,
                 s->sectors_per_cluster);
         if (ret)
             return ret;
@@ -2690,12 +2690,12 @@ static int handle_renames_and_mkdirs(BDRVVVFATState* s)
                 direntry_t* direntry = array_get(&(s->directory),
                         mapping->info.dir.first_dir_index);
                 uint32_t c = mapping->begin;
-                int i = 0;
+                int j = 0;
 
                 /* recurse */
                 while (!fat_eof(s, c)) {
                     do {
-                        direntry_t* d = direntry + i;
+                        direntry_t *d = direntry + j;
 
                         if (is_file(d) || (is_directory(d) && !is_dot(d))) {
                             int l;
@@ -2716,8 +2716,8 @@ static int handle_renames_and_mkdirs(BDRVVVFATState* s)
 
                             schedule_rename(s, m->begin, new_path);
                         }
-                        i++;
-                    } while((i % (0x10 * s->sectors_per_cluster)) != 0);
+                        j++;
+                    } while (j % (0x10 * s->sectors_per_cluster) != 0);
                     c = fat_get(s, c);
                 }
             }
@@ -2804,16 +2804,16 @@ static int coroutine_fn GRAPH_RDLOCK handle_commits(BDRVVVFATState* s)
             int begin = commit->param.new_file.first_cluster;
             mapping_t* mapping = find_mapping_for_cluster(s, begin);
             direntry_t* entry;
-            int i;
+            int j;
 
             /* find direntry */
-            for (i = 0; i < s->directory.next; i++) {
-                entry = array_get(&(s->directory), i);
+            for (j = 0; j < s->directory.next; j++) {
+                entry = array_get(&(s->directory), j);
                 if (is_file(entry) && begin_of_direntry(entry) == begin)
                     break;
             }
 
-            if (i >= s->directory.next) {
+            if (j >= s->directory.next) {
                 fail = -6;
                 continue;
             }
@@ -2833,8 +2833,9 @@ static int coroutine_fn GRAPH_RDLOCK handle_commits(BDRVVVFATState* s)
             mapping->mode = MODE_NORMAL;
             mapping->info.file.offset = 0;
 
-            if (commit_one_file(s, i, 0))
+            if (commit_one_file(s, j, 0)) {
                 fail = -7;
+            }
 
             break;
         }
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 3906b9058b..a07cd7eb5d 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -369,7 +369,7 @@ static void xen_block_get_vdev(Object *obj, Visitor *v, const char *name,
     case XEN_BLOCK_VDEV_TYPE_XVD:
     case XEN_BLOCK_VDEV_TYPE_HD:
     case XEN_BLOCK_VDEV_TYPE_SD: {
-        char *name = disk_to_vbd_name(vdev->disk);
+        char *vbd_name = disk_to_vbd_name(vdev->disk);
 
         str = g_strdup_printf("%s%s%lu",
                               (vdev->type == XEN_BLOCK_VDEV_TYPE_XVD) ?
@@ -377,8 +377,8 @@ static void xen_block_get_vdev(Object *obj, Visitor *v, const char *name,
                               (vdev->type == XEN_BLOCK_VDEV_TYPE_HD) ?
                               "hd" :
                               "sd",
-                              name, vdev->partition);
-        g_free(name);
+                              vbd_name, vdev->partition);
+        g_free(vbd_name);
         break;
     }
     default:
-- 
2.41.0


