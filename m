Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA96E6E9303
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524143.814858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSch-00054m-DV; Thu, 20 Apr 2023 11:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524143.814858; Thu, 20 Apr 2023 11:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSch-000500-5T; Thu, 20 Apr 2023 11:38:47 +0000
Received: by outflank-mailman (input) for mailman id 524143;
 Thu, 20 Apr 2023 11:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onos=AL=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppScg-0001nK-59
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:38:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e76816f6-df6f-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 13:38:44 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-FevHGkSHNviPfel5s39mPA-1; Thu, 20 Apr 2023 07:38:37 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7E978996F3;
 Thu, 20 Apr 2023 11:38:36 +0000 (UTC)
Received: from localhost (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 242C340C2064;
 Thu, 20 Apr 2023 11:38:35 +0000 (UTC)
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
X-Inumbo-ID: e76816f6-df6f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681990723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6sTqQmJRDK/JwUQj6FoYqmlPFJsGwZK9pc+TSucKp9o=;
	b=X1W3GlOs2z9YBADvE1imCa68m4ULzfoqSPlxKlz8A1Dm+c4oNlaz46A4jp/GX9B2JeMZeg
	2P59So8U5chJGviYUq7pS7zvRDcd+F4962cCU5sd220bf8Kga6zCqTFbwqWVAw+J5/dVNL
	HM9KLI7Nmbig5+K1l83RvRd6L7yht5c=
X-MC-Unique: FevHGkSHNviPfel5s39mPA-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Juan Quintela <quintela@redhat.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>,
	Fam Zheng <fam@euphon.net>,
	Julia Suvorova <jusual@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	xen-devel@lists.xenproject.org,
	Hanna Reitz <hreitz@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	eesposit@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 09/20] block: add blk_in_drain() API
Date: Thu, 20 Apr 2023 07:37:21 -0400
Message-Id: <20230420113732.336620-10-stefanha@redhat.com>
In-Reply-To: <20230420113732.336620-1-stefanha@redhat.com>
References: <20230420113732.336620-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

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


