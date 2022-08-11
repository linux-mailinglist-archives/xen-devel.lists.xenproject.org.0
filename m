Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF2F59053E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384880.620416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBWu-0004Q0-DO; Thu, 11 Aug 2022 16:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384880.620416; Thu, 11 Aug 2022 16:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBWu-0004H4-7G; Thu, 11 Aug 2022 16:59:32 +0000
Received: by outflank-mailman (input) for mailman id 384880;
 Thu, 11 Aug 2022 16:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNd-0003Aq-9y
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e4059c7-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:52 +0200 (CEST)
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
X-Inumbo-ID: 9e4059c7-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CGFwXlrWynx6TK1V9fLINkj8ydS6NN68SzpiLukviOo=;
  b=Bbcn02x9t6ELcMfDYy/1g51p4uiVIBNSpL61EQ27vLlbj2WSyh93IuKM
   OtcWp1TQ/MiJqTSvS9/oYfiUNjtQcUqj54/FK68Yr0y4Pczfe1sJVdH+1
   wxDQu5UdS9jOJX+QWsvfmX20inmGlCHN2Paid7q0G0ujaj1QcaqVIai5P
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77898119
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AYZv2BKI7U4ZZJOR0FE//H55y6k4xRxNeGxP+q?=
 =?us-ascii?q?gilJ80cmdWY4AxU5fiJA7t6h/JklmHkQqc++bkUhDt+1aKTYknsPwqF0fTr+?=
 =?us-ascii?q?p2GHfAGGAa+5RFE2PFMpiHviMVW1pg09echHfxEm4CRUTqZzBJ/FnhQRbdfs?=
 =?us-ascii?q?R08ONa+vl/4QdmsU3m8Bu7zUrmmKM/3EY4gLoMCBTT+AMlxqHaXYMsuATrh2?=
 =?us-ascii?q?jPN5IqhX/ykw8/siy6gl63hjmE8TBKIpsN+5TmQo+WuW4R/0eoEpWBo+wuRR?=
 =?us-ascii?q?mtFXXJ6n0zzC+ISzr/wT9FrDAkSzjDtOl2yi6QmZNNULEqcaPhPwqidLKtNZ?=
 =?us-ascii?q?lItLzlAynFoGQI4wcxpgqnNH3+GTiRzeRNkORLoqXnDleZkozoVkcq6OEGjJ?=
 =?us-ascii?q?4DpdSHTEPaOBFC1iAFYKrFu5OcGOdIHY1lDAyHUHTZWKIoJimp88cKTBxvxP?=
 =?us-ascii?q?PrYHFU5kxex7GMzIymPlrl/MdaJXGSlQsnytm3O41AuDsERw+k7Mh/x/+Grg?=
 =?us-ascii?q?2iYISO6zNbc5IfLS69a1zCR1nSkOsUXXAtF2/oQXL9kGNL1QZ+RLm3chRFQS?=
 =?us-ascii?q?+Kf1FjEwc1YzQOHcOxPd1IF58tAI8ABvFZpjppwuWdvnsqyHPytppsraehVa?=
 =?us-ascii?q?b/ddlkDXu5ouzF25sTO7JBp6QCtRT0y7Z0AaVUC4tGNOqg8NKg6az5UiLkbE?=
 =?us-ascii?q?/o8DNjxFHBR402k4anDjLbpungvrSKDmj0geTgejp0bx1aIXA59X7bkRJT71?=
 =?us-ascii?q?PLhuvL99iSISlhpn/Jm9oSjXonop1D+w1ATEtpUq4sMQr6JA3VPQku0KWaHH?=
 =?us-ascii?q?erL0OpXgKB54ukNRh8IBtmlYK7PLBg0NB+LgnvFI4vcY2unnO/tTu13c54Rl?=
 =?us-ascii?q?wLNcc37kl/2RYoyZlkW6hmdM6LsOTmY9GKwILWG6d8qiVpJ/6YyksI3D7MiV?=
 =?us-ascii?q?jZ6OIOg+pefNPAlCRUu4Aho5Wfu9TSTXgaRyv0DHn9+RT4qRpbBJjaebjn4h?=
 =?us-ascii?q?vHAHZBgqjt9Q3UVc+wMk5QvppATYGp4igUZYkVUXSSAkTowK+4ArRiha21Qt?=
 =?us-ascii?q?daBZYIaKukbKpKP3r/vQzTzyrwCAGv7mZfu47EkSesWU+xVMDfnCuqIlW/XA?=
 =?us-ascii?q?iNzejZYH2kFZVy4YL+sxLRjemYwcUOpOWG5vzpV0lR5eCGz/7u6ezlpA4+OT?=
 =?us-ascii?q?qgCYNR30TqxaGZx6XyORo19/sb8TpPoa6kZJfAgHvd/IymXtCSs2lTc3EtnV?=
 =?us-ascii?q?kfPP7APPbKuvvH0QtULnszGIziCQniY0IwIdYaY8CkxkD0K4kUCJpBFoYTX2?=
 =?us-ascii?q?KCyXyElOmL/Q8dwZzg9fG14bO7TJaqdH7pQbzg9n8qgJkNZY8xkZ+GjV5E+X?=
 =?us-ascii?q?lJly9AkPphLauAHH46Hh67fH4C5cfpYnet0UzjhI252AD5SccncGG8wcn9mJ?=
 =?us-ascii?q?NA57AVqH+M2Tnzlj9nZdbeucIL/qzP87S5TJpljYXtj9FJgWVMDPVl7A0zad?=
 =?us-ascii?q?R5sETBnCFLvcb1FLN/bdAqjPq1zTnjQjdAV8jxPXcS3g3l3qgyH2pOytpeqf?=
 =?us-ascii?q?3z99XEQP5voO/Yft1jMV0Czz8aDppOw8LiEpA0Evz7JS+EEHojFh3vAzCkFu?=
 =?us-ascii?q?9JybHIN5zhjHgU+X/RV3+NTyWSBY0w2z1hvyRY1dSyOdPUHLFjPmlVXqDAch?=
 =?us-ascii?q?Z9dv9XOmMCAE6jNLNqYMk8cEEqDLroE27T+/mKQXOXD4kKD5zSV6RD2DWjzp?=
 =?us-ascii?q?4KfHKUBs5zJQhQ6/tZfFAZ87NCKZAR8EfDnBv620lNi84orif9SqzxSZARLH?=
 =?us-ascii?q?Uvh9IwlA7PL94HvjQWPV+wvlFREKWCicE0G1a56y23m7w6q+QGvGu723Yq+R?=
 =?us-ascii?q?93GMCvgZ1JatcOVu/QO6tI3rtp4tr2AIbei35It8eTw25hkMqt6klJuPjtH3?=
 =?us-ascii?q?eD5o5xjWEwJhSuGT9DMzHN8CaC36RwJENXcTwVyiPT6PJL+50Td/Cs+4oC7T?=
 =?us-ascii?q?DTZGibfkMyu52wqeD/e9gFV1XkmSyL7BrrCEb/+JL9MoCzrxI0/H0wXUfeLk?=
 =?us-ascii?q?IhRfvH2/c/Auwjetx2DTagZ1CbcoFrQON/crnxw379TMEK1p3uiHqXz9MoN+?=
 =?us-ascii?q?DxNui/iX105cPDqLOFdxOSMYJBkYs5/NlEiM99sUmkprHOYR+H3zt+Iui2u1?=
 =?us-ascii?q?wwFr5pTthDuWFQjeguhpFQCW+oi3rk5GG+GLVFOkQvU2NlLmXoB9aTAD57K3?=
 =?us-ascii?q?ixJjMgWCnL5w61KXZXTF+xIfyhazqasqcUuQuQ6T7IaWNsbAjFExnsFHdLws?=
 =?us-ascii?q?Ll50WNOsLAhISbmZ/EvrkC9JNKMX7mzwzimxE6X9FZFmmjlRwBLcte4MpElP?=
 =?us-ascii?q?SeZPZFnHwx48188BkWfNFOb8ffzlF5l+5pDPdGm1AfuwX2kMFg1sm89GKWgA?=
 =?us-ascii?q?cX9JEV93nujf/VyFnjua9Z9Z5zeOr4vPAONj2gbTcLnBWgQHeoo6wUqvUSIJ?=
 =?us-ascii?q?A18DfJnJFtaiQi6Lrcd6p6uy88Gp/W4RnWdtnwUJeWkPHOWAZj3+7zgbPdTR?=
 =?us-ascii?q?lN2+s9yj5knaHYsEkdkoN2KLZSjkU52krNDLTFpvALx62ofuCUudifTCBoN6?=
 =?us-ascii?q?Vn3oUTq5lvSlotQLdT3SkVZyzPDVoeTt7mlMXhk6+UkZMfFwBBDen763VjY9?=
 =?us-ascii?q?NPvLJ0BRSD74X41ONOZJttjeF/jE9FhM8fFRbotO/s0WZ1FQpB7x8yIexsdd?=
 =?us-ascii?q?GTrm+I1IWV6?=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77898119"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v4 30/32] libs/light: Rework targets prerequisites
Date: Thu, 11 Aug 2022 17:48:43 +0100
Message-ID: <20220811164845.38083-31-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
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


