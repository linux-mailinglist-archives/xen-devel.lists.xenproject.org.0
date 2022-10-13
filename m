Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551665FDA1F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422129.667979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy49-0003U7-7b; Thu, 13 Oct 2022 13:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422129.667979; Thu, 13 Oct 2022 13:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy49-0003RD-4J; Thu, 13 Oct 2022 13:16:01 +0000
Received: by outflank-mailman (input) for mailman id 422129;
 Thu, 13 Oct 2022 13:15:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixuK-0001tl-1f
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5eda9ad-4af7-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 15:05:29 +0200 (CEST)
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
X-Inumbo-ID: b5eda9ad-4af7-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nc4WbeeXR+sXTmS5lu4Ec75pp9DLw9YmC4v+YNyuXWw=;
  b=Tb3KCDrOjpiDjPo+MbrBEQaJW21cfgNCPLnMHJM9T8N/D2TTN6yeCW/d
   Dcct4TzB/m7ZecTQ1bxIoQCnMLdPGd0Jn5UdLqaFhZ2xf4wUcaEE/z36U
   gvfNq5ApbLiXlZ/Nlt2+4YdAR3dW/79jnPge5AjmULp4jzqD+CMVzJcDf
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81760266
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:X+7m3assN0pMYRB1t+4OpIHSbufnVFNeMUV32f8akzHdYApBsoF/q
 tZmKW3QMvaMNmakf9B/a4y3oB8DsMTSyIU2TlZlq3xnF3tA+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPakQ5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkU/
 84xFS5XdyrAiuGY/qyJY9k9qoMaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZUMwRjA/
 DyYl4j/KhZEDIedkAqCy1jvmrD0mXLjeJkVCpTto5aGh3XMnzdOWXX6T2CTo/ajjVWlc8lCM
 EFS8S0rxYAt8GS7Q9+7WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBeeNAx/
 gbXxZWzX2Up6eDLDyLGnluJkd+sEXIfH0Y/e3Udd0gI4PfdvrMavkPjCe82RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRz3phZPnqgKulmSwXuF1e5VEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPMUvLFffpH8xPBT4M4XRfK8EyPhXB
 HtmWZz0USZy5VpPllJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WUN5vYwtaQLWBt3VGYve/205B
 f4DaJbRo/ieOcWiChTqHXk7dAxacCdqW86s9qS6tIere2JbJY3oMNeJqZtJRmCvt/09ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:c21tX6xptsK8G+jSPUx4KrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZImPH7P+U4ssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkGNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="81760266"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH for-4.17 v5 15/17] libs/light: Makefile cleanup
Date: Thu, 13 Oct 2022 14:05:11 +0100
Message-ID: <20221013130513.52440-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rework "libacpi.h" include in "libxl_x86_acpi.c" as to be more
selective about the include path and only add "tools/libacpi/". Also
"libxl_dom.c" don't use "libacpi.h" anymore. Use "-iquote" for libacpi
headers.

Get rid of the weird "$(eval stem =" in the middle of a recipe and use
a make automatic variable "$(*F)" instead.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 tools/libs/light/Makefile         | 16 +++++++---------
 tools/libs/light/libxl_x86_acpi.c |  2 +-
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 274e8350bb..250cc3bd2c 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -169,8 +169,7 @@ LDLIBS += $(LDLIBS-y)
 $(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) -include $(XEN_ROOT)/tools/config.h
 $(ACPI_OBJS) $(ACPI_PIC_OBJS): CFLAGS += -I. -DLIBACPI_STDUTILS=\"$(CURDIR)/libxl_x86_acpi.h\"
 $(TEST_PROG_OBJS) _libxl.api-for-check: CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxentoolcore)
-libxl_dom.o libxl_dom.opic: CFLAGS += -I$(XEN_ROOT)/tools  # include libacpi/x86.h
-libxl_x86_acpi.o libxl_x86_acpi.opic: CFLAGS += -I$(XEN_ROOT)/tools
+libxl_x86_acpi.o libxl_x86_acpi.opic: CFLAGS += -iquote $(ACPI_PATH)
 $(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenguest)
 
 testidl.o: CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenlight)
@@ -224,13 +223,12 @@ testidl.o: $(XEN_INCLUDE)/libxl.h
 # This exploits the 'multi-target pattern rule' trick.
 # gentypes.py should be executed only once to make all the targets.
 _libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_type%.idl gentypes.py idl.py
-	$(eval stem = $(notdir $*))
-	$(PYTHON) gentypes.py libxl_type$(stem).idl __libxl_type$(stem).h __libxl_type$(stem)_private.h \
-		__libxl_type$(stem)_json.h  __libxl_type$(stem).c
-	$(call move-if-changed,__libxl_type$(stem).h,_libxl_type$(stem).h)
-	$(call move-if-changed,__libxl_type$(stem)_private.h,_libxl_type$(stem)_private.h)
-	$(call move-if-changed,__libxl_type$(stem)_json.h,_libxl_type$(stem)_json.h)
-	$(call move-if-changed,__libxl_type$(stem).c,_libxl_type$(stem).c)
+	$(PYTHON) gentypes.py libxl_type$(*F).idl __libxl_type$(*F).h __libxl_type$(*F)_private.h \
+		__libxl_type$(*F)_json.h  __libxl_type$(*F).c
+	$(call move-if-changed,__libxl_type$(*F).h,_libxl_type$(*F).h)
+	$(call move-if-changed,__libxl_type$(*F)_private.h,_libxl_type$(*F)_private.h)
+	$(call move-if-changed,__libxl_type$(*F)_json.h,_libxl_type$(*F)_json.h)
+	$(call move-if-changed,__libxl_type$(*F).c,_libxl_type$(*F).c)
 
 .PRECIOUS: _libxl_type%.h _libxl_type%.c
 
diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
index 57a6b63790..22eb160659 100644
--- a/tools/libs/light/libxl_x86_acpi.c
+++ b/tools/libs/light/libxl_x86_acpi.c
@@ -16,7 +16,7 @@
 #include "libxl_arch.h"
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/e820.h>
-#include "libacpi/libacpi.h"
+#include "libacpi.h"
 
  /* Number of pages holding ACPI tables */
 #define NUM_ACPI_PAGES 16
-- 
Anthony PERARD


