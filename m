Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D78716ECB
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541413.844233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460p-0005pu-R0; Tue, 30 May 2023 20:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541413.844233; Tue, 30 May 2023 20:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460p-0005m4-Mz; Tue, 30 May 2023 20:32:11 +0000
Received: by outflank-mailman (input) for mailman id 541413;
 Tue, 30 May 2023 20:32:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QB4=BT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q460n-0001yj-UB
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:32:09 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bda8dbd-ff29-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 22:32:08 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C38563200948;
 Tue, 30 May 2023 16:32:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 30 May 2023 16:32:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:32:05 -0400 (EDT)
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
X-Inumbo-ID: 0bda8dbd-ff29-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685478726; x=1685565126; bh=eT2dle5SRu
	lVFDzi62TQ1IQZDI2oVYJkexEdj7/Fslc=; b=TjsQAkSuKW8jtKf3DGsyG9k8zB
	Trnwh7BYpObxsovagPyZP1xIVriYTxgHNSH5nj9ifAbA9gdN6AbnhABYUrz7X2Zz
	KpEy+jDQaGp2QjfZ4PUwmZEO98fqknFuIn6qaYfZfNH4vntEEHsm4e4VAkqo4yo0
	PnkSH+j3F9HYaNylPFWtqgof0/h6RnGJmADeTa+W0iOQ/33+BsxtUOzDvpOhuWyA
	pRxIpcnJp87HASHTkoCnA+XuZLjzC5ReS3XQCm6OVf1wK7aoDpuRON/3CGE8D3hA
	TVOl0GJyhdVvxWcF1R6HiMZ2JYdtrEIzCiMn7PYtSWSKaryTZBhGxMxOJMpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685478726; x=
	1685565126; bh=eT2dle5SRulVFDzi62TQ1IQZDI2oVYJkexEdj7/Fslc=; b=f
	x+WGuknoInsViw78HCTgMny6arWnrKDaevCR8NIQfxAqzpjLevOC+ucbiCUnt8No
	wfD1dHHzk4dunu2DDvLgkxgvQcvcbLuITSJjFO1dZ6QYMU2EYxHMT4yLaVN4S07e
	YWJ37QTAJGrcHBVA4qwlGST9+Hu998Nj53zoG9/psvzFlUVLP7246H1dAOyf2cO6
	/TKVgGoVfRr6YDDbw7Wlv4ZUL1wEgu2LEIaitpXknaBbAtMtwdgCVZB86ZjR6/9s
	V6CvT6TpCsRdaZOMkl0LfAzvQUxC1DMUqe5tQBYSfFcaz8Jjc2YKLKxsMqowUIfF
	2SwuwNy1+1MMOXK1ij1PA==
X-ME-Sender: <xms:Rl12ZAr9aQWa_Qa0egkowH06KsJYmTHtkA-E1EAvwWLgM4WfnS7R1g>
    <xme:Rl12ZGrVpcCLx1UYJ8LeUhOzmhkSxM377BSRfIN9X1kgXYCC6gHdAwLxOekWNQZTl
    c4d2H3hYG3E9y8>
X-ME-Received: <xmr:Rl12ZFNycaVfEeQsS-3kpUA_-kT_bOrYQs8Q2OKWHBCjqSMutY820oVAFcuLdy_7KWZED9wrev0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedune
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:Rl12ZH6rawH_UPbQ1nJIN6Dg0_P60CEXYxgPhsCW7h8JmvVTYQOPbQ>
    <xmx:Rl12ZP78Vu93ETjN9w0f_BXL5M3BXAMEytqXeh_gjRJWPTkdz6CIeA>
    <xmx:Rl12ZHiIZA4a_gkn5vv5uueUjEU59j_7sw1bIyolyLBtoEN5Hzqz5Q>
    <xmx:Rl12ZCaON5yso2NsQujWogpPIv60NqpRS9-gP5P329739DVJCRA63A>
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
Subject: [PATCH v2 11/16] device-mapper: "." and ".." are not valid symlink names
Date: Tue, 30 May 2023 16:31:11 -0400
Message-Id: <20230530203116.2008-12-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using either of these is going to greatly confuse userspace, as they are
not valid symlink names and so creating the usual /dev/mapper/NAME
symlink will not be possible.  As creating a device with either of these
names is almost certainly a userspace bug, just error out.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/md/dm-ioctl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index 9ae00e3c1a72c19575814cf473774835b364320b..17ece816d490b6c40d019da131ade44c9a201dab 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -775,8 +775,10 @@ static int check_name(const char *name)
 		return -EINVAL;
 	}
 
-	if (strcmp(name, DM_CONTROL_NODE) == 0) {
-		DMERR("device name cannot be \"%s\"", DM_CONTROL_NODE);
+	if (strcmp(name, DM_CONTROL_NODE) == 0 ||
+	    strcmp(name, ".") == 0 ||
+	    strcmp(name, "..") == 0) {
+		DMERR("device name cannot be \"%s\", \".\", or \"..\"", DM_CONTROL_NODE);
 		return -EINVAL;
 	}
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


