Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED8F716EB4
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:32:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541395.844132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460Q-000223-9z; Tue, 30 May 2023 20:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541395.844132; Tue, 30 May 2023 20:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460Q-0001zH-6c; Tue, 30 May 2023 20:31:46 +0000
Received: by outflank-mailman (input) for mailman id 541395;
 Tue, 30 May 2023 20:31:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QB4=BT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q460P-0001yj-1Q
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:31:45 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc04f68a-ff28-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 22:31:42 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 26C5032005C1;
 Tue, 30 May 2023 16:31:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 30 May 2023 16:31:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:31:38 -0400 (EDT)
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
X-Inumbo-ID: fc04f68a-ff28-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685478699; x=1685565099; bh=aSjkzE25S8
	BxmyJfHmxx2kjK812O0BGlmJS9UYp63Y4=; b=iK+uxXhV6X4xM7zdOsRLRNl7Rl
	GeCaXb9nofcQLJMH5PYa8rM5mPH1np/a+6qzHLKH/xgr4kR4IXAg30xdIqri75uf
	f/HA4WZkCSFcOo7cNqUyy8XM/mAA5BKtkkdZ1PCLM6dnhelU1vC8pavl7AWFfugt
	4sRiOO97mcVcpXj5MGvFR7i96rhwtfyMeXrQMUlsQduztFxlYcDLQG/EDvZSk3wq
	x92Oroq+S25UkVnqRiLhrdY1NyoS9E0KaGS1k185wNunE+FkLZv0bi0cekflq7QK
	YcsOdasoRS8hfC8B5I4G2Y5doOhecSPGwC5fQwkbDtySEHXq8JzjTicIZO5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685478699; x=
	1685565099; bh=aSjkzE25S8BxmyJfHmxx2kjK812O0BGlmJS9UYp63Y4=; b=f
	Zri7GXfSSveOOtYOhvOUEtsANsXmWURASgkB/lbtLP/WL+xtmXsMnGdWCIJvHxk9
	3P4owz460lQ0tIW2GadrRZrHamxcLGygApj4txw8+S26mwTJy70Xa5MgAmR7OD28
	3BQxHlhnew0PgxDnyK6jr8OsOqZ89aJi5/efdD/8P7nMYdHdPt9KGKs8Fpq9Gt2K
	0fZnUTtGA/5zoxj5fzQ1MjgpSQTy7yTSwtJplgo44KMf2SM3jJ6mFQ4hQbuicwEG
	2NH0Z9/cMmeK3OtsVQ7bqYjG2KfdqSm8iVBn9slACvUrWPUr7xWilidlX88F519A
	zhCVORCXIU4SPKqCtRt2A==
X-ME-Sender: <xms:K112ZNLdk7wSJASVb91a04jG4oflO_XcOFaiSvkBTykdbHCVNggo6w>
    <xme:K112ZJI6zgUEzXAHeDV5KaRENmzmZJKK0SSdpBSaQmgoSdJ5yLXrxeq7Hsavz2EHD
    3MPAtXfus4r32E>
X-ME-Received: <xmr:K112ZFt0ZlOK8gkZQh9dbasyotJ1vU7m9y9SUbnCFXx7UUbjsnujiJQOQn0pH30DleIzc3IrecY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:K112ZOa48AE4ZVOlNQI--xrDOF3nPXzQfahOf1ELK_GIz23fXPAnHA>
    <xmx:K112ZEYi6T0TChdOca6-6colnmqEJiG9Bi3CTwZBPyClLrhgw-QmZw>
    <xmx:K112ZCAYfZ5lmE6T25N3tVSR69c_BbGJ6sC2B9IpBSRuupCOGSXAdQ>
    <xmx:K112ZKMp1wowIzo5DcMQ7w40nQAFGFn6_yoXvmSQVFYk44IdGB8nAA>
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
	xen-devel@lists.xenproject.org,
	stable@vger.kernel.org
Subject: [PATCH v2 02/16] device-mapper: Avoid pointer arithmetic overflow
Date: Tue, 30 May 2023 16:31:02 -0400
Message-Id: <20230530203116.2008-3-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Especially on 32-bit systems, it is possible for the pointer arithmetic
to overflow and cause a userspace pointer to be dereferenced in the
kernel.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
---
 drivers/md/dm-ioctl.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index 34fa74c6a70db8aa67aaba3f6a2fc4f38ef736bc..64e8f16d344c47057de5e2d29e3d63202197dca0 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -1396,6 +1396,25 @@ static int next_target(struct dm_target_spec *last, uint32_t next, void *end,
 {
 	static_assert(_Alignof(struct dm_target_spec) <= 8,
 		      "struct dm_target_spec has excessive alignment requirements");
+	static_assert(offsetof(struct dm_ioctl, data) >= sizeof(struct dm_target_spec),
+		      "struct dm_target_spec too big");
+
+	/*
+	 * Number of bytes remaining, starting with last. This is always
+	 * sizeof(struct dm_target_spec) or more, as otherwise *last was
+	 * out of bounds already.
+	 */
+	size_t remaining = (char *)end - (char *)last;
+
+	/*
+	 * There must be room for both the next target spec and the
+	 * NUL-terminator of the target itself.
+	 */
+	if (remaining - sizeof(struct dm_target_spec) <= next) {
+		DMERR("Target spec extends beyond end of parameters");
+		return -EINVAL;
+	}
+
 	if (next % 8) {
 		DMERR("Next target spec (offset %u) is not 8-byte aligned", next);
 		return -EINVAL;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


