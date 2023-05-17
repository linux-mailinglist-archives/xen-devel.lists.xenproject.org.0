Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E16F4707519
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 00:11:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536081.834209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzPLz-0005GK-QZ; Wed, 17 May 2023 22:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536081.834209; Wed, 17 May 2023 22:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzPLz-0005BQ-Kx; Wed, 17 May 2023 22:10:39 +0000
Received: by outflank-mailman (input) for mailman id 536081;
 Wed, 17 May 2023 22:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JqXG=BG=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pzPLx-0004sP-Ny
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 22:10:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a639c45e-f4ff-11ed-b22a-6b7b168915f2;
 Thu, 18 May 2023 00:10:37 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-C0RqvpuqMluZCT-d_XeyiQ-1; Wed, 17 May 2023 18:10:32 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F6833C0BE57;
 Wed, 17 May 2023 22:10:31 +0000 (UTC)
Received: from localhost (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3F2614171C0;
 Wed, 17 May 2023 22:10:30 +0000 (UTC)
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
X-Inumbo-ID: a639c45e-f4ff-11ed-b22a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684361435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gFn0D1QeS7K9r5hk8We93ICMQFKJ73KryVejH0WL6Ew=;
	b=ZZqmvM2fOa51dy/lEyym2F0cKXavI3OdGqa87KJGo54j/9zAiOMmfVu4r29yppxmq23am8
	D0Rpt1N7hoXfyQ4aRhQPNLqOfHDNP2S1YkIpYMTHps2q3udYjbJ/UQsB7Ns3DXSOBHw9vj
	3AzaBs42j1us/eOQaGLu5nS5imBhrsI=
X-MC-Unique: C0RqvpuqMluZCT-d_XeyiQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	Julia Suvorova <jusual@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 2/6] block/nvme: convert to blk_io_plug_call() API
Date: Wed, 17 May 2023 18:10:18 -0400
Message-Id: <20230517221022.325091-3-stefanha@redhat.com>
In-Reply-To: <20230517221022.325091-1-stefanha@redhat.com>
References: <20230517221022.325091-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Stop using the .bdrv_co_io_plug() API because it is not multi-queue
block layer friendly. Use the new blk_io_plug_call() API to batch I/O
submission instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/nvme.c | 44 ++++++++++++--------------------------------
 1 file changed, 12 insertions(+), 32 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 5b744c2bda..100b38b592 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -25,6 +25,7 @@
 #include "qemu/vfio-helpers.h"
 #include "block/block-io.h"
 #include "block/block_int.h"
+#include "sysemu/block-backend.h"
 #include "sysemu/replay.h"
 #include "trace.h"
 
@@ -119,7 +120,6 @@ struct BDRVNVMeState {
     int blkshift;
 
     uint64_t max_transfer;
-    bool plugged;
 
     bool supports_write_zeroes;
     bool supports_discard;
@@ -282,7 +282,7 @@ static void nvme_kick(NVMeQueuePair *q)
 {
     BDRVNVMeState *s = q->s;
 
-    if (s->plugged || !q->need_kick) {
+    if (!q->need_kick) {
         return;
     }
     trace_nvme_kick(s, q->index);
@@ -387,10 +387,6 @@ static bool nvme_process_completion(NVMeQueuePair *q)
     NvmeCqe *c;
 
     trace_nvme_process_completion(s, q->index, q->inflight);
-    if (s->plugged) {
-        trace_nvme_process_completion_queue_plugged(s, q->index);
-        return false;
-    }
 
     /*
      * Support re-entrancy when a request cb() function invokes aio_poll().
@@ -480,6 +476,15 @@ static void nvme_trace_command(const NvmeCmd *cmd)
     }
 }
 
+static void nvme_unplug_fn(void *opaque)
+{
+    NVMeQueuePair *q = opaque;
+
+    QEMU_LOCK_GUARD(&q->lock);
+    nvme_kick(q);
+    nvme_process_completion(q);
+}
+
 static void nvme_submit_command(NVMeQueuePair *q, NVMeRequest *req,
                                 NvmeCmd *cmd, BlockCompletionFunc cb,
                                 void *opaque)
@@ -496,8 +501,7 @@ static void nvme_submit_command(NVMeQueuePair *q, NVMeRequest *req,
            q->sq.tail * NVME_SQ_ENTRY_BYTES, cmd, sizeof(*cmd));
     q->sq.tail = (q->sq.tail + 1) % NVME_QUEUE_SIZE;
     q->need_kick++;
-    nvme_kick(q);
-    nvme_process_completion(q);
+    blk_io_plug_call(nvme_unplug_fn, q);
     qemu_mutex_unlock(&q->lock);
 }
 
@@ -1567,27 +1571,6 @@ static void nvme_attach_aio_context(BlockDriverState *bs,
     }
 }
 
-static void coroutine_fn nvme_co_io_plug(BlockDriverState *bs)
-{
-    BDRVNVMeState *s = bs->opaque;
-    assert(!s->plugged);
-    s->plugged = true;
-}
-
-static void coroutine_fn nvme_co_io_unplug(BlockDriverState *bs)
-{
-    BDRVNVMeState *s = bs->opaque;
-    assert(s->plugged);
-    s->plugged = false;
-    for (unsigned i = INDEX_IO(0); i < s->queue_count; i++) {
-        NVMeQueuePair *q = s->queues[i];
-        qemu_mutex_lock(&q->lock);
-        nvme_kick(q);
-        nvme_process_completion(q);
-        qemu_mutex_unlock(&q->lock);
-    }
-}
-
 static bool nvme_register_buf(BlockDriverState *bs, void *host, size_t size,
                               Error **errp)
 {
@@ -1664,9 +1647,6 @@ static BlockDriver bdrv_nvme = {
     .bdrv_detach_aio_context  = nvme_detach_aio_context,
     .bdrv_attach_aio_context  = nvme_attach_aio_context,
 
-    .bdrv_co_io_plug          = nvme_co_io_plug,
-    .bdrv_co_io_unplug        = nvme_co_io_unplug,
-
     .bdrv_register_buf        = nvme_register_buf,
     .bdrv_unregister_buf      = nvme_unregister_buf,
 };
-- 
2.40.1


