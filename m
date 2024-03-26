Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F166688B9B8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 06:17:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697915.1089166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rozAP-0002EX-9T; Tue, 26 Mar 2024 05:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697915.1089166; Tue, 26 Mar 2024 05:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rozAP-0002D0-6R; Tue, 26 Mar 2024 05:16:09 +0000
Received: by outflank-mailman (input) for mailman id 697915;
 Tue, 26 Mar 2024 05:16:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sWtR=LA=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1rozAO-0002Cu-AQ
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 05:16:08 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f299071f-eb2f-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 06:16:06 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4148c72db39so5059325e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 22:16:06 -0700 (PDT)
Received: from localhost.localdomain (82-64-138-184.subs.proxad.net.
 [82.64.138.184]) by smtp.googlemail.com with ESMTPSA id
 w9-20020a05600c474900b00414896b61e4sm5454883wmo.16.2024.03.25.22.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 22:16:05 -0700 (PDT)
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
X-Inumbo-ID: f299071f-eb2f-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1711430166; x=1712034966; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GczBXsnaLCm9zzJ7Qenf5gqQ5Emssgxzk7laDgeG0r8=;
        b=X4uoSCd9ZifbO1jZZotAvzIHL02OwfIASLlb0XoMGYW1de7+NjXEYuz6vaTVSKlS3u
         VaZSQ47DxgVqEDH6SZh7ysP/MN54kzSodq6eZaREmxYaOXnBLRh29jBi4ucEdY+9wjBH
         6fWa6Q471UNeMdUFWPtfuBmaTyA/sqYYHKE+R7rilDgx4VQRHPdSsd402BjJeK5XfT34
         X/eiimWAqglrkqkyvFk10hH489PlXe2xWRI+ZyR/+KULosv5adL4oCQBfDwXwAsWS9uI
         24dvlitEHuPfpOIRoYETrzoWpina6KNy2STfQ7yv4p4xfpa+wC+ogLRDiiHRcVqKmZJF
         V1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711430166; x=1712034966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GczBXsnaLCm9zzJ7Qenf5gqQ5Emssgxzk7laDgeG0r8=;
        b=ivdVT49wN3cRYY5/Y3tr1QvllA3Kiykg65tJOVo9XHh7Igo2Dcf4T3EeLhGduQK7Xf
         cMHv92y4QZGnjv5uJCxT6DhNpjbLXBN4cxfvtdyUINJGQYALEdAN++x3J9RhxwDSMpwl
         88ddPQJet+dVwRtJKgPx3b15BbeESQxW1/1tWu+G10IqpCUUTQ1J5ye2VPxGh0vQmkpQ
         VXHKYfwQgJTMCBehE7a1V0yLjMW8jbOcWgIfu6cRPfssG9o0jJWZpU9U6Aj1PQbbTv/g
         H51lvR5fY7hm7/XMIXcbCQKiiS+beJQBRoKI0A5PakHf275I9BsG0CKnwy3kaT/EOTmz
         3IOA==
X-Gm-Message-State: AOJu0YwY3qneojsN78jb09nAUJc1BsfHmQ6GtGbowN2kCnlaL4iNDe57
	FqsBjYPwixRzLq+BJg+2SuLGJysS0qFG1OL7MyiIZiXgDW/lXhaBZwstCpzclk7FXpNVVL1AYV3
	G
X-Google-Smtp-Source: AGHT+IF0iOmiWS03lS2E6p2hcmprpl1Hcf/kBWFSmIvEUB2BD26U56rKwWAvmxCReLpsnnDtYQiS9Q==
X-Received: by 2002:a05:600c:1d14:b0:414:7431:6983 with SMTP id l20-20020a05600c1d1400b0041474316983mr47463wms.25.1711430165600;
        Mon, 25 Mar 2024 22:16:05 -0700 (PDT)
From: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>,
	Leigh Brown <leigh@solinno.co.uk>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/misc: fix xenwatchdogd invocation
Date: Tue, 26 Mar 2024 06:15:45 +0100
Message-Id: <6f5b09d7bdc555227e7a5e55aa090171fba070f8.1711430145.git.slack@rabbit.lu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When xenwatchdogd is invoked with -h/--help (or any non-number), the
argument value is converted to 0, which immediately shutdowns dom0.

So make sure only numbers are passed to the program, otherwise fail.
For the help, use getopt_long as suggested.
While there, reformat the code a bit (s/tabs/spaces/, indentation, etc).

Bug fix only, no functional change intended.

Reported-by: Leigh Brown <leigh@solinno.co.uk>
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Cyril Rébert / zithro <slack@rabbit.lu>
---
- Not sure about the preprocessor stanzas, copied them from xentop.
- A small explanation about what the program does could be helpful,
  like some kind of synopsis ? Purpose, gotchas, etc. I can do the
  writing, but please be specific !
- Built on 4.17 and unstable, tested on 4.17.
---
 tools/misc/xenwatchdogd.c | 77 +++++++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 20 deletions(-)

diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
index 254117b554..6ef5eaf45c 100644
--- a/tools/misc/xenwatchdogd.c
+++ b/tools/misc/xenwatchdogd.c
@@ -8,26 +8,34 @@
 #include <stdlib.h>
 #include <unistd.h>
 #include <signal.h>
+#include <string.h>
 #include <stdio.h>
 
+#define _GNU_SOURCE
+#include <getopt.h>
+#if !defined(__GNUC__) && !defined(__GNUG__)
+#define __attribute__(arg) /* empty */
+#endif
+
 xc_interface *h;
 int id = 0;
 
 void daemonize(void)
 {
     switch (fork()) {
-    case -1:
-	err(1, "fork");
-    case 0:
-	break;
-    default:
-	exit(0);
+        case -1:
+            err(1, "fork");
+        case 0:
+            break;
+        default:
+            exit(0);
     }
+
     umask(0);
     if (setsid() < 0)
-	err(1, "setsid");
+        err(1, "setsid");
     if (chdir("/") < 0)
-	err(1, "chdir /");
+        err(1, "chdir /");
     if (freopen("/dev/null", "r", stdin) == NULL)
         err(1, "reopen stdin");
     if(freopen("/dev/null", "w", stdout) == NULL)
@@ -52,39 +60,68 @@ void catch_usr1(int sig)
 
 int main(int argc, char **argv)
 {
+
     int t, s;
     int ret;
+    
+    char *usage = "usage: %s <timeout> <sleep>";
+    int opt, optind = 0;
+
+    struct option lopts[] = {
+        { "help",          no_argument,       NULL, 'h' },
+    };
+    const char *sopts = "h";
+
+    while ((opt = getopt_long(argc, argv, sopts, lopts, &optind)) != -1) {
+        switch (opt) {
+        case '?':
+        case 'h':
+            errx(1, usage, argv[0]);
+            break;
+        default:
+            errx(1, usage, argv[0]);
+        }
+    }
 
     if (argc < 2)
-	errx(1, "usage: %s <timeout> <sleep>", argv[0]);
+        errx(1, usage, argv[0]);
 
     daemonize();
 
     h = xc_interface_open(NULL, NULL, 0);
     if (h == NULL)
-	err(1, "xc_interface_open");
+        err(1, "xc_interface_open");
+
+    t = strtoul(argv[1], &argv[1], 0);
+    
+    // argv1 NaN
+    if ( *argv[1] != '\0' )
+        errx(1, "Error: timeout must be a number, got '%s'", argv[1]);
 
-    t = strtoul(argv[1], NULL, 0);
     if (t == ULONG_MAX)
-	err(1, "strtoul");
+        err(1, "strtoul");
 
     s = t / 2;
     if (argc == 3) {
-	s = strtoul(argv[2], NULL, 0);
-	if (s == ULONG_MAX)
-	    err(1, "strtoul");
+        s = strtoul(argv[2], &argv[2], 0);
+        // argv2 NaN
+        if ( *argv[2] != '\0' ){
+            errx(1, "Error: sleep must be a number, got '%s'", argv[2]);
+        }
+        if (s == ULONG_MAX)
+            err(1, "strtoul");
     }
 
     if (signal(SIGHUP, &catch_exit) == SIG_ERR)
-	err(1, "signal");
+        err(1, "signal");
     if (signal(SIGINT, &catch_exit) == SIG_ERR)
-	err(1, "signal");
+        err(1, "signal");
     if (signal(SIGQUIT, &catch_exit) == SIG_ERR)
-	err(1, "signal");
+        err(1, "signal");
     if (signal(SIGTERM, &catch_exit) == SIG_ERR)
-	err(1, "signal");
+        err(1, "signal");
     if (signal(SIGUSR1, &catch_usr1) == SIG_ERR)
-	err(1, "signal");
+        err(1, "signal");
 
     id = xc_watchdog(h, 0, t);
     if (id <= 0)
-- 
2.39.2


