Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E9292FAE1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 15:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758026.1167254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSG0S-0005mC-RO; Fri, 12 Jul 2024 13:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758026.1167254; Fri, 12 Jul 2024 13:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSG0S-0005iZ-MH; Fri, 12 Jul 2024 13:08:12 +0000
Received: by outflank-mailman (input) for mailman id 758026;
 Fri, 12 Jul 2024 13:08:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/nkX=OM=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sSG0Q-0005Dy-BM
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 13:08:10 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8d4aeb5-404f-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 15:08:08 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a77c9c5d68bso250053666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 06:08:08 -0700 (PDT)
Received: from fhilly.. ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a87204esm343023466b.222.2024.07.12.06.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 06:08:06 -0700 (PDT)
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
X-Inumbo-ID: c8d4aeb5-404f-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720789688; x=1721394488; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPd4QMpgpgaUUa0BsUbRhjLLPAYAaWkzbRkiXpWaltU=;
        b=QFyWKEhEveoosp7HbpA9tOrDq5T3eiWtA3ZZ48wk4PL6D12o9rmbLKU7CyZ/XiBVfG
         YXiQwSRn8O/1X6Qg4e/3rsiPcf6MA/zAosOh4taZlmqVM8CHXoATA4sl/acYLb0kelJq
         iFYGadB/BFVLNypTYFfz0SWj/z2YEMdjsy98c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720789688; x=1721394488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPd4QMpgpgaUUa0BsUbRhjLLPAYAaWkzbRkiXpWaltU=;
        b=k30vqsQLq4KNlF9L3hREXStISHYKt5OrWQUllXxmxswB8z6u8zFpRPdMvrXMg75llx
         daTOY3tdiXYfiRpvGhYqcHDwQSeq5zg2eIIqavkrvCgaarn4G4YA7at5rGjsWe/LH/1G
         sAHCuZ3Q8Xb6f/QhW2Ppv80BnpTNwpjGEFj0u7Yir80ndJL8JpzDdLj6hz7gqBP35MIJ
         NV7h+2MwOPfHm5IMywdS/KrXr4sVIS7MFS8ey4Hmum1poLgjn8fQXC/vLrVAz98HdWgX
         iZJCCUJZ1pfHIqmyVJpnUK75Mb2FmkmEbcjKDdk1hvPJbM7PE047TUC6Aoku/72DnRLZ
         UAaQ==
X-Gm-Message-State: AOJu0YxFc9kN2Zh9ThLZd7ML/CRObet4392NcI3bLi+yinxc4cYnxRBT
	RPxPoGUzOFuML+mbwXGwKja57XyUMEhQ22rJcKhssrIStav2X6elyhVaUdtnURmJwh/muM3PeSm
	Q
X-Google-Smtp-Source: AGHT+IEtiEEVaMLwPlciJZbSFAl17Bhi/cRhUb7hq1LiFMcbqqmgNw2S/16O4StWpVycT2yJxzXBqQ==
X-Received: by 2002:a17:906:260f:b0:a77:c364:c4e9 with SMTP id a640c23a62f3a-a780b705312mr688968166b.45.1720789687419;
        Fri, 12 Jul 2024 06:08:07 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 2/4] x86/ucode: refactor xen-ucode to utilize getopt
Date: Fri, 12 Jul 2024 14:07:47 +0100
Message-ID: <20240712130749.1272741-3-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240712130749.1272741-1-fouad.hilly@cloud.com>
References: <20240712130749.1272741-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use getopt_long() to handle command line arguments.
Introduce ext_err for common exit with errors.
Introducing usage() to handle usage\help messages in a common block.
show_curr_cpu is printed to stdout only.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
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
index 390969db3d1c..8de82e5b8a10 100644
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
+            "Usage: %s [microcode file] [options]\n", name, name);
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
+        switch (opt)
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


