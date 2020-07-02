Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61F1212618
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 16:22:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr06l-0001AO-LU; Thu, 02 Jul 2020 14:22:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ftxy=AN=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1jr06k-0001AJ-Dw
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 14:22:34 +0000
X-Inumbo-ID: 7786a83c-bc6f-11ea-8496-bc764e2007e4
Received: from youngberry.canonical.com (unknown [91.189.89.112])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7786a83c-bc6f-11ea-8496-bc764e2007e4;
 Thu, 02 Jul 2020 14:22:32 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jr06Z-0000Sf-K0; Thu, 02 Jul 2020 14:22:23 +0000
From: Colin King <colin.king@canonical.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Subject: [PATCH][next] xen-netfront: remove redundant assignment to variable
 'act'
Date: Thu,  2 Jul 2020 15:22:23 +0100
Message-Id: <20200702142223.48178-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Colin Ian King <colin.king@canonical.com>

The variable act is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/xen-netfront.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 468f3f6f1425..860a0cce346d 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -856,7 +856,7 @@ static u32 xennet_run_xdp(struct netfront_queue *queue, struct page *pdata,
 {
 	struct xdp_frame *xdpf;
 	u32 len = rx->status;
-	u32 act = XDP_PASS;
+	u32 act;
 	int err;
 
 	xdp->data_hard_start = page_address(pdata);
-- 
2.27.0


