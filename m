Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0003F58F8D1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 10:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383705.619601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3CB-0005dE-Sq; Thu, 11 Aug 2022 08:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383705.619601; Thu, 11 Aug 2022 08:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3CB-0005On-BM; Thu, 11 Aug 2022 08:05:35 +0000
Received: by outflank-mailman (input) for mailman id 383705;
 Wed, 10 Aug 2022 15:51:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIlE=YO=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1oLnzn-00016q-Mc
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 15:51:47 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56d6cb5f-18c4-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 17:51:47 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id j1so18275492wrw.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 08:51:46 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.126.24.threembb.co.uk.
 [188.28.126.24]) by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b003a342933727sm3004519wmb.3.2022.08.10.08.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:51:46 -0700 (PDT)
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
X-Inumbo-ID: 56d6cb5f-18c4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=h9HHmdtmbDaBgAkYhJr0MaG2LsaIMYK3/tGmura3Q/c=;
        b=RkQDnrNrgozMvW1slfCx3exnfLZSPNL0SE3J0CmXcn4NPQmzKH1nUhVoCi4rJ/bGhQ
         qWkiTJzALDavZu1xxA3ht8UtZU4n6tL4iHm1Zx/Em0r6K4Qe5KsTNb1lHxoLPs9CxUrL
         ZNGihmk1LOvOohQDQ1AY3Ulw8RiLhtDxqyohg/rvq0SO7NQvrO7saW7gPAaH7++iBvJP
         Jl1azWCXpOvZRwom0TDdfqiZB33KjKODuKkdpzGyNypg8/uceMD9cO1ihA+jI9r5ZcC3
         TYYoAUSpD/Fkw5BOO1iG7WSOK8lPFUPa6a5TlPYgWBB6P/+e3jyrNxZORTfBjtmz0zUS
         rYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=h9HHmdtmbDaBgAkYhJr0MaG2LsaIMYK3/tGmura3Q/c=;
        b=gqrINwAblhQzlCwGHkavlNMWU+GHwUsvJ1tPHgZKZ9S6hpRhfrQtqdLGaNZP1dKJ8A
         BGB3wrC6cZl5URcgGGU85dsgmxtL8082aMGzME7+OmhBlQowzRQFeOIP4TGgQ2CrF5Cx
         6DOviDb50fEQwfSL4EqM/2Mw2ghHJCan2kKlSySOYXiPHJG/tJFN0Uo+wvHYnfJRaNzR
         xypIDHSYootR/5ueXcr1xXTGp+jbhf1e6rH8/8s7cez429ndiuMSZ63llqNleMzHj8VX
         0SSRXN+rh4XGluFNlxLemBxRNyJleI23rma3zwhbUtMO6ohbn/YGmmRA0Dvf8nQVo4dV
         y1OQ==
X-Gm-Message-State: ACgBeo2CNKq43octZdG6Ec04vreyRn5eBNXAHS7gT2QkUEPwTbzbXn8o
	1V9mvyNscg0XxUkSiGVJbPo=
X-Google-Smtp-Source: AA6agR6ZNn9gZ3GD3qgxjdOVbL8JXumKhuxwUdsZoAGuCONXxJ2F64wM4uAcQJPM/4Jm+GN1m/z5nQ==
X-Received: by 2002:a5d:634d:0:b0:220:5ff7:3969 with SMTP id b13-20020a5d634d000000b002205ff73969mr16857681wrw.709.1660146706405;
        Wed, 10 Aug 2022 08:51:46 -0700 (PDT)
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
Subject: [RFC net-next io_uring 07/11] net/tcp: optimise tcp ubuf refcounting
Date: Wed, 10 Aug 2022 16:49:15 +0100
Message-Id: <9a42187cdc9ce034fd23179c7b31d7cc6a54bd45.1660124059.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <cover.1660124059.git.asml.silence@gmail.com>
References: <cover.1660124059.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add UARGFL_CALLER_PINNED letting protocols know that the caller holds a
reference to the ubuf_info and so it doesn't need additional refcounting
for purposes of keeping it alive. With that TCP can save a refcount
put/get pair per send when used with ->msg_ubuf.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/skbuff.h | 7 +++++++
 net/ipv4/tcp.c         | 9 ++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 2b2e0020030b..45fe7f0648d0 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -522,6 +522,13 @@ enum {
 #define SKBFL_ALL_ZEROCOPY	(SKBFL_ZEROCOPY_FRAG | SKBFL_PURE_ZEROCOPY | \
 				 SKBFL_DONT_ORPHAN | SKBFL_MANAGED_FRAG_REFS)
 
+enum {
+	/* The caller holds a reference during the submission so the ubuf won't
+	 * be freed until we return.
+	 */
+	UARGFL_CALLER_PINNED = BIT(0),
+};
+
 /*
  * The callback notifies userspace to release buffers when skb DMA is done in
  * lower device, the skb last reference should be 0 when calling this.
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 3152da8f4763..4925107de57d 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1229,7 +1229,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
 
 		if (msg->msg_ubuf) {
 			uarg = msg->msg_ubuf;
-			net_zcopy_get(uarg);
+			if (!(uarg->flags & UARGFL_CALLER_PINNED))
+				net_zcopy_get(uarg);
 			zc = sk->sk_route_caps & NETIF_F_SG;
 		} else if (sock_flag(sk, SOCK_ZEROCOPY)) {
 			uarg = msg_zerocopy_realloc(sk, size, skb_zcopy(skb));
@@ -1455,7 +1456,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
 		tcp_push(sk, flags, mss_now, tp->nonagle, size_goal);
 	}
 out_nopush:
-	net_zcopy_put(uarg);
+	if (uarg && !(uarg->flags & UARGFL_CALLER_PINNED))
+		net_zcopy_put(uarg);
 	return copied + copied_syn;
 
 do_error:
@@ -1464,7 +1466,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
 	if (copied + copied_syn)
 		goto out;
 out_err:
-	net_zcopy_put_abort(uarg, true);
+	if (uarg && !(uarg->flags & UARGFL_CALLER_PINNED))
+		net_zcopy_put_abort(uarg, true);
 	err = sk_stream_error(sk, flags, err);
 	/* make sure we wake any epoll edge trigger waiter */
 	if (unlikely(tcp_rtx_and_write_queues_empty(sk) && err == -EAGAIN)) {
-- 
2.37.0


