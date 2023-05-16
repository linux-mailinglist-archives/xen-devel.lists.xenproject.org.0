Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEDA7056A4
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535472.833281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyzxV-0007Vv-Qg; Tue, 16 May 2023 19:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535472.833281; Tue, 16 May 2023 19:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyzxV-0007T6-N4; Tue, 16 May 2023 19:03:41 +0000
Received: by outflank-mailman (input) for mailman id 535472;
 Tue, 16 May 2023 19:03:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zzm0=BF=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pyzxU-0002eu-Uf
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:03:40 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5df11914-f41c-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 21:03:40 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-qbs1UNnyNMWMb1G0IdJnag-1; Tue, 16 May 2023 15:03:35 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 612FC29A9CBD;
 Tue, 16 May 2023 19:03:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9719492B00;
 Tue, 16 May 2023 19:03:33 +0000 (UTC)
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
X-Inumbo-ID: 5df11914-f41c-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684263818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IFl7FI73+FiKjtdEe70JC8EnCu2IGMWapigmR378qow=;
	b=BvMfhU/LbFfGbN58I1Xq2b0BeCGztN3HKZ58N9LGRhpGWkY/OG+/hrJBMAi+9z+ljkN/Pz
	dfMJHbxMhts+eYH324AROaZfQShrVECsXRR603Bk8ao6oz49Z5AgTuY6107tzIwCrfRboF
	jLv0how9LpmIUcpzd27Baxp+kNk7f20=
X-MC-Unique: qbs1UNnyNMWMb1G0IdJnag-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Coiby Xu <Coiby.Xu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	xen-devel@lists.xenproject.org,
	Kevin Wolf <kwolf@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	eesposit@redhat.com,
	Fam Zheng <fam@euphon.net>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Xie Yongji <xieyongji@bytedance.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Paul Durrant <paul@xen.org>,
	Stefan Weil <sw@weilnetz.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Lieven <pl@kamp.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Juan Quintela <quintela@redhat.com>
Subject: [PATCH v6 14/20] block/export: don't require AioContext lock around blk_exp_ref/unref()
Date: Tue, 16 May 2023 15:02:32 -0400
Message-Id: <20230516190238.8401-15-stefanha@redhat.com>
In-Reply-To: <20230516190238.8401-1-stefanha@redhat.com>
References: <20230516190238.8401-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

The FUSE export calls blk_exp_ref/unref() without the AioContext lock.
Instead of fixing the FUSE export, adjust blk_exp_ref/unref() so they
work without the AioContext lock. This way it's less error-prone.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/export.h   |  2 ++
 block/export/export.c    | 13 ++++++-------
 block/export/vduse-blk.c |  4 ----
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/block/export.h b/include/block/export.h
index 7feb02e10d..f2fe0f8078 100644
--- a/include/block/export.h
+++ b/include/block/export.h
@@ -57,6 +57,8 @@ struct BlockExport {
      * Reference count for this block export. This includes strong references
      * both from the owner (qemu-nbd or the monitor) and clients connected to
      * the export.
+     *
+     * Use atomics to access this field.
      */
     int refcount;
 
diff --git a/block/export/export.c b/block/export/export.c
index 62c7c22d45..ab007e9d31 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -202,11 +202,10 @@ fail:
     return NULL;
 }
 
-/* Callers must hold exp->ctx lock */
 void blk_exp_ref(BlockExport *exp)
 {
-    assert(exp->refcount > 0);
-    exp->refcount++;
+    assert(qatomic_read(&exp->refcount) > 0);
+    qatomic_inc(&exp->refcount);
 }
 
 /* Runs in the main thread */
@@ -229,11 +228,10 @@ static void blk_exp_delete_bh(void *opaque)
     aio_context_release(aio_context);
 }
 
-/* Callers must hold exp->ctx lock */
 void blk_exp_unref(BlockExport *exp)
 {
-    assert(exp->refcount > 0);
-    if (--exp->refcount == 0) {
+    assert(qatomic_read(&exp->refcount) > 0);
+    if (qatomic_fetch_dec(&exp->refcount) == 1) {
         /* Touch the block_exports list only in the main thread */
         aio_bh_schedule_oneshot(qemu_get_aio_context(), blk_exp_delete_bh,
                                 exp);
@@ -341,7 +339,8 @@ void qmp_block_export_del(const char *id,
     if (!has_mode) {
         mode = BLOCK_EXPORT_REMOVE_MODE_SAFE;
     }
-    if (mode == BLOCK_EXPORT_REMOVE_MODE_SAFE && exp->refcount > 1) {
+    if (mode == BLOCK_EXPORT_REMOVE_MODE_SAFE &&
+        qatomic_read(&exp->refcount) > 1) {
         error_setg(errp, "export '%s' still in use", exp->id);
         error_append_hint(errp, "Use mode='hard' to force client "
                           "disconnect\n");
diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index a25556fe04..e0455551f9 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -44,9 +44,7 @@ static void vduse_blk_inflight_inc(VduseBlkExport *vblk_exp)
 {
     if (qatomic_fetch_inc(&vblk_exp->inflight) == 0) {
         /* Prevent export from being deleted */
-        aio_context_acquire(vblk_exp->export.ctx);
         blk_exp_ref(&vblk_exp->export);
-        aio_context_release(vblk_exp->export.ctx);
     }
 }
 
@@ -57,9 +55,7 @@ static void vduse_blk_inflight_dec(VduseBlkExport *vblk_exp)
         aio_wait_kick();
 
         /* Now the export can be deleted */
-        aio_context_acquire(vblk_exp->export.ctx);
         blk_exp_unref(&vblk_exp->export);
-        aio_context_release(vblk_exp->export.ctx);
     }
 }
 
-- 
2.40.1


