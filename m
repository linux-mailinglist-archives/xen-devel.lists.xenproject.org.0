Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBF36EE6A7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 19:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526219.817866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMTO-0006qH-CN; Tue, 25 Apr 2023 17:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526219.817866; Tue, 25 Apr 2023 17:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMTO-0006ke-7B; Tue, 25 Apr 2023 17:29:02 +0000
Received: by outflank-mailman (input) for mailman id 526219;
 Tue, 25 Apr 2023 17:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Bb6=AQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1prMTI-0007l5-53
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 17:28:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a65dc6eb-e38e-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 19:28:54 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-veeuRtEqOMmqQHFesBK3Zg-1; Tue, 25 Apr 2023 13:28:41 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 564C310146EC;
 Tue, 25 Apr 2023 17:27:51 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83601C15BA0;
 Tue, 25 Apr 2023 17:27:50 +0000 (UTC)
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
X-Inumbo-ID: a65dc6eb-e38e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682443733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RuyPP84PtIn0scDzjbw4vF6+iUnekek3zn9Q9Bf1Sn4=;
	b=SHnm/ofxiXQSJJm+mFY5E8cWc45r8bQAyEv0/KXZLZfDBqeKhY4IDi7oQBGl/E6nc0HcMH
	141dYfbtfLt48ubJQPLKKedqs3KDh2AljOUaz4OuXo4k3CB4Z6hOKp6NvAzz8FOT1oR02g
	wRDMFAhpV8CMPyevDb6nAfB2OtDYZHQ=
X-MC-Unique: veeuRtEqOMmqQHFesBK3Zg-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Lieven <pl@kamp.de>,
	Paul Durrant <paul@xen.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: [PATCH v4 14/20] block/export: don't require AioContext lock around blk_exp_ref/unref()
Date: Tue, 25 Apr 2023 13:27:10 -0400
Message-Id: <20230425172716.1033562-15-stefanha@redhat.com>
In-Reply-To: <20230425172716.1033562-1-stefanha@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

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
index 28a91c9c42..ddaf8036e5 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -201,11 +201,10 @@ fail:
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
@@ -227,11 +226,10 @@ static void blk_exp_delete_bh(void *opaque)
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
@@ -339,7 +337,8 @@ void qmp_block_export_del(const char *id,
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
index 35dc8fcf45..611430afda 100644
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
2.39.2


