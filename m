Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE505578950
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 20:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369999.601634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDVBA-0001fN-Ql; Mon, 18 Jul 2022 18:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369999.601634; Mon, 18 Jul 2022 18:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDVBA-0001cc-Nu; Mon, 18 Jul 2022 18:09:12 +0000
Received: by outflank-mailman (input) for mailman id 369999;
 Mon, 18 Jul 2022 18:09:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yO7Q=XX=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oDVB9-0001bm-2E
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 18:09:11 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6cbde1f-06c4-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 20:09:08 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A70405C00C5;
 Mon, 18 Jul 2022 14:09:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 18 Jul 2022 14:09:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 14:09:05 -0400 (EDT)
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
X-Inumbo-ID: b6cbde1f-06c4-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1658167746; x=1658254146; bh=9EVYFQs3TfjexPazUkgkLFWSM4eN+61vSya
	zDvU3JXY=; b=D3Otbn+w9zgEgOzUpLm3pClk07nfXG50Dt/6CcsQlNjM9PfPEz/
	VbuvRVBlrYrrgZbD+HDhBHLUoywquEgh+6OfGTao9Ko1zYukMfuUyIzm1W4dcPE0
	zI6dGadXxfzLNzyQLGjNjAsm2S2v4Iih7ZQ0w1p6HAYPmcne0ppKhfgnY5w3+CtZ
	zmZnknZx6t/1DTrpzWypMruZKd16AJGfKgK1dqcc/EUwuXkJpJANAkv/xjTNZhGb
	bXUrBtexNOxCB1T+y706BXIoKRvJeiBVPPQmg9eYzSqKnRhQNFORzcSYIB2zxgDA
	0Yo8pmLdFhyZugbg+JrveMK5kpXQ7YmLmYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1658167746; x=1658254146; bh=9EVYFQs3Tfjex
	PazUkgkLFWSM4eN+61vSyazDvU3JXY=; b=KWVz+WBPo4wOHR+z4RZpBCV9hQosu
	o3HEjIvXLc49G0rE6pJ14HFj+Idp8hNanjbdKg0w0uXReFUVX/wDKviIOcSWH2i9
	q2jlTrJE/Y5bqUD2ObM+QJjd86FCL/fKGlHHzZSrJL+FsbJDXst00vYIieKZpt6G
	2hXepp5R9NZul/A2G6bRv/hgb+gEhTJX3+wyoa3y7gbmh8olfLA8ZXyFwLkEnq3z
	UrsbW1jYLF2faP2vQpwzUjWLsKm3pFgXWC4aXq7zFHGtjdtXMMWoVKbOGdDd20qc
	luNBVYlkia5VgIBy1e+MojiSms9YuvlUU0PmtYZuF04vNfIDh2zKOKYYA==
X-ME-Sender: <xms:wqHVYoMm7syGZ67I_8Df6HgCjmudF0d4Vpuvc7M0skGhX3ldZoPXPQ>
    <xme:wqHVYu8zupr4vNJ-92-v-YU9TS6_1a-rzHo8Usb4lAYYl4gZtyEFT7yTxVuELEwka
    -vSGoPLawUv3rU>
X-ME-Received: <xmr:wqHVYvQupUW4L8RmfamPv7ulqGIpeZcW200OD0_-XoxXcnS7XtNNZrq30efFFe6Kn3eUPNRuWPor>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:wqHVYguiVzURQRGpGwJy2nc_FjqfwbWAdEHthCXIw1RTTKtiOyKgAQ>
    <xmx:wqHVYgelTZqpGS5sXiu5H3pAf0BUL6avuviLO4c72ClT-iQtUfA_dQ>
    <xmx:wqHVYk0qrioFrxLSjULkueOFpKLztTASZ18VwOf0L1NhFvN8A1t7CA>
    <xmx:wqHVYlFlbj2XKNxQGSXoneenWCG6HfKGen5a61XS7Y9RheSK5vkg-Q>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/5] Ignore failure to unmap -1
Date: Mon, 18 Jul 2022 14:08:18 -0400
Message-Id: <20220718180820.2555-2-demi@invisiblethingslab.com>
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
Fixes: 36cd49b071fc ("xen/gntdev: Avoid blocking in unmap_grant_pages()")
---
 drivers/xen/gntdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 2c3248e71e9c1a3e032b847d177b02855cdda1a1..a6585854a85fc6fffc16c3498ba73fbee84ad6ca 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -390,7 +390,8 @@ static void __unmap_grant_pages_done(int result,
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

