Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E7E56BE50
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 18:48:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363638.594298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9r9P-0005zc-WB; Fri, 08 Jul 2022 16:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363638.594298; Fri, 08 Jul 2022 16:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9r9P-0005uP-QI; Fri, 08 Jul 2022 16:48:19 +0000
Received: by outflank-mailman (input) for mailman id 363638;
 Fri, 08 Jul 2022 16:48:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6xB=XN=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o9r0g-0000b9-S2
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 16:39:18 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8206c30e-fedc-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 18:39:18 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6CC8C3200993;
 Fri,  8 Jul 2022 12:39:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 12:39:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 12:39:14 -0400 (EDT)
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
X-Inumbo-ID: 8206c30e-fedc-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1657298354; x=1657384754; bh=Bt0vZIuA0Rz6B2Rlr6YNUv8F+fLJYzOFEfj
	BkkL+cAY=; b=lmMhq9OdTAOEZc2M8YBrhqYYMRSpYYrTeOzweTHgFlAS7KeLide
	o3OVx3Bg6lIsRiMF66s0XQwZD6cJ8k4FUofUxs6wVCrTue+sA4Gwn7NrA1BxQHHh
	AOQX4gOBOz+b65OSb8QNe51cNLuNhQ4ujUFREKngnGaDHSNKLYiLlTyuQ1BccURT
	Q/ABOpk8wgCWIeDzjHsFmS2mwbCw0um+u01728yv5xT0D/H8f9PuYAnV0uzJY8GB
	xxdJkxB19SYkxmivJ1+48uAqcqGQu1ENIe5/CFPufHt6KgRxo0hUFUAaIifKmm60
	ZMl4ZF9UaBUga0PPh83bNJZpfmnGCxVZjXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657298354; x=1657384754; bh=Bt0vZIuA0Rz6B
	2Rlr6YNUv8F+fLJYzOFEfjBkkL+cAY=; b=b3ajPECKz9aHjqWA19Aga+aejWdNR
	ouc/27lMZ3zxZ8TodexAhgL90G85eNGXTcYtplRopFnzODsdtF+u/X9ZkjWB2lHt
	jJcP1rA3cDleZGOeguQqekN459aky+uFQ1KV3TQGUq9xUlfYnJyXC48E25UOouBg
	h07SslXAzHZ0xy280GaV2MlEnxnfb4dUZbuZq3vvHUDksVBiu603vmjOYQg4MjTq
	eki61S3Jp7oSpOgYgQy+s/zk2rZVbfNcKjWphn41SjZSWUdx3q28aagXOx0Cve5k
	Foi5cG3E3c+QrZbKlblOnfmhLbl32boJ9tgfttrx0TXLKrUAZb89ezY+A==
X-ME-Sender: <xms:sl3IYqXcFrf_idmnqS2HewEAUxaEmZHf8TF0aYIdlsgjYTmj2pRSIg>
    <xme:sl3IYmlMCkXjzHHkbnybE1G_GDZ8vWS8-ML89j5Hyy-ktRxHrrse2oyzPbBBtGPk5
    K0rCVQmL4WrVls>
X-ME-Received: <xmr:sl3IYuY2NRxKE2RJ-40auj1GM3wq_KCNouVobYimQoIlVROPiDi-1MOXTWG-G65oVBOKL6VG1gBz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedune
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:sl3IYhVw5iZd1HiXnLY577ROBady1khGBKwY-tviuACvy52gDptHJw>
    <xmx:sl3IYklbcF7_pKjWTr-qKXuewvmhghI6EWvvDe5_7xMYieE1hYECvQ>
    <xmx:sl3IYmcQDR6DWk1hKkBlK3M3HUF0gbnCjIdd-ly6k3wFUguBtwc1EA>
    <xmx:sl3IYia1uDAF4lyTeEzsEQpXWGZEzab0AYh4ypJA_3GqPz5Od67mMw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Linux kernel regressions <regressions@lists.linux.dev>,
	stable@vger.kernel.org,
	Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: [PATCH 5.10] Ignore failure to unmap -1
Date: Fri,  8 Jul 2022 12:37:48 -0400
Message-Id: <20220708163750.2005-5-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708163750.2005-1-demi@invisiblethingslab.com>
References: <20220708163750.2005-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Fixes: 79963021fd71 ("xen/gntdev: Avoid blocking in unmap_grant_pages()")
---
 drivers/xen/gntdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index f415c056ff8ab8d808ee2bacfaa3cad57af28204..54fee4087bf1078803c230ad2081aafa8415cf53 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -401,7 +401,8 @@ static void __unmap_grant_pages_done(int result,
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

