Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BF76E9357
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524178.814911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSmn-0001hR-Fc; Thu, 20 Apr 2023 11:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524178.814911; Thu, 20 Apr 2023 11:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSmn-0001do-C4; Thu, 20 Apr 2023 11:49:13 +0000
Received: by outflank-mailman (input) for mailman id 524178;
 Thu, 20 Apr 2023 11:49:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onos=AL=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppScs-0001nK-Ff
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:38:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eedc5052-df6f-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 13:38:56 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-ugElyGhbO4WVcymr-LwNgg-1; Thu, 20 Apr 2023 07:38:51 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92E361C0897A;
 Thu, 20 Apr 2023 11:38:50 +0000 (UTC)
Received: from localhost (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A8FD51E3;
 Thu, 20 Apr 2023 11:38:49 +0000 (UTC)
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
X-Inumbo-ID: eedc5052-df6f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681990735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svW5Iqq6ywfg5XGxDCHKSniKJYjg3etTmQ7BLHFrTFw=;
	b=an3g+b76QwMPE/QW5urr0RtNFLf/9WPXWqCz87YYVTEjqILJC8ytc7K0rP0KXSPk2Y3KJi
	XDexm/xEgHwFepMeW5/HmqXBNClgcK2VVkHWTHG7TqeTKLMCLt2ZfmlLbq628U65UKT5NT
	Dy2BlnY35Bxsu1dHwAaRMzxx1BKBpI4=
X-MC-Unique: ugElyGhbO4WVcymr-LwNgg-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Juan Quintela <quintela@redhat.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>,
	Fam Zheng <fam@euphon.net>,
	Julia Suvorova <jusual@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	xen-devel@lists.xenproject.org,
	Hanna Reitz <hreitz@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	eesposit@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 14/20] block/export: don't require AioContext lock around blk_exp_ref/unref()
Date: Thu, 20 Apr 2023 07:37:26 -0400
Message-Id: <20230420113732.336620-15-stefanha@redhat.com>
In-Reply-To: <20230420113732.336620-1-stefanha@redhat.com>
References: <20230420113732.336620-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

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
index e3fee60611..edb05c9268 100644
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


