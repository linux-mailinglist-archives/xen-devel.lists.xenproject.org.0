Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A228568F3E7
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 18:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491911.761271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPnnP-00027S-J5; Wed, 08 Feb 2023 16:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491911.761271; Wed, 08 Feb 2023 16:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPnnP-000255-GF; Wed, 08 Feb 2023 16:59:47 +0000
Received: by outflank-mailman (input) for mailman id 491911;
 Wed, 08 Feb 2023 16:59:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3n9e=6E=citrix.com=prvs=396e25764=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pPnnN-00024z-LZ
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 16:59:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa8ca477-a7d1-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 17:59:43 +0100 (CET)
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
X-Inumbo-ID: fa8ca477-a7d1-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675875583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lFKv9iAHm2/PnFQnmWDbdl0f5ZalkCm6aTnDOAkDN7Q=;
  b=dAH7VjA8pGnl9omG4na74TCeipWzZKg6E7b6qz9quoZ7DUnJEUbJxcNg
   R/Ve/Tweh2qKtkH5deDM7R802rvEWOo0vFURhYfQ0ZwB2bJR9ot7oxSqq
   hozldzqL3UcgfGiHCB15GCwbKDfkgnKCmgZqxLs/vbhNRCGm4K5Ay9x88
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98648404
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:gn2lDaojy0wd77VzACAUqprscWheBmIIZRIvgKrLsJaIsI4StFCzt
 garIBnUM/zeZ2rwKNElYYqz9h5V6pKAz9ZlTFRkrCw8FnxBp5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzylNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGoMUi2pp9Dr+bf4FdBSn/UkF9OoBrpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jOWoTipXklGXDCZ4QLd31mjjbHQpjPmZbNIKrjjrtIynULGkwT/DzVJDADm8JFVkHWWWd1FL
 FcP0jEztqV0/0uuJvHiWzWorXjCuQQTM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewdeTDc4yfnR/bg2zU32cM9SF5WvzefMTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4umkWyKRBaJxsldrVj
 Kj752tsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeon4zOh/MgT6wyhdy+U3aB
 Xt9WZz0ZZr9If04pAdaus9HieN7rszA7TO7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Mm
 +uzw/Cikk0FOMWnO3m/zGLmBQxSRZTNLcys+pM/my/qClYOJVzN/NeIkOh/J9Q6wfQ9eyWh1
 ijVZ3K0AWHX3RXvQThmoFg5AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:YqnUbK9JQzejftPCx0Nuk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.97,281,1669093200"; 
   d="scan'208";a="98648404"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v6.1 5/5] tools: Rework $(xenlibs-ldlibs, ) to provide library flags only.
Date: Wed, 8 Feb 2023 16:59:13 +0000
Message-ID: <20230208165913.19694-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <6a141dab-aef8-960d-269d-23f8000a257d@suse.com>
References: <6a141dab-aef8-960d-269d-23f8000a257d@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

LDLIBS is usually only the library flags (that is the `-l` flags), as
proposed in GNU make manual, while LDFLAGS would be extra flags such
as `-L`.

Rework the make macro $(xenlibs-ldlibs, ) to only provide the library
flags. $(xenlibs-ldflags, ) already only provide the extra flags like
the -rpath-link flags.

Also fix "test_%" recipe in libs/light as "libxenlight.so" in
$(LDLIBS_libxenlight) is been replaced by "-lxenlight". Instead of
just changing the filter, we will start using the $(xenlibs-*,) macro.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---

Notes:
    v6.1:
    - For test_% recipe, add toolcore and toollog to the $(xenlibs-ldflags,)
      macro, to not have to reli on the flags been already present in
      $(LDFLAGS).
    
    v6:
    - new patch

 tools/Rules.mk                | 16 +++++++---------
 tools/console/client/Makefile |  1 +
 tools/console/daemon/Makefile |  1 +
 tools/helpers/Makefile        |  3 +++
 tools/libs/libs.mk            |  1 +
 tools/libs/light/Makefile     |  2 +-
 6 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index d7c1f61cdf..007a64f2f5 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -105,12 +105,6 @@ define xenlibs-libs
         $(XEN_ROOT)/tools/libs/$(lib)/lib$(FILENAME_$(lib))$(libextension))
 endef
 
-# Flags for linking against all Xen libraries listed in $(1)
-define xenlibs-ldlibs
-    $(call xenlibs-rpath,$(1)) $(call xenlibs-libs,$(1)) \
-    $(foreach lib,$(1),$(xenlibs-ldlibs-$(lib)))
-endef
-
 # Provide needed flags for linking an in-tree Xen library by an external
 # project (or when it is necessary to link with "-lxen$(1)" instead of using
 # the full path to the library).
@@ -119,12 +113,16 @@ define xenlibs-ldflags
     $(foreach lib,$(1),-L$(XEN_ROOT)/tools/libs/$(lib))
 endef
 
+# Flags for linking against all Xen libraries listed in $(1)
+define xenlibs-ldlibs
+    $(foreach lib,$(1),-l$(FILENAME_$(lib)) $(xenlibs-ldlibs-$(lib)))
+endef
+
 # Flags for linking against all Xen libraries listed in $(1) but by making use
 # of -L and -l instead of providing a path to the shared library.
 define xenlibs-ldflags-ldlibs
     $(call xenlibs-ldflags,$(1)) \
-    $(foreach lib,$(1), -l$(FILENAME_$(lib))) \
-    $(foreach lib,$(1),$(xenlibs-ldlibs-$(lib)))
+    $(call xenlibs-ldlibs,$(1))
 endef
 
 define LIB_defs
@@ -132,7 +130,7 @@ define LIB_defs
  XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
  CFLAGS_libxen$(1) = $$(CFLAGS_xeninclude)
  SHLIB_libxen$(1) = $$(call xenlibs-rpath,$(1)) -Wl,-rpath-link=$$(XEN_libxen$(1))
- LDLIBS_libxen$(1) = $$(call xenlibs-ldlibs,$(1))
+ LDLIBS_libxen$(1) = $$(call xenlibs-ldflags,$(1)) $$(call xenlibs-ldlibs,$(1))
 endef
 
 $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_defs,$(lib))))
diff --git a/tools/console/client/Makefile b/tools/console/client/Makefile
index 071262c9ae..ea7819c03e 100644
--- a/tools/console/client/Makefile
+++ b/tools/console/client/Makefile
@@ -6,6 +6,7 @@ USELIBS := ctrl store
 CFLAGS += $(call xenlibs-cflags,$(USELIBS))
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
+LDFLAGS += $(call xenlibs-ldflags,$(USELIBS))
 LDLIBS += $(call xenlibs-ldlibs,$(USELIBS))
 LDLIBS += $(SOCKET_LIBS)
 
diff --git a/tools/console/daemon/Makefile b/tools/console/daemon/Makefile
index e53c874eee..400611fc2d 100644
--- a/tools/console/daemon/Makefile
+++ b/tools/console/daemon/Makefile
@@ -7,6 +7,7 @@ CFLAGS += $(call xenlibs-cflags,$(USELIBS))
 CFLAGS-$(CONFIG_ARM) += -DCONFIG_ARM
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
+LDFLAGS += $(call xenlibs-ldflags,$(USELIBS))
 LDLIBS += $(call xenlibs-ldlibs,$(USELIBS))
 LDLIBS += $(SOCKET_LIBS)
 LDLIBS += $(UTIL_LIBS)
diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 0d4df01365..5db88dc81b 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -18,17 +18,20 @@ endif
 XEN_INIT_DOM0_USELIBS := ctrl toollog store light
 XEN_INIT_DOM0_OBJS = xen-init-dom0.o init-dom-json.o
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(call xenlibs-cflags,$(XEN_INIT_DOM0_USELIBS))
+xen-init-dom0: LDFLAGS += $(call xenlibs-ldflags,$(XEN_INIT_DOM0_USELIBS))
 xen-init-dom0: LDLIBS += $(call xenlibs-ldlibs,$(XEN_INIT_DOM0_USELIBS))
 
 INIT_XENSTORE_DOMAIN_USELIBS := toollog store ctrl guest light
 INIT_XENSTORE_DOMAIN_OBJS = init-xenstore-domain.o init-dom-json.o
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(call xenlibs-cflags,$(INIT_XENSTORE_DOMAIN_USELIBS))
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
+init-xenstore-domain: LDFLAGS += $(call xenlibs-ldflags,$(INIT_XENSTORE_DOMAIN_USELIBS))
 init-xenstore-domain: LDLIBS += $(call xenlibs-ldlibs,$(INIT_XENSTORE_DOMAIN_USELIBS))
 
 INIT_DOM0LESS_USELIBS := ctrl evtchn toollog store light guest foreignmemory
 INIT_DOM0LESS_OBJS = init-dom0less.o init-dom-json.o
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(call xenlibs-cflags,$(INIT_DOM0LESS_USELIBS))
+init-dom0less: LDFLAGS += $(call xenlibs-ldflags,$(INIT_DOM0LESS_USELIBS))
 init-dom0less: LDLIBS += $(call xenlibs-ldlibs,$(INIT_DOM0LESS_USELIBS))
 
 .PHONY: all
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 0e4b5e0bd0..fc6aa7ede9 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -17,6 +17,7 @@ CFLAGS   += -Wmissing-prototypes
 CFLAGS   += $(CFLAGS_xeninclude)
 CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
 
+LDFLAGS += $(call xenlibs-ldflags,$(USELIBS_$(LIBNAME)))
 LDLIBS += $(call xenlibs-ldlibs,$(USELIBS_$(LIBNAME)))
 
 PIC_OBJS := $(OBJS-y:.o=.opic)
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 96daeabc47..04ea2a82c0 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -244,7 +244,7 @@ libxenlight_test.so: $(PIC_OBJS) $(LIBXL_TEST_OBJS)
 	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
 
 test_%: test_%.o test_common.o libxenlight_test.so
-	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $(call xenlibs-ldflags,toollog toolcore light) -o $@ $^ $(call xenlibs-ldlibs,toollog toolcore) -lyajl $(APPEND_LDFLAGS)
 
 libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
 	$(CC) $(LDFLAGS) -o $@ $(SAVE_HELPER_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
-- 
Anthony PERARD


