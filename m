Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDECE891773
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 12:11:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699354.1092157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqA8s-0006si-U1; Fri, 29 Mar 2024 11:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699354.1092157; Fri, 29 Mar 2024 11:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqA8s-0006r6-P4; Fri, 29 Mar 2024 11:11:26 +0000
Received: by outflank-mailman (input) for mailman id 699354;
 Fri, 29 Mar 2024 11:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tVj/=LD=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1rqA8r-0006qp-5b
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 11:11:25 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13de8d71-edbd-11ee-afe3-a90da7624cb6;
 Fri, 29 Mar 2024 12:11:23 +0100 (CET)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id F107A800AC;
 Fri, 29 Mar 2024 11:11:22 +0000 (GMT)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id BD8BC202AA; Fri, 29 Mar 2024 11:11:22 +0000 (GMT)
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
X-Inumbo-ID: 13de8d71-edbd-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1711710682;
	bh=Q+rKJ2Q7LqFNdLGMkfelDfN5qg5la8JE5UlDaV5w0rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pjf8roxX7fv1QHDjU6GvhVSOfwSdOioSDPeeUXSTkpiDomnS4uzgymF2clq2cTfpA
	 RMRHocYs8nY6hwM1K3Y4cg/8/lPEawRzHF2swPZf4QUWzdo2ugrcKpOusDd6rWfLFh
	 lar4vsFg/gmIOZOXqfi3AgxHJH9REx/ysia6S9tA=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v2 4/6] tools/misc: xenwatchdogd: add parse_secs()
Date: Fri, 29 Mar 2024 11:10:54 +0000
Message-Id: <20240329111056.6118-5-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240329111056.6118-1-leigh@solinno.co.uk>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

Create a new parse_secs() function to parse the timeout and sleep
parameters. This ensures that non-numeric parameters are not
accidentally treated as numbers.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 tools/misc/xenwatchdogd.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
index 2e7f9f51c5..19ec4c5359 100644
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


