Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A5E93BDED
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 10:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764818.1175396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWtpM-0007Po-LZ; Thu, 25 Jul 2024 08:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764818.1175396; Thu, 25 Jul 2024 08:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWtpM-0007O8-Gd; Thu, 25 Jul 2024 08:27:56 +0000
Received: by outflank-mailman (input) for mailman id 764818;
 Thu, 25 Jul 2024 08:27:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D+J6=OZ=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sWtpK-00070a-Pg
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 08:27:54 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8da7fd4-4a5f-11ef-8776-851b0ebba9a2;
 Thu, 25 Jul 2024 10:27:52 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5a1c49632deso784624a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 01:27:52 -0700 (PDT)
Received: from fhilly.. ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63590e7esm558590a12.36.2024.07.25.01.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 01:27:51 -0700 (PDT)
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
X-Inumbo-ID: c8da7fd4-4a5f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721896072; x=1722500872; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBaRyDnAGRnUAzYqwQI4QueAjcDEPAmUfs0Um5xu1Fw=;
        b=VA/+1NZG2Ye8x+cMODrXVvy6Unbm++2iWufSv0SZOqAQC96FnaR+YLSwub7qLFFS7k
         x/8cQtKO4uVEUAlyWEhVskccGzKSTRpRSD9zeSjfUT04EmJLqGhs3mxLzwSbjhZHXy7t
         a6ElbEJksFbsktC0YVVeRestsirLlLGsot6xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721896072; x=1722500872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBaRyDnAGRnUAzYqwQI4QueAjcDEPAmUfs0Um5xu1Fw=;
        b=BI1RACxYHeaoM3vE6CmJFkDA+MWZOezYp+lW9Q0ffqUfW18g6wqOBALVRxyh1AHfDW
         LGxX+lmtE+7oIcMDfz5zMzMGq8bHnwYZuAthkrjQGXwdebTq5P3gHYZ/4Ndhs4ba+3a4
         yujxffFIQFEUr5Rs1tLm+T1aU5OxuLL5phRVZMdsbyYSP7ZuEplZOh08G/Q3VThLqyr4
         43vFDXbTywJfL/tQ23HwxWF7eTlVyTBDTaOMGV3gWdan4UMaXJCBj+6ubGyXcKnqB6pE
         5hoh3fQi6fXRipcQIbSjQTbMm6tZtFl7fPgEmp31UXgl+txvlWHF0SqEvVllY+eOAPMg
         2rBQ==
X-Gm-Message-State: AOJu0YzoFQ6EZcA0dzjrCHx/GoTzA1WTzgW3nO8VEtwVe6X2uwLssLoo
	kJFvYAuQZtA79cDOJW9KbEA4DGwRJzHS4VP09mMQoTpDggT0EMEKiBnogG7V8aAJFcHxBQ5wAlG
	N
X-Google-Smtp-Source: AGHT+IH7u/9vSqUG18/Wai/gBMKMoz1kLZADxXkS2EPtQ2jADup/zKwH3xjvDtCWFr24WntaeJTVng==
X-Received: by 2002:a05:6402:2681:b0:586:e6e3:ea18 with SMTP id 4fb4d7f45d1cf-5acaad3c2b4mr672296a12.23.1721896071456;
        Thu, 25 Jul 2024 01:27:51 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v6 2/4] x86/ucode: refactor xen-ucode to utilize getopt
Date: Thu, 25 Jul 2024 09:27:23 +0100
Message-ID: <20240725082725.2685481-3-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240725082725.2685481-1-fouad.hilly@cloud.com>
References: <20240725082725.2685481-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use getopt_long() to handle command line arguments.
Introduce ext_err for common exit with errors.
Introducing usage() to handle usage\help messages in a common block.
show_curr_cpu is printed to stdout only.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
[v6]
1- Update usage() printed message format: [microcode file] [options] -> [microcode file | options]
2- Add missing blanks in switch ( opt )
[v5]
1- Update message description.
2- re-arrange static and automatic variables.
3- Fix indentations.
4- reverted the deletion of show-cpu-info for backwards compatibility.
[v4]
1- Merge three patches into one.
2- usage() to print messages to the correct stream.
3- Update commit message and description.
---
 tools/misc/xen-ucode.c | 52 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index 390969db3d1c..2c9f337b86cb 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -11,6 +11,7 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <xenctrl.h>
+#include <getopt.h>
 
 static xc_interface *xch;
 
@@ -71,12 +72,29 @@ static void show_curr_cpu(FILE *f)
     }
 }
 
+static void usage(FILE *stream, const char *name)
+{
+    fprintf(stream,
+            "%s: Xen microcode updating tool\n"
+            "options:\n"
+            "  -h, --help            display this help\n"
+            "  -s, --show-cpu-info   show CPU information\n"
+            "Usage: %s [microcode file | options]\n", name, name);
+    show_curr_cpu(stream);
+}
+
 int main(int argc, char *argv[])
 {
+    static const struct option options[] = {
+        {"help", no_argument, NULL, 'h'},
+        {"show-cpu-info", no_argument, NULL, 's'},
+        {NULL, no_argument, NULL, 0}
+    };
     int fd, ret;
     char *filename, *buf;
     size_t len;
     struct stat st;
+    int opt;
 
     xch = xc_interface_open(NULL, NULL, 0);
     if ( xch == NULL )
@@ -86,22 +104,34 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    if ( argc < 2 )
+    while ( (opt = getopt_long(argc, argv, "hs", options, NULL)) != -1 )
     {
-        fprintf(stderr,
-                "xen-ucode: Xen microcode updating tool\n"
-                "Usage: %s [<microcode file> | show-cpu-info]\n", argv[0]);
-        show_curr_cpu(stderr);
-        exit(2);
+        switch ( opt )
+        {
+        case 'h':
+            usage(stdout, argv[0]);
+            exit(EXIT_SUCCESS);
+
+        case 's':
+            show_curr_cpu(stdout);
+            exit(EXIT_SUCCESS);
+
+        default:
+            goto ext_err;
+        }
     }
 
-    if ( !strcmp(argv[1], "show-cpu-info") )
+    if ( optind == argc )
+        goto ext_err;
+
+    /* For backwards compatibility to the pre-getopt() cmdline handling */
+    if ( !strcmp(argv[optind], "show-cpu-info") )
     {
         show_curr_cpu(stdout);
         return 0;
     }
 
-    filename = argv[1];
+    filename = argv[optind];
     fd = open(filename, O_RDONLY);
     if ( fd < 0 )
     {
@@ -146,4 +176,10 @@ int main(int argc, char *argv[])
     close(fd);
 
     return 0;
+
+ ext_err:
+    fprintf(stderr,
+            "%s: unable to process command line arguments\n", argv[0]);
+    usage(stderr, argv[0]);
+    exit(EXIT_FAILURE);
 }
-- 
2.42.0


