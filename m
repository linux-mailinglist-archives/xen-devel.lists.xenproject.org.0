Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BADAE24EC84
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:36:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9mPw-0005Hj-Fv; Sun, 23 Aug 2020 09:36:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mPv-0004sy-Fj
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:35:59 +0000
X-Inumbo-ID: e68f3319-201d-4e14-b4ab-c472cd002eeb
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e68f3319-201d-4e14-b4ab-c472cd002eeb;
 Sun, 23 Aug 2020 09:35:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05288AE18;
 Sun, 23 Aug 2020 09:35:54 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 13/38] tools: don't assume libxenguest and libxenctrl to be
 in same directory
Date: Sun, 23 Aug 2020 11:34:54 +0200
Message-Id: <20200823093519.18386-14-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There are quite some places in Makefiles assuming libxenguest and
libxenctrl being built in the same directory via a single Makefile.

Drop this assumption by specifying the dependencies and path variables
for both libraries correctly.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Rules.mk       | 7 +++----
 tools/libxl/Makefile | 2 +-
 tools/misc/Makefile  | 1 +
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 7e019a8a65..191fe8e080 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -16,8 +16,7 @@ XEN_INCLUDE        = $(XEN_ROOT)/tools/include
 include $(XEN_ROOT)/tools/libs/uselibs.mk
 
 XEN_libxenctrl     = $(XEN_ROOT)/tools/libxc
-# Currently libxenguest lives in the same directory as libxenctrl
-XEN_libxenguest    = $(XEN_libxenctrl)
+XEN_libxenguest    = $(XEN_ROOT)/tools/libxc
 XEN_libxenlight    = $(XEN_ROOT)/tools/libxl
 # Currently libxlutil lives in the same directory as libxenlight
 XEN_libxlutil      = $(XEN_libxenlight)
@@ -117,7 +116,7 @@ LDLIBS_libxenguest = $(SHDEPS_libxenguest) $(XEN_libxenguest)/libxenguest$(libex
 SHLIB_libxenguest  = $(SHDEPS_libxenguest) -Wl,-rpath-link=$(XEN_libxenguest)
 
 CFLAGS_libxenstore = -I$(XEN_libxenstore)/include $(CFLAGS_xeninclude)
-SHDEPS_libxenstore = $(SHLIB_libxentoolcore)
+SHDEPS_libxenstore = $(SHLIB_libxentoolcore) $(SHLIB_libxenctrl)
 LDLIBS_libxenstore = $(SHDEPS_libxenstore) $(XEN_libxenstore)/libxenstore$(libextension)
 SHLIB_libxenstore  = $(SHDEPS_libxenstore) -Wl,-rpath-link=$(XEN_libxenstore)
 ifeq ($(CONFIG_Linux),y)
@@ -144,7 +143,7 @@ CFLAGS += -O2 -fomit-frame-pointer
 endif
 
 CFLAGS_libxenlight = -I$(XEN_libxenlight) $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude)
-SHDEPS_libxenlight = $(SHLIB_libxenctrl) $(SHLIB_libxenstore) $(SHLIB_libxenhypfs)
+SHDEPS_libxenlight = $(SHLIB_libxenctrl) $(SHLIB_libxenstore) $(SHLIB_libxenhypfs) $(SHLIB_libxenguest)
 LDLIBS_libxenlight = $(SHDEPS_libxenlight) $(XEN_libxenlight)/libxenlight$(libextension)
 SHLIB_libxenlight  = $(SHDEPS_libxenlight) -Wl,-rpath-link=$(XEN_libxenlight)
 
diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 0e8dfc6193..65f3968947 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -188,7 +188,7 @@ libxl_dom.o: CFLAGS += -I$(XEN_ROOT)/tools  # include libacpi/x86.h
 libxl_x86_acpi.o: CFLAGS += -I$(XEN_ROOT)/tools
 
 SAVE_HELPER_OBJS = libxl_save_helper.o _libxl_save_msgs_helper.o
-$(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn)
+$(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenguest)
 
 PKG_CONFIG = xenlight.pc xlutil.pc
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 9fdb13597f..e7e74db85f 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -6,6 +6,7 @@ CFLAGS += -Werror
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += $(CFLAGS_libxenevtchn)
 CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenguest)
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenstore)
 
-- 
2.26.2


