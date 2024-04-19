Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D058AAD61
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 13:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709004.1108282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxm6r-0001dG-0T; Fri, 19 Apr 2024 11:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709004.1108282; Fri, 19 Apr 2024 11:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxm6q-0001bR-QM; Fri, 19 Apr 2024 11:08:48 +0000
Received: by outflank-mailman (input) for mailman id 709004;
 Fri, 19 Apr 2024 11:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8I7=LY=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1rxm6o-0001FM-Mh
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 11:08:46 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30255899-fe3d-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 13:08:45 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-571d8606f40so307097a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 04:08:45 -0700 (PDT)
Received: from 127.0.0.1localhost ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a17090655cd00b00a4739efd7cesm2082525ejp.60.2024.04.19.04.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 04:08:43 -0700 (PDT)
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
X-Inumbo-ID: 30255899-fe3d-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713524924; x=1714129724; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gztq7q+tVBfKfiFB41TR2uivJxMSmSRECNayk7q9P5o=;
        b=Vtba2uo3nvOZARvC3JslcGnayR6WbvbVno4fU6D2UGtfqQqeBdwXocXd1YZJVr5Xn1
         77+pw9sf0VCBOnm9Q3Hc36eeqnWqrVLH/epTazfwQUADq3NzLEFHmWTQPEwPYFqZdfRP
         aUJYFLceZb5WndWInEvHjeKMMVFIhO7ZCjpDzCVLcSzmJ5Wn1koSUfdxzGe6ZBKBkLfM
         179fGo76sWFG9RtiDUZENc6Co9Ih1Kp4VqsngZTgtn3vwKPXagOzrZOhc52e5SyayNzN
         4WYqD1ma76FCTqSKACi2eNOGHnNFqTRk808tp8WbyOCDffrc9jX1KpQzZ5Tw1PuDTjmq
         agiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524924; x=1714129724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gztq7q+tVBfKfiFB41TR2uivJxMSmSRECNayk7q9P5o=;
        b=koGN8Q0529ohQu5KJ4v4PnArfjhpd5fG7rcJEn2bpF5EjcaVt7KCL5ky3zHzY2NO3J
         iWpQfxFWPA10L0wJPjaOQTm5C966QzqOJH7vsJKWdTiGyXYA54wdk+pABh/vdGCDm2bQ
         JA7xAIiZLyHvQe+VeT8DLnpmK68z4JqisifPNjRsbzM90xhVkDdwCyXt0fYezo7E8yy6
         muLidmvkuZb5UfrHxkuRiqVc99kz+k+yP3Qi+q8BO4nY+mGEy6RLwCy6Pr8d0lmtFkDd
         xiflNAeSoLm+b18+R2HkUeVMzDMSG4UbIeCSNriD8+rEhd6tko78vc81ANXs/fZfyGv9
         7jNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1oiE1AlTBJVPL+ET5tPNW+PhoYPdPEabCOvUyekxObFXHt9pkeAQxJqF++KhMdHYEFfXjBQRmOTC9Y67N7W+tZMcN7WXu2urinl79FBo=
X-Gm-Message-State: AOJu0YzSwb3DyWzsFSGlF1i1wQauLNaU4W0HKCam0Wt+bmY4xa0jccXp
	7jics9PHmgMJ3TvRvh93o50V+YzQQWft4snjGy6pdZX4ZbNN5m9S
X-Google-Smtp-Source: AGHT+IFLPp89/CqqYt/oDY9TsD6MpTpW+WHomUzd8c9Q6sFQ45RxeiYZXRR2f3kaQNaQYK9HhlusCw==
X-Received: by 2002:a17:907:9624:b0:a52:2a36:38bf with SMTP id gb36-20020a170907962400b00a522a3638bfmr1634494ejc.55.1713524924521;
        Fri, 19 Apr 2024 04:08:44 -0700 (PDT)
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
Subject: [PATCH io_uring-next/net-next v2 2/4] net: add callback for setting a ubuf_info to skb
Date: Fri, 19 Apr 2024 12:08:40 +0100
Message-ID: <b7918aadffeb787c84c9e72e34c729dc04f3a45d.1713369317.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713369317.git.asml.silence@gmail.com>
References: <cover.1713369317.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the moment an skb can only have one ubuf_info associated with it,
which might be a performance problem for zerocopy sends in cases like
TCP via io_uring. Add a callback for assigning ubuf_info to skb, this
way we will implement smarter assignment later like linking ubuf_info
together.

Note, it's an optional callback, which should be compatible with
skb_zcopy_set(), that's because the net stack might potentially decide
to clone an skb and take another reference to ubuf_info whenever it
wishes. Also, a correct implementation should always be able to bind to
an skb without prior ubuf_info, otherwise we could end up in a situation
when the send would not be able to progress.

Reviewed-by: Jens Axboe <axboe@kernel.dk>
Reviewed-by: David Ahern <dsahern@kernel.org>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/skbuff.h |  2 ++
 net/core/skbuff.c      | 20 ++++++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index a44954264746..f76825e5b92a 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -530,6 +530,8 @@ enum {
 struct ubuf_info_ops {
 	void (*complete)(struct sk_buff *, struct ubuf_info *,
 			 bool zerocopy_success);
+	/* has to be compatible with skb_zcopy_set() */
+	int (*link_skb)(struct sk_buff *skb, struct ubuf_info *uarg);
 };
 
 /*
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 0f4cc759824b..0c8b82750000 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1824,11 +1824,18 @@ int skb_zerocopy_iter_stream(struct sock *sk, struct sk_buff *skb,
 	struct ubuf_info *orig_uarg = skb_zcopy(skb);
 	int err, orig_len = skb->len;
 
-	/* An skb can only point to one uarg. This edge case happens when
-	 * TCP appends to an skb, but zerocopy_realloc triggered a new alloc.
-	 */
-	if (orig_uarg && uarg != orig_uarg)
-		return -EEXIST;
+	if (uarg->ops->link_skb) {
+		err = uarg->ops->link_skb(skb, uarg);
+		if (err)
+			return err;
+	} else {
+		/* An skb can only point to one uarg. This edge case happens
+		 * when TCP appends to an skb, but zerocopy_realloc triggered
+		 * a new alloc.
+		 */
+		if (orig_uarg && uarg != orig_uarg)
+			return -EEXIST;
+	}
 
 	err = __zerocopy_sg_from_iter(msg, sk, skb, &msg->msg_iter, len);
 	if (err == -EFAULT || (err == -EMSGSIZE && skb->len == orig_len)) {
@@ -1842,7 +1849,8 @@ int skb_zerocopy_iter_stream(struct sock *sk, struct sk_buff *skb,
 		return err;
 	}
 
-	skb_zcopy_set(skb, uarg, NULL);
+	if (!uarg->ops->link_skb)
+		skb_zcopy_set(skb, uarg, NULL);
 	return skb->len - orig_len;
 }
 EXPORT_SYMBOL_GPL(skb_zerocopy_iter_stream);
-- 
2.44.0


