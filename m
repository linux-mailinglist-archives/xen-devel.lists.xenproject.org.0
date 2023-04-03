Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1626D506F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 20:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517556.803114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOwz-0006ZZ-Uh; Mon, 03 Apr 2023 18:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517556.803114; Mon, 03 Apr 2023 18:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOwz-0006VK-Mj; Mon, 03 Apr 2023 18:30:41 +0000
Received: by outflank-mailman (input) for mailman id 517556;
 Mon, 03 Apr 2023 18:30:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1aQ=72=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pjOwx-00058E-3X
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 18:30:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a068c5f4-d24d-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 20:30:37 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-74AM9wfyN9eiYjF1jls1ng-1; Mon, 03 Apr 2023 14:30:33 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE94B811E7C;
 Mon,  3 Apr 2023 18:30:31 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 521171121314;
 Mon,  3 Apr 2023 18:30:31 +0000 (UTC)
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
X-Inumbo-ID: a068c5f4-d24d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680546636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w78ixlnTJkfmit1c5uhGwpfg3e2qbfo6w6b+6TW1iVA=;
	b=D8g8DNdYotY3VuhWIN5vTd5CmEn80Ry48uLp2xBWgJ+aguPaY/WH8O/z7PWXXhydT3zCDm
	ZgDNTHxlvXdxOeh9rjIagscMlbLbDKot1VRaMi+JENdwF2VzC0/CShZeyCjooamKM5YXMm
	9R6V1BPLX2Fp3UVDHCidsLd4YD8gV8Y=
X-MC-Unique: 74AM9wfyN9eiYjF1jls1ng-1
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
Subject: [PATCH 09/13] hw/xen: do not set is_external=true on evtchn fds
Date: Mon,  3 Apr 2023 14:30:00 -0400
Message-Id: <20230403183004.347205-10-stefanha@redhat.com>
In-Reply-To: <20230403183004.347205-1-stefanha@redhat.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

is_external=true suspends fd handlers between aio_disable_external() and
aio_enable_external(). The block layer's drain operation uses this
mechanism to prevent new I/O from sneaking in between
bdrv_drained_begin() and bdrv_drained_end().

The xen-block device actually works fine with is_external=false because
BlockBackend requests are already queued between bdrv_drained_begin()
and bdrv_drained_end(). Since the Xen ring size is finite, request
queuing will stop once the ring is full and memory usage is bounded.
After bdrv_drained_end() the BlockBackend requests will resume and
xen-block's processing will continue.

This is part of ongoing work to remove the aio_disable_external() API.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/xen/xen-bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index c59850b1de..c4fd26abe1 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -842,11 +842,11 @@ void xen_device_set_event_channel_context(XenDevice *xendev,
     }
 
     if (channel->ctx)
-        aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), true,
+        aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), false,
                            NULL, NULL, NULL, NULL, NULL);
 
     channel->ctx = ctx;
-    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), true,
+    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), false,
                        xen_device_event, NULL, xen_device_poll, NULL, channel);
 }
 
@@ -920,7 +920,7 @@ void xen_device_unbind_event_channel(XenDevice *xendev,
 
     QLIST_REMOVE(channel, list);
 
-    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), true,
+    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), false,
                        NULL, NULL, NULL, NULL, NULL);
 
     if (qemu_xen_evtchn_unbind(channel->xeh, channel->local_port) < 0) {
-- 
2.39.2


