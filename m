Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1168495B5ED
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 15:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781828.1191335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh7VL-0003w5-F6; Thu, 22 Aug 2024 13:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781828.1191335; Thu, 22 Aug 2024 13:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh7VL-0003r7-An; Thu, 22 Aug 2024 13:05:31 +0000
Received: by outflank-mailman (input) for mailman id 781828;
 Thu, 22 Aug 2024 13:05:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m19V=PV=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sh7VK-0003o9-7B
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 13:05:30 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34c88b1b-6087-11ef-a50a-bb4a2ccca743;
 Thu, 22 Aug 2024 15:05:29 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5bed83488b6so1116995a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 06:05:29 -0700 (PDT)
Received: from fhilly.. ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a4c4384sm897139a12.62.2024.08.22.06.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 06:05:26 -0700 (PDT)
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
X-Inumbo-ID: 34c88b1b-6087-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724331928; x=1724936728; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9vAl6gPQOHAEsxcAliRbXeAmx2pjKxpw/3blrP7pio=;
        b=WXr3N73CrDR7WSSAu2QlbEKQLTw3K8/b5RhCs/9AF5k6azNXasM36DUirkbp0UH5wt
         jWgnoOx6Ry3tFGsWf+fO0/9kTXuFgXpJq6aG/rYRBA3YFguaWVlwFcpqTJd9qq8t3O3I
         9FDGGcbbIgGMGAOPB+GFMR9iEIpzshrvW6SXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724331928; x=1724936728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9vAl6gPQOHAEsxcAliRbXeAmx2pjKxpw/3blrP7pio=;
        b=RGTf/4juaSYorWkv3dok0BKbMcFiCO9WnJKb3TzcbNHcDL78+/Cto/eDnGnnECVLC2
         pf4/Tr13EIZ+GCJNfc2MiCPepXfW5BY6AsCZaBnsOzJ5zyEIXB6OfbBYCaomXUoeUZMh
         QgnUq9/wiBdVbiXqvOAfDg6V64+mmadmG5VMBXESARygzzpIcNb0tU9ywwPA7/lQe/Px
         fzdJ9UMiWO2QsRlIs5Z4nccmi/IirMe0UgitZtFgwNjbKz60YYXeajgHj3ysIctxDIQ5
         nq0M8Ac9CpxDPFU7mQsIuQ7lIxEq3aiNO0atdyMznaswg/VncXIo77yL04qhPSgVJA25
         XPaw==
X-Gm-Message-State: AOJu0YyGZpvIWv3FM5C5Iu7rKMuqjIXEyvmlb27Kx/N9Tc1H5xDHrivS
	OmVp3z4kJE+ulZytSY9CLeng35DoIm3obyEQDrK8pbjV1CxbELAbRI/a6B9U+Qdx6xD0oKdB09v
	p
X-Google-Smtp-Source: AGHT+IGOqPZ9IUB50huyh3nkNbp/xTL91tnxC3wSx581A/j50amvanN/BPD2ZnBnSxzG0eo+7AZi9A==
X-Received: by 2002:a05:6402:5215:b0:5aa:2a06:d325 with SMTP id 4fb4d7f45d1cf-5c0791d10d0mr1280006a12.7.1724331927802;
        Thu, 22 Aug 2024 06:05:27 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v7 1/3] x86/ucode: refactor xen-ucode to utilize getopt
Date: Thu, 22 Aug 2024 14:04:24 +0100
Message-ID: <20240822130426.492931-2-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240822130426.492931-1-fouad.hilly@cloud.com>
References: <20240822130426.492931-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use getopt_long() to handle command line arguments.
Introduce ext_err for common errors exit.
Introducing usage() to handle usage\help messages in a common block.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
[v7]
1- Fix Usage message format.
2- Remove generic error message from ext_err and add specific error messages for "unknown option" and missing "microcode file".
3- Update "microcode file" -> "microcode-file" to remove ambiguity.
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
 tools/misc/xen-ucode.c | 54 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index 390969db3d1c..bfc1e74dd5cc 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -11,6 +11,7 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <xenctrl.h>
+#include <getopt.h>
 
 static xc_interface *xch;
 
@@ -71,12 +72,30 @@ static void show_curr_cpu(FILE *f)
     }
 }
 
+static void usage(FILE *stream, const char *name)
+{
+    fprintf(stream,
+            "%s: Xen microcode updating tool\n"
+            "Usage: %s [options | microcode-file]\n"
+            "options:\n"
+            "  -h, --help               display this help\n"
+            "  -s, --show-cpu-info      show CPU information\n",
+            name, name);
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
@@ -86,22 +105,37 @@ int main(int argc, char *argv[])
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
+            fprintf(stderr, "%s: unknown option\n", argv[0]);
+            goto ext_err;
+        }
     }
 
-    if ( !strcmp(argv[1], "show-cpu-info") )
+    if ( optind == argc ) {
+        fprintf(stderr, "%s: missing microcode file\n", argv[0]);
+        goto ext_err;
+    }
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
@@ -146,4 +180,8 @@ int main(int argc, char *argv[])
     close(fd);
 
     return 0;
+
+ ext_err:
+    usage(stderr, argv[0]);
+    exit(EXIT_FAILURE);
 }
-- 
2.42.0


