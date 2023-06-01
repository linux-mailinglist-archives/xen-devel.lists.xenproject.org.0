Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1E871950E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 10:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542295.845980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dMd-0007i2-6k; Thu, 01 Jun 2023 08:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542295.845980; Thu, 01 Jun 2023 08:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dMd-0007em-3u; Thu, 01 Jun 2023 08:08:55 +0000
Received: by outflank-mailman (input) for mailman id 542295;
 Thu, 01 Jun 2023 08:08:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Xwn=BV=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q4dMc-0007eg-CC
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 08:08:54 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b27a846-0053-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 10:08:51 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz5188aQGr
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jun 2023 10:08:36 +0200 (CEST)
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
X-Inumbo-ID: 8b27a846-0053-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685606917; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=sp8O3BnmaZ3Rvm+SUtXK2EJ6sNfFwqEUcdTDLZ/tXDWjJARWMiBemnNhfM6m0NPoXU
    +WDeYlRt1EPNXdBAEXiQ+MLxH1RrGpSJosyugdI0v1i2cRZncwwWK7SNo1+hDIvxFgaw
    nnoD99GYMngrboIzZEPa7a+G0OsZGKzNyXdngkVWLJqqZNjLWmzHWPt6OOlk2Tx1T8tR
    yInQ0VvMa4fmmQkFyn+RoT9NmAwfyVwafbh0bPpp2O93DPqsihfhvq5y41zbuZw8P9vD
    CSPNOkgTFbJi9srG7KuUohE5Mlx8fbfDjlteAlo+5gdkteoVYjcN1qGTq8szIf7yrNzZ
    rg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685606917;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=1hod7D64Ri1wR1/q1jhkmlIlhHTQvlzAxtaOmwee5GI=;
    b=VN88hp29lRstD101Sdc2zvLzOdFi7QbGT1qUTjRy3/PKSEOaBN5V1t8my1FBoEwBFu
    EdxVbOToUlQMWBhzGIdXHcHY/PM1igWUYHnZnUo1mYo5LlxY+SKIiFK1ZA7FYjE0TWh4
    y5iKIk1MJ2z9MzJYKrSnFFGuQG0dL5F345sIywYBJN4FMFZObtbGveiFAThAVutq7ATi
    XveN5s/Ry+Rm8l/owfmr+iLliq9YvhflIVQdH0m+CfqQnJ0LXhPmgOCfSaGFSyKN5/kC
    xLKePV+1pux+hxOHoWksCJdfHlh5UyvBm4pUdjm0wRKaOoJn8x+VK94Bv4a9x5ZzZk3W
    Hbpw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685606917;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=1hod7D64Ri1wR1/q1jhkmlIlhHTQvlzAxtaOmwee5GI=;
    b=Iom3XnR6U19SLyJ6q859Pt9+BYsw9ag41BjFt1YA+AzruOt4KGIfwY49buUIsDkiXs
    1oesqawoK+w0DdwoMQ5rc8vQNU9joig5Qa3SFdmc//7FY6r8+BXtUH3KXpdlj3WWMKf6
    Qtc9qp0XvOi4+FzeTwktCjKCSTwe4llbYFLjp8nsjj+ewABBbZMYtYWk8kOAVmIcaxQ6
    qbO9Gsnud6NM8PQFPuk1GrnTo5GStG4sv/2XeR6aya8FAgjVihdNWRsuG8Bkcn05tyAn
    CisVFlak8Cl3EcGSHnxFPFLWmS+74l7oy8Mmxgx77UrEwHHWGPLAIJAQqpkHyUnRVtc+
    WFIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685606917;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=1hod7D64Ri1wR1/q1jhkmlIlhHTQvlzAxtaOmwee5GI=;
    b=hSphYuUd6Ee1fP4927qmUtqiN5Cl7biGTz7jp7LyjdYlfbyB+NXv7SKlWMfnAy1nj/
    6hgcGhMQdgK0EfIup9BQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] xentrace: adjust exit code for --help option
Date: Thu,  1 Jun 2023 10:08:33 +0200
Message-Id: <20230601080833.32680-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Invoking the --help option of any tool should not return with an error,
if that tool does indeed have a documented and implemented help option.

Adjust the usage() function to exit with either error or success.
Handle the existing entry in the option table to call usage accordingly.

Adjust the getopt value for help. The char '?' is returned for unknown
options. Returning 'h' instead of '?' makes it allows to handle --help.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/xentrace.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/xentrace/xentrace.c b/tools/xentrace/xentrace.c
index 3548255123..be6226f088 100644
--- a/tools/xentrace/xentrace.c
+++ b/tools/xentrace/xentrace.c
@@ -807,7 +807,7 @@ static void monitor_tbufs(void)
 const char *program_version     = "xentrace v1.2";
 const char *program_bug_address = "<mark.a.williamson@intel.com>";
 
-static void usage(void)
+static void usage(int status)
 {
 #define USAGE_STR \
 "Usage: xentrace [OPTION...] [output file]\n" \
@@ -854,7 +854,7 @@ static void usage(void)
     printf(USAGE_STR);
     printf("\nReport bugs to %s\n", program_bug_address);
 
-    exit(EXIT_FAILURE);
+    exit(status);
 }
 
 /* convert the argument string pointed to by arg to a long int representation,
@@ -873,7 +873,7 @@ long sargtol(const char *restrict arg, int base)
     {
         fprintf(stderr, "Invalid option argument: %s\n", arg);
         fprintf(stderr, "Error: %s\n\n", strerror(errno));
-        usage();
+        usage(EXIT_FAILURE);
     }
     else if (endp == arg)
     {
@@ -901,7 +901,7 @@ long sargtol(const char *restrict arg, int base)
 
 invalid:
     fprintf(stderr, "Invalid option argument: %s\n\n", arg);
-    usage();
+    usage(EXIT_FAILURE);
     return 0; /* not actually reached */
 }
 
@@ -917,10 +917,10 @@ static long argtol(const char *restrict arg, int base)
     if (errno != 0) {
         fprintf(stderr, "Invalid option argument: %s\n", arg);
         fprintf(stderr, "Error: %s\n\n", strerror(errno));
-        usage();
+        usage(EXIT_FAILURE);
     } else if (endp == arg || *endp != '\0') {
         fprintf(stderr, "Invalid option argument: %s\n\n", arg);
-        usage();
+        usage(EXIT_FAILURE);
     }
 
     return val;
@@ -1090,7 +1090,7 @@ static void parse_args(int argc, char **argv)
         { "discard-buffers", no_argument,      0, 'D' },
         { "dont-disable-tracing", no_argument, 0, 'x' },
         { "start-disabled", no_argument,       0, 'X' },
-        { "help",           no_argument,       0, '?' },
+        { "help",           no_argument,       0, 'h' },
         { "version",        no_argument,       0, 'V' },
         { 0, 0, 0, 0 }
     };
@@ -1144,8 +1144,12 @@ static void parse_args(int argc, char **argv)
             opts.memory_buffer = sargtol(optarg, 0);
             break;
 
+        case 'h':
+            usage(EXIT_SUCCESS);
+            break;
+
         default:
-            usage();
+            usage(EXIT_FAILURE);
         }
     }
 

