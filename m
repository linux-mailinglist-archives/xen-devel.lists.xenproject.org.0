Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C192F1CC6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65120.115377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Dg-0003RL-42; Mon, 11 Jan 2021 17:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65120.115377; Mon, 11 Jan 2021 17:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Df-0003PG-K2; Mon, 11 Jan 2021 17:43:07 +0000
Received: by outflank-mailman (input) for mailman id 65120;
 Mon, 11 Jan 2021 17:43:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Dd-0002aB-PH
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:05 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31672194-35c2-4cb9-bee4-5186c798f705;
 Mon, 11 Jan 2021 17:42:41 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgXM3T
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:33 +0100 (CET)
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
X-Inumbo-ID: 31672194-35c2-4cb9-bee4-5186c798f705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386960;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=U+UL9DwFsxHDtqqeFeZS50OZtsBRz3n+B0nFT8PLWDc=;
	b=HVB/gm42S1xNVKVs/gdlfm32ifXDyMJQYW61yb1ab8N9UsH4vbNpMDfh6OsvOMPJMD
	7KBfwu9BPxTgH8Gc3GoW2ihZJQnz2VdT509CnGDrvaDspkYEsvayP7ekgSf7yYemOJSM
	XCSIqHgYZZuelInrksIDy/qsECj0xTPWbuXUpKsj1U9FLj9P5CEW9dIjjC2sUFj1Z2b9
	/FjepeENIDmqukD5cZZnqBaJSy06APwDQiwzwARLukmu7x4q1xqJydzqrBUN2BgTvWdJ
	a88/VZ2bq9cu8rFgvXA7Y8waqehym1nMGA70p4sCrilbJKciili+BKfEd50VA/30LGz9
	sbGw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 14/39] tools/guest: prepare to allocate arrays once
Date: Mon, 11 Jan 2021 18:41:59 +0100
Message-Id: <20210111174224.24714-15-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hotpath 'send_dirty_pages' is supposed to do just one thing: sending.
The other end 'handle_page_data' is supposed to do just receiving.

But instead both do other costly work like memory allocations and data moving.
Do the allocations once, the array sizes are a compiletime constant.
Avoid unneeded copying of data by receiving data directly into mapped guest memory.

This patch is just prepartion, subsequent changes will populate the arrays.

Once all changes are applied, migration of a busy HVM domU changes like that:

Without this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a20963b3 xen_testing):
2020-10-29 10:23:10.711+0000: xc: show_transfer_rate: 23663128 bytes + 2879563 pages in 55.324905335 sec, 203 MiB/sec: Internal error
2020-10-29 10:23:35.115+0000: xc: show_transfer_rate: 16829632 bytes + 2097552 pages in 24.401179720 sec, 335 MiB/sec: Internal error
2020-10-29 10:23:59.436+0000: xc: show_transfer_rate: 16829032 bytes + 2097478 pages in 24.319025928 sec, 336 MiB/sec: Internal error
2020-10-29 10:24:23.844+0000: xc: show_transfer_rate: 16829024 bytes + 2097477 pages in 24.406992500 sec, 335 MiB/sec: Internal error
2020-10-29 10:24:48.292+0000: xc: show_transfer_rate: 16828912 bytes + 2097463 pages in 24.446489027 sec, 335 MiB/sec: Internal error
2020-10-29 10:25:01.816+0000: xc: show_transfer_rate: 16836080 bytes + 2098356 pages in 13.447091818 sec, 609 MiB/sec: Internal error

With this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a20963b3 xen_unstable):
2020-10-28 21:26:05.074+0000: xc: show_transfer_rate: 23663128 bytes + 2879563 pages in 52.564054368 sec, 213 MiB/sec: Internal error
2020-10-28 21:26:23.527+0000: xc: show_transfer_rate: 16830040 bytes + 2097603 pages in 18.450592015 sec, 444 MiB/sec: Internal error
2020-10-28 21:26:41.926+0000: xc: show_transfer_rate: 16830944 bytes + 2097717 pages in 18.397862306 sec, 445 MiB/sec: Internal error
2020-10-28 21:27:00.339+0000: xc: show_transfer_rate: 16829176 bytes + 2097498 pages in 18.411973339 sec, 445 MiB/sec: Internal error
2020-10-28 21:27:18.643+0000: xc: show_transfer_rate: 16828592 bytes + 2097425 pages in 18.303326695 sec, 447 MiB/sec: Internal error
2020-10-28 21:27:26.289+0000: xc: show_transfer_rate: 16835952 bytes + 2098342 pages in 7.579846749 sec, 1081 MiB/sec: Internal error

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  | 8 ++++++++
 tools/libs/guest/xg_sr_restore.c | 8 ++++++++
 tools/libs/guest/xg_sr_save.c    | 4 +++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index f3a7a29298..62bc87b5f4 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -211,6 +211,12 @@ static inline int update_blob(struct xc_sr_blob *blob,
     return 0;
 }
 
+struct xc_sr_save_arrays {
+};
+
+struct xc_sr_restore_arrays {
+};
+
 struct xc_sr_context
 {
     xc_interface *xch;
@@ -248,6 +254,7 @@ struct xc_sr_context
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
+            struct xc_sr_save_arrays *m;
         } save;
 
         struct /* Restore data. */
@@ -299,6 +306,7 @@ struct xc_sr_context
 
             /* Sender has invoked verify mode on the stream. */
             bool verify;
+            struct xc_sr_restore_arrays *m;
         } restore;
     };
 
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 0332ae9f32..4a9ece9681 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -739,6 +739,13 @@ static int setup(struct xc_sr_context *ctx)
     }
     ctx->restore.allocated_rec_num = DEFAULT_BUF_RECORDS;
 
+    ctx->restore.m = malloc(sizeof(*ctx->restore.m));
+    if ( !ctx->restore.m ) {
+        ERROR("Unable to allocate memory for arrays");
+        rc = -1;
+        goto err;
+    }
+
  err:
     return rc;
 }
@@ -757,6 +764,7 @@ static void cleanup(struct xc_sr_context *ctx)
         xc_hypercall_buffer_free_pages(
             xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->restore.p2m_size)));
 
+    free(ctx->restore.m);
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index da031fcfce..baaeb12762 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -853,8 +853,9 @@ static int setup(struct xc_sr_context *ctx)
     ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
                                   sizeof(*ctx->save.batch_pfns));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
+    ctx->save.m = malloc(sizeof(*ctx->save.m));
 
-    if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !ctx->save.m || !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
     {
         ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
               " deferred pages");
@@ -886,6 +887,7 @@ static void cleanup(struct xc_sr_context *ctx)
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
     free(ctx->save.batch_pfns);
+    free(ctx->save.m);
 }
 
 /*

