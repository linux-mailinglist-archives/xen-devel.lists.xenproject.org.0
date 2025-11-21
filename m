Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221D1C78FAB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 13:15:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168985.1494840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMQ2R-00012x-Bv; Fri, 21 Nov 2025 12:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168985.1494840; Fri, 21 Nov 2025 12:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMQ2R-000112-8P; Fri, 21 Nov 2025 12:14:55 +0000
Received: by outflank-mailman (input) for mailman id 1168985;
 Fri, 21 Nov 2025 12:14:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VODq=55=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMQ2Q-00010q-2r
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 12:14:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae36e037-c6d3-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 13:14:52 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-362-mFYJ-q5wMPuQuTz0rIqCBA-1; Fri,
 21 Nov 2025 07:14:49 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 701F51800358; Fri, 21 Nov 2025 12:14:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.3])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E68AA30044DB; Fri, 21 Nov 2025 12:14:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F86121E66EF; Fri, 21 Nov 2025 13:14:38 +0100 (CET)
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
X-Inumbo-ID: ae36e037-c6d3-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763727290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jN2hNANWVWTCu1f5WR+vOsR5aIOIA2pYSQMMfmQp7wI=;
	b=S3sIXXSiK5/HjntMTBeBJ+TsMJoylG2F+7r/BVID6pVtOyj/sqKTN2qEZwAvMl0VU9yusd
	iwOqT6fcvZ+zsMt9mXR6XW0Pevuf+XUhw7c8crj+Bnj/3t45N74QtL4c4fLq8BKvREVBdU
	OqQWq2yOw987DdROfL+V4WtKJZDIj3g=
X-MC-Unique: mFYJ-q5wMPuQuTz0rIqCBA-1
X-Mimecast-MFC-AGG-ID: mFYJ-q5wMPuQuTz0rIqCBA_1763727284
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
Subject: [PATCH v2 03/15] ui: Convert to qemu_create() for simplicity and consistency
Date: Fri, 21 Nov 2025 13:14:26 +0100
Message-ID: <20251121121438.1249498-4-armbru@redhat.com>
In-Reply-To: <20251121121438.1249498-1-armbru@redhat.com>
References: <20251121121438.1249498-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The error message changes from

    failed to open file 'FILENAME': REASON

to

    Could not create 'FILENAME': REASON

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 ui/ui-qmp-cmds.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/ui/ui-qmp-cmds.c b/ui/ui-qmp-cmds.c
index 74fa6c6ec5..b49b636152 100644
--- a/ui/ui-qmp-cmds.c
+++ b/ui/ui-qmp-cmds.c
@@ -369,10 +369,8 @@ qmp_screendump(const char *filename, const char *device,
     }
     image = pixman_image_ref(surface->image);
 
-    fd = qemu_open_old(filename, O_WRONLY | O_CREAT | O_TRUNC | O_BINARY, 0666);
+    fd = qemu_create(filename, O_WRONLY | O_TRUNC | O_BINARY, 0666, errp);
     if (fd == -1) {
-        error_setg(errp, "failed to open file '%s': %s", filename,
-                   strerror(errno));
         return;
     }
 
-- 
2.49.0


