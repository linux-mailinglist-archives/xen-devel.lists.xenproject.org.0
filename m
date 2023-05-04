Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BEC6F74DC
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530061.825339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf1L-00040L-ST; Thu, 04 May 2023 19:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530061.825339; Thu, 04 May 2023 19:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf1L-0003zS-O8; Thu, 04 May 2023 19:53:43 +0000
Received: by outflank-mailman (input) for mailman id 530061;
 Thu, 04 May 2023 19:53:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf1K-0003xx-MF
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:53:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cb4c55b-eab5-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:53:39 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-qVm4RSmtOvC22VNK6fWUTQ-1; Thu, 04 May 2023 15:53:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50FFE101A550;
 Thu,  4 May 2023 19:53:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78E421410F29;
 Thu,  4 May 2023 19:53:32 +0000 (UTC)
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
X-Inumbo-ID: 5cb4c55b-eab5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7t7uQFODUsT7GUPKJzVAstWb4vuQdfLqZNy3S4rp+B4=;
	b=L1ntaQo24O9SYlpe8zmaJ8bo+st/9Q4rwHvj9Zrg8zQnW+ojLaaZQR/FR29jZveEx5Cilv
	QzWLdGbDJPbRHtkckNKB1ACx9X1I6FV57xGjT0oU3UCV3UF2JKazquhOytbUIQeTe1BrL6
	F3A4stphdxrZNMpMl0U1dKu65r7kWLM=
X-MC-Unique: qVm4RSmtOvC22VNK6fWUTQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Peter Lieven <pl@kamp.de>,
	Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Juan Quintela <quintela@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v5 01/21] block: Fix use after free in blockdev_mark_auto_del()
Date: Thu,  4 May 2023 15:53:07 -0400
Message-Id: <20230504195327.695107-2-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

From: Kevin Wolf <kwolf@redhat.com>

job_cancel_locked() drops the job list lock temporarily and it may call
aio_poll(). We must assume that the list has changed after this call.
Also, with unlucky timing, it can end up freeing the job during
job_completed_txn_abort_locked(), making the job pointer invalid, too.

For both reasons, we can't just continue at block_job_next_locked(job).
Instead, start at the head of the list again after job_cancel_locked()
and skip those jobs that we already cancelled (or that are completing
anyway).

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230503140142.474404-1-kwolf@redhat.com>
---
 blockdev.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index d7b5c18f0a..2c1752a403 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -153,12 +153,22 @@ void blockdev_mark_auto_del(BlockBackend *blk)
 
     JOB_LOCK_GUARD();
 
-    for (job = block_job_next_locked(NULL); job;
-         job = block_job_next_locked(job)) {
-        if (block_job_has_bdrv(job, blk_bs(blk))) {
+    do {
+        job = block_job_next_locked(NULL);
+        while (job && (job->job.cancelled ||
+                       job->job.deferred_to_main_loop ||
+                       !block_job_has_bdrv(job, blk_bs(blk))))
+        {
+            job = block_job_next_locked(job);
+        }
+        if (job) {
+            /*
+             * This drops the job lock temporarily and polls, so we need to
+             * restart processing the list from the start after this.
+             */
             job_cancel_locked(&job->job, false);
         }
-    }
+    } while (job);
 
     dinfo->auto_del = 1;
 }
-- 
2.40.1


