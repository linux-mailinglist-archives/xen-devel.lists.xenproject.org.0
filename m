Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B5257894E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 20:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370003.601657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDVBK-0002Kl-CW; Mon, 18 Jul 2022 18:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370003.601657; Mon, 18 Jul 2022 18:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDVBK-0002HT-9H; Mon, 18 Jul 2022 18:09:22 +0000
Received: by outflank-mailman (input) for mailman id 370003;
 Mon, 18 Jul 2022 18:09:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yO7Q=XX=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oDVBI-0001J5-AM
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 18:09:20 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be037867-06c4-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 20:09:19 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C5BA65C0136;
 Mon, 18 Jul 2022 14:09:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 18 Jul 2022 14:09:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 14:09:17 -0400 (EDT)
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
X-Inumbo-ID: be037867-06c4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1658167758; x=1658254158; bh=zetN2Gdm7SQF49L9d/RaHd27ZFZZJEqIZva
	4v9uU+Uo=; b=MyGqT2z9GBTFrKYQ/kjsuueYUB/qcbvKvzqSkuRT/sH8woIPgVH
	As0fUMduWrZ4wCc/Nurhl17cSHwghbe+q5S+U6A9C5iSX/Vnv82sNZEBrJjNA2Or
	0dIrt9jPrmG2cSDgk91g35AXwYDehPBMRIrUfY05zsu57U3gl6o9aYIslsaNpu14
	wBasI0U/q0UZlyiuiMvciVFRuS2zXFSRQH6EQUVU1osNxqdMpzvvACHBb4lbMUYs
	/QKOSppcsUPjJd2opPcDsgwZbB17ZTc1+AX0um88hKDZgnWtob68GS9mnRvLHNvc
	7LMJv45BxxcHJ92+P5KNZ27U2CHyLI7T3zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1658167758; x=1658254158; bh=zetN2Gdm7SQF4
	9L9d/RaHd27ZFZZJEqIZva4v9uU+Uo=; b=hChnZsCnCeM7i5qyYiHA08uFDvtS1
	RmChDdLXcnweH5uJl5gXVt5moXdW13Y3A9CsIasGtrUs828+1M5mW9qiiG0vd7Yi
	d7lgPt3/QJLuw5YWDn76zYgc1lnJdMGVyPj5jRSib6bB8auTuK3PqQMJxsEH4A7z
	HuJgU1M4RFdYoNB3CZcj9Rfl2l9MD2oUgY/dMAvtVLAr/DCu6Iqz/0Oi21M91eR1
	0tAA8uIeeD1z6KjiaYvIap+7mzeihX5jNXYto3x2upBukbgOMMIMHuEiDAkgAPhm
	yiWqH0usd5hKx3Lq0z6GNgWoOEgvfu97NQIH+LUDEKTTUbhUH97DsbT0w==
X-ME-Sender: <xms:zqHVYphSD1nSPcrjuWhXYEJ9jEcH5T21zncHVsbHglUW3WC6mFaaFA>
    <xme:zqHVYuDW0OtzhVNfwKGI1Zcb9yXiR6cEHjbpP0nbuq_jSQezTFBUmv8R2yTGTwK3o
    IWSPmrdoofoin0>
X-ME-Received: <xmr:zqHVYpEV2VbMNnjDdrl3MD2XTZbeCU5UV-KgSDTSdT6K3Q40DeWa_Qniq5MAGdWokPqjLwOBdhSU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:zqHVYuTgXejzC2BU3Gf1cUeoZX5jRRR8__E4bZs0JPQjZKUoHvSnDA>
    <xmx:zqHVYmxdeY58J5cTXPUv01V7ydzfpCI5tx47ROkhV_id1i47S_VUAw>
    <xmx:zqHVYk5rEvxO3y-9hQmrJWCt_vLy47bnvihVc-e0CDlpNlA6NSAViw>
    <xmx:zqHVYgtgzUifzsg73I53O2w68gkBsIJq54YGyJMzmMnFTj7M_q0iyA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	stable@vger.kernel.org
Subject: [PATCH 3/5] Ignore failure to unmap -1
Date: Mon, 18 Jul 2022 14:08:20 -0400
Message-Id: <20220718180820.2555-4-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220718180820.2555-1-demi@invisiblethingslab.com>
References: <20220718180820.2555-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Upstream commit 166d3863231667c4f64dee72b77d1102cdfad11f ]

The error paths of gntdev_mmap() can call unmap_grant_pages() even
though not all of the pages have been successfully mapped.  This will
trigger the WARN_ON()s in __unmap_grant_pages_done().  The number of
warnings can be very large; I have observed thousands of lines of
warnings in the systemd journal.

Avoid this problem by only warning on unmapping failure if the handle
being unmapped is not -1.  The handle field of any page that was not
successfully mapped will be -1, so this catches all cases where
unmapping can legitimately fail.

Suggested-by: Juergen Gross <jgross@suse.com>
Cc: stable@vger.kernel.org
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Fixes: 73e9e72247b9 ("xen/gntdev: Avoid blocking in unmap_grant_pages()")
---
 drivers/xen/gntdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 492084814f55d8ed46d2d656db75b28a91dd7f06..27d955c5d9f9076266f77b9fedfa1a6a2ba08f56 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -416,7 +416,8 @@ static void __unmap_grant_pages_done(int result,
 	unsigned int offset = data->unmap_ops - map->unmap_ops;
 
 	for (i = 0; i < data->count; i++) {
-		WARN_ON(map->unmap_ops[offset+i].status);
+		WARN_ON(map->unmap_ops[offset+i].status &&
+			map->unmap_ops[offset+i].handle != -1);
 		pr_debug("unmap handle=%d st=%d\n",
 			map->unmap_ops[offset+i].handle,
 			map->unmap_ops[offset+i].status);
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

