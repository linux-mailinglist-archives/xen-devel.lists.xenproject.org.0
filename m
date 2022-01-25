Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACA349B284
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:02:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260079.449176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJaD-0002hq-Ez; Tue, 25 Jan 2022 11:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260079.449176; Tue, 25 Jan 2022 11:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJaD-0002ec-Ag; Tue, 25 Jan 2022 11:01:53 +0000
Received: by outflank-mailman (input) for mailman id 260079;
 Tue, 25 Jan 2022 11:01:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJaB-0006t5-Hu
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30f482df-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:01:49 +0100 (CET)
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
X-Inumbo-ID: 30f482df-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6NtyguigdmpAVy3XmyEpSxkAyUQ0/bDb28AGSy6cQQs=;
  b=JvTjE/0IwYqE5EIfXVWYzPg12xTa+rf2IhU/9lhSEVN81iA0Ksk1Eu/+
   g32jH+IFuqYkK6SAiZfLuAVH4fHTSv+32dQF72yKlP9m+7HxxqZ4QZAk+
   fOspcXapEScgJI7l8dx7kkF/5Mn8IB43RaQzofE6QWs/J34iaTiLCwvTo
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fK67t9pUKJNe4MPgUuNFLf1GRs8bkX/wBbrV3zhDmsB89o2CyptNOR2FpRiilanhc9/l4fNAVq
 iHN3FIoXHiZ71o3G84ixspgRrpDDIr7PaN4lC17ei8yuIMvdiw1CNcCtQIgC2S8Iw6Vz/tseRI
 8or+7vqTx/2ewYRtreITHsTh0e2k51QLN7bRr/52NyhIKcFYXy1L+OpAlC+qz3KFf/vKyQ7Cd0
 A+L3r2BeAxRV/xljPWPj9hTLzUOmv5QdXlnWXRD6nhyjKAIoJXFsQwKga6ufcuouiaTRu6mkRf
 z4Xana1YIbKqOTsOOE2c2P/x
X-SBRS: 5.2
X-MesageID: 62699880
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RaKMg6NgHTGdfgPvrR1ZkMFynXyQoLVcMsEvi/4bfWQNrUolgT0Cz
 WJKXmGCMvyMNGf1fth/bN/npx4O7MDdx4BrTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Eg+w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2Wojctry
 oVcjpafdSF1FIfiuckwVyANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgm1u15EeTa62i
 8wxVBZibzHYPEZ0JVpULJwzzcSD2kn+SmgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSAzRKV/3TqgfXA9Qv5RYYTGbuQ5vNsxlqJyQQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzW6qnOZuh8XW/JLDvY3rgqKz8LpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BVR19q6eXGWOm/Jioi2+YEwY0AEIGXHpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzliPBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn0v55p0xWG2DaD+qXNERz3pxZPmqgLuFlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i+DqyFMYUQM8kpHONiwM2ITRTMt4wKuBN0+ZzTx
 L/BKZr8ZZrkIfoPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilksDOMWjPHi/2dNDfDgicClgbbir+pM/SwJ2Clc8cI3XI6WPkepJlk0Mt/k9q9okC
 VnkChYHkwKu3COeQehIA1g6AI7SsV9EhSpTFUQR0ZyAghDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:tjaQ3KuCMc8jM2n10E+HCm867skDStV00zEX/kB9WHVpm6uj5q
 STdZUgpHrJYVkqKRIdcLy7WZVoIkmzyXcW2/h3AV7KZmCP0gaVxelZnO3fKlbbak/DH4BmtZ
 uIWpIOceEZUjNB5voSmjPWLz+L+qj+zEnSv4vj80s=
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62699880"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v9 16/30] build: start building the tools with the main makefiles
Date: Tue, 25 Jan 2022 11:00:49 +0000
Message-ID: <20220125110103.3527686-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
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
index 0705e67a9e7d..6c5c69d2e19b 100644
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
@@ -406,7 +406,7 @@ _debug:
 
 .PHONY: _clean
 _clean:
-	$(MAKE) -C tools clean
+	$(MAKE) $(clean) tools
 	$(MAKE) $(clean) include
 	$(MAKE) $(clean) common
 	$(MAKE) $(clean) drivers
@@ -435,7 +435,7 @@ $(TARGET).gz: $(TARGET)
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


