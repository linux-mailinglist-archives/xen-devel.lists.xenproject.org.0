Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A085C5FDA22
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:16:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422126.667968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy46-0003DS-Rz; Thu, 13 Oct 2022 13:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422126.667968; Thu, 13 Oct 2022 13:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy46-0003Ae-Oi; Thu, 13 Oct 2022 13:15:58 +0000
Received: by outflank-mailman (input) for mailman id 422126;
 Thu, 13 Oct 2022 13:15:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixui-0002ig-SZ
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:06:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfc32739-4af7-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 15:06:14 +0200 (CEST)
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
X-Inumbo-ID: cfc32739-4af7-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CGFwXlrWynx6TK1V9fLINkj8ydS6NN68SzpiLukviOo=;
  b=DxqdkTsXzeCaAMHsGqt6Wc/Jj/DkzkBeyhgVelNDB9rpM5nhy9NIR7OF
   Beoky3gF8ezAhi/56O5Gis+gEBK5c4INg0QUvAvkCrMPTBD9th3rFpLm+
   3zfo743qzM1a+tm6CqEaAHwvnj3tSL9X1z5TNqHGVroQ5CL2HqEkf7deM
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 85173851
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bbyzlaLXB5fQ5GULFE+R1ZUlxSXFcZb7ZxGr2PjKsXjdYENS3j0Dn
 DMbDGyAOf7ZNmCkeNh3bt6+9k8Cv5CDydY2GVdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4WhA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05Fakh4floBHFwz
 ONCMxUEbi6Oibrrwr3uH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEl4RFJI5mvbunnTleidUgFmUubA28y7YywkZPL3FYIeMJYfaGJw9ckCwj
 T7dvEbJPRQhDtGe7WPa9SiMncXWknauMG4VPOLhraM76LGJ/UQRBwcRTkCTuuSihwi1XNc3A
 1MQ0jojq+417kPDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZ8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy10o6Psiy3KRYsMjUZQCYEcwYLu4Thr9Rm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNT9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQQyd3XC3273k5JGQWy3yGAWGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq7C66MNoIWPMcoLmdrGR2CgmbJhgjQfLUEy/lja
 f93j+72ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjG8vhT6pLHPSb9dFvwGAHRBgzPxP/b/V69H
 hc2H5fi9iizp8WnPnmKrt9NcwpXRZX5bLivw/Fqmie4ClIOMAkc5zX5mutJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:JbBuk6gd5vwMeqsH4M/H4LcbiHBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="85173851"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH for-4.17 v5 14/17] libs/light: Rework targets prerequisites
Date: Thu, 13 Oct 2022 14:05:10 +0100
Message-ID: <20221013130513.52440-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

No need for $(AUTOSRCS), GNU make can generate them as needed when
trying to build them as needed when trying to build the object. Also,
those two AUTOSRCS don't need to be a prerequisite of "all". As for
the "clean" target, those two files are already removed via "_*.c".

We don't need $(AUTOINCS) either:
- As for both _libxl_savm_msgs*.h headers, we are adding more
  selective dependencies so the headers will still be generated as
  needed.
- "clean" rule already delete the _*.h files, so AUTOINCS aren't needed
  there.

"libxl_internal_json.h" doesn't seems to have ever existed, so the
dependency is removed.

Add few prerequisite for "libxl_internal.h" so all headers that it
depends on should be generated. And have $(SAVE_HELPER_OBJS) depends
on "libxl_internal.h".

Rework objects prerequisites, to have them dependents on either
"libxl.h" or "libxl_internal.h". "libxl.h" is not normally included
directly in the source code as "libxl_internal.h" is used instead. But
we are adding "libxl.h" as prerequisite of "libxl_internal.h", so
generated headers will still be generated as needed.

"testidl.c" doesn't depends on "libxl.h" but "testidl.o" does. Also
use automatic variables $< and $@.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 tools/libs/light/Makefile | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 9329055c98..274e8350bb 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -147,9 +147,6 @@ LIBXL_TEST_OBJS += $(foreach t, $(LIBXL_TESTS_INSIDE),libxl_test_$t.opic)
 TEST_PROG_OBJS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t.o) test_common.o
 TEST_PROGS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t)
 
-AUTOINCS = _libxl_save_msgs_callout.h _libxl_save_msgs_helper.h
-AUTOSRCS = _libxl_save_msgs_callout.c _libxl_save_msgs_helper.c
-
 CLIENTS = testidl libxl-save-helper
 
 SAVE_HELPER_OBJS = libxl_save_helper.o _libxl_save_msgs_helper.o
@@ -177,13 +174,13 @@ libxl_x86_acpi.o libxl_x86_acpi.opic: CFLAGS += -I$(XEN_ROOT)/tools
 $(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenguest)
 
 testidl.o: CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenlight)
-testidl.c: libxl_types.idl gentest.py $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
-	$(PYTHON) gentest.py libxl_types.idl testidl.c.new
-	mv testidl.c.new testidl.c
+testidl.c: libxl_types.idl gentest.py
+	$(PYTHON) gentest.py $< $@.new
+	mv -f $@.new $@
 
-all: $(CLIENTS) $(TEST_PROGS) $(AUTOSRCS) $(AUTOINCS)
+all: $(CLIENTS) $(TEST_PROGS)
 
-$(OBJS-y) $(PIC_OBJS) $(SAVE_HELPER_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): $(AUTOINCS) libxl.api-ok
+$(OBJS-y) $(PIC_OBJS) $(SAVE_HELPER_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): libxl.api-ok
 
 $(DSDT_FILES-y): acpi
 
@@ -195,7 +192,7 @@ libxl.api-ok: check-libxl-api-rules _libxl.api-for-check
 	$(PERL) $^
 	touch $@
 
-_libxl.api-for-check: $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
+_libxl.api-for-check: $(XEN_INCLUDE)/libxl.h
 	$(CC) $(CPPFLAGS) $(CFLAGS) -c -E $< $(APPEND_CFLAGS) \
 		-DLIBXL_EXTERNAL_CALLERS_ONLY=LIBXL_EXTERNAL_CALLERS_ONLY \
 		>$@.new
@@ -207,13 +204,22 @@ _libxl_save_msgs_helper.h _libxl_save_msgs_callout.h: \
 	$(PERL) -w $< $@ >$@.new
 	$(call move-if-changed,$@.new,$@)
 
+#
+# headers dependencies on generated headers
+#
 $(XEN_INCLUDE)/libxl.h: $(XEN_INCLUDE)/_libxl_types.h
 $(XEN_INCLUDE)/libxl_json.h: $(XEN_INCLUDE)/_libxl_types_json.h
+libxl_internal.h: $(XEN_INCLUDE)/libxl.h $(XEN_INCLUDE)/libxl_json.h
 libxl_internal.h: _libxl_types_internal.h _libxl_types_private.h _libxl_types_internal_private.h
-libxl_internal_json.h: _libxl_types_internal_json.h
+libxl_internal.h: _libxl_save_msgs_callout.h
 
-$(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS) $(SAVE_HELPER_OBJS): $(XEN_INCLUDE)/libxl.h
+#
+# objects dependencies on headers that depends on generated headers
+#
+$(TEST_PROG_OBJS): $(XEN_INCLUDE)/libxl.h
 $(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS): libxl_internal.h
+$(SAVE_HELPER_OBJS): $(XEN_INCLUDE)/libxl.h _libxl_save_msgs_helper.h
+testidl.o: $(XEN_INCLUDE)/libxl.h
 
 # This exploits the 'multi-target pattern rule' trick.
 # gentypes.py should be executed only once to make all the targets.
@@ -260,5 +266,4 @@ clean::
 	$(RM) testidl.c.new testidl.c *.api-ok
 	$(RM) $(TEST_PROGS) libxenlight_test.so libxl_test_*.opic
 	$(RM) -r __pycache__
-	$(RM) $(AUTOSRCS) $(AUTOINCS)
 	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) clean
-- 
Anthony PERARD


