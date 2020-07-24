Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA3322C573
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 14:43:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyx2V-00015o-OZ; Fri, 24 Jul 2020 12:43:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWcK=BD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyx2U-00012u-40
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 12:43:02 +0000
X-Inumbo-ID: 31f451f1-cdab-11ea-880c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31f451f1-cdab-11ea-880c-bc764e2007e4;
 Fri, 24 Jul 2020 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595594576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Tw4G/V7kxbTklR4OkIgBDvRcTQey+xrJa3KZIIL0yE=;
 b=Wr12Kj69LSoxJfKjPvI9zKeyP+8qjKurWGX/V1S90YdMWo2SxUBm5mR4
 FWTFEvXA4N9ijDkQtc8GPDZEGXrnhA8Jkre1m7+vZNVToTQg2lXoi0I1a
 Yjknuae2jRN+PSMFW35gT8v8c16ILAY+xALtDbWG4kTcvAoTtdu2rRLGk Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1RmtWXLEVLsjBBebMyNb9dJntTLAmrgMDJmAs3T9l48/E9hvv/9Zz/JGcwmC/qk907TZ5cCnhv
 JD3rZBNMfCwCn/WlbKh5LBFv7oL/dKr6eU4+jdqj7dHQOQQqNjdvpYQ66LyEy3gb9PIHCC1MrD
 kmD0iJEk7E1uJWWtM02WnuIA+Yoq9Ra2+LyjJAAjbuuR1etEvwEpbBKBYFOxclIwriVbLZlQRM
 khIh9nzeMT3Dhtv9/vt6aqAXVFbKhToIhnx5qJOUTVfm1CHLGLlsws80oqkAFKPc/SW8TD/l4h
 FnA=
X-SBRS: 2.7
X-MesageID: 23139909
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,390,1589256000"; d="scan'208";a="23139909"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/4] xen/balloon: make the balloon wait interruptible
Date: Fri, 24 Jul 2020 14:42:39 +0200
Message-ID: <20200724124241.48208-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724124241.48208-1-roger.pau@citrix.com>
References: <20200724124241.48208-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

So it can be killed, or else processes can get hung indefinitely
waiting for balloon pages.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Cc: stable@vger.kernel.org
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/balloon.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 3cb10ed32557..292413b27575 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -568,11 +568,13 @@ static int add_ballooned_pages(int nr_pages)
 	if (xen_hotplug_unpopulated) {
 		st = reserve_additional_memory();
 		if (st != BP_ECANCELED) {
+			int rc;
+
 			mutex_unlock(&balloon_mutex);
-			wait_event(balloon_wq,
+			rc = wait_event_interruptible(balloon_wq,
 				   !list_empty(&ballooned_pages));
 			mutex_lock(&balloon_mutex);
-			return 0;
+			return rc ? -ENOMEM : 0;
 		}
 	}
 
-- 
2.27.0


