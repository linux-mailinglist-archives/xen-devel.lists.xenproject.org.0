Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D754590543
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384902.620480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBX5-0006ZO-W1; Thu, 11 Aug 2022 16:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384902.620480; Thu, 11 Aug 2022 16:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBX5-0006Pc-Lm; Thu, 11 Aug 2022 16:59:43 +0000
Received: by outflank-mailman (input) for mailman id 384902;
 Thu, 11 Aug 2022 16:59:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNZ-0003s9-9W
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e78b31c-1995-11ed-924f-1f966e50362f;
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
X-Inumbo-ID: 9e78b31c-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nc4WbeeXR+sXTmS5lu4Ec75pp9DLw9YmC4v+YNyuXWw=;
  b=FrrnwbbPuRPhqwCM1rL3FadEM/TQXnIur8nzup7OyVtVkxX12Pl6GbYt
   AxBUKFoyK5AxmT5nexs/j2RmPe9tf2P97VtMIyh6H1gRaMkVPjDIjYcQr
   5gapQ32j9SqGeaFVS3SymVZG8kCXG99HMP6Adv1gzsaxMVgi2+H3RBJ7B
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77893975
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1DEgOawSvJjofWBdcQ16t+dbxirEfRIJ4+MujC+fZmUNrF6WrkUCz
 DceDW/VOquKZGv8et91aY3k9RtUuZLdyNQxHlFo/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Eo25K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1OPQYkJp8n3Np9DF9o3
 KccOT8mVA660rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzJZQFPPVEGToozhu6yilH0ciFCqULTrq0yi4TW5FMugOm2YYWIEjCMbdRkrnqxj
 07KxG7wQQ9AEeyZmDiEzn3504cjmgukAdlPRdVU7MVCglKJwXcIIAYLTlb9qv684mahX/pPJ
 kpS/TAhxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmJ2kDmCG5IiykTm/Bw48dmsTagQ+UzJQtrEPv7oPYgLzosdLSfDr1oWkRmipn
 VhmvwBl2exN0JdjO7GTuAme3mny/sWhohsdvF2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAYlRujBCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hGL4VwJvc4DYSHwBUOSX25WI5pC8EQdPY69CqC8giRmO/CdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTPtA+U0yUP0/pBLrFrh17FPe7nphrY8lbcykkk/PPHv3TCL9dIrpx3PSN7xlsP7f8FmMm
 zudXuPToyhivCTFSnG/2eYuwZoidBDX2bieRxRrS9O+
IronPort-HdrOrdr: A9a23:CF9MtaqR2nQ0qgGhWYxytlYaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77893975"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v4 31/32] libs/light: Makefile cleanup
Date: Thu, 11 Aug 2022 17:48:44 +0100
Message-ID: <20220811164845.38083-32-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
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


