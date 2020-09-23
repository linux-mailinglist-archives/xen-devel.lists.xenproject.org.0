Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78E92751CD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 08:46:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKyXF-0001Wc-SR; Wed, 23 Sep 2020 06:45:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eB7U=DA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kKyXE-0001WR-ED
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 06:45:48 +0000
X-Inumbo-ID: 3fb7b2e5-4c87-41cf-ad32-591d896f3405
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3fb7b2e5-4c87-41cf-ad32-591d896f3405;
 Wed, 23 Sep 2020 06:45:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600843545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sv7P9R7t+6Lz9Xw4HtSzYW6xSNj+0ova4G9FBISr/CY=;
 b=f/Ph/ufSeI5JvN5e1GEKiiWK7l/HtEb3y6bhLFAZ6tl6zSERQTomGwgsTZmNgzUQj0J0gv
 oi4C6cMVe4ccIWPqiuyddA/HRj9ktVm3FRn/LXOTrmubd6ApNK15FOJV+6OSidhW5udMnw
 wq2RjPn/pGKvD0T0p7MQsubLBVGHJ7w=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B2A1AE71;
 Wed, 23 Sep 2020 06:46:22 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] tools/init-xenstore-domain: add logging
Date: Wed, 23 Sep 2020 08:45:39 +0200
Message-Id: <20200923064541.19546-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200923064541.19546-1-jgross@suse.com>
References: <20200923064541.19546-1-jgross@suse.com>
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

Add a possibility to do logging in init-xenstore-domain: use -v[...]
for selecting the log-level as in xl, log to stderr.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/helpers/init-xenstore-domain.c | 51 ++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 5bdb48dc80..22c4be6a3f 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -10,6 +10,7 @@
 #include <xenctrl.h>
 #include <xenctrl_dom.h>
 #include <xenstore.h>
+#include <xentoollog.h>
 #include <xen/sys/xenbus_dev.h>
 #include <xen-xsm/flask/flask.h>
 #include <xen/io/xenbus.h>
@@ -36,6 +37,7 @@ static struct option options[] = {
     { "param", 1, NULL, 'p' },
     { "name", 1, NULL, 'n' },
     { "maxmem", 1, NULL, 'M' },
+    { "verbose", 0, NULL, 'v' },
     { NULL, 0, NULL, 0 }
 };
 
@@ -57,7 +59,8 @@ static void usage(void)
 "  --maxmem <max size>        maximum memory size in the format:\n"
 "                             <MB val>|<a>/<b>|<MB val>:<a>/<b>\n"
 "                             (an absolute value in MB, a fraction a/b of\n"
-"                             the host memory, or the maximum of both)\n");
+"                             the host memory, or the maximum of both)\n"
+"  -v[v[v]]                   verbosity of domain building\n");
 }
 
 static int build(xc_interface *xch)
@@ -349,8 +352,10 @@ int main(int argc, char** argv)
     char buf[16], be_path[64], fe_path[64];
     int rv, fd;
     char *maxmem_str = NULL;
+    xentoollog_level minmsglevel = XTL_PROGRESS;
+    xentoollog_logger *logger = NULL;
 
-    while ( (opt = getopt_long(argc, argv, "", options, NULL)) != -1 )
+    while ( (opt = getopt_long(argc, argv, "v", options, NULL)) != -1 )
     {
         switch ( opt )
         {
@@ -375,6 +380,10 @@ int main(int argc, char** argv)
         case 'M':
             maxmem_str = optarg;
             break;
+        case 'v':
+            if ( minmsglevel )
+                minmsglevel--;
+            break;
         default:
             usage();
             return 2;
@@ -387,11 +396,15 @@ int main(int argc, char** argv)
         return 2;
     }
 
-    xch = xc_interface_open(NULL, NULL, 0);
+    logger = (xentoollog_logger *)xtl_createlogger_stdiostream(stderr,
+                                                               minmsglevel, 0);
+
+    xch = xc_interface_open(logger, logger, 0);
     if ( !xch )
     {
         fprintf(stderr, "xc_interface_open() failed\n");
-        return 1;
+        rv = 1;
+        goto out;
     }
 
     if ( maxmem_str )
@@ -400,7 +413,8 @@ int main(int argc, char** argv)
         if ( maxmem < 0 )
         {
             xc_interface_close(xch);
-            return 1;
+            rv = 1;
+            goto out;
         }
     }
 
@@ -414,17 +428,24 @@ int main(int argc, char** argv)
     xc_interface_close(xch);
 
     if ( rv )
-        return 1;
+    {
+        rv = 1;
+        goto out;
+    }
 
     rv = gen_stub_json_config(domid, NULL);
     if ( rv )
-        return 3;
+    {
+        rv = 3;
+        goto out;
+    }
 
     xsh = xs_open(0);
     if ( !xsh )
     {
         fprintf(stderr, "xs_open() failed.\n");
-        return 3;
+        rv = 3;
+        goto out;
     }
     snprintf(buf, 16, "%d", domid);
     do_xs_write(xsh, "/tool/xenstored/domid", buf);
@@ -460,7 +481,8 @@ int main(int argc, char** argv)
     if ( fd < 0 )
     {
         fprintf(stderr, "Creating " XEN_RUN_DIR "/xenstored.pid failed\n");
-        return 3;
+        rv = 3;
+        goto out;
     }
     rv = snprintf(buf, 16, "domid:%d\n", domid);
     rv = write(fd, buf, rv);
@@ -469,10 +491,17 @@ int main(int argc, char** argv)
     {
         fprintf(stderr,
                 "Writing domid to " XEN_RUN_DIR "/xenstored.pid failed\n");
-        return 3;
+        rv = 3;
+        goto out;
     }
 
-    return 0;
+    rv = 0;
+
+ out:
+    if ( logger )
+        xtl_logger_destroy(logger);
+
+    return rv;
 }
 
 /*
-- 
2.26.2


