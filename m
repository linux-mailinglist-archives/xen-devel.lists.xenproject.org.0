Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFF03E2919
	for <lists+xen-devel@lfdr.de>; Fri,  6 Aug 2021 13:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164702.301035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBxg2-0005Lv-7R; Fri, 06 Aug 2021 11:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164702.301035; Fri, 06 Aug 2021 11:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBxg2-0005K7-4G; Fri, 06 Aug 2021 11:06:10 +0000
Received: by outflank-mailman (input) for mailman id 164702;
 Fri, 06 Aug 2021 11:06:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZrF=M5=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1mBxg0-0005K1-AY
 for xen-devel@lists.xenproject.org; Fri, 06 Aug 2021 11:06:08 +0000
Received: from smtp-relay-canonical-0.canonical.com (unknown [185.125.188.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b56cc52-f6a6-11eb-9cc7-12813bfff9fa;
 Fri, 06 Aug 2021 11:06:05 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 9FA603F109; 
 Fri,  6 Aug 2021 11:06:01 +0000 (UTC)
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
X-Inumbo-ID: 4b56cc52-f6a6-11eb-9cc7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628247961;
	bh=l6Crxr7OCP95ZsjBftxKKMqfoQ4lcuoG+yhpbemOXu0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=oN0z2sFHSpBGlOta2FnY8Ao9EE9iL/YOWKCyNDeGYYEUhJ6mboXufR37rKoXie46e
	 bGlptR5u6SFgWmFqQ0OjHPdFD+RE6sH8BxMaeA76g+DaTsgnqkk5cEZkctoGneNWAw
	 jdLWxU2utggd6w3m2hIzw5Tsk5YAj5Z1QoVXDv2M0MfJfC+I5rr8NdiV0KUo0ZQzBS
	 exD5JhZQgi/Wsfp9beW6PUXQFR4n/fUFMpMa77pjV51FJpK2w6I26QZsIlbVHlDydk
	 /p7vDntJKfJ7qe4TOg9Q6MsLodm6QE1FXFvD46CzhElz3hfgEJCB6KrqkKs0IkCZDd
	 XxULMTABC5Cnw==
From: Colin King <colin.king@canonical.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen-blkfront: Remove redundant assignment to variable err
Date: Fri,  6 Aug 2021 12:06:01 +0100
Message-Id: <20210806110601.11386-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Colin Ian King <colin.king@canonical.com>

The variable err is being assigned a value that is never read, the
assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/xen-blkfront.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index d83fee21f6c5..715bfa8aca7f 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1092,7 +1092,6 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 	err = xlbd_reserve_minors(minor, nr_minors);
 	if (err)
 		return err;
-	err = -ENODEV;
 
 	memset(&info->tag_set, 0, sizeof(info->tag_set));
 	info->tag_set.ops = &blkfront_mq_ops;
-- 
2.31.1


