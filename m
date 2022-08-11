Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2986E59053D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384877.620403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBWt-0004C9-OF; Thu, 11 Aug 2022 16:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384877.620403; Thu, 11 Aug 2022 16:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBWt-0004AE-K9; Thu, 11 Aug 2022 16:59:31 +0000
Received: by outflank-mailman (input) for mailman id 384877;
 Thu, 11 Aug 2022 16:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNI-0003Aq-HJ
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93f71ad2-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:34 +0200 (CEST)
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
X-Inumbo-ID: 93f71ad2-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Trsd0GfZi3ovEtSWpQIjoAN7t64kJh+RAV0yxYm0vI=;
  b=amettWsLI7OueoTswHpZSGJnbsAR2cGNi800YlARKKtvJ0U1NZ5WASS/
   3BtKJ1/GCQHhYwtuihkoc8c8Am3Ojd5juRMM3B38b0Q79cp0x5PBePkhF
   SVHNp5rCLIeFeWQqK/RqUn8P/v4429DAe5+33j3J+9K9gYzISNDiLHjEf
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77650154
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:a3o9sa6OdjGLoCRMKZviiwxRtPzHchMFZxGqfqrLsTDasY5as4F+v
 jNKWGzSa/3ZY2anfI1yadywpBtQ7J6An9ZlHgY6+H03Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks/5a2q4lv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJBoUFtFA5NgwO1pD+
 fokJw4CbxDYvP3jldpXSsE07igiBMziPYdZsXB81zDJS/0hRPgvQY2Tu4Uehm1pwJkTQ7COP
 KL1ahI2BPjESxRJJlcQDoN4hOqyj2PzWzZZtEiUtew85G27IAlZj+ezbYKMJ4DiqcN9mES8o
 2eY+V3COEs2Mc6AlQaj6zG2v7qa9c/8cN1LT+DpnhJwu3Wf3ncWCQEWfVKjrOOll1WlXNZCN
 00T/DFopq83nGSpQcP6RAaQu2Ofs1gXXN84O+Ez9gyl0Kff5AedQG8eQVZpdN0jnN87Q3otz
 FDht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLv4Ubnh/JCNF5H8adg9n4Hzi23
 j6LqTQliqsapckR3q6/8BbMhDfEm3TSZldrvEONBDvjt14nIt7+D2C11bTFxa1iB9rBUGfGh
 kMJl86i494BDJHWrzPYFY3hA4qVC+a53Cz02AAxR8FwqG30pRZPbqgLvmggeR4B3tIsPGawP
 RSN4V45CIp7ZiPCUENhX26m5y3GJ4DEHM+taP3bZ8EmjnNZJF7ep3EGiaJ9MgnQfKkQfUIXY
 87znT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiDNEehdaQreM7pjhE9hnOky2
 4g3Cid3408HDL2Wjtf/qOb/0mzm3VBkXMur+qS7h8aIIxZ8GXFJNsI9NYgJItU994wIx7igw
 51IchUHoLYJrSGYdF7ih7EKQO+HYKuTWlpnZHBwYQvziyR6CWtthY9GH6YKkXAc3LQL5ZZJo
 zMtJ61s3twnpuz7xgkg
IronPort-HdrOrdr: A9a23:Fx+fd687eD9CjRqMBTFuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77650154"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, Wei Liu <wl@xen.org>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, Tim Deegan <tim@xen.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, David Scott
	<dave@recoil.org>
Subject: [XEN PATCH v4 21/32] tools: Remove -Werror everywhere else
Date: Thu, 11 Aug 2022 17:48:34 +0100
Message-ID: <20220811164845.38083-22-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch "tools: Add -Werror by default to all tools/" have added
"-Werror" to CFLAGS in tools/Rules.mk, remove it from every other
makefiles as it is now duplicated.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
 tools/console/client/Makefile   | 1 -
 tools/console/daemon/Makefile   | 1 -
 tools/debugger/kdd/Makefile     | 1 -
 tools/flask/utils/Makefile      | 1 -
 tools/fuzz/cpu-policy/Makefile  | 2 +-
 tools/misc/Makefile             | 1 -
 tools/tests/cpu-policy/Makefile | 2 +-
 tools/tests/depriv/Makefile     | 2 +-
 tools/tests/resource/Makefile   | 1 -
 tools/tests/tsx/Makefile        | 1 -
 tools/tests/xenstore/Makefile   | 1 -
 tools/xcutils/Makefile          | 2 --
 tools/xenmon/Makefile           | 1 -
 tools/xenpaging/Makefile        | 1 -
 tools/xenpmd/Makefile           | 1 -
 tools/xentop/Makefile           | 2 +-
 tools/xentrace/Makefile         | 2 --
 tools/xl/Makefile               | 2 +-
 tools/debugger/gdbsx/Rules.mk   | 2 +-
 tools/firmware/Rules.mk         | 2 --
 tools/libfsimage/common.mk      | 2 +-
 tools/libs/libs.mk              | 2 +-
 tools/ocaml/common.make         | 2 +-
 tools/xenstore/Makefile.common  | 1 -
 24 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/tools/console/client/Makefile b/tools/console/client/Makefile
index e2f2554f92..62d89fdeb9 100644
--- a/tools/console/client/Makefile
+++ b/tools/console/client/Makefile
@@ -1,7 +1,6 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -Werror
 CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenstore)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
diff --git a/tools/console/daemon/Makefile b/tools/console/daemon/Makefile
index 99bb33b6a2..9fc3b6711f 100644
--- a/tools/console/daemon/Makefile
+++ b/tools/console/daemon/Makefile
@@ -1,7 +1,6 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -Werror
 CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenstore)
 CFLAGS += $(CFLAGS_libxenevtchn)
diff --git a/tools/debugger/kdd/Makefile b/tools/debugger/kdd/Makefile
index 26116949d4..a72ad3b1e0 100644
--- a/tools/debugger/kdd/Makefile
+++ b/tools/debugger/kdd/Makefile
@@ -1,7 +1,6 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS  += -Werror
 CFLAGS  += $(CFLAGS_libxenctrl)
 CFLAGS  += -DXC_WANT_COMPAT_MAP_FOREIGN_API
 LDLIBS  += $(LDLIBS_libxenctrl)
diff --git a/tools/flask/utils/Makefile b/tools/flask/utils/Makefile
index 6be134142a..88d7edb6b1 100644
--- a/tools/flask/utils/Makefile
+++ b/tools/flask/utils/Makefile
@@ -1,7 +1,6 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -Werror
 CFLAGS += $(CFLAGS_libxenctrl)
 
 TARGETS := flask-loadpolicy flask-setenforce flask-getenforce flask-label-pci flask-get-bool flask-set-bool
diff --git a/tools/fuzz/cpu-policy/Makefile b/tools/fuzz/cpu-policy/Makefile
index 41a2230408..6e7743e0aa 100644
--- a/tools/fuzz/cpu-policy/Makefile
+++ b/tools/fuzz/cpu-policy/Makefile
@@ -17,7 +17,7 @@ install: all
 
 .PHONY: uninstall
 
-CFLAGS += -Werror $(CFLAGS_xeninclude) -D__XEN_TOOLS__
+CFLAGS += $(CFLAGS_xeninclude) -D__XEN_TOOLS__
 CFLAGS += $(APPEND_CFLAGS) -Og
 
 vpath %.c ../../../xen/lib/x86
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 0e02401227..1c6e1d6a04 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -1,7 +1,6 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -Werror
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += $(CFLAGS_libxenevtchn)
diff --git a/tools/tests/cpu-policy/Makefile b/tools/tests/cpu-policy/Makefile
index 93af9d76fa..c5b81afc71 100644
--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -36,7 +36,7 @@ install: all
 uninstall:
 	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGETS))
 
-CFLAGS += -Werror -D__XEN_TOOLS__
+CFLAGS += -D__XEN_TOOLS__
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(APPEND_CFLAGS)
 
diff --git a/tools/tests/depriv/Makefile b/tools/tests/depriv/Makefile
index 3cba28da25..7d9e3b01bb 100644
--- a/tools/tests/depriv/Makefile
+++ b/tools/tests/depriv/Makefile
@@ -1,7 +1,7 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -Werror -Wno-declaration-after-statement
+CFLAGS += -Wno-declaration-after-statement
 
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
index b3cd70c06d..a5856bf095 100644
--- a/tools/tests/resource/Makefile
+++ b/tools/tests/resource/Makefile
@@ -27,7 +27,6 @@ install: all
 uninstall:
 	$(RM) -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
 
-CFLAGS += -Werror
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenforeginmemory)
diff --git a/tools/tests/tsx/Makefile b/tools/tests/tsx/Makefile
index d7d2a5d95e..a4f516b725 100644
--- a/tools/tests/tsx/Makefile
+++ b/tools/tests/tsx/Makefile
@@ -26,7 +26,6 @@ uninstall:
 .PHONY: uninstall
 uninstall:
 
-CFLAGS += -Werror
 CFLAGS += -I$(XEN_ROOT)/tools/libs/ctrl -I$(XEN_ROOT)/tools/libs/guest
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
diff --git a/tools/tests/xenstore/Makefile b/tools/tests/xenstore/Makefile
index 239e1dce47..202dda0d3c 100644
--- a/tools/tests/xenstore/Makefile
+++ b/tools/tests/xenstore/Makefile
@@ -27,7 +27,6 @@ install: all
 uninstall:
 	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGETS))
 
-CFLAGS += -Werror
 CFLAGS += $(CFLAGS_libxenstore)
 CFLAGS += $(APPEND_CFLAGS)
 
diff --git a/tools/xcutils/Makefile b/tools/xcutils/Makefile
index e40a2c4bfa..3687f6cd8f 100644
--- a/tools/xcutils/Makefile
+++ b/tools/xcutils/Makefile
@@ -13,8 +13,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 TARGETS := readnotes lsevtchn
 
-CFLAGS += -Werror
-
 CFLAGS_readnotes.o  := $(CFLAGS_libxenevtchn) $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
 CFLAGS_lsevtchn.o   := $(CFLAGS_libxenevtchn) $(CFLAGS_libxenctrl)
 
diff --git a/tools/xenmon/Makefile b/tools/xenmon/Makefile
index 3e150b0659..679c4b41a3 100644
--- a/tools/xenmon/Makefile
+++ b/tools/xenmon/Makefile
@@ -13,7 +13,6 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS  += -Werror
 CFLAGS  += $(CFLAGS_libxenevtchn)
 CFLAGS  += $(CFLAGS_libxenctrl)
 LDLIBS  += $(LDLIBS_libxenctrl)
diff --git a/tools/xenpaging/Makefile b/tools/xenpaging/Makefile
index e2ed9eaa3f..835cf2b965 100644
--- a/tools/xenpaging/Makefile
+++ b/tools/xenpaging/Makefile
@@ -12,7 +12,6 @@ OBJS-y   += xenpaging.o
 OBJS-y   += policy_$(POLICY).o
 OBJS-y   += pagein.o
 
-CFLAGS   += -Werror
 CFLAGS   += -Wno-unused
 
 TARGETS := xenpaging
diff --git a/tools/xenpmd/Makefile b/tools/xenpmd/Makefile
index e0d3f06ab2..8da20510b5 100644
--- a/tools/xenpmd/Makefile
+++ b/tools/xenpmd/Makefile
@@ -1,7 +1,6 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -Werror
 CFLAGS += $(CFLAGS_libxenstore)
 
 LDLIBS += $(LDLIBS_libxenstore)
diff --git a/tools/xentop/Makefile b/tools/xentop/Makefile
index 7bd96f34d5..70cc2211c5 100644
--- a/tools/xentop/Makefile
+++ b/tools/xentop/Makefile
@@ -13,7 +13,7 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -DGCC_PRINTF -Werror $(CFLAGS_libxenstat)
+CFLAGS += -DGCC_PRINTF $(CFLAGS_libxenstat)
 LDLIBS += $(LDLIBS_libxenstat) $(CURSES_LIBS) $(TINFO_LIBS) $(SOCKET_LIBS) -lm
 CFLAGS += -DHOST_$(XEN_OS)
 
diff --git a/tools/xentrace/Makefile b/tools/xentrace/Makefile
index 63f2f6532d..d50d400472 100644
--- a/tools/xentrace/Makefile
+++ b/tools/xentrace/Makefile
@@ -1,8 +1,6 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -Werror
-
 CFLAGS += $(CFLAGS_libxenevtchn)
 CFLAGS += $(CFLAGS_libxenctrl)
 LDLIBS += $(LDLIBS_libxenevtchn)
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index b7f439121a..5f7aa5f46c 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -5,7 +5,7 @@
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
+CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
 	-Wno-declaration-after-statement -Wformat-nonliteral
 CFLAGS += -fPIC
 
diff --git a/tools/debugger/gdbsx/Rules.mk b/tools/debugger/gdbsx/Rules.mk
index 920f1c87fb..0610db873b 100644
--- a/tools/debugger/gdbsx/Rules.mk
+++ b/tools/debugger/gdbsx/Rules.mk
@@ -1,6 +1,6 @@
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS   += -Werror -Wmissing-prototypes 
+CFLAGS   += -Wmissing-prototypes 
 # (gcc 4.3x and later)   -Wconversion -Wno-sign-conversion
 
 CFLAGS-$(clang) += -Wno-ignored-attributes
diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index 278cca01e4..d3482c9ec4 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -11,8 +11,6 @@ ifneq ($(debug),y)
 CFLAGS += -DNDEBUG
 endif
 
-CFLAGS += -Werror
-
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
 $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
diff --git a/tools/libfsimage/common.mk b/tools/libfsimage/common.mk
index 77bc957f27..4fc8c66795 100644
--- a/tools/libfsimage/common.mk
+++ b/tools/libfsimage/common.mk
@@ -2,7 +2,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 FSDIR := $(libdir)/xenfsimage
 CFLAGS += -Wno-unknown-pragmas -I$(XEN_ROOT)/tools/libfsimage/common/ -DFSIMAGE_FSDIR=\"$(FSDIR)\"
-CFLAGS += -Werror -D_GNU_SOURCE
+CFLAGS += -D_GNU_SOURCE
 LDFLAGS += -L../common/
 
 PIC_OBJS = $(patsubst %.c,%.opic,$(LIB_SRCS-y))
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 2b8e7a6128..e47fb30ed4 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -14,7 +14,7 @@ MINOR ?= 0
 
 SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map
 
-CFLAGS   += -Werror -Wmissing-prototypes
+CFLAGS   += -Wmissing-prototypes
 CFLAGS   += $(CFLAGS_xeninclude)
 CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
 
diff --git a/tools/ocaml/common.make b/tools/ocaml/common.make
index d5478f626f..0c8a597d5b 100644
--- a/tools/ocaml/common.make
+++ b/tools/ocaml/common.make
@@ -9,7 +9,7 @@ OCAMLLEX ?= ocamllex
 OCAMLYACC ?= ocamlyacc
 OCAMLFIND ?= ocamlfind
 
-CFLAGS += -fPIC -Werror -I$(shell ocamlc -where)
+CFLAGS += -fPIC -I$(shell ocamlc -where)
 
 OCAMLOPTFLAG_G := $(shell $(OCAMLOPT) -h 2>&1 | sed -n 's/^  *\(-g\) .*/\1/p')
 OCAMLOPTFLAGS = $(OCAMLOPTFLAG_G) -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -cc $(CC) -w F -warn-error F
diff --git a/tools/xenstore/Makefile.common b/tools/xenstore/Makefile.common
index 21b78b0538..ddbac052ac 100644
--- a/tools/xenstore/Makefile.common
+++ b/tools/xenstore/Makefile.common
@@ -9,7 +9,6 @@ XENSTORED_OBJS-$(CONFIG_NetBSD) += xenstored_posix.o
 XENSTORED_OBJS-$(CONFIG_FreeBSD) += xenstored_posix.o
 XENSTORED_OBJS-$(CONFIG_MiniOS) += xenstored_minios.o
 
-CFLAGS += -Werror
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += -I./include
-- 
Anthony PERARD


