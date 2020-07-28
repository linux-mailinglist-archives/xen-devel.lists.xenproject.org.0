Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB3B230915
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 13:43:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0O0O-0007ZP-Qn; Tue, 28 Jul 2020 11:42:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZWt7=BH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k0O0N-0007ZK-2W
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 11:42:47 +0000
X-Inumbo-ID: 73fd8c0b-d0c7-11ea-8b28-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73fd8c0b-d0c7-11ea-8b28-bc764e2007e4;
 Tue, 28 Jul 2020 11:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595936566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iwLhOsjZtYhl+WFa5BUY/82Z8FbB6FQLSph99aT8EGw=;
 b=BixnbRswkYIbU65CmkXJxMolgQMy1yusl99uG/1f9Tn4MIamnnF3sVRi
 YKppZ/ffq1PWUKcKKaKAT095A9+xJW+8pxWMT+bfa/7/jxA2GDcqbSWfo
 obu6mSQjCldJrZwaVS100/N/0Q3/YveWmgf9ohhvopIunKfNHPFlD8tcO c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eST4pcblEO9C4zMoJzXs8FUL90X3L5/U0rACoVj/dtaz69BM1mQPX91USa/YLWbf/s5kkvs3z3
 QoxfVkTFF9gEtfVjJ2yybcqAH46FK8ACLdf97hJ6Hifthnze4ZxYG9Nc41FuSq47pXZeBrwobb
 TZ9GbHrh1h//0/sZC1rIdcSLxLAhbUvoZpFO4DAN7DuYKGEmcrKTu+MzROy8YleM2D0DxUYTLp
 s4j/3TQR8RoAyxfz2785glGSM5s8yBtxv6NnlJwLCUT3EhorCmMCbHdUMduNkBYU4PVBX7wQYr
 O9w=
X-SBRS: 2.7
X-MesageID: 23666671
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23666671"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH] xen/balloon: add header guard
Date: Tue, 28 Jul 2020 13:42:35 +0200
Message-ID: <20200728114235.58619-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727091342.52325-5-roger.pau@citrix.com>
References: <20200727091342.52325-5-roger.pau@citrix.com>
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In order to protect against the header being included multiple times
on the same compilation unit.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
This is required as a pre-patch to use ZONE_DEVICE, or else the
fallback of including the balloon header might not work properly.
---
 include/xen/balloon.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/xen/balloon.h b/include/xen/balloon.h
index 6fb95aa19405..6dbdb0b3fd03 100644
--- a/include/xen/balloon.h
+++ b/include/xen/balloon.h
@@ -2,6 +2,8 @@
 /******************************************************************************
  * Xen balloon functionality
  */
+#ifndef _XEN_BALLOON_H
+#define _XEN_BALLOON_H
 
 #define RETRY_UNLIMITED	0
 
@@ -34,3 +36,5 @@ static inline void xen_balloon_init(void)
 {
 }
 #endif
+
+#endif	/* _XEN_BALLOON_H */
-- 
2.27.0


