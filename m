Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5DE7056A1
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535462.833251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyzxD-0005Sl-PH; Tue, 16 May 2023 19:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535462.833251; Tue, 16 May 2023 19:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyzxD-0005Op-Kg; Tue, 16 May 2023 19:03:23 +0000
Received: by outflank-mailman (input) for mailman id 535462;
 Tue, 16 May 2023 19:03:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zzm0=BF=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pyzxC-0002eu-0X
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:03:22 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52ac32ee-f41c-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 21:03:21 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-Sy3hGnDlOKS3ECndEx5x9g-1; Tue, 16 May 2023 15:03:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D39886C60B;
 Tue, 16 May 2023 19:03:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E99052166B31;
 Tue, 16 May 2023 19:03:12 +0000 (UTC)
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
X-Inumbo-ID: 52ac32ee-f41c-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684263799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gwf7LmGZHdm26Ds5BqmQDT3iRbnDekJi1MBsLHkdcpI=;
	b=MzJ5f00dlZR8nU4qOE6WRLjCN1Q12DAyie0IVUHnJYX6EdOu1HQSdPLNy1vPPvinxTEu0V
	PxiqKTuEpTRZ8yafGGPHLO8IFi4D+RVqy+8oFD4KnmkRR0wO2V2B8CzNzcvZsTI596CB/b
	t0kbVTe+IsVj6M3c5ILAJSO/8PcdD9I=
X-MC-Unique: Sy3hGnDlOKS3ECndEx5x9g-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Coiby Xu <Coiby.Xu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	xen-devel@lists.xenproject.org,
	Kevin Wolf <kwolf@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	eesposit@redhat.com,
	Fam Zheng <fam@euphon.net>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Xie Yongji <xieyongji@bytedance.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Paul Durrant <paul@xen.org>,
	Stefan Weil <sw@weilnetz.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Lieven <pl@kamp.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v6 08/20] hw/xen: do not use aio_set_fd_handler(is_external=true) in xen_xenstore
Date: Tue, 16 May 2023 15:02:26 -0400
Message-Id: <20230516190238.8401-9-stefanha@redhat.com>
In-Reply-To: <20230516190238.8401-1-stefanha@redhat.com>
References: <20230516190238.8401-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

There is no need to suspend activity between aio_disable_external() and
aio_enable_external(), which is mainly used for the block layer's drain
operation.

This is part of ongoing work to remove the aio_disable_external() API.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
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
2.40.1


