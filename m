Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C3B28F4AA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 16:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7418.19385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4Ck-0004jU-DC; Thu, 15 Oct 2020 14:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7418.19385; Thu, 15 Oct 2020 14:26:06 +0000
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
	id 1kT4Ck-0004j3-9j; Thu, 15 Oct 2020 14:26:06 +0000
Received: by outflank-mailman (input) for mailman id 7418;
 Thu, 15 Oct 2020 14:26:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kT4Ci-0004im-Up
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:26:04 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b31eb84-11a5-4017-bcc3-ed083e0a1e0e;
 Thu, 15 Oct 2020 14:26:03 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kT4Ci-0004im-Up
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:26:04 +0000
X-Inumbo-ID: 5b31eb84-11a5-4017-bcc3-ed083e0a1e0e
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5b31eb84-11a5-4017-bcc3-ed083e0a1e0e;
	Thu, 15 Oct 2020 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602771963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nec4gD5X3MmxS0I+tIlw7vXxkm0qi/q39D7bqb697+c=;
  b=HHdCFMYdp3iaiytTJKwwuZXXhBJuVSTxYO1RZ3dMYNibrbr2a4k1Lf8W
   h36r2U2wmCpY1PXpCQdgw0XxhrRWMt0fkpnKnu9SjBfJJUPvARX99CGGQ
   MvgBIhO5ITQu2SjW3B1t5gju0nnWS/237zPuSacssCCqCyxuQTl1K7C/e
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iDE2yqknkOfC10XRaSF9d4E7CcP5Q7x0CCeK4aQp5Q1/nZv/prDXfC+SlM5ci1UypwQ6cB1QW+
 Rl8ICdJBrilb1/wW5SOKfXC43Dd3QJpWshFMC/Mu6GwUhqTT1AsidtLjSrF0UP9RjAgeNOlQ79
 8HTIxkcBb2U8ycE40/DnqPu0OXqxHm6i21NwnLMHnvEgjCF+aZN/ES0ZdS0A8AuJi3b9RvwYcM
 ZD4BGKRh2YA84jLWIu2a3ImyVJs3BdlrheZginPypI7gTI5wlbJDTrAusT9k6r+iiKjqi7gyug
 CCw=
X-SBRS: 2.5
X-MesageID: 29146562
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,379,1596513600"; 
   d="scan'208";a="29146562"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, SeongJae Park <sjpark@amazon.de>,
	<xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>, "J .
 Roeleveld" <joost@antarean.org>, =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?=
	<jgross@suse.com>
Subject: [PATCH 1/2] xen/blkback: turn the cache purge LRU interval into a parameter
Date: Thu, 15 Oct 2020 16:24:15 +0200
Message-ID: <20201015142416.70294-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015142416.70294-1-roger.pau@citrix.com>
References: <20201015142416.70294-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Assume that reads and writes to the variable will be atomic. The worse
that could happen is that one of the LRU intervals is not calculated
properly if a partially written value is read, but that would only be
a transient issue.

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
 Documentation/ABI/testing/sysfs-driver-xen-blkback | 10 ++++++++++
 drivers/block/xen-blkback/blkback.c                |  9 ++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
index ecb7942ff146..776f25d335ca 100644
--- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
+++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
@@ -35,3 +35,13 @@ Description:
                 controls the duration in milliseconds that blkback will not
                 cache any page not backed by a grant mapping.
                 The default is 10ms.
+
+What:           /sys/module/xen_blkback/parameters/lru_internval
+Date:           October 2020
+KernelVersion:  5.10
+Contact:        Roger Pau Monné <roger.pau@citrix.com>
+Description:
+                The LRU mechanism to clean the lists of persistent grants needs
+                to be executed periodically. This parameter controls the time
+                interval between consecutive executions of the purge mechanism
+                is set in ms.
diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index adfc9352351d..6ad9b76fdb2b 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -117,7 +117,10 @@ MODULE_PARM_DESC(max_ring_page_order, "Maximum order of pages to be used for the
  * be executed periodically. The time interval between consecutive executions
  * of the purge mechanism is set in ms.
  */
-#define LRU_INTERVAL 100
+static unsigned int lru_interval = 100;
+module_param_named(lru_interval, lru_interval, uint, 0644);
+MODULE_PARM_DESC(lru_internval,
+		 "Time interval between consecutive executions of the cache purge mechanism (in ms)");
 
 /*
  * When the persistent grants list is full we will remove unused grants
@@ -620,7 +623,7 @@ int xen_blkif_schedule(void *arg)
 		if (unlikely(vbd->size != vbd_sz(vbd)))
 			xen_vbd_resize(blkif);
 
-		timeout = msecs_to_jiffies(LRU_INTERVAL);
+		timeout = msecs_to_jiffies(lru_interval);
 
 		timeout = wait_event_interruptible_timeout(
 			ring->wq,
@@ -650,7 +653,7 @@ int xen_blkif_schedule(void *arg)
 		if (blkif->vbd.feature_gnt_persistent &&
 		    time_after(jiffies, ring->next_lru)) {
 			purge_persistent_gnt(ring);
-			ring->next_lru = jiffies + msecs_to_jiffies(LRU_INTERVAL);
+			ring->next_lru = jiffies + msecs_to_jiffies(lru_interval);
 		}
 
 		/* Shrink the free pages pool if it is too large. */
-- 
2.28.0


