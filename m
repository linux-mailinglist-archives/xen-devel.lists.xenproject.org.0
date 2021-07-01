Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1BD3B931A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148792.275109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZc-0003sq-9p; Thu, 01 Jul 2021 14:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148792.275109; Thu, 01 Jul 2021 14:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZb-0003ed-Ui; Thu, 01 Jul 2021 14:21:47 +0000
Received: by outflank-mailman (input) for mailman id 148792;
 Thu, 01 Jul 2021 14:21:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxR8-0005F9-NK
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:13:02 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b5a5f68-da76-11eb-8329-12813bfff9fa;
 Thu, 01 Jul 2021 14:11:30 +0000 (UTC)
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
X-Inumbo-ID: 3b5a5f68-da76-11eb-8329-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dwFmFNnNGaBSF9VKRHGAEd86YUDOMJh2c843ZdLeZ+U=;
  b=UaT1H5wWuAlS8O4fXfRyOffTdO5CO12l8DM3eTC0PdaXiCVqRaylTdNa
   uRp9Cqq75uKmJsVkczMyS2ZNRI6MlcL8qazTZ/YGq64hDGxVQbAVr9Qjt
   dLY+e5K9ZAq0+8AJzcxh6X6tA9PkMo8xchxsKddHzMKZ4dNsaR2nmkGoY
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: j9+odOWZg4WcY/KWgEG94tzUNJeVT2HdKgX+qswkboAx+QonpZd9WL3w2XDUoAzi684TV5EWTb
 GOREf2oposR+Kt+yYxPmp/+USQMe37X2fPaofRQg72ypwUaIKEcmOl1XGtkfsdf2+37Q/XceCh
 GquF6WT4xVEVhSC7JWg95l1kleCPLNwV9EFwE4dkWcirzPHucNuUmjjdYqf6hwjoxa2WsQacUW
 +AszIaVkwXz3HCPSr31vNhycyAEc7xmH6jBIK+ZJVvmoEq0sHCr7cAN+nnGD+wvvzpxA4szQkK
 jIc=
X-SBRS: 5.1
X-MesageID: 47755474
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/x1tbK+wxuMrCvGmQSZuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47755474"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 23/31] build: fix arch/x86/node.o rule
Date: Thu, 1 Jul 2021 15:10:03 +0100
Message-ID: <20210701141011.785641-24-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Avoid different spelling for the location of "xen-syms", and simply
use the dependency variable. This avoid the assumption about $(TARGET)
value.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/x86/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index d3e38e4e9f02..d84062f48dfa 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -199,7 +199,7 @@ $(TARGET)-syms: prelink.o xen.lds
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 
 note.o: $(TARGET)-syms
-	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id  $(BASEDIR)/xen-syms $@.bin
+	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $< $@.bin
 	$(OBJCOPY) -I binary -O elf64-x86-64 -B i386:x86-64 \
 		--rename-section=.data=.note.gnu.build-id -S $@.bin $@
 	rm -f $@.bin
-- 
Anthony PERARD


