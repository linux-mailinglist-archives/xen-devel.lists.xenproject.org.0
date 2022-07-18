Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ED657894C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 20:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370007.601667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDVBM-0002e3-LH; Mon, 18 Jul 2022 18:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370007.601667; Mon, 18 Jul 2022 18:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDVBM-0002bx-HL; Mon, 18 Jul 2022 18:09:24 +0000
Received: by outflank-mailman (input) for mailman id 370007;
 Mon, 18 Jul 2022 18:09:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yO7Q=XX=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oDVBL-0001J5-IZ
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 18:09:23 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bee64ef5-06c4-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 20:09:21 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 498735C013B;
 Mon, 18 Jul 2022 14:09:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 18 Jul 2022 14:09:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 14:09:19 -0400 (EDT)
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
X-Inumbo-ID: bee64ef5-06c4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1658167760; x=1658254160; bh=kIshqhgj647286FiEwZIn8F2MuAyAKY1Gro
	0c4s+gcU=; b=p7zAmQtT9+CJjEyLPQ+PxSOJn5fhxPBbVLVhIAVWUZ73lievbgn
	CCqgqUru/ZzrVEMSEJF3C8JE0wmzWkevqvM8D2SoLWkbN6pG/A6IBvQ6KR+AZhFY
	c0OFwPViWbdkCD5KXHx6OfGH2rzkQsmekmjV/XkChERbIcXQ2kyi3Tkg0LjzPVjR
	hRsgIJli0KCFZnftCBch5X2ork23FTC+HtnyG65Ga/5KTtXAH9S+xlOx8rQC0zx5
	6ZZpw55H0OOhCpIgucHla+ZeQL7Kpsw+IipYPdtMnD4hCroe9YLBMJbyI46SXlqr
	XChU92pdUlY3U+RakilS+oP2nrjZ2n1+dmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1658167760; x=1658254160; bh=kIshqhgj64728
	6FiEwZIn8F2MuAyAKY1Gro0c4s+gcU=; b=JGVp7CSheLaV6MqKByzzgQEho/X9+
	KVrjZo3uBqMf9X5/vmx1BKgc5+lVGScWGKRLQ58tG9OSOyyIHXCeKdbvG89l8sfy
	KLlZPhmW/ocIZU7y+wKxANBEOmNhDt1SgELYmxuv6OHSNw0qJ0Ad9C8Yi0gTIjXm
	RmAR4zaHszLrvJx0Bay92XrxckkbfdcjQpnPIGwKS7I6/HzZSfNiBMH2Q/CpaLPM
	yqEcL61dihtXpzupcv7vC0CSFkK45wxpSIZwVatsxNfO8GeZlGhP5Jb4npEVGTZl
	OPxvEQlGc+xuiJLfBVT1kcHfs8QBzDfXU5QHVfNODSXCiiB1wAOuS52DA==
X-ME-Sender: <xms:0KHVYiziIHvB1pi8xnLzZXzYK6ipJ55JfsWoVGQsv1J7FiGUz4pw1A>
    <xme:0KHVYuTwueiXRSoQP7doQOh68pkVTYKn129Agb7d078SCZ-tS-P-L3xi7vgs1tAH1
    aw7GgSdLJmdBSk>
X-ME-Received: <xmr:0KHVYkXBKOfD769T9Zhj6aOsH_NH12yv3h-DuafP0cqtEUIngrvZit-ASjACcjjcQJFFs36A3UKh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:0KHVYoi0fVCsMeZcNg8CRhTCuWT7rTIqSsWFNoHW2hNh-smkkXlUcg>
    <xmx:0KHVYkDSW8-78-ec_pwQQXg4xP_xM4sC2JVbE41b6hsaHRFn8oU4vQ>
    <xmx:0KHVYpKh5JyF-INa5aRTMpt2umnD-_wkIlhMQihwu-UhTHfVv1ewtg>
    <xmx:0KHVYn9975L1yeESP7AGLSAEcFkbuKMu5HYxEyQkaplggKdTUiAECQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	stable@vger.kernel.org
Subject: [PATCH 4/5] Ignore failure to unmap -1
Date: Mon, 18 Jul 2022 14:08:21 -0400
Message-Id: <20220718180820.2555-5-demi@invisiblethingslab.com>
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
Fixes: ee25841221c1 ("xen/gntdev: Avoid blocking in unmap_grant_pages()")
---
 drivers/xen/gntdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index f464793477650e631c8928e85c1990c5964c2e94..bba849e5d8a7b4d54925b842fbe3c6792e0f0214 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -413,7 +413,8 @@ static void __unmap_grant_pages_done(int result,
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

