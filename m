Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85832304C95
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 23:49:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75612.136196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X96-00023J-V4; Tue, 26 Jan 2021 22:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75612.136196; Tue, 26 Jan 2021 22:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X96-00022Y-Ru; Tue, 26 Jan 2021 22:49:12 +0000
Received: by outflank-mailman (input) for mailman id 75612;
 Tue, 26 Jan 2021 22:49:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HxG=G5=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l4X94-0001QY-O7
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 22:49:10 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55c521b9-b162-4e33-934a-2165134c0767;
 Tue, 26 Jan 2021 22:48:37 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10QMmY3x025865;
 Tue, 26 Jan 2021 23:48:34 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10QMmXCJ026514;
 Tue, 26 Jan 2021 23:48:33 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id D9A19AA8C1; Tue, 26 Jan 2021 23:48:33 +0100 (MET)
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
X-Inumbo-ID: 55c521b9-b162-4e33-934a-2165134c0767
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] libs/light: make it build without setresuid()
Date: Tue, 26 Jan 2021 23:47:57 +0100
Message-Id: <20210126224800.1246-11-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126224800.1246-1-bouyer@netbsd.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 26 Jan 2021 23:48:34 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

NetBSD doesn't have setresuid(). introcuce libxl__setresuid(),
which on NetBSD assert() that it's never called (it should not be called when
dm restriction is off, and NetBSD doesn't support dm restriction at
this time).
On linux and FreeBSD it just calls setresuid().

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/libs/light/Makefile          |  4 ++--
 tools/libs/light/libxl_dm.c        |  2 +-
 tools/libs/light/libxl_internal.h  |  3 +++
 tools/libs/light/libxl_netbsd.c    |  5 +++++
 tools/libs/light/libxl_setresuid.c | 23 +++++++++++++++++++++++
 5 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 tools/libs/light/libxl_setresuid.c

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 68f6fa315f..d62ca6e477 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -64,8 +64,8 @@ SRCS-$(CONFIG_ARM) += libxl_arm_no_acpi.c
 endif
 
 SRCS-OS-$(CONFIG_NetBSD) = libxl_netbsd.c
-SRCS-OS-$(CONFIG_Linux) = libxl_linux.c
-SRCS-OS-$(CONFIG_FreeBSD) = libxl_freebsd.c
+SRCS-OS-$(CONFIG_Linux) = libxl_linux.c libxl_setresuid.c
+SRCS-OS-$(CONFIG_FreeBSD) = libxl_freebsd.c libxl_setresuid.c
 ifeq ($(SRCS-OS-y),)
 $(error Your Operating System is not supported by libxenlight, \
 please check libxl_linux.c and libxl_netbsd.c to see how to get it ported)
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 13f79ec471..291dee9b3f 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -3655,7 +3655,7 @@ static int kill_device_model_uid_child(libxl__destroy_devicemodel_state *ddms,
 
     LOGD(DEBUG, domid, "DM reaper: calling setresuid(%d, %d, 0)",
          reaper_uid, dm_kill_uid);
-    r = setresuid(reaper_uid, dm_kill_uid, 0);
+    r = libxl__setresuid(reaper_uid, dm_kill_uid, 0);
     if (r) {
         LOGED(ERROR, domid, "setresuid to (%d, %d, 0)",
               reaper_uid, dm_kill_uid);
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 6c8b7d71a9..028bc013d9 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4845,6 +4845,9 @@ _hidden int libxl__domain_pvcontrol(libxl__egc *egc,
 /* Check whether a domid is recent */
 int libxl__is_domid_recent(libxl__gc *gc, uint32_t domid, bool *recent);
 
+/* os-specific implementation of setresuid() */
+int libxl__setresuid(uid_t ruid, uid_t euid, uid_t suid);
+
 #endif
 
 /*
diff --git a/tools/libs/light/libxl_netbsd.c b/tools/libs/light/libxl_netbsd.c
index 6ad4ed34c2..67caafab9e 100644
--- a/tools/libs/light/libxl_netbsd.c
+++ b/tools/libs/light/libxl_netbsd.c
@@ -124,3 +124,8 @@ int libxl__local_dm_preexec_restrict(libxl__gc *gc)
 {
     return 0;
 }
+
+int libxl__setresuid(uid_t ruid, uid_t euid, uid_t suid)
+{
+    assert(!"setresuid is not available on NetBSD, and dm restrction is not supported, so this code path should not have been reached");
+}
diff --git a/tools/libs/light/libxl_setresuid.c b/tools/libs/light/libxl_setresuid.c
new file mode 100644
index 0000000000..ac5cb5db53
--- /dev/null
+++ b/tools/libs/light/libxl_setresuid.c
@@ -0,0 +1,23 @@
+/*
+ * Copyright (C) 2021
+ * Author Manuel Bouyer <bouyer@netbsd.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+ 
+#include "libxl_osdeps.h" /* must come before any other headers */
+
+#include "libxl_internal.h"
+
+int libxl__setresuid(uid_t ruid, uid_t euid, uid_t suid)
+{
+    setresuid(ruid, euid, suid);
+}
-- 
2.29.2


