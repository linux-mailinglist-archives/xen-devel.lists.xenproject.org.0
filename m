Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C580B2463C0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:49:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bm4-0004Lf-AC; Mon, 17 Aug 2020 09:49:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7bm2-00046Z-BL
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:50 +0000
X-Inumbo-ID: 99723c6a-fbd4-42c3-862d-3f217b257151
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99723c6a-fbd4-42c3-862d-3f217b257151;
 Mon, 17 Aug 2020 09:49:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9ED6BAEFB;
 Mon, 17 Aug 2020 09:49:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH II v2 10/17] tools/misc: drop all libxc internals from
 xen-mfndump.c
Date: Mon, 17 Aug 2020 11:49:15 +0200
Message-Id: <20200817094922.15768-11-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817094922.15768-1-jgross@suse.com>
References: <20200817094922.15768-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The last libxc internal used by xen-mfndump.c is the ERROR() macro.
Add a simple definition for that macro to xen-mfndump.c and replace
the libxc private header includes by official ones.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/misc/Makefile      |  2 --
 tools/misc/xen-mfndump.c | 13 +++++++++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 2a7f2ec42d..7d37f297a9 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -99,8 +99,6 @@ xen-hptool: xen-hptool.o
 
 xenhypfs.o: CFLAGS += $(CFLAGS_libxenhypfs)
 
-# xen-mfndump incorrectly uses libxc internals
-xen-mfndump.o: CFLAGS += -I$(XEN_ROOT)/tools/libxc $(CFLAGS_libxencall)
 xen-mfndump: xen-mfndump.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(APPEND_LDFLAGS)
 
diff --git a/tools/misc/xen-mfndump.c b/tools/misc/xen-mfndump.c
index 92bc954ce0..62121bd241 100644
--- a/tools/misc/xen-mfndump.c
+++ b/tools/misc/xen-mfndump.c
@@ -1,15 +1,20 @@
-#define XC_WANT_COMPAT_MAP_FOREIGN_API
-#include <xenctrl.h>
-#include <xc_private.h>
-#include <xc_core.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
 #include <unistd.h>
 #include <inttypes.h>
 
+#define XC_WANT_COMPAT_MAP_FOREIGN_API
+#include <xenctrl.h>
+#include <xenguest.h>
+
 #include <xen-tools/libs.h>
 
 #define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), 21)
 #define is_mapped(pfn_type) (!((pfn_type) & 0x80000000UL))
 
+#define ERROR(msg, args...) fprintf(stderr, msg, ## args)
+
 static xc_interface *xch;
 
 int help_func(int argc, char *argv[])
-- 
2.26.2


