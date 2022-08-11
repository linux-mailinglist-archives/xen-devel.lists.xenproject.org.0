Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9585C590515
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384784.620260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMn-0003j0-HA; Thu, 11 Aug 2022 16:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384784.620260; Thu, 11 Aug 2022 16:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMn-0003gq-Cs; Thu, 11 Aug 2022 16:49:05 +0000
Received: by outflank-mailman (input) for mailman id 384784;
 Thu, 11 Aug 2022 16:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBMl-0003Aq-Ng
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fd7056e-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:02 +0200 (CEST)
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
X-Inumbo-ID: 7fd7056e-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gzc+84ow+LQ9Ng3mQt5cbeoe9zzNOiJroC8il6G69uY=;
  b=GlnYUnMLAfnEfL2OrJOt/rANRB3EZRMdKRoa+IrWckwN1VKtYMKNrhBP
   3UXYbvWfdpiKWd7rBU2AWg00N5KauagrltJpKEWVexVav3+hfzG9K7XUx
   rjKFIPc5I7yTznuyw1LuqGL770WF70eOsbUtDx2t3tLiUBa9qCABdO3gS
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77650091
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:t45c66xRkZX1kofBna56t+c5xirEfRIJ4+MujC+fZmUNrF6WrkUCx
 mFJDG6Ea/qLYTH9eYojbNvn8B5TusfSz9Q1TVNq+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Eo25K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1cIU91EaQx9NxQW19e6
 +1FITJdYw2M0rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzJZQFPPVEGToozhu6yilH0ciFCqULTrq0yi4TW5FMujuW1aIuMEjCMbfxIkFy0r
 Tr7xUmnD0s3b+CDymOv6G3504cjmgukAdlPRdVU7MVCjVmewGVVFRMXUEegrOewokmkUtlbJ
 gof/S9Ghbc23FymSJ/6RRLQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceQSEh3
 xmHltXiCDhrrZWcU3fb/bCRxQ5eIgBMczVEP3VdC1JYvZ+z++nfky4jUP5RPaD2ovTcFwvXm
 Q6asjljjrdDgNMEgvDTEU/8v968mnTYZldruF2PDz38t10RiJ2NPNLxtwWChRpUBMPAFwTa4
 iBZ8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirnUWWwC
 KMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YvLFfYpHg/NRPKhQgBdXTAdolhU
 ap3jO72VSpKYUiZ5GPeqxghPU8DmXllmDK7qWHTxBW7y7uODEOopUM+GALXNogRsfLbyDg5B
 v4FaKNmPT0DD7ClCsQWmKZPRW03wY8TWcmq95AKLb7fe2KL2ggJUpfs/F/oQKQ994w9qwsC1
 ivVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:+olYBam11KpyHAy5sEVcrer8bYXpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7wr5OUtQ4OxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyXMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77650091"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, "Wei
 Liu" <wl@xen.org>
Subject: [XEN PATCH v4 01/32] tools/debugger/gdbsx: Fix and cleanup makefiles
Date: Thu, 11 Aug 2022 17:48:14 +0100
Message-ID: <20220811164845.38083-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
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


