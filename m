Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD2E805D52
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 19:27:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648216.1012403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa8L-0001ws-WE; Tue, 05 Dec 2023 18:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648216.1012403; Tue, 05 Dec 2023 18:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa8L-0001uF-Su; Tue, 05 Dec 2023 18:27:01 +0000
Received: by outflank-mailman (input) for mailman id 648216;
 Tue, 05 Dec 2023 18:27:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6T2=HQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAa2Y-0002fT-B3
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 18:21:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ae3812e-939b-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 19:21:01 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-9IK1xsJfM6qlc9VTvpSUpA-1; Tue, 05 Dec 2023 13:20:51 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3C0E185A786;
 Tue,  5 Dec 2023 18:20:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 160AC2166B31;
 Tue,  5 Dec 2023 18:20:49 +0000 (UTC)
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
X-Inumbo-ID: 0ae3812e-939b-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701800460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epSHBjIPGBGGtE9Q/MgkR6IvNKquBK1BoKNfsiriADs=;
	b=YJXQdlvDQwtIGFu40OEoeusfDnbE+B+07dDJ4H11TXy5hKJV3qwCnzNl7OFYU+Br/MwnRQ
	SQQWIQR+QOh6Uaz149GoapEkyQUwuYdbiqgZN1Aaf7qo6g7KkC5DIafHrp3r8vgO4QfqIM
	R0uZcqaZdp2Owprn4i7wq1qkO1ZQHAI=
X-MC-Unique: 9IK1xsJfM6qlc9VTvpSUpA-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Cleber Rosa <crosa@redhat.com>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Ari Sundholm <ari@tuxera.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Wen Congyang <wencongyang2@huawei.com>,
	Alberto Garcia <berto@igalia.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Fabiano Rosas <farosas@suse.de>,
	Hanna Reitz <hreitz@redhat.com>,
	Zhang Chen <chen.zhang@intel.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Peter Xu <peterx@redhat.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Leonardo Bras <leobras@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 13/14] job: remove outdated AioContext locking comments
Date: Tue,  5 Dec 2023 13:20:10 -0500
Message-ID: <20231205182011.1976568-14-stefanha@redhat.com>
In-Reply-To: <20231205182011.1976568-1-stefanha@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

The AioContext lock no longer exists.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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
2.43.0


