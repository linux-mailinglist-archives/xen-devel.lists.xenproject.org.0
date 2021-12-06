Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B57A46A23D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239444.415103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHS4-00051h-VW; Mon, 06 Dec 2021 17:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239444.415103; Mon, 06 Dec 2021 17:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHS4-0004t5-QM; Mon, 06 Dec 2021 17:06:56 +0000
Received: by outflank-mailman (input) for mailman id 239444;
 Mon, 06 Dec 2021 17:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOz-0005ti-Iy
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 777aeaf9-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:43 +0100 (CET)
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
X-Inumbo-ID: 777aeaf9-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7od1NQnHrZh8LHMHI1xfAIazt/3++YtpIBfjzwrGbJA=;
  b=T8m4sR9zUKBAtCIOe6QwybgT2k87mEfEvPWSj1B/bKn4UGSOWNQqGoGh
   NGYZRYV4oyS9Vxn/HxAf9+zoTq6bA9U17u7YQEXJm+t54ez2yjrwBKjUr
   tFVm+I7q7GWF14bLwPq1W8xSZacDdHQ940EhLJ/LLkOho2K6ikhKlfbOP
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Xad40hXYlKAP97Y0XfEAJkxukn9MI3i9GzdkP5YZpw7m6Hd7+KDeJvSY8Q4EDsJH8ws+osXi+V
 Zg51uPCmAI8d+/gD71lpZ0iUAF6FV4l3XPLVVwyFr2ZtxXRdH2DMlSNI2SQBiS9APcy9llBLSB
 I0nn/zCaaqMS8JQE2WqYTsWv6bSu0wrFkQivD3cl3ggQJ2CgG5lcLNJPFYEyAONTzAVI+H9Xen
 aMbLx9G5GC5+YUUM5NaE7qzCw4DUdaQ5DaWFuZZVuxSbOPEYHCypWfdG6Y2mBkPvyWK6mdZ7PZ
 rLNFJZsdziTo7wfFIiR5cmOw
X-SBRS: 5.1
X-MesageID: 59370631
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/8Ey5q8RxsQcCVQEY+dQDrUDenmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 2pKWDuGbv/bYTf0eNgjbdix8E0PsZ6EzdAxQQdqrng8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrRh3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgt9
 PQRn8G6DjsZFYzSt6MtfDheOTFhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0fRqmGO
 ZFAAdZpREznIDJgHwg0M5InwsixqUvWfw958E3A8MLb5ECMlVcsgdABKuH9e8OIbdVYmF6Co
 WDL9Hi/BQsVXPSAzRKV/3TqgfXA9Qv2XI8UHful+P9vnEae2GU7DwcfXl+25/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Uz7h2NzazFpR6UHGEeQhZObdUnsIk9QjlC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBTM+RHMuEAFC3+nIgZ8cySLgb9BJALHg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4ZdN7BJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVd0JiN2dDB0wWirhRdMPS
 BWJ0e+2zMUMVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOhDCyyhlxy/thZ
 sfznSOQ4ZAyU/4PIN2eHbh17FPW7npmmTO7qW7TkXxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Di9vmra8WnOnO/2ddKdTgidCFnbbir+50/XrPSeWJORTB+Y8I9NJt8IuSJaYwOzbyWl
 px8M2cFoGfCaYrvdV/XNys9Mey3Bv6SbxsTZEQRALph4FB7Ca7H0UvVX8JfkWAP+LMxwPhqY
 eMCfsncUP1DRi6eo2YWbIXnrZwkfxOu3FrcMy2gaTk5XphhWw2WpYO0IlqxrHEDXnitqM8zg
 7y8zQeHE5ANcBtvUZTNY/W1wlLv4XVEwLBuX1HFK8V4cVn39NQ4MDT4i/I6epleKRjKyjaA+
 RyRBBMU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTqtqqu4Z
 OhTw/XtC9E9nQ5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiENZ+3EFMVIwZ5PO2P2etNx2vX5PUxZk77+DV27PyMVkALZ0uAjylULb1UNoI5w
 Lh+5J5KulLn0hd6YMybii109niXKi1SWqoqgZgWHYv3h1d50VpFe5HdVnf77Zznhw+g6aX2z
 ut4XJb/uok=
IronPort-HdrOrdr: A9a23:2Fi/C6FVbeipoVA7pLqE7seALOsnbusQ8zAXP0AYc3Nom6uj5q
 eTdZUgpGbJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWntQts5
 uIGJIRNDSfNzRHZL7BkWqFL+o=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59370631"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 24/57] tools/debugger/gdbsx: Fix and cleanup makefiles
Date: Mon, 6 Dec 2021 17:02:07 +0000
Message-ID: <20211206170241.13165-25-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
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

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/debugger/gdbsx/Makefile    | 20 ++++++++++----------
 tools/debugger/gdbsx/gx/Makefile | 15 +++++++--------
 tools/debugger/gdbsx/xg/Makefile | 25 +++++++------------------
 3 files changed, 24 insertions(+), 36 deletions(-)

diff --git a/tools/debugger/gdbsx/Makefile b/tools/debugger/gdbsx/Makefile
index 8d7cd94a31..4aaf427c45 100644
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
-	set -e; for d in xg gx; do $(MAKE) -c $$d distclean; done
 
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
index 3b8467f799..ff5c8e9e6e 100644
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
+	ar cr $@ $(GX_OBJS)
 
+-include $(DEPS_INCLUDE)
diff --git a/tools/debugger/gdbsx/xg/Makefile b/tools/debugger/gdbsx/xg/Makefile
index acdcddf0d5..a02c7649cf 100644
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
+	ar cr $@ $(XG_OBJS)
 
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


