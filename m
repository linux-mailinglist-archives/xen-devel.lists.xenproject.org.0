Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A954A716ECA
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:32:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541410.844223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460o-0005Vs-C1; Tue, 30 May 2023 20:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541410.844223; Tue, 30 May 2023 20:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460o-0005Sr-7O; Tue, 30 May 2023 20:32:10 +0000
Received: by outflank-mailman (input) for mailman id 541410;
 Tue, 30 May 2023 20:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QB4=BT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q460m-0001iX-Nd
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:32:08 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a5c0882-ff29-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 22:32:06 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id F2B183200930;
 Tue, 30 May 2023 16:32:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 30 May 2023 16:32:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:32:02 -0400 (EDT)
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
X-Inumbo-ID: 0a5c0882-ff29-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685478723; x=1685565123; bh=rwGIL/9NRS
	MhUwVWwsxjoxS5AMM8VOhnzZgHY9xGhxg=; b=qkBueq2r2OyWcbusDQUrjajFFr
	8ESqGro3ggJwym7lFf9BI9ESX7xekhNhstWp8F1ueTG3NmoZqthNHTWOXbCGq5Vw
	67eIWybB+EGrobvjODoQqwC70WtdLXTl2k5nQabcp3ZQs/dQWH2f+QrTvapYJOrW
	JrHz90N9W+aLbcMlDjF0cjaNT1cyK5hLdd/RpV3VjOJWSictxkSNvJ89RwdrBPZG
	E9Kxm85hwY5s7dhDK62GqfSywSV09msrreFFwcypf91DJsdE3WhAfmU038D6fTNC
	IJwxS9XPoI4erBBQzlRsVtR6w58sX6QtAWlnzP3FUVoK+Ii+7VvWyJVHGyBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685478723; x=
	1685565123; bh=rwGIL/9NRSMhUwVWwsxjoxS5AMM8VOhnzZgHY9xGhxg=; b=y
	4N/s9MUZzZd4QAK3LutuCyRwXJa6PV0apyBdJJ0IvWA7d2gGhkz/XsZL7+VJH2SG
	iOcTbZxxHnngGWA/vK1Cy/hWHcqG4/qzaYGV3DdLfQBhITU6JQPFY6rYK8F78XZs
	GsFx5qwOlj2SIdDWk5FlJyasxkbCa3R96lDH1Hm2Dvhf2k7z0wpQK4fuV1Q/mMRI
	fUSMAzPyoOA+uwmX+9p0bB+XYk6wNk3PB/5bWjVYO6PrYeHoE9udaLaxIrHaFqnW
	IaScZZBdVbuKJ7vOHjBpV2ygqFDhJvzlolEe5vP4KmsAbmnCAoIBk1ZiIgIsCNXl
	w1VoeHG8LsGkBO7eC24Bg==
X-ME-Sender: <xms:Q112ZMJhVikC1UrX3Mb_HLcgL_u4cRjw7_2N3_37WA8f1GdiBc0pnw>
    <xme:Q112ZMIHatiw5Vza07l_H3J8Q5Jo6SiJ0JklzDq2oVq19WcxL7-SLcq2Z6xIGOn9e
    WudhjdY1xw9uGw>
X-ME-Received: <xmr:Q112ZMvxVcJBiasn5UFXjTImzNzJJWI7pNevtYfQQmMTBB-b8IybX_PYolTn_jMKlOzP0fkNc-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:Q112ZJbB2ysOiize_ujypULuG_R3Cn4Yq-9hscSDMSK5ll_YW10Haw>
    <xmx:Q112ZDb1CeOkQsN1ioyuZQeKryd91axJ67ADAgGmg8uxAd6cVc2vzw>
    <xmx:Q112ZFCIOgBVdd0gvdQPehRl4EuciVdHt2_LQ9qvpSUR9DQCv8tXpQ>
    <xmx:Q112ZH4GTf0whc09NpBt8a1c0iKBwD4CvlewH7ytbqUM7jnZPa7ciw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jens Axboe <axboe@kernel.dk>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 10/16] device-mapper: Refuse to create device named "control"
Date: Tue, 30 May 2023 16:31:10 -0400
Message-Id: <20230530203116.2008-11-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Typical userspace setups create a symlink under /dev/mapper with the
name of the device, but /dev/mapper/control is reserved for the control
device.  Therefore, trying to create such a device is almost certain to
be a userspace bug.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/md/dm-ioctl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index 52aa5505d23b2f3d9c0faf6e8a91b74cd7845581..9ae00e3c1a72c19575814cf473774835b364320b 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -771,7 +771,12 @@ static int get_target_version(struct file *filp, struct dm_ioctl *param, size_t
 static int check_name(const char *name)
 {
 	if (strchr(name, '/')) {
-		DMERR("invalid device name");
+		DMERR("device name cannot contain '/'");
+		return -EINVAL;
+	}
+
+	if (strcmp(name, DM_CONTROL_NODE) == 0) {
+		DMERR("device name cannot be \"%s\"", DM_CONTROL_NODE);
 		return -EINVAL;
 	}
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


