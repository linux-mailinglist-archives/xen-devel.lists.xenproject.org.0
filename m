Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 106392C0FB5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 17:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34783.66007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khEKo-0004KH-96; Mon, 23 Nov 2020 16:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34783.66007; Mon, 23 Nov 2020 16:04:58 +0000
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
	id 1khEKo-0004Js-5y; Mon, 23 Nov 2020 16:04:58 +0000
Received: by outflank-mailman (input) for mailman id 34783;
 Mon, 23 Nov 2020 16:04:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/KCf=E5=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1khEKn-0004Jn-C5
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:04:57 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21ebb239-01de-4132-8be8-45ca20f0855b;
 Mon, 23 Nov 2020 16:04:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/KCf=E5=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1khEKn-0004Jn-C5
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:04:57 +0000
X-Inumbo-ID: 21ebb239-01de-4132-8be8-45ca20f0855b
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 21ebb239-01de-4132-8be8-45ca20f0855b;
	Mon, 23 Nov 2020 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606147496;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m43E1j1pgce7TcObGftnisojvbl9tRjPYzsFht/m8E8=;
  b=KpvAT03qCDz3FKAlGuZ1CIzLKxnGJngW76c7yEfPm0lxju954iwaGrfg
   MwvYj2zGw2fIM8UuGBGTCmzJtza4KCFQ+zBw6Sh4YP663UAUkceSQ3/VC
   zcFQ+oA98Yaf2Bv++CeI9QJSTxcAEYzkWs0rVfoViSfWJtsa7U0cFo0LH
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Gqqm3vfdwr9zFqbi6kea/7+Q2JJDIadQjbPWzpMtYnYPxvHXa22K75WQvRqZYgKSClFtZztZNt
 TGRvDaWhItenmQWjXI+K7YW4P3i6rGw8BxhutRr3vSQRGpuO4FBjL3UOX6Qa9GXhWultR42DRL
 08o7BFkEPPzqoR5wKK+4oWds3ip/RP0nsR1lzyRK4/prsG4lFQYFt75mKwuL1j7FsfGlZGTX9e
 nSnQgYPaG5TBAVe9mhbyp+M+2OmgX4K+zxg6PLABaRQA1cljzuAJDge+bfm4rG1C2xC63Ryu7c
 DKU=
X-SBRS: None
X-MesageID: 31728320
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="31728320"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH] MAINTINERS: Propose Ian Jackson as new release manager
Date: Mon, 23 Nov 2020 16:04:00 +0000
Message-ID: <20201123160400.1273386-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Ian Jackson has agreed to be the release manager for 4.15.  Signify
this by giving him maintainership over CHANGELOG.md.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Paul Durrant <paul@xen.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dab38a6a14..a9872df1de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -250,7 +250,7 @@ F:	xen/include/public/arch-arm/
 F:	xen/include/public/arch-arm.h
 
 Change Log
-M:	Paul Durrant <paul@xen.org>
+M:	Ian Jackson <ian.jackson@citrix.com>
 R:	Community Manager <community.manager@xenproject.org>
 S:	Maintained
 F:	CHANGELOG.md
-- 
2.25.1


