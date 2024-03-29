Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81835891772
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 12:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699360.1092205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqA8v-0007wy-UY; Fri, 29 Mar 2024 11:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699360.1092205; Fri, 29 Mar 2024 11:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqA8v-0007mA-N7; Fri, 29 Mar 2024 11:11:29 +0000
Received: by outflank-mailman (input) for mailman id 699360;
 Fri, 29 Mar 2024 11:11:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tVj/=LD=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1rqA8t-0006qp-RW
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 11:11:27 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14bc7654-edbd-11ee-afe3-a90da7624cb6;
 Fri, 29 Mar 2024 12:11:25 +0100 (CET)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 25133800AE;
 Fri, 29 Mar 2024 11:11:23 +0000 (GMT)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id BFBD8202AB; Fri, 29 Mar 2024 11:11:22 +0000 (GMT)
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
X-Inumbo-ID: 14bc7654-edbd-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1711710683;
	bh=FFT0JKZLTG2RafX6HaY0v4ymDYgP25/NOMi/BqeNaFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IeYrDIc9gMTrE93pBdwcmZBGD+FsYwOd1s3dZPRCBY9TdX4FmqQ1uLyXQw9tfYPLf
	 Mm4QmRfG5rb2VefjPyyeP0nEF9NOawu6eeM4KEKcYZAr+tckKTHEKRwqNdpZyAmzgZ
	 TamkqEtwCFNOPPu35aIROD7sN30g6jaVLUeH/GJ0=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v2 5/6] tools/misc: xenwatchdogd enhancements
Date: Fri, 29 Mar 2024 11:10:55 +0000
Message-Id: <20240329111056.6118-6-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240329111056.6118-1-leigh@solinno.co.uk>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

Add enhanced parameter parsing and validation, making use of
getopt_long(). Adds usage() function, ability to run in the foreground,
and the ability to disarm the watchdog timer when exiting.  Now checks
the number of parameters are correct, that timeout is at least two
seconds (to allow a minimum sleep time of one second), and that the
sleep time is at least one and less than the watchdog timeout. After
these changes, the daemon will no longer instantly reboot the domain
if you enter a zero timeout (or non-numeric parameter), and prevent
the daemon consuming 100% of a CPU. Add a copyright message. This is
based on the previous commits which were from Citrix email addresses.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 tools/misc/xenwatchdogd.c | 111 ++++++++++++++++++++++++++++++++++----
 1 file changed, 101 insertions(+), 10 deletions(-)

diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
index 19ec4c5359..b78320f86d 100644
--- a/tools/misc/xenwatchdogd.c
+++ b/tools/misc/xenwatchdogd.c
@@ -1,3 +1,20 @@
+/*
+ * xenwatchdogd.c
+ *
+ * Watchdog based on Xen hypercall watchdog interface
+ *
+ * Copyright 2010-2024 Citrix Ltd and other contributors
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
 
 #include <err.h>
 #include <limits.h>
@@ -10,6 +27,11 @@
 #include <signal.h>
 #include <stdio.h>
 #include <stdbool.h>
+#include <getopt.h>
+
+#define WDOG_MIN_TIMEOUT 2
+#define WDOG_MIN_SLEEP 1
+#define WDOG_EXIT_TIMEOUT 300
 
 static xc_interface *h;
 static bool safeexit = false;
@@ -49,6 +71,26 @@ static void catch_usr1(int sig)
     done = true;
 }
 
+static void __attribute__((noreturn)) usage(int exit_code)
+{
+    FILE *out = exit_code ? stderr : stdout;
+
+    fprintf(out,
+	"Usage: xenwatchdog [OPTION]... <timeout> [<sleep>]\n"
+	"  -h, --help\t\tDisplay this help text and exit.\n"
+	"  -F, --foreground\tRun in foreground.\n"
+	"  -x, --safe-exit\tDisable watchdog on orderly exit.\n"
+	"\t\t\tNote: default is to set a %d second timeout on exit.\n\n"
+	"  timeout\t\tInteger seconds to arm the watchdog each time.\n"
+	"\t\t\tNote: minimum timeout is %d seconds.\n\n"
+	"  sleep\t\t\tInteger seconds to sleep between arming the watchdog.\n"
+	"\t\t\tNote: sleep must be at least %d and less than timeout.\n"
+	"\t\t\tIf not specified then set to half the timeout.\n",
+	WDOG_EXIT_TIMEOUT, WDOG_MIN_TIMEOUT, WDOG_MIN_SLEEP
+	);
+    exit(exit_code);
+}
+
 static int parse_secs(const char *arg, const char *what)
 {
     char *endptr;
@@ -66,21 +108,70 @@ int main(int argc, char **argv)
     int id;
     int t, s;
     int ret;
+    bool daemon = true;
+
+    for ( ;; )
+    {
+	int option_index = 0, c;
+	static const struct option long_options[] =
+	{
+	    { "help", no_argument, NULL, 'h' },
+	    { "foreground", no_argument, NULL, 'F' },
+	    { "safe-exit", no_argument, NULL, 'x' },
+	    { NULL, 0, NULL, 0 },
+	};
+
+	c = getopt_long(argc, argv, "hFxD", long_options, &option_index);
+	if (c == -1)
+	    break;
+
+	switch (c)
+	{
+	case 'h':
+	    usage(EXIT_SUCCESS);
+
+	case 'F':
+	    daemon = false;
+	    break;
+
+	case 'x':
+	    safeexit = true;
+	    break;
+
+	default:
+	    usage(EXIT_FAILURE);
+	}
+    }
 
-    if (argc < 2)
-	errx(EXIT_FAILURE, "usage: %s <timeout> <sleep>", argv[0]);
+    if (argc - optind < 1)
+	errx(EXIT_FAILURE, "timeout must be specified");
 
-    daemonize();
-
-    h = xc_interface_open(NULL, NULL, 0);
-    if (h == NULL)
-	err(EXIT_FAILURE, "xc_interface_open");
+    if (argc - optind > 2)
+	errx(EXIT_FAILURE, "too many arguments");
 
     t = parse_secs(argv[optind], "timeout");
+    if (t < WDOG_MIN_TIMEOUT)
+	errx(EXIT_FAILURE, "Error: timeout must be at least %d seconds",
+			   WDOG_MIN_TIMEOUT);
 
-    s = t / 2;
-    if (argc == 3)
+    ++optind;
+    if (optind < argc) {
 	s = parse_secs(argv[optind], "sleep");
+	if (s < WDOG_MIN_SLEEP)
+	    errx(EXIT_FAILURE, "Error: sleep must be no less than %d",
+			       WDOG_MIN_SLEEP);
+	if (s >= t)
+	    errx(EXIT_FAILURE, "Error: sleep must be less than timeout");
+    }
+    else
+	s = t / 2;
+
+    if (daemon)
+	daemonize();
+
+    h = xc_interface_open(NULL, NULL, 0);
+    if (h == NULL)
+	err(EXIT_FAILURE, "xc_interface_open");
 
     if (signal(SIGHUP, &catch_exit) == SIG_ERR)
 	err(EXIT_FAILURE, "signal");
@@ -105,6 +196,6 @@ int main(int argc, char **argv)
     }
 
     // Zero seconds timeout will disarm the watchdog timer
-    xc_watchdog(h, id, safeexit ? 0 : 300);
+    xc_watchdog(h, id, safeexit ? 0 : WDOG_EXIT_TIMEOUT);
     return 0;
 }
-- 
2.39.2


