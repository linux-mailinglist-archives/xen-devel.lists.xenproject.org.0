Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C89F7126D3
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 14:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540116.841622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Wi6-0006n3-Qh; Fri, 26 May 2023 12:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540116.841622; Fri, 26 May 2023 12:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Wi6-0006jy-Na; Fri, 26 May 2023 12:38:22 +0000
Received: by outflank-mailman (input) for mailman id 540116;
 Fri, 26 May 2023 12:38:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xc68=BP=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q2Wi5-0006jp-AD
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 12:38:21 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.163]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31f65e63-fbc2-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 14:38:20 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4QCcE7ih
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 26 May 2023 14:38:14 +0200 (CEST)
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
X-Inumbo-ID: 31f65e63-fbc2-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1685104694; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=WhKwkL3PZvTC5PFUX4/6PjJyLk2w3VNxaA4P3s2hzqx+fryyZdmQPN6wFImmNN8QSt
    FSlnf+vfShdkZWfOKC+FrGJMdx3QKwwhLE6W+f8h5zK2ZWyBKrv8D0SmYiMKFfOtV9Oe
    vAcPApae6dCHcLm+54nvxSHu3kILit4NrCMpi9aGP4d4NZ7x7pccl6DGuE5rfdI4GIoo
    W7NooGIW8g12iht9JwdsUNoRkhxE19QJE251FH4vn1zSSejcVqwAvh//lhFRnx/Ea6gE
    dJpdaOY4x3fETgraPqCEPGh9GR/imvUwcjr+m0LAO8AskhAplkw8le/ZPoLi69h4fVfx
    tnTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685104694;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TV6XPOqE6SFQtp9w1o26J0iwlJ8FZqSaP4PKDn98ZHc=;
    b=kjUs0VtQMVGLqmD8Of+u5PqcFizlXG2edidpieVCblFrTWLmAL+Zwjwk7Vgut/RQ9n
    8iIwUJrgrEJYMw9lWQgUhhS0cHmcIn7pQccMzFviig1Z9J83WvxAc0mWBj4choJL1b1l
    Xgp5Jw5H3Hja8GRL7OwZlEYvELcEUebuter8KcKqxmdmvtR+XFTRnngq4DjgNaMNLeN2
    tf+ZThknRovrkP8HNyMv4xRuT3fSbuMHeTM0ygtRkiwWHo5TPhOYyswkM9cGPaPrGepg
    C8StWC1s7Mc8eMWF4CpS7bdxoEufDZwR6h1hX0p4Lws2NEod4TYOQMOTWi6IFu9J0xXa
    xhPw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685104694;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TV6XPOqE6SFQtp9w1o26J0iwlJ8FZqSaP4PKDn98ZHc=;
    b=rAws7qeGCU+DW0tyUMYx5DJe59k15Mv0ZPCtskiNSREh2b394MbDT1c6+P5CPd9j1P
    nqwSrypqIMt25pj0zAuXV9P8Lw4DjEvSLuNoPnE32nIneDc2jMawYZFi/eOIT/TeRU3U
    6zQjYlBNwixDxuuwu0lHMSbBI4VL/o5H9ylfnOCnlCXJwl8Lfb+U+bTa1ThbabWYFOPZ
    vrEMY2AXLeeesxD2HHo5dLvEya2XAa1j8F6hYJiJ9t3ra8lKOA1cvjkgCiFR54KgryDT
    nhUGiWxdKPAuWQVnFtH+3AgMl0L8X5EKraLVH+I8n6hE31jfigTAqcKcYCbx49gtSK9M
    W9mA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685104694;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TV6XPOqE6SFQtp9w1o26J0iwlJ8FZqSaP4PKDn98ZHc=;
    b=fdF0v2+49ioYdWmmkdyKrpGubJ4ZlCRPNP8Wooiikj7E7tD61I+EBOTNLGRf5nmEr2
    nj+OwfcvDeb1dLQVqeBA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] xentrace: adjust exit code for --help option
Date: Fri, 26 May 2023 14:38:10 +0200
Message-Id: <20230526123810.23210-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Invoking the --help option of any tool should not return with an error,
if that tool does have a documented and implemented help option.

Adjust the usage() function to exit with either error or success.
Handle the existing entry in the option table to call usage accordingly.

Adjust the getopt value for help. The char '?' is returned for unknown
options. Returning 'h' instead of '?' allows to handle --help.

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
 

