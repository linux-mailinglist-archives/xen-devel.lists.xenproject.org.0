Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA573697F6D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 16:21:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496060.766592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJb9-0007GZ-6I; Wed, 15 Feb 2023 15:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496060.766592; Wed, 15 Feb 2023 15:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJb9-0007Dl-28; Wed, 15 Feb 2023 15:21:31 +0000
Received: by outflank-mailman (input) for mailman id 496060;
 Wed, 15 Feb 2023 15:21:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LhbV=6L=citrix.com=prvs=4037f5ffb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pSJb7-0007De-Ef
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 15:21:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68a458c3-ad44-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 16:21:26 +0100 (CET)
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
X-Inumbo-ID: 68a458c3-ad44-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676474486;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TB/1Xo9lBeklxsQghDUEHcgIbWPy9MCj1tt4y4S5kBE=;
  b=ca1Cf6KlM4JNDBToXHuEbPrazAzfcfC7Vmq++AwsLqE8skUJNLLcz5xP
   XzykMXeRl0CKOegqN3x08CROFSqRMKTbI40gLwXkPrcE4iREM/nzXYK6+
   qgpdsUvDb1vbxn6e06K6VMD1Rqk/ZJbYW36MqxzCHdlEDW6uxHDs8081X
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95997362
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:PEY9DK/Xsfc9u5DqNjQyDrUDnn6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 2cZWzuCaf6IZmehctAnYIW39hgP6JHRztNgSwNt/Cw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6kW5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklVq
 MQqEx4ibiqOmr242JPqRMpxtM8seZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0EwxfJ+
 TmYpQwVBDkTM/jczwGXyUuLj+LKwCLHaokYKOCBo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0RN54A+A8rgaXxcL84QmDAXMfZiVcc9Fgv8gzLQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9NjI6VxQqYgs/7sS8rpkS3xzsU+RoH/vg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT4FWyzyGskTKuMDiriUWWxC
 KM0kV052XOrFCH2BZKbmqroYyjQ8YDuFM7+StffZcdUb556eWevpX8xOxXBjj63wRJ8y8nT3
 Kt3l+72VR727ow9kVKLqxo1i+d3lkjSO0uNLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5TPb9q
 r5i2z+x40wHCoXWO3CHmbP/2HhWdRDX87iq8Z0IHgNCSyI6cFwc5wj5kON9Kt05xvQN/goKl
 1nkMnJlJJPErSWvAW23hrpLMdsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:uSIt76MoJHqOnsBcTgajsMiBIKoaSvp037BL7TEVdfUxSKfzqy
 nAppgmPGDP+UossR0b9uxoQZPwJk80lqQFg7X5X43DYOCOggLBEGgF1+XfKlbbak7DH4BmtJ
 tIQuxXLPXCK38/qe7bxU2CP/MJ8J293I2Jvo7lvgpQpDZRGsVdBldCZzpzyncGPjWu36BJbK
 Z0O/A3wQZIpU5nFfhSaRE+LpH+TtTw5e3bXSI=
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="95997362"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH] libs: Fix unstable libs build on FreeBSD, auto-generate version-script
Date: Wed, 15 Feb 2023 15:21:11 +0000
Message-ID: <20230215152111.51218-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Unfortunatly, --default-symver doesn't work on FreeBSD 12, with LLVM's
LD. Instead, we will generate a temporary version-script.

In order to allow regenerating the script, we'll have a different
filename. In order to check if the content is up-to-date, we'll always
generated it and compare.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: 98d95437edb6 ("libs: Fix auto-generation of version-script for unstable libs")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/libs.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 0e4b5e0bd0..cab8e9704a 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -5,6 +5,7 @@
 #   MAJOR:   major version of lib (Xen version if empty)
 #   MINOR:   minor version of lib (0 if empty)
 #   version-script: Specify the name of a version script to the linker.
+#     (If empty, a temporary one for unstable library is created)
 
 LIBNAME := $(notdir $(CURDIR))
 
@@ -13,6 +14,10 @@ MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
 endif
 MINOR ?= 0
 
+ifeq ($(origin version-script), undefined)
+version-script := libxen$(LIBNAME).map.tmp
+endif
+
 CFLAGS   += -Wmissing-prototypes
 CFLAGS   += $(CFLAGS_xeninclude)
 CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
@@ -72,6 +77,10 @@ headers.lst: FORCE
 	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
 	@$(call move-if-changed,$@.tmp,$@)
 
+libxen$(LIBNAME).map.tmp: FORCE
+	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >.$@.tmp
+	$(call move-if-changed,.$@.tmp,$@)
+
 lib$(LIB_FILE_NAME).a: $(OBJS-y)
 	$(AR) rc $@ $^
 
@@ -81,7 +90,7 @@ lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 	$(SYMLINK_SHLIB) $< $@
 
 lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) $(version-script)
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) -Wl,$(if $(version-script),--version-script=$(version-script),--default-symver) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) -Wl,--version-script=$(version-script) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 # If abi-dumper is available, write out the ABI analysis
 ifneq ($(ABI_DUMPER),)
@@ -120,7 +129,7 @@ TAGS:
 clean::
 	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
-	rm -f headers.chk headers.lst
+	rm -f headers.chk headers.lst libxen*.map.tmp
 
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


