Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0465F1ECB64
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 10:23:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgOf6-0006z9-PM; Wed, 03 Jun 2020 08:22:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJWJ=7Q=amazon.de=prvs=4160afac8=wipawel@srs-us1.protection.inumbo.net>)
 id 1jgOf5-0006z4-8r
 for xen-devel@lists.xen.org; Wed, 03 Jun 2020 08:22:11 +0000
X-Inumbo-ID: 51143f60-a573-11ea-acc2-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51143f60-a573-11ea-acc2-12813bfff9fa;
 Wed, 03 Jun 2020 08:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1591172529; x=1622708529;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ARn20Ks4gi+MwJ5XghU+Mr/g0WdxCT6F+9//DF8fqCw=;
 b=ppY58cH1XRS0lRK1gw96mof4ssk1wVeOHvmfxVoJiOXwllkTkK3FRctL
 kBwi/MVpEDSDiU3DikfYnJcM9F5GNWtTpRb1Xv+JCoKtgA1zAI2yG/3EY
 zXlQoNLaiEvVrFNB1Xq191+G33VoOCTNDNF9wgLm6HbayIaqkqyp6B8xU g=;
IronPort-SDR: Xb2wbzz0PQOxjYaZUgbaf/vRYZ5inswviuO6tk2vCNMO47g0BdXWE0YGwtqx9CuD/iM0hSs22s
 8i0z3G1FhLVw==
X-IronPort-AV: E=Sophos;i="5.73,467,1583193600"; d="scan'208";a="41173025"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 03 Jun 2020 08:22:07 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 17F0928661B; Wed,  3 Jun 2020 08:22:05 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 3 Jun 2020 08:22:05 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 3 Jun 2020 08:22:03 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 3 Jun 2020 08:22:00 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF] xenbus: fix xenbus_write() ring overflow
Date: Wed, 3 Jun 2020 08:21:41 +0000
Message-ID: <20200603082141.42683-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>, julien@xen.org, wipawel@xen.org,
 andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Currently the xenbus_write() does not handle ring wrapping around
correctly. When ring buffer is almost full and there is not enough
space for next packet (e.g. there is 12 bytes of space left, but the
packet header needs to transmit 16 bytes) the memcpy() goes out of the
ring buffer boundry.
Instead, the part variable should be limited to the space available in
the ring buffer, so the memcpy() can fill up the buffer, update len
variable (to indicate that there is still some data to be copied) and
thereby the xenbus_write() loop can iterate again to finish copying
the remainder of data to the beginning of the ring buffer.

Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
 common/xenbus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/common/xenbus.c b/common/xenbus.c
index 59159f2..24fff48 100644
--- a/common/xenbus.c
+++ b/common/xenbus.c
@@ -31,9 +31,7 @@ static void xenbus_write(const void *data, size_t len)
         uint32_t prod = ACCESS_ONCE(xb_ring->req_prod);
         uint32_t cons = ACCESS_ONCE(xb_ring->req_cons);
 
-        uint32_t used = mask_xenbus_idx(prod - cons);
-
-        part = (XENBUS_RING_SIZE - 1) - used;
+        part = (XENBUS_RING_SIZE - 1) - mask_xenbus_idx(prod - cons);
 
         /* No space?  Kick xenstored and wait for it to consume some data. */
         if ( !part )
@@ -47,7 +45,7 @@ static void xenbus_write(const void *data, size_t len)
         }
 
         /* Don't overrun the ring. */
-        part = min(part, XENBUS_RING_SIZE - used);
+        part = min(part, XENBUS_RING_SIZE - mask_xenbus_idx(prod));
 
         /* Don't write more than necessary. */
         part = min(part, (unsigned int)len);
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




