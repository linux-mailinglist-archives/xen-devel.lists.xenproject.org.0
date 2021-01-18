Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9CE2FA3E3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69706.124909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1W0G-0007LL-4B; Mon, 18 Jan 2021 14:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69706.124909; Mon, 18 Jan 2021 14:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1W0G-0007L0-0g; Mon, 18 Jan 2021 14:59:36 +0000
Received: by outflank-mailman (input) for mailman id 69706;
 Mon, 18 Jan 2021 14:59:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1W0E-0007Kv-Qn
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 14:59:34 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6a7a595-b76a-4268-ad05-3419f5e645a7;
 Mon, 18 Jan 2021 14:59:33 +0000 (UTC)
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
X-Inumbo-ID: b6a7a595-b76a-4268-ad05-3419f5e645a7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610981973;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DeRK4mBrNfVpnuKeDUEsIDFq+1coMtOmU4D/ymOXMU4=;
  b=VLOYqAfmQVBXm5vLBLuEJ6ZxaY58OqjPVhknMj59SiTdX2SOI0JVF2pS
   u72BlKuKB5wAbYHlKWVuTPBh4eglrFtSP5+6XSgMrCv9IV67AlUGE9eZm
   1HynF4/i2hSEvm6kGUflZi4zy2bnpMJ2DdmU83KUrP6+hFsx7M4Rkt178
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FUoNeuo5u4/e58W7VVNEe6/0SOyvPWbQ2tNMU+qhm85C28PXGTTHDymrywit2My/CH6yx+Vkxr
 gWj9sq3twb1egpn+apJbTGIRHSFqW6npzcm+6uUP6e6Q+mPPudpnfHLGQIr54jHoDNCKhYACHS
 NszgWSxYiJ0O3UdrEuBzYWIGmExKWInO6gJ5FnMjZvSSnpO6gDmG1RVCQQzcHASiDdybhI13uV
 P3gOb8dFO4qbHz8kMkENSAS+xrG5PEf/XGX1cmPksGF5jNC0xkBhnKZ7mAq9j4TndAhRGALRrU
 2kc=
X-SBRS: 5.1
X-MesageID: 35307402
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35307402"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/domain: Reposition config copying in domain_create()
Date: Mon, 18 Jan 2021 14:59:15 +0000
Message-ID: <20210118145915.15822-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is cleanup for two pending series which will copy more data than just
flags from config.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

The series in question are my fault-ttl series, and Michal's Processor Trace
series.
---
 xen/common/domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index d151be3f36..164c9d14e9 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -421,14 +421,15 @@ struct domain *domain_create(domid_t domid,
     if ( (d = alloc_domain_struct()) == NULL )
         return ERR_PTR(-ENOMEM);
 
-    d->options = config ? config->flags : 0;
-
     /* Sort out our idea of is_system_domain(). */
     d->domain_id = domid;
 
     /* Debug sanity. */
     ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
 
+    if ( config )
+        d->options = config->flags;
+
     /* Sort out our idea of is_control_domain(). */
     d->is_privileged = is_priv;
 
-- 
2.11.0


