Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF2B6D957A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 13:34:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518853.805800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkNsS-0003va-8b; Thu, 06 Apr 2023 11:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518853.805800; Thu, 06 Apr 2023 11:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkNsS-0003t3-5Y; Thu, 06 Apr 2023 11:34:04 +0000
Received: by outflank-mailman (input) for mailman id 518853;
 Thu, 06 Apr 2023 11:34:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=15Bo=75=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1pkNsQ-0001qa-7h
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 11:34:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed2220a7-d46e-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 13:34:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90DCA6446C;
 Thu,  6 Apr 2023 11:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE3BC433EF;
 Thu,  6 Apr 2023 11:33:58 +0000 (UTC)
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
X-Inumbo-ID: ed2220a7-d46e-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680780840;
	bh=DPDY4dLUTQFSWfyffi7VSXhzq2fp9bKn4Z6f3hsXLJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I3O+lWgS9za640uc/O0WqKXjg9ExsPtbEkIL3gWU41hf7E1ctsPbsjZ9en7ZEPKq2
	 BfttYxCflZFHdJZWU74UrushclmrnUqLbOYP6DPlvJLhrsviv0nUnM0CvbJMj2WNrn
	 dS+KSjtYq2r/RmdaCmu4swItk+NekGlwVYBMR8Y77ngGriccJgRhW0MuARmSNf3OoB
	 Vyyv3//853X8cfh/V8ICCmxawrg92SvsJkxUFix4nS0Oi548sNtsNHVH2voZSkr8ey
	 oIql7dWyzbs7znGxHoZSz1DQTUAFpKjkHCfAHjOJJ/s6TBUx7Qho7jiR6kgpNRPGSS
	 Zp2cMUbK6Z3CQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	wei.liu@kernel.org,
	paul@xen.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 9/9] xen/netback: use same error messages for same errors
Date: Thu,  6 Apr 2023 07:33:37 -0400
Message-Id: <20230406113337.648916-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406113337.648916-1-sashal@kernel.org>
References: <20230406113337.648916-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Juergen Gross <jgross@suse.com>

[ Upstream commit 2eca98e5b24d01c02b46c67be05a5f98cc9789b1 ]

Issue the same error message in case an illegal page boundary crossing
has been detected in both cases where this is tested.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Link: https://lore.kernel.org/r/20230329080259.14823-1-jgross@suse.com
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/xen-netback/netback.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 3dfc5c66f1408..a3078755939e3 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -989,10 +989,8 @@ static void xenvif_tx_build_gops(struct xenvif_queue *queue,
 
 		/* No crossing a page as the payload mustn't fragment. */
 		if (unlikely((txreq.offset + txreq.size) > XEN_PAGE_SIZE)) {
-			netdev_err(queue->vif->dev,
-				   "txreq.offset: %u, size: %u, end: %lu\n",
-				   txreq.offset, txreq.size,
-				   (unsigned long)(txreq.offset&~XEN_PAGE_MASK) + txreq.size);
+			netdev_err(queue->vif->dev, "Cross page boundary, txreq.offset: %u, size: %u\n",
+				   txreq.offset, txreq.size);
 			xenvif_fatal_tx_err(queue->vif);
 			break;
 		}
-- 
2.39.2


