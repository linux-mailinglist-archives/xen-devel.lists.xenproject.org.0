Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA807647C9D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 04:42:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457576.715523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3UFt-0005HC-DP; Fri, 09 Dec 2022 03:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457576.715523; Fri, 09 Dec 2022 03:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3UFt-0005Ee-9w; Fri, 09 Dec 2022 03:40:57 +0000
Received: by outflank-mailman (input) for mailman id 457576;
 Fri, 09 Dec 2022 03:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9kuX=4H=linux.alibaba.com=jiapeng.chong@srs-se1.protection.inumbo.net>)
 id 1p3UFr-0005EY-88
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 03:40:55 +0000
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45a50d90-7773-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 04:40:52 +0100 (CET)
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VWspzh3_1670557238) by smtp.aliyun-inc.com;
 Fri, 09 Dec 2022 11:40:44 +0800
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
X-Inumbo-ID: 45a50d90-7773-11ed-91b6-6bf2151ebd3b
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=jiapeng.chong@linux.alibaba.com;NM=0;PH=DS;RN=16;SR=0;TI=SMTPD_---0VWspzh3_1670557238;
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: wei.liu@kernel.org
Cc: paul@xen.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] xen-netback: Remove set but unused variable 'pending_idx'
Date: Fri,  9 Dec 2022 11:40:36 +0800
Message-Id: <20221209034036.37280-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Variable pending_idx is not effectively used in the function, so delete
it.

drivers/net/xen-netback/netback.c:886:7: warning: variable ‘pending_idx’ set but not used.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3399
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/net/xen-netback/netback.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 054ac0e897f6..19d928389473 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -883,7 +883,6 @@ static void xenvif_tx_build_gops(struct xenvif_queue *queue,
 		struct xen_netif_tx_request txfrags[XEN_NETBK_LEGACY_SLOTS_MAX];
 		struct xen_netif_extra_info extras[XEN_NETIF_EXTRA_TYPE_MAX-1];
 		unsigned int extra_count;
-		u16 pending_idx;
 		RING_IDX idx;
 		int work_to_do;
 		unsigned int data_len;
@@ -984,7 +983,6 @@ static void xenvif_tx_build_gops(struct xenvif_queue *queue,
 		}
 
 		index = pending_index(queue->pending_cons);
-		pending_idx = queue->pending_ring[index];
 
 		if (ret >= XEN_NETBK_LEGACY_SLOTS_MAX - 1 && data_len < txreq.size)
 			data_len = txreq.size;
-- 
2.20.1.7.g153144c


