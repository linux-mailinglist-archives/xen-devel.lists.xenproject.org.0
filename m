Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79598891770
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 12:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699355.1092160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqA8t-0006xm-5p; Fri, 29 Mar 2024 11:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699355.1092160; Fri, 29 Mar 2024 11:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqA8t-0006sl-1y; Fri, 29 Mar 2024 11:11:27 +0000
Received: by outflank-mailman (input) for mailman id 699355;
 Fri, 29 Mar 2024 11:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tVj/=LD=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1rqA8r-0006qp-RR
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 11:11:25 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13de8cef-edbd-11ee-afe3-a90da7624cb6;
 Fri, 29 Mar 2024 12:11:23 +0100 (CET)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id EBE878009E;
 Fri, 29 Mar 2024 11:11:22 +0000 (GMT)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id B714F20183; Fri, 29 Mar 2024 11:11:22 +0000 (GMT)
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
X-Inumbo-ID: 13de8cef-edbd-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1711710682;
	bh=4RuAZZ2FiEx1YmWEem8TR0isA44tccZW5bEUQSzrF7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cuKTzJmiwdHU1qAZR56fQjOc62NRLS9VTp6MXkfEJVBv+FZx3j7+KtNy5KBixreyp
	 r3iUm73I97pm+ZL1JJ9+dmEvvURfe3AVe3FYfCYnoue0U8ICQZPfAqhpFYH97rdlYi
	 pytqAYGc398Dqij8FFzGPPmloTZo9IL6Xq8WU+Mg=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v2 1/6] tools/misc: xenwatchdogd: use EXIT_* constants
Date: Fri, 29 Mar 2024 11:10:51 +0000
Message-Id: <20240329111056.6118-2-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240329111056.6118-1-leigh@solinno.co.uk>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

Use EXIT_SUCCESS/EXIT_FAILURE constants instead of magic numbers.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 tools/misc/xenwatchdogd.c | 40 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
index 254117b554..2f7c822d61 100644
--- a/tools/misc/xenwatchdogd.c
+++ b/tools/misc/xenwatchdogd.c
@@ -17,37 +17,37 @@ void daemonize(void)
 {
     switch (fork()) {
     case -1:
-	err(1, "fork");
+	err(EXIT_FAILURE, "fork");
     case 0:
 	break;
     default:
-	exit(0);
+	exit(EXIT_SUCCESS);
     }
     umask(0);
     if (setsid() < 0)
-	err(1, "setsid");
+	err(EXIT_FAILURE, "setsid");
     if (chdir("/") < 0)
-	err(1, "chdir /");
+	err(EXIT_FAILURE, "chdir /");
     if (freopen("/dev/null", "r", stdin) == NULL)
-        err(1, "reopen stdin");
+        err(EXIT_FAILURE, "reopen stdin");
     if(freopen("/dev/null", "w", stdout) == NULL)
-        err(1, "reopen stdout");
+        err(EXIT_FAILURE, "reopen stdout");
     if(freopen("/dev/null", "w", stderr) == NULL)
-        err(1, "reopen stderr");
+        err(EXIT_FAILURE, "reopen stderr");
 }
 
 void catch_exit(int sig)
 {
     if (id)
         xc_watchdog(h, id, 300);
-    exit(0);
+    exit(EXIT_SUCCESS);
 }
 
 void catch_usr1(int sig)
 {
     if (id)
         xc_watchdog(h, id, 0);
-    exit(0);
+    exit(EXIT_SUCCESS);
 }
 
 int main(int argc, char **argv)
@@ -56,44 +56,44 @@ int main(int argc, char **argv)
     int ret;
 
     if (argc < 2)
-	errx(1, "usage: %s <timeout> <sleep>", argv[0]);
+	errx(EXIT_FAILURE, "usage: %s <timeout> <sleep>", argv[0]);
 
     daemonize();
 
     h = xc_interface_open(NULL, NULL, 0);
     if (h == NULL)
-	err(1, "xc_interface_open");
+	err(EXIT_FAILURE, "xc_interface_open");
 
     t = strtoul(argv[1], NULL, 0);
     if (t == ULONG_MAX)
-	err(1, "strtoul");
+	err(EXIT_FAILURE, "strtoul");
 
     s = t / 2;
     if (argc == 3) {
 	s = strtoul(argv[2], NULL, 0);
 	if (s == ULONG_MAX)
-	    err(1, "strtoul");
+	    err(EXIT_FAILURE, "strtoul");
     }
 
     if (signal(SIGHUP, &catch_exit) == SIG_ERR)
-	err(1, "signal");
+	err(EXIT_FAILURE, "signal");
     if (signal(SIGINT, &catch_exit) == SIG_ERR)
-	err(1, "signal");
+	err(EXIT_FAILURE, "signal");
     if (signal(SIGQUIT, &catch_exit) == SIG_ERR)
-	err(1, "signal");
+	err(EXIT_FAILURE, "signal");
     if (signal(SIGTERM, &catch_exit) == SIG_ERR)
-	err(1, "signal");
+	err(EXIT_FAILURE, "signal");
     if (signal(SIGUSR1, &catch_usr1) == SIG_ERR)
-	err(1, "signal");
+	err(EXIT_FAILURE, "signal");
 
     id = xc_watchdog(h, 0, t);
     if (id <= 0)
-        err(1, "xc_watchdog setup");
+        err(EXIT_FAILURE, "xc_watchdog setup");
 
     for (;;) {
         sleep(s);
         ret = xc_watchdog(h, id, t);
         if (ret != 0)
-            err(1, "xc_watchdog");
+            err(EXIT_FAILURE, "xc_watchdog");
     }
 }
-- 
2.39.2


