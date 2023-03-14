Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35736B9784
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509633.785775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RD-0005O3-No; Tue, 14 Mar 2023 14:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509633.785775; Tue, 14 Mar 2023 14:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RD-0005KM-KQ; Tue, 14 Mar 2023 14:15:39 +0000
Received: by outflank-mailman (input) for mailman id 509633;
 Tue, 14 Mar 2023 14:15:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQyL=7G=citrix.com=prvs=430d4338b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pc5RB-0004aK-Ql
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:15:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af971267-c272-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:15:36 +0100 (CET)
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
X-Inumbo-ID: af971267-c272-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678803336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A8tFjeqpaYYMHH549QY+2fBsFMwY3Y1/gunP80ksQ5U=;
  b=iamMQcwBJqX52bMALeR8BESFaQpQGlvoxdlvQduGRXVd4u69UOj2Euys
   V8lJGjLpYSJS7TAllH8vGxPXeFyAfCRjjikapV7fuvNLViA1N36/s33jU
   WrgbJchGQmcbEZS7a4eDddg3u0BMN/kmbfQC2/leKh800/Vk5sWwnGxwg
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100695474
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Y9OkbK5SZrjyYQxCuhtZawxRtCbHchMFZxGqfqrLsTDasY5as4F+v
 mcfXT2HM6ncYWL0c4hzbtuz9EgAvJeEyNZiTVBs/ilnHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS4AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 a0IJRQIbEi6l7i9w7e3RMV2pJw5I5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx7A+
 DObozulav0cHN6Y6jOb00mUvPaVx3ukY6gyGr+g98c/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JPF8Uq5QfLzbDbiy6cD3IBRyRMa/QnstE3Xj0g0
 lKVn9LvCidrubfTQnWYnop4thvrZ3JTdzVbI3ZZE01cuYKLTJwPYgznXodzHYqwjIXMCWv7w
 DWGogQkpe0Jgptev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BWO0e+yzMUJVJdPUUOQS9PZNijS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9ga
 cjAK5n2VytDUMyLKQZaoM9MuYLHOwhknT+DLXwF503PPUWiiI69Fu5ebQrmghER56KYugTFm
 +ti2z+x40wHCoXWO3CHmbP/2HhWdRDX87iq8Z0IHgNCSyI6cFwc5wj5muN5KtU1wvoIxo8lP
 BiVAydl9bY2vlWfQS3iV5ypQOmHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:yLvaFKHSa0ZdgASKpLqENMeALOsnbusQ8zAXPiFKOGdom6mj/P
 xG88506faZslsssTIb6LS90dC7IE80rKQU3WBzB8bBYOCFghrREGgK1+KLqQEIfReOk9K1vp
 0OT0ERMrHN5BdB/KHHCaSDYrAd6cjC2pqBwc3Zy25pTQlsYa0l1QFkEQyWe3cGJzWuQaBJba
 ah2g==
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100695474"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bernhard Kaindl
	<bernhard.kaindl@citrix.com>
Subject: [PATCH 5/7] tools: Use -s for python shebangs
Date: Tue, 14 Mar 2023 14:15:18 +0000
Message-ID: <20230314141520.3652451-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is mandated by the Fedora packaging guidelines because it is a security
vulnerability otherwise in suid scripts.  It's a very good idea generally,
because it prevents the users local python environment interfering from system
packaged scripts.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/Rules.mk        | 2 +-
 tools/pygrub/Makefile | 2 +-
 tools/python/Makefile | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 6e135387bd7e..18cf83f5be83 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -179,7 +179,7 @@ CFLAGS += $(CFLAGS-y)
 CFLAGS += $(EXTRA_CFLAGS_XEN_TOOLS)
 
 INSTALL_PYTHON_PROG = \
-	$(XEN_ROOT)/tools/python/install-wrap "$(PYTHON_PATH)" $(INSTALL_PROG)
+	$(XEN_ROOT)/tools/python/install-wrap "$(PYTHON_PATH) -s" $(INSTALL_PROG)
 
 %.opic: %.c
 	$(CC) $(CPPFLAGS) -DPIC $(CFLAGS) $(CFLAGS_$*.opic) -fPIC -c -o $@ $< $(APPEND_CFLAGS)
diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
index 29ad0513212f..04b3995cc0f6 100644
--- a/tools/pygrub/Makefile
+++ b/tools/pygrub/Makefile
@@ -7,7 +7,7 @@ PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
 INSTALL_LOG = build/installed_files.txt
 
 setup.py = CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" \
-           $(PYTHON) setup.py
+           $(PYTHON) setup.py --executable="$(PYTHON_PATH) -s"
 
 .PHONY: all
 all: build
diff --git a/tools/python/Makefile b/tools/python/Makefile
index cc764236478a..511e7deae409 100644
--- a/tools/python/Makefile
+++ b/tools/python/Makefile
@@ -12,7 +12,7 @@ setup.py = CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLA
            SHLIB_libxenctrl="$(SHLIB_libxenctrl)" \
            SHLIB_libxenguest="$(SHLIB_libxenguest)" \
            SHLIB_libxenstore="$(SHLIB_libxenstore)" \
-           $(PYTHON) setup.py
+           $(PYTHON) setup.py --executable="$(PYTHON_PATH) -s"
 
 .PHONY: build
 build:
-- 
2.30.2


