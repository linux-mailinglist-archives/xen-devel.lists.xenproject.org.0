Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E29B4C4871
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279184.476837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI6-0000PH-6c; Fri, 25 Feb 2022 15:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279184.476837; Fri, 25 Feb 2022 15:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI5-0000JJ-QD; Fri, 25 Feb 2022 15:13:53 +0000
Received: by outflank-mailman (input) for mailman id 279184;
 Fri, 25 Feb 2022 15:13:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcI3-0007Bf-D6
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89003833-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:13:50 +0100 (CET)
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
X-Inumbo-ID: 89003833-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vEj0fZWMl+R77ejhJIT+1IS4qvoqXeRC/IzY/VGgI/8=;
  b=PubzSiPEqzLM6y2qEjQkXxtemIuVSB681AKSO6dAEOVu9+vmhT53gpnv
   Owb4pm55w4vR0Wre/3k1WeNUByUzSnNosCRCGV3uYNJAssi6DH4smSOAz
   vtKLD7oZBDR9yCCPQBHDbUXbL6AfUGgx4izGFA3sm15oTKmf/b7sl10il
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65000282
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SOsCnq2e5JUL5bNoy/bD5bhxkn2cJEfYwER7XKvMYLTBsI5bpzNTn
 DQfUDzTaPmCamanfdtzYY/l80pUucfcn4U1SFdkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tQy3IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1jiZO0RgxwY5fFv9o+CDBkORNbA+pvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiDP
 5JBM2o1BPjGSyxVYgYoFs8mp+mTp2bHcQxil2y4mZNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrlH/EzVPCwH9+6PgzBfjBZQPc
 CT45xbCs4AcyEOvQdKkAiexh0Cn5Tcgceh1LaoTvVTlJrXv3y6VAW0NTzhkYdMgtdMrSTFC6
 mJlj+8FFhQ07uTLFCv1GqO86GrrZHNLdTNqiTosEFNdi+QPtr3fmf4mojxLNKeuxuP4Fjjrq
 9xhhHhv3u5D5SLnOkjSwLwmv95OjsSYJuLWzl+ONo5A0u+fTNT0D2BPwQKGhcus1K7DEjG8U
 IEswqByFtwmA5CXjzCqS+4QBryv7PvtGGSC3QMwQ8B9qmz1oybLkWVsDNdWfhYB3iEsI2KBX
 aMukVkJuM870IWCN8ebnL5d++x1lPO9RLwJp9jfb8ZUY4gZSeN01HoGWKJk5Ei0yBJEufhmY
 f+zKJ/wZV5HWfUP5GfnHI81jO50rh3SMEuOHPgXOTz8iuHADJNUIJ9YWGazghcRt/vV8F2Iq
 I8Eb6NnCXx3CYXDX8UeyqZLRXhiEJTxLcqeRxB/HgJbHjdbJQ==
IronPort-HdrOrdr: A9a23:/P8FrKqY77uZ9uNAHEuoI3oaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rsyMc6QxhIE3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaTN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65000282"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 09/29] tools/libfsimage: Cleanup makefiles
Date: Fri, 25 Feb 2022 15:13:01 +0000
Message-ID: <20220225151321.44126-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove the need for "fs-*" targets by creating a "common.mk" which
have flags that are common to libfsimage/common/ and the other
libfsimages/*/ directories.

In common.mk, make $(PIC_OBJS) a recursively expanded variable so it
doesn't matter where $(LIB_SRCS-y) is defined, and remove the extra
$(PIC_OBJS) from libfsimage/common/Makefile.

Use a $(TARGETS) variable to list things to be built. And $(TARGETS)
can be use in the clean target in common.mk.

iso9660/:
    Remove the explicit dependency between fsys_iso9660.c and
    iso9660.h, this is handled automaticaly by the .*.d dependency files,
    and iso9660.h already exist.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libfsimage/common/Makefile     | 11 +++--------
 tools/libfsimage/ext2fs-lib/Makefile |  9 ---------
 tools/libfsimage/ext2fs/Makefile     |  9 ---------
 tools/libfsimage/fat/Makefile        |  9 ---------
 tools/libfsimage/iso9660/Makefile    | 11 -----------
 tools/libfsimage/reiserfs/Makefile   |  9 ---------
 tools/libfsimage/ufs/Makefile        |  9 ---------
 tools/libfsimage/xfs/Makefile        |  9 ---------
 tools/libfsimage/zfs/Makefile        |  9 ---------
 tools/libfsimage/Rules.mk            | 26 ++++++++------------------
 tools/libfsimage/common.mk           | 11 +++++++++++
 11 files changed, 22 insertions(+), 100 deletions(-)
 create mode 100644 tools/libfsimage/common.mk

diff --git a/tools/libfsimage/common/Makefile b/tools/libfsimage/common/Makefile
index 0c5a34baea..79f8cfd28e 100644
--- a/tools/libfsimage/common/Makefile
+++ b/tools/libfsimage/common/Makefile
@@ -1,5 +1,5 @@
 XEN_ROOT = $(CURDIR)/../../..
-include $(XEN_ROOT)/tools/libfsimage/Rules.mk
+include $(XEN_ROOT)/tools/libfsimage/common.mk
 
 MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
 MINOR = 0
@@ -13,12 +13,10 @@ LDFLAGS += $(PTHREAD_LDFLAGS)
 
 LIB_SRCS-y = fsimage.c fsimage_plugin.c fsimage_grub.c
 
-PIC_OBJS := $(patsubst %.c,%.opic,$(LIB_SRCS-y))
-
-LIB = libxenfsimage.so libxenfsimage.so.$(MAJOR) libxenfsimage.so.$(MAJOR).$(MINOR)
+TARGETS = libxenfsimage.so libxenfsimage.so.$(MAJOR) libxenfsimage.so.$(MAJOR).$(MINOR)
 
 .PHONY: all
-all: $(LIB)
+all: $(TARGETS)
 
 .PHONY: install
 install: all
@@ -40,9 +38,6 @@ uninstall:
 	rm -f $(DESTDIR)$(libdir)/libxenfsimage.so.$(MAJOR)
 	rm -f $(DESTDIR)$(libdir)/libxenfsimage.so.$(MAJOR).$(MINOR)
 
-clean distclean::
-	rm -f $(LIB)
-
 libxenfsimage.so: libxenfsimage.so.$(MAJOR)
 	ln -sf $< $@
 libxenfsimage.so.$(MAJOR): libxenfsimage.so.$(MAJOR).$(MINOR)
diff --git a/tools/libfsimage/ext2fs-lib/Makefile b/tools/libfsimage/ext2fs-lib/Makefile
index 431a79068e..b9b560df75 100644
--- a/tools/libfsimage/ext2fs-lib/Makefile
+++ b/tools/libfsimage/ext2fs-lib/Makefile
@@ -9,13 +9,4 @@ FS_LIBDEPS = $(EXTFS_LIBS)
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/ext2fs/Makefile b/tools/libfsimage/ext2fs/Makefile
index c62ae359ac..fe01f98148 100644
--- a/tools/libfsimage/ext2fs/Makefile
+++ b/tools/libfsimage/ext2fs/Makefile
@@ -4,13 +4,4 @@ LIB_SRCS-y = fsys_ext2fs.c
 
 FS = ext2fs
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/fat/Makefile b/tools/libfsimage/fat/Makefile
index 7ee5e7588d..58bcc0751d 100644
--- a/tools/libfsimage/fat/Makefile
+++ b/tools/libfsimage/fat/Makefile
@@ -4,13 +4,4 @@ LIB_SRCS-y = fsys_fat.c
 
 FS = fat
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/iso9660/Makefile b/tools/libfsimage/iso9660/Makefile
index bc86baf2c0..acf3164046 100644
--- a/tools/libfsimage/iso9660/Makefile
+++ b/tools/libfsimage/iso9660/Makefile
@@ -4,15 +4,4 @@ LIB_SRCS-y = fsys_iso9660.c
 
 FS = iso9660
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
-fsys_iso9660.c: iso9660.h
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/reiserfs/Makefile b/tools/libfsimage/reiserfs/Makefile
index 5acfedf25e..42b751e007 100644
--- a/tools/libfsimage/reiserfs/Makefile
+++ b/tools/libfsimage/reiserfs/Makefile
@@ -4,13 +4,4 @@ LIB_SRCS-y = fsys_reiserfs.c
 
 FS = reiserfs
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/ufs/Makefile b/tools/libfsimage/ufs/Makefile
index f32b9178bd..cca4f0a588 100644
--- a/tools/libfsimage/ufs/Makefile
+++ b/tools/libfsimage/ufs/Makefile
@@ -4,13 +4,4 @@ LIB_SRCS-y = fsys_ufs.c
 
 FS = ufs
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/xfs/Makefile b/tools/libfsimage/xfs/Makefile
index 54eeb6e35e..ebac7baf14 100644
--- a/tools/libfsimage/xfs/Makefile
+++ b/tools/libfsimage/xfs/Makefile
@@ -4,13 +4,4 @@ LIB_SRCS-y = fsys_xfs.c
 
 FS = xfs
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/zfs/Makefile b/tools/libfsimage/zfs/Makefile
index 084e5ec08d..434a9c3580 100644
--- a/tools/libfsimage/zfs/Makefile
+++ b/tools/libfsimage/zfs/Makefile
@@ -28,13 +28,4 @@ LIB_SRCS-y = zfs_lzjb.c zfs_sha256.c zfs_fletcher.c fsi_zfs.c fsys_zfs.c
 
 FS = zfs
 
-.PHONY: all
-all: fs-all
-
-.PHONY: install
-install: fs-install
-
-.PHONY: uninstall
-uninstall: fs-uninstall
-
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
diff --git a/tools/libfsimage/Rules.mk b/tools/libfsimage/Rules.mk
index bb6d42abb4..cf37d6cb0d 100644
--- a/tools/libfsimage/Rules.mk
+++ b/tools/libfsimage/Rules.mk
@@ -1,25 +1,18 @@
-include $(XEN_ROOT)/tools/Rules.mk
-
-CFLAGS += -Wno-unknown-pragmas -I$(XEN_ROOT)/tools/libfsimage/common/ -DFSIMAGE_FSDIR=\"$(FSDIR)\"
-CFLAGS += -Werror -D_GNU_SOURCE
-LDFLAGS += -L../common/
-
-PIC_OBJS := $(patsubst %.c,%.opic,$(LIB_SRCS-y))
-
-FSDIR = $(libdir)/xenfsimage
+include $(XEN_ROOT)/tools/libfsimage/common.mk
 
 FSLIB = fsimage.so
+TARGETS += $(FSLIB)
 
-.PHONY: fs-all
-fs-all: $(FSLIB)
+.PHONY: all
+all: $(TARGETS)
 
-.PHONY: fs-install
-fs-install: fs-all
+.PHONY: install
+install: all
 	$(INSTALL_DIR) $(DESTDIR)$(FSDIR)/$(FS)
 	$(INSTALL_PROG) $(FSLIB) $(DESTDIR)$(FSDIR)/$(FS)
 
-.PHONY: fs-uninstall
-fs-uninstall:
+.PHONY: uninstall
+uninstall:
 	rm -f $(addprefix $(DESTDIR)$(FSDIR)/$(FS)/, $(FSLIB))
 	if [ -d $(DESTDIR)$(FSDIR)/$(FS) ]; then \
 		rmdir $(DESTDIR)$(FSDIR)/$(FS); \
@@ -28,7 +21,4 @@ fs-uninstall:
 $(FSLIB): $(PIC_OBJS)
 	$(CC) $(LDFLAGS) $(SHLIB_LDFLAGS) -o $@ $^ -lxenfsimage $(FS_LIBDEPS) $(APPEND_LDFLAGS)
 
-clean distclean::
-	rm -f $(PIC_OBJS) $(FSLIB) $(DEPS_RM)
-
 -include $(DEPS_INCLUDE)
diff --git a/tools/libfsimage/common.mk b/tools/libfsimage/common.mk
new file mode 100644
index 0000000000..77bc957f27
--- /dev/null
+++ b/tools/libfsimage/common.mk
@@ -0,0 +1,11 @@
+include $(XEN_ROOT)/tools/Rules.mk
+
+FSDIR := $(libdir)/xenfsimage
+CFLAGS += -Wno-unknown-pragmas -I$(XEN_ROOT)/tools/libfsimage/common/ -DFSIMAGE_FSDIR=\"$(FSDIR)\"
+CFLAGS += -Werror -D_GNU_SOURCE
+LDFLAGS += -L../common/
+
+PIC_OBJS = $(patsubst %.c,%.opic,$(LIB_SRCS-y))
+
+clean distclean::
+	rm -f $(PIC_OBJS) $(TARGETS) $(DEPS_RM)
-- 
Anthony PERARD


