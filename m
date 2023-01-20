Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7621675E45
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 20:45:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482101.747473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxJo-0007nG-LH; Fri, 20 Jan 2023 19:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482101.747473; Fri, 20 Jan 2023 19:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxJo-0007jq-Hb; Fri, 20 Jan 2023 19:44:56 +0000
Received: by outflank-mailman (input) for mailman id 482101;
 Fri, 20 Jan 2023 19:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8tu/=5R=citrix.com=prvs=37768f290=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIxJn-0007So-5n
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 19:44:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7997d30-98fa-11ed-b8d1-410ff93cb8f0;
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
X-Inumbo-ID: e7997d30-98fa-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674243892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qbIop1KczSm54uhv5dm8fTDAeLbDBaP++MO1eIvO/KI=;
  b=UrZkweEhhieC1HE1Oj90vdmqCb32sFEGeOaXaUkFCesrUzcExh74KnrM
   wZL3oxEjZPWUn9r8GgWJ391/PitXL3dwSZ6D+6Pv9KwILRDyQjDMcOs9J
   +iphaWP2XKmGlzgJmVBac4693spBVk+KoO58O6mCr0pmVDXlBj9WuxQmb
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93020460
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:iVGmQ6Al5g3PdBVW/z3jw5YqxClBgxIJ4kV8jS/XYbTApG4r3zRUx
 2QdXG6BPP2KZ2T8fdpzaNu+90ICsZXRxodkQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpC5gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw8O10RmxB0
 KYhLB9QRE3fv/+o4ZerY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9K4fSH50JwB7wS
 mTu3mLDXABCZNyjzhG8ok/xnL/hpwDQcddHfFG/3qEz2wDCroAJMzUJUXOrrP//jVSxM/pdJ
 FYT4TEGtrUp+QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp6efOIZ6AyluKhTm5Om8YIkpYXCsrECFYv+H+vqAWnjuaG76PD5WJptHyHDjxx
 RWDoy4/m6gfgKY36kmrwbzUq2ny/8aUF2bZ8i2SBzv4tV0hOOZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/LF7rVxBHkJPm6gKuFlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4u5DKuFM4MePsApHONiwM2ITRTIt4wKuBF8+ZzTx
 L/BKZr8ZZrkIfoPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bMIYrpxGCmN7hjhIvd+VW9z
 jqqH5fSo/mpeLGkM3a/HE96BQxiEEXX8riv8pwHK7XZflY9cIzjYteIqY4cl0Vet/w9vo/1E
 ruVASe0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:ix/VBKq0DbD/C/hmaFsaDlkaV5sGLNV00zEX/kB9WHVpm5Oj5q
 eTdaUgpHvJYWgqKRQdcIi7Sdu9qXO1z+8O3WBjB8bWYOCGghrqEGgG1+DfKlLbalPDH4JmpN
 9dmu1Fea7N5DtB/ITHCWuDYqcdKbC8mcjY55a5vg5QpENRGtFdBmxCe3um+zhNNXZ77O0CZe
 ahD6R81kGdkHIsDrXZOpD6ZYf+Tibw+a4OnSRmO/fc0mOzZMyThIIS7iL34j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0PD8phMn9Pl691bQOiBkNIcJDnAghuhIN0JYczHgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5Tf9xgX61z4qynn6jXuVm2Hqr8DVTC8zT+BBmYVaWB3E7FdIhqA47I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn12S+IlGflshL1a2HkQPIYLHSr85oxiOv
 JpFtvg6PFfdk7fR2zFv1No3MenUh0Ib067qwk5y5SoOgpt7SpEJngjtZEid7A7hc4Aoqx/lr
 /522JT5e5zp4EtHPxA7aw6ML+K4yT2MGXx2SSpUBPa/eg8SgTwgo+y77Mv6O6wfpsUiJM0hZ
 TaSVtd8XU/YkT0FKS1rdN2Gz32MSmAtA7Wu45jzok8vqe5SKvgMCWFRlxrm8y8o+8HCsmeX/
 qoIppZD/LqMGOrQO9yrk3DcogXLWNbXNweu949VV7LqsXXKpfyvuiedPrIPrLiHTstR2u6CH
 oeWzr4ItlG8ymQKz7FqQmUX2modl30/Jp2HqSf9+8PyJIVPokJqQQRgUTR3LDHFdSDiN19QK
 JTGsKtrkrgnxj+wY/h1RQgBiZg
X-IronPort-AV: E=Sophos;i="5.97,233,1669093200"; 
   d="scan'208";a="93020460"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH for-4.17 v6 3/5] libs/light: Makefile cleanup
Date: Fri, 20 Jan 2023 19:44:29 +0000
Message-ID: <20230120194431.55922-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230120194431.55922-1-anthony.perard@citrix.com>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
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
index b28447a2ae..96daeabc47 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -170,8 +170,7 @@ LDLIBS += $(LDLIBS-y)
 $(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) -include $(XEN_ROOT)/tools/config.h
 $(ACPI_OBJS) $(ACPI_PIC_OBJS): CFLAGS += -I. -DLIBACPI_STDUTILS=\"$(CURDIR)/libxl_x86_acpi.h\"
 $(TEST_PROG_OBJS) _libxl.api-for-check: CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxentoolcore)
-libxl_dom.o libxl_dom.opic: CFLAGS += -I$(XEN_ROOT)/tools  # include libacpi/x86.h
-libxl_x86_acpi.o libxl_x86_acpi.opic: CFLAGS += -I$(XEN_ROOT)/tools
+libxl_x86_acpi.o libxl_x86_acpi.opic: CFLAGS += -iquote $(ACPI_PATH)
 $(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenguest)
 
 testidl.o: CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenlight)
@@ -225,13 +224,12 @@ testidl.o: $(XEN_INCLUDE)/libxl.h
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


