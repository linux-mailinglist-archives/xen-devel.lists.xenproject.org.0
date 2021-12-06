Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D910646A259
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239509.415327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTK-00087s-I0; Mon, 06 Dec 2021 17:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239509.415327; Mon, 06 Dec 2021 17:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTK-00084c-CB; Mon, 06 Dec 2021 17:08:14 +0000
Received: by outflank-mailman (input) for mailman id 239509;
 Mon, 06 Dec 2021 17:08:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOy-0005ti-Il
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76273470-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:42 +0100 (CET)
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
X-Inumbo-ID: 76273470-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vquC9c6kCd5w0itVlwryUdZY6Xf5eopjc/5kMFiENpA=;
  b=MU2UQfzsAPQsdhcN+yQpZ6Z4cvIpsW9atwYSpz+pGTMwC4J8f1bT0OUz
   nj/Agmy3Pw1rePed29tMBMkUIjfb2rho6cNFnYrYLX7kVRHcpSamknOLw
   oSZd3EOkElWCjZLj5bi/JuXs+C04sbu3EDF8fa0Avt+N9rMadka8C9grB
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PjI0lSRzKGh+01Gm8V8MTKvNoepTO8v0kB3HtlU9u2c3s6NbxJsbdJiwRR0qBiwd2i3V0o12EI
 lcp36u0e7+ov2/gJx/NJjikO7dg7Hu+jdFtQDUDSS9X0m0UyLfC9c+j9qTizC2RlOhFhmzwlYl
 L1/1im/wLthpD+odbJ7DT+fZgRxl1NyUT9q8SUJkLja2gt4zIBGO9tMoCYVaoo0DEvGmUfaIxZ
 6mn8QyZ0SeJ2SV0/LTbbh60zhmgJu2t7G8FxEdot6UsJVC6uP4cfmcDEmHFVEXxEitI5mooLeP
 BRiLBcFuiN0b9ZXO6sqXUsAd
X-SBRS: 5.1
X-MesageID: 59370624
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LRsjCamw/ODarrNOB8UXSeXo5gxnIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeCD/Qb/beMDP8KYt/aoXnphwG6sSEyYUwHFA+qH1gHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2NY22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NBJp6K5GCsuB4Lvm/tMAxVKTjN1AqITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKeFO
 JJHM2YHgBLocQxIAUgZDrIFxu6FlnvDfGZVk1WHqv9ii4TU5FMoi+W8WDbPQfSLWsd9jkuev
 njB/WnyHlcdLtP34SWB2mKhgKnIhyyTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ88ywyra805QqzQ8P0RRGQr3uNvxpaUN1Ve9DW8ynUlPCSuVzAQDFZEHgRM7TKqfPaWxQv0
 k23loLFAgVAk76KGCKR5OqGpgy9bH19wXA5WQcISg4M4t/GqY41jw7SQtsLLJNZnuEZChmrn
 WnU8XFWa6E7yJdSiv7lpQyvbyeE/8CRFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdgTQGY3h/5nzvp5p1QEwZ3Y1RfHNEBz3pBaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZ96kvKxSI6/CK+EBjarXnSXXFXdlM2JTRTPt10BbWB2yf1vU
 XtlWZjE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz8uYdykEW9EO9fWHPXN7hRxPrd/G39r
 oYOX+PXmk43eLCvPUHqHXs7cAliwY4TXsut9aS6t4erf2JbJY3WI6OLnO56JdU6x/89eyWh1
 ijVZ3K0AWHX3RXvQThmoFg5AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:rrlq2a86BdzPZfMURVluk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59370624"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 23/57] tools/debugger: Allow make to recurse into debugger/
Date: Mon, 6 Dec 2021 17:02:06 +0000
Message-ID: <20211206170241.13165-24-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Avoid the need for explicite rules to recurse into debugger/* dirs by
adding a Makefile in debugger/.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/Makefile          | 27 +--------------------------
 tools/debugger/Makefile |  8 ++++++++
 2 files changed, 9 insertions(+), 26 deletions(-)
 create mode 100644 tools/debugger/Makefile

diff --git a/tools/Makefile b/tools/Makefile
index 8936b754c8..79b4c7e3de 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -32,8 +32,7 @@ SUBDIRS-$(CONFIG_GOLANG) += golang
 SUBDIRS-y += xl
 SUBDIRS-y += helpers
 SUBDIRS-$(CONFIG_X86) += xenpaging
-SUBDIRS-$(CONFIG_X86) += debugger/gdbsx
-SUBDIRS-$(CONFIG_X86) += debugger/kdd
+SUBDIRS-$(CONFIG_X86) += debugger
 SUBDIRS-$(CONFIG_TESTS) += tests
 
 SUBDIRS-y += python
@@ -272,30 +271,6 @@ subdir-clean-qemu-xen-dir:
 
 subdir-uninstall-qemu-xen-dir: ;
 
-subdir-clean-debugger/gdbsx subdir-distclean-debugger/gdbsx: .phony
-	$(MAKE) -C debugger/gdbsx clean
-
-subdir-install-debugger/gdbsx: .phony
-	$(MAKE) -C debugger/gdbsx install
-
-subdir-all-debugger/gdbsx: .phony
-	$(MAKE) -C debugger/gdbsx all
-
-subdir-uninstall-debugger/gdbsx: .phony
-	$(MAKE) -C debugger/gdbsx uninstall
-
-subdir-clean-debugger/kdd subdir-distclean-debugger/kdd: .phony
-	$(MAKE) -C debugger/kdd clean
-
-subdir-install-debugger/kdd: .phony
-	$(MAKE) -C debugger/kdd install
-
-subdir-uninstall-debugger/kdd: .phony
-	$(MAKE) -C debugger/kdd uninstall
-
-subdir-all-debugger/kdd: .phony
-	$(MAKE) -C debugger/kdd all
-
 subtree-force-update:
 ifeq ($(CONFIG_QEMU_XEN),y)
 	$(MAKE) qemu-xen-dir-force-update
diff --git a/tools/debugger/Makefile b/tools/debugger/Makefile
new file mode 100644
index 0000000000..51efd3680b
--- /dev/null
+++ b/tools/debugger/Makefile
@@ -0,0 +1,8 @@
+XEN_ROOT=$(CURDIR)/../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+SUBDIRS-y := gdbsx
+SUBDIRS-y += kdd
+
+.PHONY: all clean install distclean uninstall
+all clean install distclean uninstall: %: subdirs-%
-- 
Anthony PERARD


