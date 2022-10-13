Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78B75FD9DC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422033.667932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixuG-0005hA-Is; Thu, 13 Oct 2022 13:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422033.667932; Thu, 13 Oct 2022 13:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixuG-0005Un-7s; Thu, 13 Oct 2022 13:05:48 +0000
Received: by outflank-mailman (input) for mailman id 422033;
 Thu, 13 Oct 2022 13:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixuE-0001tl-JP
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2c51c1a-4af7-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 15:05:23 +0200 (CEST)
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
X-Inumbo-ID: b2c51c1a-4af7-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V8jWdBRJCxUnfV5R+IMYSD99LmO4hxLhQr7j9mADfWE=;
  b=OM9y8d0OBk7TTNawTP7yIOZ31y9bU8yDWHKaiLLiAPHVflwxTXjVYuBI
   96ewqlCHTONaqnXrlL0biyzN1PuwuR7vBaAePBN95HfPifa5QnwlLdcl1
   PDpR3RuZQGyaGJfyZw1yGi4cvH9qfrUyd/RF+68l7WKxHZtl8lalxSGM3
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81760249
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:X7LWxKAgQqGLDRVW/yzjw5YqxClBgxIJ4kV8jS/XYbTApGxw0DQEn
 WRKCG2EM//ZZGSkeYt0Ptm09xkAsJKDzdFhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K2p4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kHBNcJy9dTAVpu9
 NgFOjw9RR6+v9O5lefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+Oi0b4SNIIDbLSlTtku9n
 j7jxn7+OxglZdal5yClySqhmcaayEsXX6pNTeblp5aGmma7xGMJDwYNfUCmuvT/gUm7M/pAL
 2QE9yxoqrI9nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYUOkrKalnBeyAggUCXIQaR8vQzY90ta29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWG3DaD/LF7rVxBHkJPmqgBiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+S4m7DqiMNoQRO8IZmOq7EMZGPBf44owQuBJ0zfFX1
 WmzK65A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eK0XOy+PiOPGDEN5vJ9fbzNimMhls/7fyOgUm
 v4DX/a3J+J3CbGuP3aGr9BJcDjn7xETXPjLliCeTcbbSiIOJY3rI6S5LW8JE2C9o5loqw==
IronPort-HdrOrdr: A9a23:YXhOc63UzmCPpIYOzKXWMQqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="81760249"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH for-4.17 v5 12/17] libs/light: Rework acpi table build targets
Date: Thu, 13 Oct 2022 14:05:08 +0100
Message-ID: <20221013130513.52440-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Currently, a rebuild of libxl will always rebuild for example
"build.o". This is because the target depends on "acpi" which never
exist. So instead we will have "build.o" have as prerequisites targets
that are actually generated by "acpi", that is $(DSDT_FILES-y).

While "dsdt_*.c" isn't really a dependency for "build.o", a side
effect of building that dsdt_*.c is to also generate the "ssdt_*.h"
that "build.o" needs, but I don't want to list all the headers needed
by "build.o" and duplicate the information available in
"libacpi/Makefile" at this time.

Also avoid duplicating the "acpi" target for Arm, and unique one for
both architecture. And move the "acpi" target to be with other targets
rather than in the middle of the source listing. For the same reason,
move the prerequisites listing for both $(DSDT_FILES-y) and "build.o".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 tools/libs/light/Makefile | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 1d5716dbba..4a8b0f7bcf 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -32,14 +32,10 @@ ACPI_PATH  = $(XEN_ROOT)/tools/libacpi
 DSDT_FILES-$(CONFIG_X86) = dsdt_pvh.c
 ACPI_OBJS  = $(patsubst %.c,%.o,$(DSDT_FILES-y)) build.o static_tables.o
 ACPI_PIC_OBJS = $(patsubst %.o,%.opic,$(ACPI_OBJS))
-$(DSDT_FILES-y) build.o build.opic: acpi
+
 vpath build.c $(ACPI_PATH)/
 vpath static_tables.c $(ACPI_PATH)/
 
-.PHONY: acpi
-acpi:
-	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) DSDT_FILES="$(DSDT_FILES-y)"
-
 OBJS-$(CONFIG_X86) += $(ACPI_OBJS)
 
 CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
@@ -58,8 +54,6 @@ ifeq ($(CONFIG_ARM_64),y)
 DSDT_FILES-y = dsdt_anycpu_arm.c
 OBJS-y += libxl_arm_acpi.o
 OBJS-y += $(DSDT_FILES-y:.c=.o)
-dsdt_anycpu_arm.c:
-	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) DSDT_FILES="$(DSDT_FILES-y)"
 else
 OBJS-$(CONFIG_ARM) += libxl_arm_no_acpi.o
 endif
@@ -191,6 +185,12 @@ all: $(CLIENTS) $(TEST_PROGS) $(AUTOSRCS) $(AUTOINCS)
 
 $(OBJS-y) $(PIC_OBJS) $(SAVE_HELPER_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): $(AUTOINCS) libxl.api-ok
 
+$(DSDT_FILES-y): acpi
+
+# Depends on the source files generated by the "acpi" target even if "build.o"
+# don't needs them but do need the headers that are also generated by "acpi".
+build.o build.opic: $(DSDT_FILES-y)
+
 libxl.api-ok: check-libxl-api-rules _libxl.api-for-check
 	$(PERL) $^
 	touch $@
@@ -227,6 +227,10 @@ _libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_
 $(XEN_INCLUDE)/_%.h: _%.h
 	$(call move-if-changed,_$*.h,$(XEN_INCLUDE)/_$*.h)
 
+.PHONY: acpi
+acpi:
+	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) DSDT_FILES="$(DSDT_FILES-y)"
+
 libxenlight_test.so: $(PIC_OBJS) $(LIBXL_TEST_OBJS)
 	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
 
-- 
Anthony PERARD


