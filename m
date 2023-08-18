Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224AD780C31
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 14:58:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586204.917435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWz3J-0007yT-DI; Fri, 18 Aug 2023 12:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586204.917435; Fri, 18 Aug 2023 12:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWz3J-0007vY-A4; Fri, 18 Aug 2023 12:58:09 +0000
Received: by outflank-mailman (input) for mailman id 586204;
 Fri, 18 Aug 2023 12:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTTw=ED=citrix.com=prvs=587dba071=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWz3I-0007Sb-8e
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 12:58:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e050a167-3dc6-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 14:58:07 +0200 (CEST)
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
X-Inumbo-ID: e050a167-3dc6-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692363487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UNpEWxE+6YUF+fqP3uFTyRb6vwEhgZuthRJrbK+bZlA=;
  b=J/MoZBTROHzY/f4ikqvrnICaattLDHTyBG0z0hFtrUv6s7YHWRdsiJQr
   bEek8jutmhNzKGjp09T5p031U2Fdy73vjMP2LX5hl1Brxo+/jaUI6UAqP
   4Q/KmsTquEn1D7AEbN6sLZPS4K6K+jxto/cRWImT6hXMBUYIUDjE7RMkr
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119911553
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:aZMsfKpx09XxLq/ai4+feyHoSjdeBmIHZRIvgKrLsJaIsI4StFCzt
 garIBmOMqqOa2P2fNkiaImz9kNQ6sXSyoRiGQNppX1jQXgW9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weOzilNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACgkfhWIvOOt+euUTeB2q8IYKebnHKpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jufrjWgW0xHb7RzzxKH7Sj9lMPjgB/4c9osFL7o6uBMm0Gqkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMdysnmq7oylSuWYdFqCoOztdjaFRHZl
 mXiQDcFu50fissC1qOe9F/Bgi6xqpWhcjPZ9jk7TUr+sFonOdfNi5iArAGCsK0edNrxokyp5
 iBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNNWfhcB3iUsI2WBj
 KrvVeR5vcc7AZdSRfUrC79d8uxzpUQaKfzrV+rPcv1FaYVreQmM8UlGPBDBhTq8zxB9yPphZ
 /93lPpA615AWcyLKxLsG48gPUIDnHhilQs/u7iqp/hY7VZuTCHMEupUWLd/Rus48LmFsG3oH
 yV3bqO3J+FkeLSmOEH/qNdDRW3m2FBnXfgaXeQLLL/cSuencUl9Y8LsLUQJItc8xfkPybqRr
 hlQmCZwkTLCuJEOEi3SAlgLVV8ldc8XQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:dxkxu6FH/YGuq9Q1pLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-Talos-CUID: 9a23:nSEkkGD27VEIvRX6EzFO5EsfIcE+SyTyy37KDkmDDEllaJTAHA==
X-Talos-MUID: 9a23:GnM6WQWdUirRR9Dq/D3z3mBwGOt136eFUH4NksUape+fKRUlbg==
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="119911553"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] rombiosn: Remove the use of egrep
Date: Fri, 18 Aug 2023 13:57:53 +0100
Message-ID: <20230818125753.876699-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230818125753.876699-1-andrew.cooper3@citrix.com>
References: <20230818125753.876699-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As Alpine 3.18 container notes:

  egrep: warning: egrep is obsolescent; using grep -E

Adjust it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/firmware/rombios/32bit/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/firmware/rombios/32bit/Makefile b/tools/firmware/rombios/32bit/Makefile
index c058c715514c..50d45647c23d 100644
--- a/tools/firmware/rombios/32bit/Makefile
+++ b/tools/firmware/rombios/32bit/Makefile
@@ -26,7 +26,7 @@ $(TARGET): 32bitbios_all.o
 32bitbios_all.o: 32bitbios.o tcgbios/tcgbiosext.o util.o pmm.o
 	$(LD) $(LDFLAGS_DIRECT) -s -r $^ -o 32bitbios_all.o
 	@nm 32bitbios_all.o |                                \
-	  egrep '^ +U ' >/dev/null && {                      \
+	  grep -E '^ +U ' >/dev/null && {                    \
 	    echo "There are undefined symbols in the BIOS:"; \
 	    nm -u 32bitbios_all.o;                           \
 	    exit 11;                                         \
-- 
2.30.2


