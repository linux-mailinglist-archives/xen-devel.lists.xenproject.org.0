Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2714C486B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279183.476824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI4-0008SP-72; Fri, 25 Feb 2022 15:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279183.476824; Fri, 25 Feb 2022 15:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI4-0008NN-0z; Fri, 25 Feb 2022 15:13:52 +0000
Received: by outflank-mailman (input) for mailman id 279183;
 Fri, 25 Feb 2022 15:13:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcI2-0007Bf-FK
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87999e26-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:13:49 +0100 (CET)
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
X-Inumbo-ID: 87999e26-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Itv0TYjJaWvZTLhYwIDcVR+kB+4hcfXSmAszpJaqRIw=;
  b=E0BA9QO3L+to8fOVx0uIWCjXSqGyG0PnVEPKKd5kxjkvzElXPpjyHuCp
   MbxHEbK5zzFQLHz6Jg87jPE7poALanePy/90sBL+gSYxY20xqQayggyjo
   y5/ybP9oAqcV3NzcBY2xT1WrwGbdJNc8nIDoyElRMdzNoj7uEW5g56Z0v
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65407512
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:33+IyK61u+7MofRIySmgkwxRtDbHchMFZxGqfqrLsTDasY5as4F+v
 mYYUWGHOP+IYGbyctl0Pdm09UtU65PWyNZjSVNo/Co8Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YLjXlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurTuRUQ0F/f1mt4XTiN0Ixxcfv1Bu+TIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5RENWIwMU2aC/FJEnlJT7xhp8Kuv2fESz5alV6siqxmvkGGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyOdiSzzPD73ytg/PUkD3ycIUIHba8+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixWGRHUxcbUd4cvtIMaQwX9
 BzZmJCyCmk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+hL1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHd7
 RDoeODEtYji6K1hcgTXEY3h+5nzup643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK518Mu8MKYCbyNfcvC25UNyjM5fKxfTgCfqqJBuein7ArLFPXlM2QTRT4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOdUWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7alPEE6MOc7cDg3EJTMLcuu+pwPK7XaeVIO9aNII6a5/I7NsrdNx8x9/tokN
 FnnBye0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:eIo/va5jHKV2WBVJ4QPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65407512"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 02/29] tools/debugger/gdbsx: Fix and cleanup makefiles
Date: Fri, 25 Feb 2022 15:12:54 +0000
Message-ID: <20220225151321.44126-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
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
---

Notes:
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


