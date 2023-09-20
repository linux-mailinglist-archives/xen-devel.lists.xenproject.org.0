Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1641D7A8BC7
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 20:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605884.943496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1zS-0007YP-2e; Wed, 20 Sep 2023 18:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605884.943496; Wed, 20 Sep 2023 18:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1zR-0007WK-Vv; Wed, 20 Sep 2023 18:31:57 +0000
Received: by outflank-mailman (input) for mailman id 605884;
 Wed, 20 Sep 2023 18:31:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wKQE=FE=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qj1zQ-0007W9-N0
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 18:31:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f908b429-57e3-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 20:31:55 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-lOVAYoqTP7-l3Mnpz4ACwQ-1; Wed, 20 Sep 2023 14:31:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52CC285A5BA;
 Wed, 20 Sep 2023 18:31:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EB9840C2064;
 Wed, 20 Sep 2023 18:31:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3818521E6904; Wed, 20 Sep 2023 20:31:49 +0200 (CEST)
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
X-Inumbo-ID: f908b429-57e3-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695234714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cua8FyWSMnOBRwAouMn6v8fHUxBoBkJqqrwS0ytd8G4=;
	b=EmYk/8+o7uiB0B1nTOpRFRemNOMG5osx/RuX+l5R+87LwBhsUu+7Z3qhZOIHAabJ27X6IO
	sqZvJPF4b7qVuLggG6qVhPND0+y6q2co1KalF1k2DP4Pa7+E4P9gCvd4iSQQsIxowFUDXS
	sgrhMfeGF97P+YQpr979fySCR0k9ybI=
X-MC-Unique: lOVAYoqTP7-l3Mnpz4ACwQ-1
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
Subject: [PATCH v2 2/7] migration: Clean up local variable shadowing
Date: Wed, 20 Sep 2023 20:31:44 +0200
Message-ID: <20230920183149.1105333-3-armbru@redhat.com>
In-Reply-To: <20230920183149.1105333-1-armbru@redhat.com>
References: <20230920183149.1105333-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Tracked down with -Wshadow=local.
Clean up: delete inner declarations when they are actually redundant,
else rename variables.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 migration/block.c   | 4 ++--
 migration/ram.c     | 8 +++-----
 migration/rdma.c    | 8 +++++---
 migration/vmstate.c | 2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index 86c2256a2b..eb6aafeb9e 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -440,8 +440,8 @@ static int init_blk_migration(QEMUFile *f)
     /* Can only insert new BDSes now because doing so while iterating block
      * devices may end up in a deadlock (iterating the new BDSes, too). */
     for (i = 0; i < num_bs; i++) {
-        BlkMigDevState *bmds = bmds_bs[i].bmds;
-        BlockDriverState *bs = bmds_bs[i].bs;
+        bmds = bmds_bs[i].bmds;
+        bs = bmds_bs[i].bs;
 
         if (bmds) {
             ret = blk_insert_bs(bmds->blk, bs, &local_err);
diff --git a/migration/ram.c b/migration/ram.c
index 9040d66e61..0c202f8109 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3517,8 +3517,6 @@ int colo_init_ram_cache(void)
     * we use the same name 'ram_bitmap' as for migration.
     */
     if (ram_bytes_total()) {
-        RAMBlock *block;
-
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             unsigned long pages = block->max_length >> TARGET_PAGE_BITS;
             block->bmap = bitmap_new(pages);
@@ -3998,12 +3996,12 @@ static int ram_load_precopy(QEMUFile *f)
                         }
                     }
                     if (migrate_ignore_shared()) {
-                        hwaddr addr = qemu_get_be64(f);
+                        hwaddr addr2 = qemu_get_be64(f);
                         if (migrate_ram_is_ignored(block) &&
-                            block->mr->addr != addr) {
+                            block->mr->addr != addr2) {
                             error_report("Mismatched GPAs for block %s "
                                          "%" PRId64 "!= %" PRId64,
-                                         id, (uint64_t)addr,
+                                         id, (uint64_t)addr2,
                                          (uint64_t)block->mr->addr);
                             ret = -EINVAL;
                         }
diff --git a/migration/rdma.c b/migration/rdma.c
index 3915d1d7c9..c78ddfcb74 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1902,9 +1902,11 @@ static int qemu_rdma_exchange_send(RDMAContext *rdma, RDMAControlHeader *head,
      * by waiting for a READY message.
      */
     if (rdma->control_ready_expected) {
-        RDMAControlHeader resp;
-        ret = qemu_rdma_exchange_get_response(rdma,
-                                    &resp, RDMA_CONTROL_READY, RDMA_WRID_READY);
+        RDMAControlHeader resp_ignored;
+
+        ret = qemu_rdma_exchange_get_response(rdma, &resp_ignored,
+                                              RDMA_CONTROL_READY,
+                                              RDMA_WRID_READY);
         if (ret < 0) {
             return ret;
         }
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 31842c3afb..438ea77cfa 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -97,7 +97,7 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
         return -EINVAL;
     }
     if (vmsd->pre_load) {
-        int ret = vmsd->pre_load(opaque);
+        ret = vmsd->pre_load(opaque);
         if (ret) {
             return ret;
         }
-- 
2.41.0


