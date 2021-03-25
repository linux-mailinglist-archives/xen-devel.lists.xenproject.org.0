Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2CB349A97
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 20:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101522.194288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPVrx-0001rH-IK; Thu, 25 Mar 2021 19:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101522.194288; Thu, 25 Mar 2021 19:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPVrx-0001qs-Ew; Thu, 25 Mar 2021 19:42:13 +0000
Received: by outflank-mailman (input) for mailman id 101522;
 Thu, 25 Mar 2021 19:42:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSM8=IX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPVrv-0001qn-Sw
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 19:42:12 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8356ec69-dd3e-4d8d-9faa-f9b92af8e329;
 Thu, 25 Mar 2021 19:42:10 +0000 (UTC)
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
X-Inumbo-ID: 8356ec69-dd3e-4d8d-9faa-f9b92af8e329
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616701330;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=aIIfJIAzczl8EGWOaraqkh2HmY3ZaEAZ9d3r68Bfg0s=;
  b=GVAa0msrC0Nklc1X/XVDfIRHu7rjKfX949tx7s5umcpVbB0qGSGBrqZI
   xVc/9IVd4nBM7AFmZV1Q/caaJgKYvouuRGJFLLVlyTvAYac2CH6dWDc/y
   qyhqOzGjD0re2lVyWnIUoFM4j5UPKEyoo1ruj8mnxJLvejQkteVGEG9RC
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BtKYWRideZ7y8j0+kLJIxalzpUbhtB6UtuVKo4lwhoYa8/QL3qHhghQB8acMKXDqCFttmu2xk8
 9fxWoaefdYyUetblSCKNItWbKRYn5XC8n3N5XwR58k9EcXqTJSMsY3Imwuk9WvxZy9F5SBgc20
 7TRRlmv+iv7W2wVUXpNQRNgrTXHL8uiV0wmSFurbG6z+D63m4ACheCGOrdfldCM0qvIFmJyeNa
 jc2O6MFtTyyB74EH9ONJgnThqTWXxhJmmzTl/h2al8EZlLSrVU3E4OtI9rtIh/IakVy1rILbuG
 LXw=
X-SBRS: 5.1
X-MesageID: 40523826
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gRtLWa0atCvyDClphdXKzgqjBWByeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035Qd2+ksFJ2lWxTrv3btEZF64eLZslndMgDd1soY76
 dvdKBiFMb9ZGIRse/W6BS1euxO/PCp66at7N2x815IbSVHL55t9B14DAHzKDwSeCBjCYAiHJ
 SRouprzgDQGkg/VciwCnkbU+WrnbSi+K7OWhIaGwUhrDCHkDLA0tXHOiKF1RQTWS4n+8ZBzU
 H5lWXCh5mLgrWA5TL3k0TS6JlXn9WJ8Ko/OOW8zvI7Bx+ppgKhZIFKU6CPsjYvsIiUmSoXue
 iJmTgMFYBe7G7QY3GUrHLWqnbd+Qdr0VDO4xu5hmbuusPwTj5SMbs+uatpNiH3xmBlmfMU6t
 Mt40up86B5IDmFoQHGo//PbB1unlrcmwtYrccjy0ZxfKFbVKVctuUkjSVoOaZFJg3WwqY9Ht
 JjCcnNjcwmC2+yXjTism5jzMfEZAVLIj62BkwLusmi2zNLhnxOz0wB2MwFnnsbnahNM6V52w
 ==
X-IronPort-AV: E=Sophos;i="5.81,278,1610427600"; 
   d="scan'208";a="40523826"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] tools/libfsimage: Bump SONAME to 4.16
Date: Thu, 25 Mar 2021 19:42:01 +0000
Message-ID: <20210325194201.10998-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Fixes: a04509d34d ("Branching: Update version files etc. for newly unstable")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
---
 tools/libfsimage/common/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libfsimage/common/Makefile b/tools/libfsimage/common/Makefile
index 060f029ca9..24bc90e73e 100644
--- a/tools/libfsimage/common/Makefile
+++ b/tools/libfsimage/common/Makefile
@@ -1,7 +1,7 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
 
-MAJOR = 4.15
+MAJOR = 4.16
 MINOR = 0
 
 LDFLAGS-$(CONFIG_SunOS) = -Wl,-M -Wl,mapfile-SunOS
-- 
2.11.0


