Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851DC59053F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384894.620468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBX3-00064C-6V; Thu, 11 Aug 2022 16:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384894.620468; Thu, 11 Aug 2022 16:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBX3-000609-0R; Thu, 11 Aug 2022 16:59:41 +0000
Received: by outflank-mailman (input) for mailman id 384894;
 Thu, 11 Aug 2022 16:59:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNd-0003s9-Dk
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0562e7a-1995-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:49:56 +0200 (CEST)
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
X-Inumbo-ID: a0562e7a-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236596;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cmy94LPQCKJ2pSbsopGeQjlv0UX9Mnp6syCdYZy088g=;
  b=C5oCy9Q4vdPUWCLlpol1v1PWjLlYgSyYheG5oeEEY1Eo8Xj3TTmC1tTw
   Qk2tj63N0G5Nuq/JDuuylU1KG3SnB6yXCkyLhdj81NE5c3L5e6KkXM1pY
   rc+itpK8eCD1ZaxotN2ncCCJHDiYPNUso7ZWg5+JBAQniQRSfskoCwnMF
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77134720
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CvI9rqLK7Tg4IyMGFE+RuZUlxSXFcZb7ZxGr2PjKsXjdYENS0DQBy
 mUdWWyPPP6OMTP8c49/Otm/9UJXv5fRztJgGgRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/La8Us11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE59FTUn8zJd0hoP9UOjxs7
 +UHCSEmcUXW7w626OrTpuhEg80iKI/gPZ8Fu2EmxjbcZRokacmdGeOQv4YehWpuwJAVdRrdT
 5NxhT5HZRLcYxpJKxEPBYg3huuAjXjjaTxI7lmSoMLb5kCMk1UqjOe3aLI5fPTNaJ9Iz3nDv
 l6WoVTTLQsKGuTD2CCspyfEaujnwnqgBdN6+KeD3uFuqE2ewCoUEhJ+fUG8uvOjjUm9XfpQL
 kUV/mwlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9bVagqImRtWOLYzE2FjIgfzYbbBou/Iy2yG0stS4jXuqPAYbs0IOtQWCvm
 mnUxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN51sJu8cKbSv3N/Ufj2eN5yMCk8Dd+SnNDKiIPrKinLAoHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6RMJruMow+lWLeb7pMjtcWKtUWnzy7qWbTk0v6itJzpRe9Fd84Dbd5RrxgsP/Y/V6Fr
 4832gnj40w3bdASqxL/qeY7RW3m51BhbXwqg6S7rtK+Hzc=
IronPort-HdrOrdr: A9a23:wX8Ne6ySDVnHluz0kOmjKrPwKr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZMmPH7P+U8ssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCFgguVxehZhOOIqQEIWReOk9K1vZ
 0QFZSWY+efMbEVt6rHCXGDYrUd/OU=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77134720"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v4 32/32] tools/golang/xenlight: Rework gengotypes.py and generation of *.gen.go
Date: Thu, 11 Aug 2022 17:48:45 +0100
Message-ID: <20220811164845.38083-33-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gengotypes.py creates both "types.gen.go" and "helpers.gen.go", but
make can start gengotypes.py twice. Rework the rules so that
gengotypes.py is executed only once.

Also, add the ability to provide a path to tell gengotypes.py where to
put the files. This doesn't matter yet but it will when for example
the script will be run from tools/ to generate the targets.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 tools/golang/xenlight/Makefile      |  6 ++++--
 tools/golang/xenlight/gengotypes.py | 10 +++++++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index 00e6d17f2b..c5bb6b94a8 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -15,8 +15,10 @@ all: build
 
 GOXL_GEN_FILES = types.gen.go helpers.gen.go
 
-%.gen.go: gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl $(LIBXL_SRC_DIR)/idl.py
-	LIBXL_SRC_DIR=$(LIBXL_SRC_DIR) $(PYTHON) gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl
+# This exploits the 'multi-target pattern rule' trick.
+# gentypes.py should be executed only once to make all the targets.
+$(subst .gen.,.%.,$(GOXL_GEN_FILES)): gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl $(LIBXL_SRC_DIR)/idl.py
+	LIBXL_SRC_DIR=$(LIBXL_SRC_DIR) $(PYTHON) gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl $(@D)/types.gen.go $(@D)/helpers.gen.go
 
 # Go will do its own dependency checking, and not actuall go through
 # with the build if none of the input files have changed.
diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index ac1cf060dd..ff4c2ad216 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -723,7 +723,13 @@ def xenlight_golang_fmt_name(name, exported = True):
     return words[0] + ''.join(x.title() for x in words[1:])
 
 if __name__ == '__main__':
+    if len(sys.argv) != 4:
+        print("Usage: gengotypes.py <idl> <types.gen.go> <helpers.gen.go>", file=sys.stderr)
+        sys.exit(1)
+
     idlname = sys.argv[1]
+    path_types = sys.argv[2]
+    path_helpers = sys.argv[3]
 
     (builtins, types) = idl.parse(idlname)
 
@@ -735,9 +741,11 @@ if __name__ == '__main__':
 // source: {}
 
 """.format(os.path.basename(sys.argv[0]),
-           ' '.join([os.path.basename(a) for a in sys.argv[1:]]))
+           os.path.basename(sys.argv[1]))
 
     xenlight_golang_generate_types(types=types,
+                                   path=path_types,
                                    comment=header_comment)
     xenlight_golang_generate_helpers(types=types,
+                                     path=path_helpers,
                                      comment=header_comment)
-- 
Anthony PERARD


