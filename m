Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08285AF6FF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400142.641792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHs-0008Q9-Ch; Tue, 06 Sep 2022 21:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400142.641792; Tue, 06 Sep 2022 21:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHs-0008MW-7G; Tue, 06 Sep 2022 21:39:16 +0000
Received: by outflank-mailman (input) for mailman id 400142;
 Tue, 06 Sep 2022 21:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hbfa=ZJ=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oVgGA-0000Cs-JT
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:37:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eee24f9-2e00-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 18:24:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5EA6614A7;
 Tue,  6 Sep 2022 16:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D5CC433C1;
 Tue,  6 Sep 2022 16:24:22 +0000 (UTC)
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
X-Inumbo-ID: 5eee24f9-2e00-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662481463;
	bh=I9HEnsbD64k69AXnJTEmM71NuSK/jsrCbllGo7OZAcE=;
	h=From:To:Cc:Subject:Date:From;
	b=oGNhKoZ23xmRmuMfF5By9jdWcF+k0B2GSVOYstp81XQgpGtsjDdL+emiHg7zYoqMj
	 IflTD2XbgUMEVE/Eq55++YXOFYXbNtIs8Gmh4D6kxh0WCjoFV2wYWFFrXiAIP0sotW
	 sVPNy5kCa//2GRAZX2RitE35UUcpj++7o4GjeAnIO5cfR6zH3DGGR6970lnX1UCQ7G
	 lzKflOjgv6TtMc7FcduohNII9+XludVGhDPdV8Q4YxDYfRfUE0PCsybDCpBZjUn0dx
	 +ZQxwz7p95fO4m4IyNAHH1pMMwsmcNjx3DNhIWXEM4EfoVws9j9iTM1KyjDy5d4N/t
	 udVbnIp9osezw==
From: SeongJae Park <sj@kernel.org>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	SeongJae Park <sj@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-stable-5.10.y] xen-blkfront: Cache feature_persistent value before advertisement
Date: Tue,  6 Sep 2022 16:24:14 +0000
Message-Id: <20220906162414.105452-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

commit fe8f65b018effbf473f53af3538d0c1878b8b329 upstream.

Xen blkfront advertises its support of the persistent grants feature
when it first setting up and when resuming in 'talk_to_blkback()'.
Then, blkback reads the advertised value when it connects with blkfront
and decides if it will use the persistent grants feature or not, and
advertises its decision to blkfront.  Blkfront reads the blkback's
decision and it also makes the decision for the use of the feature.

Commit 402c43ea6b34 ("xen-blkfront: Apply 'feature_persistent' parameter
when connect"), however, made the blkfront's read of the parameter for
disabling the advertisement, namely 'feature_persistent', to be done
when it negotiate, not when advertise.  Therefore blkfront advertises
without reading the parameter.  As the field for caching the parameter
value is zero-initialized, it always advertises as the feature is
disabled, so that the persistent grants feature becomes always disabled.

This commit fixes the issue by making the blkfront does parmeter caching
just before the advertisement.

Fixes: 402c43ea6b34 ("xen-blkfront: Apply 'feature_persistent' parameter when connect")
Cc: <stable@vger.kernel.org> # 5.10.x
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: SeongJae Park <sj@kernel.org>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Link: https://lore.kernel.org/r/20220831165824.94815-4-sj@kernel.org
Signed-off-by: Juergen Gross <jgross@suse.com>
---

This patch is a manual backport of the upstream commit on the 5.10.y
kernel.  Please note that this patch can be applied on the latest 5.10.y
only after the preceding patch[1] is applied.

[1] https://lore.kernel.org/stable/20220906132819.016040100@linuxfoundation.org/

 drivers/block/xen-blkfront.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 9d5460f6e0ff..6f33d62331b1 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1852,6 +1852,12 @@ static void free_info(struct blkfront_info *info)
 	kfree(info);
 }
 
+/* Enable the persistent grants feature. */
+static bool feature_persistent = true;
+module_param(feature_persistent, bool, 0644);
+MODULE_PARM_DESC(feature_persistent,
+		"Enables the persistent grants feature");
+
 /* Common code used when first setting up, and when resuming. */
 static int talk_to_blkback(struct xenbus_device *dev,
 			   struct blkfront_info *info)
@@ -1943,6 +1949,7 @@ static int talk_to_blkback(struct xenbus_device *dev,
 		message = "writing protocol";
 		goto abort_transaction;
 	}
+	info->feature_persistent_parm = feature_persistent;
 	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
 			info->feature_persistent_parm);
 	if (err)
@@ -2019,12 +2026,6 @@ static int negotiate_mq(struct blkfront_info *info)
 	return 0;
 }
 
-/* Enable the persistent grants feature. */
-static bool feature_persistent = true;
-module_param(feature_persistent, bool, 0644);
-MODULE_PARM_DESC(feature_persistent,
-		"Enables the persistent grants feature");
-
 /**
  * Entry point to this code when a new device is created.  Allocate the basic
  * structures and the ring buffer for communication with the backend, and
@@ -2394,7 +2395,6 @@ static void blkfront_gather_backend_features(struct blkfront_info *info)
 	if (xenbus_read_unsigned(info->xbdev->otherend, "feature-discard", 0))
 		blkfront_setup_discard(info);
 
-	info->feature_persistent_parm = feature_persistent;
 	if (info->feature_persistent_parm)
 		info->feature_persistent =
 			!!xenbus_read_unsigned(info->xbdev->otherend,
-- 
2.25.1


