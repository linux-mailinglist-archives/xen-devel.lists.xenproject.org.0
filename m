Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C6622E89F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 11:15:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzzE9-0004TU-6g; Mon, 27 Jul 2020 09:15:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jzzE7-0004OD-HT
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 09:15:19 +0000
X-Inumbo-ID: ab0a4cda-cfe9-11ea-8a7e-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab0a4cda-cfe9-11ea-8a7e-bc764e2007e4;
 Mon, 27 Jul 2020 09:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595841309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nq9yI9ZapjAU3I2ISQYBx01cREm8iD5IrXb3HWdctu0=;
 b=KZInzin2gcDJQRvZdUwizW0PAokuwA9G1EfiBgPiA+O49KeLaeSfkJMr
 f1GNSEvLtMTwrrUrVsUcnLOhOR1fZr6H5SwkForVztBAWQcQ/rljyQO/d
 Ao6+E4cvtv4YW6j2Xns7IBOVSd5u4r3hr5DvPx21Z+N4q7tfFY29NztrC Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CaWT5LIbKdSm6bglJh6wY7Rm9pQCl8a6jhy9q8a+NizdhgIBcUgMJIVzAoXIXdLIYwEyNXjysu
 jSQTvNe1bbYVQi7e3KcyTmEZFi3CsDbUMupe+asAciCVSRx7faRfhMETYPniYTT+tB4f4E/ny3
 8Z9NHVXMK/B/ZfpG36jfHVTra6T4EWIxWxLV5SwAHLLEW5I157sJPAJSregsF8/dAdp6FxmzH3
 k9ZqiAppaKjGEJvBHAgFr+VIUtwQG6LUpdZxvOwrLfYO2QKjsRrmZ1Z54Lp0a4thonvBtWrRo4
 ohI=
X-SBRS: 2.7
X-MesageID: 23233916
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23233916"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/4] Revert "xen/balloon: Fix crash when ballooning on x86
 32 bit PAE"
Date: Mon, 27 Jul 2020 11:13:41 +0200
Message-ID: <20200727091342.52325-4-roger.pau@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This reverts commit dfd74a1edfaba5864276a2859190a8d242d18952.

This has been fixed by commit dca4436d1cf9e0d237c which added the out
of bounds check to __add_memory, so that trying to add blocks past
MAX_PHYSMEM_BITS will fail.

Note the check in the Xen balloon driver was bogus anyway, as it
checked the start address of the resource, but it should instead test
the end address to assert the whole resource falls below
MAX_PHYSMEM_BITS.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/balloon.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 292413b27575..b1d8b028bf80 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -266,20 +266,6 @@ static struct resource *additional_memory_resource(phys_addr_t size)
 		return NULL;
 	}
 
-#ifdef CONFIG_SPARSEMEM
-	{
-		unsigned long limit = 1UL << (MAX_PHYSMEM_BITS - PAGE_SHIFT);
-		unsigned long pfn = res->start >> PAGE_SHIFT;
-
-		if (pfn > limit) {
-			pr_err("New System RAM resource outside addressable RAM (%lu > %lu)\n",
-			       pfn, limit);
-			release_memory_resource(res);
-			return NULL;
-		}
-	}
-#endif
-
 	return res;
 }
 
-- 
2.27.0


