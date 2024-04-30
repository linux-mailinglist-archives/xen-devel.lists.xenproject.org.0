Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E648B7612
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 14:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714809.1116149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mtP-0005VH-OS; Tue, 30 Apr 2024 12:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714809.1116149; Tue, 30 Apr 2024 12:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mtP-0005PA-Ft; Tue, 30 Apr 2024 12:47:31 +0000
Received: by outflank-mailman (input) for mailman id 714809;
 Tue, 30 Apr 2024 12:47:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGtk=MD=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1s1mtO-0005B4-8h
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 12:47:30 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdfffa86-06ef-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 14:47:29 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a55bf737cecso668767266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 05:47:29 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e14-20020a170906504e00b00a558014ab2csm14165324ejk.145.2024.04.30.05.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 05:47:28 -0700 (PDT)
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
X-Inumbo-ID: cdfffa86-06ef-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714481249; x=1715086049; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xetGCzyng7oSVdEu+g4DSoDeJEZCA8694EpUidgaMa8=;
        b=gdpPgm6+e3ajxiUMY3jXIiXPq8OTWW3wmlCviUCMp2XYArpzW6kJ6qUutIxeLy9SHA
         HZSmMXvUodJ7t1fMHWXwFCsugYGkVFigyb8T4RINqeaJi9OfTLchH9MhlRr6HAdBnqi8
         JYy0MaCvdZud0Jnjv4BVkXpf98+/CdAIUau9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481249; x=1715086049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xetGCzyng7oSVdEu+g4DSoDeJEZCA8694EpUidgaMa8=;
        b=bIFdImaSu8mRR8GvGHqoZr0BW+iBSi99UXMQdVbNg94K8Yo8bNS1gnz/Pm9+ZkG35l
         Ax0eJfaARBvktCQCy6Iuzbi2wSf/wBAlTq5BhRFhDTn4071HilNa11mf3AQUwMQlYH+J
         Z1kvlohzYh/POrTRLLBxoJ7bCTWDwIHDUbvbdh8UhKtF08JQIqfIwA9J5Xjap839iY3W
         4yOC3GSjFvQvQSexY/WyWTRz4JEXq6iaa/nhLyjFiyKh7CerBWXPeK4rrYtPfzugbjYy
         L6f9jFcQ18Rzb+B23P3K9GFDgyieErcqzXVlJkxwnSzdEzlZJybiHBSKTtEPhVCI/Mua
         i/Gw==
X-Gm-Message-State: AOJu0YzVV09/he7n0Ivrmvxt+JkrYezkWazgWRRSEEGdiYSp7XRONqUn
	J75wvHzE8j+xl74yBJQs5jKfd+pWmNKoMBqdmyRw2kYPa0XCO13zBMBZyQ3kCzD015hkppleIdj
	j
X-Google-Smtp-Source: AGHT+IEgypZzUkmtEkoARhyE6vL2FcIm90aW/XVJnTNlJjgUCAOSBS4YAT210l6216z9vbqk/+S3bw==
X-Received: by 2002:a17:906:698e:b0:a52:58a7:11d1 with SMTP id i14-20020a170906698e00b00a5258a711d1mr8632442ejr.38.1714481248942;
        Tue, 30 Apr 2024 05:47:28 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v3 4/5] x86: Use getopt to handle command line args
Date: Tue, 30 Apr 2024 13:47:08 +0100
Message-ID: <20240430124709.865183-5-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240430124709.865183-1-fouad.hilly@cloud.com>
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use getopt_long() to handle command line arguments.
Introduce ext_err for common exit with errors.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
[v3]
1- Exit with error prints erros only to stderr.
2- Remove argc checks.
3- Utilize optind.

[v2]
1- Removed unnecessary NULL initialization.
2- Used static at the beginning of type struct declaration.
3- Corrected switch\case indentations.
4- Removed redundant checks.
5- Corrected label indentation.
 tools/misc/xen-ucode.c | 45 +++++++++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index 005bf85b6551..d95f967f021b 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -11,6 +11,7 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <xenctrl.h>
+#include <getopt.h>
 
 static xc_interface *xch;
 
@@ -20,7 +21,10 @@ static const char   amd_id[] = "AuthenticAMD";
 static void usage(const char *name)
 {
     printf("%s: Xen microcode updating tool\n"
-           "Usage: %s [<microcode file> | show-cpu-info]\n",
+           "Usage: %s [<microcode file> | Options]\n"
+           "options:\n"
+           "  -h, --help            display this help and exit\n"
+           "  -s, --show-cpu-info   show CPU information and exit\n",
            name, name);
 }
 
@@ -84,6 +88,13 @@ int main(int argc, char *argv[])
     char *filename, *buf;
     size_t len;
     struct stat st;
+    int opt;
+
+    static const struct option options[] = {
+        {"help", no_argument, NULL, 'h'},
+        {"show-cpu-info", no_argument, NULL, 's'},
+        {NULL, no_argument, NULL, 0}
+    };
 
     xch = xc_interface_open(NULL, NULL, 0);
     if ( xch == NULL )
@@ -93,21 +104,25 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    if ( argc < 2 )
+    while ( (opt = getopt_long(argc, argv, "hs", options, NULL)) != -1 )
     {
-        fprintf(stderr,
-                "%s: unable to process command line arguments\n", argv[0]);
-        usage(argv[0]);
-        exit(2);
+        switch (opt)
+        {
+        case 'h':
+            usage(argv[0]);
+            exit(EXIT_SUCCESS);
+        case 's':
+            show_curr_cpu(stdout);
+            exit(EXIT_SUCCESS);
+        default:
+            goto ext_err;
+        }
     }
 
-    if ( !strcmp(argv[1], "show-cpu-info") )
-    {
-        show_curr_cpu(stdout);
-        return 0;
-    }
+    if ( optind == argc )
+        goto ext_err;
 
-    filename = argv[1];
+    filename = argv[optind];
     fd = open(filename, O_RDONLY);
     if ( fd < 0 )
     {
@@ -149,4 +164,10 @@ int main(int argc, char *argv[])
     close(fd);
 
     return 0;
+
+ ext_err:
+    fprintf(stderr,
+            "%s: unable to process command line arguments\n", argv[0]);
+    usage(argv[0]);
+    exit(EXIT_FAILURE);
 }
-- 
2.42.0


