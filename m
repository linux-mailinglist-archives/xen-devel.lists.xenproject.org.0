Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2DF46A27D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:09:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239545.415575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHUQ-0004db-RA; Mon, 06 Dec 2021 17:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239545.415575; Mon, 06 Dec 2021 17:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHUQ-0004Wm-Fx; Mon, 06 Dec 2021 17:09:22 +0000
Received: by outflank-mailman (input) for mailman id 239545;
 Mon, 06 Dec 2021 17:09:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPV-0005ti-GU
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:17 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a860490-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:16 +0100 (CET)
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
X-Inumbo-ID: 8a860490-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tbDeksLVu0GyFKO1SroA0BOmx1FzKwu8uJ22siMq6ic=;
  b=fhJ5CmriJANP2RvZWfHSrPzvANdZlDR80vvd7jpPV1fTaWIc6dHgUhTx
   YnbeRlYR+xcVAJnb6bwg9wEA16zsWoNTpRpIQlIiODfGM8tYJpdtsH3gv
   RsetQyFhejESbwhCTrBCjggX2PZkdy1jnJ2M/1/1WZZf724HTpmB8/b2M
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MewBrood5Ax81IjdRTLTa7qtc8aDM2EA+0sCHzqmQ00R/+VsRDA4P8sy46YtZbwp7fBtmpS2BG
 Mx/oidONc1O2PWmNYeje2PxlEFYTB56ay8U66G9oJ5kgpPE8hmnlqVHatV0R9KqCYk1sovIkqD
 gUJu9wXKPz9IJxkIcohgNW0q5d0/kIZSY5vdHGmtlixVY1VPNCf6SjuzCyOsigdu8bw+07Czfe
 KoKlwV+xJZkY7YkfLEJHRyIqK4qFRai3TgTwZyBtDIGtxvZeUi4M6mOfV5gZsn+tW6UtevSCc9
 IE/Uqtownkum5PPQAMLYrJbC
X-SBRS: 5.1
X-MesageID: 59370702
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Bi0NfKszY4judmKn2+nOfA0C5ufnVKdZMUV32f8akzHdYApBsoF/q
 tZmKWnSOfmCYWf9edp+Ot+0phsOsMCBy4VrSVA+/H0wQStA+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cy2YbhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplr46KYhkEE4TwpLonFEN7Dn1fOoFN9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DN
 pFGMWU3NnwsZTV/KAooDogQrdu6oVPgQSJclHnLpIo4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMVLtuE0hKe72mhwOTImEvTWZ0QPK218OZwh1+ezXBVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhcaR9pXFfx88AyXw7DYywmcD2kACDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8tyGIEjY4AEY+WXE+ClEm/oXCp604gUeaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9XwsQCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJqm3FF52LJ9k4DNRCyKFBaJxsldjBO
 hC7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHcrH40NBPKhT6ywCDAdJ3T3
 7/BK65A6l5AVsxaIMeeHb9BgdfHOAhgrY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+23oH
 yJkH5LSkX13CbSmCgGOqNJ7BQ1afBATWMGtw+QKJ7HrH+aTMDx4YxMn6eh6ININcmU8vrqgw
 0xRrWcEkgei3iOedl3RAp2hAZu2NatCQbsAFXREFT6VN7ILO+5DNY8TKMk6e6cJ7utmwaImR
 vUJYZzYUP9OVi7G63IWapyk9N5ucxGihASvOSu5YWdgI848FlKRotK0LBHy8CQuDzassZdsq
 bOXyQ6GE4EIQB5vDZiKZav3nU+xp3UUhMl7Q1DMfotIYEzp/YUzc37xg/Y7LtsiMxLGwjfGh
 Q+aDQ1B/bvGopMv8cmPjqeB9t/7H+x7F0tcPm/a8bfpanWKojv9mddNCb/acyrcWWX4/LSZS
 d9Ul/ysYucamFtqspZnF+o5x6wJ+Nay9aRRyR5pHSuXYg3zWK9gOHSPweJGqrZJmu1CoQKzV
 0+CpotaNLGONJ+3GVIdPlN4POGK1PVSkTjO9/UlZk794XYvrraAVExTOTiKiTBcc+QpYN90n
 795tZ5E8RG7hzorLs2C33Jd+Gm7J3AdV7kq68MBC4jxhwt3klxPbPQw0MMtDE1jvzmUDnQXH
 w==
IronPort-HdrOrdr: A9a23:fBYhv63/b9S5OQJjkpxtpQqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59370702"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 40/57] libs: rename LDUSELIBS to LDLIBS and use it instead of APPEND_LDFLAGS
Date: Mon, 6 Dec 2021 17:02:23 +0000
Message-ID: <20211206170241.13165-41-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

LDLIBS is more appropriate and intended to be used to add library
dependencies. APPEND_LDFLAGS wasn't intended to be changed by the
build system.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/libs.mk        |  4 ++--
 tools/libs/guest/Makefile |  2 +-
 tools/libs/hypfs/Makefile |  2 +-
 tools/libs/light/Makefile | 18 +++++++++---------
 tools/libs/stat/Makefile  |  2 +-
 tools/libs/store/Makefile |  2 +-
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 7c5ae26bbd..91d4efeaed 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -15,7 +15,7 @@ CFLAGS   += -Werror -Wmissing-prototypes
 CFLAGS   += $(CFLAGS_xeninclude)
 CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
 
-LDUSELIBS = $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
+LDLIBS += $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
 
 LIB_OBJS := $(SRCS-y:.c=.o)
 PIC_OBJS := $(SRCS-y:.c=.opic)
@@ -85,7 +85,7 @@ lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 	$(SYMLINK_SHLIB) $< $@
 
 lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDUSELIBS) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 # If abi-dumper is available, write out the ABI analysis
 ifneq ($(ABI_DUMPER),)
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 1f4b7f7c58..636b4ea5cb 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -102,7 +102,7 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-libxenguest.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += $(ZLIB_LIBS) -lz
+libxenguest.so.$(MAJOR).$(MINOR): LDLIBS += $(ZLIB_LIBS) -lz
 
 -include $(DEPS_INCLUDE)
 
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
index be32d95d39..622fa04470 100644
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
@@ -232,7 +232,7 @@ $(XEN_INCLUDE)/_%.h: _%.h
 	$(call move-if-changed,_$*.h,$(XEN_INCLUDE)/_$*.h)
 
 libxenlight_test.so: $(PIC_OBJS) $(LIBXL_TEST_OBJS)
-	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDUSELIBS) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
 
 test_%: test_%.o test_common.o libxenlight_test.so
 	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 01417b5334..c8c81048c0 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -26,7 +26,7 @@ SRCS-$(CONFIG_FreeBSD) += xenstat_freebsd.c
 
 LDLIBS-y += -lyajl
 LDLIBS-$(CONFIG_SunOS) += -lkstat
-APPEND_LDFLAGS += $(LDLIBS-y)
+LDLIBS += $(LDLIBS-y)
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index c208dbb48a..457122a041 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -5,7 +5,7 @@ MAJOR = 4
 MINOR = 0
 
 ifeq ($(CONFIG_Linux),y)
-APPEND_LDFLAGS += -ldl
+LDLIBS += -ldl
 endif
 
 SRCS-y   += xs_lib.c
-- 
Anthony PERARD


