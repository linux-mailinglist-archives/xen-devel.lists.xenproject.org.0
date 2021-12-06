Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B59646A23E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239451.415131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSJ-0006BU-AS; Mon, 06 Dec 2021 17:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239451.415131; Mon, 06 Dec 2021 17:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSJ-0005xV-1Y; Mon, 06 Dec 2021 17:07:11 +0000
Received: by outflank-mailman (input) for mailman id 239451;
 Mon, 06 Dec 2021 17:07:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPD-0005ti-Ht
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8036e85b-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:58 +0100 (CET)
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
X-Inumbo-ID: 8036e85b-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dj/c4lZoChrbctTMjaQaIy2bS8KFSLyGQmK8KBYSLbU=;
  b=K4NhiaaUXXvl7nDrfbjCeTpp+X3PcqLQRUXFF78E765mDlFSpGMqhWwq
   HkdMvNf0MOg8I3FDO4rOt1mlhXlJypuRO+2Y5qAAMMrfjaX/nLf7tikBR
   8rb8ift+mUXCQlw+Sd7fvJItE0/w8LwOzaHindzUZi2mgZGAC9GF2dOxp
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KaZPQnglizzoDd4Bpo4yhDDtljZTC28JsQTJSgHbvz6kwXgzGRWLJ0SP51Tjm4WvvtE+Ww9n3X
 bdwmUISl7ck8k8cbPgeWcvyqZvZLebj7Z0v3oOpHD2zNoCSJr75Ar25J1bm1ushuqRb940YkFA
 MRqKfypBtaUWWbZA1NP0BQzEnKkR92Rv/lH2u2VY8LAozY7jyFYZnFYthXEmY0fFvNBD168iuK
 2AqKlaE6peajvgagSUYMyXkYJNuLaonR9Xg4oC+G4olt3Y2mYOEKhxyrGzuTUt2QAw/OcJrRcb
 c8rK3IXkvM76s2MOrUBIQpgG
X-SBRS: 5.1
X-MesageID: 59766494
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LkCESKgMl2n5C3b+KNANPQmGX161iRcKZh0ujC45NGQN5FlHY01je
 htvXWjSPKnYYzenfNxyPo21/UlQvMLdyIBiHgdsriw1QSIb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1ts7uzTT5yNZfcs+pGWRNmEhsmBfZ/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauPO
 JRHNWszBPjGSx5EHAYaOJAYoMaXoCTebDJ/rAiNipNitgA/yyQuieOwYbI5YOeiRNpXtlaVo
 Hrc+Gb0CQ1cM8aQoRKa9lq8i+mJmjn0MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80iMosag18l3tVtTnVge0iHGBtx8YHdFXFoUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSIC9
 lmunNfQXjdVoJabEniXyLau9QvpAH1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJKIYs3J9SLYm
 G7T8nVn71kHpYtSjvjgowib6965jsGRFlZd2+nBYo6yAuqVjqaBbpfg11XU5O0owG2xHgjY5
 yhsdyRzAYkz4XCxeM6lHbxl8FKBva/t3NjgbbhHRcNJG9OFoSHLQGyoyGsiTHqFyPosdz7ze
 1P0sghM/pJVN3bCRfYpONLuUZV3l/K+SoSNuhXogjxmOMIZmOivpn4GWKJt9zq1zBhEfV8XZ
 /93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOY7N04RF3EnCPje8ooPHgJ1ClE9Qz9J5j646e5JRrGJaIwJzLqVp
 S/kBRcDoLc97FWeQTi3hrlYQOuHdf5CQbgTZ0TA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:Kwg196mntGwb9VibjlMtLfNmkObpDfIm3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7Qr5OUtQ/uxoV5PgfZqxz/NICOoqTNWftWvd2FdARbsKheCJ/9SJIVybygc378
 ldmsZFZOEYdWIK7vrH3A==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59766494"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 31/57] tools/libfsimage: Cleanup makefiles
Date: Mon, 6 Dec 2021 17:02:14 +0000
Message-ID: <20211206170241.13165-32-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
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
 tools/libfsimage/Rules.mk            | 26 ++++++++------------------
 tools/libfsimage/common.mk           | 11 +++++++++++
 tools/libfsimage/common/Makefile     | 11 +++--------
 tools/libfsimage/ext2fs-lib/Makefile |  9 ---------
 tools/libfsimage/ext2fs/Makefile     |  9 ---------
 tools/libfsimage/fat/Makefile        |  9 ---------
 tools/libfsimage/iso9660/Makefile    | 11 -----------
 tools/libfsimage/reiserfs/Makefile   |  9 ---------
 tools/libfsimage/ufs/Makefile        |  9 ---------
 tools/libfsimage/xfs/Makefile        |  9 ---------
 tools/libfsimage/zfs/Makefile        |  9 ---------
 11 files changed, 22 insertions(+), 100 deletions(-)
 create mode 100644 tools/libfsimage/common.mk

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
diff --git a/tools/libfsimage/common/Makefile b/tools/libfsimage/common/Makefile
index 24bc90e73e..bcda86d754 100644
--- a/tools/libfsimage/common/Makefile
+++ b/tools/libfsimage/common/Makefile
@@ -1,5 +1,5 @@
 XEN_ROOT = $(CURDIR)/../../..
-include $(XEN_ROOT)/tools/libfsimage/Rules.mk
+include $(XEN_ROOT)/tools/libfsimage/common.mk
 
 MAJOR = 4.16
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
-- 
Anthony PERARD


