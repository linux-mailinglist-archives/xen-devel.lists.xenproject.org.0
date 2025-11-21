Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D44C78FC0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 13:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168998.1494960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMQ2c-0003xc-I2; Fri, 21 Nov 2025 12:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168998.1494960; Fri, 21 Nov 2025 12:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMQ2b-0003jg-Lp; Fri, 21 Nov 2025 12:15:05 +0000
Received: by outflank-mailman (input) for mailman id 1168998;
 Fri, 21 Nov 2025 12:15:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VODq=55=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMQ2Y-000110-TQ
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 12:15:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1370bcc-c6d3-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 13:14:57 +0100 (CET)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-u3VMsM-2Mdm2RBLzs-9Q7g-1; Fri,
 21 Nov 2025 07:14:50 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8413619560A7; Fri, 21 Nov 2025 12:14:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.3])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D8C2F1940E8C; Fri, 21 Nov 2025 12:14:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AE01A21E65DA; Fri, 21 Nov 2025 13:14:38 +0100 (CET)
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
X-Inumbo-ID: b1370bcc-c6d3-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763727296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i91/aRc2V0WW39WS58hSriJ7oXz4L2KTH569rGq9FSU=;
	b=F/BGpC398Rwn1t0+Xhjdb97rTaznkjdj9tWOTaZZOUuaWiOkYz7MJEeMQW7eXD9qjRlvaD
	aLGiULecd+E1ZpsnQh+9luKRHhuGT2mShju7uGpSNZuiAmdS9+8M+v2dwTHUr5kXGwlwq+
	EwdDa3ucHFDYu4u9Gu1W5uAm9Qsd3og=
X-MC-Unique: u3VMsM-2Mdm2RBLzs-9Q7g-1
X-Mimecast-MFC-AGG-ID: u3VMsM-2Mdm2RBLzs-9Q7g_1763727286
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
Subject: [PATCH v2 08/15] net/tap: Use error_setg_file_open() for a better error message
Date: Fri, 21 Nov 2025 13:14:31 +0100
Message-ID: <20251121121438.1249498-9-armbru@redhat.com>
In-Reply-To: <20251121121438.1249498-1-armbru@redhat.com>
References: <20251121121438.1249498-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The error message changes from

    tap: open vhost char device failed

to

    Could not open '/dev/vhost-net': REASON

I think the exact file name is more useful to know than the file's
purpose.

We could put back the "tap: " prefix with error_prepend().  Not
worth the bother.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 net/tap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/tap.c b/net/tap.c
index abe3b2d036..bfba3fd7a7 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -747,8 +747,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
         } else {
             vhostfd = open("/dev/vhost-net", O_RDWR);
             if (vhostfd < 0) {
-                error_setg_errno(errp, errno,
-                                 "tap: open vhost char device failed");
+                error_setg_file_open(errp, errno, "/dev/vhost-net");
                 goto failed;
             }
             if (!qemu_set_blocking(vhostfd, false, errp)) {
-- 
2.49.0


