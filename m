Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4CE24EC7B
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:35:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9mPa-0004ye-CL; Sun, 23 Aug 2020 09:35:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mPY-0004t9-Ry
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:35:36 +0000
X-Inumbo-ID: 84808e03-5e73-4a97-9599-33ffbbfa352a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84808e03-5e73-4a97-9599-33ffbbfa352a;
 Sun, 23 Aug 2020 09:35:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 413C3ADE0;
 Sun, 23 Aug 2020 09:35:53 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v3 08/38] stubdom: simplify building xen libraries for stubdoms
Date: Sun, 23 Aug 2020 11:34:49 +0200
Message-Id: <20200823093519.18386-9-jgross@suse.com>
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

The pattern for building a Xen library with sources under tools/libs
is always the same. Simplify stubdom/Makefile by defining a callable
make program for those libraries.

Even if not needed right now add the possibility for defining
additional dependencies for a library.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/Makefile | 120 ++++++++++-------------------------------------
 1 file changed, 24 insertions(+), 96 deletions(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index a95212e363..4fd86dd44b 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -327,6 +327,16 @@ ioemu/linkfarm.stamp:
 	touch ioemu/linkfarm.stamp
 endif
 
+#######
+# libraries under tools/libs
+#######
+
+STUB_LIBS := toolcore toollog evtchn gnttab call foreignmemory devicemodel
+
+#######
+# common handling
+#######
+
 define do_links
   mkdir -p $(dir $@)include
   cd $(dir $@); \
@@ -337,26 +347,21 @@ define do_links
   touch $@
 endef
 
-libs-$(XEN_TARGET_ARCH)/toolcore/stamp: $(XEN_ROOT)/tools/libs/toolcore/Makefile
-	$(do_links)
-
-libs-$(XEN_TARGET_ARCH)/toollog/stamp: $(XEN_ROOT)/tools/libs/toollog/Makefile
-	$(do_links)
+define BUILD_lib
+ .PHONY: libxen$(1) clean-libxen$(1)
+ libxen$(1): libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a
+ libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: $$(LIBDEPS_$(1)) $$(LIBDEP_$(1))
+ libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: mk-headers-$$(XEN_TARGET_ARCH) $$(NEWLIB_STAMPFILE)
+	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) DESTDIR= CONFIG_LIBXC_MINIOS=y -C libs-$$(XEN_TARGET_ARCH)/$(1)
 
-libs-$(XEN_TARGET_ARCH)/evtchn/stamp: $(XEN_ROOT)/tools/libs/evtchn/Makefile
-	$(do_links)
+ clean-libxen$(1):
+	[ ! -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile ] || $$(MAKE) DESTDIR= -C libs-$$(XEN_TARGET_ARCH)/$(1) clean
 
-libs-$(XEN_TARGET_ARCH)/gnttab/stamp: $(XEN_ROOT)/tools/libs/gnttab/Makefile
-	$(do_links)
-
-libs-$(XEN_TARGET_ARCH)/call/stamp: $(XEN_ROOT)/tools/libs/call/Makefile
-	$(do_links)
-
-libs-$(XEN_TARGET_ARCH)/foreignmemory/stamp: $(XEN_ROOT)/tools/libs/foreignmemory/Makefile
-	$(do_links)
+ libs-$$(XEN_TARGET_ARCH)/$(1)/stamp: $$(XEN_ROOT)/tools/libs/$(1)/Makefile
+	$$(do_links)
+endef
 
-libs-$(XEN_TARGET_ARCH)/devicemodel/stamp: $(XEN_ROOT)/tools/libs/devicemodel/Makefile
-	$(do_links)
+$(foreach lib,$(STUB_LIBS),$(eval $(call BUILD_lib,$(lib))))
 
 libxc-$(XEN_TARGET_ARCH)/stamp: $(XEN_ROOT)/tools/libxc/Makefile
 	$(do_links)
@@ -364,8 +369,7 @@ libxc-$(XEN_TARGET_ARCH)/stamp: $(XEN_ROOT)/tools/libxc/Makefile
 xenstore/stamp: $(XEN_ROOT)/tools/xenstore/Makefile
 	$(do_links)
 
-LINK_LIBS_DIRS := toolcore toollog evtchn gnttab call foreignmemory devicemodel
-LINK_DIRS := libxc-$(XEN_TARGET_ARCH) xenstore $(foreach dir,$(LINK_LIBS_DIRS),libs-$(XEN_TARGET_ARCH)/$(dir))
+LINK_DIRS := libxc-$(XEN_TARGET_ARCH) xenstore $(foreach dir,$(STUB_LIBS),libs-$(XEN_TARGET_ARCH)/$(dir))
 LINK_STAMPS := $(foreach dir,$(LINK_DIRS),$(dir)/stamp)
 
 mk-headers-$(XEN_TARGET_ARCH): $(IOEMU_LINKFARM_TARGET) $(LINK_STAMPS)
@@ -388,76 +392,6 @@ $(TARGETS_MINIOS): mini-os-%:
                 mkdir -p $@/$$i ; \
 	done
 
-#######
-# libxentoolcore
-#######
-
-.PHONY: libxentoolcore
-libxentoolcore: libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a
-libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a: $(LIBDEPS_toolcore)
-libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
-	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/toolcore
-
-#######
-# libxentoollog
-#######
-
-.PHONY: libxentoollog
-libxentoollog: libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a
-libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: $(LIBDEPS_toollog)
-libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
-	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/toollog
-
-#######
-# libxenevtchn
-#######
-
-.PHONY: libxenevtchn
-libxenevtchn: libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a
-libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: $(LIBDEPS_evtchn)
-libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
-	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/evtchn
-
-#######
-# libxengnttab
-#######
-
-.PHONY: libxengnttab
-libxengnttab: libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a
-libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: $(LIBDEPS_gnttab)
-libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
-	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/gnttab
-
-#######
-# libxencall
-#######
-
-.PHONY: libxencall
-libxencall: libs-$(XEN_TARGET_ARCH)/call/libxencall.a
-libs-$(XEN_TARGET_ARCH)/call/libxencall.a: $(LIBDEPS_call)
-libs-$(XEN_TARGET_ARCH)/call/libxencall.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
-	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/call
-
-#######
-# libxenforeignmemory
-#######
-
-.PHONY: libxenforeignmemory
-libxenforeignmemory: libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a
-libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: $(LIBDEPS_foreignmemory)
-libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
-	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/foreignmemory
-
-#######
-# libxendevicemodel
-#######
-
-.PHONY: libxendevicemodel
-libxendevicemodel: libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a
-libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a: $(LIBDEPS_devicemodel)
-libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
-	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/devicemodel
-
 #######
 # libxc
 #######
@@ -672,6 +606,7 @@ uninstall-vtpmmgr:
 
 # Only clean the libxc/ioemu/mini-os part
 .PHONY: clean
+clean: $(foreach lib,$(STUB_LIBS),clean-libxen$(lib))
 clean:
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-ioemu
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-c
@@ -688,13 +623,6 @@ clean:
 	rm -f $(STUBDOMPATH)
 	rm -f *-minios-config.mk
 	rm -fr pkg-config
-	[ ! -e libs-$(XEN_TARGET_ARCH)/toolcore/Makefile ] || $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/toolcore clean
-	[ ! -e libs-$(XEN_TARGET_ARCH)/toollog/Makefile ] || $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/toollog clean
-	[ ! -e libs-$(XEN_TARGET_ARCH)/evtchn/Makefile ] || $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/evtchn clean
-	[ ! -e libs-$(XEN_TARGET_ARCH)/gnttab/Makefile ] || $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/gnttab clean
-	[ ! -e libs-$(XEN_TARGET_ARCH)/call/Makefile ] || $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/call clean
-	[ ! -e libs-$(XEN_TARGET_ARCH)/foreignmemory/Makefile ] || $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/foreignmemory clean
-	[ ! -e libs-$(XEN_TARGET_ARCH)/devicemodel/Makefile ] || $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/devicemodel clean
 	[ ! -e libxc-$(XEN_TARGET_ARCH)/Makefile ] || $(MAKE) DESTDIR= -C libxc-$(XEN_TARGET_ARCH) clean
 	-[ ! -d ioemu ] || $(MAKE) DESTDIR= -C ioemu clean
 	-[ ! -d xenstore ] || $(MAKE) DESTDIR= -C xenstore clean
-- 
2.26.2


