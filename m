Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B97F590540
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384890.620455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBX0-0005Z6-Sd; Thu, 11 Aug 2022 16:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384890.620455; Thu, 11 Aug 2022 16:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBX0-0005Qu-KJ; Thu, 11 Aug 2022 16:59:38 +0000
Received: by outflank-mailman (input) for mailman id 384890;
 Thu, 11 Aug 2022 16:59:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNX-0003s9-95
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9caa0ff6-1995-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:49:50 +0200 (CEST)
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
X-Inumbo-ID: 9caa0ff6-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V8jWdBRJCxUnfV5R+IMYSD99LmO4hxLhQr7j9mADfWE=;
  b=dMOWP4pSaG4B/RxBrK2Ww7KNKeFJdTjefQN0JfwKM9MgfegHtgvYyl4E
   MVsoePZWUIgyy4f3WB1FMlAHbaNFLojejCJbeOVD+J0NQaHqQiThLDfkW
   luCeNYVRL7CQdDA4FoXoGZFua7TgZqvmZirgHBBHyvfWPN+zuexSHKpHi
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80449106
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rKTmTazYiPO2+uNtpxl6t+dbxirEfRIJ4+MujC+fZmUNrF6WrkUOx
 2FMXTyGaKvYM2vxft0lYdi0o0oDu5bSz99hTAE5riAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Eo25K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1DNkw5eqEKqtxuAHEUx
 dAqM2wIUkic0rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzJZQFPPVEGToozhu6yilH0ciFCqULTrq0yi4TW5FwpjOS8aYKLEjCMbchYl2KJv
 X3Gw0bCDxIVFPu97zbC2Fv504cjmgukAdlPRdVU7MVCglKJwXcIIAYLTlb9qv684mahX/pPJ
 kpS/TAhxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmJCvRH3a2qXElyqzKXIlAV0ZOSo4FRRQtrEPv7oPYgLzosdLSfDr1oWkRmipn
 VhmvwBl2exN0JdjO7GTuAme3mny/sWhohsdvF2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAYlRujBCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hGL4VwJvc4DYSHwBUOSX25WI5pC8EQdPY69CqC8giRmO/CdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTPtA+U0yUP0/pBLrFrh17FPe7nphrY8lbcykkk/PPHv3TCL9dIrpx3PSN7xlsP7f8FmMm
 zudXuPToyhivCTFSnG/2eYuwZoidBDX2bieRxRrS9O+
IronPort-HdrOrdr: A9a23:PZcDj668RgP5j6KAoAPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HIoB17726MtN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpM
 FdmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="80449106"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v4 28/32] libs/light: Rework acpi table build targets
Date: Thu, 11 Aug 2022 17:48:41 +0100
Message-ID: <20220811164845.38083-29-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
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


