Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B14666D5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 16:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236807.410706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msoAU-0006xm-5v; Thu, 02 Dec 2021 15:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236807.410706; Thu, 02 Dec 2021 15:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msoAU-0006vC-2W; Thu, 02 Dec 2021 15:38:42 +0000
Received: by outflank-mailman (input) for mailman id 236807;
 Thu, 02 Dec 2021 15:38:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4zFf=QT=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1msoAS-000685-Pj
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:38:40 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebb6b4e1-5385-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 16:38:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-v-fp4XIFPvO3LGCSu00CSQ-1; Thu, 02 Dec 2021 10:38:35 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D88BF93925;
 Thu,  2 Dec 2021 15:38:33 +0000 (UTC)
Received: from localhost (unknown [10.39.193.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D38A979455;
 Thu,  2 Dec 2021 15:37:37 +0000 (UTC)
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
X-Inumbo-ID: ebb6b4e1-5385-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638459519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/qrMGrCx4V1veFpfg1+YpXhPcgKpzBIeI/WEMjnuXFg=;
	b=FDwyxBtPlrOt4YJ56QWFm+M9E4AprTCL8eBxoe7PehqkeHwbKaTLYtdUZiPGbmU0vQ75rs
	NiBbKYNTWUCzc8gMilQtJKxh4qFMjX+Bfp9M5AC/YslSo3QSP99n7XRMeEHKdlQhAnMcUK
	RRanPjeCdwzdFGYgBmRc6l1zsllNno4=
X-MC-Unique: v-fp4XIFPvO3LGCSu00CSQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	qemu-block@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefan Weil <sw@weilnetz.de>,
	Fam Zheng <fam@euphon.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Peter Lieven <pl@kamp.de>
Subject: [PATCH v2 4/6] virtio-scsi: prepare virtio_scsi_handle_cmd for dataplane
Date: Thu,  2 Dec 2021 15:34:00 +0000
Message-Id: <20211202153402.604951-5-stefanha@redhat.com>
In-Reply-To: <20211202153402.604951-1-stefanha@redhat.com>
References: <20211202153402.604951-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Prepare virtio_scsi_handle_cmd() to be used by both dataplane and
non-dataplane by making the condition for starting ioeventfd more
specific. This way it won't trigger when dataplane has already been
started.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/scsi/virtio-scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 51fd09522a..34a968ecfb 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -720,7 +720,7 @@ static void virtio_scsi_handle_cmd(VirtIODevice *vdev, VirtQueue *vq)
     /* use non-QOM casts in the data path */
     VirtIOSCSI *s = (VirtIOSCSI *)vdev;
 
-    if (s->ctx) {
+    if (s->ctx && !s->dataplane_started) {
         virtio_device_start_ioeventfd(vdev);
         if (!s->dataplane_fenced) {
             return;
-- 
2.33.1


