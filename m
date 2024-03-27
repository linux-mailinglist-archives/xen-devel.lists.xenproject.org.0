Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC088EDFA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 19:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698687.1090705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpXnS-0005As-3t; Wed, 27 Mar 2024 18:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698687.1090705; Wed, 27 Mar 2024 18:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpXnR-00050c-SD; Wed, 27 Mar 2024 18:14:45 +0000
Received: by outflank-mailman (input) for mailman id 698687;
 Wed, 27 Mar 2024 18:14:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lSYu=LB=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1rpXmv-0004pv-LY
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 18:14:13 +0000
Received: from doppler.solinno.uk
 (8.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.9.a.d.0.6.f.d.1.0.b.8.0.1.0.0.2.ip6.arpa
 [2001:8b0:1df6:da9::18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfeaa987-ec65-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 19:14:12 +0100 (CET)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id B4C7B800AC;
 Wed, 27 Mar 2024 18:14:11 +0000 (GMT)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 8B12E202AA; Wed, 27 Mar 2024 18:14:11 +0000 (GMT)
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
X-Inumbo-ID: cfeaa987-ec65-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1711563251;
	bh=hpLEOTagI61CXps0+cy2rWLbakF8//wcNhtpIOFZpR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nVV3jfw3vsYUmrK7E+spsBFdLLUgaDzBy+GT+8ynXbWE7QimLvAO8PKzckIesdlKb
	 I135XlGL475dZ0gU9XtPg6WrcxEuFMKpdjFYwOtpPat0i52OxGN9g2tlGaMk9kV4+F
	 UJu1R9mvkr+BEWn4WCP6xrYooEFtqLUlqOhGVMKk=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH 5/6] tools/misc: xenwatchdogd enhancements
Date: Wed, 27 Mar 2024 18:13:52 +0000
Message-Id: <20240327181353.10951-6-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240327181353.10951-1-leigh@solinno.co.uk>
References: <55416d60-cae7-4e79-8bde-bc07ee9e3830@suse.com>
 <20240327181353.10951-1-leigh@solinno.co.uk>
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
---
 tools/misc/xenwatchdogd.c | 111 ++++++++++++++++++++++++++++++++++----
 1 file changed, 101 insertions(+), 10 deletions(-)

diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
index 26bfdef3db..77638a4309 100644
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
 
 xc_interface *h;
 bool safeexit = false;
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


