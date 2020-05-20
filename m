Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12EE1DB9DD
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 18:40:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbRlA-0003tt-S1; Wed, 20 May 2020 16:40:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X9kX=7C=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jbRl9-0003to-J5
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 16:39:59 +0000
X-Inumbo-ID: 89ff5119-9ab8-11ea-aa4a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89ff5119-9ab8-11ea-aa4a-12813bfff9fa;
 Wed, 20 May 2020 16:39:57 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vic9C3J8syvj01Av36Yw7bN1hPC785ufRTbsmxUCFdUpQp/Lx1JyLyuiUSd4szXY4rOrWTtJ7E
 cnR9LsQv08y7meAPD+9gcM4Sx55Cee40gQZdnjkC8xyiJjbiCacP7iqtHkPYtGQP2vOcvDfYhk
 hlG9yRGH8NVeLvQgLna+c2SaueOJ1PUE9WQ76d3z80Eo5zU+MAlTcc5yowBpc8LHQ88xwIKKri
 MUauDF9t+sad6SJkB2bjqS0SvBZbwLO8YEzB4HUR2R0pOr8HP9y1tVZNY18qBAfS62bdfq8Rw5
 vVE=
X-SBRS: 2.7
X-MesageID: 18273329
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18273329"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH] tools/xenstore: mark variable in header as extern
Date: Wed, 20 May 2020 17:39:42 +0100
Message-ID: <20200520163942.131919-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This patch fix "multiple definition of `xprintf'" (or xgt_handle)
build error with GCC 10.1.0.

These are the error reported:
    gcc xs_tdb_dump.o utils.o tdb.o talloc.o      -o xs_tdb_dump
    /usr/bin/ld: utils.o:./utils.h:27: multiple definition of `xprintf'; xs_tdb_dump.o:./utils.h:27: first defined here
    [...]
    gcc xenstored_core.o xenstored_watch.o xenstored_domain.o xenstored_transaction.o xenstored_control.o xs_lib.o talloc.o utils.o tdb.o hashtable.o xenstored_posix.o      -lsystemd   -Wl,-rpath-link=... ../libxc/libxenctrl.so -lrt  -o xenstored
    /usr/bin/ld: xenstored_watch.o:./xenstored_core.h:207: multiple definition of `xgt_handle'; xenstored_core.o:./xenstored_core.h:207: first defined here
    /usr/bin/ld: xenstored_domain.o:./xenstored_core.h:207: multiple definition of `xgt_handle'; xenstored_core.o:./xenstored_core.h:207: first defined here
    /usr/bin/ld: xenstored_transaction.o:./xenstored_core.h:207: multiple definition of `xgt_handle'; xenstored_core.o:./xenstored_core.h:207: first defined here
    /usr/bin/ld: xenstored_control.o:./xenstored_core.h:207: multiple definition of `xgt_handle'; xenstored_core.o:./xenstored_core.h:207: first defined here
    /usr/bin/ld: xenstored_posix.o:./xenstored_core.h:207: multiple definition of `xgt_handle'; xenstored_core.o:./xenstored_core.h:207: first defined here

A difference that I noticed with earlier version of the build chain is
that before, I had:
    $ nm xs_tdb_dump.o | grep xprintf
    0000000000000008 C xprintf
And now, it's:
    0000000000000000 B xprintf
With the patch apply, the symbol isn't in xs_tdb_dump.o anymore.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/xenstore/utils.h          | 2 +-
 tools/xenstore/xenstored_core.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/xenstore/utils.h b/tools/xenstore/utils.h
index 522c3594a2ba..6a1b5de9bdc1 100644
--- a/tools/xenstore/utils.h
+++ b/tools/xenstore/utils.h
@@ -24,7 +24,7 @@ static inline bool strends(const char *a, const char *b)
 void barf(const char *fmt, ...) __attribute__((noreturn));
 void barf_perror(const char *fmt, ...) __attribute__((noreturn));
 
-void (*xprintf)(const char *fmt, ...);
+extern void (*xprintf)(const char *fmt, ...);
 
 #define eprintf(_fmt, _args...) xprintf("[ERR] %s" _fmt, __FUNCTION__, ##_args)
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 56a279cfbb47..c4c32bc88f0c 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -204,7 +204,7 @@ void finish_daemonize(void);
 /* Open a pipe for signal handling */
 void init_pipe(int reopen_log_pipe[2]);
 
-xengnttab_handle **xgt_handle;
+extern xengnttab_handle **xgt_handle;
 
 int remember_string(struct hashtable *hash, const char *str);
 
-- 
Anthony PERARD


