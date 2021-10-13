Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B847A42C6C8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 18:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208757.365000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mahTr-000306-Ea; Wed, 13 Oct 2021 16:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208757.365000; Wed, 13 Oct 2021 16:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mahTr-0002xA-B6; Wed, 13 Oct 2021 16:51:51 +0000
Received: by outflank-mailman (input) for mailman id 208757;
 Wed, 13 Oct 2021 16:51:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nO85=PB=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1mahTp-0002x4-KZ
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 16:51:49 +0000
Received: from smtp-relay-canonical-0.canonical.com (unknown [185.125.188.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4c81883-5fa5-43b7-8664-926cbe58f904;
 Wed, 13 Oct 2021 16:51:48 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id F11133FFDC; 
 Wed, 13 Oct 2021 16:51:42 +0000 (UTC)
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
X-Inumbo-ID: a4c81883-5fa5-43b7-8664-926cbe58f904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1634143903;
	bh=nspxtz40p65DZu4TYJBabtEkFf22gqNZfGTLya7Yrd8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=jHQ+xQpZT3ySNZvfc7Mv2IO5uEBq9duWF1MlPWpGZvYeJHiVcz9A7rRAAkuRwsAWD
	 L0aC8QkbNLM/Ovd66WAmrejidVQGrzhN/CM3WyfiuZ67P2/G4AsejdKw/iNfhdcvLf
	 r8uEJeG5anV0ARNJ+4MVgIKMi6VYnOWCUlnwC6OShxeUQqiw8abRiFgcNeSpyHUHCF
	 a0MLlhJasei7LHS5hQPlNdEOtLCQ/Fpytil4ruNAnNd2LOKPm8bLRwLRwztOhSb6zl
	 7fo6dG70HRDukksIb7Qk8FDlv02QO//kgN80AcJNgMvrord248FTEehqNUeiLyynrG
	 vcou6qPyVlE6A==
From: Colin King <colin.king@canonical.com>
To: Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen-netback: Remove redundant initialization of variable err
Date: Wed, 13 Oct 2021 17:51:42 +0100
Message-Id: <20211013165142.135795-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never read, it
is being updated immediately afterwards. The assignment is redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/xen-netback/netback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 32d5bc4919d8..0f7fd159f0f2 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -1474,7 +1474,7 @@ int xenvif_map_frontend_data_rings(struct xenvif_queue *queue,
 	struct xen_netif_tx_sring *txs;
 	struct xen_netif_rx_sring *rxs;
 	RING_IDX rsp_prod, req_prod;
-	int err = -ENOMEM;
+	int err;
 
 	err = xenbus_map_ring_valloc(xenvif_to_xenbus_device(queue->vif),
 				     &tx_ring_ref, 1, &addr);
-- 
2.32.0


