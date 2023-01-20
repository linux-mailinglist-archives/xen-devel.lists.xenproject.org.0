Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F17675E47
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 20:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482100.747463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxJn-0007X5-Bm; Fri, 20 Jan 2023 19:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482100.747463; Fri, 20 Jan 2023 19:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxJn-0007T1-8D; Fri, 20 Jan 2023 19:44:55 +0000
Received: by outflank-mailman (input) for mailman id 482100;
 Fri, 20 Jan 2023 19:44:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8tu/=5R=citrix.com=prvs=37768f290=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIxJm-0006vE-9G
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 19:44:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e776542c-98fa-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 20:44:52 +0100 (CET)
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
X-Inumbo-ID: e776542c-98fa-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674243892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wkzc8EHjHeIToBQwmAPpP3ELZs15aV2ACnx/cVw+uyo=;
  b=ftb0DCwjopmb3pSx+teFq8NvYUw7DWhEq1lQ6m/hxwGaIK8Msfn9TEhX
   hiTRYnVXIe0qR0X7v76f2VHKbOxzKhhUW2LG/g9fPurVF2Lc3D9zo743h
   K08OU2II4mkU8b/6piPc1EwNSaniGzPAtYnzaxfaaNLVcvcOA8Qs1xNh8
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92472092
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Qg9Zi6+iZD9/AiYE3Y+bDrUDlH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2UbCmvQOvrYa2L1ftF+b4zgp04F7ZeAzdVhHQA5qS08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKoT5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl/1
 eY/OhsOQCnfnt2b3omfQ+JU2PsseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0ExBrH/
 DqXpQwVBDkZGtvE2we+1kiuodWXvynZaoUuEJqRo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0RN54A+A8rgaXxcL84QmDAXMfZiVcc9Fgv8gzLQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9HE8YQj0vTiU8v8DcjZ8IqhvEdohcH/vg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hO0yT5FWy13N2YDB0xWvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMYYUOcksLV/bpHkGiausM4bFyhBEfUYXY
 MfzTCpRJSxCVfQPIMSeGY/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GALmUwzN14vd+F+92
 48GZ6O3J+B3DLWWjt//rdRCcjjn7BETWfjLliCgXrfaclo7Qzt9V6S5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:0UvX76j0lAuPl4zJVFek+OFeSHBQXssji2hC6mlwRA09TyX4ra
 2TdZEgvnXJYVkqKRIdcK+7Scu9qB/nm6KdgrN8AV7BZmnbUQKTRelfBODZrAEIdReeygdV79
 YET5RD
X-IronPort-AV: E=Sophos;i="5.97,233,1669093200"; 
   d="scan'208";a="92472092"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>
Subject: [XEN PATCH for-4.17 v6 2/5] libs/light: Rework targets prerequisites
Date: Fri, 20 Jan 2023 19:44:28 +0000
Message-ID: <20230120194431.55922-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230120194431.55922-1-anthony.perard@citrix.com>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

No need for $(AUTOSRCS), GNU make can generate them as needed when
trying to build them as needed when trying to build the object. Also,
those two AUTOSRCS don't need to be a prerequisite of "all". As for
the "clean" target, those two files are already removed via "_*.c".

We don't need $(AUTOINCS) either:
- As for both _libxl_save_msgs*.h headers, we are adding more
  selective dependencies so the headers will still be generated as
  needed.
- "clean" rule already delete the _*.h files, so AUTOINCS aren't needed
  there.

"libxl_internal_json.h" doesn't seems to have ever existed, so the
dependency is removed.

Rework objects prerequisites, to have them dependents on either
"libxl.h" or "libxl_internal.h". "libxl.h" is not normally included
directly in the source code as "libxl_internal.h" is used instead, but
we have "libxl.h" as prerequisite of "libxl_internal.h", so generated
headers will still be generated as needed.

Make doesn't need "libxl.h" to generate "testidl.c", "libxl.h" is only
needed later when building "testidl.o". This avoid the need to
regenerate "testidl.c" when only "libxl.h" changed. Also use automatic
variables $< and $@.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v6:
    - rebased, part of the patch commited as 4ff0811
    - reword commit message
    
    v4:
    - new patch

 tools/libs/light/Makefile | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index cd3fa855e1..b28447a2ae 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -148,9 +148,6 @@ LIBXL_TEST_OBJS += $(foreach t, $(LIBXL_TESTS_INSIDE),libxl_test_$t.opic)
 TEST_PROG_OBJS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t.o) test_common.o
 TEST_PROGS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t)
 
-AUTOINCS = _libxl_save_msgs_callout.h _libxl_save_msgs_helper.h
-AUTOSRCS = _libxl_save_msgs_callout.c _libxl_save_msgs_helper.c
-
 CLIENTS = testidl libxl-save-helper
 
 SAVE_HELPER_OBJS = libxl_save_helper.o _libxl_save_msgs_helper.o
@@ -178,13 +175,13 @@ libxl_x86_acpi.o libxl_x86_acpi.opic: CFLAGS += -I$(XEN_ROOT)/tools
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
 
@@ -196,7 +193,7 @@ libxl.api-ok: check-libxl-api-rules _libxl.api-for-check
 	$(PERL) $^
 	touch $@
 
-_libxl.api-for-check: $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
+_libxl.api-for-check: $(XEN_INCLUDE)/libxl.h
 	$(CC) $(CPPFLAGS) $(CFLAGS) -c -E $< $(APPEND_CFLAGS) \
 		-DLIBXL_EXTERNAL_CALLERS_ONLY=LIBXL_EXTERNAL_CALLERS_ONLY \
 		>$@.new
@@ -208,14 +205,22 @@ _libxl_save_msgs_helper.h _libxl_save_msgs_callout.h: \
 	$(PERL) -w $< $@ >$@.new
 	$(call move-if-changed,$@.new,$@)
 
+#
+# headers dependencies on generated headers
+#
 $(XEN_INCLUDE)/libxl.h: $(XEN_INCLUDE)/_libxl_types.h
 $(XEN_INCLUDE)/libxl_json.h: $(XEN_INCLUDE)/_libxl_types_json.h
 libxl_internal.h: $(XEN_INCLUDE)/libxl.h $(XEN_INCLUDE)/libxl_json.h
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
@@ -262,5 +267,4 @@ clean::
 	$(RM) testidl.c.new testidl.c *.api-ok
 	$(RM) $(TEST_PROGS) libxenlight_test.so libxl_test_*.opic
 	$(RM) -r __pycache__
-	$(RM) $(AUTOSRCS) $(AUTOINCS)
 	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) clean
-- 
Anthony PERARD


