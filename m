Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E180B28F4A5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 16:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7415.19373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4CP-0004c5-4R; Thu, 15 Oct 2020 14:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7415.19373; Thu, 15 Oct 2020 14:25:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4CP-0004bP-1F; Thu, 15 Oct 2020 14:25:45 +0000
Received: by outflank-mailman (input) for mailman id 7415;
 Thu, 15 Oct 2020 14:25:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kT4CN-0004ay-GJ
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:25:43 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef1122d1-2b9c-4702-bf1d-9b0e24451e7e;
 Thu, 15 Oct 2020 14:25:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kT4CN-0004ay-GJ
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:25:43 +0000
X-Inumbo-ID: ef1122d1-2b9c-4702-bf1d-9b0e24451e7e
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ef1122d1-2b9c-4702-bf1d-9b0e24451e7e;
	Thu, 15 Oct 2020 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602771942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qACv2ER1JyTphbaRvO3qjGjCO4Ywxs60QaM06nUJtes=;
  b=gnxBu0Okljz4KZnafw9fJasKLyJEsI43noBV4BEOOxucWUU4pN1ER84H
   bjF80Y5hs/1HClri4hmBuq7vFIimhLPWYsvfkPmAYLv9IAnnkQLZXQ4VF
   CBK2MfO58C+MuosMAyDCt5RM44jKzXObbfPaf1nClUSKdhETtcZa+ZNfq
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pc4931EzyhHOF/1+wy2nZ4XleWl7qBYyCEkp00YAxqGPWcnc737w40tXoyYSmGIVRQQH4Iit93
 07qxT5ybUOhZ2qxJTCRSoPyXLgFI6SB+kOdkwJ+tnstszy0/PMaQb6jMTptLMYlA/iJY4Lf2Oi
 F/cLdsnFwau5CJFWfhOyvPnFRV7Fsi+iyINxA6sbSGk67l/81+RiveiaYesCDf5YPxdThZ1AFI
 ilb1k5+O1Wjm2wOq7NJkhCdFSBqRNJaXSmpoZMT/4v02/Y5YxNBbR02IjhXjykf3zIOuEoFlNN
 uzc=
X-SBRS: 2.5
X-MesageID: 29332243
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,379,1596513600"; 
   d="scan'208";a="29332243"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, SeongJae Park <sjpark@amazon.de>,
	<xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>, "J .
 Roeleveld" <joost@antarean.org>, =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?=
	<jgross@suse.com>
Subject: [PATCH 2/2] xen/blkback: turn the cache purge percent into a parameter
Date: Thu, 15 Oct 2020 16:24:16 +0200
Message-ID: <20201015142416.70294-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015142416.70294-1-roger.pau@citrix.com>
References: <20201015142416.70294-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Assume that reads and writes to the variable will be atomic. The worse
that could happen is that one of the purges removes a partially
written percentage of grants, but the cache itself will recover.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: SeongJae Park <sjpark@amazon.de>
Cc: xen-devel@lists.xenproject.org
Cc: linux-block@vger.kernel.org
Cc: J. Roeleveld <joost@antarean.org>
Cc: Jürgen Groß <jgross@suse.com>
---
 Documentation/ABI/testing/sysfs-driver-xen-blkback | 9 +++++++++
 drivers/block/xen-blkback/blkback.c                | 7 +++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
index 776f25d335ca..7de791ad61f9 100644
--- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
+++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
@@ -45,3 +45,12 @@ Description:
                 to be executed periodically. This parameter controls the time
                 interval between consecutive executions of the purge mechanism
                 is set in ms.
+
+What:           /sys/module/xen_blkback/parameters/lru_percent_clean
+Date:           October 2020
+KernelVersion:  5.10
+Contact:        Roger Pau Monné <roger.pau@citrix.com>
+Description:
+                When the persistent grants list is full we will remove unused
+                grants from the list. The percent number of grants to be
+                removed at each LRU execution.
diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 6ad9b76fdb2b..772852d45a5a 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -127,7 +127,10 @@ MODULE_PARM_DESC(lru_internval,
  * from the list. The percent number of grants to be removed at each LRU
  * execution.
  */
-#define LRU_PERCENT_CLEAN 5
+static unsigned int lru_percent_clean = 5;
+module_param_named(lru_percent_clean, lru_percent_clean, uint, 0644);
+MODULE_PARM_DESC(lru_percent_clean,
+		 "Percentage of persistent grants to remove from the cache when full");
 
 /* Run-time switchable: /sys/module/blkback/parameters/ */
 static unsigned int log_stats;
@@ -404,7 +407,7 @@ static void purge_persistent_gnt(struct xen_blkif_ring *ring)
 	    !ring->blkif->vbd.overflow_max_grants)) {
 		num_clean = 0;
 	} else {
-		num_clean = (max_pgrants / 100) * LRU_PERCENT_CLEAN;
+		num_clean = (max_pgrants / 100) * lru_percent_clean;
 		num_clean = ring->persistent_gnt_c - max_pgrants + num_clean;
 		num_clean = min(ring->persistent_gnt_c, num_clean);
 		pr_debug("Going to purge at least %u persistent grants\n",
-- 
2.28.0


