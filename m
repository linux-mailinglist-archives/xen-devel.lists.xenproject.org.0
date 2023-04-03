Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF146D506D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 20:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517557.803117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOx0-0006eP-BI; Mon, 03 Apr 2023 18:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517557.803117; Mon, 03 Apr 2023 18:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOx0-0006ZY-3x; Mon, 03 Apr 2023 18:30:42 +0000
Received: by outflank-mailman (input) for mailman id 517557;
 Mon, 03 Apr 2023 18:30:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1aQ=72=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pjOwx-00058E-FX
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 18:30:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0980774-d24d-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 20:30:37 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-LlfGX1TgPQ-M7RE1UMTAgw-1; Mon, 03 Apr 2023 14:30:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 408E3101A551;
 Mon,  3 Apr 2023 18:30:27 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B806140EBF4;
 Mon,  3 Apr 2023 18:30:26 +0000 (UTC)
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
X-Inumbo-ID: a0980774-d24d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680546636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hEwtCA8s9JuIEhTUsGQuJCNn3dK7Smgq43ityTlAMA0=;
	b=Xcp4WtcqbfNKMOakkTqb4qmt7Tm+ZsvjLsYs4l1qKl45bB3w/KSqrfXNUWwmk0tydT95ez
	Ltj8xIHGvxr0HOvGhFmmFFc1PbDlC/PZCR7ZjmVwU4UszcBPcMRVWP1b7eJ0/iF2NB1l7e
	zSUfRYz8Svn4VgimrgfHMFDLwZY6H/E=
X-MC-Unique: LlfGX1TgPQ-M7RE1UMTAgw-1
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
Subject: [PATCH 07/13] virtio: do not set is_external=true on host notifiers
Date: Mon,  3 Apr 2023 14:29:58 -0400
Message-Id: <20230403183004.347205-8-stefanha@redhat.com>
In-Reply-To: <20230403183004.347205-1-stefanha@redhat.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Host notifiers trigger virtqueue processing. There are critical sections
when new I/O requests must not be submitted because they would cause
interference.

In the past this was solved using aio_set_event_notifiers()
is_external=true argument, which disables fd monitoring between
aio_disable/enable_external() calls. This API is not multi-queue block
layer friendly because it requires knowledge of the specific AioContext.
In a multi-queue block layer world any thread can submit I/O and we
don't know which AioContexts are currently involved.

virtio-blk and virtio-scsi are the only users that depend on
is_external=true. Both rely on the block layer, where we can take
advantage of the existing request queuing behavior that happens during
drained sections. The block layer's drained sections are the only user
of aio_disable_external().

After this patch the virtqueues will be processed during drained
section, but submitted I/O requests will be queued in the BlockBackend.
Queued requests are resumed when the drained section ends. Therefore,
the BlockBackend is still quiesced during drained sections but we no
longer rely on is_external=true to achieve this.

Note that virtqueues have a finite size, so queuing requests does not
lead to unbounded memory usage.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/virtio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 98c4819fcc..dcd7aabb4e 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3491,7 +3491,7 @@ static void virtio_queue_host_notifier_aio_poll_end(EventNotifier *n)
 
 void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx)
 {
-    aio_set_event_notifier(ctx, &vq->host_notifier, true,
+    aio_set_event_notifier(ctx, &vq->host_notifier, false,
                            virtio_queue_host_notifier_read,
                            virtio_queue_host_notifier_aio_poll,
                            virtio_queue_host_notifier_aio_poll_ready);
@@ -3508,14 +3508,14 @@ void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx)
  */
 void virtio_queue_aio_attach_host_notifier_no_poll(VirtQueue *vq, AioContext *ctx)
 {
-    aio_set_event_notifier(ctx, &vq->host_notifier, true,
+    aio_set_event_notifier(ctx, &vq->host_notifier, false,
                            virtio_queue_host_notifier_read,
                            NULL, NULL);
 }
 
 void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx)
 {
-    aio_set_event_notifier(ctx, &vq->host_notifier, true, NULL, NULL, NULL);
+    aio_set_event_notifier(ctx, &vq->host_notifier, false, NULL, NULL, NULL);
     /* Test and clear notifier before after disabling event,
      * in case poll callback didn't have time to run. */
     virtio_queue_host_notifier_read(&vq->host_notifier);
-- 
2.39.2


