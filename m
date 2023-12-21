Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8043381AE62
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 06:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658450.1027599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGBdc-0000Pm-SO; Thu, 21 Dec 2023 05:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658450.1027599; Thu, 21 Dec 2023 05:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGBdc-0000NS-P7; Thu, 21 Dec 2023 05:30:28 +0000
Received: by outflank-mailman (input) for mailman id 658450;
 Thu, 21 Dec 2023 03:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fZmI=IA=gmail.com=haokexin@srs-se1.protection.inumbo.net>)
 id 1rG9fU-0002cf-7o
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 03:24:16 +0000
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69f05a7b-9fb0-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 04:24:14 +0100 (CET)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6dbb7d80df8so110494a34.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 19:24:14 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com.
 [147.11.105.121]) by smtp.gmail.com with ESMTPSA id
 t26-20020a62d15a000000b006d757ef7541sm513489pfl.209.2023.12.20.19.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 19:24:12 -0800 (PST)
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
X-Inumbo-ID: 69f05a7b-9fb0-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703129053; x=1703733853; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzObqHbWeNKxitmoVg0oGbTzko+SYVdSYHcCza/qiow=;
        b=WS9TwwnxGOkardc9566wmrrVjlDBjx+GnzYuFA40CHDi+FjWADCPibY+P+ECGlF1F7
         lAiuPQOsDFh/Vk9ZEN5K1LZ3bjhSdgEAgisfF3Tc36RphmW5BYzD6KPfHcI8DCU+JFas
         q19jxmhthLw65jw85oR1kPAxgPHC0JCju3QAzlfLVNj/+4Cot/yp4Y78YNs+0j5INaS1
         RFVpkfxpQehllgcEacC2tJhtQSmk3TTKQeLtXBMlyXO3BdbLtdAmeoyrmOXLVL+P3oRu
         7wTI7S0EijJYpHawaLIAlsG2OjgmPrUlxcL1D5onMOAflU6qL6gngrkfnzRM0OpTKLjm
         JOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703129053; x=1703733853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzObqHbWeNKxitmoVg0oGbTzko+SYVdSYHcCza/qiow=;
        b=mY1kU9kCHRKdCi3oQda0LZn7gVgJQEuY18oVrRT8M/cAg7KaugOOl3LTc1ctyI1hiN
         u4Q10h7uD02I6U/81hx4a4W8n/85mZPBxJq+wnZnFmfLaPwwjWm3KLTxKaS1Rn1sAJj+
         yv5Mur8ExP74XaRTX74OX0R0DhtgLOhr3bdsVYkg5BdykmeMCQh3gK3unJjFJYROIUqQ
         fjg5NktHdRz/vJQKq/GajDgoaL0CvPz5LH73vRnIRV3H5D0aD0/zQdu0fpAeqpwxkgyR
         Br5jtTcJWO2bctQEVhp6RA3cXeKOiZpVdAsO5OnRhWoJxW0+NfXAmReO8JXlJmTKUWK1
         TBbA==
X-Gm-Message-State: AOJu0Ywdo63Zr3USXbiRDSS63jXaimxUIazbuyvPoeDfx/NCBjDN8RuB
	6tk13MI2IjpRj3bdjSC+8ag=
X-Google-Smtp-Source: AGHT+IGqO69HbozDdaHzdkdh97/2e+jmgHJdDzIFmqXLEgdVLBzcOqGONSlcV0qLIbSY7SsabkStTg==
X-Received: by 2002:a9d:7518:0:b0:6d9:ebaf:a5fa with SMTP id r24-20020a9d7518000000b006d9ebafa5famr19611013otk.54.1703129052973;
        Wed, 20 Dec 2023 19:24:12 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] xen-blkback: Use freezable wait_event variants for freezable kthread
Date: Thu, 21 Dec 2023 11:23:51 +0800
Message-Id: <20231221032351.1638686-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A freezable kernel thread can enter frozen state during freezing by
either calling try_to_freeze() or using wait_event_freezable() and its
variants. So for the following snippet of code in a kernel thread loop:
  try_to_freeze();
  wait_event_interruptible();

We can change it to a simple wait_event_freezable() and then eliminate
a function call.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/block/xen-blkback/blkback.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 4defd7f387c7..bef0f950b257 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -563,20 +563,18 @@ int xen_blkif_schedule(void *arg)
 
 	set_freezable();
 	while (!kthread_should_stop()) {
-		if (try_to_freeze())
-			continue;
 		if (unlikely(vbd->size != vbd_sz(vbd)))
 			xen_vbd_resize(blkif);
 
 		timeout = msecs_to_jiffies(LRU_INTERVAL);
 
-		timeout = wait_event_interruptible_timeout(
+		timeout = wait_event_freezable_timeout(
 			ring->wq,
 			ring->waiting_reqs || kthread_should_stop(),
 			timeout);
 		if (timeout == 0)
 			goto purge_gnt_list;
-		timeout = wait_event_interruptible_timeout(
+		timeout = wait_event_freezable_timeout(
 			ring->pending_free_wq,
 			!list_empty(&ring->pending_free) ||
 			kthread_should_stop(),
@@ -593,8 +591,8 @@ int xen_blkif_schedule(void *arg)
 		if (ret > 0)
 			ring->waiting_reqs = 1;
 		if (ret == -EACCES)
-			wait_event_interruptible(ring->shutdown_wq,
-						 kthread_should_stop());
+			wait_event_freezable(ring->shutdown_wq,
+					     kthread_should_stop());
 
 		if (do_eoi && !ring->waiting_reqs) {
 			xen_irq_lateeoi(ring->irq, eoi_flags);
-- 
2.39.2


