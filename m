Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F16716EB5
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:32:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541397.844153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460S-0002X3-Q2; Tue, 30 May 2023 20:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541397.844153; Tue, 30 May 2023 20:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460S-0002VD-Lw; Tue, 30 May 2023 20:31:48 +0000
Received: by outflank-mailman (input) for mailman id 541397;
 Tue, 30 May 2023 20:31:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QB4=BT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q460Q-0001iX-Su
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:31:46 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fde95d2e-ff28-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 22:31:45 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 07F803200914;
 Tue, 30 May 2023 16:31:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 30 May 2023 16:31:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:31:41 -0400 (EDT)
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
X-Inumbo-ID: fde95d2e-ff28-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685478702; x=1685565102; bh=pmcUjAGIZx
	Pp5PqEOgEqhVPemyqe9EdThZVOp4My7W0=; b=dxLeUTcWcURIKF3tIdl1etnJR5
	N5UmHb7gYi+h6qFr1h6Z9SC0wxIykswHISO17mCPtNq0NeJ2R7ZcfGGhLXwnTney
	w8vxVkRbqSYZPBXyoXLHByjIvnG7lVS1jupBNpog/rJiveBJkSUPozGoVJ7YSQ2s
	5WwQwq4OgSFQTe9eiKn7KoyWGFsUiGRonLvgMZjB7AU41/HyAj9TrO8UFizlMc2Z
	kjC/rqLsVAqk9UrzpS9OE5eKXjHUQXPwX7RzgO3B8+rrUSBY/uIyHCeXOIFrFBUx
	973IopAKjgCl01cB9/nuRm3U4VY/cNn+Itf/ju/WYCERZTrBTExuvORyanOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685478702; x=
	1685565102; bh=pmcUjAGIZxPp5PqEOgEqhVPemyqe9EdThZVOp4My7W0=; b=R
	UawBqS8r1YDIM4po3y2qsUXbp4zg/tVMtIWDUkXk2Kttv3pfjWUl31EWtaAo+jxK
	/kXxCsfVJzLogYbQFIxM2poNZdJNrkxjSdHCH5xBtj6GqDUUr/oIGSviHONsPWSr
	5v6LrhEM6HNy5GTorYKFgU7SqRGmewjInn2Q1ucsg36zNhg2F569jrlQRLrzGISB
	VIPuAEgV8JZufoZHXDa5LvBF0VsBt0uhRJzkJEAj0jc5U4TnTzHUo0/sRvcLbXSc
	m5CjwzswZE+AcQvkKG85UgCo8pJ17KM+Ph8DKWcmh0kLvVw8cL/Rv4b9TOLUJLWc
	mOiGUxDYt8n0bB7FAA8WA==
X-ME-Sender: <xms:Ll12ZG3ypkz4lUPkIh0DuuQJncBHG735YKqtwU_ktkPdRq3r_9RvgA>
    <xme:Ll12ZJFCVeuAe8Vsr8iAvdOZolH1VlPf7VqJi3_telOOU7kNKuGYsc6DpT14VVJ1H
    FGXcz41JK2iJiQ>
X-ME-Received: <xmr:Ll12ZO71J-CEsAY4_Mr_pTBBQiwUFmjqPIVJ-vTjQf3Y3pRLiM1GadCnVubwZ2flnJFCr-gRBvM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:Ll12ZH32Qri6hjgGiJ0FllRPCLo39f-5qy7T3uCDJ8LU5VX4h79TIg>
    <xmx:Ll12ZJEFd3tCtAnkRbIsBqGjfGNkEmSNFU7LjPpUMlqH7CTGrgKV0Q>
    <xmx:Ll12ZA9BQOHMzZIe_5G8lnEVFKz0d1wcyoVCA08ic3b5UkqDI5J22w>
    <xmx:Ll12ZPY1mCG9yLlRFWakggEPeJhZj6eEHLmC5CNrACfoZ9SfSMTPtg>
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
Subject: [PATCH v2 03/16] device-mapper: do not allow targets to overlap 'struct dm_ioctl'
Date: Tue, 30 May 2023 16:31:03 -0400
Message-Id: <20230530203116.2008-4-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This prevents dm_split_args() from corrupting this struct.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
---
 drivers/md/dm-ioctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index 64e8f16d344c47057de5e2d29e3d63202197dca0..a1d5fe64e1d0d9d3dcb06924249b89fe661944ab 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -1444,6 +1444,12 @@ static int populate_table(struct dm_table *table,
 		return -EINVAL;
 	}
 
+	if (next < sizeof(struct dm_ioctl)) {
+		DMERR("%s: first target spec (offset %u) overlaps 'struct dm_ioctl'",
+		      __func__, next);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < param->target_count; i++) {
 
 		r = next_target(spec, next, end, &spec, &target_params);
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


