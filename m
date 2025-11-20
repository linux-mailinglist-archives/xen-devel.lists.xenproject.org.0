Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CC2C76047
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 20:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167741.1493990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMA6Q-0007yA-PS; Thu, 20 Nov 2025 19:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167741.1493990; Thu, 20 Nov 2025 19:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMA6Q-0007sK-LP; Thu, 20 Nov 2025 19:13:58 +0000
Received: by outflank-mailman (input) for mailman id 1167741;
 Thu, 20 Nov 2025 19:13:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r49+=54=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMA6P-000753-5E
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 19:13:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e725311-c645-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 20:13:55 +0100 (CET)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-QWJXJjopMraUZ211FtOGkg-1; Thu,
 20 Nov 2025 14:13:48 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6D9F619560A2; Thu, 20 Nov 2025 19:13:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B20DA1940E82; Thu, 20 Nov 2025 19:13:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4AFF521E6741; Thu, 20 Nov 2025 20:13:39 +0100 (CET)
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
X-Inumbo-ID: 0e725311-c645-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763666034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4lLXR0s+PhRAM8v+Y3wk6pvI0Xo8xxxorF5WwAF7BFI=;
	b=O6Ti5BmS8//3F6hcn9F/Syl0zGBvxbQTZhbQ0D05StDIccwlkH8ShFBPPmMVAwMfCQyEah
	7drqztM9qO9EQQPigNhYnqmKZsbg5qjZwnIJnh5u/uR74DFgci2Yt/XhvYcQoB0lRJOrhi
	N+jUOpMhvBoAVrkc37B2hJdjLuvf2eY=
X-MC-Unique: QWJXJjopMraUZ211FtOGkg-1
X-Mimecast-MFC-AGG-ID: QWJXJjopMraUZ211FtOGkg_1763666024
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com,
	pizhenwei@bytedance.com,
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
Subject: [PATCH 02/14] hw/usb: Use error_setg_file_open() for a better error message
Date: Thu, 20 Nov 2025 20:13:27 +0100
Message-ID: <20251120191339.756429-3-armbru@redhat.com>
In-Reply-To: <20251120191339.756429-1-armbru@redhat.com>
References: <20251120191339.756429-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The error message changes from

    open FILENAME failed

to

    Could not open 'FILENAME': REASON

where REASON is the value of strerror(errno).

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/usb/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 8dd2ce415e..47d42ca3c1 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -262,7 +262,7 @@ static void usb_qdev_realize(DeviceState *qdev, Error **errp)
         int fd = qemu_open_old(dev->pcap_filename,
                                O_CREAT | O_WRONLY | O_TRUNC | O_BINARY, 0666);
         if (fd < 0) {
-            error_setg(errp, "open %s failed", dev->pcap_filename);
+            error_setg_file_open(errp, errno, dev->pcap_filename);
             usb_qdev_unrealize(qdev);
             return;
         }
-- 
2.49.0


