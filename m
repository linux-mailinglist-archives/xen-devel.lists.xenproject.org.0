Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6904788EDF7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 19:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698688.1090713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpXnS-0005En-DX; Wed, 27 Mar 2024 18:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698688.1090713; Wed, 27 Mar 2024 18:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpXnS-00059d-3t; Wed, 27 Mar 2024 18:14:46 +0000
Received: by outflank-mailman (input) for mailman id 698688;
 Wed, 27 Mar 2024 18:14:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lSYu=LB=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1rpXmv-0004q7-Mp
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 18:14:13 +0000
Received: from doppler.solinno.uk
 (8.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.9.a.d.0.6.f.d.1.0.b.8.0.1.0.0.2.ip6.arpa
 [2001:8b0:1df6:da9::18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfe5eb1d-ec65-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 19:14:12 +0100 (CET)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id B2139800AB;
 Wed, 27 Mar 2024 18:14:11 +0000 (GMT)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 88DF6202A9; Wed, 27 Mar 2024 18:14:11 +0000 (GMT)
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
X-Inumbo-ID: cfe5eb1d-ec65-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1711563251;
	bh=rQZPf46rdnhj9rP0ET/XSW2dcaf6Q8RXOc1FXyeFv8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XUgZomaWSaC7XAON5YMh+zH32wgSPtqAYJD/l4Z3N7J58cAPaBap+XE6LUmFnTywm
	 NYgYgiG2hoMmPy/aVOWbaLQoLKkNWARuDQhll9vfW0xcFRo7SUiak9wwdiHMEgyyZg
	 oWomPnYl7ieMUi1lYhXPNlJ5rNJmDkV0zAGwuels=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH 4/6] tools/misc: xenwatchdogd: add parse_secs()
Date: Wed, 27 Mar 2024 18:13:51 +0000
Message-Id: <20240327181353.10951-5-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240327181353.10951-1-leigh@solinno.co.uk>
References: <55416d60-cae7-4e79-8bde-bc07ee9e3830@suse.com>
 <20240327181353.10951-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

Create a new parse_secs() function to parse the timeout and sleep
parameters. This ensures that non-numeric parameters are not
accidentally treated as numbers.
---
 tools/misc/xenwatchdogd.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
index 224753e824..26bfdef3db 100644
--- a/tools/misc/xenwatchdogd.c
+++ b/tools/misc/xenwatchdogd.c
@@ -49,6 +49,18 @@ static void catch_usr1(int sig)
     done = true;
 }
 
+static int parse_secs(const char *arg, const char *what)
+{
+    char *endptr;
+    unsigned long val;
+
+    val = strtoul(arg, &endptr, 0);
+    if (val > INT_MAX || *endptr != 0)
+	errx(EXIT_FAILURE, "invalid %s: '%s'", what, arg);
+
+    return val;
+}
+
 int main(int argc, char **argv)
 {
     int id;
@@ -64,16 +76,11 @@ int main(int argc, char **argv)
     if (h == NULL)
 	err(EXIT_FAILURE, "xc_interface_open");
 
-    t = strtoul(argv[1], NULL, 0);
-    if (t == ULONG_MAX)
-	err(EXIT_FAILURE, "strtoul");
+    t = parse_secs(argv[optind], "timeout");
 
     s = t / 2;
-    if (argc == 3) {
-	s = strtoul(argv[2], NULL, 0);
-	if (s == ULONG_MAX)
-	    err(EXIT_FAILURE, "strtoul");
-    }
+    if (argc == 3)
+	s = parse_secs(argv[optind], "sleep");
 
     if (signal(SIGHUP, &catch_exit) == SIG_ERR)
 	err(EXIT_FAILURE, "signal");
-- 
2.39.2


