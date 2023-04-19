Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00DE6E805A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 19:29:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523651.813971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppBbu-0004gv-K0; Wed, 19 Apr 2023 17:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523651.813971; Wed, 19 Apr 2023 17:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppBbu-0004b6-FL; Wed, 19 Apr 2023 17:28:50 +0000
Received: by outflank-mailman (input) for mailman id 523651;
 Wed, 19 Apr 2023 17:28:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu/K=AK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppBbt-0001ia-BU
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 17:28:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a47b38c0-ded7-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 19:28:48 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-_TxeHOorMreDsIuRonGL0g-1; Wed, 19 Apr 2023 13:28:43 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42CE31C189B0;
 Wed, 19 Apr 2023 17:28:42 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1BA2492C3E;
 Wed, 19 Apr 2023 17:28:41 +0000 (UTC)
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
X-Inumbo-ID: a47b38c0-ded7-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681925327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6sTqQmJRDK/JwUQj6FoYqmlPFJsGwZK9pc+TSucKp9o=;
	b=Mv8C/c4wquXxxhjQPf7nJkxAOdO8BEPQw2gqJE7arr1WGda4/uL01w6m3THBIC/eELrKCX
	aisiPPFcfWpujsDIL1eiKTkbccxC5Id0DXBYmVxoTl0V/POOQIUlxXHL7DD4nsaDm1VeUR
	5n7SB5drWtpAf3hdY1lVRdFUwD3MWwE=
X-MC-Unique: _TxeHOorMreDsIuRonGL0g-1
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
Subject: [PATCH v2 09/16] block: add blk_in_drain() API
Date: Wed, 19 Apr 2023 13:28:10 -0400
Message-Id: <20230419172817.272758-10-stefanha@redhat.com>
In-Reply-To: <20230419172817.272758-1-stefanha@redhat.com>
References: <20230419172817.272758-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

The BlockBackend quiesce_counter is greater than zero during drained
sections. Add an API to check whether the BlockBackend is in a drained
section.

The next patch will use this API.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/sysemu/block-backend-global-state.h | 1 +
 block/block-backend.c                       | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
index 2b6d27db7c..ac7cbd6b5e 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -78,6 +78,7 @@ void blk_activate(BlockBackend *blk, Error **errp);
 int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags);
 void blk_aio_cancel(BlockAIOCB *acb);
 int blk_commit_all(void);
+bool blk_in_drain(BlockBackend *blk);
 void blk_drain(BlockBackend *blk);
 void blk_drain_all(void);
 void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
diff --git a/block/block-backend.c b/block/block-backend.c
index 9e0f48692a..e0a1d9ec0f 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1270,6 +1270,13 @@ blk_check_byte_request(BlockBackend *blk, int64_t offset, int64_t bytes)
     return 0;
 }
 
+/* Are we currently in a drained section? */
+bool blk_in_drain(BlockBackend *blk)
+{
+    GLOBAL_STATE_CODE(); /* change to IO_OR_GS_CODE(), if necessary */
+    return qatomic_read(&blk->quiesce_counter);
+}
+
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 {
-- 
2.39.2


