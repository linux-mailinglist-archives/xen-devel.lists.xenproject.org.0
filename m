Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8355E8005
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 18:40:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410881.654056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblj3-0004rP-Al; Fri, 23 Sep 2022 16:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410881.654056; Fri, 23 Sep 2022 16:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblj3-0004ni-76; Fri, 23 Sep 2022 16:40:29 +0000
Received: by outflank-mailman (input) for mailman id 410881;
 Fri, 23 Sep 2022 16:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kfh5=Z2=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1oblj1-0003zv-CO
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 16:40:27 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d4c0e39-3b5e-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 18:40:26 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id c11so791791wrp.11
 for <xen-devel@lists.xenproject.org>; Fri, 23 Sep 2022 09:40:26 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.201.74.threembb.co.uk.
 [188.28.201.74]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d60cd000000b0022af6c93340sm7717399wrt.17.2022.09.23.09.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:40:25 -0700 (PDT)
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
X-Inumbo-ID: 6d4c0e39-3b5e-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=FG3Mj1csJ7FbeoY2zgdLrFVr7w1D2Zs//acRgBf+TRE=;
        b=eE5aVrZKg1v/P9UeaHNz1t9u6KrDObJzPuHWUbsNB0CGvL2ozT6QO6y8RV3J4TvApK
         gPGLloFmul/9NycdPQzEdBinJ0njxpLdx/5DMi9pkPqxHexWAitmYT7B+590/zvfROM9
         CIVg8YVhNarmc9WM95AOuXgoiDJPoZLmdOExh3cWbH26mGW6YjwixTE3hbClVdbEUOis
         9uTUExsQwAPYQ75waTv9Um9hLpemVfJuIj+0GaxnBaIvAP3G5baJmEnOoa51UmzPE0/V
         9wc+Ze+zqXKhGHGQroVMuqM6b/rlyf5FCzbF0pKQAhzaxGDoxQxA7E7iIWwRmyyPXktb
         EuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FG3Mj1csJ7FbeoY2zgdLrFVr7w1D2Zs//acRgBf+TRE=;
        b=PDUYkJvS55E7jbewHmaOR3gV/rGFlIPaB4COQizkHgTt6FELRhZZpzJjOjMbagFWGK
         Hhwo8d08/MsFT1jaNo6eKabQRZ7GhPlB0GxqfrCYLnXJNa9pL19vF7fxSE11P3sKw3tg
         xkSP2KF5AMqRIWGdHVHBZ076GXijHYVlhfy8zy9TRRqZc2VZY1H7X+jmPXZ9mEshfHtF
         prCPIFT387Kshds6qjUV9DyoJ2X+Assueldi7qbDTXz6g/zJiUIxb+fEtgSgVjYGzaVO
         zWLsRPdtYfnHkprvk9MkJTpo3cD70lpCeHvfWbwFPRh5NJrYVIlUEH35pwciuzCBuRgk
         Q7Kg==
X-Gm-Message-State: ACrzQf3mTZzh5r3sRLPVqZSBK/3ZMMx51YFYbFHlWJHTEh+Aiq1+v1lW
	LLeckuWS2fM7NgB15javKvY=
X-Google-Smtp-Source: AMsMyM7kN8lNHyV1w1d1RL8dD6evo1RUYO8Wx/UWQQUl5cn81n4HQTVjecLZI9rI0Uh/wzPOiMq83A==
X-Received: by 2002:a5d:5452:0:b0:228:d6f0:dbeb with SMTP id w18-20020a5d5452000000b00228d6f0dbebmr5883466wrv.84.1663951226140;
        Fri, 23 Sep 2022 09:40:26 -0700 (PDT)
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
Subject: [PATCH net-next 3/4] vhost/net: use struct ubuf_info_msgzc
Date: Fri, 23 Sep 2022 17:39:03 +0100
Message-Id: <126df081c74ecf06de383b4fdaad5080346f93dd.1663892211.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1663892211.git.asml.silence@gmail.com>
References: <cover.1663892211.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct ubuf_info will be changed, use ubuf_info_msgzc instead.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/vhost/net.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 68e4ecd1cc0e..d7a04d573988 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -118,7 +118,7 @@ struct vhost_net_virtqueue {
 	/* Number of XDP frames batched */
 	int batched_xdp;
 	/* an array of userspace buffers info */
-	struct ubuf_info *ubuf_info;
+	struct ubuf_info_msgzc *ubuf_info;
 	/* Reference counting for outstanding ubufs.
 	 * Protected by vq mutex. Writers must also take device mutex. */
 	struct vhost_net_ubuf_ref *ubufs;
@@ -382,8 +382,9 @@ static void vhost_zerocopy_signal_used(struct vhost_net *net,
 }
 
 static void vhost_zerocopy_callback(struct sk_buff *skb,
-				    struct ubuf_info *ubuf, bool success)
+				    struct ubuf_info *ubuf_base, bool success)
 {
+	struct ubuf_info_msgzc *ubuf = uarg_to_msgzc(ubuf_base);
 	struct vhost_net_ubuf_ref *ubufs = ubuf->ctx;
 	struct vhost_virtqueue *vq = ubufs->vq;
 	int cnt;
@@ -871,7 +872,7 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 	size_t len, total_len = 0;
 	int err;
 	struct vhost_net_ubuf_ref *ubufs;
-	struct ubuf_info *ubuf;
+	struct ubuf_info_msgzc *ubuf;
 	bool zcopy_used;
 	int sent_pkts = 0;
 
@@ -907,14 +908,14 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 			ubuf = nvq->ubuf_info + nvq->upend_idx;
 			vq->heads[nvq->upend_idx].id = cpu_to_vhost32(vq, head);
 			vq->heads[nvq->upend_idx].len = VHOST_DMA_IN_PROGRESS;
-			ubuf->callback = vhost_zerocopy_callback;
 			ubuf->ctx = nvq->ubufs;
 			ubuf->desc = nvq->upend_idx;
-			ubuf->flags = SKBFL_ZEROCOPY_FRAG;
-			refcount_set(&ubuf->refcnt, 1);
+			ubuf->ubuf.callback = vhost_zerocopy_callback;
+			ubuf->ubuf.flags = SKBFL_ZEROCOPY_FRAG;
+			refcount_set(&ubuf->ubuf.refcnt, 1);
 			msg.msg_control = &ctl;
 			ctl.type = TUN_MSG_UBUF;
-			ctl.ptr = ubuf;
+			ctl.ptr = &ubuf->ubuf;
 			msg.msg_controllen = sizeof(ctl);
 			ubufs = nvq->ubufs;
 			atomic_inc(&ubufs->refcount);
-- 
2.37.2


