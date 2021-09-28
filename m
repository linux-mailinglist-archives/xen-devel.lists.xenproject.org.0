Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF5541A7A6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 07:57:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197522.350623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV66u-0004hu-4a; Tue, 28 Sep 2021 05:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197522.350623; Tue, 28 Sep 2021 05:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV66u-0004fR-0w; Tue, 28 Sep 2021 05:57:00 +0000
Received: by outflank-mailman (input) for mailman id 197522;
 Tue, 28 Sep 2021 05:56:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqPr=OS=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1mV66s-00049R-65
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 05:56:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d277f21d-9a22-42aa-8a42-02bb9381d72a;
 Tue, 28 Sep 2021 05:56:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6D7661361;
 Tue, 28 Sep 2021 05:56:48 +0000 (UTC)
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
X-Inumbo-ID: d277f21d-9a22-42aa-8a42-02bb9381d72a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632808608;
	bh=aXvnqcLO8Ou+S5mb1OFq4rMhDipi4tUId/TV8UmR9yE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fsNv/pA8GFyTZIWBUET7BM7qqwasXrq5k5G9x5Ql3j+dU69C0NoChAFdcoT/pqPFv
	 ik8KCqGPpUVEOnsZhzuhw0Aq5TTEyadEKqlAHZJVhuTv1pB3JtTmwVoLn3QVugi+4/
	 8SJCdhIdrnGBGSn5gtujSwSLZhk3FQNAhX2LzUK5OkNCHNvKjYhOC6aVE2OeXv3TsK
	 GqZplc26ZunwBVcM1FLCq9RbhLJ7Ihpqq6bXuHiKxdzYR43/GO/doQXn453crXorz2
	 PvIKYOftco2TuKzNC6ipoiYXU96yXZ/mKqOavJ1zlb4Ilm1XQywJP0vRkGxcKh4Yjn
	 EQy0vfT4Lb/Ag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	"David S . Miller" <davem@davemloft.net>,
	Sasha Levin <sashal@kernel.org>,
	wei.liu@kernel.org,
	kuba@kernel.org,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 08/23] xen-netback: correct success/error reporting for the SKB-with-fraglist case
Date: Tue, 28 Sep 2021 01:56:29 -0400
Message-Id: <20210928055645.172544-8-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928055645.172544-1-sashal@kernel.org>
References: <20210928055645.172544-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Jan Beulich <jbeulich@suse.com>

[ Upstream commit 3ede7f84c7c21f93c5eac611d60eba3f2c765e0f ]

When re-entering the main loop of xenvif_tx_check_gop() a 2nd time, the
special considerations for the head of the SKB no longer apply. Don't
mistakenly report ERROR to the frontend for the first entry in the list,
even if - from all I can tell - this shouldn't matter much as the overall
transmit will need to be considered failed anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/xen-netback/netback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 986b56970961..b0cbc7fead74 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -499,7 +499,7 @@ static int xenvif_tx_check_gop(struct xenvif_queue *queue,
 				 * the header's copy failed, and they are
 				 * sharing a slot, send an error
 				 */
-				if (i == 0 && sharedslot)
+				if (i == 0 && !first_shinfo && sharedslot)
 					xenvif_idx_release(queue, pending_idx,
 							   XEN_NETIF_RSP_ERROR);
 				else
-- 
2.33.0


