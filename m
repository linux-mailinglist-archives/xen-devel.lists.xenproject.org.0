Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7327D5FD9D5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422022.667836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixu4-0002nb-N4; Thu, 13 Oct 2022 13:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422022.667836; Thu, 13 Oct 2022 13:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixu4-0002l6-Hr; Thu, 13 Oct 2022 13:05:36 +0000
Received: by outflank-mailman (input) for mailman id 422022;
 Thu, 13 Oct 2022 13:05:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixu2-0001tl-A9
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaab2a2c-4af7-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 15:05:11 +0200 (CEST)
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
X-Inumbo-ID: aaab2a2c-4af7-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T3wLDMvbCGyUm6GzXD79EfIEyV5ODCruMFeaxkCe9VE=;
  b=WsZLPhToWjgrBCg3JpX+NIY3/fxBY3e5nr4mJlYZeT+/PF8aiYppnQiR
   npM4SszcL3ml5VouJ7Fqke1z/U6qpCd9YisulX+7FIorfclxJeHHz8VEx
   mdxogVyhP/0tpfK09uqN87QFk0JhzdXWjQ1IVwG02/Ds3J0cAmBnHEs/M
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81760194
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ObRFwqrMkzW0IdVUJtHsmJ3ByXxeBmI/ZRIvgKrLsJaIsI4StFCzt
 garIBnTaPnYZTf9eYgiYY2yoBhXv5LTnNcwTApo/iFkF3wW9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgS5weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 qYqFXMpNBm6ldmkm56qSNldhNozBZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0FxxnG/
 juXowwVBDkFKtrE5SCB9Ui8j+3jlyHeZIEWJr2Ro6sCbFq7mTVIVUx+uUGAifS9h0i3Hc9RK
 kkI4ScwpIA17kWgStS7VBq9yFabujYMVtwWFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmLmIQnvb+L6Spj62PTU9JHUHIyQDSGM4D8LL+d9pyEiVF5A6TfDz3oad9SzML
 y6is3IMuvY318cyxZ6ppnzWgQKdpIbZZ1tgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9jsYyjJ5fK6fTgAahwzRosmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWToGrlFiedzmH9nnws/oKwXKDz+iNKjiIO9E+9ZYDNikMhjhE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuELz+FlBiXMieliCiXrTcSuaQMD1+VqS5LHJIU9ANopm5Yc+Ro
 iHgBR4GlgCi7ZAFQC3TAk1ehHrUdc4XhRoG0eYEYz5EB1BLjV6T0Zoi
IronPort-HdrOrdr: A9a23:rAEvH6zEZS6GO8WNncLpKrPwKr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZMmPH7P+U8ssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCFgguVxehZhOOIqQEIWReOk9K1vZ
 0QFZSWY+efMbEVt6rHCXGDYrUd/OU=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="81760194"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, "Wei
 Liu" <wl@xen.org>
Subject: [XEN PATCH for-4.17 v5 01/17] tools/debugger/gdbsx: Fix and cleanup makefiles
Date: Thu, 13 Oct 2022 14:04:57 +0100
Message-ID: <20221013130513.52440-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gdbsx/:
  - Make use of subdir facility for the "clean" target.
  - No need to remove the *.a, they aren't in this dir.
  - Avoid calling "distclean" in subdirs as "distclean" targets do only
    call "clean", and the "clean" also runs "clean" in subdirs.
  - Avoid the need to make "gx_all.a" and "xg_all.a" in the "all"
    recipe by forcing make to check for update of "xg/xg_all.a" and
    "gx/gx_all.a" by having "FORCE" as prerequisite. Now, when making
    "gdbsx", make will recurse even when both *.a already exist.
  - List target in $(TARGETS).

gdbsx/*/:
  - Fix dependency on *.h.
  - Remove some dead code.
  - List targets in $(TARGETS).
  - Remove "build" target.
  - Cleanup "clean" targets.
  - remove comments about the choice of "ar" instead of "ld"
  - Use "$(AR)" instead of plain "ar".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---

Notes:
    missing-ack: GDBSX DEBUGGER
    
    v2:
    - also replace plain "ar" by "$(AR)"

 tools/debugger/gdbsx/Makefile    | 20 ++++++++++----------
 tools/debugger/gdbsx/gx/Makefile | 15 +++++++--------
 tools/debugger/gdbsx/xg/Makefile | 25 +++++++------------------
 3 files changed, 24 insertions(+), 36 deletions(-)

diff --git a/tools/debugger/gdbsx/Makefile b/tools/debugger/gdbsx/Makefile
index 5571450a89..4aaf427c45 100644
--- a/tools/debugger/gdbsx/Makefile
+++ b/tools/debugger/gdbsx/Makefile
@@ -1,20 +1,20 @@
 XEN_ROOT = $(CURDIR)/../../..
 include ./Rules.mk
 
+SUBDIRS-y += gx
+SUBDIRS-y += xg
+
+TARGETS := gdbsx
+
 .PHONY: all
-all:
-	$(MAKE) -C gx
-	$(MAKE) -C xg
-	$(MAKE) gdbsx
+all: $(TARGETS)
 
 .PHONY: clean
-clean:
-	rm -f xg_all.a gx_all.a gdbsx
-	set -e; for d in xg gx; do $(MAKE) -C $$d clean; done
+clean: subdirs-clean
+	rm -f $(TARGETS)
 
 .PHONY: distclean
 distclean: clean
-	set -e; for d in xg gx; do $(MAKE) -C $$d distclean; done
 
 .PHONY: install
 install: all
@@ -28,7 +28,7 @@ uninstall:
 gdbsx: gx/gx_all.a xg/xg_all.a 
 	$(CC) $(LDFLAGS) -o $@ $^
 
-xg/xg_all.a:
+xg/xg_all.a: FORCE
 	$(MAKE) -C xg
-gx/gx_all.a:
+gx/gx_all.a: FORCE
 	$(MAKE) -C gx
diff --git a/tools/debugger/gdbsx/gx/Makefile b/tools/debugger/gdbsx/gx/Makefile
index 3b8467f799..e9859aea9c 100644
--- a/tools/debugger/gdbsx/gx/Makefile
+++ b/tools/debugger/gdbsx/gx/Makefile
@@ -2,21 +2,20 @@ XEN_ROOT = $(CURDIR)/../../../..
 include ../Rules.mk
 
 GX_OBJS := gx_comm.o gx_main.o gx_utils.o gx_local.o
-GX_HDRS := $(wildcard *.h)
+
+TARGETS := gx_all.a
 
 .PHONY: all
-all: gx_all.a
+all: $(TARGETS)
 
 .PHONY: clean
 clean:
-	rm -rf gx_all.a *.o .*.d
+	rm -f *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
 
-#%.o: %.c $(GX_HDRS) Makefile
-#	$(CC) -c $(CFLAGS) -o $@ $<
-
-gx_all.a: $(GX_OBJS) Makefile $(GX_HDRS)
-	ar cr $@ $(GX_OBJS)        # problem with ld using -m32 
+gx_all.a: $(GX_OBJS) Makefile
+	$(AR) cr $@ $(GX_OBJS)
 
+-include $(DEPS_INCLUDE)
diff --git a/tools/debugger/gdbsx/xg/Makefile b/tools/debugger/gdbsx/xg/Makefile
index acdcddf0d5..05325d6d81 100644
--- a/tools/debugger/gdbsx/xg/Makefile
+++ b/tools/debugger/gdbsx/xg/Makefile
@@ -1,35 +1,24 @@
 XEN_ROOT = $(CURDIR)/../../../..
 include ../Rules.mk
 
-XG_HDRS := xg_public.h 
 XG_OBJS := xg_main.o 
 
 CFLAGS += -D__XEN_TOOLS__
 CFLAGS += $(CFLAGS_xeninclude)
 
+TARGETS := xg_all.a
 
 .PHONY: all
-all: build
+all: $(TARGETS)
 
-.PHONY: build
-build: xg_all.a $(XG_HDRS) $(XG_OBJS) Makefile
-# build: mk-symlinks xg_all.a $(XG_HDRS) $(XG_OBJS) Makefile
-# build: mk-symlinks xg_all.a
-
-xg_all.a: $(XG_OBJS) Makefile $(XG_HDRS)
-	ar cr $@ $(XG_OBJS)    # problems using -m32 in ld 
-#	$(LD) -b elf32-i386 $(LDFLAGS) -r -o $@ $^
-#	$(CC) -m32 -c -o $@ $^
-
-# xg_main.o: xg_main.c Makefile $(XG_HDRS)
-#$(CC) -c $(CFLAGS) -o $@ $<
-
-# %.o: %.c $(XG_HDRS) Makefile  -- doesn't work as it won't overwrite Rules.mk
-#%.o: %.c       -- doesn't recompile when .c changed
+xg_all.a: $(XG_OBJS) Makefile
+	$(AR) cr $@ $(XG_OBJS)
 
 .PHONY: clean
 clean:
-	rm -rf xen xg_all.a $(XG_OBJS)  .*.d
+	rm -f $(TARGETS) $(XG_OBJS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
+
+-include $(DEPS_INCLUDE)
-- 
Anthony PERARD


