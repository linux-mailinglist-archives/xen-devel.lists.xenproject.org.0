Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C74C487F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279250.476928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKU-0007Ac-8D; Fri, 25 Feb 2022 15:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279250.476928; Fri, 25 Feb 2022 15:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKU-000773-1Q; Fri, 25 Feb 2022 15:16:22 +0000
Received: by outflank-mailman (input) for mailman id 279250;
 Fri, 25 Feb 2022 15:16:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIa-0007Bf-6O
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:24 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c196b56-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:14:23 +0100 (CET)
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
X-Inumbo-ID: 9c196b56-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PjwCsNWxlB3gIKV9SoGAb5GW19kuozp+yzWw4gCwjzk=;
  b=iFrMEcm3XYP/19IRvxvJ/Vfi2cJ7RdYppZAQusk3SggO4hgP8Fhcwxm5
   dg5+32DICiQU0WgVS14dDfgU2O1f33gFQtgCa2WOxTgM2CwOXUls4IEj0
   X8cqC6y8mwbe0U8tQBwP/JqoFljdFmReJjuTrBVLRT8FWTiSDyHqEVCyl
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65407611
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:no3q46wld09LXDghvzh6t+c+xirEfRIJ4+MujC+fZmUNrF6WrkUEm
 DFLUGyHOP6KMTb9Kd9+OYi3908HvZ+Ex4JjSFNprSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYy24XhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljsKdEiQUHKn2mekhXhBUSSRTZ7McweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AO
 pZBNmQ2NXwsZTUXC2Y3S41npt6Lizr/XmBF8lO0ipIOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKgoTMcGSzXyZ8nOmj/LLgQv2XplXEKy/8LhtmlL77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixPTYpFR18StgctcIKSDUmj
 Fqkxc2zPGk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+hL1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHd7
 RDoeODEtYji6K1hcgTXEY3h+5nzup643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK518Mu8MKYCbyNfcvC25UNyjM5fKxfTgCfqqJBuein7ArLFPXlM2QTRT4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOdUWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7alPEE6MOc7cDg3EJTMLcuu+pwPK7XaeVIO9aNII6a5/I7NsrdNx8x9/tokN
 FnkMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:hKt77qjydAUsfVa8aUocqJQDB3BQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65407611"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 27/29] stubdom: build xenstore*-stubdom using new Makefile.common
Date: Fri, 25 Feb 2022 15:13:19 +0000
Message-ID: <20220225151321.44126-28-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Makefile.common have everything needed by stubdom, when used with
xenlibs.mk, so we don't need "Makefile" anymore.

Also, remove DESTDIR for "xenstore" related targets, "xenlibs.mk"
doesn't use DESTDIR so its value doesn't matter.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---

Notes:
    v2:
    - reviewed

 stubdom/Makefile | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 6b804824ba..1fa075b9ad 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -346,8 +346,7 @@ define do_links
   cd $(dir $@); \
   ln -sf $(dir $<)include/*.h include/; \
   ln -sf $(dir $<)*.[ch] .; \
-  [ -e $(dir $<)Makefile.common ] && ln -sf $(dir $<)Makefile.common . ||:; \
-  ln -sf $(dir $<)Makefile .
+  ln -sf $(dir $<)Makefile.common .
   touch $@
 endef
 
@@ -356,13 +355,11 @@ define BUILD_lib
  libxen$(1): libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a
  libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: $$(LIBDEPS_$(1)) $$(LIBDEP_$(1))
  libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: mk-headers-$$(XEN_TARGET_ARCH) $$(NEWLIB_STAMPFILE) .phony
-	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y $$(if $$(wildcard $$(@D)/Makefile.common),-f $(CURDIR)/xenlibs.mk) -C $$(@D) $$(@F)
+	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y -f $(CURDIR)/xenlibs.mk -C $$(@D) $$(@F)
 
  clean-libxen$(1):
 	if [ -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile.common ]; then \
 	    $$(MAKE) -f $(CURDIR)/xenlibs.mk -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
-	elif [ -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile ]; then \
-	    $$(MAKE) -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
 	fi
 
  libs-$$(XEN_TARGET_ARCH)/$(1)/stamp: $$(XEN_ROOT)/tools/libs/$(1)/Makefile.common
@@ -494,7 +491,7 @@ xenstore-minios-config.mk: $(CURDIR)/xenstore-minios.cfg
 
 .PHONY: xenstore
 xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
-	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstore-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C $@ xenstored.a CONFIG_STUBDOM=y
+	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstore-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) -f $(CURDIR)/xenlibs.mk -C $@ xenstored.a CONFIG_STUBDOM=y
 
 #############
 # xenstorepvh
@@ -505,7 +502,7 @@ xenstorepvh-minios-config.mk: $(CURDIR)/xenstorepvh-minios.cfg
 
 .PHONY: xenstorepvh
 xenstorepvh: $(CROSS_ROOT) xenstorepvh-minios-config.mk
-	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstorepvh-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C $@ xenstored.a CONFIG_STUBDOM=y
+	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstorepvh-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) -f $(CURDIR)/xenlibs.mk -C $@ xenstored.a CONFIG_STUBDOM=y
 
 ########
 # minios
@@ -657,8 +654,8 @@ clean:
 	rm -f *-minios-config.mk
 	rm -fr pkg-config
 	-[ ! -d ioemu ] || $(MAKE) DESTDIR= -C ioemu clean
-	-[ ! -d xenstore ] || $(MAKE) DESTDIR= -C xenstore clean
-	-[ ! -d xenstorepvh ] || $(MAKE) DESTDIR= -C xenstorepvh clean
+	-[ ! -d xenstore ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstore clean
+	-[ ! -d xenstorepvh ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstorepvh clean
 
 # clean the cross-compilation result
 .PHONY: crossclean
-- 
Anthony PERARD


