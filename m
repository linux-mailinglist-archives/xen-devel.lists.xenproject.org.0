Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D139C8A1DE5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 20:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704121.1100304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruz2O-0005Eh-89; Thu, 11 Apr 2024 18:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704121.1100304; Thu, 11 Apr 2024 18:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruz2O-0005D5-1s; Thu, 11 Apr 2024 18:20:40 +0000
Received: by outflank-mailman (input) for mailman id 704121;
 Thu, 11 Apr 2024 18:20:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SAdS=LQ=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1ruz2M-0004xS-6g
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 18:20:38 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30d7a3fa-f830-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 20:20:35 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 8985380069;
 Thu, 11 Apr 2024 19:20:35 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 628442017C; Thu, 11 Apr 2024 19:20:35 +0100 (BST)
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
X-Inumbo-ID: 30d7a3fa-f830-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1712859635;
	bh=IQc0cKekmnq3tFF/KmZyaqRrn+6b97CWdWbbmSJl6c4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=coDTFJrr80EHmyAa5R1oP5glhlZM4LPiCCgBkNUO5llAcIiSgzlW25CIMCfJ4yZHa
	 B2Gzp8aoq6J9LV8GI7d1ctoIeULHmDAfXqxOZ30OAba/+A//YJyfpMroNvVZpLm0mv
	 t9Fc6nWOjejmKefaC78fjOGNwC2d7sRRqo0hoMw0=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v3 1/4] tools/misc: xenwatchdogd: add parse_secs()
Date: Thu, 11 Apr 2024 19:20:20 +0100
Message-Id: <20240411182023.56309-2-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240411182023.56309-1-leigh@solinno.co.uk>
References: <20240411182023.56309-1-leigh@solinno.co.uk>
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
index 112b706357..9fa772e49f 100644
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
+    if (val > INT_MAX || *endptr)
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
+    t = parse_secs(argv[1], "timeout");
 
     s = t / 2;
-    if (argc == 3) {
-	s = strtoul(argv[2], NULL, 0);
-	if (s == ULONG_MAX)
-	    err(EXIT_FAILURE, "strtoul");
-    }
+    if (argc == 3)
+	s = parse_secs(argv[2], "sleep");
 
     if (signal(SIGHUP, &catch_exit) == SIG_ERR)
 	err(EXIT_FAILURE, "signal");
-- 
2.39.2


