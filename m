Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497846E807E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 19:39:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523670.813986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppBlk-0008Qc-UE; Wed, 19 Apr 2023 17:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523670.813986; Wed, 19 Apr 2023 17:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppBlk-0008PO-Jn; Wed, 19 Apr 2023 17:39:00 +0000
Received: by outflank-mailman (input) for mailman id 523670;
 Wed, 19 Apr 2023 17:38:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu/K=AK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppBcL-0001ia-He
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 17:29:17 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b53042d3-ded7-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 19:29:16 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-GPguznyEPGaF7KXF2UnWHQ-1; Wed, 19 Apr 2023 13:29:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5554B3801F5C;
 Wed, 19 Apr 2023 17:29:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 462742026D16;
 Wed, 19 Apr 2023 17:29:09 +0000 (UTC)
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
X-Inumbo-ID: b53042d3-ded7-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681925355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l1BfjF5WOabKn8yxsLU/Ixv2u9YtxHZYDFF52BuLnDA=;
	b=gQVtIVBw6ET3cfMWOrRuDOfFgt87/WReAZzNzBBWFRLDy8L1DtVIEMs1ngB/Lkqr60+sJi
	+ZjiQX9Q2guXRl+Yrso2qoLz+hwtboka8K/J0rgZBle+iVoRJa7sqVn5J/+gNv1tdw5/1l
	6o0g/o+hTe0ZgYp5IMKHW8bMJRBjhhQ=
X-MC-Unique: GPguznyEPGaF7KXF2UnWHQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Fam Zheng <fam@euphon.net>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Kevin Wolf <kwolf@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Lieven <pl@kamp.de>,
	eesposit@redhat.com,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 12/16] hw/xen: do not set is_external=true on evtchn fds
Date: Wed, 19 Apr 2023 13:28:13 -0400
Message-Id: <20230419172817.272758-13-stefanha@redhat.com>
In-Reply-To: <20230419172817.272758-1-stefanha@redhat.com>
References: <20230419172817.272758-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

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


