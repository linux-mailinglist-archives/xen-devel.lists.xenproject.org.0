Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA7358F8C7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 10:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383703.619593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3CB-0005QL-Cy; Thu, 11 Aug 2022 08:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383703.619593; Thu, 11 Aug 2022 08:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3CA-0005Ev-PW; Thu, 11 Aug 2022 08:05:34 +0000
Received: by outflank-mailman (input) for mailman id 383703;
 Wed, 10 Aug 2022 15:51:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIlE=YO=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1oLnzl-00016w-Ps
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 15:51:45 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55c66db5-18c4-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 17:51:45 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so1852975wmq.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 08:51:45 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.126.24.threembb.co.uk.
 [188.28.126.24]) by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b003a342933727sm3004519wmb.3.2022.08.10.08.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:51:44 -0700 (PDT)
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
X-Inumbo-ID: 55c66db5-18c4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=I6HOvD/OHCC6U7VTSloH8Bzb7BhYYX9aNTArIgD6mXg=;
        b=CvZ+o5GyX9Cl58rR5XQmVQ/WnA/GRIRdZxP33Dzgj6r9DPlQRphs6yOhzWqdULKen9
         gMmXHh/unAvJbQnQA9hJTCa2uvfKeDglP05vwYf7ACs1xU/sY79GVh0ja78nBVBuQos9
         At2FAi3HtK9PCPmiPaAo3PGgSrGuJe4zvs8ZzOggBwh7U2mW5q2DaPPvVs8/T9wnfdXz
         94FcpAUm2zJ0X95SveH+CL7kQAQJnVwYQOQrhReSHaP1tz8rIPU18lNRtSV+dGg7djft
         87OokEhFNIW6wyCD9lMh9IYzKCch26fi5GrPIxaxnKIQEuRdYWpJJ4Lz0KAThc69LX2g
         ITgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=I6HOvD/OHCC6U7VTSloH8Bzb7BhYYX9aNTArIgD6mXg=;
        b=V5XjQqJpiDQraXhGnF08AHY+r4WI6XBblL97n9Mvt5SXCMRwJ0KVEpVK3OGyImPSye
         6BzMy/dEFLyaiu8PmrY12e2PDX99FRpPyIH0BtU01iaHghRf2y0VzfxrpmwFagVA6D36
         aDoThVhFFMzaWTUIlX1aCOw65vCCAbW0JXn1V+P/uKD46icE/vAInuGOa4vyD6AVdAl1
         7xqvq9gjxnq2DvIUix9CdY6oJoZroPIFYLCRbnkGL4ZtMTNIIUccKiqJbbZL2f81dtyb
         AlHTm8r/bv+fePm/1G4qmBcphyx5zsUJf7WMJxwEbMhaIgHHc8+KoHJGua6DKMne8nJz
         VG7Q==
X-Gm-Message-State: ACgBeo3Mx8JhYoFjJ1q0e3jNNMG7VxW3ul0iMXoBf91MNHpQKTn8+p4p
	w36nZ9GHFILZmwmTk7ezmuI=
X-Google-Smtp-Source: AA6agR45he4dyQKI12poNM8AGSPq8F4/kGUNUT0s11gtoLe3WPA20HuKlateIe0Lr4uUnp3aBCdobA==
X-Received: by 2002:a05:600c:1e05:b0:3a5:b441:e9c with SMTP id ay5-20020a05600c1e0500b003a5b4410e9cmr2221515wmb.24.1660146704771;
        Wed, 10 Aug 2022 08:51:44 -0700 (PDT)
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
Subject: [RFC net-next io_uring 06/11] net: add flags for controlling ubuf_info
Date: Wed, 10 Aug 2022 16:49:14 +0100
Message-Id: <433971d77b5a757b11ce5683ef1d0377efcc8544.1660124059.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <cover.1660124059.git.asml.silence@gmail.com>
References: <cover.1660124059.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are already skb_flags in ubuf_info, which enhancing skbs. Also add
flags controlling ubuf_info, mainly to hint about various referencing
aspects of it, which will be introduced in later patches.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/skbuff.h | 1 +
 io_uring/notif.c       | 1 +
 net/core/skbuff.c      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index e749b5d3868d..2b2e0020030b 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -535,6 +535,7 @@ struct ubuf_info {
 			 bool zerocopy_success);
 	refcount_t refcnt;
 	u8 skb_flags;
+	u8 flags;
 };
 
 struct ubuf_info_msgzc {
diff --git a/io_uring/notif.c b/io_uring/notif.c
index 97cb4a7e8849..a2ba1e35a59f 100644
--- a/io_uring/notif.c
+++ b/io_uring/notif.c
@@ -66,6 +66,7 @@ struct io_kiocb *io_alloc_notif(struct io_ring_ctx *ctx,
 	nd = io_notif_to_data(notif);
 	nd->account_pages = 0;
 	nd->uarg.skb_flags = SKBFL_ZEROCOPY_FRAG | SKBFL_DONT_ORPHAN;
+	nd->uarg.flags = 0;
 	nd->uarg.callback = io_uring_tx_zerocopy_callback;
 	/* master ref owned by io_notif_slot, will be dropped on flush */
 	refcount_set(&nd->uarg.refcnt, 1);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 40bb84986800..7e102373482c 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1207,6 +1207,7 @@ static struct ubuf_info *msg_zerocopy_alloc(struct sock *sk, size_t size)
 	uarg->bytelen = size;
 	uarg->zerocopy = 1;
 	uarg->ubuf.skb_flags = SKBFL_ZEROCOPY_FRAG | SKBFL_DONT_ORPHAN;
+	uarg->ubuf.flags = 0;
 	refcount_set(&uarg->ubuf.refcnt, 1);
 	sock_hold(sk);
 
-- 
2.37.0


