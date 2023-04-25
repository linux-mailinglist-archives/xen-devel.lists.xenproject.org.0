Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05556EE693
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 19:28:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526192.817817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMSN-0002rO-3Z; Tue, 25 Apr 2023 17:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526192.817817; Tue, 25 Apr 2023 17:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMSM-0002lQ-Tx; Tue, 25 Apr 2023 17:27:58 +0000
Received: by outflank-mailman (input) for mailman id 526192;
 Tue, 25 Apr 2023 17:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Bb6=AQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1prMSL-0007l5-Cl
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 17:27:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 818b67b1-e38e-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 19:27:52 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-6D_FeGHnNl-RzOiCHv9FDA-1; Tue, 25 Apr 2023 13:27:48 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E805487A9E6;
 Tue, 25 Apr 2023 17:27:46 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CE1E2166B41;
 Tue, 25 Apr 2023 17:27:45 +0000 (UTC)
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
X-Inumbo-ID: 818b67b1-e38e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682443671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l1BfjF5WOabKn8yxsLU/Ixv2u9YtxHZYDFF52BuLnDA=;
	b=R3hAfaGqHbElLEBj5rTWRitcmgkqgDlMBepN/lfTDeTz/0w8D3OgY0R6yH+gWeB6oEVYQ/
	+Y2GqMp4Z6ntVxXawasE9Rngg0vr7/rwddFMsHfjtNn4xB6vuCnJ5L177HT/NgwZtQ4ST5
	VFHHOa61GMzklIFW8oruWmH3oaa4oao=
X-MC-Unique: 6D_FeGHnNl-RzOiCHv9FDA-1
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
Subject: [PATCH v4 12/20] hw/xen: do not set is_external=true on evtchn fds
Date: Tue, 25 Apr 2023 13:27:08 -0400
Message-Id: <20230425172716.1033562-13-stefanha@redhat.com>
In-Reply-To: <20230425172716.1033562-1-stefanha@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

is_external=true suspends fd handlers between aio_disable_external() and
aio_enable_external(). The block layer's drain operation uses this
mechanism to prevent new I/O from sneaking in between
bdrv_drained_begin() and bdrv_drained_end().

The previous commit converted the xen-block device to use BlockDevOps
.drained_begin/end() callbacks. It no longer relies on is_external=true
so it is safe to pass is_external=false.

This is part of ongoing work to remove the aio_disable_external() API.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/xen/xen-bus.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index b8f408c9ed..bf256d4da2 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -842,14 +842,14 @@ void xen_device_set_event_channel_context(XenDevice *xendev,
     }
 
     if (channel->ctx)
-        aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), true,
+        aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), false,
                            NULL, NULL, NULL, NULL, NULL);
 
     channel->ctx = ctx;
     if (ctx) {
         aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh),
-                           true, xen_device_event, NULL, xen_device_poll, NULL,
-                           channel);
+                           false, xen_device_event, NULL, xen_device_poll,
+                           NULL, channel);
     }
 }
 
@@ -923,7 +923,7 @@ void xen_device_unbind_event_channel(XenDevice *xendev,
 
     QLIST_REMOVE(channel, list);
 
-    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), true,
+    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), false,
                        NULL, NULL, NULL, NULL, NULL);
 
     if (qemu_xen_evtchn_unbind(channel->xeh, channel->local_port) < 0) {
-- 
2.39.2


