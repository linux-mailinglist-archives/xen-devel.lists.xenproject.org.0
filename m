Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A03824EC7C
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:35:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9mPc-00050D-Lu; Sun, 23 Aug 2020 09:35:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mPb-0004sy-FD
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:35:39 +0000
X-Inumbo-ID: 3672458b-09c3-42b9-b597-b23e1a75522c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3672458b-09c3-42b9-b597-b23e1a75522c;
 Sun, 23 Aug 2020 09:35:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B4FAADD6;
 Sun, 23 Aug 2020 09:35:53 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v3 07/38] stubdom: add correct dependencies for Xen libraries
Date: Sun, 23 Aug 2020 11:34:48 +0200
Message-Id: <20200823093519.18386-8-jgross@suse.com>
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

The stubdom Makefile is missing several dependencies between Xen
libraries. Add them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/Makefile | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index af8cde41b9..a95212e363 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -23,6 +23,13 @@ endif
 
 -include $(XEN_ROOT)/config/Stubdom.mk
 
+include $(XEN_ROOT)/tools/libs/uselibs.mk
+
+define LIB_deps =
+ LIBDEPS_$(1) = $$(foreach use,$$(USELIBS_$(1)),libxen$$(use))
+endef
+$(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_deps,$(lib))))
+
 GNU_TARGET_ARCH:=$(XEN_TARGET_ARCH)
 ifeq ($(XEN_TARGET_ARCH),x86_32)
 GNU_TARGET_ARCH:=i686
@@ -387,6 +394,7 @@ $(TARGETS_MINIOS): mini-os-%:
 
 .PHONY: libxentoolcore
 libxentoolcore: libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a
+libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a: $(LIBDEPS_toolcore)
 libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/toolcore
 
@@ -396,6 +404,7 @@ libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a: mk-headers-$(XEN_TARGET_ARCH)
 
 .PHONY: libxentoollog
 libxentoollog: libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a
+libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: $(LIBDEPS_toollog)
 libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/toollog
 
@@ -405,6 +414,7 @@ libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: mk-headers-$(XEN_TARGET_ARCH) $
 
 .PHONY: libxenevtchn
 libxenevtchn: libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a
+libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: $(LIBDEPS_evtchn)
 libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/evtchn
 
@@ -414,6 +424,7 @@ libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: mk-headers-$(XEN_TARGET_ARCH) $(N
 
 .PHONY: libxengnttab
 libxengnttab: libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a
+libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: $(LIBDEPS_gnttab)
 libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/gnttab
 
@@ -423,6 +434,7 @@ libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: mk-headers-$(XEN_TARGET_ARCH) $(N
 
 .PHONY: libxencall
 libxencall: libs-$(XEN_TARGET_ARCH)/call/libxencall.a
+libs-$(XEN_TARGET_ARCH)/call/libxencall.a: $(LIBDEPS_call)
 libs-$(XEN_TARGET_ARCH)/call/libxencall.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/call
 
@@ -432,6 +444,7 @@ libs-$(XEN_TARGET_ARCH)/call/libxencall.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLI
 
 .PHONY: libxenforeignmemory
 libxenforeignmemory: libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a
+libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: $(LIBDEPS_foreignmemory)
 libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/foreignmemory
 
@@ -441,6 +454,7 @@ libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: mk-headers-$(XEN_TA
 
 .PHONY: libxendevicemodel
 libxendevicemodel: libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a
+libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a: $(LIBDEPS_devicemodel)
 libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/devicemodel
 
@@ -450,7 +464,7 @@ libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a: mk-headers-$(XEN_TARGET
 
 .PHONY: libxc
 libxc: libxc-$(XEN_TARGET_ARCH)/libxenctrl.a libxc-$(XEN_TARGET_ARCH)/libxenguest.a
-libxc-$(XEN_TARGET_ARCH)/libxenctrl.a: mk-headers-$(XEN_TARGET_ARCH) libxentoolcore libxentoollog libxenevtchn libxengnttab libxencall libxenforeignmemory libxendevicemodel cross-zlib
+libxc-$(XEN_TARGET_ARCH)/libxenctrl.a: mk-headers-$(XEN_TARGET_ARCH) libxentoollog libxenevtchn libxengnttab libxencall libxenforeignmemory libxendevicemodel cross-zlib
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= CONFIG_LIBXC_MINIOS=y -C libxc-$(XEN_TARGET_ARCH)
 
  libxc-$(XEN_TARGET_ARCH)/libxenguest.a: libxc-$(XEN_TARGET_ARCH)/libxenctrl.a
-- 
2.26.2


