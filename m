Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C9559E09
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355601.583332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnX-0004uH-FK; Fri, 24 Jun 2022 16:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355601.583332; Fri, 24 Jun 2022 16:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnX-0004qt-CP; Fri, 24 Jun 2022 16:04:43 +0000
Received: by outflank-mailman (input) for mailman id 355601;
 Fri, 24 Jun 2022 16:04:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnW-0004qb-11
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58b2e4b9-f3d7-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 18:04:39 +0200 (CEST)
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
X-Inumbo-ID: 58b2e4b9-f3d7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Itv0TYjJaWvZTLhYwIDcVR+kB+4hcfXSmAszpJaqRIw=;
  b=d5w6S5JcxLmZpjIopIbB+NpkHkp6qA5FpkUn4OhefwStCBeNdRMKK3tz
   T0YLG7xGoRDYHQhQlIIQb4iwa10Md1/N5ke+bZ616oWTSgkJhmH74TO7P
   PzdCNAmZy97juqobN7EGbOVJRCu1+dNesZTKcX5b3JoLyi+M6gyjORwKG
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74384146
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6T68gK8mz+giWA6WQUxrDrUD7H6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DAZC2+GPqmIYWfxc9Fxbd+39hwCu5CHyNVmTgdt/H08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34LlW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCndvuVSt5AfXwor4+EF52DBguAJYZqLCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 JZCOWY2MEqojxtnPWslCqIutveUjTqhTBBgk1Co+ZUyyj2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkXMNGZwHyY/HOpmvTCgyrTX5gbH7m1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJuQRRDXh/iTC5ERFHYMNTatqs2lh15Y4/S7eWHQoHgEZVOZ8l4xxayMTh
 mKywIPmUGkHXKKudZ6NyluFhWrsZHZNdjJaOn9soRgtuIe6/txq5v7bZpM6SfPu0IWocd3l6
 2rSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ4xawZRGphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AAyQcF5pm3ypyb7Iui8BQ2Swm8zaq7onhe5C
 HI/RCsLvMMDVJdURfUfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDK6ENVVTRfIhQjFyRF0+YlmY
 MvzWZv8XB4yVPU8pBLrFrh17FPe7n1nrY8lbcuglErPPHv3TCP9dIrpx3PUP75gsv/b8V6Lm
 zudXuPToyhivCTFSnG/2eYuwZoidyBT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:0/L4CKkrZsycnx7pK6eYLneWYVXpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74384146"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 02/25] tools/debugger/gdbsx: Fix and cleanup makefiles
Date: Fri, 24 Jun 2022 17:03:59 +0100
Message-ID: <20220624160422.53457-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
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


