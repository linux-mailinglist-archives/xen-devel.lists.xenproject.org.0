Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088D156D1B4
	for <lists+xen-devel@lfdr.de>; Sun, 10 Jul 2022 23:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364751.594671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAetc-0006Ki-Gz; Sun, 10 Jul 2022 21:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364751.594671; Sun, 10 Jul 2022 21:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAetc-0006I6-E0; Sun, 10 Jul 2022 21:55:20 +0000
Received: by outflank-mailman (input) for mailman id 364751;
 Sun, 10 Jul 2022 21:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tZ0e=XP=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oAeta-0006I0-2Y
 for xen-devel@lists.xenproject.org; Sun, 10 Jul 2022 21:55:18 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f936e5c5-009a-11ed-924f-1f966e50362f;
 Sun, 10 Jul 2022 23:55:13 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 02C375C00CD;
 Sun, 10 Jul 2022 17:55:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 10 Jul 2022 17:55:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 17:55:11 -0400 (EDT)
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
X-Inumbo-ID: f936e5c5-009a-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm2; t=1657490111; x=
	1657576511; bh=bYOYM3GJ4HWkYd9UXZfvKiZiP3sprP1rEpmhtfOFK64=; b=j
	Lqce5XkEg5NecSrWF/ZNV9oQHlQQ3GQwHTc/gapx6tjo0+tJg7/HHKnOK/q52nOi
	GeRlf+BOrE30UEjcGF9o991q4uADYBGc8s3A0SS4jDNFX5/xroAqHpdz7nszH3pz
	wj4bVFYHflH4vD+8JF3XXk+evdFsGyPlozvVri/T3vMLpZtM5gcg8et9OU3lp+BD
	Hz1Gy1fwVdOdXAukQp+Up+qxmCF+oCUW1uyvqbEGPmW/LvPsSq2K4N21IKt8LnLB
	tMa7XOruY+7+F0UqXrEgHDQ83rF7DKLIp93mQlezxl2WnGWvU5Hzkvvf45V8+mgN
	8yQQqmZDKoYx5lbB/6eWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1657490111; x=1657576511; bh=bYOYM3GJ4HWkYd9UXZfvKiZiP3sprP1rEpm
	htfOFK64=; b=0as6LkJDhNwIofcsWDFsJRMrgeUub4XTmSzrAHgZp2YHey+HExs
	h1LIFGSid3YuYbLt1xcMURPi37PC/YYWvG0YFRVypPlKjDrZbz00aorOEhQjgkkH
	FXaFMsgE3OTaCagnWfl4FiGY6+y07uuAMYx90zW1Db/L2gzhteQbykLJIO4yBrnj
	8pKvnlfTuq6cwXKB+HnAtUYAo/LQge5PGXOWuZN+nySxr5bZiTAC7re6TUWS7IG/
	xcaTYqyjtyVzlAEoogDL4UBta8gXhUn4Z5dxH9M8u5yPqfDiEZkoskTDUu18j20S
	L58itg4AlLKu41DqFQzWc1z3n8KBAOAvxNQ==
X-ME-Sender: <xms:v0rLYiXqdi6NJSbRdYJmrkW2Z5WvFEDmAxbqxycEbQFRPBrmFKXiuA>
    <xme:v0rLYukLEdeGwx1GBOCOpNVCUrsne9EgoLJ2dI4BLcctF-8mAgXkuvBqt7dSOBhAG
    axUODUnC3ZoP3M>
X-ME-Received: <xmr:v0rLYmbAIeOlRa-Sc1x6CyVwtKNIRFqxP8IONab5GgquAqyyV7E8WnbYeHYKA51WJPOIof5NOop1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepvdefgeekvdekgfffgeekhfeijedtffek
    hefhleehfeejueetgfelgefgtdevieelnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:v0rLYpX7JR83nx0pP35LjqP9081tCjFv0uFV-lWvH3a7c0r2KEVATw>
    <xmx:v0rLYsnA08J8QUFc5WF8M2CuoowDtVLgOGMpGqmfkk_v21BmcSIOrw>
    <xmx:v0rLYudHkLtJ34oE0Rz2vkHA9vZSJM8sdgk1Nf9fbZE6b7ia7lS1vA>
    <xmx:v0rLYtAiGyRkdkinWa-hr5BI4ZGN9IaMjdc33Ytk0nykjkqN3ihdSQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v10] xen/gntdev: Ignore failure to unmap INVALID_GRANT_HANDLE
Date: Sun, 10 Jul 2022 17:54:37 -0400
Message-Id: <20220710215437.1351-1-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error paths of gntdev_mmap() can call unmap_grant_pages() even
though not all of the pages have been successfully mapped.  This will
trigger the WARN_ON()s in __unmap_grant_pages_done().  The number of
warnings can be very large; I have observed thousands of lines of
warnings in the systemd journal.

Avoid this problem by only warning on unmapping failure if the handle
being unmapped is not INVALID_GRANT_HANDLE.  The handle field of any
page that was not successfully mapped will be INVALID_GRANT_HANDLE, so
this catches all cases where unmapping can legitimately fail.

Suggested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: stable@vger.kernel.org
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Fixes: dbe97cff7dd9 ("xen/gntdev: Avoid blocking in unmap_grant_pages()")
---
 drivers/xen/gntdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 4b56c39f766d4da68570d08d963f6ef40c8d9c37..44a1078da21b8a2333b4432900a8dbdfb8e13c53 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -396,13 +396,15 @@ static void __unmap_grant_pages_done(int result,
 	unsigned int offset = data->unmap_ops - map->unmap_ops;
 
 	for (i = 0; i < data->count; i++) {
-		WARN_ON(map->unmap_ops[offset+i].status);
+		WARN_ON(map->kunmap_ops[offset + i].status != GNTST_okay &&
+			map->kunmap_ops[offset + i].handle != INVALID_GRANT_HANDLE);
 		pr_debug("unmap handle=%d st=%d\n",
 			map->unmap_ops[offset+i].handle,
 			map->unmap_ops[offset+i].status);
 		map->unmap_ops[offset+i].handle = INVALID_GRANT_HANDLE;
 		if (use_ptemod) {
-			WARN_ON(map->kunmap_ops[offset+i].status);
+			WARN_ON(map->kunmap_ops[offset + i].status != GNTST_okay &&
+				map->kunmap_ops[offset + i].handle != INVALID_GRANT_HANDLE);
 			pr_debug("kunmap handle=%u st=%d\n",
 				 map->kunmap_ops[offset+i].handle,
 				 map->kunmap_ops[offset+i].status);
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

