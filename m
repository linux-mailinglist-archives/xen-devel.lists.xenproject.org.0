Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECE98AAD62
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 13:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709005.1108286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxm6r-0001jd-9M; Fri, 19 Apr 2024 11:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709005.1108286; Fri, 19 Apr 2024 11:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxm6r-0001dA-4n; Fri, 19 Apr 2024 11:08:49 +0000
Received: by outflank-mailman (input) for mailman id 709005;
 Fri, 19 Apr 2024 11:08:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8I7=LY=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1rxm6p-00017h-6l
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 11:08:47 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 311c49e2-fe3d-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 13:08:46 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a5557e3ebcaso316022266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 04:08:46 -0700 (PDT)
Received: from 127.0.0.1localhost ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a17090655cd00b00a4739efd7cesm2082525ejp.60.2024.04.19.04.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 04:08:45 -0700 (PDT)
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
X-Inumbo-ID: 311c49e2-fe3d-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713524926; x=1714129726; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vg0pL2CVxV49Fgeqn+qahTZ1Z4PbsN7awrFUvCLM+ng=;
        b=V7xo0xUDhjNiMf/OcZ257ViI87JyvzkVSJflTaiWLug+Q/7/r1tQXO5lnLf6S6+L5A
         ELoiV9umEPUyww3kHkDegPrZCdTOrFhuq4MwFtf7inS0hXHfSgT1my5UOZanS1p2BCX0
         gqWLUfPd/0gAgFt/d5YQt57u1Zg6zHaW1SIVeOKda6+7C6A/20G8adFIjq4Nn1yqCFAC
         B2FFARRPVaiC9xE9kHDolNCKvNj6ACI9Q5RzeVRGYQSrOC3Fw9JFjmeNp6K0f4p6YsIS
         cQ4+/2ElypZn9bCQ+SzhMlOYX4egHasUHiMzu7MeYcJA4BQcWlfhkAe6R7i3koHZjlkZ
         BDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524926; x=1714129726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vg0pL2CVxV49Fgeqn+qahTZ1Z4PbsN7awrFUvCLM+ng=;
        b=xQ+Kb6+ziaGde9Xs0IfKLG7e8wEbks3+BYOe2W4qbMkOpHxpeYV4fsHsoILuX3plKo
         nnr0uUtlyqMqXYSEW4X2nqQi3IwAuxPjFA+aI4brve0ubfstOs7tIYWcvMI4H86bqUqc
         dzLrTm+5X2apverA1mSS9L1/sGolDnxJfdofyvcpDSmSKiF5ZFMzfiWnnwhbIF1DOoID
         UDBB8BvGOLArjq15MkHj6E4chisZLkVWcpM4z2JMGUOVwmrMiwkVyaYSy0czHisGU1G4
         IzdSnmuM4ZbToYvZFPhtx3LU1K9nklD4kQGw7Q8RjJP+19XlpXex28Cvtqb159sW1gU1
         tmpA==
X-Forwarded-Encrypted: i=1; AJvYcCWKyaL9etwrLDPDtbZwzROWhaOKQIvuLOHPajMkBB3S1Hu01ooKQWQ4eB6TGamRIuJor69KIy+OStmRe/2aFHuEekGEhRHyLwwP6vMDHlo=
X-Gm-Message-State: AOJu0YyKvPftJE8SwZip85x0QV5NCW2K/fIyewGSXzfDeJAqUci6bOsi
	SjjvR4oLXVaFMT+ZoQCG/MTFXCjDUVaFFdmxnZ0l5nFqloGyd/t7
X-Google-Smtp-Source: AGHT+IGlNNpKG3wGDzOQc1RYm8RL9LY87wF61Oxy7BMYiyIn9QMexWxwwOK9pfN0OrWYDJl4d93LDw==
X-Received: by 2002:a17:907:7215:b0:a55:75f7:42fb with SMTP id dr21-20020a170907721500b00a5575f742fbmr4895587ejc.24.1713524926172;
        Fri, 19 Apr 2024 04:08:46 -0700 (PDT)
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
Subject: [PATCH io_uring-next/net-next v2 3/4] io_uring/notif: simplify io_notif_flush()
Date: Fri, 19 Apr 2024 12:08:41 +0100
Message-ID: <19e41652c16718b946a5c80d2ad409df7682e47e.1713369317.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713369317.git.asml.silence@gmail.com>
References: <cover.1713369317.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_notif_flush() is partially duplicating io_tx_ubuf_complete(), so
instead of duplicating it, make the flush call io_tx_ubuf_complete.

Reviewed-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/notif.c | 6 +++---
 io_uring/notif.h | 9 +++------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/io_uring/notif.c b/io_uring/notif.c
index 53532d78a947..26680176335f 100644
--- a/io_uring/notif.c
+++ b/io_uring/notif.c
@@ -9,7 +9,7 @@
 #include "notif.h"
 #include "rsrc.h"
 
-void io_notif_tw_complete(struct io_kiocb *notif, struct io_tw_state *ts)
+static void io_notif_tw_complete(struct io_kiocb *notif, struct io_tw_state *ts)
 {
 	struct io_notif_data *nd = io_notif_to_data(notif);
 
@@ -23,8 +23,8 @@ void io_notif_tw_complete(struct io_kiocb *notif, struct io_tw_state *ts)
 	io_req_task_complete(notif, ts);
 }
 
-static void io_tx_ubuf_complete(struct sk_buff *skb, struct ubuf_info *uarg,
-				bool success)
+void io_tx_ubuf_complete(struct sk_buff *skb, struct ubuf_info *uarg,
+			 bool success)
 {
 	struct io_notif_data *nd = container_of(uarg, struct io_notif_data, uarg);
 	struct io_kiocb *notif = cmd_to_io_kiocb(nd);
diff --git a/io_uring/notif.h b/io_uring/notif.h
index 2e25a2fc77d1..2cf9ff6abd7a 100644
--- a/io_uring/notif.h
+++ b/io_uring/notif.h
@@ -21,7 +21,8 @@ struct io_notif_data {
 };
 
 struct io_kiocb *io_alloc_notif(struct io_ring_ctx *ctx);
-void io_notif_tw_complete(struct io_kiocb *notif, struct io_tw_state *ts);
+void io_tx_ubuf_complete(struct sk_buff *skb, struct ubuf_info *uarg,
+			 bool success);
 
 static inline struct io_notif_data *io_notif_to_data(struct io_kiocb *notif)
 {
@@ -33,11 +34,7 @@ static inline void io_notif_flush(struct io_kiocb *notif)
 {
 	struct io_notif_data *nd = io_notif_to_data(notif);
 
-	/* drop slot's master ref */
-	if (refcount_dec_and_test(&nd->uarg.refcnt)) {
-		notif->io_task_work.func = io_notif_tw_complete;
-		__io_req_task_work_add(notif, IOU_F_TWQ_LAZY_WAKE);
-	}
+	io_tx_ubuf_complete(NULL, &nd->uarg, true);
 }
 
 static inline int io_notif_account_mem(struct io_kiocb *notif, unsigned len)
-- 
2.44.0


