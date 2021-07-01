Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5653B9313
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148759.275030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZS-0001jB-LF; Thu, 01 Jul 2021 14:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148759.275030; Thu, 01 Jul 2021 14:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZS-0001hE-HQ; Thu, 01 Jul 2021 14:21:38 +0000
Received: by outflank-mailman (input) for mailman id 148759;
 Thu, 01 Jul 2021 14:21:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxRI-0005F9-Nd
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:13:12 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d926230-da76-11eb-8329-12813bfff9fa;
 Thu, 01 Jul 2021 14:11:34 +0000 (UTC)
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
X-Inumbo-ID: 3d926230-da76-11eb-8329-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/FUmArmLEUIthNAppG6akBLHO3pJX78uJKbRrb4d2EI=;
  b=P76S3OAdIgeozLRn43x2LzFcy8Ykwb3pT6tREUw+i1f1TRhCXgKi11FT
   luKAOnUWzXjeZjs2QbBcF45Gxdk/ZSL7b9+Lfw/E6OkUHp8uObbADquIh
   jx7vDYEbB09TYP9Uu1IyVSWGRHdnwGDDR44OJm47lkvi2ZQvyxW03rukc
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: D09gFO1M0EXikMGbZhcoxD0O0fKSoGY0TXjcb8GYPlxlc7KacMjEeVYluQbadkrpN2DOgsrbKo
 kL7I5nHQgmOEPSmDh+o9f87QkmVlDS7u0Q0vLW8ZTpt41vNJI9eMyqhzF5PY63z94yrlb+81/z
 +WBED6UtQSVx+LZf/CMufdk+sCJSLL6IUdlieCOvKpBKM/UfDhxp8rGaAYCc1ttHDOouiD/33r
 6GXm+WARdUc7qI+zzKkwBOiChCl1glM4g44nIXHQ2ppr1+4dASBCq1HcN2Ncz2Bt93f387BIzM
 5Oo=
X-SBRS: 5.1
X-MesageID: 47755478
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:amjLI675VHwyieoSTwPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HIoB17726MtN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpM
 FdmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47755478"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 26/31] build: clean common temporary files from root makefile
Date: Thu, 1 Jul 2021 15:10:06 +0100
Message-ID: <20210701141011.785641-27-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile               | 1 +
 xen/scripts/Makefile.clean | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index fd002ecd52d0..6aac68750b4d 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -378,6 +378,7 @@ _clean:
 	$(MAKE) $(clean) test
 	$(MAKE) $(kconfig) clean
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
+		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
 	rm -f asm-offsets.s include/arch-*/asm/asm-offsets.h
diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index 027c200c0efc..b6df9e861e6e 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -14,10 +14,8 @@ include Makefile
 subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
               $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
 
-DEPS_RM = $(DEPS) $(DEPS_INCLUDE)
 .PHONY: clean
 clean:: $(subdir-all)
-	rm -f *.o .*.o.tmp *~ core $(DEPS_RM)
 
 # Descending
 # ---------------------------------------------------------------------------
-- 
Anthony PERARD


