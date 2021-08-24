Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB48D3F5CBB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171090.312403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCQ-0002dK-UW; Tue, 24 Aug 2021 11:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171090.312403; Tue, 24 Aug 2021 11:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCQ-0002Ql-7e; Tue, 24 Aug 2021 11:02:34 +0000
Received: by outflank-mailman (input) for mailman id 171090;
 Tue, 24 Aug 2021 11:02:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU2v-0001EC-Bm
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:45 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 714055d3-71f5-45a2-bd08-26768c2ca62e;
 Tue, 24 Aug 2021 10:51:31 +0000 (UTC)
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
X-Inumbo-ID: 714055d3-71f5-45a2-bd08-26768c2ca62e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d0FIxQLgS3m06o66H2kdnXXxs+1FaFuXUvl+kfpgKh8=;
  b=UAjbkAVYCtnWFEUczhr5e9+0MQyYTQw2UoMNUKtnuN3RID3guRqxdxHE
   Onnl28jtAFHKLT4DsWWnsn4sJ+jVy6geXLvPw3108JbX9gh5avPOX/+Ks
   y3UmzdDUSmEAXSsQvhjNdssRHSzcbrpAdaQwbWv1F/JJdfAoItB7I0Ayn
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sYPAUQGBj8KLHLme6/xcfR/QGcAq8wnzdCvkDPbYeIk50CYLUT67Ripu0gmIXMxBWfo5f12QcB
 jzvaz45eZ+cMD7FkfMiFrT9msj2o1vHUKRz9k6Mw4ty3c51gssPkoSW5kxS2nuDVQKBZC37kij
 TNP2JBQCqlZrZbQbS89f9y46TB8f/ObKTI6WWMebZZagkItRLymaG7G+JLvz2DemNIVrI9ljLm
 swawhW9UP2ZjCS0p6XMqbHEe9AU++3+IGlt0LHD4Zu5NIh5hlTLdnFC4ARsCjj3uRB6MBAYYcN
 GBOltEcce20lUXdO+JRRLjM/
X-SBRS: 5.1
X-MesageID: 50772198
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:KEuBWatw5tiLkZxIESi97SUT7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="50772198"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 22/51] build: clean common temporary files from root makefile
Date: Tue, 24 Aug 2021 11:50:09 +0100
Message-ID: <20210824105038.1257926-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile               | 1 +
 xen/scripts/Makefile.clean | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 1dad20a95be6..f07c9251c030 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -382,6 +382,7 @@ _clean:
 	$(MAKE) $(clean) test
 	$(MAKE) $(kconfig) clean
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
+		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
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


