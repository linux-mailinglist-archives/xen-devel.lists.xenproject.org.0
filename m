Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E656F75A5
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530093.825449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf6m-0002C3-2t; Thu, 04 May 2023 19:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530093.825449; Thu, 04 May 2023 19:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf6m-00029U-0A; Thu, 04 May 2023 19:59:20 +0000
Received: by outflank-mailman (input) for mailman id 530093;
 Thu, 04 May 2023 19:59:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf1v-0003xx-QK
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:54:19 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 732726f0-eab5-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:54:16 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-pmj5n48DPI265atIoUKLhQ-1; Thu, 04 May 2023 15:54:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78EBA855304;
 Thu,  4 May 2023 19:54:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB4002166B30;
 Thu,  4 May 2023 19:54:10 +0000 (UTC)
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
X-Inumbo-ID: 732726f0-eab5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pXsgzUQNPWG1ZQh/g83GoR8nnGiyShUYhUlRFMynpck=;
	b=LLvQInOb3cY5EaZPXCFCBQngtWgL2hlRshh00E2VEU/8EUi3VryPt+evBdNGoje4Ifbzeq
	ubrqBZEy6RlpJtvugbWI2NJTZUCJOhBfjzoB6YhQ2+yrQjZ8v0/c9254je/izmLXQvKx2D
	CqOWg14P8OWSNDy+XUKUU/BoZ+25+P4=
X-MC-Unique: pmj5n48DPI265atIoUKLhQ-1
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
Subject: [PATCH v5 16/21] block/fuse: do not set is_external=true on FUSE fd
Date: Thu,  4 May 2023 15:53:22 -0400
Message-Id: <20230504195327.695107-17-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

This is part of ongoing work to remove the aio_disable_external() API.

Use BlockDevOps .drained_begin/end/poll() instead of
aio_set_fd_handler(is_external=true).

As a side-effect the FUSE export now follows AioContext changes like the
other export types.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/fuse.c | 56 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 06fa41079e..adf3236b5a 100644
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
 
@@ -246,6 +292,8 @@ static void read_from_fuse_export(void *opaque)
 
     blk_exp_ref(&exp->common);
 
+    qatomic_inc(&exp->in_flight);
+
     do {
         ret = fuse_session_receive_buf(exp->fuse_session, &exp->fuse_buf);
     } while (ret == -EINTR);
@@ -256,6 +304,10 @@ static void read_from_fuse_export(void *opaque)
     fuse_session_process_buf(exp->fuse_session, &exp->fuse_buf);
 
 out:
+    if (qatomic_fetch_dec(&exp->in_flight) == 1) {
+        aio_wait_kick(); /* wake AIO_WAIT_WHILE() */
+    }
+
     blk_exp_unref(&exp->common);
 }
 
@@ -268,7 +320,7 @@ static void fuse_export_shutdown(BlockExport *blk_exp)
 
         if (exp->fd_handler_set_up) {
             aio_set_fd_handler(exp->common.ctx,
-                               fuse_session_fd(exp->fuse_session), true,
+                               fuse_session_fd(exp->fuse_session), false,
                                NULL, NULL, NULL, NULL, NULL);
             exp->fd_handler_set_up = false;
         }
-- 
2.40.1


