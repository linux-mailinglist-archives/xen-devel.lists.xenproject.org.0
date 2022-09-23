Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080305E8009
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 18:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410882.654066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblj5-0005AJ-KR; Fri, 23 Sep 2022 16:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410882.654066; Fri, 23 Sep 2022 16:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblj5-00057K-HL; Fri, 23 Sep 2022 16:40:31 +0000
Received: by outflank-mailman (input) for mailman id 410882;
 Fri, 23 Sep 2022 16:40:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kfh5=Z2=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1oblj4-00050m-6L
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 16:40:30 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e5a3d3a-3b5e-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 18:40:29 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso324930wmq.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Sep 2022 09:40:28 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.201.74.threembb.co.uk.
 [188.28.201.74]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d60cd000000b0022af6c93340sm7717399wrt.17.2022.09.23.09.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:40:27 -0700 (PDT)
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
X-Inumbo-ID: 6e5a3d3a-3b5e-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9VVplsCxvC3CPJyNAguid6PlNyGw4lN66t6t3nf9Zaw=;
        b=YX4cbnzVIadel+pT1A6WodnDs0MR3NSCVsnHE38CJKF7XkI7KvaIQ4X6UmO2SfaMby
         3VG63f3bamCi8YVL8ww08dism3Nm3ZvPgDMvFHyrKNRzINXMBssaysY/QDsZovrtNXWO
         gddHNXxGWa8BakVKjQ5YbFO8g393XpvaAu125LTZaJ3U/JaL0wKZvINwFV4DLmKgHz7T
         Xw7f7SfpPz9S5UhKJqbPOz8SYQZLUnnVbiqzammFHsqMEzmYr/Jf/7M227Gu2RTGDhGm
         G+jXB2dWbPryASB1xMe7LrokxjofXsZVvU+X/L2122P0YwcjI8IYTMdbFPhAAa4OkK00
         foRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9VVplsCxvC3CPJyNAguid6PlNyGw4lN66t6t3nf9Zaw=;
        b=sxQ6eYdaoa3DLNW6sVz6PvN/FXaOHsyEncH7LBA9j18S2zp3gZi3KCorsBKDainLGT
         9xxdmCOT2bTzWKbNtU/i5XN++Hu5LSME9fJIWURyoSLn7rKsDE89S/qEwah/21F0Gqd2
         BL2tiu0VLK2kZ89ppRNb6oFGbjaC6mQ1lOJrLw7wOwf1+iExe6OF9QaCiinlbYhivJGb
         msFdwKy19c8WahNo0ojt1G5yX1M8IoFE1rdGbWyg8UDSJmYYvIEiBHGv58bJedbB7auf
         S8VgKr5o5JLavvhpMDu8XcaOXf0oDyOPGFxW0U2ub/wbzgFLR9CZR4Jet/A10oAkRjDT
         Uy9g==
X-Gm-Message-State: ACrzQf1NZpeOYxdCkVpks0zKM51ywXQb5TyBRIB4n20tg9KLS6ZsPo9m
	fH+fel9K0pNqYNtCKcRaE40=
X-Google-Smtp-Source: AMsMyM6Fs/pfy41Rfyr/MfeH4GoV13INTvx0st23vngXOgKxULEpbfBhZr8VAlVXwkSzQowWksWZFQ==
X-Received: by 2002:a05:600c:1989:b0:3b4:b6b6:737 with SMTP id t9-20020a05600c198900b003b4b6b60737mr6550166wmq.79.1663951227773;
        Fri, 23 Sep 2022 09:40:27 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [PATCH net-next 4/4] net: shrink struct ubuf_info
Date: Fri, 23 Sep 2022 17:39:04 +0100
Message-Id: <fb899519db7573baea32309a158cfccbc849629b.1663892211.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1663892211.git.asml.silence@gmail.com>
References: <cover.1663892211.git.asml.silence@gmail.com>
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
index fd7dcb977fdf..920eb6413fee 100644
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
index f1b8b20fc20b..bbcfb1c7f59e 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1188,7 +1188,7 @@ EXPORT_SYMBOL_GPL(mm_unaccount_pinned_pages);
 
 static struct ubuf_info *msg_zerocopy_alloc(struct sock *sk, size_t size)
 {
-	struct ubuf_info *uarg;
+	struct ubuf_info_msgzc *uarg;
 	struct sk_buff *skb;
 
 	WARN_ON_ONCE(!in_task());
@@ -1206,19 +1206,19 @@ static struct ubuf_info *msg_zerocopy_alloc(struct sock *sk, size_t size)
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
@@ -1227,6 +1227,7 @@ struct ubuf_info *msg_zerocopy_realloc(struct sock *sk, size_t size,
 				       struct ubuf_info *uarg)
 {
 	if (uarg) {
+		struct ubuf_info_msgzc *uarg_zc;
 		const u32 byte_limit = 1 << 19;		/* limit to a few TSO */
 		u32 bytelen, next;
 
@@ -1242,8 +1243,9 @@ struct ubuf_info *msg_zerocopy_realloc(struct sock *sk, size_t size,
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
@@ -1251,11 +1253,11 @@ struct ubuf_info *msg_zerocopy_realloc(struct sock *sk, size_t size,
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
@@ -1291,7 +1293,7 @@ static bool skb_zerocopy_notify_extend(struct sk_buff *skb, u32 lo, u16 len)
 	return true;
 }
 
-static void __msg_zerocopy_callback(struct ubuf_info *uarg)
+static void __msg_zerocopy_callback(struct ubuf_info_msgzc *uarg)
 {
 	struct sk_buff *tail, *skb = skb_from_uarg(uarg);
 	struct sock_exterr_skb *serr;
@@ -1344,19 +1346,21 @@ static void __msg_zerocopy_callback(struct ubuf_info *uarg)
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
index 8201cd423ff9..1ae83ad629b2 100644
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
index 829beee3fa32..34fd52c07534 100644
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
index e3dbb32b70dc..2f279cbd2648 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1569,7 +1569,7 @@ static int __ip6_append_data(struct sock *sk,
 				paged = true;
 				zc = true;
 			} else {
-				uarg->zerocopy = 0;
+				uarg_to_msgzc(uarg)->zerocopy = 0;
 				skb_zcopy_set(skb, uarg, &extra_uref);
 			}
 		}
-- 
2.37.2


