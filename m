Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE1570E29B
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 19:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538634.838763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VZU-0003hF-9G; Tue, 23 May 2023 17:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538634.838763; Tue, 23 May 2023 17:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VZU-0003bQ-68; Tue, 23 May 2023 17:13:16 +0000
Received: by outflank-mailman (input) for mailman id 538634;
 Tue, 23 May 2023 17:13:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZ9c=BM=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q1VZS-0003Rc-SC
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 17:13:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18f315e8-f98d-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 19:13:13 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-U7wtUpM-PKeB1Q5oAQl4JQ-1; Tue, 23 May 2023 13:13:08 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E180B811E86;
 Tue, 23 May 2023 17:13:07 +0000 (UTC)
Received: from localhost (unknown [10.39.195.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 452C940C6CD9;
 Tue, 23 May 2023 17:13:06 +0000 (UTC)
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
X-Inumbo-ID: 18f315e8-f98d-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684861992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gl1BF0SyL3LhZIAAGPQ17yn9AeFfqz/sAdquKqfMac8=;
	b=PjoZO4BN9usTpYk74+1eR9sCmkitsUf+Y5w0UyhDWzumVxhBT6jawoFyp+UncUF94d9HNL
	6JIUgglfndKReyYmETCEayNeK+L1WhZaE3QDJR72fItTyVMs9Yj76e4JBErhw2sWlRrFyl
	nCfa9YlWV0HAuDQAJfaksWZwqRFAcHc=
X-MC-Unique: U7wtUpM-PKeB1Q5oAQl4JQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	xen-devel@lists.xenproject.org,
	eblake@redhat.com,
	Anthony Perard <anthony.perard@citrix.com>,
	qemu-block@nongnu.org
Subject: [PATCH v2 2/6] block/nvme: convert to blk_io_plug_call() API
Date: Tue, 23 May 2023 13:12:56 -0400
Message-Id: <20230523171300.132347-3-stefanha@redhat.com>
In-Reply-To: <20230523171300.132347-1-stefanha@redhat.com>
References: <20230523171300.132347-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

Stop using the .bdrv_co_io_plug() API because it is not multi-queue
block layer friendly. Use the new blk_io_plug_call() API to batch I/O
submission instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
v2
- Remove unused nvme_process_completion_queue_plugged trace event
  [Stefano]
---
 block/nvme.c       | 44 ++++++++++++--------------------------------
 block/trace-events |  1 -
 2 files changed, 12 insertions(+), 33 deletions(-)

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
diff --git a/block/trace-events b/block/trace-events
index 32665158d6..048ad27519 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -141,7 +141,6 @@ nvme_kick(void *s, unsigned q_index) "s %p q #%u"
 nvme_dma_flush_queue_wait(void *s) "s %p"
 nvme_error(int cmd_specific, int sq_head, int sqid, int cid, int status) "cmd_specific %d sq_head %d sqid %d cid %d status 0x%x"
 nvme_process_completion(void *s, unsigned q_index, int inflight) "s %p q #%u inflight %d"
-nvme_process_completion_queue_plugged(void *s, unsigned q_index) "s %p q #%u"
 nvme_complete_command(void *s, unsigned q_index, int cid) "s %p q #%u cid %d"
 nvme_submit_command(void *s, unsigned q_index, int cid) "s %p q #%u cid %d"
 nvme_submit_command_raw(int c0, int c1, int c2, int c3, int c4, int c5, int c6, int c7) "%02x %02x %02x %02x %02x %02x %02x %02x"
-- 
2.40.1


