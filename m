Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9D124EC99
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:46:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9maS-0008O4-T0; Sun, 23 Aug 2020 09:46:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQe-0004sy-HB
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:44 +0000
X-Inumbo-ID: 7b7fd969-8cc3-4c62-98de-b1967d13a608
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b7fd969-8cc3-4c62-98de-b1967d13a608;
 Sun, 23 Aug 2020 09:35:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7E3EB7CE;
 Sun, 23 Aug 2020 09:35:57 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 32/38] tools/libxl: don't include libxl_osdeps.h from
 libxlutil sources
Date: Sun, 23 Aug 2020 11:35:13 +0200
Message-Id: <20200823093519.18386-33-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
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

There is no need for the sources of libxlutil to include libxl_osdeps.h
as the only dependency is the leading

#define _GNU_SOURCE

in libxl_osdeps.h. So replace including libxl_osdeps.h by the needed
define.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libxl/libxlu_cfg.c    |  3 +--
 tools/libxl/libxlu_cfg_i.h  |  1 -
 tools/libxl/libxlu_disk.c   |  1 -
 tools/libxl/libxlu_disk_l.c | 14 +++++++-------
 tools/libxl/libxlu_disk_l.h |  8 ++++----
 tools/libxl/libxlu_disk_l.l |  2 +-
 tools/libxl/libxlu_pci.c    |  3 ++-
 tools/libxl/libxlu_vif.c    |  3 ++-
 8 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/tools/libxl/libxlu_cfg.c b/tools/libxl/libxlu_cfg.c
index f9e8aa2f3a..874f5abfb9 100644
--- a/tools/libxl/libxlu_cfg.c
+++ b/tools/libxl/libxlu_cfg.c
@@ -15,8 +15,7 @@
  * GNU Lesser General Public License for more details.
  */
 
-
-#include "libxl_osdeps.h" /* must come before any other headers */
+#define _GNU_SOURCE
 
 #include <limits.h>
 
diff --git a/tools/libxl/libxlu_cfg_i.h b/tools/libxl/libxlu_cfg_i.h
index 87b19df311..4217f5b28d 100644
--- a/tools/libxl/libxlu_cfg_i.h
+++ b/tools/libxl/libxlu_cfg_i.h
@@ -18,7 +18,6 @@
 #ifndef LIBXLU_CFG_I_H
 #define LIBXLU_CFG_I_H
 
-#include "libxl_osdeps.h" /* must come before any other headers */
 #include "libxlu_internal.h"
 #include "libxlu_cfg_y.h"
 
diff --git a/tools/libxl/libxlu_disk.c b/tools/libxl/libxlu_disk.c
index 18fe386dbe..1de16a6a06 100644
--- a/tools/libxl/libxlu_disk.c
+++ b/tools/libxl/libxlu_disk.c
@@ -1,4 +1,3 @@
-#include "libxl_osdeps.h" /* must come before any other headers */
 #include "libxlu_internal.h"
 #include "libxlu_disk_l.h"
 #include "libxlu_disk_i.h"
diff --git a/tools/libxl/libxlu_disk_l.c b/tools/libxl/libxlu_disk_l.c
index 05f7ac74a0..32d4b74b58 100644
--- a/tools/libxl/libxlu_disk_l.c
+++ b/tools/libxl/libxlu_disk_l.c
@@ -1,7 +1,7 @@
-#line 2 "libxlu_disk_l.c"
-#include "libxl_osdeps.h" /* must come before any other headers */
+#line 1 "libxlu_disk_l.c"
+#define _GNU_SOURCE
 
-#line 5 "libxlu_disk_l.c"
+#line 4 "libxlu_disk_l.c"
 
 #define  YY_INT_ALIGNED short int
 
@@ -1199,9 +1199,9 @@ static int vdev_and_devtype(DiskParseContext *dpc, char *str) {
 #undef DPC /* needs to be defined differently the actual lexer */
 #define DPC ((DiskParseContext*)yyextra)
 
-#line 1203 "libxlu_disk_l.c"
+#line 1202 "libxlu_disk_l.c"
 
-#line 1205 "libxlu_disk_l.c"
+#line 1204 "libxlu_disk_l.c"
 
 #define INITIAL 0
 #define LEXERR 1
@@ -1483,7 +1483,7 @@ YY_DECL
 #line 180 "libxlu_disk_l.l"
  /*----- the scanner rules which do the parsing -----*/
 
-#line 1487 "libxlu_disk_l.c"
+#line 1486 "libxlu_disk_l.c"
 
 	while ( /*CONSTCOND*/1 )		/* loops until end-of-file is reached */
 		{
@@ -1836,7 +1836,7 @@ YY_RULE_SETUP
 #line 291 "libxlu_disk_l.l"
 YY_FATAL_ERROR( "flex scanner jammed" );
 	YY_BREAK
-#line 1840 "libxlu_disk_l.c"
+#line 1839 "libxlu_disk_l.c"
 			case YY_STATE_EOF(INITIAL):
 			case YY_STATE_EOF(LEXERR):
 				yyterminate();
diff --git a/tools/libxl/libxlu_disk_l.h b/tools/libxl/libxlu_disk_l.h
index 54f4662d7a..6abeecf279 100644
--- a/tools/libxl/libxlu_disk_l.h
+++ b/tools/libxl/libxlu_disk_l.h
@@ -2,10 +2,10 @@
 #define xlu__disk_yyHEADER_H 1
 #define xlu__disk_yyIN_HEADER 1
 
-#line 6 "libxlu_disk_l.h"
-#include "libxl_osdeps.h" /* must come before any other headers */
+#line 5 "libxlu_disk_l.h"
+#define _GNU_SOURCE
 
-#line 9 "libxlu_disk_l.h"
+#line 8 "libxlu_disk_l.h"
 
 #define  YY_INT_ALIGNED short int
 
@@ -696,6 +696,6 @@ extern int yylex (yyscan_t yyscanner);
 
 #line 291 "libxlu_disk_l.l"
 
-#line 700 "libxlu_disk_l.h"
+#line 699 "libxlu_disk_l.h"
 #undef xlu__disk_yyIN_HEADER
 #endif /* xlu__disk_yyHEADER_H */
diff --git a/tools/libxl/libxlu_disk_l.l b/tools/libxl/libxlu_disk_l.l
index 7a46f4a30c..3bd639aab0 100644
--- a/tools/libxl/libxlu_disk_l.l
+++ b/tools/libxl/libxlu_disk_l.l
@@ -28,7 +28,7 @@
  */
 
 %top{
-#include "libxl_osdeps.h" /* must come before any other headers */
+#define _GNU_SOURCE
 }
 
 %{
diff --git a/tools/libxl/libxlu_pci.c b/tools/libxl/libxlu_pci.c
index 7947687661..bbce719e91 100644
--- a/tools/libxl/libxlu_pci.c
+++ b/tools/libxl/libxlu_pci.c
@@ -1,4 +1,5 @@
-#include "libxl_osdeps.h" /* must come before any other headers */
+#define _GNU_SOURCE
+
 #include "libxlu_internal.h"
 #include "libxlu_disk_l.h"
 #include "libxlu_disk_i.h"
diff --git a/tools/libxl/libxlu_vif.c b/tools/libxl/libxlu_vif.c
index 0665e624dc..ccf0cbdf57 100644
--- a/tools/libxl/libxlu_vif.c
+++ b/tools/libxl/libxlu_vif.c
@@ -1,4 +1,5 @@
-#include "libxl_osdeps.h" /* must come before any other headers */
+#define _GNU_SOURCE
+
 #include "libxlu_internal.h"
 
 static const char *vif_bytes_per_sec_re = "^[0-9]+[GMK]?[Bb]/s$";
-- 
2.26.2


