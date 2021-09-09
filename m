Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C362405AFC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 18:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183381.331537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mON1L-0002Uj-Nw; Thu, 09 Sep 2021 16:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183381.331537; Thu, 09 Sep 2021 16:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mON1L-0002Rn-Kk; Thu, 09 Sep 2021 16:35:27 +0000
Received: by outflank-mailman (input) for mailman id 183381;
 Thu, 09 Sep 2021 16:35:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xa6=N7=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mON1J-0001rN-SV
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:35:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24a98b95-d76e-4665-9e6e-14ec9f6de728;
 Thu, 09 Sep 2021 16:35:19 +0000 (UTC)
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
X-Inumbo-ID: 24a98b95-d76e-4665-9e6e-14ec9f6de728
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631205319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=35xQpM/thu7zR5kkv+/e98XVppVGc4tUolZlEnqQblo=;
  b=gSswPpum84z4Z/owIYBzPDHY6McJ5qQI2EwOAlQsnYk1jR4gpM2wqE1/
   YE9Vhkx9n960L7WettWQAKbsuVQdzCEzqQ2+DcKSHq3vUDxB8v+Xn8Qru
   tEBVbLqqMZSULsF1WuWJQaSxAQE8mbV0XHJNQbDCfmSu3kJKX3LccnvtE
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +3BrRwVXpvZbjpR1G8slxnNa4TcWQuzGqFyaK4jzKYmOgVzZAGW7BJak7M4ilt8IuygVnycUPl
 fdnIS4tL8LlFuebY7o+OLbA0v9e//IBQ9q9kqcvl+nT9Bj8btOFNfmJignX1TnFIYuoY3oRj2G
 vP9HSz2jG83xwFbpHkTtSD3IXnpT6oi0eQk1TXEQS4LPGIGQxaKK38dpiv5epUWk1S6BMATZyx
 NOfjkxBxXJRH7Hvela+Gvf2tgq2NlALRjl6zJqfd0K+57+a9Huu2cYNTARp6qfrgAUzQ8x0iRf
 MibL/Z7zcqxNeFZvLC4eRm1G
X-SBRS: 5.1
X-MesageID: 54142780
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JrjuMKqUL6XpiV/Pgrs0ai8aV5oReYIsimQD101hICG8cqSj9v
 xG+85rrCMc6QxhI03I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdWSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.85,280,1624334400"; 
   d="scan'208";a="54142780"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 3/3] tools/libxl: Only allocate 64 bytes for RSDP
Date: Thu, 9 Sep 2021 17:34:41 +0100
Message-ID: <20210909163441.44418-4-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909163441.44418-1-kevin.stefanov@citrix.com>
References: <20210909163441.44418-1-kevin.stefanov@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

RSDP's size is 64 bytes and later in the function, its buffer is
hardcoded to be 64 bytes long. Don't bother to allocate a whole page.

Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_x86_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
index 0a82e7cacd..2aea1eca31 100644
--- a/tools/libs/light/libxl_x86_acpi.c
+++ b/tools/libs/light/libxl_x86_acpi.c
@@ -183,7 +183,7 @@ int libxl__dom_load_acpi(libxl__gc *gc,
         goto out;
     }
 
-    config.rsdp = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
+    config.rsdp = (unsigned long)libxl__malloc(gc, 64);
     config.infop = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
     /* Pages to hold ACPI tables */
     acpi_pages =  libxl__malloc(gc, (NUM_ACPI_PAGES + 1) *
-- 
2.25.1


