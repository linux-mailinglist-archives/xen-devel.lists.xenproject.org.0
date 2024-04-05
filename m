Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086EA899C7C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 14:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701229.1095534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiQ0-0008E6-Fk; Fri, 05 Apr 2024 12:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701229.1095534; Fri, 05 Apr 2024 12:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiQ0-0008Ae-6h; Fri, 05 Apr 2024 12:11:40 +0000
Received: by outflank-mailman (input) for mailman id 701229;
 Fri, 05 Apr 2024 12:11:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Im47=LK=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rsiPy-0007Qe-P3
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 12:11:38 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6cef36e-f345-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 14:11:37 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56bdf81706aso2867844a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 05:11:37 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j13-20020a50ed0d000000b0056c4372c161sm729425eds.55.2024.04.05.05.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 05:11:35 -0700 (PDT)
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
X-Inumbo-ID: a6cef36e-f345-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712319096; x=1712923896; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PP1USpYqG/PprBDB64mV8RCygjZ51CvebJOr4kcXLM=;
        b=U/PXqdVCR3NSniSQ96Lya04nSMUj9kiSpvl37ZJpM5n0NAB56zHHELzGK5ipsVZB3/
         xcmMdJrwUAddA3SKIh8UnWhgryS6AvfgUT5E4RqZFrqUkxfiAZXFU3ks+VIoK2mgr+CT
         zaVfD6KBHEuEVGLVGHyofvj1uIJswIEN0ovQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319096; x=1712923896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PP1USpYqG/PprBDB64mV8RCygjZ51CvebJOr4kcXLM=;
        b=T2vM+Kup9eD1kMxdDT/BB6w10Hz3TNJDLh+a4SpC9hNIGUZxhUxhBM3nPZro3JrKWG
         zUsdnR5w1xfWEdg226RUAZbHAzZTdzSxacZ35PJF8P6lyduJPBBbztY14fYKWwLDvtAH
         3V3Qn0JI/Vv8qaDnahDmgrS1Sw6xJXOLpHLAuDkUrqnTnLhEFUdwvVe4nxMJSOPC/rkC
         L/XcehlyIpOWxV3r2my18gNJG8WG5F7qt1hFRzXlBodGqr2EuClVB6qKIAgYBTsbe0cr
         BdpHcYZkJRcMDFZiTCFDTui7gT/h1dXtk/KcwZos+NktMb3k2z5OHjGfJ9BizcIbL0Yw
         NimQ==
X-Gm-Message-State: AOJu0Yxk8m7OP9M+AskROAwXNmEGpwdyFDEaEEJv2W0L2RYZCPhk5/SB
	zNzr1sajYgwg8RV4g3aQl+D+mWHYC4GS6ywdRI2W9wXKVDKBiaj4jUdTyiRO5Eff4wGGhJFNOB7
	r
X-Google-Smtp-Source: AGHT+IEljdvdDVrTJlsqguZfEB3Zp2MkU3GJwFXBzjkddzQxgdL8Ra9lhNxjuKMEbgxFaTorvUbnJQ==
X-Received: by 2002:a50:cc95:0:b0:56c:2ef7:f3e6 with SMTP id q21-20020a50cc95000000b0056c2ef7f3e6mr1090981edi.0.1712319096016;
        Fri, 05 Apr 2024 05:11:36 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 4/5] x86: Use getopt to handle command line args
Date: Fri,  5 Apr 2024 13:11:27 +0100
Message-ID: <20240405121128.260493-5-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240405121128.260493-1-fouad.hilly@cloud.com>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use getopt_long() to handle command line arguments.
Introduce ext_err for common exit with errors.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
 tools/misc/xen-ucode.c | 49 +++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index 1edcebfb9f9c..9bde991c5df5 100644
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
-            "Usage: %s [<microcode file> | show-cpu-info]\n"
+            "Usage: %s [<microcode file> | --show-cpu-info]\n"
+            "\n"
+            "  -h, --help            display this help and exit\n"
+            "  -s, --show-cpu-info   show CPU information and exit\n"
             "\n"
             , name, name);
 }
@@ -82,9 +86,16 @@ static void show_curr_cpu(FILE *f)
 int main(int argc, char *argv[])
 {
     int fd, ret;
-    char *filename, *buf;
+    char *filename = NULL, *buf;
     size_t len;
     struct stat st;
+    int opt;
+
+    const static struct option options[] = {
+        {"help", no_argument, NULL, 'h'},
+        {"show-cpu-info", no_argument, NULL, 's'},
+        {NULL, no_argument, NULL, 0}
+    };
 
     xch = xc_interface_open(NULL, NULL, 0);
     if ( xch == NULL )
@@ -94,20 +105,33 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    if ( argc < 2 )
+    if ( argc != 2 )
+        goto ext_err;
+
+    while ( (opt = getopt_long(argc, argv, "hs:", options, NULL)) != -1 )
     {
-        usage(argv[0]);
-        show_curr_cpu(stderr);
-        exit(2);
+        switch (opt)
+        {
+            case 'h':
+                usage(argv[0]);
+                exit(EXIT_SUCCESS);
+            case 's':
+                if ( argc > 2 )
+                    goto ext_err;
+                show_curr_cpu(stdout);
+                exit(EXIT_SUCCESS);
+            default:
+                goto ext_err;
+        }
     }
 
-    if ( !strcmp(argv[1], "show-cpu-info") )
+    filename = argv[1];
+    if ( filename == NULL )
     {
-        show_curr_cpu(stdout);
-        return 0;
+        printf("File name error\n");
+        goto ext_err;
     }
 
-    filename = argv[1];
     fd = open(filename, O_RDONLY);
     if ( fd < 0 )
     {
@@ -149,4 +173,9 @@ int main(int argc, char *argv[])
     close(fd);
 
     return 0;
+
+ext_err:
+    usage(argv[0]);
+    show_curr_cpu(stderr);
+    exit(STDERR_FILENO);
 }
-- 
2.42.0


