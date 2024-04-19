Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CA78AAD5A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 13:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709006.1108300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxm6t-0002BG-Lw; Fri, 19 Apr 2024 11:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709006.1108300; Fri, 19 Apr 2024 11:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxm6t-00027v-I1; Fri, 19 Apr 2024 11:08:51 +0000
Received: by outflank-mailman (input) for mailman id 709006;
 Fri, 19 Apr 2024 11:08:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8I7=LY=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1rxm6r-0001FM-Vv
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 11:08:49 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 320ebd81-fe3d-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 13:08:48 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a557044f2ddso194696766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 04:08:48 -0700 (PDT)
Received: from 127.0.0.1localhost ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a17090655cd00b00a4739efd7cesm2082525ejp.60.2024.04.19.04.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 04:08:46 -0700 (PDT)
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
X-Inumbo-ID: 320ebd81-fe3d-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713524928; x=1714129728; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fP3T1HRg4APmOPCr1i20fy3OAFGb9fSrnxRLKsDwOU=;
        b=dl/zco0HRhXxCfHY4UGGo3p42hfzch0Upk/TLHosmE9B4Tozp4jo96slNEXjdZCs2x
         Mhzylds1tViEFQ6HTOWhAvxU+7ROVvJEhcgDC21vlgXXRL978up3dwwF2jMoRA1J6rzd
         S/iwW5kmpXjIpNrtWjoBPr7AsnQuTrKmVnchXttWOsHOYSQfcb+kiDzi8evO53rqKLu7
         FiXHn5cRMKHIbMTP0puMdpbfOAtC+UUICi2G2roWuui/d047Z2ZIrfUkLJj8ApJRo24l
         H8X8l1aqwn3FaZEmRL6dkRhGcG+CGTISxJqc0GN2sq8r9mz8mnHIcW7KohgkaYkvLs4p
         bQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524928; x=1714129728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fP3T1HRg4APmOPCr1i20fy3OAFGb9fSrnxRLKsDwOU=;
        b=HWVdrbLKOvUIPaVKeZ1FsjXTL3vf1sZzuW2P9mrIOnA5xcfTLVFaIJcHzTpBcve68e
         lEBUP6Byk251yXw3uVFt222iXpTfx52U5kqTynXbzjLkeSD9qRjJrq6DWf1bb1KQusI5
         KzNLmpxy8ugam/7BKXbkoid6sSCj2bHg5ynn+x7F44fv2Mct4Sg/DAhB5d/ST8hZrt3n
         Unjv9hEbQEd+oijI8+kOJDJZD3VotbFfUnCjBjhWEdbR0mrAfF+vBEJEOfUhj1L44Kme
         cARzwH5sl+Hz9UKmXjRfhdDX/WCTyqL7tDPhQbPfCmJzbX7fmJI5udYzuNdYCartRzHy
         0Mvw==
X-Forwarded-Encrypted: i=1; AJvYcCVPhXVeXRanv3igThDTKFPYzJo3sPLhwawlQfHXcbJxZ5Na9yMteM3zKjCCm9RyEqTp83EGc/gBc1q5Yrz2Y2KRv3dLBqXrrI7mM+BsqWA=
X-Gm-Message-State: AOJu0Yw74d24wc0h8jkSrbTny/r4hAMJVjnQhzLFMZPpuhv06IrHnMHi
	8vb00TeTP2XVzYPAEU6tKjfONvFmaGGirEJRz5OiC0c46xMxXbtBKe9uLA==
X-Google-Smtp-Source: AGHT+IFy2QsdrmLfOtT9EYc1USivrPyf0Bwi5GEdqAq0Fpn53sZdiNwWQaN42/Mf/SYmqQzPfik1yw==
X-Received: by 2002:a17:906:a206:b0:a52:2c00:9850 with SMTP id r6-20020a170906a20600b00a522c009850mr1380280ejy.59.1713524927726;
        Fri, 19 Apr 2024 04:08:47 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>,
	asml.silence@gmail.com,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH io_uring-next/net-next v2 4/4] io_uring/notif: implement notification stacking
Date: Fri, 19 Apr 2024 12:08:42 +0100
Message-ID: <bf1e7f9b72f9ecc99999fdc0d2cded5eea87fd0b.1713369317.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713369317.git.asml.silence@gmail.com>
References: <cover.1713369317.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The network stack allows only one ubuf_info per skb, and unlike
MSG_ZEROCOPY, each io_uring zerocopy send will carry a separate
ubuf_info. That means that send requests can't reuse a previosly
allocated skb and need to get one more or more of new ones. That's fine
for large sends, but otherwise it would spam the stack with lots of skbs
carrying just a little data each.

To help with that implement linking notification (i.e. an io_uring wrapper
around ubuf_info) into a list. Each is refcounted by skbs and the stack
as usual. additionally all non head entries keep a reference to the
head, which they put down when their refcount hits 0. When the head have
no more users, it'll efficiently put all notifications in a batch.

As mentioned previously about ->io_link_skb, the callback implementation
always allows to bind to an skb without a ubuf_info.

Reviewed-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/notif.c | 71 +++++++++++++++++++++++++++++++++++++++++++-----
 io_uring/notif.h |  3 ++
 2 files changed, 67 insertions(+), 7 deletions(-)

diff --git a/io_uring/notif.c b/io_uring/notif.c
index 26680176335f..d58cdc01e691 100644
--- a/io_uring/notif.c
+++ b/io_uring/notif.c
@@ -9,18 +9,28 @@
 #include "notif.h"
 #include "rsrc.h"
 
+static const struct ubuf_info_ops io_ubuf_ops;
+
 static void io_notif_tw_complete(struct io_kiocb *notif, struct io_tw_state *ts)
 {
 	struct io_notif_data *nd = io_notif_to_data(notif);
 
-	if (unlikely(nd->zc_report) && (nd->zc_copied || !nd->zc_used))
-		notif->cqe.res |= IORING_NOTIF_USAGE_ZC_COPIED;
+	do {
+		notif = cmd_to_io_kiocb(nd);
 
-	if (nd->account_pages && notif->ctx->user) {
-		__io_unaccount_mem(notif->ctx->user, nd->account_pages);
-		nd->account_pages = 0;
-	}
-	io_req_task_complete(notif, ts);
+		lockdep_assert(refcount_read(&nd->uarg.refcnt) == 0);
+
+		if (unlikely(nd->zc_report) && (nd->zc_copied || !nd->zc_used))
+			notif->cqe.res |= IORING_NOTIF_USAGE_ZC_COPIED;
+
+		if (nd->account_pages && notif->ctx->user) {
+			__io_unaccount_mem(notif->ctx->user, nd->account_pages);
+			nd->account_pages = 0;
+		}
+
+		nd = nd->next;
+		io_req_task_complete(notif, ts);
+	} while (nd);
 }
 
 void io_tx_ubuf_complete(struct sk_buff *skb, struct ubuf_info *uarg,
@@ -39,12 +49,56 @@ void io_tx_ubuf_complete(struct sk_buff *skb, struct ubuf_info *uarg,
 	if (!refcount_dec_and_test(&uarg->refcnt))
 		return;
 
+	if (nd->head != nd) {
+		io_tx_ubuf_complete(skb, &nd->head->uarg, success);
+		return;
+	}
 	notif->io_task_work.func = io_notif_tw_complete;
 	__io_req_task_work_add(notif, IOU_F_TWQ_LAZY_WAKE);
 }
 
+static int io_link_skb(struct sk_buff *skb, struct ubuf_info *uarg)
+{
+	struct io_notif_data *nd, *prev_nd;
+	struct io_kiocb *prev_notif, *notif;
+	struct ubuf_info *prev_uarg = skb_zcopy(skb);
+
+	nd = container_of(uarg, struct io_notif_data, uarg);
+	notif = cmd_to_io_kiocb(nd);
+
+	if (!prev_uarg) {
+		net_zcopy_get(&nd->uarg);
+		skb_zcopy_init(skb, &nd->uarg);
+		return 0;
+	}
+	/* handle it separately as we can't link a notif to itself */
+	if (unlikely(prev_uarg == &nd->uarg))
+		return 0;
+	/* we can't join two links together, just request a fresh skb */
+	if (unlikely(nd->head != nd || nd->next))
+		return -EEXIST;
+	/* don't mix zc providers */
+	if (unlikely(prev_uarg->ops != &io_ubuf_ops))
+		return -EEXIST;
+
+	prev_nd = container_of(prev_uarg, struct io_notif_data, uarg);
+	prev_notif = cmd_to_io_kiocb(nd);
+
+	/* make sure all noifications can be finished in the same task_work */
+	if (unlikely(notif->ctx != prev_notif->ctx ||
+		     notif->task != prev_notif->task))
+		return -EEXIST;
+
+	nd->head = prev_nd->head;
+	nd->next = prev_nd->next;
+	prev_nd->next = nd;
+	net_zcopy_get(&nd->head->uarg);
+	return 0;
+}
+
 static const struct ubuf_info_ops io_ubuf_ops = {
 	.complete = io_tx_ubuf_complete,
+	.link_skb = io_link_skb,
 };
 
 struct io_kiocb *io_alloc_notif(struct io_ring_ctx *ctx)
@@ -65,6 +119,9 @@ struct io_kiocb *io_alloc_notif(struct io_ring_ctx *ctx)
 	nd = io_notif_to_data(notif);
 	nd->zc_report = false;
 	nd->account_pages = 0;
+	nd->next = NULL;
+	nd->head = nd;
+
 	nd->uarg.flags = IO_NOTIF_UBUF_FLAGS;
 	nd->uarg.ops = &io_ubuf_ops;
 	refcount_set(&nd->uarg.refcnt, 1);
diff --git a/io_uring/notif.h b/io_uring/notif.h
index 2cf9ff6abd7a..f3589cfef4a9 100644
--- a/io_uring/notif.h
+++ b/io_uring/notif.h
@@ -14,6 +14,9 @@ struct io_notif_data {
 	struct file		*file;
 	struct ubuf_info	uarg;
 
+	struct io_notif_data	*next;
+	struct io_notif_data	*head;
+
 	unsigned		account_pages;
 	bool			zc_report;
 	bool			zc_used;
-- 
2.44.0


