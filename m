Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D3F8D2062
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 17:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731194.1136564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBymC-0001Fb-6F; Tue, 28 May 2024 15:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731194.1136564; Tue, 28 May 2024 15:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBymC-0001AM-0U; Tue, 28 May 2024 15:30:12 +0000
Received: by outflank-mailman (input) for mailman id 731194;
 Tue, 28 May 2024 15:30:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5inG=M7=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sBymA-00018F-P2
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 15:30:10 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2af7124b-1d07-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 17:30:09 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a62ef52e837so116111266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 08:30:09 -0700 (PDT)
Received: from fhilly.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c937444sm621673366b.61.2024.05.28.08.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 08:30:08 -0700 (PDT)
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
X-Inumbo-ID: 2af7124b-1d07-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716910209; x=1717515009; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiZixxDd1y7HmvULwDCnAUl2gq5YDTcVfKI5Yqc7A6o=;
        b=Sh7lNcJHSd6q+jXD65e0hzkl69rRH8HrJdzb2lAtbzI+AM3jMi7xoX0ZuAge387TF3
         S1c7tYqb3wCirwJNNuZnd001THXFe0dy40jCgaDen+HnqnJiIvcAW47jyyOb8rkFKuge
         mjKEdd0JF92934BaXrT7B5jkk9pXM0zBTntZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716910209; x=1717515009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiZixxDd1y7HmvULwDCnAUl2gq5YDTcVfKI5Yqc7A6o=;
        b=G0L3j1cAHsoGMQAakdms81MHhTuT7k8vlvf/grpJzX6dVveUw72r+8Nu+LTPK8Mh+b
         +1tDCBPII6jfu6RzICf8HiCsTv1TnyDjStwK/uwNop9McHazdA1iSpYHBvSu4oJDzl/c
         pACPABuu+9BNSPSMgdQoIH78Zq1Dq8Vl8H1jDY8SbxWNoNcGUnLM4J/J0QuquGNDlwCQ
         9ZXJOIONcd+PTZadx5xn2m2a87yzc1lzvQF7iv+2cXRa5o+aalfLV/FP4pq56wgVO0mt
         5p4yD7RU5URxyxkS4n2Nvh1FTpaVfvCCUluhpUU+VNYaFzOv22e3YmNHV7hsvs/yiyjA
         V/ng==
X-Gm-Message-State: AOJu0YwpQRQI1+FO5LU72mqYOn63gA82/WP3xf7bZUYFXnmpLPzxFqz/
	gEpwh2YM2vPxPqziUt8hRtsbTRqOpXnI84L/JBhTPv3KRLyjG6uwyNctsmxt72VKIXgtwkYWSur
	+zP8=
X-Google-Smtp-Source: AGHT+IGrPVCUH8m9ucxJfQ8Bfo55q54C/wA4hv+O7jryDjihHoTJ4VxJksixq/14le3M65dEFfPECg==
X-Received: by 2002:a17:906:1945:b0:a59:b807:330a with SMTP id a640c23a62f3a-a62641cf941mr896251366b.32.1716910208980;
        Tue, 28 May 2024 08:30:08 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v4 2/4] x86/ucode: refactor xen-ucode to utilize getopt
Date: Tue, 28 May 2024 16:29:41 +0100
Message-ID: <20240528152943.3915760-3-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240528152943.3915760-1-fouad.hilly@cloud.com>
References: <20240528152943.3915760-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use getopt_long() to handle command line arguments.
Introduce ext_err for common exit with errors.
xc_microcode_update() refactored to accept flags and utilize xenpf_microcode_update2
Introducing usage() to handle usage\help messages in a common block.
show_curr_cpu is printed to stdout only.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
[v4]
1- Merge three patches into one.
2- usage() to print messages to the correct stream.
3- Update commit message and description.
---
 tools/misc/xen-ucode.c | 51 ++++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index 390969db3d1c..6f9dd2a7e431 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -11,12 +11,23 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <xenctrl.h>
+#include <getopt.h>
 
 static xc_interface *xch;
 
 static const char intel_id[] = "GenuineIntel";
 static const char   amd_id[] = "AuthenticAMD";
 
+static void usage(FILE *stream, const char *name)
+{
+    fprintf(stream, "%s: Xen microcode updating tool\n"
+           "Usage: %s [microcode file] [options]\n"
+           "options:\n"
+           "  -h, --help            display this help and exit\n"
+           "  -s, --show-cpu-info   show CPU information and exit\n",
+           name, name);
+}
+
 static void show_curr_cpu(FILE *f)
 {
     int ret;
@@ -77,6 +88,13 @@ int main(int argc, char *argv[])
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
@@ -86,22 +104,25 @@ int main(int argc, char *argv[])
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
@@ -146,4 +167,10 @@ int main(int argc, char *argv[])
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


