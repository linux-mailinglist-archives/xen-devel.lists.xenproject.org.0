Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D43E58F8CB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 10:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383710.619615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3CD-0005xn-Mw; Thu, 11 Aug 2022 08:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383710.619615; Thu, 11 Aug 2022 08:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3CC-0005jh-Jm; Thu, 11 Aug 2022 08:05:36 +0000
Received: by outflank-mailman (input) for mailman id 383710;
 Wed, 10 Aug 2022 15:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIlE=YO=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1oLnzq-00016w-9S
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 15:51:50 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 586c0349-18c4-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 17:51:49 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 q1-20020a05600c040100b003a52db97fffso1193011wmb.4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 08:51:49 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.126.24.threembb.co.uk.
 [188.28.126.24]) by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b003a342933727sm3004519wmb.3.2022.08.10.08.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:51:48 -0700 (PDT)
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
X-Inumbo-ID: 586c0349-18c4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=P8aAKAj6QbUGM3qiLbxj6rCIuSDWisCzVUCts73nG7k=;
        b=iw4zMeJIq6Iduj5Ai23kLZLWv6lH2honhKvhFD/8RjX03J6CC6OT3GFZdBOkedBUdt
         n+4sEAA+jY/L/94w0veZ6+BigRGb/z+iiaiJDK2kbDqMnLkYpIKAVeEpBGeRkUhR8ZY4
         3C2zmmMBUj+haew1vR4ZvQFcsNz2n5JD1clVwf0uHdPmnBF3QMz0ffFPSnpU76csdYvx
         WghdcQ+nasGK3chHwCDoPTmwBdCerSaeh8eCSRiiRqlv5NxV5e1DoaVA1cZ7GwqNoWTR
         Iu2g0zXQ4q7bhvEbKDfbxuVUgmKMV7FWlYgxIhokbOIyG0ObnwT0cf/lwdYDKKmbRxeE
         YrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=P8aAKAj6QbUGM3qiLbxj6rCIuSDWisCzVUCts73nG7k=;
        b=GuZeUyiouTVg0qvaoa1ubwMRhZwwr1q0byzgSuSg4RZW2Qj6ctkiPBzQRI0nKaYGbJ
         dej5nyNcdEJLbMzbbmivnlgK9r01jEL9aHexV1rlMK9QA2I7ojzKQsG7wN50tNPiLUMu
         RLB+4N+X/BpRpAcgEb8iTRg8IHAPLvPuEQ/OiQclJRz+G5fVd0/fv6Kz1SpwcNWjNpTH
         Uqj16tjVNgUFAcNDzY2KXC0avuS8pz31u1nxQP3G24INXItUMt3wDF47PQgm/BRCsYJz
         nZH2zVvqh9d6n/r6DyVpJtiTv+6lh+k4bQeQz2cecvjgf4gm4ARpQNwohbBSAO/+GibQ
         xPpA==
X-Gm-Message-State: ACgBeo2AG//HtraBIRmJhNM+wqvvoXecAiAIOWEHfExxPVfs1+XSTXH1
	eaY6XadsbCqwnwC9M4EOPj+glHhCwpE=
X-Google-Smtp-Source: AA6agR51LI/17gzAJrVldihDliUyILNuNHqftq15rGqHxVJN5cbfccCeChTUV2Xc8UnWpC6KUoJk0Q==
X-Received: by 2002:a1c:f209:0:b0:3a4:f42c:9ffb with SMTP id s9-20020a1cf209000000b003a4f42c9ffbmr2964735wmc.62.1660146709173;
        Wed, 10 Aug 2022 08:51:49 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@fb.com,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [RFC net-next io_uring 09/11] io_uring/notif: add helper for flushing refs
Date: Wed, 10 Aug 2022 16:49:17 +0100
Message-Id: <a68ff48da5a52be8f64b058c30d7076fbec41beb.1660124059.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <cover.1660124059.git.asml.silence@gmail.com>
References: <cover.1660124059.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper for dropping notification references during flush. It's a
preparation patch, currently it's only one master ref, but we're going
to add ref caching.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/notif.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/io_uring/notif.c b/io_uring/notif.c
index a2ba1e35a59f..5661681b3b44 100644
--- a/io_uring/notif.c
+++ b/io_uring/notif.c
@@ -73,6 +73,13 @@ struct io_kiocb *io_alloc_notif(struct io_ring_ctx *ctx,
 	return notif;
 }
 
+static inline bool io_notif_drop_refs(struct io_notif_data *nd)
+{
+	int refs = 1;
+
+	return refcount_sub_and_test(refs, &nd->uarg.refcnt);
+}
+
 void io_notif_slot_flush(struct io_notif_slot *slot)
 	__must_hold(&ctx->uring_lock)
 {
@@ -81,8 +88,7 @@ void io_notif_slot_flush(struct io_notif_slot *slot)
 
 	slot->notif = NULL;
 
-	/* drop slot's master ref */
-	if (refcount_dec_and_test(&nd->uarg.refcnt))
+	if (io_notif_drop_refs(nd))
 		io_notif_complete(notif);
 }
 
@@ -97,13 +103,11 @@ __cold int io_notif_unregister(struct io_ring_ctx *ctx)
 	for (i = 0; i < ctx->nr_notif_slots; i++) {
 		struct io_notif_slot *slot = &ctx->notif_slots[i];
 		struct io_kiocb *notif = slot->notif;
-		struct io_notif_data *nd;
 
 		if (!notif)
 			continue;
-		nd = io_kiocb_to_cmd(notif);
 		slot->notif = NULL;
-		if (!refcount_dec_and_test(&nd->uarg.refcnt))
+		if (!io_notif_drop_refs(io_kiocb_to_cmd(notif)))
 			continue;
 		notif->io_task_work.func = __io_notif_complete_tw;
 		io_req_task_work_add(notif);
-- 
2.37.0


