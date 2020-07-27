Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7F722E899
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 11:15:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzzE3-0004Pp-Bt; Mon, 27 Jul 2020 09:15:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jzzE2-0004OD-HH
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 09:15:14 +0000
X-Inumbo-ID: a9c3cea0-cfe9-11ea-8a7e-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9c3cea0-cfe9-11ea-8a7e-bc764e2007e4;
 Mon, 27 Jul 2020 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595841307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3jbhXHOtCfIXZMzu/xfRs6KCwvTkEik1EFWK3NUjQ5c=;
 b=BylR2u4QVXw4hPA3moH2QQHyIhxzYwxT4dTulcmM4nPhXCUDIZrY28W8
 InAud1UkqFEAHJyGd8l+MWkJhNhcGLLbZMKouRDsUx3k+EpUkGlEV0bj4
 DH6TECx+STk1LDkcInhpZmJBSy1ovkGwQGJGm+3TgdpkD/0c38zWMeXy9 k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XBCsU74yw3gqieztP4QqoHMKHwPQS43HrGWtokfqoYQFLLraPZfghSADkh+tDlVKFLfYjy+t7V
 wLpS4OPM3WrCC5ogCSsCLNIU308UvGq9/KoTNu0vq/EKwIwdsM8K6oJgPGIdB0UeQHrLnfH6N4
 nBhXexVhbxOjiRM8L3yo31TsUDflXk+vNdRma2GVo9FscqU3iUbZ46O2r587gpwT7DUugcVKgk
 LWnMbM2lZQSLIKZNj9ffanaC/24ugers1l1uocUJ2wim1ysobo/k1h8q4hRYpKSzGmJHkStpvU
 haw=
X-SBRS: 2.7
X-MesageID: 23254979
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23254979"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/4] xen/balloon: make the balloon wait interruptible
Date: Mon, 27 Jul 2020 11:13:40 +0200
Message-ID: <20200727091342.52325-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727091342.52325-1-roger.pau@citrix.com>
References: <20200727091342.52325-1-roger.pau@citrix.com>
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
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

So it can be killed, or else processes can get hung indefinitely
waiting for balloon pages.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
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


