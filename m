Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 610617FE08B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 20:56:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644190.1004970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Qfi-0003z5-OB; Wed, 29 Nov 2023 19:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644190.1004970; Wed, 29 Nov 2023 19:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Qfi-0003u4-Ds; Wed, 29 Nov 2023 19:56:34 +0000
Received: by outflank-mailman (input) for mailman id 644190;
 Wed, 29 Nov 2023 19:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7nN=HK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r8Qfg-0000tx-VY
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 19:56:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6357e65d-8ef1-11ee-9b0f-b553b5be7939;
 Wed, 29 Nov 2023 20:56:31 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-YQHcEqJ8MoSrPDOZze2dXg-1; Wed,
 29 Nov 2023 14:56:28 -0500
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94C14381A90E;
 Wed, 29 Nov 2023 19:56:27 +0000 (UTC)
Received: from localhost (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEF7B492BE0;
 Wed, 29 Nov 2023 19:56:26 +0000 (UTC)
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
X-Inumbo-ID: 6357e65d-8ef1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701287789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=huM4CwyuFE14O20iKZjfHtDOU9jky102zE6IbKmjBhQ=;
	b=BCWA+zz4s288wCKPfJMCWGotA3RJ0bWR0HZ7r14gncfkyl7V5vfgCehbcD/OKIRcycmtfJ
	2jjvY/LY0MLAuwf+2A2b8xWLxVFbUvP59OjRy2XY8FyYVbfA94o+70AG7W7K95QWu4cLNx
	4GNFkDoBeHEzmosfqn05D/Jm7COY5TA=
X-MC-Unique: YQHcEqJ8MoSrPDOZze2dXg-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alberto Garcia <berto@igalia.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Wen Congyang <wencongyang2@huawei.com>,
	<qemu-block@nongnu.org>,
	xen-devel@lists.xenproject.org,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Ari Sundholm <ari@tuxera.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Cleber Rosa <crosa@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Zhang Chen <chen.zhang@intel.com>,
	Peter Xu <peterx@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Leonardo Bras <leobras@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Fam Zheng <fam@euphon.net>,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 10/12] scsi: remove outdated AioContext lock comment
Date: Wed, 29 Nov 2023 14:55:51 -0500
Message-ID: <20231129195553.942921-11-stefanha@redhat.com>
In-Reply-To: <20231129195553.942921-1-stefanha@redhat.com>
References: <20231129195553.942921-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

The SCSI subsystem no longer uses the AioContext lock. Request
processing runs exclusively in the BlockBackend's AioContext since
"scsi: only access SCSIDevice->requests from one thread" and hence the
lock is unnecessary.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/scsi/scsi-disk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index f1bd5f5c6e..ef0d21d737 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -351,7 +351,6 @@ done:
     scsi_req_unref(&r->req);
 }
 
-/* Called with AioContext lock held */
 static void scsi_dma_complete(void *opaque, int ret)
 {
     SCSIDiskReq *r = (SCSIDiskReq *)opaque;
-- 
2.42.0


