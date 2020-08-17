Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1537D2463BE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:49:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bly-0004Fq-DF; Mon, 17 Aug 2020 09:49:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7blx-00046Z-B1
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:45 +0000
X-Inumbo-ID: a4a209fa-a2ef-49bd-a9a4-5c0979521f78
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4a209fa-a2ef-49bd-a9a4-5c0979521f78;
 Mon, 17 Aug 2020 09:49:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0C72CAEF6;
 Mon, 17 Aug 2020 09:49:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH II v2 06/17] tools: don't assume libxenguest and libxenctrl to
 be in same directory
Date: Mon, 17 Aug 2020 11:49:11 +0200
Message-Id: <20200817094922.15768-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817094922.15768-1-jgross@suse.com>
References: <20200817094922.15768-1-jgross@suse.com>
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
index b36818bcaa..35d237bba6 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -31,8 +31,7 @@ LIBS_LIBS += hypfs
 USELIBS_hypfs := toollog toolcore call
 
 XEN_libxenctrl     = $(XEN_ROOT)/tools/libxc
-# Currently libxenguest lives in the same directory as libxenctrl
-XEN_libxenguest    = $(XEN_libxenctrl)
+XEN_libxenguest    = $(XEN_ROOT)/tools/libxc
 XEN_libxenlight    = $(XEN_ROOT)/tools/libxl
 # Currently libxlutil lives in the same directory as libxenlight
 XEN_libxlutil      = $(XEN_libxenlight)
@@ -132,7 +131,7 @@ LDLIBS_libxenguest = $(SHDEPS_libxenguest) $(XEN_libxenguest)/libxenguest$(libex
 SHLIB_libxenguest  = $(SHDEPS_libxenguest) -Wl,-rpath-link=$(XEN_libxenguest)
 
 CFLAGS_libxenstore = -I$(XEN_libxenstore)/include $(CFLAGS_xeninclude)
-SHDEPS_libxenstore = $(SHLIB_libxentoolcore)
+SHDEPS_libxenstore = $(SHLIB_libxentoolcore) $(SHLIB_libxenctrl)
 LDLIBS_libxenstore = $(SHDEPS_libxenstore) $(XEN_libxenstore)/libxenstore$(libextension)
 SHLIB_libxenstore  = $(SHDEPS_libxenstore) -Wl,-rpath-link=$(XEN_libxenstore)
 ifeq ($(CONFIG_Linux),y)
@@ -159,7 +158,7 @@ CFLAGS += -O2 -fomit-frame-pointer
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


