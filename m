Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B35F78EE8D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 15:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593902.927079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhgP-0002Lu-Lq; Thu, 31 Aug 2023 13:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593902.927079; Thu, 31 Aug 2023 13:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhgP-0002DE-Ao; Thu, 31 Aug 2023 13:26:01 +0000
Received: by outflank-mailman (input) for mailman id 593902;
 Thu, 31 Aug 2023 13:25:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=smM9=EQ=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qbhgN-00011s-NS
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 13:25:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea679d37-4801-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 15:25:56 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-K0goxLo9PTuIfCO20uyJUA-1; Thu, 31 Aug 2023 09:25:49 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 965AA3C1712B;
 Thu, 31 Aug 2023 13:25:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC4862166B26;
 Thu, 31 Aug 2023 13:25:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B5FCB21E692A; Thu, 31 Aug 2023 15:25:46 +0200 (CEST)
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
X-Inumbo-ID: ea679d37-4801-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693488355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u/oX4/+mbh1gSgD3uh3euips5AninNQMCX8NXa1tavE=;
	b=L3RumH+wzDzJFvOcHoiAsEB2e8a5ndzxOauSIz8zHdaEFvROdWNGjl3LhS+0mt7aovcBgM
	4vcEB8oMNUn1xaph0ix3EVsGsyhRfwasfuckguRVx++tDs00EVElrw6CHOgDNrkpi8ftGc
	mad0MyMgcpW1l9fGW+ItHWA2S+rs1mo=
X-MC-Unique: K0goxLo9PTuIfCO20uyJUA-1
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
	peter.maydell@linaro.org
Subject: [PATCH 1/7] migration/rdma: Fix save_page method to fail on polling error
Date: Thu, 31 Aug 2023 15:25:40 +0200
Message-ID: <20230831132546.3525721-2-armbru@redhat.com>
In-Reply-To: <20230831132546.3525721-1-armbru@redhat.com>
References: <20230831132546.3525721-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

qemu_rdma_save_page() reports polling error with error_report(), then
succeeds anyway.  This is because the variable holding the polling
status *shadows* the variable the function returns.  The latter
remains zero.

Broken since day one, and duplicated more recently.

Fixes: 2da776db4846 (rdma: core logic)
Fixes: b390afd8c50b (migration/rdma: Fix out of order wrid)
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 migration/rdma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index ca430d319d..b2e869aced 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3281,7 +3281,8 @@ static size_t qemu_rdma_save_page(QEMUFile *f,
      */
     while (1) {
         uint64_t wr_id, wr_id_in;
-        int ret = qemu_rdma_poll(rdma, rdma->recv_cq, &wr_id_in, NULL);
+        ret = qemu_rdma_poll(rdma, rdma->recv_cq, &wr_id_in, NULL);
+
         if (ret < 0) {
             error_report("rdma migration: polling error! %d", ret);
             goto err;
@@ -3296,7 +3297,8 @@ static size_t qemu_rdma_save_page(QEMUFile *f,
 
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


