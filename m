Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB6458F8CA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 10:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383699.619570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3C9-00053y-VV; Thu, 11 Aug 2022 08:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383699.619570; Thu, 11 Aug 2022 08:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3C9-0004sw-OB; Thu, 11 Aug 2022 08:05:33 +0000
Received: by outflank-mailman (input) for mailman id 383699;
 Wed, 10 Aug 2022 15:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIlE=YO=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1oLnzj-00016q-8T
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 15:51:43 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 541ecaca-18c4-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 17:51:42 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id n4so16465056wrp.10
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 08:51:42 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.126.24.threembb.co.uk.
 [188.28.126.24]) by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b003a342933727sm3004519wmb.3.2022.08.10.08.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:51:41 -0700 (PDT)
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
X-Inumbo-ID: 541ecaca-18c4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=k7b9egffbhRjX5/OjtOx/by90hRcurZmtiI07zTQ9r0=;
        b=DO5S08zBi3vihZLd+TPnKuLvUBVq1/APvJ0DNR/ZVpJjz4DlQk8pVoCf++lDJQ+qCe
         J5GiO2q7rRcXgkXHqvH+Xa7gnatlgZJV5TwqmNquXIn+gL91mG56ATFSsq9BpXpc7zr0
         /1S04KGFgf42+WhssmeRXUhlovG5xP8Cx3T/uzDl82B5aLUk0pPU9HQVxh+wNlScY3LK
         CgQH74Kc4vSw87U7lXPsLH2C2ORUZZBxNzu/uVo2SSLsJLJNwcM+/ACew/XMVXYxRLdn
         VTO2yH9kAmRsQtleJsYuYUQbcBz0OVWz31KhDO6+31seXNLpFkbd/CzwI333S10XzntZ
         GzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=k7b9egffbhRjX5/OjtOx/by90hRcurZmtiI07zTQ9r0=;
        b=AdwYvUhrPJImmIpqUfsocOuARRDqwfyvRtRncLpbURVVdKOZLNq9N5ezLo0959NMLs
         0ozbQamR9jbCuqHCfvZijusXUUVeW2DkQM/kD9UNs8N+o614rOWUeAHb5WnmbqR4Romi
         igyZwOsG0a1rfEd8hl27uZ5dJUezxT92c2AYZ2vjHk+wOOKHLIn3EvEqYiUpNIpwjdOK
         M4fB64sSf5MqdMwYKQBVdiawTMnwYVX0JPh8vY/vLQbOMBTxLuNUBET83/eJCRbv9fZK
         JguvxSGFLaI2esAetCw44+N4lgCxL3fopxdxGW8DO6HKL6tvAP94Qq+cmO07L3Qup5UF
         pwuQ==
X-Gm-Message-State: ACgBeo0zFu5Hj2c1tFt37Ws+mF33dkLqWk+FMCqsp292xDKgI9lEjEaa
	xi4TEYxPPLY9OriLvHdeyQ8=
X-Google-Smtp-Source: AA6agR6suRfvAaYpMQRv+C0nU04QPftK1r02sWI7OLgKf0C0mEfWd53MX+qfOk7MeFvdNRw94olKdA==
X-Received: by 2002:adf:db8f:0:b0:220:6059:5284 with SMTP id u15-20020adfdb8f000000b0022060595284mr18041360wri.33.1660146701918;
        Wed, 10 Aug 2022 08:51:41 -0700 (PDT)
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
Subject: [RFC net-next io_uring 04/11] net: shrink struct ubuf_info
Date: Wed, 10 Aug 2022 16:49:12 +0100
Message-Id: <1e2d0bef44cd68b0e3dd106283f4536645c2a124.1660124059.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <cover.1660124059.git.asml.silence@gmail.com>
References: <cover.1660124059.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can benefit from a smaller struct ubuf_info, so leave only mandatory
fields and let users to decide how they want to extend it. Convert
MSG_ZEROCOPY to struct ubuf_info_msgzc and remove duplicated fields.
This reduces the size from 48 bytes to just 16.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/skbuff.h | 22 ++++------------------
 net/core/skbuff.c      | 38 +++++++++++++++++++++-----------------
 net/ipv4/ip_output.c   |  2 +-
 net/ipv4/tcp.c         |  2 +-
 net/ipv6/ip6_output.c  |  2 +-
 5 files changed, 28 insertions(+), 38 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index f8ac3678dab8..afd7400d7f62 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -533,25 +533,8 @@ enum {
 struct ubuf_info {
 	void (*callback)(struct sk_buff *, struct ubuf_info *,
 			 bool zerocopy_success);
-	union {
-		struct {
-			unsigned long desc;
-			void *ctx;
-		};
-		struct {
-			u32 id;
-			u16 len;
-			u16 zerocopy:1;
-			u32 bytelen;
-		};
-	};
 	refcount_t refcnt;
 	u8 flags;
-
-	struct mmpin {
-		struct user_struct *user;
-		unsigned int num_pg;
-	} mmp;
 };
 
 struct ubuf_info_msgzc {
@@ -570,7 +553,10 @@ struct ubuf_info_msgzc {
 		};
 	};
 
-	struct mmpin mmp;
+	struct mmpin {
+		struct user_struct *user;
+		unsigned int num_pg;
+	} mmp;
 };
 
 #define skb_uarg(SKB)	((struct ubuf_info *)(skb_shinfo(SKB)->destructor_arg))
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 974bbbbe7138..b047a773acd7 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1183,7 +1183,7 @@ EXPORT_SYMBOL_GPL(mm_unaccount_pinned_pages);
 
 static struct ubuf_info *msg_zerocopy_alloc(struct sock *sk, size_t size)
 {
-	struct ubuf_info *uarg;
+	struct ubuf_info_msgzc *uarg;
 	struct sk_buff *skb;
 
 	WARN_ON_ONCE(!in_task());
@@ -1201,19 +1201,19 @@ static struct ubuf_info *msg_zerocopy_alloc(struct sock *sk, size_t size)
 		return NULL;
 	}
 
-	uarg->callback = msg_zerocopy_callback;
+	uarg->ubuf.callback = msg_zerocopy_callback;
 	uarg->id = ((u32)atomic_inc_return(&sk->sk_zckey)) - 1;
 	uarg->len = 1;
 	uarg->bytelen = size;
 	uarg->zerocopy = 1;
-	uarg->flags = SKBFL_ZEROCOPY_FRAG | SKBFL_DONT_ORPHAN;
-	refcount_set(&uarg->refcnt, 1);
+	uarg->ubuf.flags = SKBFL_ZEROCOPY_FRAG | SKBFL_DONT_ORPHAN;
+	refcount_set(&uarg->ubuf.refcnt, 1);
 	sock_hold(sk);
 
-	return uarg;
+	return &uarg->ubuf;
 }
 
-static inline struct sk_buff *skb_from_uarg(struct ubuf_info *uarg)
+static inline struct sk_buff *skb_from_uarg(struct ubuf_info_msgzc *uarg)
 {
 	return container_of((void *)uarg, struct sk_buff, cb);
 }
@@ -1222,6 +1222,7 @@ struct ubuf_info *msg_zerocopy_realloc(struct sock *sk, size_t size,
 				       struct ubuf_info *uarg)
 {
 	if (uarg) {
+		struct ubuf_info_msgzc *uarg_zc;
 		const u32 byte_limit = 1 << 19;		/* limit to a few TSO */
 		u32 bytelen, next;
 
@@ -1237,8 +1238,9 @@ struct ubuf_info *msg_zerocopy_realloc(struct sock *sk, size_t size,
 			return NULL;
 		}
 
-		bytelen = uarg->bytelen + size;
-		if (uarg->len == USHRT_MAX - 1 || bytelen > byte_limit) {
+		uarg_zc = uarg_to_msgzc(uarg);
+		bytelen = uarg_zc->bytelen + size;
+		if (uarg_zc->len == USHRT_MAX - 1 || bytelen > byte_limit) {
 			/* TCP can create new skb to attach new uarg */
 			if (sk->sk_type == SOCK_STREAM)
 				goto new_alloc;
@@ -1246,11 +1248,11 @@ struct ubuf_info *msg_zerocopy_realloc(struct sock *sk, size_t size,
 		}
 
 		next = (u32)atomic_read(&sk->sk_zckey);
-		if ((u32)(uarg->id + uarg->len) == next) {
-			if (mm_account_pinned_pages(&uarg->mmp, size))
+		if ((u32)(uarg_zc->id + uarg_zc->len) == next) {
+			if (mm_account_pinned_pages(&uarg_zc->mmp, size))
 				return NULL;
-			uarg->len++;
-			uarg->bytelen = bytelen;
+			uarg_zc->len++;
+			uarg_zc->bytelen = bytelen;
 			atomic_set(&sk->sk_zckey, ++next);
 
 			/* no extra ref when appending to datagram (MSG_MORE) */
@@ -1286,7 +1288,7 @@ static bool skb_zerocopy_notify_extend(struct sk_buff *skb, u32 lo, u16 len)
 	return true;
 }
 
-static void __msg_zerocopy_callback(struct ubuf_info *uarg)
+static void __msg_zerocopy_callback(struct ubuf_info_msgzc *uarg)
 {
 	struct sk_buff *tail, *skb = skb_from_uarg(uarg);
 	struct sock_exterr_skb *serr;
@@ -1339,19 +1341,21 @@ static void __msg_zerocopy_callback(struct ubuf_info *uarg)
 void msg_zerocopy_callback(struct sk_buff *skb, struct ubuf_info *uarg,
 			   bool success)
 {
-	uarg->zerocopy = uarg->zerocopy & success;
+	struct ubuf_info_msgzc *uarg_zc = uarg_to_msgzc(uarg);
+
+	uarg_zc->zerocopy = uarg_zc->zerocopy & success;
 
 	if (refcount_dec_and_test(&uarg->refcnt))
-		__msg_zerocopy_callback(uarg);
+		__msg_zerocopy_callback(uarg_zc);
 }
 EXPORT_SYMBOL_GPL(msg_zerocopy_callback);
 
 void msg_zerocopy_put_abort(struct ubuf_info *uarg, bool have_uref)
 {
-	struct sock *sk = skb_from_uarg(uarg)->sk;
+	struct sock *sk = skb_from_uarg(uarg_to_msgzc(uarg))->sk;
 
 	atomic_dec(&sk->sk_zckey);
-	uarg->len--;
+	uarg_to_msgzc(uarg)->len--;
 
 	if (have_uref)
 		msg_zerocopy_callback(NULL, uarg, true);
diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index d7bd1daf022b..546897a4b4fa 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -1043,7 +1043,7 @@ static int __ip_append_data(struct sock *sk,
 				paged = true;
 				zc = true;
 			} else {
-				uarg->zerocopy = 0;
+				uarg_to_msgzc(uarg)->zerocopy = 0;
 				skb_zcopy_set(skb, uarg, &extra_uref);
 			}
 		}
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 970e9a2cca4a..3152da8f4763 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1239,7 +1239,7 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
 			}
 			zc = sk->sk_route_caps & NETIF_F_SG;
 			if (!zc)
-				uarg->zerocopy = 0;
+				uarg_to_msgzc(uarg)->zerocopy = 0;
 		}
 	}
 
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 897ca4f9b791..6d4f01a0cf6e 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1568,7 +1568,7 @@ static int __ip6_append_data(struct sock *sk,
 				paged = true;
 				zc = true;
 			} else {
-				uarg->zerocopy = 0;
+				uarg_to_msgzc(uarg)->zerocopy = 0;
 				skb_zcopy_set(skb, uarg, &extra_uref);
 			}
 		}
-- 
2.37.0


