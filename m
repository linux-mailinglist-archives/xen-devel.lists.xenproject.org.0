Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83902463C2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:50:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bm8-0004QV-Ve; Mon, 17 Aug 2020 09:49:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7bm7-00046Z-BW
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:55 +0000
X-Inumbo-ID: 3aaad613-d3e2-4ead-bebb-35a69a30ab5d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3aaad613-d3e2-4ead-bebb-35a69a30ab5d;
 Mon, 17 Aug 2020 09:49:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 551CAAEF9;
 Mon, 17 Aug 2020 09:49:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH II v2 08/17] tools/misc: don't include xg_save_restore.h from
 xen-mfndump.c
Date: Mon, 17 Aug 2020 11:49:13 +0200
Message-Id: <20200817094922.15768-9-jgross@suse.com>
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

xen-mfndump.c is including the libxc private header xg_save_restore.h.
Avoid that by moving the definition of is_mapped() to xen-mfndump.c
(it is used there only) and by duplicating the definition of
M2P_SIZE() in xen-mfndump.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libxc/xg_save_restore.h | 4 ----
 tools/misc/xen-mfndump.c      | 5 ++++-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libxc/xg_save_restore.h b/tools/libxc/xg_save_restore.h
index 303081df0d..b904296997 100644
--- a/tools/libxc/xg_save_restore.h
+++ b/tools/libxc/xg_save_restore.h
@@ -109,10 +109,6 @@ static inline int get_platform_info(xc_interface *xch, uint32_t dom,
 #define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
 #define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
 
-/* Returns TRUE if the PFN is currently mapped */
-#define is_mapped(pfn_type) (!((pfn_type) & 0x80000000UL))
-
-
 #define GET_FIELD(_p, _f, _w) (((_w) == 8) ? ((_p)->x64._f) : ((_p)->x32._f))
 
 #define SET_FIELD(_p, _f, _v, _w) do {          \
diff --git a/tools/misc/xen-mfndump.c b/tools/misc/xen-mfndump.c
index 858bd0e26b..cb15d08c7e 100644
--- a/tools/misc/xen-mfndump.c
+++ b/tools/misc/xen-mfndump.c
@@ -5,7 +5,10 @@
 #include <unistd.h>
 #include <inttypes.h>
 
-#include "xg_save_restore.h"
+#include <xen-tools/libs.h>
+
+#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), 21)
+#define is_mapped(pfn_type) (!((pfn_type) & 0x80000000UL))
 
 static xc_interface *xch;
 
-- 
2.26.2


