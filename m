Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E498AAD60
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 13:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709003.1108271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxm6p-0001PN-Ml; Fri, 19 Apr 2024 11:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709003.1108271; Fri, 19 Apr 2024 11:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxm6p-0001MR-JN; Fri, 19 Apr 2024 11:08:47 +0000
Received: by outflank-mailman (input) for mailman id 709003;
 Fri, 19 Apr 2024 11:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8I7=LY=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1rxm6n-0001FM-W4
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 11:08:46 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f45bbf5-fe3d-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 13:08:43 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a556d22fa93so225792066b.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 04:08:43 -0700 (PDT)
Received: from 127.0.0.1localhost ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a17090655cd00b00a4739efd7cesm2082525ejp.60.2024.04.19.04.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 04:08:42 -0700 (PDT)
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
X-Inumbo-ID: 2f45bbf5-fe3d-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713524923; x=1714129723; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOjfjLTpACX+ktm4SIjFbQPdNROuvyJVkhcWINyu6zc=;
        b=cMy9SvNz1hfLnoxKHKDlazg+EC1shJ4AVwhKC/YkIuHES7D4hFx1kz9fvmbsykqzSx
         NgnpLnFtAMDL8lXalUL3SlpE4Dn/qfF0Zwpyr4O9whSxF4U2raPU03PJtTKm512i4yb8
         fWHVI40f59NvX6f6TsvCMeoit/1B8WFMFWRUEl/up63SKl/70aIkyhb8fbKEfTaCoGP3
         OpGeJu+NWkNFqPLY0IVJLwaccXMEuYM4n5dPor5Ov7jXRDSokWHWrXhcTEJXZIQMj0TS
         lXZwXI3+guxDyn9GTEUtaSRCHNB1GRlK1cTkocZ719bnYDMjPQrrkgp8GEZRW6kcnBSH
         x4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524923; x=1714129723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOjfjLTpACX+ktm4SIjFbQPdNROuvyJVkhcWINyu6zc=;
        b=NQVKsjO+aYXBP+HxAKRnfQdfXp2yIE/AJPhtdgqCSO7JgRoLDL0qu68Kh2+3kdcya9
         mij3tXftB++bOy1A7gEtPrV3OnVrvS8fG84zsC8doKKsKR0NE+4IwjeOXnMXKrOhvxxJ
         ZywzAjwWfHNiqBCBWTtHxzXctfpeDpJlnGzoOwAghbgntQAI32LosBkwzwe0ngn7vL9Z
         KLclh/qkn8m511Mj5G/JaE0Qv5/n2bL0HglaFYnSnkDD4WOLoqC/Z05XdXngNraalMSf
         /6+z5z6PgoqnqaGtlBLc8+rqH50WPU8Ju8SvlOyqci7z921s2K7lvtxznPlfLhgPGDXz
         v/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyyMSJjXAv8fQ/J4Ieh7FNL01girGRXJL12nVpCzGiBJb/Hj05FTHMPWBb1k+VBaidc65g+eGmxyXDE5t37EBJ7nFaLpov0/H/C43rtWU=
X-Gm-Message-State: AOJu0YwBDXQtb3WmDVQe2WzVFRivS4D2dPGXnhJk9O60oOczkZEPpDtI
	tTt8vGeisRLIQfrMqS8bwUHsu4qkHrQXWQNvXjrtupmItch+95V7
X-Google-Smtp-Source: AGHT+IEmBOo8ZD4NY+mkF+vWNE4N/26bHcNn7qxJJxwL9/Pi2Lxd8nenGK/ka+snHuSjnwh79g+UAw==
X-Received: by 2002:a17:906:840c:b0:a55:6f32:63b2 with SMTP id n12-20020a170906840c00b00a556f3263b2mr1216223ejx.5.1713524922714;
        Fri, 19 Apr 2024 04:08:42 -0700 (PDT)
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
Subject: [PATCH io_uring-next/net-next v2 1/4] net: extend ubuf_info callback to ops structure
Date: Fri, 19 Apr 2024 12:08:39 +0100
Message-ID: <a62015541de49c0e2a8a0377a1d5d0a5aeb07016.1713369317.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713369317.git.asml.silence@gmail.com>
References: <cover.1713369317.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We'll need to associate additional callbacks with ubuf_info, introduce
a structure holding ubuf_info callbacks. Apart from a more smarter
io_uring notification management introduced in next patches, it can be
used to generalise msg_zerocopy_put_abort() and also store
->sg_from_iter, which is currently passed in struct msghdr.

Reviewed-by: Jens Axboe <axboe@kernel.dk>
Reviewed-by: David Ahern <dsahern@kernel.org>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/net/tap.c                   |  2 +-
 drivers/net/tun.c                   |  2 +-
 drivers/net/xen-netback/common.h    |  5 ++---
 drivers/net/xen-netback/interface.c |  2 +-
 drivers/net/xen-netback/netback.c   | 11 ++++++++---
 drivers/vhost/net.c                 |  8 ++++++--
 include/linux/skbuff.h              | 19 +++++++++++--------
 io_uring/notif.c                    |  8 ++++++--
 net/core/skbuff.c                   | 16 ++++++++++------
 9 files changed, 46 insertions(+), 27 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 9f0495e8df4d..bfdd3875fe86 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -754,7 +754,7 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 		skb_zcopy_init(skb, msg_control);
 	} else if (msg_control) {
 		struct ubuf_info *uarg = msg_control;
-		uarg->callback(NULL, uarg, false);
+		uarg->ops->complete(NULL, uarg, false);
 	}
 
 	dev_queue_xmit(skb);
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 0b3f21cba552..b7401d990680 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1906,7 +1906,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		skb_zcopy_init(skb, msg_control);
 	} else if (msg_control) {
 		struct ubuf_info *uarg = msg_control;
-		uarg->callback(NULL, uarg, false);
+		uarg->ops->complete(NULL, uarg, false);
 	}
 
 	skb_reset_network_header(skb);
diff --git a/drivers/net/xen-netback/common.h b/drivers/net/xen-netback/common.h
index 1fcbd83f7ff2..17421da139f2 100644
--- a/drivers/net/xen-netback/common.h
+++ b/drivers/net/xen-netback/common.h
@@ -390,9 +390,8 @@ bool xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb);
 
 void xenvif_carrier_on(struct xenvif *vif);
 
-/* Callback from stack when TX packet can be released */
-void xenvif_zerocopy_callback(struct sk_buff *skb, struct ubuf_info *ubuf,
-			      bool zerocopy_success);
+/* Callbacks from stack when TX packet can be released */
+extern const struct ubuf_info_ops xenvif_ubuf_ops;
 
 static inline pending_ring_idx_t nr_pending_reqs(struct xenvif_queue *queue)
 {
diff --git a/drivers/net/xen-netback/interface.c b/drivers/net/xen-netback/interface.c
index 7cff90aa8d24..65db5f14465f 100644
--- a/drivers/net/xen-netback/interface.c
+++ b/drivers/net/xen-netback/interface.c
@@ -593,7 +593,7 @@ int xenvif_init_queue(struct xenvif_queue *queue)
 
 	for (i = 0; i < MAX_PENDING_REQS; i++) {
 		queue->pending_tx_info[i].callback_struct = (struct ubuf_info_msgzc)
-			{ { .callback = xenvif_zerocopy_callback },
+			{ { .ops = &xenvif_ubuf_ops },
 			  { { .ctx = NULL,
 			      .desc = i } } };
 		queue->grant_tx_handle[i] = NETBACK_INVALID_HANDLE;
diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 48254fc07d64..5836995d6774 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -1157,7 +1157,7 @@ static int xenvif_handle_frag_list(struct xenvif_queue *queue, struct sk_buff *s
 	uarg = skb_shinfo(skb)->destructor_arg;
 	/* increase inflight counter to offset decrement in callback */
 	atomic_inc(&queue->inflight_packets);
-	uarg->callback(NULL, uarg, true);
+	uarg->ops->complete(NULL, uarg, true);
 	skb_shinfo(skb)->destructor_arg = NULL;
 
 	/* Fill the skb with the new (local) frags. */
@@ -1279,8 +1279,9 @@ static int xenvif_tx_submit(struct xenvif_queue *queue)
 	return work_done;
 }
 
-void xenvif_zerocopy_callback(struct sk_buff *skb, struct ubuf_info *ubuf_base,
-			      bool zerocopy_success)
+static void xenvif_zerocopy_callback(struct sk_buff *skb,
+				     struct ubuf_info *ubuf_base,
+				     bool zerocopy_success)
 {
 	unsigned long flags;
 	pending_ring_idx_t index;
@@ -1313,6 +1314,10 @@ void xenvif_zerocopy_callback(struct sk_buff *skb, struct ubuf_info *ubuf_base,
 	xenvif_skb_zerocopy_complete(queue);
 }
 
+const struct ubuf_info_ops xenvif_ubuf_ops = {
+	.complete = xenvif_zerocopy_callback,
+};
+
 static inline void xenvif_tx_dealloc_action(struct xenvif_queue *queue)
 {
 	struct gnttab_unmap_grant_ref *gop;
diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index c64ded183f8d..f16279351db5 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -380,7 +380,7 @@ static void vhost_zerocopy_signal_used(struct vhost_net *net,
 	}
 }
 
-static void vhost_zerocopy_callback(struct sk_buff *skb,
+static void vhost_zerocopy_complete(struct sk_buff *skb,
 				    struct ubuf_info *ubuf_base, bool success)
 {
 	struct ubuf_info_msgzc *ubuf = uarg_to_msgzc(ubuf_base);
@@ -408,6 +408,10 @@ static void vhost_zerocopy_callback(struct sk_buff *skb,
 	rcu_read_unlock_bh();
 }
 
+static const struct ubuf_info_ops vhost_ubuf_ops = {
+	.complete = vhost_zerocopy_complete,
+};
+
 static inline unsigned long busy_clock(void)
 {
 	return local_clock() >> 10;
@@ -879,7 +883,7 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 			vq->heads[nvq->upend_idx].len = VHOST_DMA_IN_PROGRESS;
 			ubuf->ctx = nvq->ubufs;
 			ubuf->desc = nvq->upend_idx;
-			ubuf->ubuf.callback = vhost_zerocopy_callback;
+			ubuf->ubuf.ops = &vhost_ubuf_ops;
 			ubuf->ubuf.flags = SKBFL_ZEROCOPY_FRAG;
 			refcount_set(&ubuf->ubuf.refcnt, 1);
 			msg.msg_control = &ctl;
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 4072a7ee3859..a44954264746 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -527,6 +527,11 @@ enum {
 #define SKBFL_ALL_ZEROCOPY	(SKBFL_ZEROCOPY_FRAG | SKBFL_PURE_ZEROCOPY | \
 				 SKBFL_DONT_ORPHAN | SKBFL_MANAGED_FRAG_REFS)
 
+struct ubuf_info_ops {
+	void (*complete)(struct sk_buff *, struct ubuf_info *,
+			 bool zerocopy_success);
+};
+
 /*
  * The callback notifies userspace to release buffers when skb DMA is done in
  * lower device, the skb last reference should be 0 when calling this.
@@ -536,8 +541,7 @@ enum {
  * The desc field is used to track userspace buffer index.
  */
 struct ubuf_info {
-	void (*callback)(struct sk_buff *, struct ubuf_info *,
-			 bool zerocopy_success);
+	const struct ubuf_info_ops *ops;
 	refcount_t refcnt;
 	u8 flags;
 };
@@ -1671,14 +1675,13 @@ static inline void skb_set_end_offset(struct sk_buff *skb, unsigned int offset)
 }
 #endif
 
+extern const struct ubuf_info_ops msg_zerocopy_ubuf_ops;
+
 struct ubuf_info *msg_zerocopy_realloc(struct sock *sk, size_t size,
 				       struct ubuf_info *uarg);
 
 void msg_zerocopy_put_abort(struct ubuf_info *uarg, bool have_uref);
 
-void msg_zerocopy_callback(struct sk_buff *skb, struct ubuf_info *uarg,
-			   bool success);
-
 int __zerocopy_sg_from_iter(struct msghdr *msg, struct sock *sk,
 			    struct sk_buff *skb, struct iov_iter *from,
 			    size_t length);
@@ -1766,13 +1769,13 @@ static inline void *skb_zcopy_get_nouarg(struct sk_buff *skb)
 static inline void net_zcopy_put(struct ubuf_info *uarg)
 {
 	if (uarg)
-		uarg->callback(NULL, uarg, true);
+		uarg->ops->complete(NULL, uarg, true);
 }
 
 static inline void net_zcopy_put_abort(struct ubuf_info *uarg, bool have_uref)
 {
 	if (uarg) {
-		if (uarg->callback == msg_zerocopy_callback)
+		if (uarg->ops == &msg_zerocopy_ubuf_ops)
 			msg_zerocopy_put_abort(uarg, have_uref);
 		else if (have_uref)
 			net_zcopy_put(uarg);
@@ -1786,7 +1789,7 @@ static inline void skb_zcopy_clear(struct sk_buff *skb, bool zerocopy_success)
 
 	if (uarg) {
 		if (!skb_zcopy_is_nouarg(skb))
-			uarg->callback(skb, uarg, zerocopy_success);
+			uarg->ops->complete(skb, uarg, zerocopy_success);
 
 		skb_shinfo(skb)->flags &= ~SKBFL_ALL_ZEROCOPY;
 	}
diff --git a/io_uring/notif.c b/io_uring/notif.c
index 3485437b207d..53532d78a947 100644
--- a/io_uring/notif.c
+++ b/io_uring/notif.c
@@ -23,7 +23,7 @@ void io_notif_tw_complete(struct io_kiocb *notif, struct io_tw_state *ts)
 	io_req_task_complete(notif, ts);
 }
 
-static void io_tx_ubuf_callback(struct sk_buff *skb, struct ubuf_info *uarg,
+static void io_tx_ubuf_complete(struct sk_buff *skb, struct ubuf_info *uarg,
 				bool success)
 {
 	struct io_notif_data *nd = container_of(uarg, struct io_notif_data, uarg);
@@ -43,6 +43,10 @@ static void io_tx_ubuf_callback(struct sk_buff *skb, struct ubuf_info *uarg,
 	__io_req_task_work_add(notif, IOU_F_TWQ_LAZY_WAKE);
 }
 
+static const struct ubuf_info_ops io_ubuf_ops = {
+	.complete = io_tx_ubuf_complete,
+};
+
 struct io_kiocb *io_alloc_notif(struct io_ring_ctx *ctx)
 	__must_hold(&ctx->uring_lock)
 {
@@ -62,7 +66,7 @@ struct io_kiocb *io_alloc_notif(struct io_ring_ctx *ctx)
 	nd->zc_report = false;
 	nd->account_pages = 0;
 	nd->uarg.flags = IO_NOTIF_UBUF_FLAGS;
-	nd->uarg.callback = io_tx_ubuf_callback;
+	nd->uarg.ops = &io_ubuf_ops;
 	refcount_set(&nd->uarg.refcnt, 1);
 	return notif;
 }
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 37c858dc11a6..0f4cc759824b 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1652,7 +1652,7 @@ static struct ubuf_info *msg_zerocopy_alloc(struct sock *sk, size_t size)
 		return NULL;
 	}
 
-	uarg->ubuf.callback = msg_zerocopy_callback;
+	uarg->ubuf.ops = &msg_zerocopy_ubuf_ops;
 	uarg->id = ((u32)atomic_inc_return(&sk->sk_zckey)) - 1;
 	uarg->len = 1;
 	uarg->bytelen = size;
@@ -1678,7 +1678,7 @@ struct ubuf_info *msg_zerocopy_realloc(struct sock *sk, size_t size,
 		u32 bytelen, next;
 
 		/* there might be non MSG_ZEROCOPY users */
-		if (uarg->callback != msg_zerocopy_callback)
+		if (uarg->ops != &msg_zerocopy_ubuf_ops)
 			return NULL;
 
 		/* realloc only when socket is locked (TCP, UDP cork),
@@ -1789,8 +1789,8 @@ static void __msg_zerocopy_callback(struct ubuf_info_msgzc *uarg)
 	sock_put(sk);
 }
 
-void msg_zerocopy_callback(struct sk_buff *skb, struct ubuf_info *uarg,
-			   bool success)
+static void msg_zerocopy_complete(struct sk_buff *skb, struct ubuf_info *uarg,
+				  bool success)
 {
 	struct ubuf_info_msgzc *uarg_zc = uarg_to_msgzc(uarg);
 
@@ -1799,7 +1799,6 @@ void msg_zerocopy_callback(struct sk_buff *skb, struct ubuf_info *uarg,
 	if (refcount_dec_and_test(&uarg->refcnt))
 		__msg_zerocopy_callback(uarg_zc);
 }
-EXPORT_SYMBOL_GPL(msg_zerocopy_callback);
 
 void msg_zerocopy_put_abort(struct ubuf_info *uarg, bool have_uref)
 {
@@ -1809,10 +1808,15 @@ void msg_zerocopy_put_abort(struct ubuf_info *uarg, bool have_uref)
 	uarg_to_msgzc(uarg)->len--;
 
 	if (have_uref)
-		msg_zerocopy_callback(NULL, uarg, true);
+		msg_zerocopy_complete(NULL, uarg, true);
 }
 EXPORT_SYMBOL_GPL(msg_zerocopy_put_abort);
 
+const struct ubuf_info_ops msg_zerocopy_ubuf_ops = {
+	.complete = msg_zerocopy_complete,
+};
+EXPORT_SYMBOL_GPL(msg_zerocopy_ubuf_ops);
+
 int skb_zerocopy_iter_stream(struct sock *sk, struct sk_buff *skb,
 			     struct msghdr *msg, int len,
 			     struct ubuf_info *uarg)
-- 
2.44.0


