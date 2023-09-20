Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AF67A8BC5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 20:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605890.943555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1zY-0000dG-Cr; Wed, 20 Sep 2023 18:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605890.943555; Wed, 20 Sep 2023 18:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1zY-0000Tq-4Q; Wed, 20 Sep 2023 18:32:04 +0000
Received: by outflank-mailman (input) for mailman id 605890;
 Wed, 20 Sep 2023 18:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wKQE=FE=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qj1zV-0007W9-Mu
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 18:32:01 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc14cb8e-57e3-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 20:32:00 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-808l8HYfOgienFfKcIOyhQ-1; Wed, 20 Sep 2023 14:31:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CF9E803499;
 Wed, 20 Sep 2023 18:31:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 640F710F1BE7;
 Wed, 20 Sep 2023 18:31:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 42D7721E690B; Wed, 20 Sep 2023 20:31:49 +0200 (CEST)
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
X-Inumbo-ID: fc14cb8e-57e3-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695234719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5HnhXslRnnQFRfuqW4Y4SlAYwtvks6K50kIclYSCcI=;
	b=eXAeWvcT4XRzVCzWScztHqouVvfBTe7WeJWmiu/hDHh6O1pNWLHJCh0qcIJdpuJwxIXlbT
	3Fc8Ip+M7BAUG8vrrBodxIIDOEQGlRCcL2G+HNj68RiRavfDmfFumdtWEXuSzIoLWynZtA
	/nd5A4qRrOVG+QLnjh1x+IlzLkF+rLM=
X-MC-Unique: 808l8HYfOgienFfKcIOyhQ-1
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
Subject: [PATCH v2 5/7] block/vdi: Clean up local variable shadowing
Date: Wed, 20 Sep 2023 20:31:47 +0200
Message-ID: <20230920183149.1105333-6-armbru@redhat.com>
In-Reply-To: <20230920183149.1105333-1-armbru@redhat.com>
References: <20230920183149.1105333-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Tracked down with -Wshadow=local.
Clean up: delete inner declarations when they are actually redundant,
else rename variables.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/vdi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/block/vdi.c b/block/vdi.c
index 6c35309e04..934e1b849b 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -634,7 +634,6 @@ vdi_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
         bmap_entry = le32_to_cpu(s->bmap[block_index]);
         if (!VDI_IS_ALLOCATED(bmap_entry)) {
             /* Allocate new block and write to it. */
-            uint64_t data_offset;
             qemu_co_rwlock_upgrade(&s->bmap_lock);
             bmap_entry = le32_to_cpu(s->bmap[block_index]);
             if (VDI_IS_ALLOCATED(bmap_entry)) {
@@ -700,7 +699,7 @@ nonallocating_write:
         /* One or more new blocks were allocated. */
         VdiHeader *header;
         uint8_t *base;
-        uint64_t offset;
+        uint64_t bmap_offset;
         uint32_t n_sectors;
 
         g_free(block);
@@ -723,11 +722,11 @@ nonallocating_write:
         bmap_first /= (SECTOR_SIZE / sizeof(uint32_t));
         bmap_last /= (SECTOR_SIZE / sizeof(uint32_t));
         n_sectors = bmap_last - bmap_first + 1;
-        offset = s->bmap_sector + bmap_first;
+        bmap_offset = s->bmap_sector + bmap_first;
         base = ((uint8_t *)&s->bmap[0]) + bmap_first * SECTOR_SIZE;
         logout("will write %u block map sectors starting from entry %u\n",
                n_sectors, bmap_first);
-        ret = bdrv_co_pwrite(bs->file, offset * SECTOR_SIZE,
+        ret = bdrv_co_pwrite(bs->file, bmap_offset * SECTOR_SIZE,
                              n_sectors * SECTOR_SIZE, base, 0);
     }
 
-- 
2.41.0


