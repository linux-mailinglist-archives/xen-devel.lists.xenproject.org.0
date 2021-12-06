Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DAF46A260
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239514.415361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTX-0001Tx-42; Mon, 06 Dec 2021 17:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239514.415361; Mon, 06 Dec 2021 17:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTW-0001Q6-TV; Mon, 06 Dec 2021 17:08:26 +0000
Received: by outflank-mailman (input) for mailman id 239514;
 Mon, 06 Dec 2021 17:08:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPg-0005ta-7S
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90c3a7a2-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:04:27 +0100 (CET)
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
X-Inumbo-ID: 90c3a7a2-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1nH3DERE1JlMh8VwtbIndoxT3Z56m8Z/3wBuefLC+Yw=;
  b=XV9s3SIefE0kF/n7YJUfCBGvChX1OviAHpE8ALt/VPcPgL6LYtR8pqoP
   8rJGH9m0sCrSZPzOQ0boDl/dr2PJBqcxQ5fBX1obo4ZNNCHXh73bM2xZj
   IEkyYNI0DxdG+bc5W8jZsPs5rpGyz4PzmedFnDh9MOTyZ4E0gux0BuWji
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: aDd2dpyJ7gRfSVbxV4+9/bzhPrf3mPz4foNM8gwZeG9SEPtXKtb3t64tf6/AXampwdzjPdLOoM
 sA7Uexx3oSwZwtLqp5Emnz+oBUSIqPdKLY9hn3X0FkZvVgrwMt3Led8LAnCIx9TRUen14VD3XM
 C3AOgMF+1UMgm++3gfJzPvP7AvZ409pZVDDPbkAeYXN0vSbG3f/v6eeukk0sJ36eJw3ONatVrj
 fA67+69DtiNidWjHJmVvGuB5uD9JBlXwgXTr+Xh12Nq9BcLPuv61rU7M+z0Xz2/6NPaHzIA+Y6
 BYLgJDC5GvOZ14VJakOWh/DJ
X-SBRS: 5.1
X-MesageID: 59766550
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kA42gqKMdy6/d3K4FE+RIJIlxSXFcZb7ZxGr2PjKsXjdYENS1jcPy
 GUcUGiPMv6DZmb1e4oiPIS+o00F6pLUndBmGQBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eg7xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2nsspjk
 +RLk6C2Cj0SL/zsl84FdCJhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gph2Z4QQKuGD
 yYfQWM2cxKHXxpWBmwSN4oSrfqmnWjxLxQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 G3c+H/iKgoHL9HZwj2Amlqtme3njS79QJgVFrCz6rhtmlL77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVVhukoHmCr1gEVsBZCeES5wSEy66S6AGcblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpW7ZGiPrYaSiw+0ehIuPD4iagUcajA8toyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNt1shPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWB2DaD/LF7rlxBHkJPm6gKulmSw28zba45lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIEePcIgKVXdon4+DaJ144wLuBJ2+U3YE
 c3EGftA8F5AUfg3pNZIb7l1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3mGmaZOfAtiBSVqWvjLRzl/K7frzvxOQzp6VZc8ANoJJuRYokiivruSo
 yzmBBYHkAGXaL+uAVziV02PoYjHBf5XxU/X9wR1Vbpx83R8M4up8okFcJ47Iesu+OB5lKYmR
 PgZYcSQRP9IT22fqTgaaJD8qq1kdQiq2l3Sb3b0PmBncs4yXRHN9//lYhDrqHsEAB2ouJZsu
 LanzA7aH8YOHlwwEMbMZfuz5FqtpnxByvlqVk7FL4ALKkXh+YRnMQLrifozL51eIBnP3GLCh
 Q2XHQ0Zta/GpIpsqIvFgqWNroGIFepiHxUFQzmHvOjubSSDpzit245NVuqMbAvxbmKs9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy7IF6wu7X
 kWDpotTNbmTYZ63FVcQIEwub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4YNE/3
 OMsmM8K8Aju2BMlP+GPgj1Q62nRfGcLVL8qt81CDYLm4ubxJoquvXAI5vfK3ayy
IronPort-HdrOrdr: A9a23:bIKx8K3LAnLHUrfS1DC0ewqjBLgkLtp133Aq2lEZdPRUGvb2qy
 nIpoV/6faUskd3ZJhOo7G90cW7LE80lqQFg7X5X43DYOCOggLBR+tfBOPZslnd8kbFmNK1u5
 0NT0EHMqySMWRH
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59766550"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 45/57] libs/guest: rework CFLAGS
Date: Mon, 6 Dec 2021 17:02:28 +0000
Message-ID: <20211206170241.13165-46-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
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
---
 tools/libs/guest/Makefile          | 20 +++++++++-----------
 tools/libs/guest/xg_offline_page.c |  2 +-
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 770b9a7ef1..62b8fead86 100644
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


