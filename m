Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00BD2F386A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65878.116831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGK-0005Cm-MG; Tue, 12 Jan 2021 18:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65878.116831; Tue, 12 Jan 2021 18:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGK-0005AP-2f; Tue, 12 Jan 2021 18:19:24 +0000
Received: by outflank-mailman (input) for mailman id 65878;
 Tue, 12 Jan 2021 18:19:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOCP-0003Yo-1E
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:15:21 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44fc2fa7-d9b4-482b-a3ee-bfb169d0e383;
 Tue, 12 Jan 2021 18:13:56 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIDq6P013903;
 Tue, 12 Jan 2021 19:13:52 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDkcV023498;
 Tue, 12 Jan 2021 19:13:46 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 8D3087218; Tue, 12 Jan 2021 19:13:46 +0100 (MET)
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
X-Inumbo-ID: 44fc2fa7-d9b4-482b-a3ee-bfb169d0e383
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] libs/light: make it build without setresuid()
Date: Tue, 12 Jan 2021 19:12:36 +0100
Message-Id: <20210112181242.1570-16-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:52 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

NetBSD doesn't have setresuid(). Add a configure check for it,
and use plain setuid() if !HAVE_SETRESUID

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/configure             | 13 +++++++++++++
 tools/configure.ac          |  3 +++
 tools/libs/light/libxl_dm.c | 10 ++++++++++
 3 files changed, 26 insertions(+)

diff --git a/tools/configure b/tools/configure
index 131112c41e..5e3793709e 100755
--- a/tools/configure
+++ b/tools/configure
@@ -9299,6 +9299,19 @@ _ACEOF
 
 esac
 
+# NetBSD doesnt have setresuid (yet)
+for ac_func in setresuid
+do :
+  ac_fn_c_check_func "$LINENO" "setresuid" "ac_cv_func_setresuid"
+if test "x$ac_cv_func_setresuid" = xyes; then :
+  cat >>confdefs.h <<_ACEOF
+#define HAVE_SETRESUID 1
+_ACEOF
+
+fi
+done
+
+
 # Checks for header files.
 for ac_header in yajl/yajl_version.h sys/eventfd.h valgrind/memcheck.h utmp.h
 do :
diff --git a/tools/configure.ac b/tools/configure.ac
index ee8ba5ff24..04f78bf21d 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -457,6 +457,9 @@ AC_CHECK_DECLS([fdt_first_subnode, fdt_next_subnode],,,[#include <libfdt.h>])
 AC_CHECK_DECLS([fdt_property_u32],,,[#include <libfdt.h>])
 esac
 
+# NetBSD doesnt have setresuid (yet)
+AC_CHECK_FUNCS([setresuid])
+
 # Checks for header files.
 AC_CHECK_HEADERS([yajl/yajl_version.h sys/eventfd.h valgrind/memcheck.h utmp.h])
 
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 8866c3f5ad..7651429b9f 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -3653,6 +3653,7 @@ static int kill_device_model_uid_child(libxl__destroy_devicemodel_state *ddms,
     assert(reaper_uid);
     assert(dm_kill_uid);
 
+#if HAVE_SETRESUID
     LOGD(DEBUG, domid, "DM reaper: calling setresuid(%d, %d, 0)",
          reaper_uid, dm_kill_uid);
     r = setresuid(reaper_uid, dm_kill_uid, 0);
@@ -3662,6 +3663,15 @@ static int kill_device_model_uid_child(libxl__destroy_devicemodel_state *ddms,
         rc = rc ?: ERROR_FAIL;
         goto out;
     }
+#else /* HAVE_SETRESUID */
+    LOGD(DEBUG, domid, "DM reaper: calling setuid(%d)", dm_kill_uid);
+    r = setuid(dm_kill_uid);
+    if (r) {
+        LOGED(ERROR, domid, "setuid to %d", dm_kill_uid);
+        rc = rc ?: ERROR_FAIL;
+        goto out;
+    }
+#endif /* HAVE_SETRESUID */
 
     /*
      * And kill everyone but me.
-- 
2.29.2


