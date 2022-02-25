Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931F04C4874
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279194.476902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcIJ-00039f-9U; Fri, 25 Feb 2022 15:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279194.476902; Fri, 25 Feb 2022 15:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcII-00035Y-TY; Fri, 25 Feb 2022 15:14:06 +0000
Received: by outflank-mailman (input) for mailman id 279194;
 Fri, 25 Feb 2022 15:14:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIH-0006fy-Ap
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90b877c9-964d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:14:04 +0100 (CET)
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
X-Inumbo-ID: 90b877c9-964d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ECjrP9xItuWCPbZk1vIvsP9mwRYqVRzBpP4c/9vcJbk=;
  b=AtUAtz/gP8g1le1Y+n21yZF/MJ5bWkIbGsA2cgJ3nsByF9RLqWB+xMIO
   A0UYQjqKaKWKuHVbvQ8oskmAdLZ0EwBLLLqBRugs6TEKXMS7uTf/7qQ0s
   XwQK/g4xB6sv9RGtV9EGi5M8p/ADZHwA5zuP/+QM2+wQ04/5XIOIbJVvm
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64433043
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BEphi65W27NUIGGmTy09ZQxRtD3HchMFZxGqfqrLsTDasY5as4F+v
 jFLX2qGP6rcN2GjeNojaY7koBwFv8XQy9FhGlRpqHg9Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YLjXlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurToSj8wF4vPuNgceEhhTihHYIFX2ZPIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5RFNWE0NEibC/FJEm1PDcMGo+7yvSbcdSVolEnEq4kw8lGGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyNtOFziGe2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO7U50Bik7Kn03weyV1FZRwccRM0HmMBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQmzARVodt/xory9U
 J4swZn2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1b5lYIGO0O
 BeL4Wu9AaO/2lPwPMebhKrrVqwXIVXIT4y5Bpg4kPIUCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGMqd9DdQ1RdCNjbX00wuQOHtO+zsNdMDlJI5fsLXkJIdcNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:73PudKs1DQmwVPdIvLu9yGJ/7skDcNV00zEX/kB9WHVpmszxra
 +TdZMgpHjJYVcqKQgdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILLFuFfBOLZqlWKcREWtNQtsJ
 uIG5IObuEYZmIVsS+V2mWF+q4bsbq6zJw=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64433043"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 14/29] libs: rename LDUSELIBS to LDLIBS and use it instead of APPEND_LDFLAGS
Date: Fri, 25 Feb 2022 15:13:06 +0000
Message-ID: <20220225151321.44126-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

LDLIBS is more appropriate and intended to be used to add library
dependencies. APPEND_LDFLAGS wasn't intended to be changed by the
build system.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---

Notes:
    v2:
    - reviewed

 tools/libs/guest/Makefile |  2 +-
 tools/libs/hypfs/Makefile |  2 +-
 tools/libs/light/Makefile | 18 +++++++++---------
 tools/libs/stat/Makefile  |  2 +-
 tools/libs/store/Makefile |  2 +-
 tools/libs/libs.mk        |  4 ++--
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index ab580e1b64..2005d8a67d 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -102,7 +102,7 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-libxenguest.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += $(ZLIB_LIBS) -lz
+libxenguest.so.$(MAJOR).$(MINOR): LDLIBS += $(ZLIB_LIBS) -lz
 
 .PHONY: cleanlocal
 cleanlocal:
diff --git a/tools/libs/hypfs/Makefile b/tools/libs/hypfs/Makefile
index 39feca87e8..efa955bd50 100644
--- a/tools/libs/hypfs/Makefile
+++ b/tools/libs/hypfs/Makefile
@@ -4,7 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 0
 
-APPEND_LDFLAGS += -lz
+LDLIBS += -lz
 
 SRCS-y                 += core.c
 
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 453bea0067..7c0a5dca85 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -166,14 +166,14 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-LDUSELIBS-y += $(PTYFUNCS_LIBS)
-LDUSELIBS-$(CONFIG_LIBNL) += $(LIBNL3_LIBS)
-LDUSELIBS-$(CONFIG_Linux) += -luuid
-LDUSELIBS-$(CONFIG_Linux) += -lrt
-LDUSELIBS-$(CONFIG_ARM) += -lfdt
-LDUSELIBS-y += $(PTHREAD_LIBS)
-LDUSELIBS-y += -lyajl
-LDUSELIBS += $(LDUSELIBS-y)
+LDLIBS-y += $(PTYFUNCS_LIBS)
+LDLIBS-$(CONFIG_LIBNL) += $(LIBNL3_LIBS)
+LDLIBS-$(CONFIG_Linux) += -luuid
+LDLIBS-$(CONFIG_Linux) += -lrt
+LDLIBS-$(CONFIG_ARM) += -lfdt
+LDLIBS-y += $(PTHREAD_LIBS)
+LDLIBS-y += -lyajl
+LDLIBS += $(LDLIBS-y)
 
 $(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) -include $(XEN_ROOT)/tools/config.h
 $(ACPI_OBJS) $(ACPI_PIC_OBJS): CFLAGS += -I. -DLIBACPI_STDUTILS=\"$(CURDIR)/libxl_x86_acpi.h\"
@@ -228,7 +228,7 @@ $(XEN_INCLUDE)/_%.h: _%.h
 	$(call move-if-changed,_$*.h,$(XEN_INCLUDE)/_$*.h)
 
 libxenlight_test.so: $(PIC_OBJS) $(LIBXL_TEST_OBJS)
-	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDUSELIBS) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
 
 test_%: test_%.o test_common.o libxenlight_test.so
 	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 5840213376..6cd0af5239 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -26,7 +26,7 @@ SRCS-$(CONFIG_FreeBSD) += xenstat_freebsd.c
 
 LDLIBS-y += -lyajl
 LDLIBS-$(CONFIG_SunOS) += -lkstat
-APPEND_LDFLAGS += $(LDLIBS-y)
+LDLIBS += $(LDLIBS-y)
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 8e33db6a66..18ae1fe94d 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -5,7 +5,7 @@ MAJOR = 4
 MINOR = 0
 
 ifeq ($(CONFIG_Linux),y)
-APPEND_LDFLAGS += -ldl
+LDLIBS += -ldl
 endif
 
 SRCS-y   += xs_lib.c
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index b3d784c57f..3118cb4194 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -18,7 +18,7 @@ CFLAGS   += -Werror -Wmissing-prototypes
 CFLAGS   += $(CFLAGS_xeninclude)
 CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
 
-LDUSELIBS = $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
+LDLIBS += $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
 
 LIB_OBJS := $(SRCS-y:.c=.o)
 PIC_OBJS := $(SRCS-y:.c=.opic)
@@ -88,7 +88,7 @@ lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 	$(SYMLINK_SHLIB) $< $@
 
 lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDUSELIBS) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 # If abi-dumper is available, write out the ABI analysis
 ifneq ($(ABI_DUMPER),)
-- 
Anthony PERARD


