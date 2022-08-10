Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D958F8CE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 10:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383701.619581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3CA-0005GR-L8; Thu, 11 Aug 2022 08:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383701.619581; Thu, 11 Aug 2022 08:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3CA-00054h-9Y; Thu, 11 Aug 2022 08:05:34 +0000
Received: by outflank-mailman (input) for mailman id 383701;
 Wed, 10 Aug 2022 15:51:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIlE=YO=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1oLnzk-00016q-FG
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 15:51:44 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54eb7c8b-18c4-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 17:51:43 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 i128-20020a1c3b86000000b003a536d58f73so1211964wma.4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 08:51:43 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.126.24.threembb.co.uk.
 [188.28.126.24]) by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b003a342933727sm3004519wmb.3.2022.08.10.08.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:51:42 -0700 (PDT)
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
X-Inumbo-ID: 54eb7c8b-18c4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=aYyDEkTXwWBCvoGHlIPqb+/BxSLKuFl8ndVR481kS1w=;
        b=hZ9U5hOp4VB5FaNjAUnUraKpOCA2Wpyj5HNp6Hhmv23m66TTZRgMWtl/dQOYhFz/E9
         36lXEdGbdo0OOYp9ub05DxHU0JI2ixvQfkVCuWQmznlpIUTvzJs+XnGqaJ2CMBu+LqhP
         BnPg0B38v5clDnOrD+9TKJLttKJu9NRZchU1iQUWn8KW95x2YDQFqqAhiIbkPwedVKlK
         NGR7PWWBnUvj5HLI2Nv9zCRnQk5F7LOPjdp0zI7zbkzXr3sK9gOJiNthyiUh1Y08msvy
         8rfhtGaZQIdqI/4wm9WgW+yQdrbS+/dsw22V6yBOrwzgjM4RRxcF9hYdLnEirsOA1u+p
         JGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=aYyDEkTXwWBCvoGHlIPqb+/BxSLKuFl8ndVR481kS1w=;
        b=4FHtAh8TaKod+uiqFWHNTVsazBx+12jeeLzaQ1vkirwTNeDl4WCfRnPy0qP5gxlMRm
         MurSEKhwADLOH+HY5XnUjha1nqb5NjZAj0mNGvNuFdrygHw6q0JhwDsUcq93d3Ki4DYP
         F/ZWIU9MzX6kyujElJcdfDVXAm/Z/p3rwQTN/j1OpZczLD3gQa2aKAMcK+7cB1tpM9vB
         geJL9aNN4z5eAj6Gl63Dixh3zNxquXxhJlCc5yDhE9gqMGFlgrdt+vcEiXfFuFk96z6p
         Rq41MZaawb9MVoHY+2UkJS1awA/LI1kMeHlLiLVVze0V1oUQytjzWLa4900gNsncxDbw
         +53g==
X-Gm-Message-State: ACgBeo2xYBBHDeNkgOjhZE5TEEibm7BKTKAcNvYc5yrOgrzoWNYulEP0
	BZYCdgzrSeZAXLUCdv6wBR4=
X-Google-Smtp-Source: AA6agR4pIC1FSo3wRp5p1MAJqhHvgQE9nDnk6Uk00rTTOcb22zy1nLrULEj+sKAA+/DezVNGQLcv4Q==
X-Received: by 2002:a05:600c:1e8d:b0:3a5:74d:c61c with SMTP id be13-20020a05600c1e8d00b003a5074dc61cmr2953296wmb.70.1660146703329;
        Wed, 10 Aug 2022 08:51:43 -0700 (PDT)
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
Subject: [RFC net-next io_uring 05/11] net: rename ubuf_info's flags
Date: Wed, 10 Aug 2022 16:49:13 +0100
Message-Id: <7d43d8dd1c7e7c9964d40202482f325ecd06642b.1660124059.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <cover.1660124059.git.asml.silence@gmail.com>
References: <cover.1660124059.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ubuf_info::flags contains SKBFL_* flags that we copy into skbs, change
the field name to stress that it keeps skb flags.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/skbuff.h | 4 ++--
 io_uring/notif.c       | 2 +-
 net/core/skbuff.c      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index afd7400d7f62..e749b5d3868d 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -534,7 +534,7 @@ struct ubuf_info {
 	void (*callback)(struct sk_buff *, struct ubuf_info *,
 			 bool zerocopy_success);
 	refcount_t refcnt;
-	u8 flags;
+	u8 skb_flags;
 };
 
 struct ubuf_info_msgzc {
@@ -1664,7 +1664,7 @@ static inline void net_zcopy_get(struct ubuf_info *uarg)
 static inline void skb_zcopy_init(struct sk_buff *skb, struct ubuf_info *uarg)
 {
 	skb_shinfo(skb)->destructor_arg = uarg;
-	skb_shinfo(skb)->flags |= uarg->flags;
+	skb_shinfo(skb)->flags |= uarg->skb_flags;
 }
 
 static inline void skb_zcopy_set(struct sk_buff *skb, struct ubuf_info *uarg,
diff --git a/io_uring/notif.c b/io_uring/notif.c
index b5f989dff9de..97cb4a7e8849 100644
--- a/io_uring/notif.c
+++ b/io_uring/notif.c
@@ -65,7 +65,7 @@ struct io_kiocb *io_alloc_notif(struct io_ring_ctx *ctx,
 
 	nd = io_notif_to_data(notif);
 	nd->account_pages = 0;
-	nd->uarg.flags = SKBFL_ZEROCOPY_FRAG | SKBFL_DONT_ORPHAN;
+	nd->uarg.skb_flags = SKBFL_ZEROCOPY_FRAG | SKBFL_DONT_ORPHAN;
 	nd->uarg.callback = io_uring_tx_zerocopy_callback;
 	/* master ref owned by io_notif_slot, will be dropped on flush */
 	refcount_set(&nd->uarg.refcnt, 1);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index b047a773acd7..40bb84986800 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1206,7 +1206,7 @@ static struct ubuf_info *msg_zerocopy_alloc(struct sock *sk, size_t size)
 	uarg->len = 1;
 	uarg->bytelen = size;
 	uarg->zerocopy = 1;
-	uarg->ubuf.flags = SKBFL_ZEROCOPY_FRAG | SKBFL_DONT_ORPHAN;
+	uarg->ubuf.skb_flags = SKBFL_ZEROCOPY_FRAG | SKBFL_DONT_ORPHAN;
 	refcount_set(&uarg->ubuf.refcnt, 1);
 	sock_hold(sk);
 
-- 
2.37.0


