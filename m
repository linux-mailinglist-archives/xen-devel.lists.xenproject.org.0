Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C280C716EF0
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541431.844245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4663-0000DV-Ho; Tue, 30 May 2023 20:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541431.844245; Tue, 30 May 2023 20:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4663-0000BV-AV; Tue, 30 May 2023 20:37:35 +0000
Received: by outflank-mailman (input) for mailman id 541431;
 Tue, 30 May 2023 20:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QB4=BT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q460w-0001yj-7o
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:32:18 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10f33985-ff29-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 22:32:17 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4714F3200941;
 Tue, 30 May 2023 16:32:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 30 May 2023 16:32:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:32:14 -0400 (EDT)
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
X-Inumbo-ID: 10f33985-ff29-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685478734; x=1685565134; bh=g5zq4E4lPj
	cpxmqA493MTNjpJWMfGCfLjfMtSBIRfwE=; b=btbUEJhZQrCus6G2cmEF0UCOcj
	HNQw5o5uoDqCKaQPz1xaoENxf/gqQkjPOKEpiYtWko86dN7B8bAa/1edBnKcRD7G
	oQ35bPjRiDM3Jv8XO1PvPnA7DMenzs5QntueBspv43BZbVUDcRuKnOjgJrhEm+4R
	rrkZDloEyf4nIxvooH5WoAn0qyYo1buSox+f90jbf6nqe8FEXeQXhcBszbyjJ0PT
	OKbXpnhvHop3pjBRjTF1k5EOi6rr3vwj7D2WCRY0I3CPSydA9M5iRpuK60HEX8jy
	2JVKqdSSuG8cj0Mk9QjkKkJcPE3ivgkave7ORC7XdxNQ5YP17scWJOh05bXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685478734; x=
	1685565134; bh=g5zq4E4lPjcpxmqA493MTNjpJWMfGCfLjfMtSBIRfwE=; b=H
	SuVjZAMaB+BwxGijqAt8c9WB79vIciVrFRlLtCOky9UQfMhAcjJT6a0VfxdmETVV
	8nEF3+nsP3QXtkVaQ9HylXOplwnBU37jG6FMC+6U3sAiOJR8vllWwxVRB/bJAJGE
	o8bZWd+Fr97H/XWkQ3GYu4EmvQTHh7b+bAUlYcKH2xBKKmp1xkiy2sC9i429aUhn
	bZzm0AYgIdeait5fZO9zhL7go84uaGta1a6TuurzUQSKqG7xTdxpGanhw3S6PklV
	3SdizlKHz/Q1lWeSqDcVd6A7ngssgCYCwK1H8wUbPyw4kwtT5lUkDxT+HIHKtiXM
	h1f1eXwlT0CBcdLaEOlRQ==
X-ME-Sender: <xms:Tl12ZLCrjMwa5dd8nXInpbI80j8aks7WDHGQdC47Q6JkvDKgesheeg>
    <xme:Tl12ZBhWW6gzbLQXIBx87Wn5FhMOV1Jmqe7Bu4LvPr1RNpfkJmMNYXM8yoX9-WtnK
    KOwvl36hcRBn78>
X-ME-Received: <xmr:Tl12ZGmQvePgFgiwvtACF3E10lqS1U8ApvlnKupnDUwSSod63Ptq06kbfUX7FZofZWiSkLg8hdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedvne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:Tl12ZNw-JLuG8i_8xOIdX4SeeayTYC2T2NBU3vVW_z588mtnm1MNXQ>
    <xmx:Tl12ZAQw_DXvdm36tgmR2p2Ev34IIuqgkFUOmqOOyl5qMY21MCCl5Q>
    <xmx:Tl12ZAamGsz2l8le4BoAmD-xKUjEfjqYwtGU3y6fUVm9ndKsvfHsDw>
    <xmx:Tl12ZFSWJmukln6Pasz6VSPEKly6NXMAjEHrAUW2zz3CBGO838Esww>
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
Subject: [PATCH v2 14/16] block, loop: Increment diskseq when releasing a loop device
Date: Tue, 30 May 2023 16:31:14 -0400
Message-Id: <20230530203116.2008-15-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous patch for checking diskseq in blkback is not enough to
prevent the following race:

1. Program X opens a loop device
2. Program X gets the diskseq of the loop device.
3. Program X associates a file with the loop device.
4. Program X passes the loop device major, minor, and diskseq to
   something, such as Xen blkback.
5. Program X exits.
6. Program Y detaches the file from the loop device.
7. Program Y attaches a different file to the loop device.
8. Xen blkback finally gets around to opening the loop device and checks
   that the diskseq is what it expects it to be.  Even though the
   diskseq is the expected value, the result is that blkback is
   accessing the wrong file.

To prevent this race condition, increment the diskseq of a loop device
when it is detached from its file descriptor.  This causes blkback (or
any other program, for that matter) to fail at step 8.  Export the
inc_diskseq() function to make this possible.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
I considered destroying the loop device altogether instead of bumping
its diskseq, but was not able to accomplish that.  Suggestions welcome.
---
 block/genhd.c        | 1 +
 drivers/block/loop.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/block/genhd.c b/block/genhd.c
index 1cb489b927d50ab06a84a4bfd6913ca8ba7318d4..c0ca2c387732171321555cd57565fbc606768505 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1502,3 +1502,4 @@ void inc_diskseq(struct gendisk *disk)
 {
 	disk->diskseq = atomic64_inc_return(&diskseq);
 }
+EXPORT_SYMBOL(inc_diskseq);
diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index bc31bb7072a2cb7294d32066f5d0aa14130349b4..05ea5fb41508b4106f184dd6b4c37942716bdcac 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1205,6 +1205,12 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
 	if (!part_shift)
 		set_bit(GD_SUPPRESS_PART_SCAN, &lo->lo_disk->state);
 	mutex_lock(&lo->lo_mutex);
+
+	/*
+	 * Increment the disk sequence number, so that userspace knows this
+	 * device now points to something else.
+	 */
+	inc_diskseq(lo->lo_disk);
 	lo->lo_state = Lo_unbound;
 	mutex_unlock(&lo->lo_mutex);
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


