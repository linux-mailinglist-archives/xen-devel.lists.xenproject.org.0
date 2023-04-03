Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C4C6D5076
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 20:31:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517559.803141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOx6-0007qa-Jw; Mon, 03 Apr 2023 18:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517559.803141; Mon, 03 Apr 2023 18:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOx6-0007hW-Dw; Mon, 03 Apr 2023 18:30:48 +0000
Received: by outflank-mailman (input) for mailman id 517559;
 Mon, 03 Apr 2023 18:30:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1aQ=72=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pjOx4-0004HH-KI
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 18:30:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a580eb64-d24d-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 20:30:46 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-LcBnC9OFNAS0HwwcyCiR0g-1; Mon, 03 Apr 2023 14:30:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A154885A5B1;
 Mon,  3 Apr 2023 18:30:39 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 062F21121314;
 Mon,  3 Apr 2023 18:30:38 +0000 (UTC)
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
X-Inumbo-ID: a580eb64-d24d-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680546644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pwn7OV2gNoHAp8haSXqR0tkaO5uu/ou2YhRF+j7lsw=;
	b=ZNlbdW6cE/ITRX9LLxw3u14JWZGqJgNuahR70l+HYnq3NDX7c4jb3ehsLSIxBovKHoi1l7
	dER6Akem132n0C2X3TtxRgOWSB1mmc6ErOI5tMhLivYCLNp4hM/QJnAeZ8IhRfsXCgE70B
	FFXOFexhjwfdYk9OaoXJeJvCKYesiew=
X-MC-Unique: LcBnC9OFNAS0HwwcyCiR0g-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Lieven <pl@kamp.de>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	<qemu-block@nongnu.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Fam Zheng <fam@euphon.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>,
	Juan Quintela <quintela@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	eesposit@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH 12/13] block/fuse: do not set is_external=true on FUSE fd
Date: Mon,  3 Apr 2023 14:30:03 -0400
Message-Id: <20230403183004.347205-13-stefanha@redhat.com>
In-Reply-To: <20230403183004.347205-1-stefanha@redhat.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

This is part of ongoing work to remove the aio_disable_external() API.

Use BlockDevOps .drained_begin/end/poll() instead of
aio_set_fd_handler(is_external=true).

As a side-effect the FUSE export now follows AioContext changes like the
other export types.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/fuse.c | 58 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 18394f9e07..83bccf046b 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -50,6 +50,7 @@ typedef struct FuseExport {
 
     struct fuse_session *fuse_session;
     struct fuse_buf fuse_buf;
+    unsigned int in_flight; /* atomic */
     bool mounted, fd_handler_set_up;
 
     char *mountpoint;
@@ -78,6 +79,42 @@ static void read_from_fuse_export(void *opaque);
 static bool is_regular_file(const char *path, Error **errp);
 
 
+static void fuse_export_drained_begin(void *opaque)
+{
+    FuseExport *exp = opaque;
+
+    aio_set_fd_handler(exp->common.ctx,
+                       fuse_session_fd(exp->fuse_session), false,
+                       NULL, NULL, NULL, NULL, NULL);
+    exp->fd_handler_set_up = false;
+}
+
+static void fuse_export_drained_end(void *opaque)
+{
+    FuseExport *exp = opaque;
+
+    /* Refresh AioContext in case it changed */
+    exp->common.ctx = blk_get_aio_context(exp->common.blk);
+
+    aio_set_fd_handler(exp->common.ctx,
+                       fuse_session_fd(exp->fuse_session), false,
+                       read_from_fuse_export, NULL, NULL, NULL, exp);
+    exp->fd_handler_set_up = true;
+}
+
+static bool fuse_export_drained_poll(void *opaque)
+{
+    FuseExport *exp = opaque;
+
+    return qatomic_read(&exp->in_flight) > 0;
+}
+
+static const BlockDevOps fuse_export_blk_dev_ops = {
+    .drained_begin = fuse_export_drained_begin,
+    .drained_end   = fuse_export_drained_end,
+    .drained_poll  = fuse_export_drained_poll,
+};
+
 static int fuse_export_create(BlockExport *blk_exp,
                               BlockExportOptions *blk_exp_args,
                               Error **errp)
@@ -101,6 +138,15 @@ static int fuse_export_create(BlockExport *blk_exp,
         }
     }
 
+    blk_set_dev_ops(exp->common.blk, &fuse_export_blk_dev_ops, exp);
+
+    /*
+     * We handle draining ourselves using an in-flight counter and by disabling
+     * the FUSE fd handler. Do not queue BlockBackend requests, they need to
+     * complete so the in-flight counter reaches zero.
+     */
+    blk_set_disable_request_queuing(exp->common.blk, true);
+
     init_exports_table();
 
     /*
@@ -224,7 +270,7 @@ static int setup_fuse_export(FuseExport *exp, const char *mountpoint,
     g_hash_table_insert(exports, g_strdup(mountpoint), NULL);
 
     aio_set_fd_handler(exp->common.ctx,
-                       fuse_session_fd(exp->fuse_session), true,
+                       fuse_session_fd(exp->fuse_session), false,
                        read_from_fuse_export, NULL, NULL, NULL, exp);
     exp->fd_handler_set_up = true;
 
@@ -248,6 +294,8 @@ static void read_from_fuse_export(void *opaque)
     blk_exp_ref(&exp->common);
     aio_context_release(exp->common.ctx);
 
+    qatomic_inc(&exp->in_flight);
+
     do {
         ret = fuse_session_receive_buf(exp->fuse_session, &exp->fuse_buf);
     } while (ret == -EINTR);
@@ -258,6 +306,10 @@ static void read_from_fuse_export(void *opaque)
     fuse_session_process_buf(exp->fuse_session, &exp->fuse_buf);
 
 out:
+    if (qatomic_fetch_dec(&exp->in_flight) == 1) {
+        aio_wait_kick(); /* wake AIO_WAIT_WHILE() */
+    }
+
     aio_context_acquire(exp->common.ctx);
     blk_exp_unref(&exp->common);
     aio_context_release(exp->common.ctx);
@@ -272,7 +324,7 @@ static void fuse_export_shutdown(BlockExport *blk_exp)
 
         if (exp->fd_handler_set_up) {
             aio_set_fd_handler(exp->common.ctx,
-                               fuse_session_fd(exp->fuse_session), true,
+                               fuse_session_fd(exp->fuse_session), false,
                                NULL, NULL, NULL, NULL, NULL);
             exp->fd_handler_set_up = false;
         }
@@ -291,6 +343,8 @@ static void fuse_export_delete(BlockExport *blk_exp)
 {
     FuseExport *exp = container_of(blk_exp, FuseExport, common);
 
+    blk_set_dev_ops(exp->common.blk, NULL, NULL);
+
     if (exp->fuse_session) {
         if (exp->mounted) {
             fuse_session_unmount(exp->fuse_session);
-- 
2.39.2


