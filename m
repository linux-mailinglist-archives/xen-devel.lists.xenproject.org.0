Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759D24C4888
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279288.477008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKt-000286-8Y; Fri, 25 Feb 2022 15:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279288.477008; Fri, 25 Feb 2022 15:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKs-0001u7-Tu; Fri, 25 Feb 2022 15:16:46 +0000
Received: by outflank-mailman (input) for mailman id 279288;
 Fri, 25 Feb 2022 15:16:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIK-0006fy-6j
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93144fa5-964d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:14:06 +0100 (CET)
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
X-Inumbo-ID: 93144fa5-964d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qfHKg9nbI8bb67OsGXzXE6dg5Icrubx3wFHR9cPr4Ug=;
  b=JOM1eAyBzQhkTQTHJ7qH5GJYVBuC0ggkJcoMoFIxp5gD0bpbmUF26rcb
   NspPOkmjG/b5LY459efDRhRnW9/ev6Q4ssBIYAbhOiZfOoqI0Gksi2WW7
   nCT6NWZe0CqKm4js2BuUDx0fITkMRC/vWdi8MRI8eN+eLqglxiuBecUKq
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64433057
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RvLwoKth63cf0m/xIS7FaE0WEufnVCxeMUV32f8akzHdYApBsoF/q
 tZmKWuAbvuKNjCgeYwnaYqyoB9TvpDWz4ViGwtspH00RXtE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1nX5
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi81D4HepvYdcCVXLCRnHJ8BoZ39LnWg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWQzME+bO0AQUrsRIJxks8ikqWPbTwR370CVp4E9/HHP4iUkhdABN/KKI4fXFK25hH2wu
 Wbu72n/RBYAO7S3yzWf9Wm3rvTShi69U4UXfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwB285rjq8Qa6Omc7SydgWpt/lvU5SCN/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmtm
 2jikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsacowGWxFADpU
 J04dy62trFm4XalznHlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYJGC1O
 ROO4VsJvPe/2UdGi4ctMupd7OxwkMDd+SnNDKiIPrKinLArHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZIdQFadSVgXMuuwyGVH8baSjdb9KgaI6e56dscl0ZNxcy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:/ZdQs6juOLFlGwpM6jE7g79l13BQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64433057"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 19/29] libs/guest: rework CFLAGS
Date: Fri, 25 Feb 2022 15:13:11 +0000
Message-ID: <20220225151321.44126-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove '-Werror -Wmissing-progress -I./include $(CFLAGS_xeninclude)',
those flags are already added via "libs.mk".

Flag "-I." isn't needed, we just need to fix the #include of
"xg_core.h" as this header isn't expected to be installed.

Make use of "-iquote" instead of '-I' for double-quote included
headers.

Also, regroup the CFLAGS into the same place in the makefile.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---

Notes:
    v2:
    - reviewed

 tools/libs/guest/Makefile          | 20 +++++++++-----------
 tools/libs/guest/xg_offline_page.c |  2 +-
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 7707d4300f..4f2373101f 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -28,18 +28,13 @@ OBJS-y       += xg_core.o
 OBJS-$(CONFIG_X86) += xg_core_x86.o
 OBJS-$(CONFIG_ARM) += xg_core_arm.o
 
-CFLAGS += -I$(XEN_libxenctrl)
-
 vpath %.c ../../../xen/common/libelf
-CFLAGS += -I../../../xen/common/libelf
 
 LIBELF_OBJS += libelf-tools.o libelf-loader.o
 LIBELF_OBJS += libelf-dominfo.o
 
 OBJS-y += $(LIBELF_OBJS)
 
-$(LIBELF_OBJS) $(LIBELF_OBJS:.o=.opic): CFLAGS += -Wno-pointer-sign
-
 ifeq ($(CONFIG_X86),y) # Add libx86 to the build
 vpath %.c ../../../xen/lib/x86
 
@@ -70,10 +65,12 @@ OBJS-y                 += xg_dom_decompress_unsafe_xz.o
 OBJS-y                 += xg_dom_decompress_unsafe_zstd.o
 endif
 
-CFLAGS   += -Werror -Wmissing-prototypes
-CFLAGS   += -I. -I./include $(CFLAGS_xeninclude)
-CFLAGS   += -D__XEN_TOOLS__
-CFLAGS   += -include $(XEN_ROOT)/tools/config.h
+CFLAGS += -D__XEN_TOOLS__
+CFLAGS += -include $(XEN_ROOT)/tools/config.h
+CFLAGS += -iquote ../../../xen/common/libelf
+
+# To be able to include xc_private.h
+CFLAGS += -iquote $(XEN_libxenctrl)
 
 # Needed for posix_fadvise64() in xc_linux.c
 CFLAGS-$(CONFIG_Linux) += -D_GNU_SOURCE
@@ -92,8 +89,9 @@ ZLIB_CFLAGS :=
 ZLIB_LIBS :=
 endif
 
-xg_dom_bzimageloader.o: CFLAGS += $(ZLIB_CFLAGS)
-xg_dom_bzimageloader.opic: CFLAGS += $(ZLIB_CFLAGS)
+xg_dom_bzimageloader.o xg_dom_bzimageloader.opic: CFLAGS += $(ZLIB_CFLAGS)
+
+$(LIBELF_OBJS) $(LIBELF_OBJS:.o=.opic): CFLAGS += -Wno-pointer-sign
 
 LIBHEADER := xenguest.h
 
diff --git a/tools/libs/guest/xg_offline_page.c b/tools/libs/guest/xg_offline_page.c
index cfe0e2d537..c594fdba41 100644
--- a/tools/libs/guest/xg_offline_page.c
+++ b/tools/libs/guest/xg_offline_page.c
@@ -25,7 +25,7 @@
 #include <stdlib.h>
 #include <unistd.h>
 #include <sys/time.h>
-#include <xg_core.h>
+#include "xg_core.h"
 
 #include "xc_private.h"
 #include "xg_private.h"
-- 
Anthony PERARD


