Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC297A941F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 14:13:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606344.944202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIYd-00069Q-9J; Thu, 21 Sep 2023 12:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606344.944202; Thu, 21 Sep 2023 12:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIYd-00062P-5c; Thu, 21 Sep 2023 12:13:23 +0000
Received: by outflank-mailman (input) for mailman id 606344;
 Thu, 21 Sep 2023 12:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x4Y2=FF=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qjIYb-0005zb-DP
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 12:13:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fff6405-5878-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 14:13:20 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-5_X9raAMNZ-nWO8uzwjdzg-1; Thu, 21 Sep 2023 08:13:17 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED0F718811DB;
 Thu, 21 Sep 2023 12:13:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7751771128B;
 Thu, 21 Sep 2023 12:13:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6C8D721E6901; Thu, 21 Sep 2023 14:13:12 +0200 (CEST)
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
X-Inumbo-ID: 3fff6405-5878-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695298398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7+kvih7WUVKTB4fICaTU1GrKP7IsuBZJAWKDMqRyWBI=;
	b=dEym07gGYKpYDtyyzh3seW+tDvfzXmdCQGIjDvWG1RY0qIfE1xCaeNBskMbw0dOuCrUbx2
	+XFxXI5KjTFQOr8J8esiosnEpr8xEt4DiO8T8qwqlsBhQ7CB3ZX5E19TgSasA0Ts5xVCg9
	zfTcoNpFJAjDS6UE52VD1/O6yEluT4c=
X-MC-Unique: 5_X9raAMNZ-nWO8uzwjdzg-1
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	eblake@redhat.com,
	vsementsov@yandex-team.ru,
	jsnow@redhat.com,
	idryomov@gmail.com,
	pl@kamp.de,
	sw@weilnetz.de,
	sstabellini@kernel.org,
	anthony.perard@citrix.com,
	paul@xen.org,
	pbonzini@redhat.com,
	marcandre.lureau@redhat.com,
	berrange@redhat.com,
	thuth@redhat.com,
	philmd@linaro.org,
	stefanha@redhat.com,
	fam@euphon.net,
	quintela@redhat.com,
	peterx@redhat.com,
	leobras@redhat.com,
	kraxel@redhat.com,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org,
	Li Zhijian <lizhijian@fujitsu.com>
Subject: [PATCH v3 1/7] migration/rdma: Fix save_page method to fail on polling error
Date: Thu, 21 Sep 2023 14:13:06 +0200
Message-ID: <20230921121312.1301864-2-armbru@redhat.com>
In-Reply-To: <20230921121312.1301864-1-armbru@redhat.com>
References: <20230921121312.1301864-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

qemu_rdma_save_page() reports polling error with error_report(), then
succeeds anyway.  This is because the variable holding the polling
status *shadows* the variable the function returns.  The latter
remains zero.

Broken since day one, and duplicated more recently.

Fixes: 2da776db4846 (rdma: core logic)
Fixes: b390afd8c50b (migration/rdma: Fix out of order wrid)
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
---
 migration/rdma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index a2a3db35b1..3915d1d7c9 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3282,7 +3282,8 @@ static size_t qemu_rdma_save_page(QEMUFile *f,
      */
     while (1) {
         uint64_t wr_id, wr_id_in;
-        int ret = qemu_rdma_poll(rdma, rdma->recv_cq, &wr_id_in, NULL);
+        ret = qemu_rdma_poll(rdma, rdma->recv_cq, &wr_id_in, NULL);
+
         if (ret < 0) {
             error_report("rdma migration: polling error! %d", ret);
             goto err;
@@ -3297,7 +3298,8 @@ static size_t qemu_rdma_save_page(QEMUFile *f,
 
     while (1) {
         uint64_t wr_id, wr_id_in;
-        int ret = qemu_rdma_poll(rdma, rdma->send_cq, &wr_id_in, NULL);
+        ret = qemu_rdma_poll(rdma, rdma->send_cq, &wr_id_in, NULL);
+
         if (ret < 0) {
             error_report("rdma migration: polling error! %d", ret);
             goto err;
-- 
2.41.0


