Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B7B5E8006
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 18:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410880.654041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblj0-0004Tf-VU; Fri, 23 Sep 2022 16:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410880.654041; Fri, 23 Sep 2022 16:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblj0-0004LJ-SG; Fri, 23 Sep 2022 16:40:26 +0000
Received: by outflank-mailman (input) for mailman id 410880;
 Fri, 23 Sep 2022 16:40:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kfh5=Z2=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1obliz-0003zv-SV
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 16:40:25 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c54ea6f-3b5e-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 18:40:25 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id cc5so834031wrb.6
 for <xen-devel@lists.xenproject.org>; Fri, 23 Sep 2022 09:40:25 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.201.74.threembb.co.uk.
 [188.28.201.74]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d60cd000000b0022af6c93340sm7717399wrt.17.2022.09.23.09.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:40:24 -0700 (PDT)
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
X-Inumbo-ID: 6c54ea6f-3b5e-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=NLIYqCB5GFGbnjqA6dYmmqdLI8BuNFTVxSCPXONSBRc=;
        b=owDxYda7B4frXz3u0Fwc1/mPY0PkIoc9YEt4hkPPANfeq4CAFBjXeUytt806Zgzrh2
         Oflmk3RWPGkL3H4Kqr+rh0g6ue3kNa5qh9EG2VFQ5SqjrD782ppbdaoa2zK8ufjpi3tg
         YpW05bXLXbqTGO0ZMSAueq+peDDRvbo8UVlb48ZmGp0vWAJpfOl00oTe17PDhCBXTmcj
         4LkSJcqD4FNFtW3MKLedobmMatlst3bdPyImM5Y1cg33OA2+GGukbR5y3KFMrsGkoqPe
         QYLUipMNRbiIvHjo0pc7wNIYe7Hj0Xd06Y+WNBvXMB+pfT+4vyFvrFYbZ+73u9ePpxWd
         LFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=NLIYqCB5GFGbnjqA6dYmmqdLI8BuNFTVxSCPXONSBRc=;
        b=iSbJMo/KAePsC/dh/1kVu9SXfES9G0luB/nUJ99DVtTCXMA4z9DKTmUBhE+QlXKLZN
         CQM9xBZ6/v17xFedEB7mTiC3kna6y86op+C0cneIyo8LFgkajuQtW17mQb/5QbGKfu6T
         KwU7o4XlyVXXjdr2GaumqiWIEz4nSv+aKy2d7LSzQIQZS6rwZBywHmDiR5U2QjFpN3la
         2Wg/D4q310O9xKCHOEDr8AajZDdgeL0yYDb9bPRavmPccMAmiTXDouds/P1WUiC1pgi9
         TT4LUAyq2r3nWsnWe9Jry03xP4u2uEu0VUPWCJU6R/d/UhH3XCV8ZG3SJsa5n+A2PGlh
         lbeA==
X-Gm-Message-State: ACrzQf1U7631u93MIg+6nXEKbIzS25Qjlex+r3D3BPtG9valHbrJ8wKY
	a3XLQLQIpugoB3xMrJ5W9LM=
X-Google-Smtp-Source: AMsMyM5HMaxWgOxUGbCzg/XjKD/kmOOlcN0KKz9OmaE/RAZn/7aZ8z59Qz72lGSep1WOF16x4j6q2w==
X-Received: by 2002:a5d:5c06:0:b0:22a:7b52:cda6 with SMTP id cc6-20020a5d5c06000000b0022a7b52cda6mr5635717wrb.485.1663951224622;
        Fri, 23 Sep 2022 09:40:24 -0700 (PDT)
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
Subject: [PATCH net-next 2/4] xen/netback: use struct ubuf_info_msgzc
Date: Fri, 23 Sep 2022 17:39:02 +0100
Message-Id: <5e00bc6d4d8c3fdcf3ed02549ba8a36d5552e56c.1663892211.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1663892211.git.asml.silence@gmail.com>
References: <cover.1663892211.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct ubuf_info will be changed, use ubuf_info_msgzc instead.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/net/xen-netback/common.h    | 2 +-
 drivers/net/xen-netback/interface.c | 4 ++--
 drivers/net/xen-netback/netback.c   | 7 ++++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/xen-netback/common.h b/drivers/net/xen-netback/common.h
index 8174d7b2966c..1545cbee77a4 100644
--- a/drivers/net/xen-netback/common.h
+++ b/drivers/net/xen-netback/common.h
@@ -62,7 +62,7 @@ struct pending_tx_info {
 	 * ubuf_to_vif is a helper which finds the struct xenvif from a pointer
 	 * to this field.
 	 */
-	struct ubuf_info callback_struct;
+	struct ubuf_info_msgzc callback_struct;
 };
 
 #define XEN_NETIF_TX_RING_SIZE __CONST_RING_SIZE(xen_netif_tx, XEN_PAGE_SIZE)
diff --git a/drivers/net/xen-netback/interface.c b/drivers/net/xen-netback/interface.c
index fb32ae82d9b0..e579ecd40b74 100644
--- a/drivers/net/xen-netback/interface.c
+++ b/drivers/net/xen-netback/interface.c
@@ -591,8 +591,8 @@ int xenvif_init_queue(struct xenvif_queue *queue)
 	}
 
 	for (i = 0; i < MAX_PENDING_REQS; i++) {
-		queue->pending_tx_info[i].callback_struct = (struct ubuf_info)
-			{ .callback = xenvif_zerocopy_callback,
+		queue->pending_tx_info[i].callback_struct = (struct ubuf_info_msgzc)
+			{ { .callback = xenvif_zerocopy_callback },
 			  { { .ctx = NULL,
 			      .desc = i } } };
 		queue->grant_tx_handle[i] = NETBACK_INVALID_HANDLE;
diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index a256695fc89e..3d2081bbbc86 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -133,7 +133,7 @@ static inline unsigned long idx_to_kaddr(struct xenvif_queue *queue,
 
 /* Find the containing VIF's structure from a pointer in pending_tx_info array
  */
-static inline struct xenvif_queue *ubuf_to_queue(const struct ubuf_info *ubuf)
+static inline struct xenvif_queue *ubuf_to_queue(const struct ubuf_info_msgzc *ubuf)
 {
 	u16 pending_idx = ubuf->desc;
 	struct pending_tx_info *temp =
@@ -1228,11 +1228,12 @@ static int xenvif_tx_submit(struct xenvif_queue *queue)
 	return work_done;
 }
 
-void xenvif_zerocopy_callback(struct sk_buff *skb, struct ubuf_info *ubuf,
+void xenvif_zerocopy_callback(struct sk_buff *skb, struct ubuf_info *ubuf_base,
 			      bool zerocopy_success)
 {
 	unsigned long flags;
 	pending_ring_idx_t index;
+	struct ubuf_info_msgzc *ubuf = uarg_to_msgzc(ubuf_base);
 	struct xenvif_queue *queue = ubuf_to_queue(ubuf);
 
 	/* This is the only place where we grab this lock, to protect callbacks
@@ -1241,7 +1242,7 @@ void xenvif_zerocopy_callback(struct sk_buff *skb, struct ubuf_info *ubuf,
 	spin_lock_irqsave(&queue->callback_lock, flags);
 	do {
 		u16 pending_idx = ubuf->desc;
-		ubuf = (struct ubuf_info *) ubuf->ctx;
+		ubuf = (struct ubuf_info_msgzc *) ubuf->ctx;
 		BUG_ON(queue->dealloc_prod - queue->dealloc_cons >=
 			MAX_PENDING_REQS);
 		index = pending_index(queue->dealloc_prod);
-- 
2.37.2


