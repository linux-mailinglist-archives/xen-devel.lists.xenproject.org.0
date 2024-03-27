Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B54988EDFD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 19:15:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698692.1090726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpXnT-0005XI-59; Wed, 27 Mar 2024 18:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698692.1090726; Wed, 27 Mar 2024 18:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpXnS-0005Ju-Qm; Wed, 27 Mar 2024 18:14:46 +0000
Received: by outflank-mailman (input) for mailman id 698692;
 Wed, 27 Mar 2024 18:14:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lSYu=LB=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1rpXmx-0004q7-BP
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 18:14:15 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfd4837f-ec65-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 19:14:12 +0100 (CET)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id A7AFC80063;
 Wed, 27 Mar 2024 18:14:11 +0000 (GMT)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 84509202A7; Wed, 27 Mar 2024 18:14:11 +0000 (GMT)
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
X-Inumbo-ID: cfd4837f-ec65-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1711563251;
	bh=ay3hKImaotvpX5ABfW+1h5b91XRSJf6dwN7llSE5zkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r6tUrtESc3+Vw4pNkGzCM1cWS7YHKPfPMGCxCvBt2Z2VmfN0FrapUAwBdBSjIaKpt
	 QZ1C3QAoQTQz52XERPlOnU8gVRlqJtAOdoJCyQPL90nE8cvFwqxPljyynvDpguRQ3c
	 k5jUJnPs1S1FHqneNpI1v7V7x0C8CYotjI0OxCPA=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH 2/6] tools/misc: rework xenwatchdogd signal handling
Date: Wed, 27 Mar 2024 18:13:49 +0000
Message-Id: <20240327181353.10951-3-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240327181353.10951-1-leigh@solinno.co.uk>
References: <55416d60-cae7-4e79-8bde-bc07ee9e3830@suse.com>
 <20240327181353.10951-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

Rework xenwatchdogd signal handling to do the minimum in the signal
handler. This is a very minor enhancement.
---
 tools/misc/xenwatchdogd.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
index 2f7c822d61..d4da0ad0b6 100644
--- a/tools/misc/xenwatchdogd.c
+++ b/tools/misc/xenwatchdogd.c
@@ -9,9 +9,11 @@
 #include <unistd.h>
 #include <signal.h>
 #include <stdio.h>
+#include <stdbool.h>
 
 xc_interface *h;
-int id = 0;
+bool safeexit = false;
+bool done = false;
 
 void daemonize(void)
 {
@@ -38,20 +40,18 @@ void daemonize(void)
 
 void catch_exit(int sig)
 {
-    if (id)
-        xc_watchdog(h, id, 300);
-    exit(EXIT_SUCCESS);
+    done = true;
 }
 
 void catch_usr1(int sig)
 {
-    if (id)
-        xc_watchdog(h, id, 0);
-    exit(EXIT_SUCCESS);
+    safeexit = true;
+    done = true;
 }
 
 int main(int argc, char **argv)
 {
+    int id;
     int t, s;
     int ret;
 
@@ -90,10 +90,14 @@ int main(int argc, char **argv)
     if (id <= 0)
         err(EXIT_FAILURE, "xc_watchdog setup");
 
-    for (;;) {
+    while (!done) {
         sleep(s);
         ret = xc_watchdog(h, id, t);
         if (ret != 0)
             err(EXIT_FAILURE, "xc_watchdog");
     }
+
+    // Zero seconds timeout will disarm the watchdog timer
+    xc_watchdog(h, id, safeexit ? 0 : 300);
+    return 0;
 }
-- 
2.39.2


