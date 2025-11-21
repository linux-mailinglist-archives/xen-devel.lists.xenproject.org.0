Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74838C78FB2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 13:15:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168987.1494856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMQ2S-0001NN-Sl; Fri, 21 Nov 2025 12:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168987.1494856; Fri, 21 Nov 2025 12:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMQ2S-0001HN-OW; Fri, 21 Nov 2025 12:14:56 +0000
Received: by outflank-mailman (input) for mailman id 1168987;
 Fri, 21 Nov 2025 12:14:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VODq=55=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMQ2R-000110-5i
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 12:14:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae9a15c8-c6d3-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 13:14:52 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-_S2sFyzUNkyrsijPiS4IYQ-1; Fri,
 21 Nov 2025 07:14:48 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 29D471954B11; Fri, 21 Nov 2025 12:14:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.3])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 010191940E88; Fri, 21 Nov 2025 12:14:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 89C0021E6741; Fri, 21 Nov 2025 13:14:38 +0100 (CET)
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
X-Inumbo-ID: ae9a15c8-c6d3-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763727291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ntoFJE6ZYqJ4DvoW2xAiFU9EOotBPF/P3xBSz1dTmbg=;
	b=bOlYG1dXNZsSCeE6JNxyx3UPQSobJnD9LKSlFNeuKnGjUnRcNdmlnzvLhTVqDnH21+tMXb
	fcjmzsuUhetXFNBSvulc7bQdArSHrydqK4DKmv6xwCzgqk66puAnUNFbflaovsQbsohvjR
	7j63LBwekxjSa7Q1Yma8fcb73K5/Yk0=
X-MC-Unique: _S2sFyzUNkyrsijPiS4IYQ-1
X-Mimecast-MFC-AGG-ID: _S2sFyzUNkyrsijPiS4IYQ_1763727283
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com,
	zhenwei.pi@linux.dev,
	alistair.francis@wdc.com,
	stefanb@linux.vnet.ibm.com,
	kwolf@redhat.com,
	hreitz@redhat.com,
	sw@weilnetz.de,
	qemu_oss@crudebyte.com,
	groug@kaod.org,
	mst@redhat.com,
	imammedo@redhat.com,
	anisinha@redhat.com,
	kraxel@redhat.com,
	shentey@gmail.com,
	npiggin@gmail.com,
	harshpb@linux.ibm.com,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@gmail.com,
	elena.ufimtseva@oracle.com,
	jag.raman@oracle.com,
	sgarzare@redhat.com,
	pbonzini@redhat.com,
	fam@euphon.net,
	philmd@linaro.org,
	alex@shazbot.org,
	clg@redhat.com,
	peterx@redhat.com,
	farosas@suse.de,
	lizhijian@fujitsu.com,
	dave@treblig.org,
	jasowang@redhat.com,
	samuel.thibault@ens-lyon.org,
	michael.roth@amd.com,
	kkostiuk@redhat.com,
	zhao1.liu@intel.com,
	mtosatti@redhat.com,
	rathc@linux.ibm.com,
	palmer@dabbelt.com,
	liwei1518@gmail.com,
	dbarboza@ventanamicro.com,
	zhiwei_liu@linux.alibaba.com,
	marcandre.lureau@redhat.com,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 02/15] hw/usb: Convert to qemu_create() for a better error message
Date: Fri, 21 Nov 2025 13:14:25 +0100
Message-ID: <20251121121438.1249498-3-armbru@redhat.com>
In-Reply-To: <20251121121438.1249498-1-armbru@redhat.com>
References: <20251121121438.1249498-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The error message changes from

    open FILENAME failed

to

    Could not create 'FILENAME': REASON

where REASON is the value of strerror(errno).

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/usb/bus.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 8dd2ce415e..714e33989f 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -259,10 +259,9 @@ static void usb_qdev_realize(DeviceState *qdev, Error **errp)
     }
 
     if (dev->pcap_filename) {
-        int fd = qemu_open_old(dev->pcap_filename,
-                               O_CREAT | O_WRONLY | O_TRUNC | O_BINARY, 0666);
+        int fd = qemu_create(dev->pcap_filename,
+                             O_WRONLY | O_TRUNC | O_BINARY, 0666, errp);
         if (fd < 0) {
-            error_setg(errp, "open %s failed", dev->pcap_filename);
             usb_qdev_unrealize(qdev);
             return;
         }
-- 
2.49.0


