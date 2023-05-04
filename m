Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDBC6F75AE
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 22:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530116.825514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf7d-0005xM-B0; Thu, 04 May 2023 20:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530116.825514; Thu, 04 May 2023 20:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf7d-0005so-6d; Thu, 04 May 2023 20:00:13 +0000
Received: by outflank-mailman (input) for mailman id 530116;
 Thu, 04 May 2023 20:00:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf1t-0003iB-Vn
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:54:17 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7358d671-eab5-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 21:54:17 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-EVERd-b1O6iV68LQZZKd_A-1; Thu, 04 May 2023 15:54:10 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC0B6A0F389;
 Thu,  4 May 2023 19:54:08 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51B294020960;
 Thu,  4 May 2023 19:54:08 +0000 (UTC)
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
X-Inumbo-ID: 7358d671-eab5-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bn7vYKIN4BAATa1eS0drL+2+35bJodnZI5fsBJiYTKs=;
	b=E6pRBqtnxp0TP87WMNL+URfi5WzVeWaz1lK3LF8Jf47/gjBQowXxde02YVjVwNLuWbYNB6
	/rdqsEIHgki4Ndsn5e4KruXtYhgcERq6rdpvSzIUwB4XwmDVj+6aHHHTb3nU8KQ4D9QD4j
	SzHpPG6CzzghWV6mKeKo/CVRplBXH5g=
X-MC-Unique: EVERd-b1O6iV68LQZZKd_A-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Peter Lieven <pl@kamp.de>,
	Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Juan Quintela <quintela@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v5 15/21] block/export: don't require AioContext lock around blk_exp_ref/unref()
Date: Thu,  4 May 2023 15:53:21 -0400
Message-Id: <20230504195327.695107-16-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

The FUSE export calls blk_exp_ref/unref() without the AioContext lock.
Instead of fixing the FUSE export, adjust blk_exp_ref/unref() so they
work without the AioContext lock. This way it's less error-prone.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
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


