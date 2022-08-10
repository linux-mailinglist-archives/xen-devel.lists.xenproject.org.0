Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9100B58F8C9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 10:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383707.619609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3CC-0005l5-S1; Thu, 11 Aug 2022 08:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383707.619609; Thu, 11 Aug 2022 08:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3CB-0005cY-P2; Thu, 11 Aug 2022 08:05:35 +0000
Received: by outflank-mailman (input) for mailman id 383707;
 Wed, 10 Aug 2022 15:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIlE=YO=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1oLnzo-00016w-NB
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 15:51:48 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 579a2e61-18c4-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 17:51:48 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so1853031wmq.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 08:51:48 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.126.24.threembb.co.uk.
 [188.28.126.24]) by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b003a342933727sm3004519wmb.3.2022.08.10.08.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:51:47 -0700 (PDT)
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
X-Inumbo-ID: 579a2e61-18c4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=itYGv2JZK8WBFRrJm44D9H1rA7HcrDCnR5GlKfK0jhs=;
        b=g4eoVr1fu36ewbAmfG/t6UJBFOF1oHPXDiKrqdGSPIInTe4GhXxac8aY/xl6qj4Ry6
         hjJIrOjXgd6Yh8flP1MMruBaz19LaJGjliJaVdqyUgKhS5Iv3yZ5EXnaluD0BcKphXnA
         a5VMobfClu6mDyYL8AgAxvtUKvP55/JPpMBJHMu3wEu4WaWTzPCZhMYmHWz8b0MVDXhx
         GJ1Mj+/b/tEIWLH+pz8xBbXVEHEgTx42XMs5iv3QJxf8DSyr0HdmFD+Q1l3bx4FME1BL
         RC5BlkaAdauVJCjSBnJ19eyaQPimR9ZGZKGI4e8RTaSx6XcGE3jjRf3+QIMjbpvGpNmL
         Nr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=itYGv2JZK8WBFRrJm44D9H1rA7HcrDCnR5GlKfK0jhs=;
        b=Eu1x/h1pKkKvMyI/hKC0fdssmeG+AuM7xF6yGrQkIUOxOYnVQhwoZt2wPPS48d2GTi
         Co7g1yHyqXGaD4bpYWEaYj8sj8HwwibAayborxLVKQZBrhnlceb5CD5nv4d0fCSPfBJ/
         nVE5UPNWnndtegyGqyxVa9cfLZQta0JLyTRO2iBrXiqNZGu9Mk1E9IMv1y93wvVa5hsN
         uXtup5G9PMu9WS0GgzL/EaZv3J7gtKLDDD1X6VXGxips3JJ7MO1TQOXjC2KhSmaio6nI
         +xe8tVdU63qi4YHtc7ZC8d5jdBIu+PKHNnqhdphi4fYl31DdPmC6R9rzBSWjd4v5cx3V
         DjBg==
X-Gm-Message-State: ACgBeo2L9Tv91Dc3U5ywlP7ZBlFZccwFmReyvj83G1OAOMCiArXaleyR
	6E80RVGfQ3Je4SCOk5AzMkg=
X-Google-Smtp-Source: AA6agR5tWoJNmIKULSv6qED4kYicFbD6aj95a2kTMgyfbOltADMEJMZMCY4KEhAPbmXEqnmelWqLpA==
X-Received: by 2002:a05:600c:6009:b0:3a5:b069:5d34 with SMTP id az9-20020a05600c600900b003a5b0695d34mr2478342wmb.115.1660146707842;
        Wed, 10 Aug 2022 08:51:47 -0700 (PDT)
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
Subject: [RFC net-next io_uring 08/11] net: let callers provide ->msg_ubuf refs
Date: Wed, 10 Aug 2022 16:49:16 +0100
Message-Id: <526fe4cb9cda287bedfc92b3888b48a4f3b0250b.1660124059.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <cover.1660124059.git.asml.silence@gmail.com>
References: <cover.1660124059.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some msg_ubuf providers like io_uring can keep elaborated ubuf_info
reference batching and caching, so it will be of benefit to let the
network layer to optionally steal some of the cached refs.

Add UARGFL_GIFT_REF, if set the caller has at least one extra reference
that it can gift away. If the network decides to take the ref it should
clear the flag.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/skbuff.h | 14 ++++++++++++++
 net/ipv4/ip_output.c   |  1 +
 net/ipv6/ip6_output.c  |  1 +
 3 files changed, 16 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 45fe7f0648d0..972ec676e222 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -527,6 +527,11 @@ enum {
 	 * be freed until we return.
 	 */
 	UARGFL_CALLER_PINNED = BIT(0),
+
+	/* The caller can gift one ubuf reference. The flag should be cleared
+	 * when the reference is taken.
+	 */
+	UARGFL_GIFT_REF = BIT(1),
 };
 
 /*
@@ -1709,6 +1714,15 @@ static inline void net_zcopy_put(struct ubuf_info *uarg)
 		uarg->callback(NULL, uarg, true);
 }
 
+static inline bool net_zcopy_get_gift_ref(struct ubuf_info *uarg)
+{
+	bool has_ref;
+
+	has_ref = uarg->flags & UARGFL_GIFT_REF;
+	uarg->flags &= ~UARGFL_GIFT_REF;
+	return has_ref;
+}
+
 static inline void net_zcopy_put_abort(struct ubuf_info *uarg, bool have_uref)
 {
 	if (uarg) {
diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index 546897a4b4fa..9d42b6dd6b78 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -1032,6 +1032,7 @@ static int __ip_append_data(struct sock *sk,
 				paged = true;
 				zc = true;
 				uarg = msg->msg_ubuf;
+				extra_uref = net_zcopy_get_gift_ref(uarg);
 			}
 		} else if (sock_flag(sk, SOCK_ZEROCOPY)) {
 			uarg = msg_zerocopy_realloc(sk, length, skb_zcopy(skb));
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 6d4f01a0cf6e..8d8a8bbdb8df 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1557,6 +1557,7 @@ static int __ip6_append_data(struct sock *sk,
 				paged = true;
 				zc = true;
 				uarg = msg->msg_ubuf;
+				extra_uref = net_zcopy_get_gift_ref(uarg);
 			}
 		} else if (sock_flag(sk, SOCK_ZEROCOPY)) {
 			uarg = msg_zerocopy_realloc(sk, length, skb_zcopy(skb));
-- 
2.37.0


