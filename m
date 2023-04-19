Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798BB6E8058
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 19:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523649.813962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppBbt-0004M1-7N; Wed, 19 Apr 2023 17:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523649.813962; Wed, 19 Apr 2023 17:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppBbt-0004Fo-2p; Wed, 19 Apr 2023 17:28:49 +0000
Received: by outflank-mailman (input) for mailman id 523649;
 Wed, 19 Apr 2023 17:28:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu/K=AK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppBbr-00036z-HM
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 17:28:47 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2d7273d-ded7-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 19:28:45 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-gx2svh4pM8KqGWApR1ZRlw-1; Wed, 19 Apr 2023 13:28:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B7E68996E0;
 Wed, 19 Apr 2023 17:28:40 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BABDC2026D16;
 Wed, 19 Apr 2023 17:28:39 +0000 (UTC)
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
X-Inumbo-ID: a2d7273d-ded7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681925324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1INS84S/tNTOXSgAzqbNWqBblrNC9wvg2yPbndQJO20=;
	b=PJFWR14PpG+d062hNmHOVKeOR3b+9CRPzlKJj0AN2yN96fPIUJCYgRnycJU4eNPoK2czPl
	WzQs9676Xf6UYI/IlGb2NncQfFRH559BK/HqFbnjJ0xHHGYP8s5f6GCxBVI1Wgmu+KRZbn
	ARV0ivAhVH4AvVRYv6dsfIIOUQffyBo=
X-MC-Unique: gx2svh4pM8KqGWApR1ZRlw-1
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
	David Woodhouse <dwmw2@infradead.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v2 08/16] hw/xen: do not use aio_set_fd_handler(is_external=true) in xen_xenstore
Date: Wed, 19 Apr 2023 13:28:09 -0400
Message-Id: <20230419172817.272758-9-stefanha@redhat.com>
In-Reply-To: <20230419172817.272758-1-stefanha@redhat.com>
References: <20230419172817.272758-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

There is no need to suspend activity between aio_disable_external() and
aio_enable_external(), which is mainly used for the block layer's drain
operation.

This is part of ongoing work to remove the aio_disable_external() API.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/i386/kvm/xen_xenstore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 900679af8a..6e81bc8791 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -133,7 +133,7 @@ static void xen_xenstore_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "Xenstore evtchn port init failed");
         return;
     }
-    aio_set_fd_handler(qemu_get_aio_context(), xen_be_evtchn_fd(s->eh), true,
+    aio_set_fd_handler(qemu_get_aio_context(), xen_be_evtchn_fd(s->eh), false,
                        xen_xenstore_event, NULL, NULL, NULL, s);
 
     s->impl = xs_impl_create(xen_domid);
-- 
2.39.2


