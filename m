Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C7558F8CD
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 10:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383697.619562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3C9-0004si-Ez; Thu, 11 Aug 2022 08:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383697.619562; Thu, 11 Aug 2022 08:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3C9-0004lI-Ah; Thu, 11 Aug 2022 08:05:33 +0000
Received: by outflank-mailman (input) for mailman id 383697;
 Wed, 10 Aug 2022 15:51:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIlE=YO=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1oLnzh-00016w-HZ
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 15:51:41 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53273659-18c4-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 17:51:40 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id ay12so5185324wmb.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 08:51:40 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.126.24.threembb.co.uk.
 [188.28.126.24]) by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b003a342933727sm3004519wmb.3.2022.08.10.08.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:51:39 -0700 (PDT)
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
X-Inumbo-ID: 53273659-18c4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zKsqv0p5Obkg1TLb6/kUNEYbyvoYoWpfWSOapsGCJxI=;
        b=DFTQlY8ddG8nxlheZEdY1AhOzyhFf8i+cYlGvYaQA2jXHoy604PEPidno8824FFofg
         YVuRVy3aoGvd+VxIlbyTojzVgA6ObPKrHOe3N+BtwnJ8/SiHLCzaUthyY809sB53Uy0k
         A80hQEmxtBOQP5ObevE2QDwC8UdnYAyiC/9NRGBeNLRJhgqxJeTUEIEq3lyZCycgRAKv
         YeRgjQWebysXI2hCFaZdjrhd9yqY/GnXi1hw7QfcxVhAyGjXJUcOFXn8ZTBLEhYDSjyB
         tkKzffcoleVU5wSv7BENj8Sif4EsQ6FQBYNVk3yJnkXWSuO8uva7e43fGJIcAy/AtU+c
         ghIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zKsqv0p5Obkg1TLb6/kUNEYbyvoYoWpfWSOapsGCJxI=;
        b=RneziP7bwJVyggCDpAuRtNqwknNQjKBMYFIkqqdzDqtE7ZO+J44koX4b06y91fbK7G
         wNbrzkJghTn+pkUJm//5Tjy1WLC5HR8gJqfWU/dD44L4BitnKMWoxzHWpBOMHLAqg3Rd
         9r1u/GFAYWhTs196Ix6+MPVc8LK7m8HW6uqlVTKxjUxBjx0rW9Jc3mYp9Idw4XXit+h1
         a7Jhn97WaooYSMrrJFsWNZ7RAZ/s2PYG/MMxqYEHtmpilEAX2FmhoNYxFnASOgZggjDq
         L5Dx9NkkKEAKEe2GupiCrro0hbTNDEsEYYk5GUqKDhi610dWV7yz642jzjWqmJBBKxKw
         r/KQ==
X-Gm-Message-State: ACgBeo2nod5sAkeIonE9ZVKx5K2POu1npfHndWD3RKMaJymgk4c6sAJs
	MlW4PcKRVulgwZpEovkOwfM=
X-Google-Smtp-Source: AA6agR7LF0ZwQ1BlKaVDicKs5LglruTEZwAxo7zyYgmWusQVZHSM24Cst0gJV7pB4XoOeH/qUhDY2A==
X-Received: by 2002:a05:600c:28cd:b0:3a5:4f45:b927 with SMTP id h13-20020a05600c28cd00b003a54f45b927mr2964921wmd.90.1660146700292;
        Wed, 10 Aug 2022 08:51:40 -0700 (PDT)
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
Subject: [RFC net-next io_uring 03/11] vhost/net: use struct ubuf_info_msgzc
Date: Wed, 10 Aug 2022 16:49:11 +0100
Message-Id: <87cfb629defa270e5ed953c6e501a47278f916c9.1660124059.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <cover.1660124059.git.asml.silence@gmail.com>
References: <cover.1660124059.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct ubuf_info will be changed, use ubuf_info_msgzc instead.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/vhost/net.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 68e4ecd1cc0e..9b616536dd9e 100644
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
@@ -288,7 +288,7 @@ static int vhost_net_set_ubuf_info(struct vhost_net *n)
 		n->vqs[i].ubuf_info =
 			kmalloc_array(UIO_MAXIOV,
 				      sizeof(*n->vqs[i].ubuf_info),
-				      GFP_KERNEL);
+				      GFP_KERNEL | __GFP_ZERO);
 		if  (!n->vqs[i].ubuf_info)
 			goto err;
 	}
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
2.37.0


