Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D507F6F75A6
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530094.825458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf6o-0002RE-Br; Thu, 04 May 2023 19:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530094.825458; Thu, 04 May 2023 19:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf6o-0002Oq-8X; Thu, 04 May 2023 19:59:22 +0000
Received: by outflank-mailman (input) for mailman id 530094;
 Thu, 04 May 2023 19:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf28-0003xx-K8
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:54:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b8f1ab9-eab5-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:54:31 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-i1TCEUOyPMCxwUb6LaaevA-1; Thu, 04 May 2023 15:54:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A91B5811E7E;
 Thu,  4 May 2023 19:54:23 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E16B2166B31;
 Thu,  4 May 2023 19:54:21 +0000 (UTC)
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
X-Inumbo-ID: 7b8f1ab9-eab5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=peUabVxpb/f9SoCESFgzNkXObwSbZ6ll4imnzO2kIyY=;
	b=XoxQ/jxHYPKvkrOMDt7ssACzd/kVn1YwMjKNc5bk+7ES57V+Hchp9ORuWVUdH7ZbuIL7My
	4ifEBGnlRAzo5DaMTj/T0Ze2lIe+yTFodtd+WYzg76uEg7TuJiPTfQJFRj69Zx567QsavY
	Zwc2tIB1tAnRDW/UOkGVdVHaJJ+/wSs=
X-MC-Unique: i1TCEUOyPMCxwUb6LaaevA-1
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
Subject: [PATCH v5 20/21] virtio: do not set is_external=true on host notifiers
Date: Thu,  4 May 2023 15:53:26 -0400
Message-Id: <20230504195327.695107-21-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

Host notifiers can now use is_external=false since virtio-blk and
virtio-scsi no longer rely on is_external=true for drained sections.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/virtio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 272d930721..9cdad7e550 100644
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
2.40.1


