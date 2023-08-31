Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8578EE88
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 15:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593900.927073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhgP-0002D0-4G; Thu, 31 Aug 2023 13:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593900.927073; Thu, 31 Aug 2023 13:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhgO-00025s-U0; Thu, 31 Aug 2023 13:26:00 +0000
Received: by outflank-mailman (input) for mailman id 593900;
 Thu, 31 Aug 2023 13:25:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=smM9=EQ=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qbhgM-00011s-NN
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 13:25:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9e4fe40-4801-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 15:25:56 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-w2HM_ChROIqrK6gfwSLG-w-1; Thu, 31 Aug 2023 09:25:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B688381495D;
 Thu, 31 Aug 2023 13:25:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 782302166B26;
 Thu, 31 Aug 2023 13:25:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C204421E6767; Thu, 31 Aug 2023 15:25:46 +0200 (CEST)
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
X-Inumbo-ID: e9e4fe40-4801-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693488354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BWO795P/eMAN6AGzPBk5U+AjkPgnakPkjKcQ1JjiguM=;
	b=AS/R9xNAsGXSqWxj5PJ8yi4M760J6PWDTaB1iH51gKVoNPx/n80DQBDYNnhMPy6fsVgJ7z
	7phzuj6oQPxAfW/UO8b9mIDpgNS1uK6bk0xbQb9oEZ8q6cG8B3AIywWhFhU7iGMZFwRNZQ
	mbNdpY/kIsVZCz92OeJUf4d/xXmJdog=
X-MC-Unique: w2HM_ChROIqrK6gfwSLG-w-1
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
Subject: [PATCH 5/7] block/vdi: Clean up local variable shadowing
Date: Thu, 31 Aug 2023 15:25:44 +0200
Message-ID: <20230831132546.3525721-6-armbru@redhat.com>
In-Reply-To: <20230831132546.3525721-1-armbru@redhat.com>
References: <20230831132546.3525721-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Tracked down with -Wshadow=local.
Clean up: delete inner declarations when they are actually redundant,
else rename variables.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/vdi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/block/vdi.c b/block/vdi.c
index 6c35309e04..c084105b78 100644
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
+        uint64_t offs;
         uint32_t n_sectors;
 
         g_free(block);
@@ -723,11 +722,11 @@ nonallocating_write:
         bmap_first /= (SECTOR_SIZE / sizeof(uint32_t));
         bmap_last /= (SECTOR_SIZE / sizeof(uint32_t));
         n_sectors = bmap_last - bmap_first + 1;
-        offset = s->bmap_sector + bmap_first;
+        offs = s->bmap_sector + bmap_first;
         base = ((uint8_t *)&s->bmap[0]) + bmap_first * SECTOR_SIZE;
         logout("will write %u block map sectors starting from entry %u\n",
                n_sectors, bmap_first);
-        ret = bdrv_co_pwrite(bs->file, offset * SECTOR_SIZE,
+        ret = bdrv_co_pwrite(bs->file, offs * SECTOR_SIZE,
                              n_sectors * SECTOR_SIZE, base, 0);
     }
 
-- 
2.41.0


