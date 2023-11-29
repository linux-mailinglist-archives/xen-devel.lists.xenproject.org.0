Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 573607FE0EB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 21:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644221.1004994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8R3q-0006Gb-Ic; Wed, 29 Nov 2023 20:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644221.1004994; Wed, 29 Nov 2023 20:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8R3q-0006FK-Ez; Wed, 29 Nov 2023 20:21:30 +0000
Received: by outflank-mailman (input) for mailman id 644221;
 Wed, 29 Nov 2023 20:21:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7nN=HK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r8Qfm-0000tx-M3
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 19:56:38 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67142359-8ef1-11ee-9b0f-b553b5be7939;
 Wed, 29 Nov 2023 20:56:37 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-wzqmuO4bOQ6Hmrn3niRbLQ-1; Wed, 29 Nov 2023 14:56:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AFAE805143;
 Wed, 29 Nov 2023 19:56:30 +0000 (UTC)
Received: from localhost (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B3A01121308;
 Wed, 29 Nov 2023 19:56:29 +0000 (UTC)
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
X-Inumbo-ID: 67142359-8ef1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701287796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=83h9xdcT8cxTipojEBiD6nbiYOvpd9inCN42JPs/T+c=;
	b=C4pElkROh3xSpBig4iTpwCo6SogR1sQ8RQp31Ax/tW6R4+GUSArlhuSHAbfFBhbC71NDWf
	UKUb+TD01UL0zJTGLjELItBqs8eiaE6/0kQGNiMzRqCfIvYg/6aHKTAPr7x4m5u6ARJlVi
	zuc3qcAn7s1qSU0to7Q14nDEB29lu10=
X-MC-Unique: wzqmuO4bOQ6Hmrn3niRbLQ-1
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
Subject: [PATCH 11/12] job: remove outdated AioContext locking comments
Date: Wed, 29 Nov 2023 14:55:52 -0500
Message-ID: <20231129195553.942921-12-stefanha@redhat.com>
In-Reply-To: <20231129195553.942921-1-stefanha@redhat.com>
References: <20231129195553.942921-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

The AioContext lock no longer exists.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/job.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index e502787dd8..9ea98b5927 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -67,8 +67,6 @@ typedef struct Job {
 
     /**
      * The completion function that will be called when the job completes.
-     * Called with AioContext lock held, since many callback implementations
-     * use bdrv_* functions that require to hold the lock.
      */
     BlockCompletionFunc *cb;
 
@@ -264,9 +262,6 @@ struct JobDriver {
      *
      * This callback will not be invoked if the job has already failed.
      * If it fails, abort and then clean will be called.
-     *
-     * Called with AioContext lock held, since many callbacs implementations
-     * use bdrv_* functions that require to hold the lock.
      */
     int (*prepare)(Job *job);
 
@@ -277,9 +272,6 @@ struct JobDriver {
      *
      * All jobs will complete with a call to either .commit() or .abort() but
      * never both.
-     *
-     * Called with AioContext lock held, since many callback implementations
-     * use bdrv_* functions that require to hold the lock.
      */
     void (*commit)(Job *job);
 
@@ -290,9 +282,6 @@ struct JobDriver {
      *
      * All jobs will complete with a call to either .commit() or .abort() but
      * never both.
-     *
-     * Called with AioContext lock held, since many callback implementations
-     * use bdrv_* functions that require to hold the lock.
      */
     void (*abort)(Job *job);
 
@@ -301,9 +290,6 @@ struct JobDriver {
      * .commit() or .abort(). Regardless of which callback is invoked after
      * completion, .clean() will always be called, even if the job does not
      * belong to a transaction group.
-     *
-     * Called with AioContext lock held, since many callbacs implementations
-     * use bdrv_* functions that require to hold the lock.
      */
     void (*clean)(Job *job);
 
@@ -318,17 +304,12 @@ struct JobDriver {
      * READY).
      * (If the callback is NULL, the job is assumed to terminate
      * without I/O.)
-     *
-     * Called with AioContext lock held, since many callback implementations
-     * use bdrv_* functions that require to hold the lock.
      */
     bool (*cancel)(Job *job, bool force);
 
 
     /**
      * Called when the job is freed.
-     * Called with AioContext lock held, since many callback implementations
-     * use bdrv_* functions that require to hold the lock.
      */
     void (*free)(Job *job);
 };
@@ -424,7 +405,6 @@ void job_ref_locked(Job *job);
  * Release a reference that was previously acquired with job_ref_locked() or
  * job_create(). If it's the last reference to the object, it will be freed.
  *
- * Takes AioContext lock internally to invoke a job->driver callback.
  * Called with job lock held.
  */
 void job_unref_locked(Job *job);
-- 
2.42.0


