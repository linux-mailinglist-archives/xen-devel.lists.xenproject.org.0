Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BFF45DB81
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231270.400165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5r-0001J3-QB; Thu, 25 Nov 2021 13:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231270.400165; Thu, 25 Nov 2021 13:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5r-000194-CF; Thu, 25 Nov 2021 13:47:19 +0000
Received: by outflank-mailman (input) for mailman id 231270;
 Thu, 25 Nov 2021 13:47:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzy-00076i-P9
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a7a50e9-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:13 +0100 (CET)
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
X-Inumbo-ID: 5a7a50e9-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O5L3e+/QWAIYcXnmaAXON9qB0LMfM8CPOGv64fGj7qI=;
  b=eGyctOjtnmeZ2i899/lqpzSqn3sXfGV1YeODwWDGEpZ1NGZ+75RxHOlg
   JLz7LGh3fH5DG6l9C06Swh51iTBrnIL1cFbrHsJD7mgjL0EoCkFRVc+NR
   TpiP6y9bavEFreOEKuDwsa7CjI4B8Sdp4e1Vgu2GJ9qBzgXB4Kj9k7J95
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OgJ3nwaUpoZTKcCPv1tZzCxhmQR4WBJmtd80mDJgs5ZnQM8ptTpeJ2P8lKfIZSInQtxfh4aZY3
 jQa2YS+2Om044U+HrD5FQc6k1OK4ohL4pBDvYHmxTyOxFCuIn0w+ecRWs7iLbQp4mB32+R7UsO
 gZtPlKWUSX4dTktJyb3hj06paPmum/8ASjqLZGEIJsjpDDUtRVOU9WwiXTelD4ZmuTSuLUbX0U
 FL3aMXKcsnOrD3bLB61dft4xswjb2z5EX9j/uPNCfhxJYLzoL7ZOi7PE4T4OrAGx1yX5Gv6pec
 NOPsRZc1JcOLCv+QxMNkIpds
X-SBRS: 5.1
X-MesageID: 58576689
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9XcTdqIHEX5AxomTFE+RLJIlxSXFcZb7ZxGr2PjKsXjdYENSgTQFy
 GJLUGyDa/eMZjHyKNh+PYW/8kIA7Z/Rn4dhGlRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2jufRSy
 PdVs6WOajwXH4uSp7sQUD5HRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gpg258QQ6aPD
 yYfQR9PSjXGQxRLAF0WGbgXrcetiCn8XAQN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u13/iHhgQOdibyDyE2nGhnOnCmWX8Qo16PKK83u5nhhuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQonSJoxodUNp4CPAh5UeGza+8yweGBEAUQzhZctskucQqAzsw2
 Te0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqTwkgbgsn+9/anqIIsDPpEOk8Ha2SkYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBN/BFgHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4vG4WyKRBaJ9sldrVj
 Kj741452XOrFCH2BZKbmqroYyjQ8YDuFM7+StffZcdUb556eWevpX81OhHPjjC9wRJywMnT3
 Kt3lu72Ux4n5VlPlmLqF4/xL5d3rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNDfDgicClgbbir+pM/SwJ2Clc/cI3XI6SKmu1Jlk0Mt/k9q9okC
 VnhABIFkwSm2iWcQehIA1g6AI7SsV9EhSpTFUQR0ZyAghDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:adKVb6tFOiidshepDXN0TTry7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58576689"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 19/47] build: start building the tools with the main makefiles
Date: Thu, 25 Nov 2021 13:39:38 +0000
Message-ID: <20211125134006.1076646-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will make out-of-tree build easier.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v8:
    - add some $(Q)

 xen/Makefile       |  8 ++++----
 xen/tools/Makefile | 17 ++---------------
 2 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index c26c44818916..06d5e4fd61c1 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -209,7 +209,7 @@ endif # root-make-done
 
 PHONY += tools_fixdep
 tools_fixdep:
-	$(MAKE) -C tools fixdep
+	$(Q)$(MAKE) $(build)=tools tools/fixdep
 
 ifeq ($(config-build),y)
 # ===========================================================================
@@ -247,7 +247,7 @@ ifeq ($(need-config),y)
 # "tools_fixdep" which is a .PHONY target and would force make to call
 # "defconfig" again to update $(KCONFIG_CONFIG).
 tools/fixdep:
-	$(MAKE) -C tools fixdep
+	$(Q)$(MAKE) $(build)=tools tools/fixdep
 
 # Allow people to just run `make` as before and not force them to configure
 $(KCONFIG_CONFIG): tools/fixdep
@@ -409,7 +409,7 @@ _debug:
 
 .PHONY: _clean
 _clean:
-	$(MAKE) -C tools clean
+	$(MAKE) $(clean) tools
 	$(MAKE) $(clean) include
 	$(MAKE) $(clean) common
 	$(MAKE) $(clean) drivers
@@ -438,7 +438,7 @@ $(TARGET).gz: $(TARGET)
 	mv $@.new $@
 
 $(TARGET): FORCE
-	$(MAKE) -C tools
+	$(Q)$(MAKE) $(build)=tools
 	$(Q)$(MAKE) $(build)=. include/xen/compile.h
 	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
 		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
diff --git a/xen/tools/Makefile b/xen/tools/Makefile
index 722f3664549d..a5078b7cb8de 100644
--- a/xen/tools/Makefile
+++ b/xen/tools/Makefile
@@ -1,15 +1,2 @@
-
-include $(XEN_ROOT)/Config.mk
-
-.PHONY: default
-default: symbols fixdep
-
-.PHONY: clean
-clean:
-	rm -f *.o symbols fixdep
-
-symbols: symbols.c
-	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
-
-fixdep: fixdep.c
-	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
+hostprogs-always-y += symbols
+hostprogs-always-y += fixdep
-- 
Anthony PERARD


