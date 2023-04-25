Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4276EE69C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 19:28:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526183.817784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMSB-0000nl-Sz; Tue, 25 Apr 2023 17:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526183.817784; Tue, 25 Apr 2023 17:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMSB-0000ib-M6; Tue, 25 Apr 2023 17:27:47 +0000
Received: by outflank-mailman (input) for mailman id 526183;
 Tue, 25 Apr 2023 17:27:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Bb6=AQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1prMSA-0006fQ-Ca
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 17:27:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d5eb1e2-e38e-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 19:27:45 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-brbwTRKSPLCfpDHZ0sB8ug-1; Tue, 25 Apr 2023 13:27:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E4D928082A8;
 Tue, 25 Apr 2023 17:27:40 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2173440C6E68;
 Tue, 25 Apr 2023 17:27:39 +0000 (UTC)
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
X-Inumbo-ID: 7d5eb1e2-e38e-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682443664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MVghegvQVUaizZCyEWjUSp2wGJFPOHKrCrNbSIUao8c=;
	b=Em/IX24eFFiHfbpx3PDpc2L6jENkaI4OWdNKG28Zks0D/3vIctydnxZ6eAUvNLbIi4Fui8
	ZSleEp5JvBSOxG+CN3ftVtvTBaxbbKxmwSaIifYeWvY7C4uT9jQ14aXH6xL0aSiPGoPYqp
	1B8STAZAQOSXE2RZwOMeiqspiP4vDw4=
X-MC-Unique: brbwTRKSPLCfpDHZ0sB8ug-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Lieven <pl@kamp.de>,
	Paul Durrant <paul@xen.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: [PATCH v4 09/20] block: add blk_in_drain() API
Date: Tue, 25 Apr 2023 13:27:05 -0400
Message-Id: <20230425172716.1033562-10-stefanha@redhat.com>
In-Reply-To: <20230425172716.1033562-1-stefanha@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

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
index ffd1d66f7d..42721a3592 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1266,6 +1266,13 @@ blk_check_byte_request(BlockBackend *blk, int64_t offset, int64_t bytes)
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


